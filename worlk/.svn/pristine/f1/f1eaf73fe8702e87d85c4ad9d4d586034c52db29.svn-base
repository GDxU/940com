package com.vinbet.mobile.action.portal;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.service.portal.PaymentServcieImpl;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.FastPayOrderAutoCheck;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.yjpay.AES;
import com.vinbet.mobile.util.yjpay.EncryUtil;
import com.vinbet.mobile.util.yjpay.MerchantURIList;
import com.vinbet.mobile.util.yjpay.PayAPIURIList;
import com.vinbet.mobile.util.yjpay.RSA;
import com.vinbet.mobile.util.yjpay.RandomUtil;

/**
 * 手机端一键支付
 */
@IocBean(singleton = false)
@At("/fastpay")
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class FastPayAction extends CommonAction {
	private static final Logger log = LogManager.getLogger(FastPayAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	// private H2Dao dao = new H2Dao();
	@Inject
	private PaymentServcieImpl paymentServcieImpl;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private FastPayOrderAutoCheck fastPayOrderAutoCheck;

	/**
	 * 手机快捷支付
	 * 
	 * @param amt
	 * @param sysCode
	 * @param request
	 * @param session
	 * @return
	 */
	@At("/mobilepay")
	public View mobilepay(String amt, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		/*
		 * if (onlineUser.getUserStatus() ==
		 * Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) { return new
		 * ViewWrapper(new JspView("page.portal.yjpay.error"),
		 * i18n.get("msg.common.userStsFreeze")); }
		 */
		PaymentPlatform paymentPlatform = paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY);
		// 判断快捷支付是否可用
		if (null == paymentPlatform) {
			return new ViewWrapper(new JspView("page.portal.yjpay.error"), "抱歉，快捷支付暂停使用，请稍后重试！");
		}
		// 易宝公钥
		// String yibaoPublicKey =
		// propertiesLoader.getTrim("payapi.paytest_yibao_publickey");
		String yibaoPublicKey = paymentPlatform.getPasswd3();
		// 商户私钥
		// String merchantPrivateKey =
		// propertiesLoader.getTrim("payapi.paytest_merchant_privatekey");
		String merchantPrivateKey = paymentPlatform.getPasswd2();
		// 商户自己随机生成的AESkey
		String merchantAesKey = RandomUtil.getRandom(16);
		// 商户编号
		// String merchantaccount =
		// propertiesLoader.getTrim("payapi.paytest_merchantaccount");
		String merchantaccount = paymentPlatform.getAccountNumber();
		// 从配置文件读取移动终端wap接口URL前缀
		// String urlPrefix =
		// propertiesLoader.getTrim("payapi.paymobile_urlprefix");
		String urlPrefix = paymentPlatform.getDepositUrl();

		String orderid = null;
		String response = null;
		try {
			// 获取财务员
			// Financer financer =
			// userServcieImpl.getFinancer(Constants.PAYMENT_METHOD_INTERMEDIARY,
			// Constants.PAYMENTPLAT_FASTPAY);
			// if (financer == null) {
			// return new ViewWrapper(new JspView("page.portal.yjpay.error"),
			// i18n.get("msg.portal.noOnlineFinancer"));
			// }
			if (null == amt || Math.floor(Double.parseDouble(amt)) != Double.parseDouble(amt)) {// 判断金额是否是整数
				return new ViewWrapper(new JspView("page.portal.yjpay.error"), i18n.get("msg.portal.transferAmtNumber"));
			}
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			req.put("t", Constants.DEPOSIT_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
			rec.put("uid", onlineUser.getUserId());// 用户ID
			rec.put("nm", onlineUser.getTrueName());// 真实姓名
			rec.put("blsur", Constants.DEPOSIT_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
			rec.put("bltyp", Constants.BALANCE_TYPE_PAYMENTPLAT);// 存款类型,1-本地银行转账,2-支付平台,3-易支付
			rec.put("paywy", Constants.PAYMENT_METHOD_ONLINPAY);// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他
			rec.put("mnt", onlineUser.getCurrencyName());// 币种
			rec.put("mny", String.valueOf(amt));// 存取款金额
			rec.put("st", Constants.DRAWAL_APPLY_STATUS_PAYING);// 5、支付中
			// rec.put("trsu", financer.getId());// 财务员ID
			// rec.put("trsunm", financer.getName());// 财务员账户名
			rec.put("cmpbnk", paymentPlatform.getPaymentPlatId());// 存入公司的银行或机构ID
			rec.put("bnkacc", paymentPlatform.getPaymentPlatAccId());// 存入公司的银行或机构帐号ID
			rec.put("trmnl", DepositDrawTerminal.H5.getVal());//存提款来源手机H5
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx("cashUserInOutMoney", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					orderid = root.element("rec").attributeValue("strnm");
				} else if ("5002003".equals(resultCode)) {
					return new ViewWrapper(new JspView("page.portal.yjpay.error"), i18n.get("msg.portal.depositProcessed"));
				} else if ("5002005".equals(resultCode)) {// 5002005
															// 存提款申请没有在指定规则内（存款时间间隔）
					return new ViewWrapper(new JspView("page.portal.yjpay.error"), "存款申请过于频繁，请稍后再试！");
				} else {
					log.error("快捷支付生产订单失败,用户中心返回错误码  << " + resultCode);
					return new ViewWrapper(new JspView("page.portal.yjpay.error"), "快捷支付存款异常！");
				}
			}
		} catch (Exception e) {
			log.error("快捷支付调用用户中心生产订单失败.", e);
		}
		if (orderid == null) {
			return new ViewWrapper(new JspView("page.portal.yjpay.error"), "抱歉，生产订单失败，请联系客服！");
		}
		try {
			TreeMap<String, Object> map = new TreeMap<String, Object>();
			map.put("merchantaccount", merchantaccount);
			map.put("orderid", orderid);
			map.put("transtime", (int) (System.currentTimeMillis() / 1000));// 交易发生时间，时间戳，例如：1361324896，精确到秒
			map.put("amount", Integer.parseInt(amt) * 100);// 交易金额
			// map.put("amount", 2);// 交易金额
			// map.put("currency", 156);// 可以为空，默认值：156；表示币种为人民币
			map.put("productcatalog", "1");// 商品类别码
			String productnames[] = propertiesLoader.getTrim("payapi.merchant.productname").split(",");
			int random = (int) (Math.random() * 10);
			map.put("productname", productnames[random % productnames.length]);// 商品名称,在配置的名称中随机取一个
			map.put("identitytype", 2);// 用户标识码：2用户ID
			map.put("identityid", onlineUser.getUserId());// 用户标识
			map.put("terminaltype", 3);// 终端标识类型:0、IMEI；1、MAC；2、UUID；3、OTHER
			map.put("terminalid", "abc");// 终端标识 ID
			map.put("userip", super.getClientIp(request));// 用户 ip 地址
			map.put("owner", onlineUser.getTrueName());// 持卡人姓名
			// http://mm.cep.com:8080/mobile/fastpay/callback
			map.put("callbackurl", paymentPlatform.getUrl() + propertiesLoader.getTrim("vinbet.server.callbackurl"));
			String scheme = request.getScheme();
			String serverName = request.getServerName();// 要获取nginx的地址，不要tomcat的地址
			int port = request.getServerPort();
			map.put("fcallbackurl", scheme + "://" + serverName + ":" + port + "/mobile/user/history#historyRecord");
			// 生成RSA签名
			String sign = EncryUtil.handleRSA(map, merchantPrivateKey);
			map.put("sign", sign);
			log.info("Fastpay param >> " + JSON.toJSONString(map));
			// 生成data
			String data = AES.encryptToBase64(JSON.toJSONString(map), merchantAesKey);
			// 使用RSA算法将商户自己随机生成的AESkey加密
			String encryptkey = RSA.encrypt(merchantAesKey, yibaoPublicKey);

			String mobilePayUrl = urlPrefix + PayAPIURIList.PAYWEB_PAY.getValue();

			Map<String, Object> obj = new HashMap<String, Object>();
			obj.put("merchantaccount", merchantaccount);
			obj.put("data", data);
			obj.put("encryptkey", encryptkey);
			obj.put("mobilePayUrl", mobilePayUrl);
			// return null;
			return new ViewWrapper(new JspView("page.portal.yjpay.toMobilePay"), obj);
		} catch (Exception e) {
			log.error("mobilepay to ybpage error:", e);
			return new ViewWrapper(new JspView("page.portal.yjpay.error"), "抱歉，跳转至支付页面失败，请联系客服！");
		}
	}

	@At("/callback")
	@Ok("raw")
	@Filters
	public Object callback(String data, String encryptkey) {
		try {
			if (data == null || data.equals("") || encryptkey == null || encryptkey.equals("")) {
				log.info("快捷支付回调失败，原因：data或encryptkey参数为空.");
				return "ERROR";
			}
			PaymentPlatform paymentPlatform = paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY);
			// 判断快捷支付是否可用
			if (null == paymentPlatform) {
				log.info("快捷支付回调失败，原因：快捷支付暂停使用.");
				return "ERROR";
			}
			// 易宝分配的公钥
			// String yibaoPublicKey =
			// propertiesLoader.getTrim("payapi.paytest_yibao_publickey");
			String yibaoPublicKey = paymentPlatform.getPasswd3();
			// 商户私钥
			// String merchantPrivateKey =
			// propertiesLoader.getTrim("payapi.paytest_merchant_privatekey");
			String merchantPrivateKey = paymentPlatform.getPasswd2();
			String yeepayAESKey = RSA.decrypt(encryptkey, merchantPrivateKey);
			String decryptData = AES.decryptFromBase64(data, yeepayAESKey);
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
			if (checkSign) {
				// fastPayOrderAutoCheck.checkOrder(decryptDataMap);
				log.info("快捷支付订单收到了第三方回调,开始内部处理...");
				return "SUCCESS";
			} else {
				log.info("快捷支付回调失败，原因：回调验签失败.");
			}
		} catch (Exception e) {
			log.error("快捷支付回调失败，原因：系统异常.", e);
		}
		return "ERROR";
	}

	@At("/querySingleOrder")
	@Ok("json")
	@Filters
	public Object querySingleOrder(String orderid) {
		JsonResult jr = JsonResult.createSuccess();
		// 从配置文件读取易宝分配的公钥
		String yibaoPublicKey = propertiesLoader.getTrim("payapi.paytest_yibao_publickey");
		// 从配置文件读取商户自己的私钥
		String merchantPrivateKey = propertiesLoader.getTrim("payapi.paytest_merchant_privatekey");
		// 商户自己随机生成的AESkey
		String merchantAesKey = RandomUtil.getRandom(16);
		// 商户账户编号
		String merchantaccount = propertiesLoader.getTrim("payapi.paytest_merchantaccount");
		// 从配置文件读取移动终端wap接口URL前缀
		String urlPrefix = propertiesLoader.getTrim("payapi.merchant_urlprefix");
		try {
			TreeMap<String, Object> map = new TreeMap<String, Object>();
			map.put("merchantaccount", merchantaccount);
			map.put("orderid", orderid);// 通过后台API获取
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
			if (result.containsKey("error_code")) {// 明文返回
				jr = JsonResult.createFalied(result.getString("error"));
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
					jr = JsonResult.createFalied("验证签名失败！");
				} else {
					jr.setData(decryptDataMap);
				}
			}
		} catch (Exception e) {
			jr = JsonResult.createFalied("系统异常");
			log.error("querySingleOrder error:", e);
		}
		return jr;
	}
}
