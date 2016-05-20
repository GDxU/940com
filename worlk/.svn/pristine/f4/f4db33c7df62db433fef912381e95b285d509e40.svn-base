package com.vinbet.mobile.timer.hkc;

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
public class HkcHeartbeatTask implements Runnable {
    private Log logger = Logs.getLog(HkcHeartbeatTask.class);
    @Inject
    private PropertiesLoader propertiesLoader;


    public void run() {
        Date now = new Date();
        long hbTm = 1000L * propertiesLoader.getInt("vinbet.heartbeat.hkc", 60);
        if (AppsStatusUtil.getHkcStatus() == true && (now.getTime() - Constants.heartbeat_lasttime_hkc) > hbTm) {
            AppsStatusUtil.setHkcStatus(false);
            logger.error("Exception:手机端与HKC通讯异常（长时间[" + hbTm / 1000 + "秒]未拉取到HKC后台数据）");
        }
    }
}
