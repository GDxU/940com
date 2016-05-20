package com.vinbet.mobile.timer.hkc;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.sys.AppsStatusUtil;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.hkc.HKCCache;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

/**
 * Created by Ray on 2014/10/28.
 */

@IocBean
public class RateRequestTask implements Runnable {
	private Log log = Logs.getLog(RateRequestTask.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	private long ver = 0;
	private ExecutorService pool = Executors.newFixedThreadPool(10, new ThreadFactory() {
		AtomicInteger threadNumber = new AtomicInteger(1);

		@Override
		public Thread newThread(Runnable runnable) {
			return new Thread(runnable, "HkcRateThreadPool" + "-" + threadNumber.getAndIncrement());
		}
	});

	public void run() {
		String response = null;
		try {
			//log.info("HKC RateRequestTask start...");
			long requetBegin = System.currentTimeMillis();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.hkc")));
			response = HttpClientUtil.doGetString(propertiesLoader.get("vinbet.hkc.url") + "/rateinfo", parameters, true);
			if (response == null || response.equals("")) {
				log.info("HKC RateRequestTask response << " + response);
			} else {
				log.debug("HKC RateRequestTask response << " + response);
				JSONObject jo = JSON.parseObject(response);
				if (jo != null && jo.getString("description").equalsIgnoreCase("success")) {
					CountDownLatch countDownLatch = new CountDownLatch(7);
					ConcurrentHashMap<String, String> oldRateMap = new ConcurrentHashMap<String, String>();
					ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> fullRateMap = new ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>>();
					ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> partRateMap = new ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>>();
					RateProcessThread rpta = new RateProcessThread(ver, jo, countDownLatch, "a", oldRateMap, fullRateMap, partRateMap);
					pool.submit(rpta);
					RateProcessThread rptb = new RateProcessThread(ver, jo, countDownLatch, "b", oldRateMap, fullRateMap, partRateMap);
					pool.submit(rptb);
					RateProcessThread rptc = new RateProcessThread(ver, jo, countDownLatch, "c", oldRateMap, fullRateMap, partRateMap);
					pool.submit(rptc);
					RateProcessThread rptd = new RateProcessThread(ver, jo, countDownLatch, "d", oldRateMap, fullRateMap, partRateMap);
					pool.submit(rptd);
					WSCProcessThread wscProcessThread = new WSCProcessThread(jo, countDownLatch);
					pool.submit(wscProcessThread);
					MarketCtrlProcessThread marketCtrlProcessThread = new MarketCtrlProcessThread(jo, countDownLatch);
					pool.submit(marketCtrlProcessThread);
					PlayCtrlProcessThread playCtrlProcessThread = new PlayCtrlProcessThread(jo, countDownLatch);
					pool.submit(playCtrlProcessThread);
					countDownLatch.await();
					HKCCache.oldRateMap = oldRateMap;
					HKCCache.fullRateMap = fullRateMap;
					HKCCache.partRateMap.remove(ver - HKCCache.cacheCount);
					HKCCache.partRateMap.put(ver, partRateMap);
					HKCCache.currVer = ver;
					AppsStatusUtil.setHkcStatus(true);
					Constants.heartbeat_lasttime_hkc = System.currentTimeMillis();
				} else {
					log.info("HKC RateRequestTask response << " + response);
				}
				if (ver % 10 == 0) {
					log.info("HKC RateRequestTask handle time:" + (System.currentTimeMillis() - requetBegin));
				}
			}
		} catch (Exception e) {
			log.error(">> 拉取HKC盘口数据异常，原因：HKC后台维护中或接口数据结构有调整...");
			log.debug("HKC RateRequestTask error,response << " + response, e);
		} finally {
			ver++;
		}

	}

	public void cancel() {
		pool.shutdown();
	}
}
