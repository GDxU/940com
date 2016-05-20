package com.vinbet.mobile.action.ssc;

/*
 _ooOoo_
 o8888888o
 88" . "88
 (| -_- |)
 O\  =  /O
 ____/`---'\____
 .'  \\|     |//  `.
 /  \\|||  :  |||//  \
 /  _||||| -:- |||||-  \
 |   | \\\  -  /// |   |
 | \_|  ''\---/''  |   |
 \  .-\__  `-`  ___/-. /
 ___`. .'  /--.--\  `. . __
 ."" '<  `.___\_<|>_/___.'  >'"".
 | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 \  \ `-.   \_ __\ /__ _/   .-` /  /
 ======`-.____`-.___\_____/___.-`____.-'======
 `=---='
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 佛祖保佑       永无BUG
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.SscUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.ssc.OrderDto;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

@IocBean(singleton = false)
@At("/ssc/bjsc")
@Filters({ @By(type = CheckSession.class, args = { "SSC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class BJSCAction extends CommonAction {
	private Log log = Logs.getLog(BJSCAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	@At("/")
	@Ok("redirect:/ssc/bjsc/liangmian")
	public void index() {
	}

	@At("/liangmian")
	@Ok("jsp:page.ssc.bjsc.liangmian")
	public Object liangmian(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("nav", 1);
		obj.put("bon", "LIANGMIAN");
		obj.put("cf", AppCache.sscSysConfig);
		SscUser sscUser = (SscUser) session.getAttribute(Constants.SSC_USER_SESSION);
		String[] hcs = sscUser.getHandype().toUpperCase().split(",");
		obj.put("hcs", hcs);
		if (sscUser.getCht() == null || sscUser.getCht().trim().equals("")) {
			sscUser.setCht(hcs[0]);
		}
		String ref = request.getHeader("referer");
		if (null != ref && ref.toLowerCase().contains("/bjsc/order")) {
			OrderDto od = (OrderDto) session.getAttribute("bjsc_liangmian_od");
			if (od != null && od.getOds() != null) {
				obj.put("ods", od.getOds());
			}
		} else {
			session.setAttribute("bjsc_liangmian_od", null);
		}
		return obj;
	}

	@At("/1to5")
	@Ok("jsp:page.ssc.bjsc.1to5")
	public Object oneToFive(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("nav", 2);
		obj.put("bon", "ONETOFIVE");
		obj.put("cf", AppCache.sscSysConfig);
		SscUser sscUser = (SscUser) session.getAttribute(Constants.SSC_USER_SESSION);
		String[] hcs = sscUser.getHandype().toUpperCase().split(",");
		obj.put("hcs", hcs);
		if (sscUser.getCht() == null || sscUser.getCht().trim().equals("")) {
			sscUser.setCht(hcs[0]);
		}
		String ref = request.getHeader("referer");
		if (ref != null && ref.toLowerCase().contains("/bjsc/order")) {
			OrderDto od = (OrderDto) session.getAttribute("bjsc_1to5_od");
			if (od != null && od.getOds() != null) {
				obj.put("ods", od.getOds());
			}
		} else {
			session.setAttribute("bjsc_1to5_od", null);
		}
		return obj;
	}

	@At("/6to10")
	@Ok("jsp:page.ssc.bjsc.6to10")
	public Object sixToTen(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("nav", 3);
		obj.put("bon", "SIXTOTEN");
		obj.put("cf", AppCache.sscSysConfig);
		SscUser sscUser = (SscUser) session.getAttribute(Constants.SSC_USER_SESSION);
		String[] hcs = sscUser.getHandype().toUpperCase().split(",");
		obj.put("hcs", hcs);
		if (sscUser.getCht() == null || sscUser.getCht().trim().equals("")) {
			sscUser.setCht(hcs[0]);
		}
		String ref = request.getHeader("referer");
		if (ref != null && ref.toLowerCase().contains("/bjsc/order")) {
			OrderDto od = (OrderDto) session.getAttribute("bjsc_6to10_od");
			if (od != null && od.getOds() != null) {
				obj.put("ods", od.getOds());
			}
		} else {
			session.setAttribute("bjsc_6to10_od", null);
		}
		return obj;
	}

	@At("/champion")
	@Ok("jsp:page.ssc.bjsc.champion")
	public Object champion(HttpServletRequest request, HttpSession session) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("nav", 4);
		obj.put("bon", "GYZH");
		obj.put("cf", AppCache.sscSysConfig);
		SscUser sscUser = (SscUser) session.getAttribute(Constants.SSC_USER_SESSION);
		String[] hcs = sscUser.getHandype().toUpperCase().split(",");
		obj.put("hcs", hcs);
		if (sscUser.getCht() == null || sscUser.getCht().trim().equals("")) {
			sscUser.setCht(hcs[0]);
		}
		String ref = request.getHeader("referer");
		if (ref != null && ref.toLowerCase().contains("/bjsc/order")) {
			OrderDto od = (OrderDto) session.getAttribute("bjsc_champion_od");
			if (od != null && od.getOds() != null) {
				obj.put("ods", od.getOds());
			}
		} else {
			session.setAttribute("bjsc_champion_od", null);
		}
		return obj;
	}

	@At("/rate/?/?")
	@Ok("json")
	public Object getRate(String r, HttpSession session) {
		JSONObject jo = null;
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("betOn", "LIANGMIAN");
			paramMap.put("gameId", "BJC");
			paramMap.put("isRefulsh", r.trim().equalsIgnoreCase("all") ? "0" : "1");
			SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
			paramMap.put("handType", sscUser.getCht());
			// if (sscUser.getCht() == null || !sscUser.getCht().equals(hc)) {
			// sscUser.setCht(hc);
			// }
			paramMap.put("userName", sscUser.getAccoutName());
			paramMap.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/getRateInfo").toString();
			jo = HttpClientUtil.doGet(url, paramMap, false);
			jo.remove("upyMap");
			jo.remove("userHandType");
			jo.remove("htselect");
			jo.remove("max_win");
			jo.remove("isLast");
			jo.put("c", 0);
		} catch (Exception e) {
			log.error("BJSC获取盘口异常:", e);
			jo = new JSONObject();
			jo.put("c", 1);
			jo.put("e", "系统异常，请联系客服！");
		}
		return jo;
	}

	@At("/order")
	@Ok("jsp:page.ssc.bjsc.order")
	public Object order(@Param("title") List<String> titles, @Param("type") List<String> types, @Param("rate") List<String> rates, @Param("bon") String bon, @Param("issue") String issue,
			@Param("gameId") String gameId, @Param("hc") String hc, HttpSession session, HttpServletRequest request) {
		OrderDto od = new OrderDto();
		od.titles = titles;
		od.types = types;
		od.rates = rates;
		od.bon = bon;
		od.issue = issue;
		od.gameId = gameId;
		od.hc = hc;
		String ctx = request.getContextPath();
		String ref = request.getHeader("referer");
		if (ref != null && !ref.trim().equals("")) {
			od.path = ref.substring(ref.lastIndexOf(ctx) + ctx.length());
		}
		String sign = od.path.substring(od.path.lastIndexOf("/") + 1);
		session.setAttribute("bjsc_" + sign + "_od", od);
		request.setAttribute("sign", sign);
		return od;
	}

	@At("/submit")
	@Ok("json")
	public Object submit(@Param("amount") List<String> amounts, @Param("type") List<String> types, @Param("rate") List<String> rates, @Param("bon") String bon, @Param("issue") String issue,
			@Param("gameId") String gameId, @Param("isChange") String isChange, @Param("hc") String hc, @Param("sign") String signs, HttpServletRequest request, HttpSession session) {
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JSONObject jo = null;
		try {
			UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
			if (userInfo != null && userInfo.getUserStatus() == USER_STATUS.USERSTATUS_FREEZE.getCode()) {
				jo = new JSONObject();
				jo.put("success", 98);
				jo.put("promptName", "原因：您的用户状态已经被冻结!");
				return jo;
			}
			// 检测两次提交的时间差
			Object lastOrderTime = session.getAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION);
			if (null != lastOrderTime) {
				if (System.currentTimeMillis() - Long.parseLong(String.valueOf(lastOrderTime)) < Constants.ORDER_TIME_INTERVAL_MIN) {
					jo = new JSONObject();
					jo.put("success", "99999");
					jo.put("promptName", i18n.get("msg.cp.repeatOrder"));
					return jo;
				}
			}
			session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, System.currentTimeMillis());
			Map<String, String> paramMap = new HashMap<String, String>();
			StringBuffer sbBtyAll = new StringBuffer();
			for (String type : types) {
				type = type.replace("-", "_");
				sbBtyAll.append(type).append(",");
			}
			sbBtyAll.deleteCharAt(sbBtyAll.length() - 1);
			paramMap.put("btyAll", sbBtyAll.toString());
			StringBuffer sbMoneyAll = new StringBuffer();
			for (String amount : amounts) {
				sbMoneyAll.append(amount).append(",");
			}
			sbMoneyAll.deleteCharAt(sbMoneyAll.length() - 1);
			paramMap.put("moneyAll", sbMoneyAll.toString());
			StringBuffer sbRateAll = new StringBuffer();
			for (String rate : rates) {
				sbRateAll.append(rate).append(",");
			}
			sbRateAll.deleteCharAt(sbRateAll.length() - 1);
			paramMap.put("rateAll", sbRateAll.toString());

			paramMap.put("bon", bon);
			paramMap.put("gameId", gameId);
			paramMap.put("isChange", isChange);
			paramMap.put("issue", issue);
			SscUser ui = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
			paramMap.put("hcType", hc);
			paramMap.put("userName", ui.getAccoutName());
			paramMap.put("locale", "zh_CN");
			paramMap.put("ip", super.getClientIp(request));
			StringBuilder sign = new StringBuilder();
			sign.append(bon).append(sbBtyAll.toString()).append(sbRateAll.toString());
			sign.append(sbMoneyAll.toString()).append(gameId).append(hc);
			sign.append(ui.getAccoutName()).append(issue).append(isChange);
			sign.append(propertiesLoader.getTrim("vinbet.token.ssc"));
			paramMap.put(Constants.TOKEN_SSC, MD5Util.md5Hex(sign.toString()));
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/betStorage").toString();
			jo = HttpClientUtil.doGet(url, paramMap);
			StringBuffer sb = new StringBuffer(jo.getString("message"));
			sb.deleteCharAt(0).deleteCharAt(sb.length() - 1);
			jo = JSON.parseObject(sb.toString());
			session.setAttribute("bjsc_" + signs + "_od", null);
			// 记录日志
			if (jo.get("success") != null && jo.getString("success").equals("1")) {
				// Date now = new Date();
				// SscOrder order = new SscOrder();
				// order.setGid(gameId);
				// order.setIssue(issue);
				// order.setYear(DateUtil.getYear(now));
				// order.setMonth(DateUtil.getMonth(now));
				// order.setDay(DateUtil.getDay(now));
				// order.setTime(DateUtil.getTime(now));
				// order.setUname(ui.getAccoutName());
				// int totalAmt = 0;
				// for (Object amt : amounts) {
				// totalAmt += Integer.parseInt(String.valueOf(amt));
				// }
				// order.setNum(amounts.size());
				// order.setAmount(totalAmt);
				// OrderRecorder.recordSscOrder(order);
			} else {
				session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, 0);
			}
		} catch (Exception e) {
			session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, 0);
			log.error("BJSC注单提交失败:", e);
			jo = new JSONObject();
			jo.put("success", 99);
			jo.put("promptName", "系统异常，请联系客服！");
		}
		return jo;
	}

}
