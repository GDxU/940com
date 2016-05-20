package com.vinbet.mobile.action.portal;

import java.text.MessageFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.ForwardView;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ServerRedirectView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.google.code.kaptcha.Constants;
import com.vinbet.mobile.domain.HkcUser;
import com.vinbet.mobile.domain.QxcUser;
import com.vinbet.mobile.domain.SportUser;
import com.vinbet.mobile.domain.SscUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.GetAppAuthUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.RSAUtil;

@IocBean(singleton = false)
public class LoginAction extends CommonAction {
	private static final Logger log = LogManager.getLogger(LoginAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private UserServcieImpl userServcieImpl;

	@At({ "/", "/index" })
	@Ok("jsp:page.index")
	public Object index(HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		// //obj.put("pm", RSAUtil.publicModulusString);
		// //obj.put("pe", RSAUtil.publicExponentString);
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		obj.put("pf", propertiesLoader.getInt("vinbet.platform.status", 0));
		if (Mvcs.getLocalizationKey() == null) {
			Cookie cookie = super.getCookie(com.vinbet.mobile.util.Constants.COOKIE_LANGUAGE_KEY);
			if (cookie != null) {
				Mvcs.setLocalizationKey(cookie.getValue());
			} else {
				Mvcs.setLocalizationKey("zh");
			}
		}
		String indexApp = GetAppAuthUtil.getIndexApp(onlineUser);

		obj.put("indexApp", indexApp);
		return obj;
	}

	@At("/timeout")
	@Ok("jsp:page.relogin")
	public void timeout() {
	}

	// 平台登陆
	@At("/login")
	@Ok("jsp:page.login")
	public Object login() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		// obj.put("pm", RSAUtil.publicModulusString);
		// obj.put("pe", RSAUtil.publicExponentString);
		obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
		obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
		obj.put("ssoServiceId", propertiesLoader.getTrim("vinbet.sso.serviceid"));
		// obj.put("mobileUrl",
		// propertiesLoader.getTrim("vinbet.sso.mobileUrl"));
		return obj;
	}

	@At("/dologin")
	@Ok("json")
	@Deprecated
	public JsonResult doLogin(@Param("vcode") String vc, @Param("username") String username, @Param("password") String password, String pm, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			String clientIp = this.getClientIp(request);
			// 检验登录参数
			String vcode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if (username == null || password == null) {
				return new JsonResult(1, "用户名或密码不能为空！", null);
			} else {
				username = username.trim();
				password = password.trim();
			}
			if (vc == null || !vc.trim().equalsIgnoreCase(vcode)) {
				return new JsonResult(2, i18n.get("msg.portal.checkCodeError"), null);// 验证码输入错误!
			}

			try {
				password = RSAUtil.decrypt(password);
			} catch (Exception e) {
				log.error("RSAUtil解码失败,用户名:" + username + ",密文:" + password, e);
			}
			// 检测登录失败次数,登录失败次数过多被系统锁定，请联系客服或半小时后重试！
			if (AppCache.userLoginFailedRecord.containsKey(username)) {
				int failedCount = AppCache.userLoginFailedRecord.get(username);
				if (failedCount >= 5) {
					return new JsonResult(3, MessageFormat.format(i18n.get("msg.portal.loginFailMore"), username), null);
				}
			}
			// 调用平台接口验证用户名和密码
			String url = propertiesLoader.getTrim("vinbet.platform.url") + "/enet-login!mobileLogin.shtml";
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("Username", username);
			parameters.put("Password", password);
			String res = HttpClientUtil.doPostString(url, parameters);
			// 成功,<response><login>true</login><userexternalid>540258</userexternalid><username>TestLimi</username></response>
			// 失败,<response><login>false</login><userexternalid>000000</userexternalid><username>TestLimi</username></response>
			Element element = DocumentHelper.parseText(res).getRootElement();
			boolean isLogin = Boolean.parseBoolean(element.elementText("login"));
			if (isLogin) {
				String returnName = element.elementText("username");
				UserInfo userInfo = userServcieImpl.getUserInfo(returnName, 0);
				if (userInfo.getUserStatus() == 2) {// 注销状态
					return new JsonResult(5, i18n.get("msg.portal.userDisabled"), null);
				}
				// userInfo.setAccoutName(returnName);
				userInfo.setLoginIp(clientIp);
				userInfo.setLoginTime(DateUtil.getDateTime(new Date()));
				userInfo.setAccessibleApps(this.getAccessibleApps(userInfo.getCurrencyType()));
				userInfo.setCurrencyName(super.getDictVal("dict.curency.type.mark", String.valueOf(userInfo.getCurrencyType()), request));
				session.setAttribute(com.vinbet.mobile.util.Constants.USER_SESSION, userInfo);
				// 检测用户是否已经在线
				HttpSession existSession = AppCache.onlineUsers.get(username);
				if (existSession != null && !existSession.getId().equals(session.getId())) {
					// existSession.setAttribute("logout", "passive");
					log.info("用户[" + userInfo.getAccoutName() + "]在其它终端登录,被强制退出.");
					try {
						existSession.removeAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
						existSession.removeAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
						existSession.removeAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
					} catch (Exception e) {
					}
					// existSession.invalidate();
				}
				AppCache.onlineUsers.put(username, session);
				// 清除失敗記錄
				if (AppCache.userLoginFailedRecord.containsKey(username)) {
					AppCache.userLoginFailedRecord.remove(username);
				}
				log.info("用户[" + userInfo.getAccoutName() + "]在[" + clientIp + "]登录成功.");
			} else {
				// 记录登录失败次数
				if (AppCache.userLoginFailedRecord.containsKey(username)) {
					int failedCount = AppCache.userLoginFailedRecord.get(username);
					AppCache.userLoginFailedRecord.put(username, failedCount + 1);
				} else {
					AppCache.userLoginFailedRecord.put(username, 1);
				}
				if (pm != null && !pm.equals(RSAUtil.publicModulusString)) {
					return new JsonResult(6, i18n.get("msg.portal.plsTryLogin"), null);// 登录页面强制刷新一次
				} else {
					return new JsonResult(4, i18n.get("msg.portal.plsTryLogin"), null);// 用户名或密码错误，请重新登录！
				}
			}
		} catch (Exception e) {
			log.error("用户登录失败,系统异常", e);
			return new JsonResult(10, i18n.get("msg.common.systemError"), null);// "系统异常，请联系客服！"
		}
		return jsonResult;
	}

	/**
	 * 跳转到时时彩应用
	 * <ul>
	 * <li>2锁定状态时，提示"您的用户状态已经被锁定，请联系上级"</li>
	 * <li>3禁止状态时，提示"您的用户状态已经被禁止，请联系上级"</li>
	 * <li>4停押状态时，用户可进入系统，不允许下注，下注时提示"您的用户状态已经被停押，请联系上级"</li>
	 * </ul>
	 * <p>
	 * 新平台版本修改为用户状态从SSO中获取,0-未激活（默认）、1-正常、2-锁定 、3-冻结、4-注销
	 * <p>
	 * 
	 * @param session
	 * @return
	 */
	@At("/ssc")
	@Filters(@By(type = AppStatusCheckFilter.class))
	public View toSSC(HttpSession session, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo == null) {
			HashMap<String, Object> obj = new HashMap<String, Object>();
			// obj.put("pm", RSAUtil.publicModulusString);
			// obj.put("pe", RSAUtil.publicExponentString);
			obj.put("refer", "ssc");
			obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
			obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
			obj.put("ssoServiceId", propertiesLoader.getTrim("vinbet.sso.serviceid"));
			return new ViewWrapper(new JspView("page.login"), obj);
		}
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/userInfo").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userName", userInfo.getAccoutName());
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
					log.info("用户[" + userInfo.getAccoutName() + "]登录时时彩失败，原因：用户在时时彩系统不存在.");
					return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问时时彩的权限，请联系上级！");
				}
				JSONObject userAccount = JSON.parseObject(jsonObject.get("UserAccount").toString());
				// 信用用户暂时不能登录
				int userType = userAccount.getIntValue("accountType");
				// if (userType != 1) {
				// log.info("用户[" + userInfo.getAccoutName() +
				// "]登录时时彩失败，原因：非现金用户.");
				// return new ViewWrapper(new JspView("page.tips"),
				// "当前用户没有访问时时彩的权限，请联系上级！");
				// }
				/**
				 * int status = userAccount.getIntValue("status");//
				 * 1正常、2锁定、3禁用、4停押 // 被锁定的情况 if (status == 2) { log.info("用户[" +
				 * userInfo.getAccoutName() + "]登录时时彩失败，原因：用户被上级锁定."); return
				 * new ViewWrapper(new JspView("page.tips"),
				 * "您的用户状态已经被锁定，请联系上级!"); } // 禁止状态 else if (status == 3) {
				 * log.info("用户[" + userInfo.getAccoutName() +
				 * "]登录时时彩失败，原因：用户被上级禁止."); return new ViewWrapper(new
				 * JspView("page.tips"), "您的用户状态已经被禁止，请联系上级!"); }
				 */
				// 非会员不能登录
				int userLevel = userAccount.getIntValue("usertypes");
				if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
					log.info("用户[" + userInfo.getAccoutName() + "]登录时时彩失败，原因：用户非会员身份.");
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
				sscUser.setStatus(userInfo.getUserStatus());
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
	}

	/**
	 * 跳转到香港彩应用
	 * 
	 * @param session
	 * @return
	 */
	@At("/hkc")
	@Filters(@By(type = AppStatusCheckFilter.class))
	public View toHKC(HttpSession session, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo == null) {
			HashMap<String, Object> obj = new HashMap<String, Object>();
			// obj.put("pm", RSAUtil.publicModulusString);
			// obj.put("pe", RSAUtil.publicExponentString);
			obj.put("refer", "hkc");
			obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
			obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
			obj.put("ssoServiceId", propertiesLoader.getTrim("vinbet.sso.serviceid"));
			return new ViewWrapper(new JspView("page.login"), obj);
		}
		try {
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.hkc.url")).append("/memberinfo").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("name", userInfo.getAccoutName());
			parameters.put(com.vinbet.mobile.util.Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.hkc")));
			JSONObject jsonObject = HttpClientUtil.doGet(url, parameters, false);
			if (jsonObject != null) {
				String code = jsonObject.getString("code");
				// 失败
				if (!code.equals("10000")) {
					String desc = jsonObject.getString("description");
					if (desc.equals("用户不存在~")) {
						log.info("用户[" + userInfo.getAccoutName() + "]登录[HKC]失败，原因：用户在[HKC]系统不存在.");
						return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问新香港彩的权限，请联系上级！");
					} else {
						log.error("用户登录时调用[HKC]手机服务端[memberinfo]接口返回数据异常,response << " + jsonObject.toJSONString());
						return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
					}
				}
				// 成功
				else {
					JSONObject member = jsonObject.getJSONObject("member");
					int status = userInfo.getUserStatus();
					/**
					 * int status = member.getIntValue("status");// 状态 1 正常、 2
					 * 锁定、 3 禁用、4:冻结
					 * 
					 * // 被锁定的情况 if (status == 2) { log.info("用户[" +
					 * userInfo.getAccoutName() + "]登录[HKC]失败，原因：用户被上级锁定.");
					 * return new ViewWrapper(new JspView("page.tips"),
					 * "您的用户状态已经被锁定，请联系上级!"); } // 禁止状态 else if (status == 3) {
					 * log.info("用户[" + userInfo.getAccoutName() +
					 * "]登录[HKC]失败，原因：用户被上级禁止."); return new ViewWrapper(new
					 * JspView("page.tips"), "您的用户状态已经被禁止，请联系上级!"); }
					 */
					int userLevel = member.getIntValue("usertypes");// 用户级别，6：会员，7：直属会员
					if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
						log.info("用户[" + userInfo.getAccoutName() + "]登录[HKC]失败，原因：用户非会员身份.");
						return new ViewWrapper(new JspView("page.tips"), "您的用户层级非会员，不能登录!");
					}
					String accoutName = member.getString("name");
					String userName = member.getString("username");
					double credits = member.getDoubleValue("credits");// 信用额
					double balance = member.getDoubleValue("avacredits");// 可用额度
					int accountType = member.getIntValue("accountType");// 用户类型:1现金、0信用
					String handype = member.getString("handype");// 1,2,3,4
					HkcUser hkcUser = new HkcUser();
					hkcUser.setAccoutName(accoutName);
					hkcUser.setUserName(userName);
					hkcUser.setBalance(balance);
					hkcUser.setCredits(credits);
					hkcUser.setHandype(handype);
					hkcUser.setUserLevel(userLevel);
					hkcUser.setStatus(status);
					// userInfo.setUserType(accountType);
					// 处理用户盘差
					if (jsonObject.get("rateDiffs") != null) {
						Map<String, Map<String, Object>> rateDiffs = JSON.parseObject(jsonObject.getString("rateDiffs"), new TypeReference<Map<String, Map<String, Object>>>() {
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
		// return new ServerRedirectView("/hkc/hkmenu");
		return new ForwardView("/hkc/hkmenu");
	}

	/**
	 * 跳转到七星彩应用
	 * 
	 * @param session
	 * @return
	 */
	@At("/qxc")
	@Filters(@By(type = AppStatusCheckFilter.class))
	public View toQXC(HttpSession session, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo == null) {
			HashMap<String, Object> obj = new HashMap<String, Object>();
			// //obj.put("pm", RSAUtil.publicModulusString);
			// //obj.put("pe", RSAUtil.publicExponentString);
			obj.put("refer", "qxc");
			obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
			obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
			obj.put("ssoServiceId", propertiesLoader.getTrim("vinbet.sso.serviceid"));
			return new ViewWrapper(new JspView("page.login"), obj);
		}
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.qxc.url")).append("/memberinfo").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("name", userInfo.getAccoutName());
		parameters.put(com.vinbet.mobile.util.Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		JSONObject jsonObject = null;
		try {
			jsonObject = HttpClientUtil.doGet(url, parameters);
			// System.out.println(HttpClientUtil.doGetString(url, parameters));
			if (jsonObject != null && jsonObject.size() != 0) {
				String code = jsonObject.getString("code");
				if (!"10000".equals(code)) {
					log.info("用户[" + userInfo.getAccoutName() + "]登录[QXC]失败，原因：用户在七星彩系统不存在.");
					return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问七星彩的权限，请联系上级！");
				}
				JSONObject userAccount = JSON.parseObject(jsonObject.get("member").toString());
				// 信用用户暂时不能登录
				int userType = userAccount.getIntValue("accountType");
				if (userType != 1) {
					log.info("用户[" + userInfo.getAccoutName() + "]登录[QXC]失败，原因：非现金用户.");
					return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问七星彩的权限，请联系上级！");
				}
				/**
				 * int status = userAccount.getIntValue("status");// 状态 1 正常、 2
				 * 锁定、 3 禁用、4:冻结 // 被锁定的情况 if (status == 2) { log.info("用户[" +
				 * userInfo.getAccoutName() + "]登录[QXC]失败，原因：用户被上级锁定."); return
				 * new ViewWrapper(new JspView("page.tips"),
				 * "您的用户状态已经被锁定，请联系上级!"); } // 禁止状态 else if (status == 3) {
				 * log.info("用户[" + userInfo.getAccoutName() +
				 * "]登录[QXC]失败，原因：用户被上级禁止."); return new ViewWrapper(new
				 * JspView("page.tips"), "您的用户状态已经被禁止，请联系上级!"); }
				 */
				int userLevel = userAccount.getIntValue("usertypes");// 用户级别，6：会员，7：直属会员
				if (userLevel != 6 && userLevel != 7 && userLevel != 9) {
					log.info("用户[" + userInfo.getAccoutName() + "]登录[QXC]失败，原因：用户非会员身份.");
					return new ViewWrapper(new JspView("page.tips"), "您的用户层级非会员，不能登录!");
				}
				QxcUser qxcUser = new QxcUser();
				qxcUser.setAccoutName(userAccount.getString("name"));
				qxcUser.setUserName(userAccount.getString("username"));
				qxcUser.setBalance(userAccount.getDoubleValue("avacredits"));
				qxcUser.setCredits(userAccount.getDoubleValue("credits"));
				// 格式为handype: "1,2"
				qxcUser.setHandype(userAccount.getString("handype"));
				session.setAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION, qxcUser);
			} else {
				log.error("登录时调用七星彩手机服务端[userInfo]接口返回数据为空,response << " + (null == jsonObject ? null : jsonObject.toJSONString()));
				return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("登录时调用七星彩手机服务端[userInfo]接口返回数据格式异常,response << " + (null == jsonObject ? null : jsonObject.toJSONString()), e);
			return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
		}
		// return new ServerRedirectView("/qxc/qxcmenu");
		return new ForwardView("/qxc/qxcmenu");
	}

	/**
	 * 跳转到体育投注
	 */
	@At("/toSport")
	public View toSport(HttpSession session, HttpServletRequest request) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo == null) {
			HashMap<String, Object> obj = new HashMap<String, Object>();
			// obj.put("pm", RSAUtil.publicModulusString);
			// obj.put("pe", RSAUtil.publicExponentString);
			obj.put("refer", "toSport");
			obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
			obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
			obj.put("ssoServiceId", propertiesLoader.getTrim("vinbet.sso.serviceid"));
			return new ViewWrapper(new JspView("page.login"), obj);
		}
		try {
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.login.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("loginName", userInfo.getAccoutName());
			// parameters.put("loginName", "cat02");
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put(com.vinbet.mobile.util.Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
			String xmlResp = HttpClientUtil.doGetString(url, parameters);
			if (xmlResp != null) {
				Document doc = DocumentHelper.parseText(xmlResp);
				Element element = doc.getRootElement();
				// 登录状态 1：成功 0失败
				int loginStatus = Integer.parseInt(element.attributeValue("status"));
				if (loginStatus == 0) {
					log.info("用户[" + userInfo.getAccoutName() + "]登录[Sport]失败，原因：用户在[Sport]系统不存在.");
					return new ViewWrapper(new JspView("page.tips"), "当前用户没有访问体育投注的权限，请联系上级！");
				} else {
					/**
					 * int userStatus =
					 * Integer.parseInt(element.attributeValue("ustutas"));//
					 * 用户状态 if (userStatus == 2) { log.info("用户[" +
					 * userInfo.getAccoutName() + "]登录[Sport]失败，原因：用户被上级停用.");
					 * return new ViewWrapper(new JspView("page.tips"),
					 * "您的用户状态已经被停用，请联系上级!"); }
					 */
					String remark = element.attributeValue("remark");// 失败原因
					String account = element.attributeValue("uaccount");// 账号名称
					String uid = element.attributeValue("uid");// 账号ID
					double diff = Double.parseDouble(element.attributeValue("float"));// 浮动值1
					double diff2 = Double.parseDouble(element.attributeValue("float1"));// 浮动值2
					String userName = element.attributeValue("uname");// 用户昵称
					String currency = element.attributeValue("currency");// 币种
					double balance = Double.parseDouble(element.attributeValue("money"));// 余额
					String group = element.attributeValue("group");// 群组
					SportUser sportUser = new SportUser();
					sportUser.setUserIdInSport(uid);
					sportUser.setAccoutName(userInfo.getAccoutName());
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
		// return new ServerRedirectView("/sport");
		return new ForwardView("/sport");
	}

	@At("/logout")
	public View logout(HttpSession session) {
		String lng = Mvcs.getLocalizationKey();
		session.setAttribute("logout", "initiative");
		session.invalidate();
		Mvcs.setLocalizationKey(lng);
		return new ServerRedirectView("/");
	}

	private Map<String, String> getAccessibleApps(int currencyType) {
		Map<String, String> ids = new LinkedHashMap<String, String>();
		try {
			String[] appids = propertiesLoader.getTrim("vinbet.access.appids_" + currencyType).split(";");
			for (int i = 0; i < appids.length; i++) {
				ids.put(appids[i].split(":")[1], appids[i].split(":")[0]);
			}
		} catch (Exception e) {
			log.error("系统没有配置币种[" + currencyType + "]可以访问的appids:", e);
		}
		return ids;
	}
}
