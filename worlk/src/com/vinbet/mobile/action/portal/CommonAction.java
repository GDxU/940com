package com.vinbet.mobile.action.portal;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.sys.PropertiesLoader;

public abstract class CommonAction {
	private Log log = Logs.getLog(CommonAction.class);

	public String getDictVal(String dictType, String dictCode, HttpServletRequest request) {
		try {
			Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
			JSONArray jsonArray = JSONArray.parseArray(i18n.get(dictType));
			for (Object object : jsonArray) {
				JSONObject jsonObject = (JSONObject) object;
				if (dictCode.equals(jsonObject.getString("code"))) {
					return jsonObject.getString("val");
				}
			}
		} catch (Exception e) {
			log.error("getDictVal error,dictType:" + dictType + ",dictCode:" + dictCode, e);
		}
		return null;
	}

	public String getDepositMark(PropertiesLoader propertiesLoader, int type) {
		String[] marks = propertiesLoader.getTrim("vinbet.money.mark").split(";");
		Map<String, String> map = new HashMap<String, String>();
		for (int i = 0; i < marks.length; i++) {
			String[] tem = marks[i].split(":");
			map.put(tem[0], tem[1]);
		}
		return map.get(type + "");
	}

	/**
	 * 写cookie
	 * 
	 * @return
	 */
	public void addCookie(final String key, final String value) {
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge(60 * 60 * 24 * 365);
		cookie.setPath("/");
		Mvcs.getResp().addCookie(cookie);
	}

	/**
	 * 读cookie
	 */
	public Cookie getCookie(final String key) {
		HttpServletRequest request = Mvcs.getReq();
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (Cookie cookie : cookies) {
				if (key.equals(cookie.getName())) {
					return cookie;
				}
			}
		}
		return null;
	}

	/**
	 * 获取浏览器客户端得IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getClientIp(HttpServletRequest request) {
		try {
			String ip_for = request.getHeader("x-forwarded-for");
			String ip_client = request.getHeader("http_client_ip");
			String un = "unknown";
			if (ip_for != null && !ip_for.equalsIgnoreCase(un) && ip_for.trim().length() > 0) {
				String temp = ip_for.trim();
				// 如果包含转发地址，则只取第一个真实的地址
				if (temp.indexOf(",") != -1) {
					ip_for = temp.split(",")[0];
				} else {
					ip_for = temp;
				}
				return ip_for;
			} else if (ip_client != null && !ip_client.equalsIgnoreCase(un) && ip_client.trim().length() > 0) {
				return ip_client;
			} else {
				return request.getRemoteAddr();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
