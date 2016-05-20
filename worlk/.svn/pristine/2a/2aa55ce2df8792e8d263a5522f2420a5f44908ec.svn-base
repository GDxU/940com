package com.vinbet.mobile.timer.sport;

import java.util.Date;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.Constants;

/**
 * Created by Ray on 2014/10/28.
 */

@IocBean
public class SportHeartbeatTask implements Runnable {
    private Log log = Logs.getLog(SportHeartbeatTask.class);
    @Inject
    private PropertiesLoader propertiesLoader;


    public void run() {
        Date now = new Date();
        long hbTm = 1000L * propertiesLoader.getInt("vinbet.heartbeat.sport", 60);
        if (AppsStatusUtil.getSportStatus() == true && (now.getTime() - Constants.heartbeat_lasttime_sport) > hbTm) {
            AppsStatusUtil.setSportStatus(false);
            log.error("Exception:手机端与SPORTS通讯异常（长时间[" + hbTm / 1000 + "秒]未拉取到SPORTS后台数据）");
        }
    }
}