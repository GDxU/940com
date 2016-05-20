package com.vinbet.mobile.action.hkc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

import com.vinbet.mobile.domain.HkcUser;
import com.vinbet.mobile.entity.hkc.PlayCtrl;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.hkc.HKCCache;
import com.vinbet.mobile.util.ArithUtil;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;

/**
 * Created by Ray on 2014/10/11.
 */
@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "HKC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
@At("/hkc")
public class TMAction {
	private Log log = Logs.getLog(TMAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;
	private Map<String, Object> obj = new HashMap<String, Object>();

	@At("/pcs/?")
	@Ok("json")
	public Object getPcs(String pid) {
		obj.put("pcs", HKCCache.getPcs(pid));
		return obj;
	}

	private ConcurrentHashMap<String, double[]> mergeRate(String v, String mt, String... ids) {
		ConcurrentHashMap<String, double[]> newMap = new ConcurrentHashMap<String, double[]>();
		ConcurrentHashMap<String, double[]> tempMap;
		for (String id : ids) {
			if (v.equalsIgnoreCase("a")) {
				tempMap = HKCCache.getFullRateMap(mt, id);
			} else {
				tempMap = HKCCache.getPartRateMap(Long.parseLong(v), mt, id);
			}
			if (tempMap != null) {
				for (Map.Entry<String, double[]> entry : tempMap.entrySet()) {
					newMap.put(id + "-" + entry.getKey(), entry.getValue());
				}
			}
		}
		return newMap;
	}

	private String convertHandType(String ht) {
		String temp = "A";
		if(ht!=null){
			if (ht.equals("1")) {
				temp = "A";
			} else if (ht.equals("2")) {
				temp = "B";
			} else if (ht.equals("3")) {
				temp = "C";
			} else if (ht.equals("4")) {
				temp = "D";
			}		
		}
		return temp;
	}

	@At("/rate/?/?")
	@Ok("json")
	public Object getRate(String gid, String v, HttpSession session) {
		try {
			HkcUser hkcUser = (HkcUser) session.getAttribute(Constants.HKC_USER_SESSION);
			String mt = convertHandType(hkcUser.getCht());
			ConcurrentHashMap<String, double[]> rateMap = null;
			HashMap<String, double[]> tem_rateMap = null;
			obj.put("v", HKCCache.currVer);
			if (v.equalsIgnoreCase("a")) {
				if (gid.equals("17")) {// 过关
					rateMap = mergeRate(v, mt, "1701", "1702", "1703", "1704", "1705", "1706");
				} else if (gid.equals("19")) {// 特码头尾
					rateMap = mergeRate(v, mt, "1901", "1902");
				} else if (gid.equals("39")) {// 特码头尾不中
					rateMap = mergeRate(v, mt, "3901", "3902");
				}  else {
					rateMap = HKCCache.getFullRateMap(mt, gid);
				}
			} else {
				if (gid.equals("17")) {// 过关
					rateMap = mergeRate(v, mt, "1701", "1702", "1703", "1704", "1705", "1706");
				} else if (gid.equals("19")) {// 特码头尾
					rateMap = mergeRate(v, mt, "1901", "1902");
				} else if (gid.equals("39")) {// 特码头尾不中
					rateMap = mergeRate(v, mt, "3901", "3902");
				} else {
					rateMap = HKCCache.getPartRateMap(Long.parseLong(v), mt, gid);
				}
			}
			// 过关没有用户降水
			if (!gid.equals("17")) {
				if (gid.equals("2301") || gid.equals("2302") || gid.equals("2303") || gid.equals("2304") || gid.equals("2305") || gid.equals("2306") || gid.equals("2307") || gid.equals("2308")) {
					gid = "230";
				}
				if (gid.equals("2401") || gid.equals("2402") || gid.equals("2403") || gid.equals("2404") || gid.equals("2405") || gid.equals("2406") || gid.equals("2407") || gid.equals("2408")) {
					gid = "240";
				}
				double offset = 0.0;
				if (null != hkcUser.getUserGameRateDiff(gid)) {
					offset = hkcUser.getUserGameRateDiff(gid);
				}
				if (rateMap != null) {
					tem_rateMap = new HashMap<String, double[]>();
					for (Map.Entry<String, double[]> entry : rateMap.entrySet()) {
						double[] rs = entry.getValue();
						double[] trs = { 0, 0, 0 };
						if (rs[0] > 0) {
							trs[0] = ArithUtil.formatDouble_3(rs[0] - offset);
						}
						if (rs[1] > 0) {
							trs[1] = ArithUtil.formatDouble_3(rs[1] - offset);
						}
						trs[2] = rs[2];
						tem_rateMap.put(entry.getKey(), trs);
					}
				}
				obj.put("r", tem_rateMap);
			} else {
				obj.put("r", rateMap);
			}
			int s = HKCCache.marketCtrl.getNseal();
			if (gid.startsWith("10")) {
				// 0:封特码,3:封波色跟两面,2:全封,1:全开
				int na = Integer.parseInt(HKCCache.wscMap.get("noAutoma"));
				if (na == 1) {
					if (s == 0) {
						if (HKCCache.marketCtrl.getSeal() == 0) {
							s = 2;
						} else {
							s = 3;
						}
					} else {
						if (HKCCache.marketCtrl.getSeal() == 0) {
							s = 0;
						} else {
							s = 1;
						}
					}
				} else {
					s = HKCCache.marketCtrl.getSeal();
					if (s == 0) {
						s = 2;
					}
				}
			}
			obj.put("s", s);
			obj.put("c", 0);
		} catch (Exception e) {
			log.error("获取盘口异常:", e);
			obj = new HashMap<String, Object>();
			obj.put("c", 1);
			obj.put("e", "系统异常，请联系客服！");
		}
		
		return obj;
	}

	@At("/tm")
	@Ok("jsp:page.hkc.games.tm")
	public Object temaPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("10"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/zm")
	@Ok("jsp:page.hkc.games.zm")
	public Object zhengmaPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("pcs", HKCCache.getPcs("11"));
		obj.put("pgc", 11);
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/ztm")
	@Ok("jsp:page.hkc.games.ztm")
	public Object zhengtemaPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("pcs", HKCCache.getPcs("12"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/zx")
	@Ok("jsp:page.hkc.games.zx")
	public Object zhengxiaoPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/tx")
	@Ok("jsp:page.hkc.games.tx")
	public Object texiaoPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/wxbb")
	@Ok("jsp:page.hkc.games.wxbb")
	public Object wuxingbanboPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("wx", HKCCache.getPc("20"));
		obj.put("bb", HKCCache.getPc("21"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/qm")
	@Ok("jsp:page.hkc.games.qm")
	public Object qimaPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/yxws")
	@Ok("jsp:page.hkc.games.yxws")
	public Object yixiaoweishuPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		List<PlayCtrl> pcs = new ArrayList<PlayCtrl>();
		pcs.add(HKCCache.getPc("13"));
		pcs.add(HKCCache.getPc("27"));
		pcs.add(HKCCache.getPc("14"));
		pcs.add(HKCCache.getPc("28"));
		obj.put("pcs", pcs);
		obj.put("yx", HKCCache.getPc("13"));
		obj.put("yxbz", HKCCache.getPc("27"));
		obj.put("ws", HKCCache.getPc("14"));
		obj.put("wsbz", HKCCache.getPc("28"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/tmtw")
	@Ok("jsp:page.hkc.games.tmtw")
	public Object tematouweiPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/gg")
	@Ok("jsp:page.hkc.games.gg")
	public Object guoguanPage() {
		List<PlayCtrl> pcs = HKCCache.getPcs("17");
		StringBuffer sb = new StringBuffer();
		HashMap<String, PlayCtrl> pcMap = new HashMap<String, PlayCtrl>();
		if (pcs != null) {
			for (PlayCtrl pc : pcs) {
				pcMap.put(pc.getGameCode(), pc);
				sb.append(pc.getGameCode()).append(",");
			}
			if (sb.length() > 1) {
				sb.deleteCharAt(sb.length() - 1);
			}
		}
		obj.put("maxAward", HKCCache.wscMap.get("maxAward"));
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("gids", sb.toString());
		obj.put("pcMap", pcMap);
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/lh")
	@Ok("jsp:page.hkc.games.lh")
	public Object toLhPage() {
		List<PlayCtrl> pcs = HKCCache.getPcs("41");
		StringBuffer sb = new StringBuffer();
		HashMap<String, PlayCtrl> pcMap = new HashMap<String, PlayCtrl>();
		if (pcs != null) {
			for (PlayCtrl pc : pcs) {
				pcMap.put(pc.getGameCode(), pc);
				sb.append(pc.getGameCode()).append(",");
			}
			if (sb.length() > 1) {
				sb.deleteCharAt(sb.length() - 1);
			}
		}
		obj.put("maxAward", HKCCache.wscMap.get("maxAward"));
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("gids", sb.toString());
		obj.put("pcMap", pcMap);
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/tmbz")
	@Ok("jsp:page.hkc.games.tmbz")
	public Object temabuzhongPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("35"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/zmbz")
	@Ok("jsp:page.hkc.games.zmbz")
	public Object zhengmabuzhongPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("36"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/zongxiao")
	@Ok("jsp:page.hkc.games.zongxiao")
	public Object zongxiao() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		// obj.put("wx", HKCCache.getPc("23"));
		// obj.put("bb", HKCCache.getPc("21"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}

	@At("/qisebo")
	@Ok("jsp:page.hkc.games.qisebo")
	public Object qisebo() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("sealTime", HKCCache.getMc().getNsealTime());
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/zhsm")
	@Ok("jsp:page.hkc.games.zhsm")
	public Object zongheshuangmianPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("42"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/banbanbo")
	@Ok("jsp:page.hkc.games.banbanbo")
	public Object banbanboPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("43"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/sxsm")
	@Ok("jsp:page.hkc.games.sxsm")
	public Object sxsmPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcs", HKCCache.getPcs("44"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
	
	@At("/ztmbz")
	@Ok("jsp:page.hkc.games.ztmbz")
	public Object ztmbzPage() {
		obj.put("ob", HKCCache.result.getOpenBall());
		obj.put("iss", HKCCache.getMc().getIssue());
		obj.put("issue", HKCCache.getMc().getIssue());
		obj.put("nsealTime", HKCCache.getMc().getSealTime());
		obj.put("pcsbz", HKCCache.getPcs("36"));
		obj.put("pcs", HKCCache.getPcs("45"));
		obj.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		return obj;
	}
}
