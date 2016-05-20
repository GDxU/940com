package com.vinbet.mobile.action.api;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.view.ForwardView;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ServerRedirectView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.ApiUser;
import com.vinbet.mobile.domain.HkcUser;
import com.vinbet.mobile.domain.QxcUser;
import com.vinbet.mobile.domain.SportUser;
import com.vinbet.mobile.domain.SscUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Activity;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.CollectionInfo;
import com.vinbet.mobile.entity.portal.Currency;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.Financer;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.entity.portal.MsgForActivityEnd;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.PaymentPlatform;
import com.vinbet.mobile.entity.portal.RespBeanForActivityEnd;
import com.vinbet.mobile.entity.portal.RespBeanForActivityJoin;
import com.vinbet.mobile.entity.portal.UserActivityInfo;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.service.portal.ActivityHandleServiceImpl;
import com.vinbet.mobile.service.portal.PaymentServcieImpl;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.service.portal.WechatServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.CEPMgrCenterClient;
import com.vinbet.mobile.sys.CEPPromotionCenterClient;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.ApiJsonResult;
import com.vinbet.mobile.util.ArithUtil;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckApiSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.DepositDrawTerminal;
import com.vinbet.mobile.util.Constants.RegistSrc;
import com.vinbet.mobile.util.Constants.TransferSource;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.EncryptUtil;
import com.vinbet.mobile.util.GetAppAuthUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.MailUtil;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.PhoneCodeUtil;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;
import com.vinbet.mobile.util.XMLBean;
import com.vinbet.mobile.util.XmlConverUtil;
import com.vinbet.mobile.util.wechatpay.CommonUtil;
import com.vinbet.mobile.util.yjpay.AES;
import com.vinbet.mobile.util.yjpay.EncryUtil;
import com.vinbet.mobile.util.yjpay.PayAPIURIList;
import com.vinbet.mobile.util.yjpay.RSA;
import com.vinbet.mobile.util.yjpay.RandomUtil;

/**
 * Api接口类
 * 
 * @author cjp
 * 
 */
@IocBean(singleton = false)
@At("/api")
public class ClientApiAction extends CommonAction {
	private Log log = Logs.getLog(ClientApiAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private PaymentServcieImpl paymentServcieImpl;
	@Inject
	private MailUtil mailUtil;
	@Inject
	private PhoneCodeUtil phoneCodeUtil;
	@Inject
	private ActivityHandleServiceImpl activityHandleServiceImpl;
	@Inject
	private CEPPromotionCenterClient cEPPromotionCenterClient;
	@Inject
	private CEPMgrCenterClient cEPMgrCenterClient;
	@Inject
	private WechatServcieImpl wechatServcieImpl;

	/**
	 * 注册
	 * 
	 * @param data
	 * @return
	 */
	@At("/regist")
	@Ok("json")
	public Object regist(String data, HttpServletRequest request, HttpSession session) {
		String facename = "regist";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			if (recMap.get("phnm") != null && !recMap.get("phnm").equals("") && recMap.get("arcd") != null && !recMap.get("arcd").equals("")) {
				// URLDecode会把加号丢失，这里重新加上
				if (!recMap.get("arcd").contains("+")) {
					recMap.put("arcd", "+" + recMap.get("arcd").replace(" ", ""));
				}
				boolean isPhoneUserd = this.checkPhoneExist(recMap.get("phnm"), session);
				if (!isPhoneUserd) {
					ApiJsonResult result = ApiJsonResult.createFalied("手机重复！");
					result.setSt(5001012);
					return result;
				}
			}
			if (recMap.get("eml") != null && !recMap.get("eml").equals("")) {
				boolean isEmailUserd = this.checkEmailIsUsed(recMap.get("eml"), session);
				if (!isEmailUserd) {
					ApiJsonResult result = ApiJsonResult.createFalied("邮箱重复！");
					result.setSt(5001011);
					return result;
				}
			}
			// 注册接口设置默认应用
			String appAuth = "";
			Map<String, NavigationApp> navigationAppMap = AppCache.getNavigationAppMap();
			for (Map.Entry<String, NavigationApp> entry : navigationAppMap.entrySet()) {
				if (com.vinbet.mobile.util.Constants.USERTYPE_CASH.equals(entry.getValue().getApptype())) {
					appAuth = appAuth + entry.getValue().getAppmark() + ",";
				}
			}
			if (appAuth.endsWith(",")) {
				appAuth = appAuth.substring(0, appAuth.length() - 1);
			}
			recMap.put("appauth", appAuth);// 导航菜单栏
			String ip = getClientIp(request);
			// String ip = "192.15.38.54";
			recMap.put("regip", ip);
			recMap.put("rgsrc", RegistSrc.APP.getVal());// 注册来源手机端app
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[cashUserRegister]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 登录
	 * 
	 * @param data
	 * @return
	 */
	@At("/login")
	@Ok("json")
	public Object login(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess("成功");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[login]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[login]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			String username = recMap.get("unm").trim();
			// 检测登陆密码输入错误次数，超过次数则冻结账户
			if (AppCache.userLoginPwdErrorRecord.containsKey(username)) {
				int failedCount = AppCache.userLoginPwdErrorRecord.get(username).getCount();
				int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.LOGIN_PWD_ERROR_CONUT));
				if (failedCount >= maxError) {
					AppCache.userLoginPwdErrorRecord.get(username).setFreezeTimer(System.currentTimeMillis());
					return ApiJsonResult.createFalied(i18n.get("msg.portal.loginFailMore"));
				}
			}
			String ip = getClientIp(request);
			recMap.put("lgip", ip);
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("userLogin", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					// 将用户中心返回的XML报文转为json数据返回客户端
					String str = XmlConverUtil.xmltoJson(response);
					JSONObject jsonObject = JSON.parseObject(str);
					if (jsonObject.getString("st").trim().equals("5001005")) {
						// 记录登录失败次数
						if (AppCache.userLoginPwdErrorRecord.containsKey(username)) {
							int failedCount = AppCache.userLoginPwdErrorRecord.get(username).getCount();
							FreezeCount count = AppCache.userLoginPwdErrorRecord.get(username);
							count.setCount(failedCount + 1);
							AppCache.userLoginPwdErrorRecord.put(username, count);
						} else {
							FreezeCount count = new FreezeCount();
							count.setCount(1);
							count.setFirstTimer(System.currentTimeMillis());
							AppCache.userLoginPwdErrorRecord.put(username, count);
						}
					}
					return jsonObject;
				} else {
					// 清除失敗記錄
					if (AppCache.userLoginPwdErrorRecord.containsKey(username)) {
						AppCache.userLoginPwdErrorRecord.remove(username);
					}
					String appautoStr = "";
					// 登录成功，解析XML报文
					List<Element> childNodes = root.elements();
					UserInfo userInfo = null;
					if (childNodes.size() > 0) {
						for (Element element : childNodes) {
							if (element.getName().trim().equals("rec")) {
								String utyp = element.attributeValue("utyp").trim();
								String unm = element.attributeValue("unm").trim();
								userInfo = userServcieImpl.getUserInfo(unm, Integer.parseInt(utyp));
							} else if (element.getName().trim().equals("favs")) {
								if (element.elements().size() > 0) {
									Element favele = (Element) element.elements().get(0);
									appautoStr = favele.attributeValue("fvval").trim();
								}
							}
						}
					}
					if (userInfo != null) {
						userInfo.setAppauth(appautoStr);
						String appauth = GetAppAuthUtil.getIndexApp(userInfo);
						String walletStr = GetAppAuthUtil.getWalletAutoStr(userInfo);
						Map<String, Object> usermap = new HashMap<String, Object>();
						usermap.put("eml", userInfo.getEmail() == null ? "" : userInfo.getEmail());
						usermap.put("arcd", userInfo.getInterTelCode() == null ? "" : userInfo.getInterTelCode());
						usermap.put("uid", userInfo.getUserId() == null ? "" : userInfo.getUserId());
						usermap.put("emlmrk", userInfo.getEmailStatus() == null ? "" : userInfo.getEmailStatus());
						usermap.put("sex", userInfo.getSex() == null ? "" : userInfo.getSex());
						usermap.put("lv", userInfo.getUserLv() == null ? "" : userInfo.getUserLv());
						usermap.put("mnpwd", userInfo.getFundPwd() == null ? "" : userInfo.getFundPwd());
						usermap.put("mnt", userInfo.getCurrencyName() == null ? "" : userInfo.getCurrencyName());
						usermap.put("tpagt", userInfo.getAgentId() == null ? "" : userInfo.getAgentId());
						usermap.put("regtm", userInfo.getRegistTime() == null ? "" : userInfo.getRegistTime());
						usermap.put("appauth", appauth == null ? "" : appauth);
						usermap.put("wltstr", walletStr == null ? "" : walletStr);
						usermap.put("regip", userInfo.getCreateIp() == null ? "" : userInfo.getCreateIp());
						usermap.put("utyp", String.valueOf(userInfo.getUserType()));
						usermap.put("ust", String.valueOf(userInfo.getUserStatus()));
						usermap.put("nmchg", userInfo.getIsNameChanged() == null ? "" : userInfo.getIsNameChanged());
						usermap.put("fstnm", userInfo.getGivenName() == null ? "" : userInfo.getGivenName());
						usermap.put("phnm", userInfo.getMobile() == null ? "" : userInfo.getMobile());
						usermap.put("phmrk", userInfo.getMobileStatus() == null ? "" : userInfo.getMobileStatus());
						usermap.put("bthdy", userInfo.getBirthdate() == null ? "" : userInfo.getBirthdate());
						usermap.put("lsttm", userInfo.getLastLoginTime() == null ? "" : userInfo.getLastLoginTime());
						usermap.put("ncknm", userInfo.getNickName() == null ? "" : userInfo.getNickName());
						usermap.put("unm", userInfo.getAccoutName() == null ? "" : userInfo.getAccoutName());
						usermap.put("lstip", userInfo.getLastLoginIp() == null ? "" : userInfo.getLastLoginIp());
						usermap.put("ntlty", userInfo.getCountry() == null ? "" : userInfo.getCountry());
						usermap.put("lstnm", userInfo.getSurName() == null ? "" : userInfo.getSurName());
						usermap.put("mnymrk", userInfo.getIsSetFundPwd() == null ? "" : userInfo.getIsSetFundPwd());
						usermap.put("ref", userInfo.getRef() == null ? "" : userInfo.getRef());
						usermap.put("pro", userInfo.getAddress() == null ? "" : userInfo.getAddress());
						session.setAttribute(com.vinbet.mobile.util.Constants.USER_SESSION, userInfo);
						// 检测用户是否已经在线
						HttpSession existSession = AppCache.onlineUsers.get(userInfo.getAccoutName());
						if (existSession != null && !existSession.getId().equals(session.getId())) {
							try {
								existSession.setAttribute("logout", "passive");
								HttpSession subSession = (HttpSession) existSession.getAttribute(Constants.SUB_APP_SESSION);
								try {
									subSession.invalidate();
								} catch (Exception e) {
								}
								existSession.invalidate();
							} catch (Exception e) {
							}
						}
						AppCache.onlineUsers.put(userInfo.getAccoutName(), session);
						// apiJsonResult.setRec(usermap);
						apiJsonResult.setRec(usermap);
						JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
						String rec = jsonObject.getString("rec");
						if (rec != null && !rec.equals("")) {
							rec = encryptUtil.encode(rec);
							jsonObject.put("rec", rec);
						}
						return jsonObject;
					}
				}
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[login]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 跳转到子应用
	 * 
	 * @return
	 */
	@At("/toSubApp")
	// @Filters(@By(type = AppStatusCheckFilter.class))
	public View toSubApp(String data, String unm, HttpServletRequest request, HttpSession session) {
		String facename = "toSubApp";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		if (data == null || data.equals("") || unm == null || unm.equals("")) {
			return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
		}
		String userInfo = this.getUserAgent(request, session) + "=UNM=" + unm;
		HttpSession existSession = AppCache.onlineUsers.get(unm);
		if (existSession == null) {
			log.info(userInfo + ",to sub app,user session invalid...");
			return new ServerRedirectView("/login");
		}
		existSession.setAttribute(Constants.SUB_APP_SESSION, session);// 为了方便作废子应用会话
		HashMap<String, String> reqMap;
		HashMap<String, String> recMap;
		String t = "", lg = "", time = "";
		try {
			log.info(userInfo + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) existSession.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			// 这个接口特殊处理，解密后还需再进行Base64解码
			data = BASE64Util.getFromBASE64(data);
			// 把接收到的json报文转为Map
			log.info(userInfo + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			reqMap = createMap(data, "req");
			recMap = createMap(data, "rec");
			t = reqMap.get("t");
			lg = recMap.get("lg");
			time = recMap.get("tm");
			Object lastVisit = existSession.getAttribute(Constants.APP_LAST_TO_GAME_TIME);
			if (time == null || (lastVisit != null && String.valueOf(lastVisit).equals(time))) {
				return new ServerRedirectView("/login");
			}
			existSession.setAttribute(Constants.APP_LAST_TO_GAME_TIME, time);
		} catch (Exception e1) {
			// 用户被踢后访问子应用会执行该分支，因为签名信息发生了更改（服务端缓存的是后者登录的密钥数据）
			log.error(userInfo + "调用手机端接口[" + facename + "]解析报文异常" + e1);
			// log.info(userInfo + ",to sub app,user token change...");
			AppCache.onlineUsers.remove(unm);
			return new ServerRedirectView("/login");
		}

		if (!Mvcs.getLocalizationKeySet().contains(lg)) {
			lg = Constants.DEFAULT_LANGUAGE;
		}
		Mvcs.setLocalizationKey(lg);
		int subapp = Integer.parseInt(t);// 1ssc2hkc3qxc4sport
		boolean isMaintain = false;
		if (subapp == 1) {
			isMaintain = AppsStatusUtil.getSscStatus() == false;
		} else if (subapp == 2) {
			isMaintain = AppsStatusUtil.getHkcStatus() == false;
		} else if (subapp == 4) {
			isMaintain = AppsStatusUtil.getSportStatus() == false;
		} else if (subapp == 3) {
			isMaintain = AppsStatusUtil.getQxcStatus() == false;
		}
		if (isMaintain) {
			return new JspView("/maintain");
		}
		switch (subapp) {
		case 1:
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/userInfo").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("userName", unm);
			// parameters.put("userName", "jagger");
			parameters.put("type", "0");// 0表示用户基本信息、1表示用户限额信息
			parameters.put("gameId", "SSC");// gameId参数对用户基本信息没有意义
			parameters.put(com.vinbet.mobile.util.Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
			JSONObject jsonObject = null;
			try {
				jsonObject = HttpClientUtil.doGet(url, parameters);
				if (jsonObject != null && jsonObject.size() != 0) {
					String message = jsonObject.getString("mess");
					if (message != null && message.equals("不存在当前用户！")) {
						log.info("用户[" + unm + "]登录SSC失败，原因：用户在SSC系统不存在.");
						return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问时时彩的权限，请联系上级！");
					}
					JSONObject userAccount = JSON.parseObject(jsonObject.get("UserAccount").toString());
					// 信用用户暂时不能登录
					// int userType = userAccount.getIntValue("accountType");
					// 非会员不能登录
					int userLevel = userAccount.getIntValue("usertypes");
					if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
						log.info("用户[" + unm + "]登录SSC失败，原因：用户非会员身份.");
						return new ViewWrapper(new JspView("page.tips"), "您的用户层级非会员，不能登录!");
					}
					SscUser sscUser = new SscUser();
					sscUser.setAccoutName(userAccount.getString("name"));
					sscUser.setUserName(userAccount.getString("username"));
					sscUser.setBalance(jsonObject.getDoubleValue("avacredits"));
					sscUser.setCredits(jsonObject.getDoubleValue("sscCredit"));
					sscUser.setHandype(jsonObject.getString("handTypeMap"));
					sscUser.setCht(jsonObject.getString("handTypeMap").split(",")[0]);
					sscUser.setTodayPL(jsonObject.getDoubleValue("ykMoney"));
					sscUser.setUserLevel(userLevel);
					// sscUser.setStatus(userInfo.getUserStatus());
					// userInfo.setUserType(userType);
					session.setAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION, sscUser);
				} else {
					log.error("登录时调用时时彩手机服务端[userInfo]接口返回数据为空,response << " + (null == jsonObject ? null : jsonObject.toJSONString()));
					return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
				}
			} catch (Exception e) {
				log.error("登录时调用时时彩手机服务端[userInfo]接口返回数据格式异常,response << " + (null == jsonObject ? null : jsonObject.toJSONString()), e);
				return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
			}
			// return new ServerRedirectView("/ssc/menu");
			return new ForwardView("/ssc/menu");
		case 2:
			try {
				String url1 = new StringBuilder(propertiesLoader.getTrim("vinbet.hkc.url")).append("/memberinfo").toString();
				Map<String, String> parameters1 = new HashMap<String, String>();
				parameters1.put("name", unm);
				parameters1.put(com.vinbet.mobile.util.Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.hkc")));
				JSONObject jsonObject1 = HttpClientUtil.doGet(url1, parameters1, false);
				if (jsonObject1 != null) {
					String code = jsonObject1.getString("code");
					// 失败
					if (!code.equals("10000")) {
						String desc = jsonObject1.getString("description");
						if (desc.equals("用户不存在~")) {
							log.info("用户[" + unm + "]登录[HKC]失败，原因：用户在[HKC]系统不存在.");
							return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问新香港彩的权限，请联系上级！");
						} else {
							log.error("用户登录时调用[HKC]手机服务端[memberinfo]接口返回数据异常,response << " + jsonObject1.toJSONString());
							return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
						}
					} else {// 成功
						JSONObject member = jsonObject1.getJSONObject("member");
						// int status = userInfo.getUserStatus();
						int userLevel = member.getIntValue("usertypes");// 用户级别，6：会员，7：直属会员
						if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
							log.info("用户[" + unm + "]登录[HKC]失败，原因：用户非会员身份.");
							return new ViewWrapper(new JspView("page.tips"), "您的用户层级非会员，不能登录!");
						}
						String accoutName = member.getString("name");
						String userName = member.getString("username");
						double credits = member.getDoubleValue("credits");// 信用额
						double balance = member.getDoubleValue("avacredits");// 可用额度
						// int accountType =
						// member.getIntValue("accountType");// 用户类型:1现金、0信用
						String handype = member.getString("handype");// 1,2,3,4
						HkcUser hkcUser = new HkcUser();
						hkcUser.setAccoutName(accoutName);
						hkcUser.setUserName(userName);
						hkcUser.setBalance(balance);
						hkcUser.setCredits(credits);
						hkcUser.setHandype(handype);
						hkcUser.setUserLevel(userLevel);
						// hkcUser.setStatus(status);
						// userInfo.setUserType(accountType);
						// 处理用户盘差
						if (jsonObject1.get("rateDiffs") != null) {
							Map<String, Map<String, Object>> rateDiffs = JSON.parseObject(jsonObject1.getString("rateDiffs"), new TypeReference<Map<String, Map<String, Object>>>() {
							});
							Iterator<Entry<String, Map<String, Object>>> iter = rateDiffs.entrySet().iterator();
							Map<String, Double> userRateDiffs = hkcUser.getRateDiffs();
							while (iter.hasNext()) {
								Entry<String, Map<String, Object>> entry = iter.next();
								Map<String, Object> diff = entry.getValue();
								userRateDiffs.put(String.valueOf(diff.get("gameCode")), Double.parseDouble(String.valueOf(diff.get("diffValue"))));
							}
						}
						session.setAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION, hkcUser);
					}
				} else {
					log.error("登录时调用[HKC]手机服务端[memberinfo]接口返回数据为空,response << null ");
					return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
				}
			} catch (Exception e) {
				log.error("登录时调用[HKC]手机服务端[memberinfo]接口返回数据格式异常", e);
				return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
			}
			return new ForwardView("/hkc/hkmenu");
		case 3:
			String url1 = new StringBuilder(propertiesLoader.getTrim("vinbet.qxc.url")).append("/memberinfo").toString();
			Map<String, String> parameters1 = new HashMap<String, String>();
			parameters1.put("name", unm);
			parameters1.put(com.vinbet.mobile.util.Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
			JSONObject jsonObject1 = null;
			try {
				jsonObject1 = HttpClientUtil.doGet(url1, parameters1);
				if (jsonObject1 != null && jsonObject1.size() != 0) {
					String code = jsonObject1.getString("code");
					if (!"10000".equals(code)) {
						log.info("用户[" + unm + "]登录[QXC]失败，原因：用户在七星彩系统不存在.");
						return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问七星彩的权限，请联系上级！");
					}
					JSONObject userAccount = JSON.parseObject(jsonObject1.get("member").toString());
					// 信用用户暂时不能登录
					int userType = userAccount.getIntValue("accountType");
					if (userType != 1) {
						log.info("用户[" + unm + "]登录[QXC]失败，原因：非现金用户.");
						return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问七星彩的权限，请联系上级！");
					}
					int userLevel = userAccount.getIntValue("usertypes");// 用户级别，6：会员，7：直属会员
					if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
						log.info("用户[" + unm + "]登录[QXC]失败，原因：用户非会员身份.");
						return new ViewWrapper(new JspView("page.tips"), "您的用户层级非会员，不能登录!");
					}
					QxcUser qxcUser = new QxcUser();
					qxcUser.setAccoutName(userAccount.getString("name"));
					qxcUser.setUserName(userAccount.getString("username"));
					qxcUser.setBalance(userAccount.getDoubleValue("avacredits"));
					qxcUser.setCredits(userAccount.getDoubleValue("credits"));
					// 格式为handype : "1,2"
					qxcUser.setHandype(userAccount.getString("handype"));
					session.setAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION, qxcUser);
				} else {
					log.error("登录时调用七星彩手机服务端[userInfo]接口返回数据为空,response << " + (null == jsonObject1 ? null : jsonObject1.toJSONString()));
					return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
				}
			} catch (Exception e) {
				log.error("登录时调用七星彩手机服务端[userInfo]接口返回数据格式异常,response << " + (null == jsonObject1 ? null : jsonObject1.toJSONString()), e);
				return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
			}
			// return new ServerRedirectView("/qxc/qxcmenu");
			return new ForwardView("/qxc/qxcmenu");
		case 4:
			try {
				String url2 = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.login.do").toString();
				Map<String, String> parameters2 = new HashMap<String, String>();
				parameters2.put("loginName", unm);
				parameters2.put("l", Mvcs.getLocalizationKey());
				parameters2.put(com.vinbet.mobile.util.Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
				String xmlResp = HttpClientUtil.doGetString(url2, parameters2);
				// String xmlResp = "rfrer";
				if (xmlResp != null) {
					Document doc = DocumentHelper.parseText(xmlResp);
					Element element = doc.getRootElement();
					// int loginStatus = 1;// 登录状态1：成功 0失败
					int loginStatus = Integer.parseInt(element.attributeValue("status"));
					if (loginStatus == 0) {
						log.info("用户[" + unm + "]登录[Sport]失败，原因：用户在[Sport]系统不存在.");
						return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问体育投注的权限，请联系上级！");
					} else {
						// 失败原因
						// String remark = element.attributeValue("remark");
						// 账号名称
						// String account = element.attributeValue("uaccount");
						String uid = element.attributeValue("uid");// 账号ID
						double diff = Double.parseDouble(element.attributeValue("float"));// 浮动值1
						double diff2 = Double.parseDouble(element.attributeValue("float1"));// 浮动值2
						String userName = element.attributeValue("uname");// 用户昵称
						String currency = element.attributeValue("currency");// 币种
						double balance = Double.parseDouble(element.attributeValue("money"));// 余额
						String group = element.attributeValue("group");// 群组
						SportUser sportUser = new SportUser();
						sportUser.setUserIdInSport(uid);
						sportUser.setAccoutName(unm);
						sportUser.setUserName(userName);
						sportUser.setDiff(diff);
						sportUser.setDiff2(diff2);
						sportUser.setBalance(balance);
						sportUser.setGroup(group);
						sportUser.setSessionid(element.attributeValue("sid"));
						sportUser.setCurrency(currency);
						session.setAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION, sportUser);
					}
				} else {
					log.error("登录时调用[Sport]手机服务端[/core/apiUser.login.do]接口返回数据为空,response << null ");
					return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
				}
			} catch (Exception e) {
				log.error("登录时调用[Sport]手机服务端[/core/apiUser.login.do]接口返回数据格式异常", e);
				return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
			}
			return new ForwardView("/sport");
		default:
			return new ViewWrapper(new JspView("page.tips"), "系统异常，参数错误!");
		}
	}

	/**
	 * 检测类接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/checkInfo")
	@Ok("json")
	public Object checkInfo(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "checkInfo";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 绑定电话号码
	 * 
	 * @param data
	 * @return
	 */
	@At("/bindingPhoneNum")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object bindingPhoneNum(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "bindingPhoneNum";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			if (!recMap.get("arcd").contains("+")) {
				recMap.put("arcd", "+" + recMap.get("arcd").replace(" ", ""));
			}

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 绑定邮箱
	 * 
	 * @param data
	 * @return
	 */
	@At("/bindingEmail")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object bindingEmail(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "bindingEmail";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 修改密码
	 * 
	 * @param data
	 * @return
	 */
	@At("/changePassword")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object changePassword(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "changePassword";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 设置/修改资金密码
	 * 
	 * @param data
	 * @return
	 */
	@At("/setCashPassword")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object setCashPassword(String data, HttpServletRequest request, HttpSession session) {

		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "setCashPassword";
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return ApiJsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		// 检测资金密码输入错误次数，超过次数则冻结账户
		if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
			int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
			int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
			if (failedCount >= maxError) {
				AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).setFreezeTimer(System.currentTimeMillis());
				AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				HashMap<String, String> req = new HashMap<String, String>();
				HashMap<String, String> rec = new HashMap<String, String>();
				req.put("opt", "2");// 1、新增，2、修改
				rec.put("uid", onlineUser.getUserId());// 用户ID
				rec.put("ust", "3");// 真实姓名
				rec.put("frzrs", "248");// 冻结原因 248资金密码错误
				String xml = CreateXmlUtil.createPublicReqXML(req, rec);
				String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
				onlineUser.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode());
				return ApiJsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
			}
		}
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			if (reqMap.get("t").equals("3")) {
				String fundpwd = PasswordEncoder.encode(onlineUser.getAccoutName(), recMap.get("mnpwd"));
				if (onlineUser.getFundPwd().equals(fundpwd)) {
					// 清除失敗記錄
					if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
						AppCache.userFundPwdErrorRecord.remove(onlineUser.getUserId());
					}
				} else {
					// 记录登录失败次数
					if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
						int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
						FreezeCount count = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId());
						count.setCount(failedCount + 1);
						AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
						AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					} else {
						FreezeCount count = new FreezeCount();
						count.setCount(1);
						count.setFirstTimer(System.currentTimeMillis());
						AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
						AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					}
					ApiJsonResult jsonResult = ApiJsonResult.createFalied("资金密码错误！");
					jsonResult.setSt(5001006);
					return jsonResult;
				}
			}
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);
			if (response != null && !response.equals("")) {
					Document doc = DocumentHelper.parseText(response);
					Element root = doc.getRootElement();
					String resultCode = root.attributeValue("st");
					if (resultCode.equals(Constants.SUCCESS)) {
						String pwd = "";
						if (reqMap.get("t").equals("1")||reqMap.get("t").equals("2")) {
							pwd = PasswordEncoder.encode(onlineUser.getAccoutName(), recMap.get("mnpwd"));
						} else {
							pwd = PasswordEncoder.encode(onlineUser.getAccoutName(), recMap.get("nwpwd"));
						}
						onlineUser.setFundPwd(pwd);
					}
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 添加/删除/修改银行卡信息
	 * 
	 * @param data
	 * @return
	 */
	@At("/operateBankCard")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object operateBankCard(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "operateBankCard";
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			return ApiJsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
		}
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 资金概括查询
	 * 
	 * @param data
	 * @return
	 */
	@At("/walletBalance")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object walletBalance(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "walletBalance";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
				processAct(doc, userInfo);
				response = doc.asXML();
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	private void processAct(Document dom, UserInfo userInfo) {
		try {
			// 获取参该用户参与的活动curActMap
			Set<String> zeroBlns = new HashSet<String>();
			Map<String, Map<String, Double>> curActMap = markCurActMap(dom, userInfo, zeroBlns);
			if (!curActMap.isEmpty()) {
				log.info("processAct:获取到curActMap," + curActMap.toString());
				// 调用活动中心接口
				String reqXML = makeActBak1ReqXml(curActMap, userInfo, zeroBlns);
				log.info("processAct:调用活动中心," + reqXML);
				String resXML = cEPPromotionCenterClient.promotionCenterZreocSrvIPrx("bakFace1", reqXML);
				log.info("processAct:调用活动中心结果," + resXML);
				// 构建需要修正的金额项到wcChangeMap
				Map<String, String> retMap = makeRetMap(resXML);
				Map<String, Double> wcChangeMap = makeWcChangeMap(curActMap, retMap);
				log.info("processAct:需要修正的钱包以及金额," + wcChangeMap.toString());
				// 遍历wcChangeMap修改DOM模型
				if (!wcChangeMap.isEmpty()) {
					changeCapitalDom(dom, wcChangeMap);
				}
				log.info("processAct:修正后的DOM报文," + dom.asXML());
			}
		} catch (Exception e) {
			log.error("processAct:针对用户" + userInfo.getAccoutName() + "的活动情况，修正钱包金额出现异常，用户看到的资金概况可能不准确。忽略此问题继续处理。" + e.toString());
		}

	}

	private Map<String, Map<String, Double>> markCurActMap(Document dom, UserInfo userInfo, Set<String> zeroBlns) {
		Map<String, Map<String, Double>> curActMap = new HashMap<String, Map<String, Double>>();
		Map<String, Double> wcActMap = null;
		Map<String, List<UserActivityInfo>> userActMap = null;
		Iterator<Map.Entry<String, List<UserActivityInfo>>> iterUserActMap = null;
		List<UserActivityInfo> list = null;
		List<Element> eleList = dom.getRootElement().elements();
		double acmny = 0;
		Double actAmt = null;
		double bln = 0;
		for (Element rec : eleList) {
			acmny = Double.parseDouble(rec.attributeValue("acmny"));
			if (acmny > 0) {
				bln = Double.parseDouble(rec.attributeValue("summny"));
				wcActMap = curActMap.get(rec.attributeValue("watyp"));
				if (wcActMap == null) {
					wcActMap = new HashMap<String, Double>();
					curActMap.put(rec.attributeValue("watyp"), wcActMap);
				}
				userActMap = AppCache.getGameMap().get(rec.attributeValue("watyp"));
				iterUserActMap = userActMap.entrySet().iterator();
				while (iterUserActMap.hasNext()) {
					Map.Entry<java.lang.String, java.util.List<UserActivityInfo>> entry = (Map.Entry<java.lang.String, java.util.List<UserActivityInfo>>) iterUserActMap.next();
					list = entry.getValue();
					for (UserActivityInfo userActivityInfo : list) {
						if (userInfo.getUserId().equals(userActivityInfo.getUserId()) && "1".equals(userActivityInfo.getStatus())) {
							actAmt = wcActMap.get(userActivityInfo.getActivityNo());
							if (actAmt == null) {
								actAmt = new Double(0);
								wcActMap.put(userActivityInfo.getActivityNo(), actAmt);
							}
							wcActMap.put(userActivityInfo.getActivityNo(), actAmt.doubleValue() + Double.parseDouble(userActivityInfo.getAmt()));

							if (bln < 1 && !"-1".equals(rec.attributeValue("wst"))) {
								zeroBlns.add(userActivityInfo.getActivityNo());
							}
						}
					}
				}

			}
		}
		return curActMap;
	}

	private String makeActBak1ReqXml(Map<String, Map<String, Double>> curActMap, UserInfo userInfo, Set<String> zeroBlns) {
		Document document = DocumentHelper.createDocument();
		Element reqEle = document.addElement("req");
		reqEle.addAttribute("uid", userInfo.getUserId());
		reqEle.addAttribute("uname", userInfo.getAccoutName());
		reqEle.addAttribute("bln", "0");
		reqEle.addAttribute("trsc", "0");
		reqEle.addAttribute("cny", userInfo.getCurrencyName());
		Iterator<Entry<String, Map<String, Double>>> iterActs = curActMap.entrySet().iterator();

		Map<String, Double> wcActMap = null;
		Iterator<Entry<String, Double>> iterWcActMap = null;
		Element recEle = null;
		while (iterActs.hasNext()) {
			Map.Entry<java.lang.String, java.util.Map<java.lang.String, java.lang.Double>> entry = (Map.Entry<java.lang.String, java.util.Map<java.lang.String, java.lang.Double>>) iterActs.next();
			wcActMap = entry.getValue();
			iterWcActMap = wcActMap.entrySet().iterator();
			while (iterWcActMap.hasNext()) {
				Map.Entry<java.lang.String, java.lang.Double> entry2 = (Map.Entry<java.lang.String, java.lang.Double>) iterWcActMap.next();
				recEle = reqEle.addElement("rec");
				recEle.addAttribute("actNo", entry2.getKey());
				if (zeroBlns != null) {
					if (zeroBlns.contains(entry2.getKey())) {
						recEle.addAttribute("deficit", "1");
					}
				}
			}

		}
		return document.asXML();
	}

	private Map<String, Double> makeWcChangeMap(Map<String, Map<String, Double>> curActMap, Map<String, String> retMap) {
		Map<String, Double> wcChangeMap = new HashMap<String, Double>();
		Iterator<String> itercurActMapKey = curActMap.keySet().iterator();
		Map<String, Double> wcActMap = null;
		Iterator<Entry<String, Double>> iterWcActMap = null;
		String key = null;
		double totAmt = 0;
		while (itercurActMapKey.hasNext()) {
			totAmt = 0;
			key = (String) itercurActMapKey.next();
			wcActMap = curActMap.get(key);
			iterWcActMap = wcActMap.entrySet().iterator();
			while (iterWcActMap.hasNext()) {
				Map.Entry<java.lang.String, java.lang.Double> entry = (Map.Entry<java.lang.String, java.lang.Double>) iterWcActMap.next();
				if ("0".equals(retMap.get(entry.getKey()))) {
					totAmt += entry.getValue().doubleValue();
				}
			}
			if (totAmt > 0) {
				wcChangeMap.put(key, totAmt);
			}
		}
		return wcChangeMap;
	}

	private void changeCapitalDom(Document dom, Map<String, Double> wcChangeMap) {
		Iterator<String> iterWcChangeMapKeys = wcChangeMap.keySet().iterator();
		List<Element> recList = dom.getRootElement().elements();
		double actAmt = 0;
		double outAmt = 0;
		while (iterWcChangeMapKeys.hasNext()) {
			String wcMk = (String) iterWcChangeMapKeys.next();
			for (Element rec : recList) {
				if (wcMk.equals(rec.attributeValue("watyp"))) {
					actAmt = Double.parseDouble(rec.attributeValue("acmny")) - wcChangeMap.get(wcMk);
					actAmt = actAmt < 0 ? 0 : actAmt;
					outAmt = Double.parseDouble(rec.attributeValue("summny")) - actAmt;
					outAmt = outAmt < 0 ? 0 : outAmt;

					rec.addAttribute("acmny", String.valueOf(actAmt));
					rec.addAttribute("abldrw", String.valueOf(outAmt));
					break;
				}
			}
		}
	}

	private Map<String, String> makeRetMap(String resXML) throws DocumentException {
		Map<String, String> retMap = new HashMap<String, String>();
		Document respDom = DocumentHelper.parseText(resXML);
		List<Element> list = respDom.getRootElement().elements();
		for (Element rec : list) {
			retMap.put(rec.attributeValue("actNo"), rec.attributeValue("st"));
		}
		return retMap;
	}

	/**
	 * 资金明细
	 * 
	 * @param data
	 * @return
	 */
	@At("/fundDetail")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object fundDetail(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "fundDetail";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			String opt = recMap.get("otyp");
			if (opt != null && !opt.equals("")) {
				if (opt.equals("4") || opt.equals("5") || opt.equals("6")) {
					if (recMap.get("watyp") != null) {
						recMap.remove("watyp");
					}
				}
				String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
				String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

				if (response != null && !response.equals("")) {
					// 将用户中心返回的XML报文转为json数据返回客户端
					String str = XmlConverUtil.xmltoJson(response);
					JSONObject jsonObject = JSON.parseObject(str);
					try {
						JSONArray ja = new JSONArray();
						if (jsonObject.getJSONObject("rec") != null) {
							ja.add(jsonObject.getJSONObject("rec"));
						}
						jsonObject.put("rec", ja);
					} catch (Exception e) {
					}
					String rec = jsonObject.getString("rec");
					if (rec != null && !rec.equals("")) {
						rec = encryptUtil.encode(rec);
						jsonObject.put("rec", rec);
					}
					return jsonObject;
				} else {
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else {
				// 获取所有数据需要请求两次接口
				String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
				String res1 = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);// 默认不传otyp来获取存提款余额修正数据
				recMap.remove("watyp");
				recMap.put("otyp", "4");
				xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
				String res2 = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);// 传otyp，不传钱包类型watyp来获取划账数据
				if (res1 != null && !res1.equals("") && res2 != null && !res2.equals("")) {
					List<Map<String, String>> ls = new ArrayList<Map<String, String>>();
					Document doc = DocumentHelper.parseText(res1);
					Element root = doc.getRootElement();
					String resultCode = root.attributeValue("st");
					if (resultCode.equals(Constants.SUCCESS)) {
						List<Element> childNodes = root.elements();
						if (childNodes.size() > 0) {
							for (Element reqElm : childNodes) {
								if (!reqElm.attributeValue("optp").equals("4") && !reqElm.attributeValue("optp").equals("5")) {
									Map<String, String> map = new HashMap<String, String>();
									map.put("prctm", reqElm.attributeValue("prctm"));
									map.put("ppytm", reqElm.attributeValue("ppytm"));
									map.put("optp", reqElm.attributeValue("optp"));
									map.put("optmy", reqElm.attributeValue("optmy"));
									map.put("rgmny", reqElm.attributeValue("rgmny"));
									map.put("rlmny", reqElm.attributeValue("rlmny"));
									map.put("ftmny", reqElm.attributeValue("ftmny"));
									map.put("rmk", reqElm.attributeValue("rmk"));
									map.put("st", reqElm.attributeValue("st"));
									map.put("optr", reqElm.attributeValue("optr"));
									map.put("strnm", reqElm.attributeValue("strnm"));
									map.put("utacc", reqElm.attributeValue("utacc"));
									map.put("inacc", reqElm.attributeValue("inacc"));
									map.put("accmny", reqElm.attributeValue("accmny"));
									ls.add(map);
								}
							}
						}
					}
					Document doc2 = DocumentHelper.parseText(res2);
					Element root2 = doc2.getRootElement();
					String resultCode2 = root2.attributeValue("st");
					if (resultCode2.equals(Constants.SUCCESS)) {
						List<Element> childNodes = root2.elements();
						if (childNodes.size() > 0) {
							for (Element reqElm : childNodes) {
								Map<String, String> map = new HashMap<String, String>();
								map.put("prctm", reqElm.attributeValue("prctm"));
								map.put("ppytm", reqElm.attributeValue("ppytm"));
								map.put("optp", reqElm.attributeValue("optp"));
								map.put("optmy", reqElm.attributeValue("optmy"));
								map.put("rgmny", reqElm.attributeValue("rgmny"));
								map.put("rlmny", reqElm.attributeValue("rlmny"));
								map.put("ftmny", reqElm.attributeValue("ftmny"));
								map.put("rmk", reqElm.attributeValue("rmk"));
								map.put("st", reqElm.attributeValue("st"));
								map.put("optr", reqElm.attributeValue("optr"));
								map.put("strnm", reqElm.attributeValue("strnm"));
								map.put("utacc", reqElm.attributeValue("utacc"));
								map.put("inacc", reqElm.attributeValue("inacc"));
								map.put("accmny", reqElm.attributeValue("accmny"));
								ls.add(map);
							}
						}
					}
					ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
					if (ls.size() > 0) {
						Collections.sort(ls, new MapComparator());
					} else {
						apiJsonResult = ApiJsonResult.createFalied("没有记录");
						apiJsonResult.setSt(5000007);
					}
					apiJsonResult.setRec(ls);
					JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
					String rec = jsonObject.getString("rec");
					if (rec != null && !rec.equals("")) {
						rec = encryptUtil.encode(rec);
						jsonObject.put("rec", rec);
					}
					return jsonObject;
				} else {
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			}

		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			if (e.toString().contains("decrypt fail")) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 查询用户信息接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/userinfoQuery")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object userinfoQuery(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "userinfoQuery";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			
			UserInfo userInfo = userServcieImpl.getUserInfo(recMap.get("unm"), Integer.parseInt(recMap.get("utyp")));
			if (userInfo!=null) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				Map<String, Object> usermap = new HashMap<String, Object>();
				usermap.put("eml", userInfo.getEmail() == null ? "" : userInfo.getEmail());
				usermap.put("arcd", userInfo.getInterTelCode() == null ? "" : userInfo.getInterTelCode());
				usermap.put("uid", userInfo.getUserId() == null ? "" : userInfo.getUserId());
				usermap.put("emlmrk", userInfo.getEmailStatus() == null ? "" : userInfo.getEmailStatus());
				usermap.put("sex", userInfo.getSex() == null ? "" : userInfo.getSex());
				usermap.put("lv", userInfo.getUserLv() == null ? "" : userInfo.getUserLv());
				usermap.put("mnpwd", userInfo.getFundPwd() == null ? "" : userInfo.getFundPwd());
				usermap.put("mnt", userInfo.getCurrencyName() == null ? "" : userInfo.getCurrencyName());
				usermap.put("tpagt", userInfo.getAgentId() == null ? "" : userInfo.getAgentId());
				usermap.put("regtm", userInfo.getRegistTime() == null ? "" : userInfo.getRegistTime());
				usermap.put("regip", userInfo.getCreateIp() == null ? "" : userInfo.getCreateIp());
				usermap.put("utyp", String.valueOf(userInfo.getUserType()));
				usermap.put("ust", String.valueOf(userInfo.getUserStatus()));
				usermap.put("nmchg", userInfo.getIsNameChanged() == null ? "" : userInfo.getIsNameChanged());
				usermap.put("fstnm", userInfo.getGivenName() == null ? "" : userInfo.getGivenName());
				usermap.put("phnm", userInfo.getMobile() == null ? "" : userInfo.getMobile());
				usermap.put("phmrk", userInfo.getMobileStatus() == null ? "" : userInfo.getMobileStatus());
				usermap.put("bthdy", userInfo.getBirthdate() == null ? "" : userInfo.getBirthdate());
				usermap.put("lsttm", userInfo.getLastLoginTime() == null ? "" : userInfo.getLastLoginTime());
				usermap.put("ncknm", userInfo.getNickName() == null ? "" : userInfo.getNickName());
				usermap.put("unm", userInfo.getAccoutName() == null ? "" : userInfo.getAccoutName());
				usermap.put("lstip", userInfo.getLastLoginIp() == null ? "" : userInfo.getLastLoginIp());
				usermap.put("ntlty", userInfo.getCountry() == null ? "" : userInfo.getCountry());
				usermap.put("lstnm", userInfo.getSurName() == null ? "" : userInfo.getSurName());
				usermap.put("mnymrk", userInfo.getIsSetFundPwd() == null ? "" : userInfo.getIsSetFundPwd());
				usermap.put("ref", userInfo.getRef() == null ? "" : userInfo.getRef());
				usermap.put("pro", userInfo.getAddress() == null ? "" : userInfo.getAddress());
				ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
				apiJsonResult.setRec(usermap);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			/*String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}*/
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 银行卡查询接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/bankCardQuery")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object bankCardQuery(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "bankCardQuery";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 查询推广代理用户
	 * 
	 * @param data
	 * @return
	 */
	@At("/queryExpandAgent")
	@Ok("json")
	public Object queryExpandAgent(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "queryExpandAgent";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 代理的配置域名查询
	 * 
	 * @param data
	 * @return
	 */
	@At("/queryAgentDomain")
	@Ok("json")
	public Object queryAgentDomain(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "queryAgentDomain";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 现金用户的存款/取款
	 * 
	 * @param data
	 * @return
	 */
	@At("/cashUserInOutMoney")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object cashUserInOutMoney(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "cashUserInOutMoney";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			if (reqMap.get("t").equals(Constants.DRAWAL_APPLY)) {
				UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
				if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
					return ApiJsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
				}
				// 检测资金密码输入错误次数，超过次数则冻结账户
				if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
					int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
					int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
					if (failedCount >= maxError) {
						AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).setFreezeTimer(System.currentTimeMillis());
						AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
						HashMap<String, String> req = new HashMap<String, String>();
						HashMap<String, String> rec = new HashMap<String, String>();
						req.put("opt", "2");// 1、新增，2、修改
						rec.put("uid", onlineUser.getUserId());// 用户ID
						rec.put("ust", "3");// 真实姓名
						rec.put("frzrs", "248");// 冻结原因 248资金密码错误
						String xml = CreateXmlUtil.createPublicReqXML(req, rec);
						String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
						onlineUser.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode());
						return ApiJsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
					}
				}
				String fundpwd = PasswordEncoder.encode(onlineUser.getAccoutName(), recMap.get("mnpwd"));
				if (onlineUser.getFundPwd().equals(fundpwd)) {
					// 清除失敗記錄
					if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
						AppCache.userFundPwdErrorRecord.remove(onlineUser.getUserId());
					}
				} else {
					// 记录登录失败次数
					if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
						int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
						FreezeCount count = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId());
						count.setCount(failedCount + 1);
						AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
						AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					} else {
						FreezeCount count = new FreezeCount();
						count.setCount(1);
						count.setFirstTimer(System.currentTimeMillis());
						AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
						AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					}
					ApiJsonResult jsonResult = ApiJsonResult.createFalied("资金密码错误！");
					jsonResult.setSt(5001006);
					return jsonResult;
				}
				if (recMap.get("paywy").equals("10")) {
					HashMap<String, String> mgrReq = new HashMap<String, String>();
					mgrReq.put("amount", String.valueOf(recMap.get("mny")));
					mgrReq.put("tbnm", "DepositByZFB");
					String mgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
					log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + mgrXml);
					String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
					log.info("【手机前端调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + mgrResXML);
					try {
						Document mgrDoc = DocumentHelper.parseText(mgrResXML);
						Element mgrRoot = mgrDoc.getRootElement();
						String mgrResultCode = mgrRoot.attributeValue("st");
						if (!mgrResultCode.equals(Constants.SUCCESS)) {
							ApiJsonResult jsonResult = ApiJsonResult.createFalied("支付宝当日提款限额已经用完,请选择银行卡提款");
							jsonResult.setSt(5001081);
							return jsonResult;
						}
					} catch (DocumentException e) {
						e.printStackTrace();
						return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
				}

				// modify by jagger 20160127
				String bnkid = recMap.get("bnkid");
				if (null == bnkid || "".equals(bnkid)) {
					bnkid = "4";
				}
				Financer financer = userServcieImpl.getFinancer(recMap.get("paywy"), bnkid);
				if (financer == null) {
					return ApiJsonResult.createFalied(i18n.get("msg.portal.noOnlineFinancer"));
				} else {
					recMap.put("trsu", financer.getId());
					recMap.put("trsunm", financer.getName());
				}
			}
			// 如果是支付宝支付则需先将本次消耗的额度推送到管理中心
			if (recMap.get("bltyp").trim().equals("4") && reqMap.get("t").equals("1")) {
				//帮客户端把udept字段填写进去
				String udept = AppCache.getDictListByTypeId(Constants.ALIPAY_DRAW_DAG).get(0).getDictCode();
				recMap.put("udept", udept);// 用户存款机构
				try {
					HashMap<String, String> mgrReq = new HashMap<String, String>();
					mgrReq.put("amt", recMap.get("mny"));
					mgrReq.put("tbnm", "AlipaySubAmt");
					mgrReq.put("apaId", recMap.get("bnkacc"));
					String mgrXml = CreateXmlUtil.createPublicReqXML(mgrReq, null);
					log.info("【手机API调用管理中心ICE推送本次存款消耗的额度请求报文为：】" + mgrXml);
					String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
					// mgrResXML = "<resp st='1' msg='成功'></resp>";
					log.info("【手机API调用管理中心ICE推送本次存款消耗的额度返回报文为：】" + mgrResXML);
					Document mgrDoc = DocumentHelper.parseText(mgrResXML);
					Element mgrRoot = mgrDoc.getRootElement();
					String mgrResultCode = mgrRoot.attributeValue("st");
					if (!mgrResultCode.equals(Constants.SUCCESS)) {
						ApiJsonResult result = ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
						return result;
					}
				} catch (Exception e) {
					log.error("手机API调用管理中心ICE推送本次存款消耗的额度请求异常", e);
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			}
			recMap.put("trmnl", DepositDrawTerminal.APP.getVal());// 存提款来源手机app
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					if (reqMap.get("t").equals(Constants.DEPOSIT_APPLY)) {
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
						try {
							if (recMap.get("bltyp").trim().equals("4")) {
								Map<String, Dict> aliPayMap = AppCache.getAliPayMap();
								Dict aliPayDict = aliPayMap.get(recMap.get("cmpbnk"));
								depInfo.setOrderTime(System.currentTimeMillis());
								depInfo.setOrgName(aliPayDict.getDictName());
								depInfo.setNameOnCard(recMap.get("hbunm"));
								depInfo.setCardNo(recMap.get("hbacc"));
								depInfo.setSaveAmount(Double.parseDouble(recMap.get("mny")));
								depInfo.setCollectionType(1);
								AppCache.collecitonInfos.put(orderId, depInfo);
							} else {
								Map<String, BankCard> localBankMap = AppCache.getLocalBankMap();
								BankCard bankCard = localBankMap.get(recMap.get("bnkacc"));
								depInfo.setOrderTime(System.currentTimeMillis());
								depInfo.setOrgName(bankCard.getBankName());
								depInfo.setNameOnCard(bankCard.getName());
								depInfo.setCardNo(bankCard.getCardNumber());
								depInfo.setSaveAmount(Double.parseDouble(recMap.get("mny")));
								depInfo.setBranchName(bankCard.getOpeningOutlets());
								depInfo.setCollectionType(0);
								AppCache.collecitonInfos.put(orderId, depInfo);
							}
							//管理中心数据同步外包
							try {
								HashMap<String, String> mgrTbReq = new HashMap<String, String>();
								mgrTbReq.put("strnm", orderId);
								mgrTbReq.put("tbnm", "Waibao");
								if(recMap.get("bltyp").trim().equals("4")){
									mgrTbReq.put("type", "4");//type=1 本地银行, type=4 支付宝	
								}else{
									mgrTbReq.put("type", "1");//type=1 本地银行, type=4 支付宝
								}
								String mgrtbXml = CreateXmlUtil.createPublicReqXML(mgrTbReq, null);
								log.info("【手机前端调用管理中心ICE数据同步外包请求报文为：】" + mgrtbXml);
								String mgrTbResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrtbXml);
								log.info("【手机前端调用管理中心ICE数据同步外包返回报文为：】" + mgrTbResXML);
							} catch (Exception e) {
								e.printStackTrace();
							}
						} catch (Exception e) {
							log.error("存款组装收款信息时异常" , e);
						}
					}
				}

				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 划账
	 * 
	 * @param data
	 * @return
	 */
	@At("/fundMove")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object fundMove(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "fundMove";
		ApiJsonResult jsonResult = ApiJsonResult.createSuccess();
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		/*
		 * if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) { return
		 * ApiJsonResult.createFalied(i18n.get("msg.common.userStsFreeze")); }
		 */
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			String ip = getClientIp(request);
			recMap.put("uip", ip);
			// 转账前检查用户活动逻辑
			String fid = recMap.get("utacc");
			String tid = recMap.get("inacc");
			String uid = recMap.get("uid");
			UserInfo user = (UserInfo) request.getSession().getAttribute(Constants.USER_SESSION);
			String anmoney = recMap.get("anmoney");
			double money = Double.parseDouble(recMap.get("mny"));
			// 1、检测用户在划出钱包的子应用中是否参加有活动。如果没有参加任何正在活动中的活动，则进行下一步和用户中心交互进行划账。如果有参加正在活动中的活动，则需要进行相应的业务处理。
			List<UserActivityInfo> userActivityList = activityHandleServiceImpl.findUserActivityList(fid, user.getUserId());
			if (userActivityList.size() == 0) {
				// 用户在转出的子应用中没有参加任何活动中的活动,开始下一步转账操作。
				jsonResult = this.executeStockArrives(fid, tid, money, String.valueOf(0), user, request);
			} else {
				// 如果有参加正在活动中的活动，则需要将参加的所有活动都调用活动中心结束活动接口，对活动进行结束。1：如果有的活动无法结束，则要终止划账。2：如果活动都可以正常结束，则进行下一步和用户中心交互划账。
				// 3:活动可以结束，但需要扣除活动金额，这需要和用户交互，让用户确认。
				List<String> actNoList = new ArrayList<String>();
				for (UserActivityInfo userActivity : userActivityList) {
					actNoList.add(userActivity.getActivityNo());
				}
				RespBeanForActivityEnd respBean = activityHandleServiceImpl.activityEnd(actNoList, user, anmoney, money);
				if (Constants.ACTIVITY_END_ST_YES.equals(respBean.getSt())) {
					// st=0则表示活动正常被结束,用户可以下一步进行划账。
					jsonResult = this.executeStockArrives(fid, tid, money, String.valueOf(0), user, request);
				} else if (Constants.ACTIVITY_END_ST_NO.equals(respBean.getSt())) {
					// st=1表示活动无法结束，用户无法转款，则终止用户转款。
					String systemMessage = i18n.get("msg.portal.noEndActivity");
					if ("pc.end.fail.wash".equals(respBean.getMsg())) {
						systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficient"), respBean.getWash()) + "，"
								+ MessageFormat.format(i18n.get("msg.activity.insistTransfer"), respBean.getBack());
					} else if ("pc.end.fail.rewash".equals(respBean.getMsg())) {
						double temp = Double.parseDouble(anmoney) - Double.parseDouble(respBean.getBack());
						if (temp > 0) {
							systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficientForRebate"), respBean.getWash()) + "，"
									+ MessageFormat.format(i18n.get("msg.activity.lowerWithdrawAmt"), String.valueOf(temp)) + i18n.get("msg.activity.tryAgain");
						} else {
							systemMessage = MessageFormat.format(i18n.get("msg.activity.turnoverInsufficientForRebate"), respBean.getWash());
						}
					}
					jsonResult = ApiJsonResult.createFalied();
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("actjoinst", "2");
					map.put("actendst", "1");
					map.put("failmsg", systemMessage);
					jsonResult.setRec(map);
				} else if (Constants.ACTIVITY_END_ST_INSIST.equals(respBean.getSt())) {
					// st=2则表示需要强制结束活动方可转款，并给出了强制转出会扣除多少钱，提示用户是否选择强制转出，如果用户确认同意强制转出，
					// 则设置报文force=”1”调用活动中心结束用户活动的接口，在返回报文中获取back金额，增加到转账报文中活动金扣除属性上，送用户中心在转出时扣除活动金。
					Double activityMoney = Double.parseDouble(respBean.getBack());// 强转要扣掉的活动费。
					Double lastWalletOutMoney = ArithUtil.add(money, activityMoney);// 强转最终的转出款。
					String actNosForEnd = this.makeActNosForEnd(respBean);// 用户确认强转后，需要结束的活动。
					jsonResult = ApiJsonResult.createFalied("划账失败");
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("actmny", activityMoney);// 强转要扣掉的活动费。
					map.put("lastmny", lastWalletOutMoney);// 强转最终的转出款。
					map.put("instactno", actNosForEnd);// 用户确认强转后，需要结束的活动。
					map.put("actjoinst", "2");
					map.put("actendst", "2");
					jsonResult.setRec(map);
				}
			}
			JSONObject jsonObject = (JSONObject) JSON.toJSON(jsonResult);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;

		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 进行转账操作
	 * 
	 * @param data
	 * @return
	 */
	@Ok("json")
	private ApiJsonResult executeStockArrives(String walletOut, String walletIn, double balance, String otmny, UserInfo user, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "fundMove";
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess("成功");
		try {
			HashMap<String, String> req = new HashMap<String, String>();
			HashMap<String, String> rec = new HashMap<String, String>();
			rec.put("uid", user.getUserId());
			rec.put("utyp", String.valueOf(user.getUserType()));
			rec.put("utacc", walletOut);
			rec.put("inacc", walletIn);
			rec.put("opttm", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			rec.put("optid", user.getUserId());
			rec.put("mny", String.valueOf(balance));
			rec.put("unm", user.getAccoutName());
			rec.put("optnm", user.getAccoutName());
			rec.put("mnt", user.getCurrencyName());
			String ip = getClientIp(request);
			rec.put("uip", ip);
			rec.put("surc", TransferSource.APP.getVal());
			rec.put("otmny", otmny);
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			String response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				String msg = root.attributeValue("msg");
				if (!resultCode.equals(Constants.SUCCESS)) {
					apiJsonResult = ApiJsonResult.createFalied(msg);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("actjoinst", "1");
					apiJsonResult.setRec(map);
				} else {
					List<Activity> userOkActivityList = activityHandleServiceImpl.findUserOkActivityList(walletIn, Constants.ACTIVITY_TRIGGER_WEB_TRANS, user, balance);
					if (userOkActivityList.size() > 0) {
						String actNosForWaive = "";
						for (Activity act : userOkActivityList) {
							actNosForWaive += act.getCurrActivityNo() + ",";
						}
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("actlist", userOkActivityList);
						map.put("giveupactno", actNosForWaive);
						map.put("ishvact", "1");
						apiJsonResult.setRec(map);
					} else {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("ishvact", "2");
						apiJsonResult.setRec(map);
					}
				}
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
			return apiJsonResult;
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 活动操作
	 * 
	 * @param data
	 * @return
	 */
	@At("/optAct")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object optAct(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		ApiJsonResult jsonResult = ApiJsonResult.createSuccess("成功");
		String facename = "optAct";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			String opt = reqMap.get("t");
			String money = recMap.get("mny");
			String actid = recMap.get("actid");
			String walletOut = recMap.get("utacc");
			String walletIn = recMap.get("inacc");
			String activityMoney = recMap.get("actmny");
			UserInfo userInfoInSession = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			String ip = getClientIp(request);
			// String ip = "172.27.76.45";
			if (opt.equals("1")) {
				try {
					RespBeanForActivityJoin respBean = activityHandleServiceImpl.joinActivity(userInfoInSession, ip, Double.valueOf(money), actid);
					if (!Constants.ACTIVITY_JOIN_ST_YES.equals(respBean.getSt())) {
						if (Constants.ACTIVITY_JOIN_MSG_REPT.equals(respBean.getMsg())) {
							jsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.repIpPhoneEmail"));
						} else if (Constants.ACTIVITY_JOIN_MSG_NOIN.equals(respBean.getMsg())) {
							jsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.noPayInfo"));
						} else if (Constants.ACTIVITY_JOIN_MSG_FIRST.equals(respBean.getMsg())) {
							jsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.noFirstTrans"));
						} else if (Constants.ACTIVITY_JOIN_MSG_NOACT.equals(respBean.getMsg())) {
							jsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.noEnableAct"));
						}
					}
				} catch (final Exception e) {
					log.error(e.getMessage(), e);
					jsonResult = ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else if (opt.equals("2")) {
				try {
					activityHandleServiceImpl.waiveActivity(userInfoInSession, ip, Double.valueOf(money), actid);
				} catch (final Exception e) {
					log.error(e.getMessage(), e);
					jsonResult = ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else if (opt.equals("3")) {
				List<Activity> actNoList = new ArrayList<Activity>();
				log.info("\n\nactNosForEndSt:[" + actid + "]\n\n");
				if (actid != null) {
					String[] actNoAndsts = actid.split(",");
					for (String actNo : actNoAndsts) {
						String[] actNoAndst = actNo.split("~");
						Activity actTemp = new Activity();
						actTemp.setCurrActivityNo(actNoAndst[0]);
						actTemp.setSt(actNoAndst[1]);
						actNoList.add(actTemp);
					}
				}
				jsonResult = this.executeStockArrives(walletOut, walletIn, Double.parseDouble(money), activityMoney, userInfoInSession, request);
				if (String.valueOf(jsonResult.getSt()).equals(Constants.SUCCESS)) {
					// 转账成功。调用结束用户活动状态的接口
					activityHandleServiceImpl.commonSrv(userInfoInSession, actNoList);
				} else {
					jsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.noEnoughMoney"));
				}
			}
			JSONObject jsonObject = (JSONObject) JSON.toJSON(jsonResult);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	private String makeActNosForEnd(RespBeanForActivityEnd respBean) {
		List<MsgForActivityEnd> MsgList = respBean.getMsgList();
		String actNosForEnd = "";
		for (MsgForActivityEnd msgBean : MsgList) {
			actNosForEnd += msgBean.getActNo() + "~" + msgBean.getSt() + ",";// 例子：5001~2,5002~2，...
																				// ...
		}
		return actNosForEnd;
	}

	/**
	 * 获取用户站内信
	 * 
	 * @param data
	 * @return
	 */
	@At("/getUserMessage")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getUserMessage(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getUserMessage";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				// session.invalidate();
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 操作用户站内信
	 * 
	 * @param data
	 * @return
	 */
	@At("/optUserMessage")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object optUserMessage(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "optUserMessage";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");

			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 获取数据字典
	 * 
	 * @param data
	 * @return
	 */
	@At("/getAllDict")
	@Ok("json")
	public Object getAllDict(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getAllDict";
		try {
			if (data == null || data.equals("")) {
				return JSON.toJSONString(ApiJsonResult.createFalied("参数为空,data"));
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[getAllDict]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[getAllDict]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			Map<String, List<Dict>> newDictMap = new HashMap<String, List<Dict>>();
			Map<String, List<Dict>> dictMap = AppCache.getDictMap();
			for (String key : dictMap.keySet()) {
				List<Dict> ls = AppCache.getI18nDictListByLg(key, recMap.get("lg"));
				if (ls != null && ls.size() > 0) {
					if (!key.equals("notice_status") && !key.equals("agentline_status") && !key.equals("dfltPage") && !key.equals("receiverType") && !key.equals("appType") && !key.equals("busi_role")
							&& !key.equals("dfltSptRto") && !key.equals("fundtype") && !key.equals("sendWay") && !key.equals("balancesource") && !key.equals("favorItem")
							&& !key.equals("credit_usertype") && !key.equals("isOnline") && !key.equals("app") && !key.equals("balanceflag") && !key.equals("excha_rate_stat")
							&& !key.equals("receiver_type") && !key.equals("terminal_type") && !key.equals("maintainStatus") && !key.equals("debitsource") && !key.equals("fundsinouttype")
							&& !key.equals("readWay") && !key.equals("yes_or_no") && !key.equals("subaccount_status") && !key.equals("bankaccount_status") && !key.equals("status")
							&& !key.equals("Withdrawal_Way") && !key.equals("queryTime") && !key.equals("agent_type") && !key.equals("dfltTZ") && !key.equals("sscMode") && !key.equals("freezereason")
							&& !key.equals("agent_check_status") && !key.equals("wallet_type") && !key.equals("sourcetype") && !key.equals("dfltTflatRto") && !key.equals("is_covered")
							&& !key.equals("withdrawal_balancesource") && !key.equals("creditmodel")) {
						newDictMap.put(key, ls);

					}
				}
			}

			if (newDictMap.size() > 0) {
				// JSONObject jsonObject = (JSONObject) JSON.toJSON(newDictMap);
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(newDictMap);
				JSONObject jsonObject = JSON.parseObject(JSON.toJSONString(result));
				String rec = jsonObject.getString("rec");
				// log.info(userAgent+"调用手机端接口[getAllDict]，返回报文"+rec);
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				/*
				 * String data1 = AES.encryptToBase64("机器", aeskey); jsonObject.put("rec", data1);
				 */

				return jsonObject;
			} else {
				return ApiJsonResult.createFalied("字典数据为空");
			}
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 获取系统参数
	 * 
	 * @param data
	 * @return
	 */
	@At("/getSystemParams")
	@Ok("json")
	public Object getSystemParams(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getSystemParams";
		String userAgent = this.getUserAgent(request, session);
		try {
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			Map<String, String> paramMap = AppCache.getSystemParmMap();

			if (paramMap.size() > 0) {
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(paramMap);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				// rec =
				// "{'DepositBetRate':'5','MgrStaticDomain':' ','MgrWhiteList':' ','StatusUpdateInterval':'5','WithdrawalChargeRate':'0','androidVersion':'1.0','default_language':'zh','drawMoneySpaceTime':'10','errorPwdCountValidTime':'10','iOSVersion':'1.0','localBankTransVisiableValve':'1','mailCodeInvalidTime':'5','mgrCenterCache':'201510081620','msgCodeInvalidTime':'180','saveMoneySpaceTime':'0','userBankCardQuantityLimit':'4','userErrorPwdCount':'5','userFundPwdCount':'3','userFundPwdCountValidTime':'10','userSendSCRCodeTimes':'5','userUnfreezeTime':'5','userUnlockTime':'5','webFrontCache':'20151028'}";
				log.info(userAgent + "调用手机端接口[getSystemParams]，返回报文" + rec);
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied("系统参数数据为空");
			}
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 获取钱包数据
	 * 
	 * @param data
	 * @return
	 */
	@At("/getWalletData")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getWalletData(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getWalletData";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
			String walletStr = GetAppAuthUtil.getWalletAutoStr(userInfo);
			List<WalletCategory> newWalletList = new ArrayList<WalletCategory>();

			String lg = recMap.get("lg");
			if (walletStr.length() > 0) {
				Map<String, WalletCategory> walletMap = AppCache.getWalletCategoryMap();
				String strs[] = walletStr.split(",");
				for (String str : strs) {
					if (walletMap.get(str) != null) {
						newWalletList.add(walletMap.get(str));
					}
				}
			}
			if (newWalletList.size() > 0) {
				for (WalletCategory walletCategory : newWalletList) {
					String iid = walletCategory.getIid();
					String oldName = walletCategory.getWalletName();
					String name = AppCache.getI18nInfo(iid, oldName, lg);
					walletCategory.setWalletName(name);
				}
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(newWalletList);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied("字典数据为空");
			}

		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}

	}

	/**
	 * 获取本地转账支付银行信息
	 * 
	 * @param data
	 * @return
	 */
	@At("/getLocalBank")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getLocalBank(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getLocalBank";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			List<Dict> dictLocalBank = AppCache.getI18nDictListByLg(Constants.LOCALBANK_TRANSFER_COMPANYBANKACC_DAG, recMap.get("lg"));
			Map<String, BankCard> localBankMap = AppCache.getLocalBankMap();
			List<BankCard> newLocalBankList = new ArrayList<BankCard>();

			for (Dict dict : dictLocalBank) {
				if (dict.getRules().indexOf(userInfo.getCurrencyName()) != -1 && dict.getStatus() == 1) {
					for (String key : localBankMap.keySet()) {
						BankCard bankCard = localBankMap.get(key);
						if (bankCard.getBankId().equals(dict.getDictCode())) {
							bankCard.setBankName(dict.getDictName());
							newLocalBankList.add(bankCard);
						}
					}
				}
			}
			if (newLocalBankList.size() > 0) {
				// JSONObject jsonObject = (JSONObject) JSON.toJSON(newDictMap);
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(newLocalBankList);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied("本地银行数据为空");
			}
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 获取快捷支付信息
	 * 
	 * @return
	 */
	@At("/getFastPayInfo")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getFastPayInfo(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getFastPayInfo";
		try {
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			PaymentPlatform paymentPlatform = paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY);
			if (paymentPlatform == null) {
				ApiJsonResult apiJsonResult = ApiJsonResult.createFalied("暂无可用快捷支付");
				apiJsonResult.setSt(Constants.NO_AVAILABLE_FASTPAY);
				return ApiJsonResult.createFalied("暂无可用快捷支付");
			} else {
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(paymentPlatform);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			}

		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 发送验证码
	 * 
	 * @param register
	 * @return
	 */
	@At("/sendCode")
	@Ok("json")
	public Object sendCode(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "sendCode";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			if (recMap.get("phnm") != null && !recMap.get("phnm").equals("") && recMap.get("arcd") != null && !recMap.get("arcd").equals("") && recMap.get("sendmark")!=null && !recMap.get("sendmark").equals("1")) {
				boolean isPhoneUserd = this.checkPhoneExist(recMap.get("phnm"), session);
				if (!isPhoneUserd) {
					ApiJsonResult result = ApiJsonResult.createFalied("手机重复！");
					result.setSt(5001012);
					return result;
				}
			}
			if (recMap.get("eml") != null && !recMap.get("eml").equals("")&&recMap.get("sendmark")!=null && !recMap.get("sendmark").equals("1")) {
				boolean isEmailUserd = this.checkEmailIsUsed(recMap.get("eml"), session);
				if (!isEmailUserd) {
					ApiJsonResult result = ApiJsonResult.createFalied("邮箱重复！");
					result.setSt(5001011);
					return result;
				}
			}
			int sendType = Integer.parseInt(reqMap.get("t"));
			String userid = recMap.get("uid");
			String code = StringUtil.createRandom(true, 6);
			if (sendType == 1) {
				try {
					// 检测发送验证码次数，超过次数则不允许发送
					if (AppCache.userGetCodeRecord.containsKey(userid)) {
						int sendCount = AppCache.userGetCodeRecord.get(userid);
						int maxSend = Integer.parseInt(AppCache.getSystemParm(com.vinbet.mobile.util.Constants.SEND_CODE_COUNT));
						if (sendCount >= maxSend) {
							return ApiJsonResult.createFalied(i18n.get("msg.portal.sendCodeMore"));
						} else {
							int sended = AppCache.userGetCodeRecord.get(userid);
							AppCache.userGetCodeRecord.put(userid, sended + 1);
						}
					} else {
						AppCache.userGetCodeRecord.put(userid, 1);
					}
					String phoneFix = recMap.get("arcd");
					String phoneNum = recMap.get("phnm");
					phoneCodeUtil.sendsms(phoneFix, phoneNum, code);
					AppCache.setPhonevCode(userid, phoneNum, code, System.currentTimeMillis());
				} catch (Exception e) {
					log.error("发送手机短信异常", e);
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else if (sendType == 2) {
				try {
					String mailAddress = recMap.get("eml");
					// 发送邮件
					mailUtil.sendEmail(mailAddress, "", new HashMap<String, String>(), null==Mvcs.getLocalizationKey()?"zh":Mvcs.getLocalizationKey(), userid, code);
				} catch (Exception e) {
					log.error("发送邮件异常", e);
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}

			}
			HashMap<String, String> rsmap = new HashMap<String, String>();
			rsmap.put("uid", userid);
			rsmap.put("code", code);
			apiJsonResult.setRec(rsmap);
			JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
			log.info("验证码"+code);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}

	}

	/**
	 * 手机快捷支付
	 * 
	 * @param amt
	 * @param request
	 * @param session
	 * @return
	 */
	@At("/mobilepay")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object mobilepay(String data, HttpServletRequest request, HttpSession session) {
		String facename = "mobilepay";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		if (data == null || data.equals("")) {
			return ApiJsonResult.createFalied("参数为空,data");
		}
		if (session.getAttribute(Constants.RDM_KEY) == null) {
			ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
			result.setSt(5000080);
			return result;
		}
		String userAgent = this.getUserAgent(request, session);
		log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
		EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
		data = encryptUtil.decode(data);
		log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
		// 把接收到的json报文转为Map
		HashMap<String, String> recMap = createMap(data, "rec");
		String amt = recMap.get("amt");
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess("成功");
		PaymentPlatform paymentPlatform = paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY);
		// 判断快捷支付是否可用
		if (null == paymentPlatform) {
			apiJsonResult = ApiJsonResult.createFalied("抱歉，快捷支付暂停使用，请稍后重试！");
			return apiJsonResult;
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
			rec.put("trmnl", DepositDrawTerminal.APP.getVal());
			String xml = CreateXmlUtil.createPublicReqXML(req, rec);
			response = cEPUserCenterIceClient.moneyManagerZreocSrvIPrx("cashUserInOutMoney", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					orderid = root.element("rec").attributeValue("strnm");
				} else if ("5002003".equals(resultCode)) {
					apiJsonResult = ApiJsonResult.createFalied(i18n.get("msg.portal.depositProcessed"));
					apiJsonResult.setSt(5002003);
					return apiJsonResult;
				} else if ("5002005".equals(resultCode)) {// 5002005
															// 存提款申请没有在指定规则内（存款时间间隔）
					apiJsonResult = ApiJsonResult.createFalied("存款申请过于频繁，请稍后再试！");
					apiJsonResult.setSt(5002005);
					return apiJsonResult;
				} else {
					log.error("快捷支付生产订单失败,用户中心返回错误码  << " + resultCode);
					apiJsonResult = ApiJsonResult.createFalied("快捷支付存款异常！");
					return apiJsonResult;
				}
			}
		} catch (Exception e) {
			log.error("快捷支付调用用户中心生产订单失败.", e);
		}
		if (orderid == null) {
			apiJsonResult = ApiJsonResult.createFalied("快捷支付存款异常！");
			return apiJsonResult;
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
			map.put("fcallbackurl", scheme + "://" + serverName + ":" + port + "/mobile/api/ybcallback");
			// 生成RSA签名
			String sign = EncryUtil.handleRSA(map, merchantPrivateKey);
			map.put("sign", sign);
			// 生成data
			String pdata = AES.encryptToBase64(JSON.toJSONString(map), merchantAesKey);
			// 使用RSA算法将商户自己随机生成的AESkey加密
			String encryptkey = RSA.encrypt(merchantAesKey, yibaoPublicKey);

			String mobilePayUrl = urlPrefix + PayAPIURIList.PAYWEB_PAY.getValue();

			Map<String, Object> obj = new HashMap<String, Object>();
			obj.put("merchantaccount", merchantaccount);
			obj.put("data", pdata);
			obj.put("encryptkey", encryptkey);
			obj.put("mobilePayUrl", mobilePayUrl);
			apiJsonResult.setRec(obj);
			JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;
		} catch (Exception e) {
			log.error("mobilepay to ybpage error:", e);
			apiJsonResult = ApiJsonResult.createFalied("快捷支付存款异常！");
			return apiJsonResult;
		}
	}

	/**
	 * YB回调
	 */
	@At("/ybcallback")
	@Ok("jsp:page.api.ybcallback")
	public void ybcallback() {

	}
	
	
	
	/**
	 * 手机微信扫码支付
	 * 
	 * @param amt
	 * @param request
	 * @param session
	 * @return
	 */
	@At("/wechatCodePay")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object wechatCodePay(String data, HttpServletRequest request, HttpSession session) {
		String facename = "wechatCodePay";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
		if (data == null || data.equals("")) {
			return ApiJsonResult.createFalied("参数为空,data");
		}
		if (session.getAttribute(Constants.RDM_KEY) == null) {
			ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
			result.setSt(5000080);
			return result;
		}
		JSONObject jsonObject;
		try {
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			recMap.put("trmnl", DepositDrawTerminal.APP.getVal());
			JsonResult jsonResult= wechatServcieImpl.wechatPay(recMap, request, session);
			if(jsonResult.getR()==0){
				apiJsonResult.setRec(jsonResult.getData());
				jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			}else{
				apiJsonResult=ApiJsonResult.createFalied(jsonResult.getM());
				if(jsonResult.getR()!=1){
					apiJsonResult.setSt(jsonResult.getR());
				}
				return apiJsonResult;
			}
		} catch (Exception e) {
			log.error("wechatpay app error:", e);
			apiJsonResult = ApiJsonResult.createFalied("微信支付存款异常！");
			return apiJsonResult;
		}
		
	}

	/**
	 * 是否显示存款方式接口
	 * 
	 * @param register
	 * @return
	 */
	@At("/isDepositShow")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object isDepositShow(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "isDepositShow";
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess("成功");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);

			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			String unm = recMap.get("unm");
			String utyp = recMap.get("utyp");
			String uid = recMap.get("uid");
			Map<String, String> map = new HashMap<String, String>();
			UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
			if (userInfo.getCurrencyName().equals("THB") || "1".equals(AppCache.userLocalBankShow.get(unm))) {
				map.put("isLocalShow", "1");
			} else {
				int showValue = Integer.parseInt(AppCache.getSystemParm(Constants.LOCAL_BANK_TRANS_VISIABLE_VALUE));
				Document outDoc = DocumentHelper.createDocument();
				Element rootElm = outDoc.addElement("req");
				rootElm.addAttribute("t", Constants.CHECK_INFO_DEPOSIT_TIMES);
				Element recElm = rootElm.addElement("rec");
				recElm.addAttribute("unm", unm);
				recElm.addAttribute("utyp", utyp);
				recElm.addAttribute("uid", uid);
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
							map.put("isLocalShow", "0");
						} else {
							AppCache.userLocalBankShow.put(unm, "1");
							map.put("isLocalShow", "1");
						}
					}
				} else {
					log.error("调用[platform]手机服务端[checkInfo]请求报文：" + xml + "接口返回数据:" + response);
				}

			}
			boolean isFastpayShow = null == paymentServcieImpl.getPaymentPlatform(Constants.PAYMENTPLAT_FASTPAY) ? false : true;
			if (isFastpayShow && userInfo.getCurrencyName().equals("CNY")) {
				map.put("isFastpayShow", "1");
			} else {
				map.put("isFastpayShow", "0");
			}
			List<Dict> alipayList = AppCache.getI18nDictListByType(Constants.ALIPAY_DAG);
			if(alipayList==null||alipayList.size()==0){
				map.put("isShowAlipay","0");
			}else{
				map.put("isShowAlipay","1");
			}
			List<Dict> wechatpayList = AppCache.getI18nDictListByType(Constants.WECHATPAY_DAG);
			if(wechatpayList==null||wechatpayList.size()==0){
				map.put("isShowWechatpay","0");
			}else{
				map.put("isShowWechatpay","1");
			}
			apiJsonResult.setRec(map);
			log.info("获取支付方式返回报文==>" + map.toString());
			JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	@At("/chat")
	public void chat(String data, HttpServletRequest request, HttpSession session, HttpServletResponse respone) {
		try {
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端API[chat]接口请求报文" + data);
			data = data.replace("-", "+").replace("_", "/").replace("*", "=");
			if (data != null || !data.equals("")) {
				data = BASE64Util.getFromBASE64(data);
			}
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			String os = recMap.get("os");
			String chatType = recMap.get("ctp");
			String scheme = request.getScheme();
			String serverName = request.getServerName();// 要获取nginx的地址，不要tomcat的地址
			int port = request.getServerPort();
			String callbackUrl = scheme + "://" + serverName + ":" + port + "/mobile/user/contact";

			if (os.equals("ios")) {
				if (chatType.equals("1")) {
					respone.sendRedirect("http://www.lonecm.com/scsf/phone/visitor.html?cmpcd=129710&clientUrl=" + callbackUrl);
				} else {
					respone.sendRedirect("http://ytpfx.livechatvalue.com/chat/chatClient/chatbox.jsp?companyID=492618&configID=40777&jid=4442939572");
				}
			} else if (os.equals("android")) {
				if (chatType.equals("1")) {
					respone.sendRedirect("http://www.lonecm.com/scsf/phone/visitor.html?cmpcd=129710&clientUrl=" + callbackUrl);
				} else {
					respone.sendRedirect("http://ytpfx.livechatvalue.com/chat/chatClient/chatbox.jsp?companyID=492618&configID=40777&jid=4442939572");
				}
			}
		} catch (IOException e) {
		}
	}

	/**
	 * 获取币种信息
	 * 
	 * @return
	 */
	@At("/getCurrency")
	@Ok("json")
	public Object getCurrency(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getCurrency";
		try {
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			Map<String, Currency> currencyMap = AppCache.getCurrencyMap();
			if (currencyMap.size() > 0) {
				ApiJsonResult result = ApiJsonResult.createSuccess("成功");
				result.setRec(currencyMap);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				ApiJsonResult apiJsonResult = ApiJsonResult.createFalied("暂无可用币种！");
				apiJsonResult.setSt(Constants.NO_AVAILABLE_FASTPAY);
				return ApiJsonResult.createFalied("暂无可用币种！");
			}

		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 系统认证接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/SystemAuth")
	@Ok("json")
	public Object SystemAuth(String data, HttpServletRequest request, HttpSession session) {
		String facename = "SystemAuth";
		ApiJsonResult result = ApiJsonResult.createSuccess("成功");
		String userAgent = this.getUserAgent(request, session);
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			log.info(userAgent + "调用手机端接口[SystemAuth]，请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			// 客户端生成的RSA公钥
			int key1 = Integer.parseInt(recMap.get("key1"));
			int key2 = Integer.parseInt(recMap.get("key2"));
			int key3 = Integer.parseInt(recMap.get("key3"));
			EncryptUtil encryptUtil = new EncryptUtil();
			int t = encryptUtil.getPublicKey(key1, key2);
			encryptUtil.makePrivateKey(key3);
			session.setAttribute(Constants.RDM_KEY, encryptUtil);
			// 服务端随机生成16位的AES密钥
			// String merchantAesKey = RandomUtil.getRandom(16);
			// 把生成的AESkey保存在session里
			// 使用RSA公钥加密AES密钥
			// String target = RSA.encrypt(merchantAesKey, key);
			// 组装返回报文
			Map<String, String> map = new HashMap<String, String>();
			map.put("key", String.valueOf(t));
			result.setRec(map);
			log.info(userAgent + "调用手机端接口[SystemAuth]，返回报文" + map.toString());
			return result;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied("系统认证失败！");
		}
	}

	/**
	 * 校验资金密码接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/valiFundPwd")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object valiFundPwd(String data, HttpServletRequest request, HttpSession session) {
		String facename = "valiFundPwd";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		ApiJsonResult result = ApiJsonResult.createSuccess("成功");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result1 = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result1.setSt(5000080);
				return result1;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return ApiJsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			// 检测资金密码输入错误次数，超过次数则冻结账户
			if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
				int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
				int maxError = Integer.parseInt(AppCache.getSystemParm(Constants.FUND_PWD_ERROR_CONUT));
				if (failedCount >= maxError) {
					AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).setFreezeTimer(System.currentTimeMillis());
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
					HashMap<String, String> req = new HashMap<String, String>();
					HashMap<String, String> rec = new HashMap<String, String>();
					req.put("opt", "2");// 1、新增，2、修改
					rec.put("uid", onlineUser.getUserId());// 用户ID
					rec.put("ust", "3");// 真实姓名
					rec.put("frzrs", "248");// 冻结原因 248资金密码错误
					String xml = CreateXmlUtil.createPublicReqXML(req, rec);
					String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", xml);
					onlineUser.setUserStatus(Constants.USER_STATUS.USERSTATUS_FREEZE.getCode());
					return ApiJsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
				}
			}
			String fundpwd = PasswordEncoder.encode(onlineUser.getAccoutName(), recMap.get("fundpwd"));
			if (onlineUser.getFundPwd().equals(fundpwd)) {
				// 清除失敗記錄
				if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
					AppCache.userFundPwdErrorRecord.remove(onlineUser.getUserId());
				}
				return result;
			} else {
				// 记录登录失败次数
				if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
					int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
					FreezeCount count = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId());
					count.setCount(failedCount + 1);
					AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				} else {
					FreezeCount count = new FreezeCount();
					count.setCount(1);
					count.setFirstTimer(System.currentTimeMillis());
					AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
					AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
				}
				ApiJsonResult jsonResult = ApiJsonResult.createFalied("资金密码错误！");
				jsonResult.setSt(5001006);
				return jsonResult;
			}

		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied("校验资金密码失败！");
		}
	}

	/**
	 * 获取历史记录收款信息接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/getCollectionInfo")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getCollectionInfo(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getCollectionInfo";
		ApiJsonResult result = ApiJsonResult.createSuccess("成功");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result1 = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result1.setSt(5000080);
				return result1;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> recMap = createMap(data, "rec");
			String strnm = recMap.get("strnm");
			CollectionInfo depInfo = AppCache.collecitonInfos.get(strnm);
			if (depInfo != null) {
				result.setRec(depInfo);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				result = ApiJsonResult.createFalied("收款信息不存在或已过期！");
				result.setSt(5001080);
			}
			return result;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 获取互联网存款方式账号接口
	 * 
	 * @param data
	 * @return
	 */
	@At("/getHbAliPayInfo")
	@Filters(@By(type = CheckApiSession.class, args = { "USER_SESSION" }))
	@Ok("json")
	public Object getHbAliPayInfo(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "getHbAliPayInfo";
		ApiJsonResult result = ApiJsonResult.createSuccess("成功");
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result1 = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result1.setSt(5000080);
				return result1;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> mgrReq = createMap(data, "req");
			XMLBean xmlREQ = new XMLBean("req");
			xmlREQ.addttribute("tbnm", mgrReq.get("tbnm"));
			xmlREQ.addttribute("type", mgrReq.get("type"));
			xmlREQ.addttribute("amount", mgrReq.get("amount"));
			String mgrXml = xmlREQ.toXML();
			log.info("【手机前端调用管理中心ICE获取支付宝账号请求报文为：】" + mgrXml);
			String mgrResXML = this.cEPMgrCenterClient.getSyncPrmtData(mgrXml);// 调用管理中心ice推送本次存款消耗的额度
			// mgrResXML =
			// "<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec apaId='6501' apId='3503' account='422454541212152' accName='张飞飞' status='1' maxDepositAmt='218998' depositAmt='0' createDate='2015-12-11 14:21:16' createBy='0' modifyDate='2015-12-11 22:17:52' payType='10' payCurrency='CNY,THB,USD'/></resp>";
			log.info("【手机前端调用管理中心ICE获取支付宝账号返回报文为：】" + mgrResXML);
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
					result.setRec(aliPayInfo);
					JSONObject jsonObject = (JSONObject) JSON.toJSON(result);
					String rec = jsonObject.getString("rec");
					if (rec != null && !rec.equals("")) {
						rec = encryptUtil.encode(rec);
						jsonObject.put("rec", rec);
					}
					return jsonObject;
				} else {
					result = ApiJsonResult.createFalied(i18n.get("msg.portal.noAvailableAccount"));
					result.setSt(5001080);
				}
			}
			return result;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}
	
	/**
	 * 重置登陆密码
	 * 
	 * @param data
	 * @return
	 */
	@At("/resetPassword")
	@Ok("json")
	public Object resetPassword(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "resetPassword";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			UserInfo pwduser = (UserInfo) session.getAttribute(Constants.FINDPWD_SESSION);
			if(pwduser==null){
				ApiJsonResult result = ApiJsonResult.createFalied("权限校验失败，请稍后再试！");
				return result;
			}else{
				if(!pwduser.isResetPwd()){
					return JsonResult.createFalied("权限校验异常，修改失败！");
				}
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			UserInfo user = userServcieImpl.getUserInfo(recMap.get("unm"), Integer.parseInt(recMap.get("utyp")));
			String newpwd = recMap.get("tpwd");
			String enNewPwd = PasswordEncoder.encode(user.getAccoutName(), newpwd);
			if(enNewPwd!=null&&enNewPwd.equals(user.getFundPwd())){
				return ApiJsonResult.createFalied("登录密码不能与资金密码一致！");
			}
			String xml = CreateXmlUtil.createPublicReqXML(reqMap, recMap);
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(facename, xml);

			if (response != null && !response.equals("")) {
				// 将用户中心返回的XML报文转为json数据返回客户端
				String str = XmlConverUtil.xmltoJson(response);
				JSONObject jsonObject = JSON.parseObject(str);
				try {
					JSONArray ja = new JSONArray();
					if (jsonObject.getJSONObject("rec") != null) {
						ja.add(jsonObject.getJSONObject("rec"));
					}
					jsonObject.put("rec", ja);
				} catch (Exception e) {
				}
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				// session.invalidate();
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}
	
	/**
	 * 查询用户信息接口(找回密码专用)
	 * 
	 * @param data
	 * @return
	 */
	@At("/findPwdUserQuery")
	@Ok("json")
	public Object findPwdUserQuery(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "userinfoQuery";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			
			UserInfo userInfo = userServcieImpl.getUserInfo(recMap.get("unm"), Integer.parseInt(recMap.get("utyp")));
			if (userInfo!=null) {
				session.setAttribute(Constants.FINDPWD_SESSION,userInfo);
				// 将用户中心返回的XML报文转为json数据返回客户端
				Map<String, Object> usermap = new HashMap<String, Object>();
				usermap.put("eml", userInfo.getEmail() == null ? "" : StringUtil.getStarEmail(userInfo.getEmail()));
				usermap.put("arcd", userInfo.getInterTelCode() == null ? "" : userInfo.getInterTelCode());
				usermap.put("uid", userInfo.getUserId() == null ? "" : userInfo.getUserId());
				usermap.put("emlmrk", userInfo.getEmailStatus() == null ? "" : userInfo.getEmailStatus());
				usermap.put("ust", String.valueOf(userInfo.getUserStatus()));
				usermap.put("phnm", userInfo.getMobile() == null ? "" : StringUtil.getStarMobile(userInfo.getMobile()));
				usermap.put("phmrk", userInfo.getMobileStatus() == null ? "" : userInfo.getMobileStatus());
				usermap.put("unm", userInfo.getAccoutName() == null ? "" : userInfo.getAccoutName());
				ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
				apiJsonResult.setRec(usermap);
				JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
				String rec = jsonObject.getString("rec");
				if (rec != null && !rec.equals("")) {
					rec = encryptUtil.encode(rec);
					jsonObject.put("rec", rec);
				}
				return jsonObject;
			} else {
				return ApiJsonResult.createFalied("用户名不存在！");
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}
	
	/**
	 * 发送验证码(找回密码专用)
	 * 
	 * @param register
	 * @return
	 */
	@At("/findPwdSendCode")
	@Ok("json")
	public Object findPwdSendCode(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "sendCode";
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			UserInfo pwduser = (UserInfo) session.getAttribute(Constants.FINDPWD_SESSION);
			if(pwduser==null){
				ApiJsonResult result = ApiJsonResult.createFalied("权限校验失败，请稍后再试！");
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			//log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			int sendType = Integer.parseInt(reqMap.get("t"));
			String userid = pwduser.getUserId();
			String code = StringUtil.createRandom(true, 6);
			if (sendType == 1) {
				try {
					// 检测发送验证码次数，超过次数则不允许发送
					if (AppCache.userGetCodeRecord.containsKey(userid)) {
						int sendCount = AppCache.userGetCodeRecord.get(userid);
						int maxSend = Integer.parseInt(AppCache.getSystemParm(com.vinbet.mobile.util.Constants.SEND_CODE_COUNT));
						if (sendCount >= maxSend) {
							return ApiJsonResult.createFalied(i18n.get("msg.portal.sendCodeMore"));
						} else {
							int sended = AppCache.userGetCodeRecord.get(userid);
							AppCache.userGetCodeRecord.put(userid, sended + 1);
						}
					} else {
						AppCache.userGetCodeRecord.put(userid, 1);
					}
					String phoneFix = pwduser.getInterTelCode();
					String phoneNum = pwduser.getMobile();
					phoneCodeUtil.sendsms(phoneFix, phoneNum, code);
					AppCache.setPhonevCode(userid, phoneNum, code, System.currentTimeMillis());
				} catch (Exception e) {
					log.error("发送手机短信异常", e);
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else if (sendType == 2) {
				try {
					String mailAddress = pwduser.getEmail();
					// 发送邮件
					mailUtil.sendEmail(mailAddress, "", new HashMap<String, String>(), null==Mvcs.getLocalizationKey()?"zh":Mvcs.getLocalizationKey(), userid, code);
				} catch (Exception e) {
					log.error("发送邮件异常", e);
					return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
				}

			}
			HashMap<String, String> rsmap = new HashMap<String, String>();
			rsmap.put("uid", userid);
			//rsmap.put("code", code);
			apiJsonResult.setRec(rsmap);
			JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
			log.info("验证码:"+code);
			String rec = jsonObject.getString("rec");
			if (rec != null && !rec.equals("")) {
				rec = encryptUtil.encode(rec);
				jsonObject.put("rec", rec);
			}
			return jsonObject;
		} catch (Exception e) {
			log.error("调用手机端API[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}

	}
	
	
	/**
	 * 检查验证码(找回密码专用)
	 * 
	 * @param int sendType,String code
	 * @return
	 */
	@At("/findPwdVerifyCode")
	@Ok("json")
	public Object findPwdVerifyCode(String data, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		String facename = "findPwdVerifyCode";
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
		try {
			if (data == null || data.equals("")) {
				return ApiJsonResult.createFalied("参数为空,data");
			}
			if (session.getAttribute(Constants.RDM_KEY) == null) {
				ApiJsonResult result = ApiJsonResult.createFalied("验签失败，请重新认证！");
				result.setSt(5000080);
				return result;
			}
			UserInfo pwduser = (UserInfo) session.getAttribute(Constants.FINDPWD_SESSION);
			if(pwduser==null){
				ApiJsonResult result = ApiJsonResult.createFalied("权限校验失败，请稍后再试！");
				return result;
			}
			String userAgent = this.getUserAgent(request, session);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密前)请求报文" + data);
			EncryptUtil encryptUtil = (EncryptUtil) session.getAttribute(Constants.RDM_KEY);
			data = encryptUtil.decode(data);
			log.info(userAgent + "调用手机端接口[" + facename + "]，(解密后)请求报文" + data);
			// 把接收到的json报文转为Map
			HashMap<String, String> reqMap = createMap(data, "req");
			HashMap<String, String> recMap = createMap(data, "rec");
			int sendType = Integer.parseInt(reqMap.get("t"));
			String userid = pwduser.getUserId();
			String code = recMap.get("code");
			if (sendType == 1) {
				boolean result = AppCache.checkPhvCode(userid, pwduser.getMobile(), propertiesLoader.getLong("vinbet.email.expiredTime"), code);
				if (!result){
					return ApiJsonResult.createFalied(i18n.get("msg.portal.codeError"));
				}else{
					pwduser.setResetPwd(true);
				}
			} else if (sendType == 2) {
				String result = AppCache.checkEmailvCode(userid, propertiesLoader.getLong("vinbet.email.expiredTime"), code);
				if (result.equals("")) {
					return ApiJsonResult.createFalied(i18n.get("msg.portal.codeError"));
				}else{
					pwduser.setResetPwd(true);
				}
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[" + facename + "]接口处理异常.", e);
			return ApiJsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return apiJsonResult;
	}

	public static void main(String[] args) {
		UserInfo userInfo = new UserInfo();
		userInfo.setAccoutName("abcd");
		userInfo.setFundPwd("a111111");
		System.out.println(JSON.toJSONString(userInfo));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "abcd");
		map.put("pwd", "a111111");
		String mstr = JSON.toJSONString(map);
		System.out.println(mstr);
		Map<String, String> m = JSON.parseObject(mstr, new TypeReference<Map<String, String>>() {
		});
		System.out.println(m);
		UserInfo u = JSON.parseObject(mstr, UserInfo.class);
		System.out.println(u);
		System.out.println(m.get("name"));
		System.out.println(JSON.toJSONString(JsonResult.createSuccess()));
		JsonResult result = JsonResult.createFalied("用户名错误", "5000001");
		result.setData(map);
		List<UserInfo> userInfos = new ArrayList<UserInfo>();
		userInfos.add(userInfo);
		userInfos.add(u);
		result.setList(userInfos);
		System.out.println(JSON.toJSONString(result));
		System.out.println(JSON.toJSONString(ApiJsonResult.createFalied("fdf")));
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess("发单");
		apiJsonResult.setRec(userInfos);
		JSONObject jsonObject = (JSONObject) JSON.toJSON(apiJsonResult);
		System.out.println(jsonObject);
		String rec = jsonObject.getString("rec");
		System.out.println(rec + "==============>");
		JSONObject jo = new JSONObject();
		/*
		 * try { JSONArray ja = new JSONArray(); if (jo.getJSONObject("rec") != null) { ja.add(jo.getJSONObject("rec")); } jo.put("rec", ja); } catch
		 * (Exception e) { }
		 */
		String rec1 = jo.getString("rec");
		if (rec1 != null && !rec1.equals("")) {
			rec1 = AES.encryptToBase64(rec, RandomUtil.getRandom(16));
			jo.put("rec", rec1);
		}
		System.out.println(jo.toString());
		String xml = "{rec:{key3:'+86',key2:603518573,key1:620935244}}";
		System.out.println(ClientApiAction.createMap(xml, rec));
		String st = "VFRlRmRQa09PUWhJXW1Ia1FBXS1dQGtrXSlnZUllVTBOZ0lNR1EuQFBSX0VcZVFwTlZmLlhSRERSLWtKXExqLFVOSUpJUG8_TWY7RQlbaDAxVGg-NE9LajQF";
		System.out.println(BASE64Util.getFromBASE64(st));
	}

	public static HashMap<String, String> createMap(String data, String mapType) {
		try {
			// 接收到的数据url解码
			data = URLDecoder.decode(data, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 把json数据转换为map
		HashMap<String, String> reqMap = new HashMap<String, String>();
		HashMap<String, String> recMap = new HashMap<String, String>();
		Map<String, String> map = JSON.parseObject(data, new TypeReference<Map<String, String>>() {
		});
		for (String key : map.keySet()) {
			if (key.equals("rec")) {
				Map<String, String> tmpMap = JSON.parseObject(map.get(key), new TypeReference<Map<String, String>>() {
				});
				for (String tmpKey : tmpMap.keySet()) {
					recMap.put(tmpKey, tmpMap.get(tmpKey));
				}
			} else {
				reqMap.put(key, map.get(key));
			}
		}
		if (mapType.equals("req")) {
			return reqMap;
		} else {
			return recMap;
		}

	}

	static class MapComparator implements Comparator<Map<String, String>> {

		@Override
		public int compare(Map<String, String> o1, Map<String, String> o2) {
			String b1 = o1.get("prctm");
			String b2 = o2.get("prctm");
			if (b2 != null) {
				return b2.compareTo(b1);
			}
			return 0;
		}

	}

	/**
	 * 检测邮箱是否存在 o
	 * 
	 * @param userName
	 * @return
	 */
	public boolean checkEmailIsUsed(String email, HttpSession session) {
		boolean exist = false;// 默认表示存在该账号
		String faceName = "检测类checkInfo";
		if (email == null || email.equals("")) {
			return false;
		}
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("t", "5");// 操作说明 检测类接口 5、邮箱是否已被使用
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("eml", email);// email地址
			if (onlineUser != null) {
				recElm.addAttribute("uid", onlineUser.getUserId());// 用户ID
			}
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("checkInfo", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
					log.error("调用[platform]手机服务端[" + faceName + "]请求报文：" + xml + "接口返回数据:" + response);
				} else {
					int isexist = Integer.parseInt(root.attributeValue("isu"));// 是否使用
																				// 0、未使用
																				// 1、已使用
					if (isexist == 0) {
						exist = true;
					}
				}
			} else {
				log.error("调用[platform]手机服务端[" + faceName + "]请求报文：" + xml + "接口返回数据:" + response);
			}
		} catch (Exception e) {
			log.error("调用[platform]手机服务端[" + faceName + "]接口异常:" + e);
		}
		return exist;
	}

	/**
	 * 检测手机号码是否有注册记录
	 * 
	 * @param phoneNum
	 * @return
	 */
	public boolean checkPhoneExist(String phoneNum, HttpSession session) {
		if (phoneNum == null || phoneNum.equals("")) {
			return false;
		}
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		boolean exist = false;// 默认表示存在该账号
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		req.put("t", "6");// 操作说明 检测类接口 6、手机是否已被使用
		// 去掉加号
		phoneNum = phoneNum.replace("+", "").trim();
		rec.put("phnm", phoneNum);// 手机号码
		if (onlineUser != null) {
			rec.put("uid", onlineUser.getUserId());// 用户ID
		}

		CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec);
		if (checkInfo.getResultCode().equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
			int isexist = Integer.parseInt(checkInfo.getIsExist());// 是否使用 0、未使用
																	// 1、已使用
			if (isexist == 0) {
				exist = true;
			}
		}
		return exist;
	}

	public String getUserAgent(HttpServletRequest request, HttpSession session) {
		String userAgent = request.getHeader("User-Agent");
		if (userAgent != null && (userAgent.toLowerCase().contains("cfnetwork") || userAgent.toLowerCase().contains("iphone"))) {
			userAgent = "iOS=" + session.getId() + "=IP=" + getClientIp(request);
		} else if (userAgent != null && userAgent.toLowerCase().contains("android")) {
			userAgent = "Android=" + session.getId() + "=IP=" + getClientIp(request);
		} else if (userAgent == null) {
			userAgent = "无UA信息的设备" + session.getId();
		}
		return userAgent;
	}

}
