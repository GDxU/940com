package com.vinbet.mobile.timer.hkc;

import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.entity.hkc.HKCResult;
import com.vinbet.mobile.sys.hkc.HKCCache;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;

import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * Created by Ray on 2014/10/29.
 */
public class WSCProcessThread implements Runnable {
	private Log log = Logs.getLog(WSCProcessThread.class);
    private JSONObject jo;
    private CountDownLatch cd;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public WSCProcessThread(JSONObject jo, CountDownLatch cd) {
        this.jo = jo;
        this.cd = cd;
    }

    public void run() {
		try {
			JSONObject jo = this.jo.getJSONObject("wsc");
			jo.remove("id");
			ConcurrentHashMap<String, String> map = new ConcurrentHashMap<String, String>();
			for (Map.Entry<String, Object> entry : jo.entrySet()) {
				map.put(entry.getKey(), String.valueOf(entry.getValue()));
			}
			HKCCache.wscMap = map;
			HKCResult result = new HKCResult();
			jo = this.jo.getJSONObject("handicapInfo");
			result.setIssue(jo.getString("issue"));
			result.setOpenAwardTime(sdf.format(new Date(jo.getLongValue("openAwardTime"))));
			result.setOpenBall(jo.getString("openBall"));
			result.setAnimal(jo.getString("animal"));
			jo = jo.getJSONObject("ai");
			if (jo != null) {
				result.setBallSum(jo.getString("ballSum"));
				result.setFirstsd(jo.getString("firstsd"));
				result.setBigSmall(jo.getString("bigSmall"));
				result.setComFirstsd(jo.getString("comFirstsd"));
				result.setTotalFirstsd(jo.getString("totalFirstsd"));
				result.setTotalBigSmall(jo.getString("totalBigSmall"));
			}
			HKCCache.result = result;
		} catch (Exception e) {
        	log.error("HKC WSCProcessThread error:", e);
        } finally {
            cd.countDown();
        }
    }


}
