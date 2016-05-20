package com.vinbet.mobile.sys;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasig.cas.client.validation.Assertion;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.CreateXmlUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.DateUtil;
public class SsoFilter implements Filter {

	private Log logger = LogFactory.getLog(this.getClass());
	private static Map<String, String> map = new HashMap<String, String>();
	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
		int server_type = Constants.server_type;
		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		final HttpServletResponse response = (HttpServletResponse) servletResponse;
		if(server_type==0){
			HttpSession session = request.getSession();
			UserInfo userinfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
			if(userinfo==null){
				userinfo = new UserInfo();
				userinfo.setUserId("5000005274");
				userinfo.setAccoutName("iovo2016");
				userinfo.setCurrencyName("CNY");
				userinfo.setUserStatus(1);
				userinfo.setSurName("反复");
				userinfo.setGivenName("辅导费");
				userinfo.setUserType(1);
				userinfo.setCountry("中国");
				userinfo.setTrueName("地方法");
				session.setAttribute(com.vinbet.mobile.util.Constants.USER_SESSION, userinfo);
				
			}
			// 如果用户登录就将信息保存到session中
			/*Assertion assertion = (Assertion) session.getAttribute("_const_cas_assertion_");
			if (null != assertion) {
				UserInfo userinfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
				if (userinfo == null) {
					userinfo = new UserInfo();
					Map<String, Object> hmap = assertion.getPrincipal().getAttributes();
					String username = hmap.get("username")==null?"":hmap.get("username").toString().trim();
					String userid = hmap.get("userid")==null?"":hmap.get("userid").toString().trim();
					String usertype = hmap.get("usertype")==null?"":hmap.get("usertype").toString().trim();
					String currency = hmap.get("currency")==null?"":hmap.get("currency").toString().trim();
					String classify = hmap.get("classify")==null?"":hmap.get("classify").toString().trim();
					String status = hmap.get("status")==null?"":hmap.get("status").toString().trim();
					String firstName = hmap.get("firstName")==null?"":hmap.get("firstName").toString().trim();
					String lastName = hmap.get("lastName")==null?"":hmap.get("lastName").toString().trim();
					String emailbind =  hmap.get("emailbindingflat")==null?"":hmap.get("emailbindingflat").toString().trim();
					String phonebind =  hmap.get("mobilebindingflat")==null?"":hmap.get("mobilebindingflat").toString().trim();
					String appauth =  hmap.get("appauth")==null?"":hmap.get("appauth").toString().trim();
					//if (phonebind.equals("1")) {
					Object mu = hmap.get("mobilenumber");
					userinfo.setMobile(mu == null ? "" : String.valueOf(mu).trim());
					//}
					//if (emailbind.equals("1")) {
					Object email = hmap.get("email");
					userinfo.setEmail(email == null ? "" : String.valueOf(email).trim());
					//}
					userinfo.setAppauth(appauth);
					userinfo.setTrueName(lastName+firstName);
					userinfo.setSurName(lastName);
					userinfo.setGivenName(firstName);
					userinfo.setEmailStatus(emailbind);
					userinfo.setMobileStatus(phonebind);
					// String provincial= hmap.get("provincial").toString();
					// String nickname= hmap.get("nickname").toString();
					Object birthdate = hmap.get("birthdate");
					// String sex= hmap.get("sex").toString();
					Object nationality = hmap.get("nationality");
					userinfo.setCountry(nationality==null?"":String.valueOf(nationality).trim());
					userinfo.setAccoutName(username);
					userinfo.setUserId(userid);
					userinfo.setUserType(Integer.parseInt(usertype));
					userinfo.setBirthdate(birthdate==null?"":String.valueOf(birthdate).trim());
					userinfo.setUserStatus(Integer.parseInt(status));
					Object withdrawalpwd = hmap.get("withdrawalpwd");
					userinfo.setFundPwd(withdrawalpwd == null ? "" : String.valueOf(withdrawalpwd).trim());
					userinfo.setUserLv(classify);
					if (currency.equals("CNY")) {
						userinfo.setCurrencyType(1);
					} else if (currency.equals("THB")) {
						userinfo.setCurrencyType(2);
					}
					userinfo.setCurrencyName(currency);
					userinfo.setLoginIp(CommonAction.getClientIp(request));
					userinfo.setLoginTime(DateUtil.getDateTime(new Date()));
					session.setAttribute(com.vinbet.mobile.util.Constants.USER_SESSION, userinfo);
					
					
					// 如果用户状态正常 而冻结map中存在该用户信息的话 ，则去掉
					if(userinfo.getUserStatus()==USER_STATUS.USERSTATUS_NORMAL.getCode()){
						if (AppCache.userFundPwdErrorRecord.containsKey(userinfo.getUserId())) {
							AppCache.userFundPwdErrorRecord.remove(userinfo.getUserId());
						}
					}
					// userinfo.setHideName(SysUtils.setAsteriskForName(userinfo.getName()));
					// 检测用户是否已经在线
					HttpSession existSession = AppCache.onlineUsers.get(username);
					if (existSession != null && !existSession.getId().equals(session.getId())) {
						// existSession.setAttribute("logout", "passive");
						logger.info("用户[" + userinfo.getAccoutName() + "]在其它终端登录,被强制退出.");
						try {
							existSession.removeAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
							existSession.removeAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
							existSession.removeAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
							existSession.removeAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
							existSession.removeAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
						} catch (Exception e) {
							logger.error(e);
						}
						// existSession.invalidate();
					}
					AppCache.onlineUsers.put(username, session);
				}
				String reqUrl = request.getRequestURI();
				String path = request.getContextPath();
				String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
				// 用户为未激活状态不可以进行其它操作，强制性安全验证
				if (USER_STATUS.USERSTATUS_NOACTIVE.getCode() == userinfo.getUserStatus()) {
					if (!reqUrl.contains("/out") && !reqUrl.contains("/user/test") && !reqUrl.contains("/lang/change") && !reqUrl.contains("/js") && !reqUrl.contains("/css") && !reqUrl.contains("/images") && !reqUrl.contains("vcode.jpg")) {
						String location = basePath + "out/user/activateAccount";
						response.sendRedirect(location);
						return;
					}
					
				}
				
			} else { // 单点登录退出 session清除
				try {
					String reqUrl = request.getRequestURI();
					if (!reqUrl.contains("/api")) {
						UserInfo userinfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
						if(null!=userinfo){
							logger.info("用户[" + userinfo.getAccoutName() + "] SSO退出 session清除");
						}
						session.removeAttribute(Constants.USER_SESSION);
						session.removeAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
						session.removeAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
						session.removeAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
						session.removeAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
						//session.invalidate();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				// String reqUrl=request.getRequestURI();
				// String path = request.getContextPath();
				// String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				// if(!reqUrl.contains("/out")&&!reqUrl.contains("/login")&&!reqUrl.contains("/js")&&!reqUrl.contains("/css")&&!reqUrl.contains("/images")&&!reqUrl.contains("vcode.jpg"))
				// {
				//
				// String location=basePath+"login";
				// System.out.println(reqUrl+"=="+location);
				// response.sendRedirect(location);
				// return;
				// }
			}*/
			
		}

		chain.doFilter(request, response);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		map.put("username", "setUserName");
		map.put("name", "setName");
		map.put("userid", "setUserId");
		map.put("usertype", "setUserType");
		map.put("currency", "setCurrency");
		map.put("classify", "setClassify");
		map.put("status", "setStatus");
		map.put("provincial", "setProvincial");
		map.put("nickname", "setNickName");
		map.put("birthdate", "setBirthDate");
		map.put("sex", "setSex");
		map.put("nationality", "setNationality");
		map.put("withdrawalpwd", "setWithdrawalPwd");

	}

}
