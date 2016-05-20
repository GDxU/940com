package com.vinbet.mobile.action.portal;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CollectionInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.EasyPayment;
import com.vinbet.mobile.entity.portal.PaymentInfo;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.service.portal.DictServiceImpl;
import com.vinbet.mobile.service.portal.PaymentServcieImpl;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.service.portal.WechatServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.WechatPayOrderAutoCheck;
import com.vinbet.mobile.sys.h2.H2Dao;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.XMLBean;
import com.vinbet.mobile.util.wechatpay.CommonUtil;
import com.vinbet.mobile.util.wechatpay.MessageUtil;
import com.vinbet.mobile.util.yjpay.AES;
import com.vinbet.mobile.util.yjpay.RSA;

/**
 * 存款操作
 */
@IocBean(singleton = false)
@At("/user/payment")
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class PaymentAction extends CommonAction {
	private static final Logger log = LogManager.getLogger(PaymentAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private DictServiceImpl dictServiceImpl;
	@Inject
	private PaymentServcieImpl paymentServcieImpl;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private WechatServcieImpl wechatServcieImpl;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;
	@Inject
	private WechatPayOrderAutoCheck wechatPayOrderAutoCheck;

	/**
	 * TO存款頁面
	 * 
	 * @return
	 */
	@At("/")
	@Ok("jsp:page.portal.payment")
	public Object payment(HttpServletRequest request, HttpSession session) {
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, Object> obj = new HashMap<String, Object>();
		// obj.put("banks", i18n.get("dict.bank_" +
		// onlineUser.getCurrencyType()));
		// obj.put("citys", i18n.get("dict.city_" +
		// onlineUser.getCurrencyType()));
		obj.put("ids", onlineUser.getAccessibleApps());
		// obj.put("limit", getMinDepositAmt(propertiesLoader,
		// onlineUser.getCurrencyType()));
		obj.put("limit", AppCache.getCurrencyMap().get(onlineUser.getCurrencyName()).getMinimumDeposit());
		obj.put("aliPayMax", AppCache.getSystemParm(Constants.ALIPAY_MAX_SAVE_AMT));
		obj.put("wechatPayMax", AppCache.getSystemParm(Constants.WECHATPAY_MAX_SAVE_AMT));
		obj.put("currency", onlineUser.getCurrencyName());
		// obj.put("canComnDeposit",
		// propertiesLoader.getInt("vinbet.deposit.currency_" +
		// onlineUser.getCurrencyType(), 0));
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		if (userInfo != null) {
			obj.put("user", userInfo);
		}
		boolean thirdPay = false;
		dictServiceImpl.SyncEasyPayData();
		List<Dict> dictOrg = AppCache.getDictListByTypeId(Constants.EASY_PAY_ORG_DAG);
		if (dictOrg != null) {
			if (dictOrg.size() > 0) {
				// 系统配置有第三方支付方式的易支付，页面中的第三方支付机构才可以点击。
				obj.put("dictOrg", JSONArray.toJSONString(dictOrg));
				thirdPay = true;
			} else {
				obj.put("dictOrg", "nodata");
			}
		}
		List<Dict> dictHbBank = AppCache.getI18nDictListByType(Constants.EASY_PAY_BANK_DAG);
		obj.put("dictHbBank", JSONArray.toJSONString(dictHbBank));
		List<Dict> dictUserBank = AppCache.getI18nDictListByType(Constants.BANKNAME_DAG);
		obj.put("dictUserBank", JSONArray.toJSONString(dictUserBank));
		obj.put("thirdPay", thirdPay);
		obj.put("paytype_fastpay_status", null == paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY) ? false : true);
		Map<String, BankCard> localBankMap = AppCache.getLocalBankMap();
		obj.put("localBankMap", JSONArray.toJSONString(localBankMap));
		obj.put("isCNYuser", userInfo.getCurrencyName().equals("CNY") ? "1" : "2");
		obj.put("localBankShow", checkLocalBankShow(userInfo));
		List<Dict> alipayList = AppCache.getI18nDictListByType(Constants.ALIPAY_DAG);
		if(alipayList==null||alipayList.size()==0){
			obj.put("isShowAlipay",false);
		}else{
			obj.put("isShowAlipay",true);
		}
		List<Dict> wechatpayList = AppCache.getI18nDictListByType(Constants.WECHATPAY_DAG);
		if(wechatpayList==null||wechatpayList.size()==0){
			obj.put("isShowWechatpay",false);
		}else{
			obj.put("isShowWechatpay",true);
		}
		return obj;
	}

	private boolean checkLocalBankShow(UserInfo userInfo) {
		if (userInfo.getCurrencyName().equals("THB") || "1".equals(AppCache.userLocalBankShow.get(userInfo.getAccoutName()))) {
			return true;
		}
		try {
			int showValue = Integer.parseInt(AppCache.getSystemParm(Constants.LOCAL_BANK_TRANS_VISIABLE_VALUE));
			Document outDoc = DocumentHelper.createDocument();
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("t", Constants.CHECK_INFO_DEPOSIT_TIMES);
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("unm", userInfo.getAccoutName());
			recElm.addAttribute("utyp", userInfo.getUserType() + "");
			recElm.addAttribute("uid", userInfo.getUserId());
			recElm.addAttribute("cnftm", showValue + "");
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("checkInfo", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
					log.error("调用[platform]手机服务端[checkInfo]请求报文：" + xml + "接口返回数据:" + response);
				} else {
					List<Element> childNodes = root.elements();
					int num = 0;
					for (int i = 0; i < childNodes.size(); i++) {
						Element reqElm = childNodes.get(i);
						num = Integer.parseInt(reqElm.attributeValue("intm"));
					}
					if (num < showValue) {
						return false;
					} else {
						AppCache.userLocalBankShow.put(userInfo.getAccoutName(), "1");
					}
				}
			} else {
				log.error("调用[platform]手机服务端[checkInfo]请求报文：" + xml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[checkInfo]请求异常：" + e);
			return false;
		}
		return true;
	}

	private int getMinDepositAmt(PropertiesLoader propertiesLoader, int currency) {
		int defaultAmt = 100;
		try {
			String limitStr = propertiesLoader.getTrim("vinbet.deposit.limit");
			String limit[] = limitStr.split(";");
			for (String entry : limit) {
				String e[] = entry.split(":");
				if (Integer.parseInt(e[0]) == currency) {
					defaultAmt = Integer.parseInt(e[1]);
					break;
				}
			}
		} catch (Exception e) {
			log.error("获取币种[" + currency + "]的支付限额异常.", e);
		}
		return defaultAmt;
	}

	@At("/getCard")
	@Ok("json")
	public Object getCard(String orderId) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			CollectionInfo info = AppCache.collecitonInfos.get(orderId);
			if (info != null) {
				Map<String, Object> cardInfo = new HashMap<String, Object>();
				cardInfo.put("bankName", info.getOrgName());
				cardInfo.put("branchName", info.getBranchName());
				cardInfo.put("cardholder", info.getNameOnCard());
				cardInfo.put("cardNo", info.getCardNo());
				jsonResult.setData(cardInfo);
			} else {
				jsonResult = JsonResult.createFalied();
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
		}
		return jsonResult;
	}

	@At("/getPayAmt")
	@Ok("json")
	public Object getPayAmt(int orginAmt, HttpSession session) throws Exception {
		// 获取随机金额尾数。
		Double randomMoney = this.paymentServcieImpl.getRandomEasyPayMoney();
		JSONObject jo = new JSONObject();
		jo.put("amt", randomMoney);
		return jo;
	}

	/**
	 * 存款-易支付
	 * 
	 * @return
	 */
	@At("/first")
	@Ok("json")
	public Object first(@Param("..") PaymentInfo paymentInfo, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			/*
			 * if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) { return
			 * JsonResult.createFalied(i18n.get("msg.common.userStsFreeze")); }
			 */
			/*
			 * String fundPwd = paymentInfo.getFundPwd(); try { fundPwd = RSAUtil.decrypt(fundPwd); } catch (Exception e) {
			 * log.error("提款>>RSAUtil解码失败,用户名:" + onlineUser.getAccoutName() + ",密文:" + fundPwd, e); } fundPwd =
			 * PasswordEncoder.encode(onlineUser.getAccoutName(), fundPwd); // 从用户中心获取用户信息用于校验资金密码 UserInfo currentUserInfo =
			 * userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1); if (currentUserInfo != null) { if
			 * (!currentUserInfo.getFundPwd().equals(fundPwd)) { return JsonResult.createFalied(i18n.get("msg.portal.currentPwdError")); } }
			 */
			// 获取随机金额尾数。
			Double randomMoney = this.paymentServcieImpl.getRandomEasyPayMoney();
			Double userAmount = Double.valueOf(paymentInfo.getAmount());
			userAmount += randomMoney;
			// 获取随机机构帐号或银行帐号
			String userPayment = paymentInfo.getPaymentBank();
			EasyPayment easyPayMentRandom = this.paymentServcieImpl.getEasyPayment(userPayment);
			if (easyPayMentRandom == null) {
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			// 获取财务员ID
			// Financer financer =
			// userServcieImpl.getFinancer(easyPayMentRandom.getAccSpec(),
			// userPayment);
			// if (financer == null) {
			// return
			// JsonResult.createFalied(i18n.get("msg.portal.noOnlineFinancer"));
			// }
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			req.put("t", Constants.DEPOSIT_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
			rec.put("uid", onlineUser.getUserId());// 用户ID
			rec.put("nm", onlineUser.getTrueName());// 真实姓名
			rec.put("blsur", Constants.DEPOSIT_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
			rec.put("bltyp", Constants.BALANCE_TYPE_EASYPAY);// 存款类型,1-本地银行转账,2-支付平台,3-易支付
			rec.put("paywy", easyPayMentRandom.getAccSpec());// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他
			rec.put("mnt", onlineUser.getCurrencyName());// 币种
			rec.put("mny", String.valueOf(userAmount));// 存取款金额
			rec.put("st", Constants.DRAWAL_APPLY_STATUS_PAYING);// 1、申请中5、支付中，此处填5
			rec.put("udept", paymentInfo.getUserPaymentBank());// 用户存款机构
			// rec.put("trsu", financer.getId());// 财务员ID
			// rec.put("trsunm", financer.getName());// 财务员账户名
			rec.put("cmpbnk", easyPayMentRandom.getEasyPayORGId());// 存入公司的银行或机构ID
			rec.put("bnkacc", easyPayMentRandom.getEasyPayAccId());// 存入公司的银行或机构帐号ID
			rec.put("trmnl", DepositDrawTerminal.H5.getVal());// 存款来源手机端H5
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if (resultCode.equals(Constants.NO_AVAILABLE_BALANCE)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.walletNoAvailMoney"));
					} else if (resultCode.equals(Constants.DRAWAL_STATUS_APPLYING)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.norDepositProcessed"));
					} else if (resultCode.equals(Constants.NOUSER)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					} else if (resultCode.equals(Constants.DEPOSIT_NO_INRULES)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.DepositforNoInRules"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					// log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" +
					// xml + "接口返回数据:" + response);
				} else {
					String orderId = null;
					CollectionInfo depInfo = new CollectionInfo();
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						if (reqElm.attributeValue("strnm") != null && !reqElm.attributeValue("strnm").equals("")) {
							orderId = reqElm.attributeValue("strnm");
							depInfo.setDepositLogId(orderId);
						}
					}
					depInfo.setOrderTime(System.currentTimeMillis());
					depInfo.setAccsp(easyPayMentRandom.getAccSpec());
					depInfo.setOrgName(easyPayMentRandom.getEasyPayORGName());
					depInfo.setNameOnCard(easyPayMentRandom.getName());
					depInfo.setCardNo(easyPayMentRandom.getAccount());
					depInfo.setBranchName(easyPayMentRandom.getOpeningOutlets());
					depInfo.setSaveAmount(userAmount);
					depInfo.setBankName(easyPayMentRandom.getEasyPayORGName());
					depInfo.setCollectionType(0);
					AppCache.collecitonInfos.put(orderId, depInfo);
					Map<String, Object> data = new HashMap<String, Object>();
					data.put("depInfo", depInfo);
					jsonResult.setData(data);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				// log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml +
				// "接口返回数据为空");
			}
			// log.info("调用[platform]手机服务端[" + iterface + "]接口返回数据:" +
			// response);

			/*
			 * Map<String, String> parameters = new HashMap<String, String>(); parameters.put("cardType",
			 * String.valueOf(paymentInfo.getPaymentType())); parameters.put("bankName", paymentInfo.getPaymentBank()); parameters.put("province",
			 * paymentInfo.getProvince()); parameters.put("city", paymentInfo.getCity()); parameters.put("branchDetail", paymentInfo.getBranches());
			 * String userName = onlineUser.getAccoutName(); parameters.put("userName", userName); paymentInfo.setUserName(userName);
			 * parameters.put("trueName", paymentInfo.getDepositor()); parameters.put("saveAmount", String.valueOf(paymentInfo.getAmount())); String
			 * plainPwd = RSAUtil.decrypt(paymentInfo.getLoginpwd().trim()); parameters.put("password", MD5Util.sha256(MD5Util.md5Hex(MD5Util.md5Hex
			 * (plainPwd).toUpperCase()).toUpperCase()));// 和平台加密方式保持一致 parameters.put("uuid", UUID.randomUUID().toString()); String ts =
			 * String.valueOf(new Date().getTime()); parameters.put("ts", ts); parameters.put("valideTime",
			 * propertiesLoader.getTrim("vinbet.platform.valideTime")); parameters.put("sipsession",
			 * MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts)); String url = new
			 * StringBuilder(propertiesLoader.getTrim("vinbet.platform.url" )).append("/").append(api).toString(); String response =
			 * HttpClientUtil.doGetString(url, parameters); jsonObject = JSON.parseObject(response); if (jsonObject != null) { int resultCode =
			 * jsonObject.getIntValue("code"); // String desc = jsonObject.getString("description"); if (resultCode == 10000) {// 成功 CollectionInfo
			 * collectionInfo = JSON.parseObject(response, CollectionInfo.class); onlineUser.setCollectionInfo(collectionInfo);
			 * paymentInfo.setPaytime(DateUtil.getDateTime(new Date())); paymentInfo.setUserIp(super.getClientIp(request)); new
			 * H2Dao().insert(paymentInfo); } }
			 */
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 存款-传统支付
	 * 
	 * @return
	 */
	@At("/tradition")
	@Ok("json")
	public Object tradition(@Param("..") PaymentInfo paymentInfo, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			/*
			 * if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) { return
			 * JsonResult.createFalied(i18n.get("msg.common.userStsFreeze")); }
			 */
			// 获取财务员ID
			/*
			 * Financer financer = userServcieImpl.getFinancer(Constants.WITHDRAWAL_WAY_BANK, paymentInfo.getUserPaymentBank()); if (financer == null)
			 * { return JsonResult.createFalied(i18n.get("msg.portal.noOnlineFinancer")); }
			 */
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			req.put("t", Constants.DEPOSIT_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
			rec.put("uid", onlineUser.getUserId());// 用户ID
			rec.put("nm", onlineUser.getTrueName());// 真实姓名
			rec.put("blsur", Constants.DEPOSIT_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
			rec.put("bltyp", Constants.BALANCE_TYPE_LOCAL);// 存款类型,1-本地银行转账,2-支付平台,3-易支付
			rec.put("paywy", paymentInfo.getPaymentType());// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他
			rec.put("mnt", onlineUser.getCurrencyName());// 币种
			Double amt = paymentInfo.getAmount();
			if (null == amt || Math.floor(amt) != amt) {// 判断金额是否是整数
				jsonResult = JsonResult.createFalied(i18n.get("msg.portal.transferAmtNumber"));
				return jsonResult;
			}
			rec.put("mny", String.valueOf(amt));// 存取款金额
			rec.put("st", Constants.DRAWAL_APPLY_STATUS_APPLYING);// 1、申请中5、支付中，此处填1
			// rec.put("trsu", financer.getId());// 财务员ID
			// rec.put("trsunm", financer.getName());// 财务员账户名
			String bankId = paymentInfo.getPaymentBank();
			// 检测银行帐号是否存在
			if (!AppCache.getLocalBankMap().containsKey(bankId)) {
				log.warn("bankid " + bankId + " not exist in local bank map");
				jsonResult = JsonResult.createFalied("抱歉，该收款银行已经暂停使用，请更换其它银行再次存款！");
				return jsonResult;
			}
			rec.put("cmpbnk", bankId);// 存入公司的银行或机构ID
			rec.put("bnkacc", bankId);// 存入公司的银行或机构帐号ID
			rec.put("svacc", paymentInfo.getDepositor());// 用户存款帐号名
			rec.put("udept", paymentInfo.getUserPaymentBank());// 用户存款机构
			rec.put("prv", paymentInfo.getProvince());// 存款账户开户省
			rec.put("cty", paymentInfo.getCity());// 存款账户开户市
			rec.put("utlts", paymentInfo.getBranches());// 存款账户开户行网点
			String depositTime = paymentInfo.getPaydate() + " " + paymentInfo.getPaytime() + ":00";
			// rec.put("svtm", String.valueOf(DateUtil.parseDate(depositTime,
			// "yyyy-MM-dd HH:mm").getTime()));// 用户存款时间
			rec.put("svtm", depositTime);// 用户存款时间
			rec.put("trmnl", DepositDrawTerminal.H5.getVal());// 存款来源0手机端h5
			rec.put("unote", paymentInfo.getRemark());// 备注
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if (resultCode.equals(Constants.NO_AVAILABLE_BALANCE)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.walletNoAvailMoney"));
					} else if (resultCode.equals(Constants.DRAWAL_STATUS_APPLYING)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.norDepositProcessed"));
					} else if (resultCode.equals(Constants.NOUSER)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					} else if (resultCode.equals(Constants.DEPOSIT_NO_INRULES)) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.DepositforNoInRules"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
				} else {
					String orderId = null;
					CollectionInfo depInfo = new CollectionInfo();
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						if (reqElm.attributeValue("strnm") != null && !reqElm.attributeValue("strnm").equals("")) {
							orderId = reqElm.attributeValue("strnm");
							depInfo.setDepositLogId(orderId);
						}
					}

					Map<String, BankCard> localBankMap = AppCache.getLocalBankMap();
					BankCard bankCard = localBankMap.get(paymentInfo.getPaymentBank());
					depInfo.setOrderTime(System.currentTimeMillis());
					depInfo.setOrgName(bankCard.getBankName());
					depInfo.setNameOnCard(bankCard.getName());
					depInfo.setCardNo(bankCard.getCardNumber());
					depInfo.setSaveAmount(paymentInfo.getAmount());
					depInfo.setBranchName(bankCard.getOpeningOutlets());
					depInfo.setCollectionType(0);
					AppCache.collecitonInfos.put(orderId, depInfo);
					
					//管理中心数据同步外包
					try {
						HashMap<String, String> mgrTbReq = new HashMap<String, String>();
						mgrTbReq.put("strnm", orderId);
						mgrTbReq.put("tbnm", "Waibao");
						mgrTbReq.put("type", "1");//type=1 本地银行, type=4 支付宝
						String mgrtbXml = CreateXmlUtil.createPublicReqXML(mgrTbReq, null);
						log.info("【手机前端调用管理中心ICE数据同步外包请求报文为：】" + mgrtbXml);
						String mgrTbResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrtbXml);
						log.info("【手机前端调用管理中心ICE数据同步外包返回报文为：】" + mgrTbResXML);
					} catch (Exception e) {
						e.printStackTrace();
					}
					// Map<String, Object> data = new HashMap<String, Object>();
					// data.put("depInfo", depInfo);
					// jsonResult.setData(data);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
			}
			log.info("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);

			/*
			 * Map<String, String> parameters = new HashMap<String, String>(); parameters.put("cardType",
			 * String.valueOf(paymentInfo.getPaymentType())); parameters.put("bankName", paymentInfo.getPaymentBank()); parameters.put("province",
			 * paymentInfo.getProvince()); parameters.put("city", paymentInfo.getCity()); parameters.put("branchDetail", paymentInfo.getBranches());
			 * String userName = onlineUser.getAccoutName(); parameters.put("userName", userName); paymentInfo.setUserName(userName);
			 * parameters.put("trueName", paymentInfo.getDepositor()); parameters.put("saveAmount", String.valueOf(paymentInfo.getAmount())); String
			 * plainPwd = RSAUtil.decrypt(paymentInfo.getLoginpwd().trim()); parameters.put("password", MD5Util.sha256(MD5Util.md5Hex(MD5Util.md5Hex
			 * (plainPwd).toUpperCase()).toUpperCase()));// 和平台加密方式保持一致 parameters.put("uuid", UUID.randomUUID().toString()); String ts =
			 * String.valueOf(new Date().getTime()); parameters.put("ts", ts); parameters.put("valideTime",
			 * propertiesLoader.getTrim("vinbet.platform.valideTime")); parameters.put("sipsession",
			 * MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts)); String url = new
			 * StringBuilder(propertiesLoader.getTrim("vinbet.platform.url" )).append("/").append(api).toString(); String response =
			 * HttpClientUtil.doGetString(url, parameters); jsonObject = JSON.parseObject(response); if (jsonObject != null) { int resultCode =
			 * jsonObject.getIntValue("code"); // String desc = jsonObject.getString("description"); if (resultCode == 10000) {// 成功 CollectionInfo
			 * collectionInfo = JSON.parseObject(response, CollectionInfo.class); onlineUser.setCollectionInfo(collectionInfo);
			 * paymentInfo.setPaytime(DateUtil.getDateTime(new Date())); paymentInfo.setUserIp(super.getClientIp(request)); new
			 * H2Dao().insert(paymentInfo); } }
			 */
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 存款-支付宝支付
	 * 
	 * @return
	 */
	@At("/thirdPay")
	@Ok("json")
	public Object thirdPay(@Param("..") Map<String, String> params, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "cashUserInOutMoney";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			HashMap<String, String> mgrReq = new HashMap<String, String>();
			mgrReq.put("amt", params.get("thirdAmount"));
			mgrReq.put("tbnm", "AlipaySubAmt");
			mgrReq.put("apaId", params.get("hbThirdPayId"));
			String mgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
			log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + mgrXml);
			String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
			log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + mgrResXML);
			Document mgrDoc = DocumentHelper.parseText(mgrResXML);
			Element mgrRoot = mgrDoc.getRootElement();
			String mgrResultCode = mgrRoot.attributeValue("st");
			if (mgrResultCode.equals(Constants.SUCCESS)) {
				HashMap<String, String> req = new HashMap<String, String>();
				HashMap<String, String> rec = new HashMap<String, String>();
				req.put("t", Constants.DEPOSIT_APPLY);// 操作 1、存款 2、取款 3、修改支付中的状态
				rec.put("uid", onlineUser.getUserId());// 用户ID
				rec.put("nm", onlineUser.getTrueName());// 真实姓名
				rec.put("blsur", Constants.DEPOSIT_FROM_WAY);// 存提款来源,1-用户存款、2-公司修改(存款)、3-公司存入(客服代存)、4-公司提款(客服代提)、5-用户提款、6-公司修改(提款)
				rec.put("bltyp", Constants.BALANCE_TYPE_ALIPAY);// 存款类型,1-本地银行转账,2-支付平台,3-易支付,4-支付宝
				rec.put("paywy", "10");// 支付方式,1-网银转账、2-跨行转账、3-ATM柜员机、4-银行柜台、5-手机银行、6-中介机构、7-银行机构、8-在线存款、9-其他、10-支付宝
				rec.put("mnt", onlineUser.getCurrencyName());// 币种
				rec.put("mny", params.get("thirdAmount"));// 存取款金额
				rec.put("st", Constants.DRAWAL_APPLY_STATUS_APPLYING);// 1、申请中5、支付中，此处填1
				// rec.put("trsu", financer.getId());// 财务员ID
				// rec.put("trsunm", financer.getName());// 财务员账户名
				rec.put("cmpbnk", params.get("thirdOrg"));// 存入公司的银行或机构ID
				rec.put("bnkacc", params.get("hbThirdPayId"));// 存入公司的银行或机构帐号ID
				rec.put("svacc", params.get("thirdTrueName"));// 用户存款帐号名	
				String udept = AppCache.getDictListByTypeId(Constants.ALIPAY_DRAW_DAG).get(0).getDictCode();
				rec.put("udept", udept);// 用户存款机构
				
				String depositTime = params.get("thirdPayDate") + " " + params.get("thirdPaytime") + ":00";
				rec.put("svtm", depositTime);// 用户存款时间
				rec.put("trmnl", DepositDrawTerminal.H5.getVal());// 存款来源手机端h5
				String remark = "用户账号:" + params.get("thirdAccount") + "  用户转账交易号:" + params.get("thirdTradeNum") + "  用户备注:" + params.get("thirdRemark");
				rec.put("unote", remark);// 用户账号+用户转账交易号+用户备注
				String xml = CreateXmlUtil.createPublicReqXML(req, rec);
				String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(iterface, xml);
				if (response != null && !response.equals("")) {
					Document doc = DocumentHelper.parseText(response);
					Element root = doc.getRootElement();
					String resultCode = root.attributeValue("st");
					if (!resultCode.equals(Constants.SUCCESS)) {
						if (resultCode.equals(Constants.NO_AVAILABLE_BALANCE)) {
							jsonResult = JsonResult.createFalied(i18n.get("msg.portal.walletNoAvailMoney"));
						} else if (resultCode.equals(Constants.DRAWAL_STATUS_APPLYING)) {
							jsonResult = JsonResult.createFalied(i18n.get("msg.portal.norDepositProcessed"));
						} else if (resultCode.equals(Constants.NOUSER)) {
							jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
						} else if (resultCode.equals(Constants.DEPOSIT_NO_INRULES)) {
							jsonResult = JsonResult.createFalied(i18n.get("msg.portal.DepositforNoInRules"));
						} else {
							jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
						}
						log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
					} else {
						String orderId = null;
						CollectionInfo depInfo = new CollectionInfo();
						List<Element> childNodes = root.elements();
						if (childNodes.size() > 0) {
							Element reqElm = (Element) childNodes.get(0);
							if (reqElm.attributeValue("strnm") != null && !reqElm.attributeValue("strnm").equals("")) {
								orderId = reqElm.attributeValue("strnm");
								depInfo.setDepositLogId(orderId);
							}
						}

						Map<String, Dict> aliPayMap = AppCache.getAliPayMap();
						Dict aliPayDict = aliPayMap.get(params.get("thirdOrg"));
						depInfo.setOrderTime(System.currentTimeMillis());
						depInfo.setOrgName(aliPayDict.getDictName());
						depInfo.setNameOnCard(params.get("hbThirdTruename"));
						depInfo.setCardNo(params.get("hbThirdAccount"));
						depInfo.setSaveAmount(Double.parseDouble(params.get("thirdAmount")));
						depInfo.setCollectionType(1);
						AppCache.collecitonInfos.put(orderId, depInfo);
						
						//管理中心数据同步外包
						try {
							HashMap<String, String> mgrTbReq = new HashMap<String, String>();
							mgrTbReq.put("strnm", orderId);
							mgrTbReq.put("tbnm", "Waibao");
							mgrTbReq.put("type", "4");//type=1 本地银行, type=4 支付宝
							String mgrtbXml = CreateXmlUtil.createPublicReqXML(mgrTbReq, null);
							log.info("【手机前端调用管理中心ICE数据同步外包请求报文为：】" + mgrtbXml);
							String mgrTbResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrtbXml);
							log.info("【手机前端调用管理中心ICE数据同步外包返回报文为：】" + mgrTbResXML);
						} catch (Exception e) {
							e.printStackTrace();
						}
					
						// Map<String, Object> data = new HashMap<String,
						// Object>();
						// data.put("depInfo", depInfo);
						// jsonResult.setData(data);
					}
				} else {
					jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
				}
				log.info("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[AlipaySubAmt]请求报文：" + mgrResXML + "接口返回数据为空");
			}

		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}
	
	
	/**
	 * 存款-微信扫码支付
	 * 
	 * @return
	 */
	@At("/wechatPay")
	@Ok("json")
	public Object wechatPay(@Param("..") Map<String, String> params, HttpServletRequest request, HttpSession session) {
		params.put("trmnl", DepositDrawTerminal.H5.getVal());
		JsonResult jsonResult = wechatServcieImpl.wechatPay(params, request, session);
		return jsonResult;
	}
	
	@At("/wechatCallback")
	@Ok("raw")
	@Filters
	public Object wechatCallback(HttpServletRequest request) {
		TreeMap<String, String> wechatReq = new TreeMap<String, String>();
		try {
			TreeMap<String,String> wechatMap = MessageUtil.parseXml(request);
			//TreeMap<String,String> wechatMap = new TreeMap<String, String>();
			/*wechatMap.put("appid", "wx6daa3ab666aa34f2");
			wechatMap.put("total_fee", "10000");
			wechatMap.put("mch_id", "1317609301");
			wechatMap.put("sign", "C46F1A89CB58B7F799DF17906FDED289");
			wechatMap.put("result_code", "SUCCESS");
			wechatMap.put("return_code", "SUCCESS");
			wechatMap.put("out_trade_no", "2217");*/
			if(wechatMap.get("return_code").equals(Constants.WECHAT_SUCCESS)&&wechatMap.get("result_code").equals(Constants.WECHAT_SUCCESS)){
				String wcsign = wechatMap.get("sign");
				String mykey = AppCache.getWechatAccMap().get(wechatMap.get("mch_id")).getKey();
				wechatMap.remove("sign");
				wechatMap.put("key", mykey);
				String mysign = CommonUtil.createSign(wechatMap);//根据密钥生成的签名
				//校验签名
				if(wcsign.equals(mysign)){
					//log.info("收到微信回调，签名校验成功，开始进行内部处理....订单号："+wechatMap.get("out_trade_no"));
					Map<String,Object> mp = new HashMap<String, Object>();
					mp.put("out_trade_no", wechatMap.get("out_trade_no"));
					mp.put("mch_id", wechatMap.get("mch_id"));
					wechatPayOrderAutoCheck.checkOrder(mp);
					wechatReq.put("return_code", "SUCCESS");//NATIVE 原生二维码支付
					//wechatReq.put("return_msg", "OK");//商户订单号
				}else{
					log.error("本次签名校验失败，收到微信回调信息："+wechatMap);
					wechatReq.put("return_code", "FAIL");//NATIVE 原生二维码支付
					//wechatReq.put("return_msg", "签名校验失败");//商户订单号
				}
			}else{
				log.error("手机前端收到微信API回调通知接口异常,错误码："+wechatMap.get("err_code")+"错误信息："+wechatMap.get("err_code_des"));
				wechatReq.put("return_code", "FAIL");//NATIVE 原生二维码支付
				//wechatReq.put("return_msg", "参数格式校验错误");//商户订单号
			}
		} catch (Exception e) {
			log.error("快捷支付回调失败，原因：系统异常.", e);
			wechatReq.put("return_code", "FAIL");//NATIVE 原生二维码支付
			//wechatReq.put("return_msg", "商户系统异常");//商户订单号
		}
		return CommonUtil.mapToXml(wechatReq).toString();
	}

	@At("/getHbAliPayInfo")
	@Ok("json")
	public Object getHbAliPayInfo(String apid,String amount) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			//此处需传type
			List<Dict> dicts = AppCache.getDictListByTypeId("aliPayForDict");
			for (Dict dict : dicts) {
				if(dict.getDictCode().equals(apid)){
					apid = dict.getDictTypeName();
				}
			}
			XMLBean xmlREQ = new XMLBean("req");
			xmlREQ.addttribute("tbnm", "GetPayAccount");
			xmlREQ.addttribute("type", apid);
			xmlREQ.addttribute("amount", amount);
			String mgrXml = xmlREQ.toXML();
			log.info("【手机前端调用管理中心ICE获取支付宝账号的请求报文为：】" + mgrXml);
			String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice获取支付宝账号
			//mgrResXML = "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec apaId='6501' apId='3503' account='422454541212152' accName='张飞飞' status='1' maxDepositAmt='218998' depositAmt='0' createDate='2015-12-11 14:21:16' createBy='0' modifyDate='2015-12-11 22:17:52' payType='10' payCurrency='CNY,THB,USD'/></resp>";
			log.info("【手机前端调用管理中心ICE获取支付宝账号的额度返回报文为：】" + mgrResXML);
			Document mgrDoc = DocumentHelper.parseText(mgrResXML);
			Element mgrRoot = mgrDoc.getRootElement();
			String mgrResultCode = mgrRoot.attributeValue("st");
			if (mgrResultCode.equals(Constants.SUCCESS)) {
				List<Element> childNodes = mgrRoot.elements();
				if (childNodes.size() > 0) {
					Element reqElm = (Element) childNodes.get(0);
					Map<String, Object> aliPayInfo = new HashMap<String, Object>();
					aliPayInfo.put("aliPayName", reqElm.attributeValue("accName"));
					aliPayInfo.put("aliPayAccount", reqElm.attributeValue("account"));
					aliPayInfo.put("aliPayId", reqElm.attributeValue("apaId"));
					jsonResult.setData(aliPayInfo);
				} else {
					jsonResult = JsonResult.createFalied();
				}
			} else {
				jsonResult = JsonResult.createFalied();
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
		}
		return jsonResult;
	}

	/**
	 * 存款第二步操作
	 * 
	 * @return
	 */
	@At("/second")
	@Ok("json")
	public Object second(String ispay, HttpServletRequest request) {
		System.out.println(ispay);
		return null;
	}

	/**
	 * 存款第三步操作
	 * 
	 * @return
	 */
	@At("/third")
	@Ok("json")
	public Object third(@Param("..") Map<String, Object> map, HttpServletRequest request, HttpSession session) {
		/**
		 * Field field[] = AmountAllocation.class.getFields(); for (Field f : field) { try { //
		 * System.out.println(AmountAllocation.getCode(f.getName()) + "=" + f.getDouble(amountAllocation)); } catch (Exception e) {
		 * e.printStackTrace(); } }
		 */

		String api = "deposit-mobile!saveToApps.shtml";
		// log.info("调用[platform]手机服务端[" + api + "]接口请求数据>>" +
		// JSON.toJSONString(map));
		JSONObject jsonObject = null;
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			CollectionInfo collectionInfo = onlineUser.getCollectionInfo();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("userName", onlineUser.getAccoutName());
			parameters.put("depositLogId", collectionInfo.getDepositLogId());
			parameters.put("companyBnakCardId", collectionInfo.getCompanyCardId());
			String depositTime = String.valueOf(map.get("paydate")) + " " + String.valueOf(map.get("paytime"));
			parameters.put("tranferTime", String.valueOf(DateUtil.parseDate(depositTime, "yyyy-MM-dd HH:mm").getTime()));
			Object remark = map.get("remark");
			if (remark != null) {
				parameters.put("Remark", String.valueOf(remark));
			}
			// 组装子应用金额分配
			Iterator<Entry<String, Object>> iterator = map.entrySet().iterator();
			StringBuilder sb = new StringBuilder();
			double totalAmt = 0d;
			while (iterator.hasNext()) {
				Entry<String, Object> entry = iterator.next();
				String key = entry.getKey();
				Object value = entry.getValue();
				if (value == null || value.equals("")) {
					continue;
				}
				if (key.indexOf("ss") > -1) {
					String appInfo[] = key.split("_");
					if (appInfo.length > 1) {
						sb.append(appInfo[1]).append("-").append(value).append("*");
						totalAmt += Double.parseDouble(value.toString());
					}
				}
			}
			// 验证存款信息
			if (collectionInfo != null && collectionInfo.getSaveAmount() != totalAmt) {
				jsonObject = new JSONObject();
				jsonObject.put("code", "-1");
				jsonObject.put("description", i18n.get("msg.portal.allocationAmtEqualTo"));
				return jsonObject;
			}
			sb.deleteCharAt(sb.length() - 1);
			parameters.put("passAppsValue", sb.toString());
			parameters.put("uuid", UUID.randomUUID().toString());
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/").append(api).toString();
			String response = HttpClientUtil.doGetString(url, parameters);
			// log.info("调用[platform]手机服务端[" + api + "]接口返回数据<<" + response);
			jsonObject = JSON.parseObject(response);
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + api + "]接口处理异常.", e);
		}
		return jsonObject;
	}

	@At("/collectionInfo")
	@Ok("json")
	@Filters
	public Object collectionInfo(boolean del) {
		H2Dao dao = new H2Dao();
		List<PaymentInfo> paymentInfos = null;
		try {
			if (del == true) {
				dao.dropTable(new PaymentInfo());
				return true;
			}
			paymentInfos = dao.select(new PaymentInfo());
		} catch (Exception e) {
			log.error("collectionInfo error.", e);
		}
		return paymentInfos;
	}

	public static void main(String[] args) {
		XMLBean xmlREQ = new XMLBean("req");
		xmlREQ.addttribute("tbnm", "GetPayAccount");
		xmlREQ.addttribute("type", "4565466");
		String resXML = xmlREQ.toXML();
		System.out.println(resXML);
	}
}
