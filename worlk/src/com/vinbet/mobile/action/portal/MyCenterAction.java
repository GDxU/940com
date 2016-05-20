package com.vinbet.mobile.action.portal;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.FreezeCount;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.PlatformReturnCode;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;

/**
 * 个人中心
 * 
 * @author jagger
 * 
 */
@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class MyCenterAction extends CommonAction {
	private Log log = Logs.getLog(MyCenterAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private UserServcieImpl userServcieImpl;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	/**
	 * 用户中心
	 * 
	 * @return
	 */
	@At("/user/center")
	@Ok("jsp:page.portal.myCenter")
	public Object myCenter(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, Object> obj = new HashMap<String, Object>();
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		if (userInfo != null) {
			obj.put("user", userInfo);
			String email =userInfo.getEmail();
			String mobile =userInfo.getMobile();
			userInfo.setStarMobile(StringUtil.getStarMobile(mobile));
			userInfo.setStarEmail(StringUtil.getStarEmail(email));
			List<Dict> banks = AppCache.getDictListByTypeId(Constants.BANKNAME_DAG);
			String array =JSONArray.toJSONString(banks);
			obj.put("banks",array);
			//obj.put("citys", i18n.get("dict.city_" + userInfo.getCurrencyType()));
			obj.put("isCNYuser", userInfo.getCurrencyName().equals("CNY") ? 1 : 2);
			return obj;
		} else {
			return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
		}
	}

	/**
	 * 修改基本资料
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/updBaseInfo")
	@Ok("json")
	public Object updBaseInfo(@Param("..") UserInfo userInfo, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "userinfomobileapi!updateUserinfo.shtml";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.UserStatus.FREEZE.getVal()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			final Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("username", onlineUser.getAccoutName());
			// parameters.put("sex", userInfo.getSex());
			parameters.put("mobile", userInfo.getMobile());
			parameters.put("tel", userInfo.getTel());
			parameters.put("nationalNumber", userInfo.getInterTelCode());
			// parameters.put("country", userInfo.getCountry());
			parameters.put("address", userInfo.getAddress());
			String birthDate = userInfo.getBirthdate();
			parameters.put("birthdate", (null == birthDate || birthDate.equals("")) ? "" : String.valueOf(DateUtil.parseDate(userInfo.getBirthdate()).getTime()));
			parameters.put("uuid", UUID.randomUUID().toString());

			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/").append(iterface).toString();
			String response = HttpClientUtil.doGetString(url, parameters);
			if (response != null && !response.equals("")) {
				JSONObject jsonObject = JSON.parseObject(response);
				int resultCode = jsonObject.getIntValue("code");
				if (resultCode != PlatformReturnCode.SUCCESS.getCode()) {
					String desc = jsonObject.getString("description");
					if (desc.equals("mobile  Already exists")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.mobileUpdFail"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 修改密码
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/updPwd")
	@Ok("json")
	public Object updPwd(String oldPwd, String newPwd, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "changePassword";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			String userid=onlineUser.getUserId();
			int userType = onlineUser.getUserType();
			String oldpwd = RSAUtil.decrypt(oldPwd.trim());
			String newpwd = RSAUtil.decrypt(newPwd.trim());
			String enNewPwd = PasswordEncoder.encode(onlineUser.getAccoutName(), MD5Util.md5(newpwd));
			if(enNewPwd!=null&&enNewPwd.equals(onlineUser.getFundPwd())){
				return JsonResult.createFalied("登录密码不能与资金密码一致！");
			}
			Document outDoc=DocumentHelper.createDocument();//需要输出的xml节点		
			Element rootElm=outDoc.addElement("req");
			Element recElm=rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);//用户ID
			recElm.addAttribute("utyp", userType+"");//用户类型 1、现金用户 2、信用用户
			recElm.addAttribute("ldpwd", MD5Util.md5(oldpwd));//旧密码
			recElm.addAttribute("nwpwd", MD5Util.md5(newpwd));//新密码
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("changePassword", xml);
			if (response != null && !response.equals("")) {
				
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if(resultCode.equals(Constants.ERROR_PASSWORD)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
					}else if(resultCode.equals(Constants.DRAWPWDNOTSAMEUPWDUNM)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.loginpwdSameFundpwd"));
					}else if(resultCode.equals(Constants.NOUSER)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					}else{
						return jsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}
	
	
	/**
	 * 修改资金密码
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/updFundPwd")
	@Ok("json")
	public Object updFundPwd(String oldPwd, String newPwd, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "setCashPassword";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
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
					return JsonResult.createFalied(i18n.get("msg.portal.fundPwdErrorMore"));
				}
			}
			String userid=onlineUser.getUserId();
			String oldpwd = RSAUtil.decrypt(oldPwd.trim());
			String newpwd = RSAUtil.decrypt(newPwd.trim());
			Document outDoc=DocumentHelper.createDocument();//需要输出的xml节点		
			Element rootElm=outDoc.addElement("req");
			rootElm.addAttribute("t", "3");
			Element recElm=rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);//用户ID
			recElm.addAttribute("unm", onlineUser.getAccoutName());//用户类型 1、现金用户 2、信用用户
			recElm.addAttribute("mnpwd", MD5Util.md5(oldpwd));//旧密码
			recElm.addAttribute("nwpwd", MD5Util.md5(newpwd));//新密码
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode .equals(Constants.SUCCESS)) {
					if(resultCode.equals(Constants.ERROR_DRAWPWD)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.currentPwdError"));
						// 记录登录失败次数
						if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
							int failedCount = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId()).getCount();
							FreezeCount count = AppCache.userFundPwdErrorRecord.get(onlineUser.getUserId());
							count.setCount(failedCount+1);
							AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
							AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
						} else {
							FreezeCount count = new FreezeCount();
							count.setCount(1);
							count.setFirstTimer(System.currentTimeMillis());
							AppCache.userFundPwdErrorRecord.put(onlineUser.getUserId(), count);
							AppCache.writeFreezeFile(AppCache.userFundPwdErrorRecord);
						}
					}else if(resultCode.equals(Constants.DRAWPWDNOTSAMEUPWDUNM)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.fundpwdSameLoginpwd"));
					}else if(resultCode.equals(Constants.NOUSER)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					}else{
						return jsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据:" + response);
				}else{
					onlineUser.setFundPwd(PasswordEncoder.encode(onlineUser.getAccoutName(), newpwd));
					// 清除失敗記錄
					if (AppCache.userFundPwdErrorRecord.containsKey(onlineUser.getUserId())) {
						AppCache.userFundPwdErrorRecord.remove(onlineUser.getUserId());
					}
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	/**
	 * 修改郵箱
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/user/updEmail")
	@Ok("json")
	public Object updEmail(String newEmail, String pwd, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "userinfomobileapi!updateEmail.shtml";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.UserStatus.FREEZE.getVal()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			final Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("username", onlineUser.getAccoutName());
			parameters.put("email", newEmail);
			parameters.put("loginpwd", RSAUtil.decrypt(pwd.trim()));
			parameters.put("uuid", UUID.randomUUID().toString());
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/").append(iterface).toString();
			String response = HttpClientUtil.doGetString(url, parameters);
			if (response != null && !response.equals("")) {
				JSONObject jsonObject = JSON.parseObject(response);
				int resultCode = jsonObject.getIntValue("code");
				if (resultCode != PlatformReturnCode.SUCCESS.getCode()) {
					String desc = jsonObject.getString("description");
					if (desc.equals("loginpwd is not error!")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.loginPwdError"));
					} else if (desc.equals("email does not regulate")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.emailRule"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}

	 /**
	 * 忘记密码
	 * 
	 * @param session
	 * @return
	 *//*
	@At("/out/user/forgetPwd")
	@Ok("json")
	@Filters
	public Object forgetPwd(String userName, String email, String url, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "userinfomobileapi!resetPwd.shtml";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			final Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("username", userName);
			parameters.put("email", email);
			parameters.put("url", "www" + url.substring(url.indexOf("."), url.length()));
			parameters.put("uuid", UUID.randomUUID().toString());
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String req = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/").append(iterface).toString();
			String response = HttpClientUtil.doGetString(req, parameters);
			if (response != null && !response.equals("")) {
				JSONObject jsonObject = JSON.parseObject(response);
				int resultCode = jsonObject.getIntValue("code");
				if (resultCode != PlatformReturnCode.SUCCESS.getCode()) {
					String desc = jsonObject.getString("description");
					if (desc.equals("username is not exist")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.userNameNoExist"));
					} else if (desc.equals("thecount error")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.applyTooMany"));
					} else if (desc.equals("user eamil is error")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.emailNoValidation"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}*/

	/**
	 * 驗證郵箱
	 * 
	 * @param session
	 * @return
	 *//*
	@At("/user/vertifyEmail")
	@Ok("json")
	public Object vertifyEmail(String email, String domain, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "userinfomobileapi!verifEmail.shtml";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			final Map<String, String> parameters = new HashMap<String, String>();
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			parameters.put("username", onlineUser.getAccoutName());
			parameters.put("email", email);
			parameters.put("url", "www" + domain.substring(domain.indexOf("."), domain.length()));
			parameters.put("uuid", UUID.randomUUID().toString());
			String ts = String.valueOf(new Date().getTime());
			parameters.put("ts", ts);
			parameters.put("valideTime", propertiesLoader.getTrim("vinbet.platform.valideTime"));
			parameters.put("sipsession", MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.platform") + ts));
			String req = new StringBuilder(propertiesLoader.getTrim("vinbet.platform.url")).append("/").append(iterface).toString();
			String response = HttpClientUtil.doGetString(req, parameters);
			if (response != null && !response.equals("")) {
				JSONObject jsonObject = JSON.parseObject(response);
				int resultCode = jsonObject.getIntValue("code");
				if (resultCode != PlatformReturnCode.SUCCESS.getCode()) {
					String desc = jsonObject.getString("description");
					if (desc.equals("username is not exist")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.userNameNoExist"));
					} else if (desc.equals("user status exception")) {
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.userDisabled"));
					} else {
						jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据:" + response);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}*/
	
	
	/**
	 * 首次设置资金密码
	 * 
	 * @return
	 */
	@At("/user/firstSetFundPwd")
	@Ok("json")
	public Object firstSetFundPwd(@Param("bankname") String bankname, @Param("province") String province, @Param("city") String city, @Param("branchDetail") String branchDetail,
			@Param("newPwd") String newPwd, @Param("cardNo") String cardNo, @Param("trueName") String trueName, @Param("bankid") String bankid, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "changePassword";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (onlineUser.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			String userid=onlineUser.getUserId();
			String username = onlineUser.getAccoutName();
			//String newpwd = RSAUtil.decrypt(newPwd.trim());
			String newpwd = newPwd.trim();
			Document outDoc=DocumentHelper.createDocument();//需要输出的xml节点		
			Element rootElm=outDoc.addElement("req");
			rootElm.addAttribute("t", 2+"");//操作说明 1、重置资金密码 2、新增资金密码 3、修改资金密码
			Element recElm=rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);//用户ID
			//recElm.addAttribute("mnpwd", MD5Util.md5(newpwd));//资金密码
			recElm.addAttribute("mnpwd", newpwd);//资金密码
			recElm.addAttribute("unm", username);//用户名
			recElm.addAttribute("bnknm", bankname);//银行名称
			recElm.addAttribute("bnkid", bankid);//银行ID
			recElm.addAttribute("subnm", branchDetail==null?"":branchDetail);//支行名称
			recElm.addAttribute("pro", province==null?"":province);//省，州，府
			recElm.addAttribute("cty", city==null?"":city);//城市
			recElm.addAttribute("crdnm", BASE64Util.getFromBASE64(cardNo).replace(" ", ""));//银行卡号
			recElm.addAttribute("accsp", "7");//提款方式6、中介机构7、银行机构
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx("setCashPassword", xml);
			if (response != null && !response.equals("")) {
				
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					if(resultCode.equals(Constants.EXISTBANKCARDNUMBER)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.existBankNum"));
					}else if(resultCode.equals(Constants.DRAWPWDNOTSAMEUPWDUNM)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.fundpwdSameLoginpwd"));
					}else if(resultCode.equals(Constants.NOUSER)){
						jsonResult = JsonResult.createFalied(i18n.get("msg.portal.noUser"));
					}else{
						return jsonResult.createFalied(i18n.get("msg.common.systemError"));
					}
					log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据:" + response);
				}else{
					List<Element> childNodes = root.elements(); 
					if(childNodes.size()>0){
						Element reqElm=(Element)childNodes.get(0);
						if(reqElm.attributeValue("crid")!=null&&!reqElm.attributeValue("crid").equals("")){
							String cardid = reqElm.attributeValue("crid");
							Map<String,Object> map = new HashMap<String, Object>();
							map.put("cardid", cardid);
							jsonResult.setData(map);
						}
					}
					String pwd = PasswordEncoder.encode(onlineUser.getAccoutName(), newpwd);
					onlineUser.setFundPwd(pwd);
				}
			} else {
				jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
				log.error("调用[platform]手机服务端[" + iterface + "]请求报文："+xml+"接口返回数据为空");
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(i18n.get("msg.common.systemError"));
			log.error("调用[platform]手机服务端[" + iterface + "]接口处理异常.", e);
		}
		return jsonResult;
	}
}
