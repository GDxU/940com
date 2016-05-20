package com.vinbet.mobile.action.portal;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSONArray;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.BankCard;
import com.vinbet.mobile.entity.portal.CheckInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.NavigationApp;
import com.vinbet.mobile.entity.portal.WalletCategory;
import com.vinbet.mobile.service.portal.UserServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.PasswordEncoder;
import com.vinbet.mobile.util.RSAUtil;

/**
 * 平台会员相关
 * 
 * @author jagger(xiaohutu2013@gmail.com)
 * 
 */
@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class UserAction extends CommonAction {
	private Log log = Logs.getLog(UserAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private UserServcieImpl userServcieImpl;

	/**
	 * 跳转到用户余额信息页面
	 */
	@At("/user/userBalance")
	@Ok("jsp:page.portal.user.user_balance")
	public Object toUserDetail(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		// obj.put("ct", super.getDictVal("dict.curency.type.mark", user.getCurrencyType()+"", request));
		obj.put("ct", super.getDepositMark(propertiesLoader, user.getCurrencyType()));
		return obj;
	}

	/**
	 * 跳转到划账信息页面
	 */
	@At("/user/appTransferPage")
	@Ok("jsp:page.portal.user.transfer_app")
	public Object toAppTransfer(HttpServletRequest request, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		HashMap<String, Object> obj = new HashMap<String, Object>();
		/*
		 * Map<String, WalletCategory> walletDict = AppCache.getWalletCategoryMap(); Map<String, WalletCategory> walletSelect = new HashMap<String,
		 * WalletCategory>(); for (String key : walletDict.keySet()) { String iid = walletDict.get(key).getIid(); String oldName =
		 * walletDict.get(key).getWalletName(); String name = AppCache.getI18nInfo(iid, oldName); walletDict.get(key).setWalletName(name);
		 * if(walletDict.get(key).getWalletCategory().equals(Constants.WALLLET_TYPE_CENTER)){ walletSelect.put(key, walletDict.get(key)); }
		 * String[]auth = user.getAppauth().split(","); for (String str : auth) { if(str.equals(walletDict.get(key).getAppMark())){
		 * if(user.getCurrencyName().contains(walletDict.get(key).getCurrency())){ walletSelect.put(key, walletDict.get(key)); } } } }
		 */
		List<Dict> walletSel = new ArrayList<Dict>();
		List<Dict> src = AppCache.getI18nDictListByType(Constants.WALLETCATEGORY_DAG);
		List<Dict> desc = new ArrayList<Dict>(Arrays.asList(new Dict[src.size()]));
		Collections.copy(desc, src);
		Map<String, NavigationApp> map = AppCache.getNavigationAppMap();
		for (Dict dict : desc) {
			try {
				dict.setDictName("{[{" + BASE64Util.getBASE64(dict.getDictName()) + "}]}");
			} catch (UnsupportedEncodingException e) {
			}
			if (dict.getDictCode().equals(Constants.WALLLET_TYPE_CENTER)) {
				walletSel.add(dict);
			}
			String[] auth = user.getAppauth().split(",");
			for (String str : auth) {
				NavigationApp navigationApp = map.get(str.trim() + Constants.USERTYPE_CASH);
				if (navigationApp != null) {
					if (!com.vinbet.mobile.util.Constants.USERTYPE_CREDIT.equals(navigationApp.getApptype())) {
						if (navigationApp.getAppmark().equals(str.trim())) {
							WalletCategory wallet = AppCache.getWalletCategoryMap().get(navigationApp.getWalletcategory());
							if (wallet != null) {
								if (wallet.getWalletCategory().equals(dict.getDictCode())) {
									if (wallet.getCurrency().contains(user.getCurrencyName())) {
										// 判断钱包状态是否为维护中
										if (wallet.getStatus().equals("1")) {
											walletSel.add(dict);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		obj.put("ids", walletSel);
		obj.put("ct", super.getDepositMark(propertiesLoader, user.getCurrencyType()));
		obj.put("user", user);
		obj.put("isCNYuser", user.getCurrencyName().equals("CNY") ? "1" : "2");
		return obj;
	}

	/**
	 * 跳转到提款页面
	 */
	@At("/user/drawMoneyPage")
	@Ok("jsp:page.portal.user.drawMoney")
	public Object toDrawMoneyPage(HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		HashMap<String, Object> obj = new HashMap<String, Object>();
		UserInfo onlineUser = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		UserInfo userInfo = userServcieImpl.getUserInfo(onlineUser.getAccoutName(), 1);
		List<BankCard> bankCard = userServcieImpl.getBankInfo(onlineUser.getUserId(), null);
		List<Dict> proLs = AppCache.getI18nDictListByType("arealevel2_" + userInfo.getCountry());
		if (bankCard != null) {
			for (BankCard bankCard2 : bankCard) {
				for (Dict dict : proLs) {
					if (dict.getDictCode().equals(bankCard2.getProvincial())) {
						bankCard2.setProvinceName(dict.getDictName());
					}
				}
			}
		}
		if (userInfo != null) {
			obj.put("user", userInfo);
			List<Dict> banks = AppCache.getDictListByTypeId(Constants.BANKNAME_DAG);
			String array = JSONArray.toJSONString(banks);
			obj.put("banksel", array);
			obj.put("citys", i18n.get("dict.city_" + userInfo.getCurrencyType()));
			obj.put("banklist", bankCard);
			obj.put("minDrawMoney", AppCache.getCurrencyMap().get(userInfo.getCurrencyName()).getMinimumWithdrawal());
			obj.put("maxDrawMoney", AppCache.getSystemParm(Constants.ALIPAY_MAX_DRAW_AMT));
			obj.put("isCNYuser", userInfo.getCurrencyName().equals("CNY") ? "1" : "2");
			obj.put("maxCardNum", AppCache.getSystemParm(Constants.MAX_BANKCARD));
			boolean showalipay = true;
			List<Dict> aldt = AppCache.getDictListByTypeId(Constants.ALIPAY_DRAW_DAG);
			if(aldt==null||aldt.size()==0){
				showalipay =false;
			}
			obj.put("isShowAlipay", showalipay);
			return obj;
		} else {
			return new ViewWrapper(new JspView("page.tips"), i18n.get("msg.common.systemError"));
		}
	}

	private int getMinWithdrawalsAmt(PropertiesLoader propertiesLoader, int currency) {
		int defaultAmt = 100;
		try {
			String limitStr = propertiesLoader.getTrim("vinbet.withdrawals.limit");
			String limit[] = limitStr.split(";");
			for (String entry : limit) {
				String e[] = entry.split(":");
				if (Integer.parseInt(e[0]) == currency) {
					defaultAmt = Integer.parseInt(e[1]);
					break;
				}
			}
		} catch (Exception e) {
			log.error("获取币种[" + currency + "]的提款限额异常.", e);
		}
		return defaultAmt;
	}

	/**
	 * 跳转到个人总报表页面
	 */
	@At("/user/totalReportPage")
	@Ok("jsp:page.portal.user.total_report")
	public Object toTotalReportPage() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		return obj;
	}

	/**
	 * 条款规则
	 * 
	 * @return
	 */
	@At("/out/user/agreement")
	// @Ok("jsp:page.portal.agreement")
	@Filters
	public View agree() {
		String lang = Mvcs.getLocalizationKey();
		String page = "page.portal.agreement";
		if (lang != null && !lang.equals("zh")) {
			page = "page.portal.agreement_en";
		}
		return new ViewWrapper(new JspView(page), null);
	}

	/**
	 * 联系我们
	 * 
	 * @return
	 */
	@At("/user/contact")
	@Ok("jsp:page.portal.contact")
	@Filters
	public Object contact() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		return obj;
	}

	/**
	 * 切换语言
	 * 
	 * @param lang
	 * @param session
	 */
	@At("/lang/change/?")
	// @Ok("jsp:page.index")
	// @Ok("redirect:/")
	@Filters
	@Ok("json")
	public Object changeLocal(@Param("lang") String lang, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		// 判断语言参数是否可用（Mvcs.getLocalizationKeySet()中的值是通过资源文件加载的）
		if (!Mvcs.getLocalizationKeySet().contains(lang)) {
			lang = Constants.DEFAULT_LANGUAGE;
		}
		Mvcs.setLocalizationKey(lang);
		super.addCookie(Constants.COOKIE_LANGUAGE_KEY, lang);
		// System.out.println(Mvcs.getLocalizationKeySet());
		// System.out.println(Mvcs.getLocalizationKey());
		// System.out.println(session.getAttribute("nutz_mvc_localization_key"));

		return jsonResult;
	}

	/**
	 * 账户激活
	 * 
	 * @return
	 */
	@At("/out/user/activateAccount")
	@Ok("jsp:page.portal.activate_account")
	public Object activateAccount(@Param("userid") String userid, @Param("password") String password,HttpSession httpSession) {
		HashMap<String, String> obj = new HashMap<String, String>();
		UserInfo onlineUser = (UserInfo) httpSession.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		obj.put("userid", userid);
		obj.put("password", password);
		obj.put("ssoprefix", propertiesLoader.getTrim("vinbet.sso.prefix"));
		obj.put("ssoport", propertiesLoader.getTrim("vinbet.sso.port"));
		HashMap<String, String> req = new HashMap<String, String>();
		HashMap<String, String> rec = new HashMap<String, String>();
		req.put("t", "10");// 操作说明 检测类接口10、检测现金用户名字是否重复
		rec.put("nm", onlineUser.getSurName()+onlineUser.getGivenName());// 用户姓名
		rec.put("uid", onlineUser.getUserId());// 用户ID
		CheckInfo checkInfo = userServcieImpl.checkUserInfo(req, rec);
		if (checkInfo.getResultCode().equals(com.vinbet.mobile.util.Constants.SUCCESS)) {
			obj.put("isRepName", checkInfo.getIsExist());
		}
		return obj;
	}

	/**
	 * 活动内存页面
	 * 
	 * @return
	 */
	@At("/user/test")
	@Ok("jsp:page.portal.Test")
	@Filters
	public Object testAct(@Param("wc") String wc,@Param("actMk") String actMk,@Param("extMk") String extMk) {
		HashMap<String, String> obj = new HashMap<String, String>();
		System.out.println(wc);
		return obj;
	}
	
	/**
	 * 客服页面
	 * 
	 * @return
	 */
	@At("/user/userService")
	@Ok("jsp:page.portal.user_service")
	@Filters
	public Object userService() {
		HashMap<String, String> obj = new HashMap<String, String>();
		return obj;
	}

	/**
	 * 校验资金密码
	 * 
	 * @param pwd
	 * @return
	 */
	@At("/user/checkFundPwd")
	@Ok("raw")
	public boolean checkFundPwd(String pwd, HttpSession session) {
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		boolean right = false;
		String fundPwd = pwd;
		try {
			fundPwd = RSAUtil.decrypt(fundPwd);
		} catch (Exception e) {
			log.error("RSAUtil解码失败", e);
		}
		fundPwd = PasswordEncoder.encode(user.getAccoutName(), MD5Util.md5(fundPwd));
		UserInfo currentUserInfo = userServcieImpl.getUserInfo(user.getAccoutName(), 1);
		if (currentUserInfo != null) {
			if (currentUserInfo.getFundPwd().equals(fundPwd)) {
				right = true;
			}
		}
		return right;
	}
	

}
