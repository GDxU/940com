package com.vinbet.mobile.action.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.JsonResult;

@IocBean(singleton = false)
@Filters(@By(type = CheckSession.class, args = { "ADMIN_USER_SESSION", "/admin" }))
public class SysUsersAction<E> {
	private static final Logger log = LogManager.getLogger(SysUsersAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	@At("/sys/onLineUser")
	@Ok("jsp:page.system.onLineUsers")
	public void main() {

	}

	@At("/sys/seachOnlineUser")
	@Ok("json")
	public JsonResult seachOnlineUser(HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			Map<String, HttpSession> onlineUsers = AppCache.onlineUsers;
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			Iterator<Entry<String, HttpSession>> it = onlineUsers.entrySet().iterator();
			while (it.hasNext()) {
				Map<String, String> map = new HashMap<String, String>();
				Entry<String, HttpSession> entry = it.next();
				HttpSession tem = entry.getValue();
				if(null != tem){
					try {
						UserInfo userInfo = (UserInfo) tem.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
						if (null != userInfo) {
							map.put("userName", entry.getKey());
							map.put("type", userInfo.getUserType() + "");
							map.put("time", userInfo.getLoginTime());
							map.put("ip", userInfo.getLoginIp());
							list.add(map);
						}
					} catch (Exception e) {
						log.error("session invalidate,online user remove...");
						it.remove();
					}
				}else{
					log.error("session is null,online user remove...");
					it.remove();
				}
			}
			jsonResult.addAll(list);
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied(e.fillInStackTrace().toString());
			log.error(e);
		}
		return jsonResult;
	}

	@At("/sys/killout")
	@Ok("json")
	public JsonResult logout(@Param("username") String username, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			HttpSession existSession = AppCache.onlineUsers.get(username);
			if (existSession != null) {
				try {
					existSession.setAttribute("logout", "killout");
					existSession.invalidate();
				} catch (Exception e) {
				}
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			log.error(e);
		}
		return jsonResult;
	}
}
