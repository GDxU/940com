package com.vinbet.mobile.timer.hkc;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.sys.hkc.HKCCache;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;

import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * Created by Ray on 2014/10/29.
 */
public class RateProcessThread implements Runnable {

    private Log log = Logs.getLog(RateProcessThread.class);
    private long ver;
    private JSONObject jo;
    private CountDownLatch cd;
    private String mt;
    //作为基础数据,仅用于判断是否有变化<MarketType-gid_ball,JsonRecord>
    private ConcurrentHashMap<String, String> oldRateMap;
    //<MarketType-Gid,<ball,rates>>
    private ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> fullRateMap;
    //<MarketType-Gid,<ball,rates>>>
    private ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> partRateMap;

    public RateProcessThread(long ver, JSONObject jo, CountDownLatch cd, String mt, ConcurrentHashMap<String, String> oldRateMap, ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> fullRateMap, ConcurrentHashMap<String, ConcurrentHashMap<String, double[]>> partRateMap) {
        this.ver = ver;
        this.jo = jo;
        this.cd = cd;
        this.mt = mt.toUpperCase();
        this.oldRateMap = oldRateMap;
        this.fullRateMap = fullRateMap;
        this.partRateMap = partRateMap;
    }

    public void run() {
        try {
            JSONObject map = jo.getJSONObject("map" + mt);
            HashMap<String, double[]> rateMap = new HashMap<String, double[]>();
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                boolean isChange = false;
                String oldVal = null;
                if ((oldVal = HKCCache.oldRateMap.get(mt + "-" + entry.getKey())) != null && !oldVal.equals(String.valueOf(entry.getValue()))) {
                    isChange = true;
                }
                oldRateMap.put(mt + "-" + entry.getKey(), String.valueOf(entry.getValue()));
                String gid = entry.getKey().substring(0, entry.getKey().indexOf("_"));
                String ball = entry.getKey().substring(entry.getKey().indexOf("_") + 1, entry.getKey().length());
                JSONObject item = JSON.parseObject(String.valueOf(entry.getValue()));
                double[] rs = new double[3];
                rs[0] = scaleConv(item.getDoubleValue("r"), 3);
                rs[1] = scaleConv(item.getDoubleValue("r2"), 3);
                rs[2] = item.getDoubleValue("o");
//                if (mt.equalsIgnoreCase("d") && gid.equals("1101") && ball.equals("01")) {
//                    System.out.println(isChange);
//                    System.out.println("oldVal --> " + oldVal);
//                    System.out.println("newVal --> " + String.valueOf(entry.getValue()));
//                    System.out.println("ball-" + ball + "   " + JSON.toJSONString(rs));
//                }
                String rmk = mt + "-" + gid;
                if (isChange) {
                    isChange = false;
                    JSONObject oitem = JSON.parseObject(oldVal);
                    double[] ors = new double[3];
                    ors[0] = scaleConv(oitem.getDoubleValue("r"), 3);
                    ors[1] = scaleConv(oitem.getDoubleValue("r2"), 3);
                    ors[2] = oitem.getDoubleValue("o");
                    double[] crs = new double[3];
                	if (ors[0] != rs[0]) {
                		isChange = true;
                		crs[0] = rs[0];
                		crs[1] = rs[1];
                		crs[2] = rs[2];
                	}
                	if (ors[1] != rs[1]) {
                		isChange = true;
                		crs[0] = rs[0];
                		crs[1] = rs[1];
                		crs[2] = rs[2];
                	}
                	if(ors[2] != rs[2]){
                		isChange = true;
                		crs[0] = rs[0];
                		crs[1] = rs[1];
                		crs[2] = rs[2];
                	}
                    if (isChange) {
                        if (partRateMap.get(rmk) == null) {
                            partRateMap.put(rmk, new ConcurrentHashMap<String, double[]>());
                        }
                        partRateMap.get(rmk).put(ball, crs);
//                        if (mt.equalsIgnoreCase("d") && gid.equals("1101") && ball.equals("01")) {
//                            System.out.println("var  " + ver + " --> " + JSON.toJSONString(partRateMap.get("D-1101")));
//                        }
                    }
                }
                if (fullRateMap.get(rmk) == null) {
                    fullRateMap.put(rmk, new ConcurrentHashMap<String, double[]>());
                }
                fullRateMap.get(rmk).put(ball, rs);
            }
        } catch (Exception e) {
            log.error("HKC RateProcessThread error:", e);
        } finally {
            cd.countDown();
        }
    }

    //scaleConv(oitem.getDouble("rate"), 3);
    public double scaleConv(double v, int scale) {
        if (v == Double.valueOf(v).intValue()) {
            return Double.valueOf(v).intValue();
        } else {
            BigDecimal b = new BigDecimal(Double.toString(v));
            return b.setScale(scale, BigDecimal.ROUND_HALF_UP).doubleValue();
        }
    }
}

