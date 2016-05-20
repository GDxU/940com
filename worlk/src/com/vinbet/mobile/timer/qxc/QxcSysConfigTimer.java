package com.vinbet.mobile.timer.qxc;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

/**
 * 定时去七星彩后台获取七星彩系统配置信息
 */
@IocBean
public class QxcSysConfigTimer implements Runnable {
	private static final Logger logger = LogManager.getLogger(QxcSysConfigTimer.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	@Override
	public void run() {
		int tryCount = 1800;
		while (true) {
			// 1显示、0隐藏
			try {
				tryCount--;
				this.loadqxcSysConfig();
				break;
			} catch (Exception e) {
				logger.error(" >> 拉取QXC系统配置数据异常,原因：QXC后台维护中或接口数据结构有调整...");
				logger.debug(e);
				if (tryCount <= 0) {
					break;
				}
				try {
					TimeUnit.SECONDS.sleep(30);
				} catch (InterruptedException ie) {
				}
			}
		}
	}

	public void loadqxcSysConfig() {
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.qxc.url")).append("/gamefront").toString();
		// String url = "http://qx.en2012.com:12308/z3/client/gamefront";
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String response = HttpClientUtil.doGetString(url, parameters, false);
		JSONObject jo = JSON.parseObject(response);
		if (jo == null) {
			logger.error("与qxc后台通信异常，拉取七星彩系统配置数据失败.<<" + response);
			return;
		}
		Map<String, String> qxcSysConfig = AppCache.qxcSysConfig;
		JSONArray gl = jo.getJSONArray("gameList");
		for (int i = 0; i < gl.size(); i++) {
			JSONObject obj = (JSONObject) gl.get(i);
			if (1 != obj.getIntValue("status")) {
				if (null == obj.get("parentGc")) {
					qxcSysConfig.put("gc_" + obj.getString("gameCode"), obj.getString("gameCode"));
				} else {
					if (null == qxcSysConfig.get("pg_" + obj.get("parentGc"))) {
						qxcSysConfig.put("pg_" + obj.get("parentGc"), obj.getString("gameCode"));
					} else {
						if (qxcSysConfig.get("pg_" + obj.get("parentGc")).indexOf(obj.getString("gameCode")) < 0) {
							qxcSysConfig.put("pg_" + obj.get("parentGc"), qxcSysConfig.get("pg_" + obj.get("parentGc")) + "," + obj.getString("gameCode"));
						}
					}
				}
			} else {
				if (null == obj.get("parentGc")) {
					qxcSysConfig.put("gc_" + obj.getString("gameCode"), "");
				} else {
					if (null != qxcSysConfig.get("pg_" + obj.get("parentGc"))) {
						if (qxcSysConfig.get("pg_" + obj.get("parentGc")).indexOf(obj.getString("gameCode")) >= 0) {
							qxcSysConfig.put("pg_" + obj.get("parentGc"), qxcSysConfig.get("pg_" + obj.get("parentGc")).replace(obj.getString("gameCode") + ",", ""));
						}
					}
				}
			}
		}

		AppsStatusUtil.setQxcStatus(true);
		Constants.heartbeat_lasttime_qxc = System.currentTimeMillis();
	}

	public static void main(String[] args) {
		QxcSysConfigTimer qt = new QxcSysConfigTimer();
		// qt.loadqxcSysConfig();
		// System.out.println("aaab".indexOf("ac"));
	}
}
