package com.vinbet.mobile.action.portal;

import java.text.MessageFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.ServerRedirectView;

import com.google.code.kaptcha.Constants;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.Register;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants.RegistSrc;
import com.vinbet.mobile.util.Constants.USER_OPT;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.MailUtil;
import com.vinbet.mobile.util.PhoneCodeUtil;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;

/**
 * 用户注册
 * 
 * @author jagger
 * 
 */
@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class RigisterAction extends CommonAction {
	private Log log = Logs.getLog(RigisterAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	@Inject
	private MailUtil mailUtil;
	@Inject
	private PhoneCodeUtil phoneCodeUtil;
	@Inject
	private UserServcieImpl userServcieImpl;

	/**
	 * TO账号注册
	 * 
	 * @return
	 */
	@At("/out/user/register")
	@Ok("jsp:page.portal.register")
	@Filters
	public Object register(String agentName, HttpSession session, HttpServletRequest request) {
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (user != null) {
			return new ServerRedirectView("/");
		}
		if (Mvcs.getLocalizationKey() == null) {
			Cookie cookie = super.getCookie(com.vinbet.mobile.util.Constants.COOKIE_LANGUAGE_KEY);
			if (cookie != null) {
				Mvcs.setLocalizationKey(cookie.getValue());
			} else {
				Mvcs.setLocalizationKey("zh");
			}
		}
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("pm", RSAUtil.publicModulusString);
		obj.put("pe", RSAUtil.publicExponentString);
		if (agentName == null || agentName.equals("")) {
			String serverName = request.getServerName();
			String seperator = "\\.";
			String[] resources = serverName.split(seperator);
			StringBuffer stringBuffer = new StringBuffer();
			if (resources.length > 3) {
				for (int i = 0; i < resources.length; i++) {
					if (i <= 2) {
						if (i != 0) {
							stringBuffer.append(resources[i]);
						}
						if (i != 2 && i != 0) {
							stringBuffer.append(".");
						}
					}
				}
			} else {
				stringBuffer = stringBuffer.append(serverName.substring(serverName.indexOf(".") + 1, serverName.length()));
			}

			HashMap<String, String> rec = new HashMap<String, String>();
			rec.put("dm", stringBuffer.toString());
			rec.put("pgnm", "1");
			rec.put("pgsz", "100");
			String reqXml = CreateXmlUtil.createPublicReqXML(null, rec);
			String resp = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("queryAgentDomain", reqXml);
			if (resp != null && resp.length() != 0) {
				try {
					Document dom = DocumentHelper.parseText(resp);
					Element root = dom.getRootElement();
					Element recElement = root.element("rec");
					if (recElement != null) {
						if (root.attributeValue("st").equals("1") && recElement.attributeValue("dmst").equals("1")) {
							agentName = recElement.attributeValue("acnt");
							String mnt = recElement.attributeValue("mnt");
							obj.put("mnt", mnt);
						}
					}
				} catch (DocumentException e) {
					log.error("解析代理的域名信息异常", e);
				}
			}
		}
		obj.put("agentName", agentName);
		return obj;
	}

	/**
	 * 执行注册
	 * 
	 * @param register
	 * @return
	 */
	@At("/out/user/regist")
	@Filters
	@Ok("json")
	public Object regist(@Param("..") Register register, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			String errorMsg = null;
			String surName = register.getSurName();
			String givenName = register.getGivenName();
			String trueName = surName + givenName;
			String currenytype = register.getCurrenytype();
			Map<String, Object> data = new HashMap<String, Object>();
			if (surName == null || surName.equals("") || givenName == null || givenName.equals("")) {
				errorMsg = i18n.get("msg.portal.trueNameRequired");
			} else if (trueName.length() > 12) {
				if (currenytype.equals("1")) {// 人民币
					errorMsg = MessageFormat.format(i18n.get("msg.portal.trueNameCHNLength"), 1, 12);
				} else if (trueName.length() > 60) {
					errorMsg = MessageFormat.format(i18n.get("msg.portal.trueNameLength"), 1, 60);
				}
			}
			if (errorMsg != null) {
				return JsonResult.createFalied(errorMsg);
			}
			String registeredIp = super.getClientIp(request);
			register.setRegisteredIp(registeredIp);
			if (register.getEmail() != null && !register.getEmail().equals("")) {
				register.setEmail(BASE64Util.getFromBASE64(register.getEmail()));
			}
			if (register.getPhoneNum() != null && !register.getPhoneNum().equals("")) {
				register.setPhoneNum(BASE64Util.getFromBASE64(register.getPhoneNum()));
			}
			// 检测用户名、手机号、邮箱等是否重复
			JsonResult jr = checkInfo(register, i18n, session);
			if (jr != null) {
				return jr;
			}
			// 组装报文
			String reqXml = resultXml(register, i18n, USER_OPT.OPT_SAVE.getCode());
			if (reqXml == null || reqXml.equals("")) {
				return JsonResult.createFalied(i18n.get("msg.portal.message.operateFail"));
			}
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("cashUserRegister", reqXml);

			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String remsg = root.attributeValue("msg");
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {

					log.error("调用[CEP]用户中心[用户注册cashUserRegister]接口返回数据:" + remsg);
					if (resultCode.equals(com.vinbet.mobile.util.Constants.USER_NAMESOME)) {
						errorMsg = i18n.get("msg.portal.userNameUsed");
					} else if (resultCode.equals(com.vinbet.mobile.util.Constants.NO_AGENTNAME)) {
						errorMsg = i18n.get("msg.portal.agentNameNotExist");
					} else {
						errorMsg = i18n.get("msg.portal.registFailed");
					}
					return JsonResult.createFalied(errorMsg);
				} else {
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						Element reqElm = (Element) childNodes.get(0);
						String userId = reqElm.attributeValue("uid");
						data.put("userId", userId);
						jsonResult.setData(data);
					} else {
						log.error("调用[CEP]用户中心[用户查询cashUserRegister]请求报文：" + reqXml + ",接口返回数据:" + response.replace("\n", ""));
					}
					register.setRegisteredIp(registeredIp);
					register.setJoinDate(DateUtil.getDate(new Date()));
					// OrderRecorder.recordUser(register);
				}
			} else {
				log.error("调用[CEP]用户中心[用户注册cashUserRegister]请求报文：" + reqXml + "接口返回数据为空.");
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (Exception e) {
			log.error("调用[CEP]用户中心[用户注册cashUserRegister]接口处理异常.", e);
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}

	private JsonResult checkInfo(Register register, Map<String, String> i18n, HttpSession session) {
		if (register.getUserName() != null && !register.getUserName().equals("")) {
			boolean userExist = checkUserName(register.getUserName(), "4");
			if (!userExist) {
				return JsonResult.createFalied(i18n.get("msg.portal.userNameUsed"));
			}
		}
		if (register.getPhoneNum() != null && !register.getPhoneNum().equals("")) {
			boolean phoneExist = checkPhoneExist(register.getPhoneNum(), session);
			if (!phoneExist) {
				return JsonResult.createFalied(i18n.get("msg.portal.mobileUsed"));
			}
		}
		if (register.getEmail() != null && !register.getEmail().equals("")) {
			boolean emailExist = checkEmailIsUsed(register.getEmail(), session);
			if (!emailExist) {
				return JsonResult.createFalied(i18n.get("msg.portal.emailExist"));
			}
		}
		return null;
	}

	private String resultXml(Register register, Map<String, String> i18n, int saveOrUpdate) {
		// 拼装返回结果 int saveOrUpdate 1、新增 2修改
		Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
		Element rootElm = outDoc.addElement("req");
		rootElm.addAttribute("opt", saveOrUpdate + "");
		Element recElm = rootElm.addElement("rec");
		try {
			recElm.addAttribute("mnt", register.getCurrenytype());// 货币单位
			recElm.addAttribute("ntlty", register.getCountry());// 国籍
			recElm.addAttribute("unm", register.getUserName());// 用户名
			if (register.isPwdRsaFlag()) {
				String pwd = RSAUtil.decrypt(register.getPassword().trim());
				recElm.addAttribute("upwd", MD5Util.md5(pwd));// 密码
			} else {
				recElm.addAttribute("upwd", register.getPassword().trim());
			}
			// recElm.addAttribute("nm", register.getTrueName());//姓名
			recElm.addAttribute("lstnm", register.getSurName());// 姓
			recElm.addAttribute("fstnm", register.getGivenName());// 名
			recElm.addAttribute("lv", com.vinbet.mobile.util.Constants.USERLV_CONFIRMED + "");// 用户级别
																								// 待定
			String agentName = register.getAgentName();
			recElm.addAttribute("rfe", agentName);// 推荐人
			recElm.addAttribute("regip", register.getRegisteredIp());// 注册IP
			recElm.addAttribute("ust", USER_STATUS.USERSTATUS_NORMAL.getCode() + "");// 用户状态
																						// 正常
			recElm.addAttribute("bthdy", register.getBirthdate());// 生日
			recElm.addAttribute("sex", register.getSex());// 性别
			recElm.addAttribute("arcd", register.getPhoneFix());// 手机前缀
			recElm.addAttribute("phnm", register.getPhoneNum());// 手机号
			recElm.addAttribute("eml", register.getMailAddress());// 邮箱
			recElm.addAttribute("rgsrc", RegistSrc.H5.getVal());// 注册来源 1-手机端H5
			// 设置默认应用
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
			recElm.addAttribute("appauth", appAuth);// 导航菜单栏
		} catch (Exception e) {
			log.error("组装[用户注册cashUserRegister]接口报文处理异常.", e);
			return null;
		}
		return outDoc.asXML();
	}

	/**
	 * 发送验证码
	 * 
	 * @param register
	 * @return
	 */
	@At("/out/user/sendCode")
	@Ok("json")
	public Object sendCode(@Param("..") Register register, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		int sendType = Integer.parseInt(register.getSendType());
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String userid = "";
		if (onlineUser != null) {
			userid = onlineUser.getUserId();
		} else {
			userid = register.getUserid();
		}
		if (sendType == 1) {
			try {
				// 检测发送验证码次数，超过次数则不允许发送
				if (AppCache.userGetCodeRecord.containsKey(onlineUser.getUserId())) {
					int sendCount = AppCache.userGetCodeRecord.get(onlineUser.getUserId());
					int maxSend = Integer.parseInt(AppCache.getSystemParm(com.vinbet.mobile.util.Constants.SEND_CODE_COUNT));
					if (sendCount >= maxSend) {
						return JsonResult.createFalied(i18n.get("msg.portal.sendCodeMore"));
					} else {
						int sended = AppCache.userGetCodeRecord.get(onlineUser.getUserId());
						AppCache.userGetCodeRecord.put(onlineUser.getUserId(), sended + 1);
					}
				} else {
					AppCache.userGetCodeRecord.put(onlineUser.getUserId(), 1);
				}
				String phoneFix = register.getPhoneFix();
				String phoneNum = register.getPhoneNum();
				String code = StringUtil.createRandom(true, 6);
				phoneCodeUtil.sendsms(phoneFix, phoneNum, code);
				AppCache.setPhonevCode(userid, phoneNum, code, System.currentTimeMillis());
			} catch (Exception e) {
				log.error("发送手机短信异常", e);
			}
		} else if (sendType == 2) {
			try {
				String mailAddress = register.getMailAddress();
				String code = StringUtil.createRandom(true, 6);
				// 发送邮件
				mailUtil.sendEmail(mailAddress, "", new HashMap<String, String>(), Mvcs.getLocalizationKey(), userid, code);
			} catch (Exception e) {
				log.error("发送邮件异常", e);
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}

		}

		return jsonResult;
	}

	/**
	 * 检查验证码
	 * 
	 * @param register
	 * @return
	 */
	@At("/out/user/verifyCode")
	@Ok("json")
	public Object verifyCode(@Param("..") Register register, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		long sendType = Integer.parseInt(register.getSendType());
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String userid = "";
		if (onlineUser != null) {
			userid = onlineUser.getUserId();
		} else {
			userid = register.getUserid();
		}
		if (sendType == 1) {
			boolean result = AppCache.checkPhvCode(userid, register.getPhoneNum(), propertiesLoader.getLong("vinbet.email.expiredTime"), register.getPhoneCode());
			if (result) {
				HashMap<String, String> req = new HashMap<String, String>();
				HashMap<String, String> rec = new HashMap<String, String>();
				req.put("t", "1");// 操作说明 1、绑定2、变更
				rec.put("uid", userid);
				rec.put("utyp", "1");// 用户类型 1、现金用户 2、信用用户
				rec.put("phnm", register.getPhoneNum());
				rec.put("arcd", register.getPhoneFix());
				String xml = CreateXmlUtil.createPublicReqXML(req, rec);
				try {
					String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("bindingPhoneNum", xml);
					if (response != null && !response.equals("")) {
						Document doc = DocumentHelper.parseText(response);
						Element root = doc.getRootElement();
						String resultCode = root.attributeValue("st");
						if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
							log.error("调用[platform]手机服务端[绑定邮箱bindingEmail]请求报文：" + xml + "接口返回数据:" + response);
							return JsonResult.createFalied(i18n.get("msg.common.systemError"));
						} else {
							log.info("帐号-->" + register.getUserid() + "激活成功");
							onlineUser.setUserStatus(USER_STATUS.USERSTATUS_NORMAL.getCode());
							onlineUser.setMobile(register.getPhoneNum());
							onlineUser.setInterTelCode(register.getPhoneFix());
						}
					} else {
						log.error("调用[platform]手机服务端[绑定邮箱bindingEmail]请求报文：" + xml + "接口返回数据:" + response);
					}
				} catch (DocumentException e) {
					log.error("检查验证码异常！" + e);
					return JsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
			} else {
				return JsonResult.createFalied(i18n.get("msg.portal.codeError"));
			}
		} else if (sendType == 2) {
			String result = AppCache.checkEmailvCode(userid, propertiesLoader.getLong("vinbet.email.expiredTime"), register.getMailCode());
			if (result.equals("")) {
				return JsonResult.createFalied(i18n.get("msg.portal.codeError"));
			} else {
				try {
					Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
					Element rootElm = outDoc.addElement("req");
					rootElm.addAttribute("t", "2");// 操作说明 2、绑定3、变更
					Element recElm = rootElm.addElement("rec");
					recElm.addAttribute("uid", userid);// 用户ID
					recElm.addAttribute("utyp", "1");// 用户类型 1、现金用户 2、信用用户
					recElm.addAttribute("eml", result);// 邮箱地址
					String xml = outDoc.asXML();
					String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("bindingEmail", xml);
					if (response != null && !response.equals("")) {
						Document doc = DocumentHelper.parseText(response);
						Element root = doc.getRootElement();
						String resultCode = root.attributeValue("st");
						if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
							log.error("调用[platform]手机服务端[绑定邮箱bindingEmail]请求报文：" + xml + "接口返回数据:" + response);
							return JsonResult.createFalied(i18n.get("msg.common.systemError"));
						} else {
							log.info("帐号-->" + register.getUserid() + "激活成功");
							onlineUser.setUserStatus(USER_STATUS.USERSTATUS_NORMAL.getCode());
							onlineUser.setEmail(register.getMailAddress());
						}
					} else {
						log.error("调用[platform]手机服务端[绑定邮箱bindingEmail]请求报文：" + xml + "接口返回数据:" + response);
					}
				} catch (Exception e) {
					log.error("检查验证码异常！" + e);
					return JsonResult.createFalied(i18n.get("msg.common.systemError"));
				}

			}
		}

		return jsonResult;
	}

	/**
	 * 检测用户名是否存在 o
	 * 
	 * @param userName
	 * @return
	 */
	@At("/out/user/checkUserName")
	@Filters
	@Ok("raw")
	public boolean checkUserName(String userName, String userType) {
		boolean exist = false;// 默认表示存在该账号
		if (userName == null || userName.equals("") || userType == null || userType.equals("")) {
			return false;
		}
		try {
			if (userType.equals("4")) {
				Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
				Element rootElm = outDoc.addElement("req");
				rootElm.addAttribute("t", userType);// 操作说明 检测类接口 4、用户名是否存在
													// 18检查推广的帐号是否重复
				Element recElm = rootElm.addElement("rec");
				recElm.addAttribute("unm", userName);// 用户ID
				recElm.addAttribute("utyp", com.vinbet.mobile.util.Constants.USERTYPE_CASH);// 用户类型 1、现金用户 2、信用用户
				String xml = outDoc.asXML();
				String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("checkInfo", xml);
				if (response != null && !response.equals("")) {
					Document doc = DocumentHelper.parseText(response);
					Element root = doc.getRootElement();
					String resultCode = root.attributeValue("st");
					if (!resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
						log.error("调用[platform]手机服务端[checkInfo]请求报文：" + xml + "接口返回数据:" + response);
					} else {
						int isexist = Integer.parseInt(root.attributeValue("isu"));// 是否使用 0、未使用 1、已使用
						if (isexist == 0) {
							exist = true;
						}
					}
				} else {
					log.error("调用[platform]手机服务端[checkInfo]请求报文：" + xml + "接口返回数据:" + response);
				}
			} else {

				HashMap<String, String> req = new HashMap<String, String>();
				HashMap<String, String> rec = new HashMap<String, String>();
				rec.put("acunt", userName);// 推广编号
				rec.put("pgnm", "1");// 第几页
				rec.put("pgsz", "10");// 页大小
				String xml = CreateXmlUtil.createPublicReqXML(req, rec);
				String acunt = "";
				try {
					String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("queryExpandAgent", xml);
					if (response != null && !response.equals("")) {
						Document doc = DocumentHelper.parseText(response);
						Element root = doc.getRootElement();
						String resultCode = root.attributeValue("st");
						if (resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
							List<Element> childNodes = root.elements();
							for (int i = 0; i < childNodes.size(); i++) {
								Element reqElm = childNodes.get(0);
								acunt = reqElm.attributeValue("acunt");
								if (acunt != null && !acunt.equals("")) {
									exist = true;
								}
							}
						}
					}
				} catch (DocumentException e) {
					e.printStackTrace();
				}
			}

		} catch (Exception e) {
			log.error("调用[platform]手机服务端[绑定邮箱checkInfo]接口异常:" + e);
		}
		return exist;
	}

	/**
	 * 检测邮箱是否存在 o
	 * 
	 * @param userName
	 * @return
	 */
	@At("/out/user/checkEmailIsUsed")
	@Filters
	@Ok("raw")
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
				//recElm.addAttribute("uid", onlineUser.getUserId());// 用户ID
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
					int isexist = Integer.parseInt(root.attributeValue("isu"));// 是否使用 // 0、未使用 // 1、已使用
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
	 * 代理币种
	 * 
	 * @param session
	 * @return
	 */
	@At("/out/user/getAgentCurrency")
	@Filters
	@Ok("raw")
	public String getAgentCurrency(String agentName) {
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		rec.put("acunt", agentName);// 登录名
		rec.put("pgnm", "1");// 第几页
		rec.put("pgsz", "10");// 页大小
		String xml = CreateXmlUtil.createPublicReqXML(req, rec);
		String mnt = "";
		try {
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("queryExpandAgent", xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
					List<Element> childNodes = root.elements();
					for (int i = 0; i < childNodes.size(); i++) {
						Element reqElm = childNodes.get(i);
						mnt = reqElm.attributeValue("mnt");
					}
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return mnt;
	}

	/**
	 * 检测手机号码是否有注册记录
	 * 
	 * @param phoneNum
	 * @return
	 */
	@At("/out/user/checkPhoneExist")
	@Filters
	@Ok("raw")
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
			//rec.put("uid", onlineUser.getUserId());// 用户ID
		}

		CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec);
		if (checkInfo.getResultCode().equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
			int isexist = Integer.parseInt(checkInfo.getIsExist());// 是否使用 0、未使用 1、已使用
			if (isexist == 0) {
				exist = true;
			}
		}
		return exist;
	}

	/**
	 * 验证校验码
	 * 
	 * @param session
	 * @return
	 */
	@At("/out/user/checkSecurityCode")
	@Filters
	@Ok("raw")
	public boolean checkSecurityCode(String scode, HttpSession session) {
		String vcode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (scode == null || !scode.trim().equalsIgnoreCase(vcode)) {
			return false;
		}
		return true;
	}
}
