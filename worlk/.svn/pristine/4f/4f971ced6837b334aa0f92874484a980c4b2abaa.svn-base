package com.vinbet.mobile.timer.hkc;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.entity.hkc.PlayCtrl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.hkc.HKCCache;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;

import org.nutz.log.Log;
import org.nutz.log.Logs;

/**
 * Created by Ray on 2014/10/29.
 */
public class PlayCtrlProcessThread implements Runnable {
	private Log log = Logs.getLog(PlayCtrlProcessThread.class);
    private JSONObject jo;
    private CountDownLatch cd;

    public PlayCtrlProcessThread(JSONObject jo, CountDownLatch cd) {
        this.jo = jo;
        this.cd = cd;
    }

    public void run() {
        try {
            JSONArray ja = this.jo.getJSONArray("gameList");
            ConcurrentHashMap<String, PlayCtrl> playCtrlMap = new ConcurrentHashMap<String, PlayCtrl>();
            ConcurrentHashMap<String, List<PlayCtrl>> playCtrlTreeMap = new ConcurrentHashMap<String, List<PlayCtrl>>();
            for (int i = 0; i < ja.size(); i++) {
                JSONObject jo = ja.getJSONObject(i);
                PlayCtrl pc = new PlayCtrl();
                pc.setGameCode(jo.getString("gc")); // gc
                pc.setGameName(jo.getString("gn")); // gn
                pc.setLevel(jo.getIntValue("l")); // l
                pc.setStatus(jo.getIntValue("s")); // s
                pc.setParentGc(jo.getString("pgc")); // pgc
                playCtrlMap.put(pc.getGameCode(), pc);
                if (pc.getParentGc() != null) {
                    if (playCtrlTreeMap.get(pc.getParentGc()) == null) {
                        playCtrlTreeMap.put(pc.getParentGc(), new ArrayList<PlayCtrl>());
                    }
                    playCtrlTreeMap.get(pc.getParentGc()).add(pc);
                }
            }
            HKCCache.playCtrlMap = playCtrlMap;
            HKCCache.playCtrlTreeMap = playCtrlTreeMap;
            hkcSysConfig();
        } catch (Exception e) {
        	log.error("HKC PlayCtrlProcessThread error:", e);
        } finally {
            cd.countDown();
        }
    }
    
    public void hkcSysConfig(){
		//{19=0, 11=0, 10=0, 15=0, 18=0, 17=0, 12=0}
		Map<String, String> hkcSysConfig = AppCache.hkcSysConfig;
		hkcSysConfig.put("tm", HKCCache.getPc("10").getStatus()+"");
		hkcSysConfig.put("zm", HKCCache.getPc("11").getStatus()+"");
		hkcSysConfig.put("zmt", HKCCache.getPc("12").getStatus()+"");
		hkcSysConfig.put("lm", HKCCache.getPc("15").getStatus()+"");
		hkcSysConfig.put("gg", HKCCache.getPc("17").getStatus()+"");
		hkcSysConfig.put("tx", HKCCache.getPc("18").getStatus()+"");
		hkcSysConfig.put("tmtw", HKCCache.getPc("19").getStatus()+"");
		//五行20 半波21
		if(HKCCache.getPc("20").getStatus()+HKCCache.getPc("21").getStatus()<2){
			hkcSysConfig.put("wxbb", "0");
		}else{
			hkcSysConfig.put("wxbb", "1");
		}
		hkcSysConfig.put("qm", HKCCache.getPc("29").getStatus()+"");
		hkcSysConfig.put("lx", HKCCache.getPc("16").getStatus()+"");
		//一肖13 尾数14
		if(HKCCache.getPc("13").getStatus()+HKCCache.getPc("14").getStatus()<2){
			hkcSysConfig.put("yxws", "0");
		}else{
			hkcSysConfig.put("yxws", "1");
		}
		hkcSysConfig.put("sxl", HKCCache.getPc("23").getStatus()+"");
		hkcSysConfig.put("wsl", HKCCache.getPc("24").getStatus()+"");
		hkcSysConfig.put("bz", HKCCache.getPc("22").getStatus()+"");
		hkcSysConfig.put("dxzy", HKCCache.getPc("30").getStatus()+"");
		hkcSysConfig.put("tzp", HKCCache.getPc("31").getStatus()+"");
		hkcSysConfig.put("zx", HKCCache.getPc("34").getStatus()+"");
		hkcSysConfig.put("zongxiao", HKCCache.getPc("32").getStatus()+"");
		hkcSysConfig.put("qsb", HKCCache.getPc("33").getStatus()+"");
		hkcSysConfig.put("lh", HKCCache.getPc("41").getStatus()+"");
		hkcSysConfig.put("tmbz", HKCCache.getPc("35").getStatus()+"");
		hkcSysConfig.put("zmbz", HKCCache.getPc("36").getStatus()+"");
		hkcSysConfig.put("zhsm", HKCCache.getPc("42").getStatus()+"");
		hkcSysConfig.put("banbanbo", HKCCache.getPc("43").getStatus()+"");
		hkcSysConfig.put("sxsm", HKCCache.getPc("44").getStatus()+"");
		hkcSysConfig.put("zmtbz", HKCCache.getPc("45").getStatus()+"");
	}
}
