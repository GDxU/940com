package com.vinbet.mobile.timer.ssc;

import java.util.Date;
import java.util.TimerTask;

import com.vinbet.mobile.sys.AppsStatusUtil;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.Constants;

/**
 * Created by Ray on 2014/10/28.
 */

@IocBean
public class SscHeartbeatTask implements Runnable {
	private Log logger = Logs.getLog(SscHeartbeatTask.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	public void run() {
		Date now = new Date();
		long hbTm = 1000L * propertiesLoader.getInt("vinbet.heartbeat.ssc", 60);
		if (AppsStatusUtil.getSscStatus() == true && (now.getTime() - Constants.heartbeat_lasttime_ssc) > hbTm) {
			AppsStatusUtil.setSscStatus(false);
			logger.error("Exception:手机端与SSC通讯异常（长时间[" + hbTm / 1000 + "秒]未拉取到SSC后台数据）");
		}
	}
}
