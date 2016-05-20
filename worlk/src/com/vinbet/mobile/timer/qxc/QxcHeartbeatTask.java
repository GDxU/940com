package com.vinbet.mobile.timer.qxc;

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
public class QxcHeartbeatTask implements Runnable {
    private Log logger = Logs.getLog(QxcHeartbeatTask.class);
    @Inject
    private PropertiesLoader propertiesLoader;


    public void run() {
        Date now = new Date();
        long hbTm = 1000L * propertiesLoader.getInt("vinbet.heartbeat.qxc", 60);
        if (AppsStatusUtil.getQxcStatus() == true && (now.getTime() - Constants.heartbeat_lasttime_qxc) > hbTm) {
            AppsStatusUtil.setQxcStatus(false);
            logger.error("Exception:手机端与QXC通讯异常（长时间[" + hbTm / 1000 + "秒]未拉取到QXC后台数据）");
        }
    }
}
