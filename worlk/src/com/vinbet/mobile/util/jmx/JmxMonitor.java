package com.vinbet.mobile.util.jmx;

import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.I18nLoader;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.timer.ssc.SscSysConfigTimer;
import com.vinbet.mobile.util.DateUtil;

@IocBean
public class JmxMonitor {
	@Inject
	private SscSysConfigTimer sscSysConfigTimer;
	@Inject
	private PropertiesLoader propertiesLoader;

	/**
	 * 查看在线用户信息
	 * 
	 * @return
	 */
	public String ViewOnlineUsers() {
		Map<String, HttpSession> onlineUsers = AppCache.onlineUsers;
		// 直接查询oracle
		final String td = "<td style=\"background: #fff; font-size:15px; padding: 6px 6px 6px 15px; color: #4f6b72;\" >VALUE</td>";
		final String th = "<th style=\"color: #4f6b72;text-transform: uppercase; text-align: left; padding: 6px 6px 6px 6px; background: #CAE8EA no-repeat;\" scope=\"col\">" + "VALUE" + "</th>";
		StringBuffer sb = new StringBuffer();
		// 页面自动刷新
		String refresh = "<script language=\"JavaScript\">function myrefresh(){window.location.reload();}setTimeout('myrefresh()',5000);</script>";
		sb.append("<head><meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />" + refresh + "</head>");
		sb.append("<font color='green'> <b>Online Users&nbsp;</font><font color='red'> " + (onlineUsers.size()) + "</b></font><hr>");
		sb.append("<table style=\"width:100%; border-left: 1px solid #C1DAD7; border-right: 1px solid #C1DAD7; border-bottom: 1px solid #C1DAD7; border-top: 1px solid #C1DAD7; padding:0; margin:0; background:#E6EAE9; font-size:12px;\" cellspacing=\"1\">");
		// 标题
		sb.append("<tr>");
		sb.append(th.replace("VALUE", "username"));
		sb.append(th.replace("VALUE", "login time"));
		sb.append(th.replace("VALUE", "login ip"));
		sb.append("</tr>");
		if (onlineUsers.isEmpty()) {
			sb.append("<tr><td colspan=\"3\" style=\"background: #fff; font-size:15px; text-align:center;padding: 6px 6px 6px 12px; color: red;\">No online users</td></tr>");
		} else {
			Iterator<Entry<String, HttpSession>> iter = onlineUsers.entrySet().iterator();
			while (iter.hasNext()) {
				Entry<String, HttpSession> entry = iter.next();
				HttpSession session = entry.getValue();
				UserInfo userinfo = (UserInfo) session.getAttribute("USER_SESSION");
				sb.append("<tr>");
				sb.append(td.replace("VALUE", userinfo.getAccoutName()));
				sb.append(td.replace("VALUE", DateUtil.formatDateByFormat(new Date(session.getCreationTime()), "yyyy-MM-dd HH:ss:mm")));
				sb.append(td.replace("VALUE", userinfo.getLoginIp()));
				sb.append("</tr>");
			}
		}
		sb.append("</table>");
		return sb.toString();
	}

	/**
	 * 解除登录失败被锁定用户
	 * 
	 * @param userName
	 */
	public String UnlockedLoginFailedUser(String userName) {
		if (userName == null || userName.equals("")) {
			return "<font color=red>User name cannot be empty!</font>";
		}
		AppCache.userLoginFailedRecord.remove(userName);
		return "<font color=green>User[" + userName + "] is unlocked!</font>";
	}

	/**
	 * 踢出在线用户
	 * 
	 * @param userName
	 * @return
	 */
	public String KickedOutOnlineUser(String userName) {
		if (userName == null || userName.equals("")) {
			return "<font color=red>User name cannot be empty!</font>";
		}
		HttpSession session = AppCache.onlineUsers.remove(userName);
		if (session != null) {
			session.invalidate();
			return "<font color=green>User[" + userName + "] is Kicked Out!</font>";
		} else {
			return "<font color=red>User [" + userName + "] not online!</font>";
		}
	}

	/**
	 * 重新拉取一次时时彩系统设定数据
	 * 
	 * @return
	 */
	public boolean refreshSscSysConfig() {
		boolean result = false;
		try {
			sscSysConfigTimer.loadSscSysConfig();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 加载代理域名:调用平台接口
	 * 
	 * @return
	 */
	public boolean reloadAgentDomain() {
		boolean flag = false;
		try {
			AppCache.loadAgentUrlLock.lock();
			flag = AppCache.loadAgentDomain(propertiesLoader);
		} finally {
			AppCache.loadAgentUrlLock.unlock();
		}
		return flag;
	}

	/**
	 * 热加载本地化文件
	 * 
	 * @return
	 */
	public boolean reloadI18n() {
		I18nLoader i18nLoader = new I18nLoader();
		Map<String, Map<String, Object>> resMap = i18nLoader.load("i18n");
		// System.out.println(Mvcs.getName());
		Mvcs.ctx.localizations.put("nutz", resMap);
		return true;
	}

	/**
	 * 热加载配置信息
	 * 
	 * @return
	 */
	public boolean reloadCfg() {
		propertiesLoader.setPaths("com/vinbet/mobile/config");
		return true;
	}
}
