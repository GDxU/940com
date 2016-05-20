package com.vinbet.mobile.domain;

import javax.servlet.http.HttpSession;

public class ApiUser {

	public HttpSession platSession = null; // 平台会话

	//public HttpSession subSysSession = null;// 子应用会话

	public void destoryAllSesssion() {
		if (platSession != null) {
			try {
				platSession.setAttribute("logout", "passive");
				platSession.invalidate();
				platSession = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		if (subSysSession != null) {
//			try {
//				subSysSession.invalidate();
//				subSysSession = null;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
	}
}
