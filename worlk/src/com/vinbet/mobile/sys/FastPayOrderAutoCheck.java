package com.vinbet.mobile.sys;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.yjpay.AES;
import com.vinbet.mobile.util.yjpay.EncryUtil;
import com.vinbet.mobile.util.yjpay.MerchantURIList;
import com.vinbet.mobile.util.yjpay.RSA;
import com.vinbet.mobile.util.yjpay.RandomUtil;

@IocBean
public class FastPayOrderAutoCheck {
	private static final Logger log = LogManager.getLogger(FastPayOrderAutoCheck.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	private ExecutorService scheduler = Executors.newFixedThreadPool(20, new ThreadFactory() {
		AtomicInteger threadNumber = new AtomicInteger(1);

		@Override
		public Thread newThread(Runnable runnable) {
			return new Thread(runnable, "FastPayOrderAutoCheck" + "-" + threadNumber.getAndIncrement());
		}
	});

	public ExecutorService getScheduler() {
		return scheduler;
	}

	public void checkOrder(Map<String, Object> data) {
		scheduler.execute(new OrderTask(data));
	}

	public class OrderTask implements Runnable {
		Map<String, Object> data;

		public OrderTask(Map<String, Object> data) {
			this.data = data;
		}

		@Override
		public void run() {
			long start = System.currentTimeMillis();
			String orderid = null;
			try {
				String money = null;// 支付金额
				String bnkacc = null;// 第三方账号id

				// 1、根据订单号获取订单信息,检验订单是否存在、金额、状态
				orderid = String.valueOf(data.get("orderid"));
				log.info("快捷支付订单[" + orderid + "]收到了第三方回调,开始内部处理...");
				Map<String, String> recMap = new HashMap<String, String>();
				recMap.put("strnm", orderid);
				//recMap.put("trmnl", DepositDrawTerminal.H5.getVal());
				recMap.put("st", Constants.DRAWAL_APPLY_STATUS_PAYING);
				String reqXml = CreateXmlUtil.createPublicReqXML(null, recMap);
				String resXml = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("inOutCashRecordQuery", reqXml);
				if (resXml != null && !resXml.equals("")) {
					Document doc = DocumentHelper.parseText(resXml);
					Element root = doc.getRootElement();
					String resultCode = root.attributeValue("st");
					if (resultCode.equals(Constants.SUCCESS)) {
						Element rec = root.element("rec");
						// String oid = rec.attributeValue("strnm");// 流水号
						// String sts = rec.attributeValue("st");// 状态
						// String cmpbnk = rec.attributeValue("cmpbnk");// 第三方id
						bnkacc = rec.attributeValue("bnkacc");// 第三方账号id
						money = rec.attributeValue("mny");// 金额
					} else {
						log.warn("从用户中心获取快捷支付订单[" + orderid + "]失败,返回报文 << " + resXml);
						return;
					}
				}

				// 2、调用第三方校验支付状态和金额
				// 从支付平台账号缓存中获取密钥,是否自动审核等信息
				PaymentPlatform platForm = AppCache.paymentPlatformAccMap.get(bnkacc);
				if (platForm == null) {
					log.info("快捷支付订单[" + orderid + "]自动审核失败,原因:找不到该订单对应的支付平台账号信息 .");
					String msg = "第三方回调审核[失败],原因:找不到该订单对应的支付平台账号信息,订单号:" + orderid;
					this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
					return;
				}
				// 易宝公钥
				// String yibaoPublicKey = propertiesLoader.getTrim("payapi.paytest_yibao_publickey");
				String yibaoPublicKey = platForm.getPasswd3();
				// 商户私钥
				// String merchantPrivateKey = propertiesLoader.getTrim("payapi.paytest_merchant_privatekey");
				String merchantPrivateKey = platForm.getPasswd2();
				// 商户自己随机生成的AESkey
				String merchantAesKey = RandomUtil.getRandom(16);
				// 商户编号
				// String merchantaccount = propertiesLoader.getTrim("payapi.paytest_merchantaccount");
				String merchantaccount = platForm.getAccountNumber();
				// 从配置文件读取移动终端wap接口URL前缀
				// String urlPrefix = propertiesLoader.getTrim("payapi.merchant_urlprefix");
				String urlPrefix = platForm.getQueryUrl();
				TreeMap<String, Object> map = new TreeMap<String, Object>();
				map.put("merchantaccount", merchantaccount);
				map.put("orderid", orderid);
				// 生成RSA签名
				String sign = EncryUtil.handleRSA(map, merchantPrivateKey);
				map.put("sign", sign);
				// 生成data
				String data = AES.encryptToBase64(JSON.toJSONString(map), merchantAesKey);
				// 使用RSA算法将商户自己随机生成的AESkey加密
				String encryptkey = RSA.encrypt(merchantAesKey, yibaoPublicKey);
				String mobilePayUrl = urlPrefix + MerchantURIList.QUERY_PAY.getValue();
				Map<String, String> params = new HashMap<String, String>();
				params.put("merchantaccount", merchantaccount);
				params.put("data", data);
				params.put("encryptkey", encryptkey);
				String respone = HttpClientUtil.doGetString(mobilePayUrl, params);
				JSONObject result = JSONObject.parseObject(respone);
				boolean flag = false;
				int actualAmt = 0;// 实到涨金额
				int status = 0;// 第三方返回的状态码
				String yborderid = "";// 易宝流水号
				if (result.containsKey("error_code")) {// 明文返回
					log.info("快捷支付订单[" + orderid + "]自动审核失败,原因:第三方返回错误码 << " + result.getString("error_code"));
					String msg = "第三方回调审核[失败],原因:第三方返回错误码(" + result.getString("error_code") + "),订单号:" + orderid;
					this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
				} else {// 密文返回
					String yeepayAESKey = RSA.decrypt(result.getString("encryptkey"), merchantPrivateKey);
					String decryptData = AES.decryptFromBase64(result.getString("data"), yeepayAESKey);
					Map<String, Object> decryptDataMap = JSON.parseObject(decryptData, new TypeReference<TreeMap<String, Object>>() {
					});
					String signFromYeepay = String.valueOf(decryptDataMap.get("sign")).trim();
					decryptDataMap.remove("sign");
					StringBuffer sbuffer = new StringBuffer();
					for (Map.Entry<String, Object> entry : decryptDataMap.entrySet()) {
						String val = "";
						Object ev = entry.getValue();
						if (null != ev) {
							val = String.valueOf(ev);
						}
						sbuffer.append(val);
					}
					boolean checkSign = RSA.checkSign(sbuffer.toString(), signFromYeepay, yibaoPublicKey);
					if (!checkSign) {
						log.info("快捷支付订单[" + orderid + "]自动审核失败,原因:调用第三方返回数据验签失败.");
						String msg = "第三方回调审核[失败],原因:验签失败";
						this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
					} else {
						status = Integer.parseInt(String.valueOf(decryptDataMap.get("status")));
						yborderid = String.valueOf(decryptDataMap.get("yborderid"));
						if (status == 1) {// 支付成功
							actualAmt = Integer.parseInt(String.valueOf(decryptDataMap.get("amount"))) / 100;
							// 比较金额是否一致
							if (Integer.parseInt(money) == actualAmt) {
								flag = true;
							} else {
								log.info("快捷支付订单[" + orderid + "]自动审核失败,原因:金额不一致,平台金额:" + money + ",第三方金额:" + actualAmt);
								String msg = "第三方回调审核[失败],原因:金额不一致,流水号:" + orderid + ",平台金额:" + money + ",第三方金额:" + actualAmt + ",第三方状态:" + status + ",第三方流水号:" + yborderid;
								this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
							}
						} else {
							log.info("快捷支付订单[" + orderid + "]自动审核失败,原因:第三方非支付完成状态[" + status + "]");
							String msg = "第三方回调审核[失败],原因:状态异常,流水号:" + orderid + ",第三方状态:" + status + ",第三方流水号:" + yborderid;
							this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
						}
					}
				}

				// 3、如果成功,修改订单状态
				if (flag) {
					boolean isautoconfirm = platForm.getIsautoconfirm().equals("1") ? true : false;
					String msg = "第三方回调审核[成功],流水号:" + orderid + ",到账金额:" + actualAmt + ",第三方状态:" + status + ",第三方流水号:" + yborderid;
					this.success(orderid, isautoconfirm ? Constants.DRAWAL_APPLY_STATUS_PASS : Constants.DRAWAL_APPLY_STATUS_APPLYING, msg);
				}
			} catch (Exception e) {
				log.error("快捷支付订单[" + orderid + "]审核失败,原因:系统异常.", e);
			}
			log.info("快捷支付订单[" + orderid + "]自动审核耗时:" + (System.currentTimeMillis() - start) + " ms");
		}

		/**
		 * 失败处理
		 * 
		 * @param orderid
		 * @param status
		 * @param msg
		 */
		private void fail(String orderid, String status, String msg) {
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			req.put("t", Constants.DEPOSIT_CHANGE_STATUS);// 操作 1、存款 2、取款 3、修改支付中的状态
			rec.put("strnm", orderid);
			rec.put("st", status);
			rec.put("optid", "3");// 操作人id 写死
			rec.put("optnm", "phoneSystem");// 操作人賬號 写死
			rec.put("thdmsg", msg);// 第三方返回消息
			//rec.put("trmnl", DepositDrawTerminal.H5.getVal());
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			cEPUserCenterIceClient.moneyManagerZreocSrvIPrx("cashUserInOutMoney", xml);
		}

		private void success(String orderid, String status, String msg) throws DocumentException {
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			req.put("t", Constants.DEPOSIT_CHANGE_STATUS);// 操作 1、存款 2、取款 3、修改支付中的状态
			rec.put("strnm", orderid);
			rec.put("st", status);
			rec.put("optid", "3");// 操作人id 写死
			rec.put("optnm", "phoneSystem");// 操作人賬號 写死
			rec.put("thdmsg", msg);// 第三方返回消息
			//rec.put("trmnl", DepositDrawTerminal.H5.getVal());
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx("cashUserInOutMoney", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					log.info("快捷支付订单[" + orderid + "]自动审核成功,修改状态成功,当前状态为:" + status);
				} else {
					log.info("快捷支付订单[" + orderid + "]自动审核成功,修改状态失败,用户中心返回 << " + response);
				}
			}
		}
	}
}
