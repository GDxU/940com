package com.vinbet.mobile.timer.hkc;

import java.util.concurrent.CountDownLatch;

import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.entity.hkc.MarketCtrl;
import com.vinbet.mobile.sys.hkc.HKCCache;

/**
 * Created by Ray on 2014/10/29.
 */
public class MarketCtrlProcessThread implements Runnable {
	private Log log = Logs.getLog(MarketCtrlProcessThread.class);
	private JSONObject jo;
	private CountDownLatch cd;

	public MarketCtrlProcessThread(JSONObject jo, CountDownLatch cd) {
		this.jo = jo;
		this.cd = cd;
	}

	public void run() {
		try {
			JSONObject jo = this.jo.getJSONObject("current");
			MarketCtrl mc = new MarketCtrl();
			mc.setIssue(jo.getString("issue"));
			jo = jo.getJSONObject("hcm");
			int seal = jo.getIntValue("seal");
			int nseal = jo.getIntValue("nseal");
			mc.setSeal(seal);
			mc.setNseal(nseal);
			mc.setHpStatus(jo.getIntValue("hpStatus"));
			mc.setSealTime(seal == 0 ? 0l : jo.getLongValue("sealTime"));
			mc.setNsealTime(nseal == 0 ? 0l : jo.getLongValue("nsealTime"));
			HKCCache.marketCtrl = mc;
		} catch (Exception e) {
			log.error("HKC MarketCtrlProcessThread error:", e);
		} finally {
			cd.countDown();
		}
	}

}
