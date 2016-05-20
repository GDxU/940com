package com.vinbet.mobile.action.hkc;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.HkcUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.hkc.HkcOrder;
import com.vinbet.mobile.entity.hkc.MarketCtrl;
import com.vinbet.mobile.entity.hkc.PlayCtrl;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.sys.hkc.HKCCache;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;

/**
 * 游戏相关（下注状况、开奖结果、游戏记录、提交注单等）
 * 
 * @author jagger
 * @date 2014-07-22 上午10:15:42
 */
@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "HKC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class HKCGameAction extends CommonAction {
	private static final Logger log = LogManager.getLogger(HKCGameAction.class);

	@Inject
	private PropertiesLoader propertiesLoader;

	@At("/hkc/hkmenu")
	@Ok("jsp:page.hkc.main_menu")
	public Object hkmenu() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("hkcf", AppCache.hkcSysConfig);
		return obj;
	}

	@At("/hkc/topage")
	public View topage(@Param("pageName") String pageName, @Param("pid") String pid, @Param("type") String type) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("hkcf", AppCache.hkcSysConfig);

		List<PlayCtrl> pcs = new ArrayList<PlayCtrl>();
		PlayCtrl temlx = new PlayCtrl();
		// 游戏排序
		this.sortPlay(pid, pcs, temlx, type);
		// 每行显示的游戏菜单数
		int perLineNum = 3;
		int size = pcs.size();
		int m = 0;
		for (int i = 0; ((m = size % perLineNum) != 0 && i < perLineNum - m); i++) {
			pcs.add(new PlayCtrl());
		}
		dataMap.put("perLineNum", perLineNum);

		dataMap.put("game", pcs.get(0).getGameCode());
		dataMap.put("pcs", pcs);
		dataMap.put("type", type);
		MarketCtrl mc = HKCCache.getMc();
		dataMap.put("iss", mc.getIssue());
		dataMap.put("oball", HKCCache.result.getOpenBall());
		dataMap.put("interval", propertiesLoader.getLong("vinbet.hkc.mkt.interval", 5000));
		dataMap.put("sealTime", HKCCache.getMc().getNsealTime());
		if ("lx".equals(type)) {// 六肖特殊处理
			if (null != temlx.getGameCode()) {
				dataMap.put("game", temlx.getGameCode());
			}
		}
		return new ViewWrapper(new JspView("page.hkc.gamebet." + pageName), dataMap);
	}

	private void sortPlay(String pid, List<PlayCtrl> pcs, PlayCtrl temlx, String type) {
		List<PlayCtrl> pcl = HKCCache.getPcs(pid);
		if ("15".equals(pid)) {
			// 连码特殊排序
			String[] sort_15 = { "1503", "1504", "1505", "1501", "1502", "1506", "1507", "1508", "1509", "1510" };
			Map<String, PlayCtrl> tem = new HashMap<String, PlayCtrl>();
			for (int i = 0; i < pcl.size(); i++) {
				PlayCtrl pc = pcl.get(i);
				if (pc.getIsShow()) {
					tem.put(pc.getGameCode(), pc);
				}
			}
			for (int i = 0; i < sort_15.length; i++) {
				PlayCtrl tp = tem.get(sort_15[i]);
				if (null != tp) {
					pcs.add(tp);
				}
			}
		} else if ("23".equals(pid)) {
			// 生肖连特殊排序
			String[] sort_15 = { "2301", "2302", "2303", "2307", "2304", "2305", "2306", "2308" };
			Map<String, PlayCtrl> tem = new HashMap<String, PlayCtrl>();
			for (int i = 0; i < pcl.size(); i++) {
				PlayCtrl pc = pcl.get(i);
				if (pc.getIsShow()) {
					tem.put(pc.getGameCode(), pc);
				}
			}
			for (int i = 0; i < sort_15.length; i++) {
				PlayCtrl tp = tem.get(sort_15[i]);
				if (null != tp) {
					pcs.add(tp);
				}
			}
		} else if ("24".equals(pid)) {
			// 尾数连
			String[] sort_15 = { "2401", "2402", "2403", "2407", "2404", "2405", "2406", "2408" };
			Map<String, PlayCtrl> tem = new HashMap<String, PlayCtrl>();
			for (int i = 0; i < pcl.size(); i++) {
				PlayCtrl pc = pcl.get(i);
				if (pc.getIsShow()) {
					tem.put(pc.getGameCode(), pc);
				}
			}
			for (int i = 0; i < sort_15.length; i++) {
				PlayCtrl tp = tem.get(sort_15[i]);
				if (null != tp) {
					pcs.add(tp);
				}
			}
		} else {
			for (int i = 0; i < pcl.size(); i++) {
				PlayCtrl pc = pcl.get(i);
				if (pc.getIsShow()) {
					pcs.add(pc);
					if ("lx".equals(type) && i == pcl.size() - 1) {
						temlx.setGameCode(pc.getGameCode());
					}
				}
			}
		}
	}

	private String convertHandType(String ht) {
		String temp = "A";
		if (ht != null) {
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

	@At("hkc/getRateInfo")
	@Ok("json")
	public JsonResult getRateInfo(@Param("gameId") String gameId, @Param("vn") String vn, @Param("mt") String mt, HttpSession session) {
		HkcUser userInfo = (HkcUser) session.getAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
		String cht = convertHandType(userInfo.getCht());
		Double grd = userInfo.getUserGameRateDiff(gameId);
		JsonResult jsonResult = JsonResult.createSuccess();
		if (null == vn || "".equals(vn)) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, double[]> frmap = HKCCache.getFullRateMap(cht, gameId);
			Map<String, double[]> rmap = new HashMap<String, double[]>();
			for (String key : frmap.keySet()) {
				double[] rates = { frmap.get(key)[0] - grd, frmap.get(key)[1] > 0 ? frmap.get(key)[1] - grd : 0 };
				rmap.put(key, rates);
			}
			MarketCtrl mc = HKCCache.getMc();
			resultMap.put("rmap", rmap);
			resultMap.put("issue", mc.getIssue());
			jsonResult.setData(resultMap);
		}
		return jsonResult;
	}

	@At("hkc/addOrder")
	@Ok("json")
	public JsonResult addOrder(@Param("amount") String amount, @Param("betAmount") String betAmount, @Param("betBall") String betBall, @Param("betBallStr") String betBallStr,
			@Param("betBallTou") String betBallTou, @Param("betBallTuo") String betBallTuo, @Param("betType") String betType, @Param("gameCode") String gameCode,
			@Param("gameCode16") String gameCode16, @Param("hcType") String hcType, @Param("isChange") String isChange, @Param("issue") String issue, @Param("noteCount") String noteCount,
			@Param("passType") String passType, @Param("pgameCode") String pgameCode, @Param("rate") String rate, @Param("rate2") String rate2, @Param("rateAll") String rateAll,
			@Param("rateAll2") String rateAll2, @Param("rateStr") String rateStr, @Param("rateTou") String rateTou, @Param("rateTuo") String rateTuo, @Param("tuoType") String tuoType,
			HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo != null && userInfo.getUserStatus() == USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("code", "99998");
			data.put("description", "下注失败，原因：您的用户状态已经被冻结！");
			jsonResult.setData(data);
			return jsonResult;
		}
		HkcUser hkcUser = (HkcUser) session.getAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
		// 检测两次提交的时间差
		Object lastOrderTime = session.getAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION);
		if (null != lastOrderTime) {
			if (System.currentTimeMillis() - Long.parseLong(String.valueOf(lastOrderTime)) < 5 * 1000) {
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("code", "99999");
				data.put("description", "注单提交中，请稍后下注！");
				jsonResult.setData(data);
				return jsonResult;
			}
		}
		session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, System.currentTimeMillis());
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("amount", amount);
		parameters.put("betAmount", betAmount);
		parameters.put("betBall", betBall);
		parameters.put("betBallStr", betBallStr);
		parameters.put("betBallTou", betBallTou);
		parameters.put("betBallTuo", betBallTuo);
		parameters.put("betType", betType);
		parameters.put("gameCode", gameCode);
		parameters.put("gameCode16", gameCode16);
		parameters.put("hcType", hkcUser.getCht() + "");
		parameters.put("isChange", isChange);
		parameters.put("issue", issue);
		parameters.put("noteCount", noteCount);
		parameters.put("passType", passType);
		parameters.put("pgameCode", pgameCode);
		parameters.put("rate", rate);
		parameters.put("rate2", rate2);
		parameters.put("rateAll", rateAll);
		parameters.put("rateAll2", rateAll2);
		parameters.put("rateStr", rateStr);
		parameters.put("rateTou", rateTou);
		parameters.put("rateTuo", rateTuo);
		parameters.put("tuoType", tuoType);
		parameters.put("userName", hkcUser.getAccoutName());
		parameters.put("ip", super.getClientIp(request));
		parameters.put("ct", System.currentTimeMillis() + "");
		Map<String, String> param = new HashMap<String, String>();
		for (String key : parameters.keySet()) {
			if (null != parameters.get(key) && !"".equals(parameters.get(key))) {
				param.put(key, parameters.get(key).replaceAll(" ", ""));
			}
		}
		param.put("cburl", "");
		param.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.hkc")));
		String url = propertiesLoader.getTrim("vinbet.hkc.order.url");
		String responseString = null;
		try {
			JSONObject jo = null;
			responseString = HttpClientUtil.doPostString(url, param);
			if (responseString != null && responseString.length() > 0) {
				jo = JSON.parseObject(responseString);
			}
			jsonResult.setData(jo);
			StringBuffer kpstr = new StringBuffer("");
			for (String key : param.keySet()) {
				kpstr.append(key).append(":").append(param.get(key)).append(";");
			}
			log.info("下注提交参数  >> " + kpstr.toString());
			String code = jo.getString("code");
			if (!"1".equals(code) && !"2".equals(code)) {
				log.info("调用香港彩手机服务器端[storage]接口下注失败 << code：" + jo.get("code") + " ,description:" + jo.get("description"));
			}
			if (code.equals("1")) {
				// Date now = new Date();
				// HkcOrder order = new HkcOrder();
				// order.setGid(gameCode);
				// order.setIssue(issue);
				// order.setYear(DateUtil.getYear(now));
				// order.setMonth(DateUtil.getMonth(now));
				// order.setDay(DateUtil.getDay(now));
				// order.setTime(DateUtil.getTime(now));
				// order.setUname(hkcUser.getAccoutName());
				// order.setNum(null != noteCount ? Integer.parseInt(noteCount) : 0);
				// order.setAmount(Integer.parseInt(amount));
				// OrderRecorder.recordHkcOrder(order);
			} else {
				session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, 0);
			}

		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			log.error("调用香港彩手机服务器端[storage]接口异常,response << " + responseString, e);
		}
		return jsonResult;
	}

	@At("hkc/changeHandType")
	@Ok("json")
	public JsonResult changeHandType(String pk, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			HkcUser hkcUser = (HkcUser) session.getAttribute(com.vinbet.mobile.util.Constants.HKC_USER_SESSION);
			if (null != pk && (pk.equals("1") || pk.equals("2") || pk.equals("3") || pk.equals("4"))) {
				hkcUser.setCht(pk);
				if (pk.equals("1")) {
					hkcUser.setChtText("A");
				} else if (pk.equals("2")) {
					hkcUser.setChtText("B");
				} else if (pk.equals("3")) {
					hkcUser.setChtText("C");
				} else if (pk.equals("4")) {
					hkcUser.setChtText("D");
				}
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			log.error("HKC盘口切换失败", e);
		}
		return jsonResult;
	}
}
