package com.vinbet.mobile.action.portal;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
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

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.ApiJsonResult;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.MailUtil;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.PhoneCodeUtil;
import com.vinbet.mobile.util.RSAUtil;
import com.vinbet.mobile.util.StringUtil;

/**
 * 找回密码
 * 
 * @author cjp
 * 
 */
@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class ForgetPwdAction extends CommonAction {
	private Log log = Logs.getLog(ForgetPwdAction.class);
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
	 * 忘记密码
	 * 
	 * @return
	 */
	@At("/out/user/forgetPwd")
	@Ok("jsp:page.portal.forgetPwd")
	@Filters
	public Object forgetPwd() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		return obj;
	}
	
	/**
	 * 忘记资金密码
	 * 
	 * @return
	 */
	@At("/out/user/forgetFundPwd")
	@Ok("jsp:page.portal.forgetFundPwd")
	public Object forgetFundPwd(HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		UserInfo onlineUser = (UserInfo) session.getAttribute(Constants.USER_SESSION);
		session.setAttribute(com.vinbet.mobile.util.Constants.FINDPWD_SESSION,onlineUser);
		//onlineUser.setMobileStatus("0");
		//onlineUser.setEmailStatus("0");
		UserInfo tempuser = new UserInfo();
		tempuser.setAccoutName(onlineUser.getAccoutName());
		tempuser.setStarEmail(StringUtil.getStarEmail(onlineUser.getEmail()));
		tempuser.setEmailStatus((onlineUser.getEmailStatus()));
		tempuser.setStarMobile(onlineUser.getInterTelCode()+StringUtil.getStarMobile(onlineUser.getMobile()));
		tempuser.setMobileStatus(onlineUser.getMobileStatus());
		obj.put("user", tempuser);
		List<BankCard> bankCard = userServcieImpl.getBankInfo(onlineUser.getUserId(), null);
		if(bankCard.size()>0){
			obj.put("card",bankCard.get(0).getBankName());
		}else{
			obj.put("card",null);
		}
		return obj;
	}
	
	/**
	 * 检测用户绑定手机邮箱的状态
	 * 
	 * @param mny
	 * @return
	 */
	@At("/out/user/checkUserBindStatus")
	@Ok("json")
	@Filters
	public JsonResult checkUserBindStatus(String userName, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		UserInfo userInfo = userServcieImpl.getUserInfo(userName, 1);
		if(userInfo!=null){
			session.setAttribute(Constants.FINDPWD_SESSION, userInfo);
			Map<String, Object> map = new HashMap<String, Object>();
			UserInfo tempuser = new UserInfo();
			tempuser.setAccoutName(userInfo.getAccoutName());
			tempuser.setStarEmail(StringUtil.getStarEmail(userInfo.getEmail()));
			tempuser.setEmailStatus((userInfo.getEmailStatus()));
			tempuser.setStarMobile(userInfo.getInterTelCode()+StringUtil.getStarMobile(userInfo.getMobile()));
			tempuser.setMobileStatus(userInfo.getMobileStatus());
			map.put("user", tempuser);
			jsonResult.setData(map);
		}else{
			jsonResult=JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		return jsonResult;
	}
	
	
	/**
	 * 发送验证码(找回密码专用)
	 * 
	 * @param sendType
	 * @return
	 */
	@At("/out/user/fgtSendCode")
	@Ok("json")
	@Filters
	public Object fgtSendCode(int sendType, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.FINDPWD_SESSION);
		if(user==null){
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		String userid = user.getUserId();
		if (sendType == 1) {
			try {
				// 检测发送验证码次数，超过次数则不允许发送
				if (AppCache.userGetCodeRecord.containsKey(user.getUserId())) {
					int sendCount = AppCache.userGetCodeRecord.get(user.getUserId());
					int maxSend = Integer.parseInt(AppCache.getSystemParm(com.vinbet.mobile.util.Constants.SEND_CODE_COUNT));
					if (sendCount >= maxSend) {
						return JsonResult.createFalied(i18n.get("msg.portal.sendCodeMore"));
					} else {
						int sended = AppCache.userGetCodeRecord.get(user.getUserId());
						AppCache.userGetCodeRecord.put(user.getUserId(), sended + 1);
					}
				} else {
					AppCache.userGetCodeRecord.put(user.getUserId(), 1);
				}
				String phoneFix = user.getInterTelCode();
				String phoneNum = user.getMobile();
				String code = StringUtil.createRandom(true, 6);
				phoneCodeUtil.sendsms(phoneFix, phoneNum, code);
				AppCache.setPhonevCode(userid, phoneNum, code, System.currentTimeMillis());
			} catch (Exception e) {
				log.error("发送手机短信异常", e);
			}
		} else if (sendType == 2) {
			try {
				String mailAddress = user.getEmail();
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
	 * 检查验证码(找回密码专用)
	 * 
	 * @param int sendType,String code
	 * @return
	 */
	@At("/out/user/fgtVerifyCode")
	@Ok("json")
	@Filters
	public Object fgtVerifyCode(String code,int sendType,String cardnum, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.FINDPWD_SESSION);
		if(user==null){
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		if(cardnum!=null&&!cardnum.equals("")){
			List<BankCard> bankCard = userServcieImpl.getBankInfo(user.getUserId(), null);
			if(bankCard.size()>0){
				if(!cardnum.equals(bankCard.get(0).getCardNumber())){
					return JsonResult.createFalied("对不起，您输入的银行卡号有误！");	
				}
			}else{
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		}
		String userid = user.getUserId();
		if (sendType == 1) {
			boolean result = AppCache.checkPhvCode(userid, user.getMobile(), propertiesLoader.getLong("vinbet.email.expiredTime"), code);
			if (!result){
				return JsonResult.createFalied(i18n.get("msg.portal.codeError"));
			}else{
				user.setResetPwd(true);
			}
		} else if (sendType == 2) {
			String result = AppCache.checkEmailvCode(userid, propertiesLoader.getLong("vinbet.email.expiredTime"), code);
			if (result.equals("")) {
				return JsonResult.createFalied(i18n.get("msg.portal.codeError"));
			}else{
				user.setResetPwd(true);
			}
		}

		return jsonResult;
	}
	
	
	/**
	 * 重置登陆密码
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/out/user/resetPwd")
	@Ok("json")
	@Filters
	public Object resetPwd(String newPwd, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "resetPassword";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo user = (UserInfo) session.getAttribute(Constants.FINDPWD_SESSION);
			if(user==null){
				ApiJsonResult result = ApiJsonResult.createFalied("权限校验失败，请稍后再试！");
				return result;
			}else{
				if(!user.isResetPwd()){
					return JsonResult.createFalied("权限校验异常，修改失败！");
				}
			}
			if (user.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			String userid=user.getUserId();
			int userType = user.getUserType();
			String newpwd = RSAUtil.decrypt(newPwd.trim());
			String enNewPwd = PasswordEncoder.encode(user.getAccoutName(), MD5Util.md5(newpwd));
			if(enNewPwd!=null&&enNewPwd.equals(user.getFundPwd())){
				return JsonResult.createFalied("登录密码不能与资金密码一致！");
			}
			Document outDoc=DocumentHelper.createDocument();//需要输出的xml节点		
			Element rootElm=outDoc.addElement("req");
			Element recElm=rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);//用户ID
			recElm.addAttribute("utyp", userType+"");//用户类型 1、现金用户 2、信用用户
			recElm.addAttribute("tpwd", MD5Util.md5(newpwd));//新密码
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, xml);
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
	 * 重置资金密码
	 * 
	 * @param userInfo
	 * @param session
	 * @return
	 */
	@At("/out/user/resetFundPwd")
	@Ok("json")
	public Object resetFundPwd(String newPwd, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String iterface = "setCashPassword";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		try {
			UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.FINDPWD_SESSION);
			if(!user.isResetPwd()){
				return JsonResult.createFalied("权限校验异常，修改失败！");
			}
			if (user.getUserStatus() == Constants.USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				return JsonResult.createFalied(i18n.get("msg.common.userStsFreeze"));
			}
			String userid=user.getUserId();
			String newpwd = RSAUtil.decrypt(newPwd.trim());
			/*String enNewPwd = PasswordEncoder.encode(user.getAccoutName(), MD5Util.md5(newpwd));
			if(enNewPwd!=null&&enNewPwd.equals(user.get)){
				return JsonResult.createFalied("登录密码不能与资金密码一致！");
			}*/
			Document outDoc=DocumentHelper.createDocument();//需要输出的xml节点		
			Element rootElm=outDoc.addElement("req");
			rootElm.addAttribute("t","1");//1.	重置资金密码2.	新增资金密码3.	修改资金密码
			Element recElm=rootElm.addElement("rec");
			recElm.addAttribute("uid", userid);//用户ID
			recElm.addAttribute("unm", user.getAccoutName());//用户名
			recElm.addAttribute("mnpwd", MD5Util.md5(newpwd));//新资金密码
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.baseManagerZreocSrvIPrx(iterface, xml);
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
				}else{
					UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
					userInfo.setFundPwd(PasswordEncoder.encode(userInfo.getAccoutName(), newpwd));
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
