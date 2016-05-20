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
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.WechatPayAcc;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.wechatpay.CommonUtil;
import com.vinbet.mobile.util.yjpay.AES;
import com.vinbet.mobile.util.yjpay.EncryUtil;
import com.vinbet.mobile.util.yjpay.MerchantURIList;
import com.vinbet.mobile.util.yjpay.RSA;
import com.vinbet.mobile.util.yjpay.RandomUtil;

@IocBean
public class WechatPayOrderAutoCheck {
	private static final Logger log = LogManager.getLogger(WechatPayOrderAutoCheck.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	private ExecutorService scheduler = Executors.newFixedThreadPool(20, new ThreadFactory() {
		AtomicInteger threadNumber = new AtomicInteger(1);

		@Override
		public Thread newThread(Runnable runnable) {
			return new Thread(runnable, "WechatPayOrderAutoCheck" + "-" + threadNumber.getAndIncrement());
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
			String mch_id = null;
			WechatPayAcc wechatPayAcc =null;
			Dict wechatOrg = null;
			try {
				String money = null;// 支付金额
				String bnkacc = null;// 微信账号id

				// 1、根据订单号获取订单信息,检验订单是否存在、金额、状态
				orderid = String.valueOf(data.get("out_trade_no"));
				mch_id = String.valueOf(data.get("mch_id"));
				log.info("微信支付订单[" + orderid + "]收到了微信回调,开始内部处理...");
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
						// String cmpbnk = rec.attributeValue("cmpbnk");// 微信id
						bnkacc = rec.attributeValue("bnkacc");// 微信账号id
						money = rec.attributeValue("mny");// 金额
					} else {
						log.warn("从用户中心获取微信支付订单[" + orderid + "]失败,返回报文 << " + resXml);
						return;
					}
				}

				// 2、调用微信校验支付状态和金额
				// 从微信账号账号缓存中获取密钥,是否自动审核等信息
				wechatPayAcc = AppCache.getWechatAccMap().get(mch_id);
				if (wechatPayAcc == null) {
					log.info("微信支付订单[" + orderid + "]自动审核失败,原因:找不到该订单对应的微信账号信息 .");
					String msg = "微信回调审核[失败],原因:找不到该订单对应的微信账号信息,订单号:" + orderid;
					this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
					return;
				}
				wechatOrg = AppCache.getDictListByTypeId(Constants.WECHATPAY_DAG).get(0);
				if (wechatOrg == null) {
					log.info("微信支付订单[" + orderid + "]自动审核失败,原因:找不到微信机构信息 .");
					String msg = "微信回调审核[失败],原因:找不到微信机构信息,订单号:" + orderid;
					this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
					return;
				}
				TreeMap<String, String> wechatReq = new TreeMap<String, String>();
				wechatReq.put("mch_id", wechatPayAcc.getMch_id());//商户号
				wechatReq.put("appid",wechatPayAcc.getAppid());//公众账号ID
				wechatReq.put("nonce_str", CommonUtil.createRandom(false, 32));//随机字符串
				wechatReq.put("out_trade_no", orderid);//商户订单号
				wechatReq.put("key", wechatPayAcc.getKey());//商户密钥
				String sign = CommonUtil.createSign(wechatReq);//根据密钥生成的签名
				wechatReq.put("sign", sign);//
				log.info("【手机前端调用微信API查询微信支付订单[" + orderid + "]接口请求报文为：】" + wechatReq);
				String wechatRes = CommonUtil.httpsRequest(wechatOrg.getQueryAddr(), "POST", CommonUtil.mapToXml(wechatReq)).toString();
				log.info("【手机前端调用微信API查询微信支付订单[" + orderid + "]接口返回报文为：】" + wechatRes);
				boolean flag = false;
				double actualAmt = 0;// 实到账金额
				String status = "";// 微信返回的状态码
				String wcorderid = "";// 微信流水号
				Map<String,String> wechatMap = CommonUtil.xmlToMap(wechatRes);
				//微信查询接口返回结果处理
				if(wechatMap.get("return_code").equals(Constants.WECHAT_SUCCESS)&&wechatMap.get("result_code").equals(Constants.WECHAT_SUCCESS)){
					
					status = wechatMap.get("trade_state");
					wcorderid = wechatMap.get("transaction_id");
					if (status.equals(Constants.WECHAT_SUCCESS)) {// 支付成功
						actualAmt = Integer.parseInt(String.valueOf(wechatMap.get("total_fee"))) / 100;
						// 比较金额是否一致
						if (Double.parseDouble(money) == actualAmt) {
							flag = true;
						} else {
							log.info("微信支付订单[" + orderid + "]自动审核失败,原因:金额不一致,平台金额:" + money + ",微信金额:" + actualAmt);
							String msg = "微信回调审核[失败],原因:金额不一致,流水号:" + orderid + ",平台金额:" + money + ",微信金额:" + actualAmt + ",微信状态:" + status + ",微信流水号:" + wcorderid;
							this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
						}
					} else {
						log.info("微信支付订单[" + orderid + "]自动审核失败,原因:微信非支付完成状态[" + status + "]");
						String msg = "微信回调审核[失败],原因:状态异常,流水号:" + orderid + ",微信状态:" + status + ",微信流水号:" + wcorderid;
						this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
					}
				
				}else{
					log.error("微信支付订单[" + orderid + "]自动审核失败,原因:微信返回错误码："+wechatMap.get("err_code")+"错误信息："+wechatMap.get("err_code_des"));
					String msg = "微信回调审核[失败],原因:微信返回错误码(" + wechatMap.get("err_code")+"错误信息："+wechatMap.get("err_code_des") + "),订单号:" + orderid;
					this.fail(orderid, Constants.DRAWAL_APPLY_STATUS_PAYING, msg);
				}
				// 3、如果成功,修改订单状态
				if (flag) {
					boolean isautoconfirm = wechatPayAcc.getIsAutoConfirm().equals("1") ? true : false;
					String msg = "微信回调审核[成功],流水号:" + orderid + ",到账金额:" + actualAmt + ",微信状态:" + status + ",微信流水号:" + wcorderid;
					this.success(orderid, isautoconfirm ? Constants.DRAWAL_APPLY_STATUS_PASS : Constants.DRAWAL_APPLY_STATUS_APPLYING, msg);
				}
			} catch (Exception e) {
				log.error("微信支付订单[" + orderid + "]审核失败,原因:系统异常.", e);
			}
			log.info("微信支付订单[" + orderid + "]自动审核耗时:" + (System.currentTimeMillis() - start) + " ms");
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
			rec.put("thdmsg", msg);// 微信返回消息
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
			rec.put("thdmsg", msg);// 微信返回消息
			//rec.put("trmnl", DepositDrawTerminal.H5.getVal());
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx("cashUserInOutMoney", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					log.info("微信支付订单[" + orderid + "]自动审核成功,修改状态成功,当前状态为:" + status);
				} else {
					log.info("微信支付订单[" + orderid + "]自动审核成功,修改状态失败,用户中心返回 << " + response);
				}
			}
		}
	}
}
