package com.vinbet.mobile.action.system;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.ServerRedirectView;

import com.vinbet.mobile.entity.hkc.HkcOrder;
import com.vinbet.mobile.entity.portal.PaymentInfo;
import com.vinbet.mobile.entity.portal.Register;
import com.vinbet.mobile.entity.qxc.QxcOrder;
import com.vinbet.mobile.entity.sport.SportOrder;
import com.vinbet.mobile.entity.ssc.SscOrder;
import com.vinbet.mobile.service.portal.SystemServcieImpl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.I18nLoader;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.h2.H2Dao;
import com.vinbet.mobile.sys.h2.util.Cnd;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;
import com.vinbet.mobile.util.RSAUtil;

@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "ADMIN_USER_SESSION", "/admin" }))
public class SystemAction {
	private static final Logger log = LogManager.getLogger(SystemAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private SystemServcieImpl systemServcieImpl;

	/**
	 * 系统管理员登陆
	 * 
	 * @return
	 */
	@At("/admin")
	@Ok("jsp:page.system.admin")
	@Filters
	public Object index() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("pm", RSAUtil.publicModulusString);
		obj.put("pe", RSAUtil.publicExponentString);
		return obj;
	}

	@At("/sys/login")
	@Ok("json")
	@Filters
	public JsonResult login(@Param("vcode") String vc, @Param("username") String username, @Param("password") String password, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			password = RSAUtil.decrypt(password);
			if (username != null && password != null && ((username.equals(propertiesLoader.getTrim("vinbet.sys.username")) && password.equals(propertiesLoader.getTrim("vinbet.sys.password"))))) {
				session.setAttribute(com.vinbet.mobile.util.Constants.ADMIN_USER_SESSION, username);
				if (MD5Util.md5Hex(username).equals("9a603d75b3dfe26d31256e65b857ea1b")) {
					session.setAttribute(com.vinbet.mobile.util.Constants.ADMIN_USER_TYPE, "02");
				} else {
					session.setAttribute(com.vinbet.mobile.util.Constants.ADMIN_USER_TYPE, "01");
				}
			} else {
				jsonResult = JsonResult.createFalied("用户名或密码错误！");
			}
		} catch (Exception e) {
			log.error(e);
		}
		return jsonResult;
	}

	@At("/sys/logout")
	public View logout(HttpSession session) {
		session.removeAttribute(com.vinbet.mobile.util.Constants.ADMIN_USER_SESSION);
		return new ServerRedirectView("/admin");
	}

	@At("/sys/main")
	@Ok("jsp:page.system.main")
	public void main() {

	}

	@At("/sys/maintain")
	@Ok("jsp:page.system.app_maintain")
	public Object maintain() {
		return getAppInfos();
	}

	@At("/sys/maintain/set/?/?")
	@Ok("json")
	public Object maintainSet(int index, int s) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean status = s == 0;
			String appName = String.valueOf(getAppInfos().get(index)[0]);
			if (s == -1) {
				AppsStatusUtil.setManualStatusToAuto(appName);
			} else {
				AppsStatusUtil.setAppsStatusByManual(appName, status);
			}
			map.put("c", 0);
		} catch (Exception e) {
			map.put("c", 1);
		}
		return map;
	}

	private List<Object[]> getAppInfos() {
		List<Object[]> list = new ArrayList<Object[]>();
		Object[] infos = new Object[] { "ssc", "时时彩", AppsStatusUtil.getSscStatus() };
		list.add(infos);
		infos = new Object[] { "hkc", "香港彩", AppsStatusUtil.getHkcStatus() };
		list.add(infos);
		infos = new Object[] { "qxc", "七星彩", AppsStatusUtil.getQxcStatus() };
		list.add(infos);
		infos = new Object[] { "sport", "新体育", AppsStatusUtil.getSportStatus() };
		list.add(infos);
		return list;
	}

	/**
	 * 热加载配置信息
	 * 
	 * @return
	 */
	@At("/sys/reloadCfg")
	@Ok("json")
	public JsonResult reloadCfg() {
		JsonResult jsonResult = JsonResult.createSuccess();
		propertiesLoader.setPaths("com/vinbet/mobile/config");
		return jsonResult;
	}

	/**
	 * 热加载国际化
	 * 
	 * @return
	 */
	@At("/sys/reloadI18n")
	@Ok("json")
	public JsonResult reloadI18n() {
		JsonResult jsonResult = JsonResult.createSuccess();
		I18nLoader i18nLoader = new I18nLoader();
		Map<String, Map<String, Object>> resMap = i18nLoader.load("i18n");
		Mvcs.ctx.localizations.put(Mvcs.getName(), resMap);
		return jsonResult;
	}

	/**
	 * 解除被锁定的用户
	 * 
	 * @return
	 */
	@At("/sys/unlockUser")
	@Ok("json")
	public JsonResult unlockUser(String userName) {
		JsonResult jsonResult = JsonResult.createSuccess();
		AppCache.userLoginFailedRecord.remove(userName);
		return jsonResult;
	}

	/**
	 * 重新加载代理域名：调用平台接口
	 * 
	 * @return
	 */
	@At("/sys/refreshAgentDomain")
	@Ok("json")
	public JsonResult refreshAgentDomain() {
		JsonResult jsonResult = JsonResult.createSuccess();
		boolean flag = false;
		try {
			AppCache.loadAgentUrlLock.lock();
			flag = AppCache.loadAgentDomain(propertiesLoader);
		} finally {
			AppCache.loadAgentUrlLock.unlock();
		}
		if (!flag) {
			jsonResult = JsonResult.createFalied();
		}
		return jsonResult;
	}

	/**
	 * 重新加载内存数据：调用管理中心接口
	 * 
	 * @return
	 */
	@At("/sys/reloadCache")
	@Ok("json")
	public JsonResult reloadCache() {
		JsonResult jsonResult = JsonResult.createSuccess();
		boolean flag = false;
		try {
			flag = systemServcieImpl.initCacheData();
		} finally {
		}
		if (!flag) {
			jsonResult = JsonResult.createFalied();
		}
		return jsonResult;
	}

	/**
	 * 刷新静态文件版本号
	 * 
	 * @return
	 */
	@At("/sys/refreshFileVer")
	@Ok("json")
	public JsonResult refreshFileVer() {
		JsonResult jsonResult = JsonResult.createSuccess();
		Constants.rsvn = System.currentTimeMillis();
		Constants.static_dynamic_enabled = propertiesLoader.getBoolean("vinbet.static.dynamic.enabled", false);
		Constants.static_url = propertiesLoader.getTrim("vinbet.static.url", "");
		return jsonResult;
	}

	@At("/sys/registed")
	@Ok("jsp:page.system.registerInfo")
	public void registed() {

	}

	@At("/sys/setStaticUrl")
	@Ok("json")
	@Filters
	public Object setStaticUrl(String source, String url) {
		FileOutputStream fos = null;
		try {
			Properties p = new Properties();

			p.setProperty("vinbet.static.dynamic.enabled", source.equals("1") ? "true" : "false");
			Constants.static_dynamic_enabled = Boolean.parseBoolean(source.equals("1") ? "true" : "false");

			if (url != null && !url.equals("")) {
				p.setProperty("vinbet.static.url", url);
				Constants.static_url = url;
			}
			fos = new FileOutputStream(Mvcs.getServletContext().getRealPath("/WEB-INF/classes/com/vinbet/mobile/config/cdn.properties"));
			p.store(fos, null);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fos != null) {
					fos.close();
					fos.flush();
				}
			} catch (IOException e) {
			}
		}
		return null;
	}

	/**
	 * 静态资源URL设置页面
	 */
	@At("/sys/cdn")
	@Ok("jsp:page.system.cdn")
	// @Filters
	public Object cdn() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", Constants.static_url);
		map.put("source", Constants.static_dynamic_enabled);
		return map;
	}

	@At("/sys/cache")
	@Ok("jsp:page.system.cache")
	// @Filters
	public Object cache() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("url", Constants.static_url);
		map.put("source", Constants.static_dynamic_enabled);
		return map;
	}
}
