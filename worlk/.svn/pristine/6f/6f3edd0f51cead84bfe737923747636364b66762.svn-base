package com.vinbet.mobile.sys;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.util.Constants;

public class SessionListener implements HttpSessionListener {
	private static final Logger log = LogManager.getLogger(SessionListener.class);

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// HttpSession session = event.getSession();
		// init(session);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		UserInfo userInfo = (UserInfo) session.getAttribute(Constants.USER_SESSION);
		if (userInfo == null) {
			return;
		}
		Object logoutWay = session.getAttribute("logout");
		if (null == logoutWay) {
			log.info("用户[" + userInfo.getAccoutName() + "]会话超时退出.");
		} else if (String.valueOf(logoutWay).equals("initiative")) {
			log.info("用户[" + userInfo.getAccoutName() + "]主动退出.");
		} else if (String.valueOf(logoutWay).equals("killout")) {
			log.info("用户[" + userInfo.getAccoutName() + "]被管理员强制踢出.");
		} else if (String.valueOf(logoutWay).equals("passive")) {
			log.info("用户[" + userInfo.getAccoutName() + "]在其它终端登录,被强制退出.");
		}
		AppCache.onlineUsers.remove(userInfo.getAccoutName());
	}

	// 初始化 bean
	public void init(HttpSession session) {
	}

}
