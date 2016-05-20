package com.vinbet.mobile.action.qxc;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.action.portal.CommonAction;
import com.vinbet.mobile.domain.QxcUser;
import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.qxc.QxcOrder;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.Constants.USER_STATUS;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;

@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "QXC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class QXCGameAction extends CommonAction {
	private static final Logger log = LogManager.getLogger(QXCGameAction.class);

	@Inject
	private PropertiesLoader propertiesLoader;

	@At("/qxc/qxcmenu")
	@Ok("jsp:page.qxc.main_menu")
	public Object qxcmenu() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("cf", AppCache.qxcSysConfig);
		return obj;
	}

	@At("/qxc/kx")
	@Ok("jsp:page.qxc.gamebet.kx")
	public Object kx() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		Map<String, String> qc = AppCache.qxcSysConfig;
		String tem = "";
		if (qc.get("gc_33").equals("33")) {
			tem += qc.get("pg_33") + ",";
		}
		if (qc.get("gc_34").equals("34")) {
			tem += qc.get("pg_34") + ",";
		}
		if (qc.get("pg_35").indexOf("3501") > -1) {
			tem += "3501";
		}
		obj.put("gcl", tem);
		String[] arr = tem.split(",");
		String temGid = "";
		for (int i = 0; i < arr.length; i++) {
			if ("" != arr[i]) {
				temGid = arr[i];
				break;
			}
		}
		obj.put("gid", temGid);
		obj.put("kuai", "1");
		return obj;
	}

	@At("/qxc/?")
	public Object kt(String pg) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		Map<String, String> qc = AppCache.qxcSysConfig;
		String tem = "";
		if (qc.get("gc_32").equals("32")) {
			tem += "3201,";
		}
		if (qc.get("gc_33").equals("33")) {
			tem += qc.get("pg_33") + ",";
		}
		if (qc.get("gc_34").equals("34")) {
			tem += qc.get("pg_34") + ",";
		}
		if (qc.get("pg_35").indexOf("3501") > -1) {
			tem += "3501,";
		}
		if ("36".equals(qc.get("gc_36"))) {
			tem += "36,";
		}
		if ("37".equals(qc.get("gc_37"))) {
			tem += "37,";
		}
		if ("38".equals(qc.get("gc_38"))) {
			tem += "38,";
		}
		if ("39".equals(qc.get("gc_39"))) {
			tem += "39,";
		}
		if (tem != null && tem.length() > 0) {
			tem = tem.substring(0, tem.length() - 1);
		}
		obj.put("gcl", tem);
		if ("32".equals(qc.get("gc_32"))) {
			obj.put("gid", "3201");
		} else {
			String[] arr = tem.split(",");
			String temGid = "";
			for (int i = 0; i < arr.length; i++) {
				if ("" != arr[i]) {
					temGid = arr[i];
					break;
				}
			}
			obj.put("gid", temGid);
		}
		obj.put("kuai", "1");
		return new ViewWrapper(new JspView("page.qxc.gamebet." + pg), obj);
	}
	
	@At("/qxc/calc")
	@Ok("jsp:page.qxc.gamebet.calc")
	public Object calc() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		// obj.put("hkcf", AppCache.hkcSysConfig);
		return obj;
	}

	@At("/qxc/topage")
	public View topage(@Param("pageName") String pageName, @Param("gameCode") String gameCode, @Param("pgameCode") String pgameCode, HttpSession session) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		if ("gc".equals(gameCode)) {
			Map<String, String> qc = AppCache.qxcSysConfig;
			dataMap.put("gameCode", qc.get("pg_" + pgameCode).split(",")[0]);
			dataMap.put("gcl", qc.get("pg_" + pgameCode));
		} else {
			dataMap.put("gameCode", gameCode);
		}
		dataMap.put("pgameCode", pgameCode);
		return new ViewWrapper(new JspView("page.qxc.gamebet." + pageName), dataMap);
	}

	@At("qxc/getRateInfo")
	@Ok("json")
	public JsonResult getRateInfo(@Param("game") String game, @Param("px") String px, @Param("tj") String tj, @Param("pk") String pk, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		QxcUser qxcuser = (QxcUser) session.getAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("game", game);
		parameters.put("px", px);
		parameters.put("tj", tj);
		// 支持盘口切换的游戏
		// if (game.contains("32") || game.contains("33") || game.contains("34")
		// || game.contains("35") || game.contains("40")) {
		parameters.put("pk", pk);
		// }else{
		// parameters.put("pk", "1");
		// }
		parameters.put("username", qxcuser.getAccoutName());
		parameters.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String url = propertiesLoader.getTrim("vinbet.qxc.url") + "/rateinfo";
		try {
			JSONObject rateInfo = HttpClientUtil.doGet(url, parameters, false);
			int code = rateInfo.getIntValue("code");
			if (0 == code) {
				String rate = rateInfo.getString("map");
				if (null == rate || "".equals(rate)) {
					jsonResult = JsonResult.createFalied("系统异常");
					log.error("getRateInfo 接口返回数据异常" + rateInfo.toJSONString());
					return jsonResult;
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("g", rateInfo.getString("g"));
				map.put("mi", rateInfo.getString("mi"));
				map.put("mx", rateInfo.getString("mx"));
				map.put("tm", rateInfo.getString("tm"));
				map.put("rate", rate);
				map.put("io", rateInfo.getString("io"));
				map.put("code", code);
				map.put("issue", rateInfo.getString("is"));
				map.put("ob", rateInfo.getString("ob"));
				map.put("ot", rateInfo.getLongValue("oat"));
				map.put("st", rateInfo.getLongValue("st"));//
				map.put("maxAward", rateInfo.getString("maxAward"));
				map.put("c", rateInfo.getString("c"));
				jsonResult.setData(map);
			} else if (2 == code) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("code", code);
				jsonResult.setData(map);
			} else {
				jsonResult = JsonResult.createFalied();
				jsonResult.setM("系统异常，请联系客服！");
				if (-1 == code) {
					log.error("请求赔率失败，七星彩后台返回检测用户不存在！");
				}
				if (1 == code) {
					log.error("请求赔率失败，七星彩后台返回系统异常，获取赔率失败！");
				}
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			jsonResult.setM("系统异常，请联系客服！");
			log.error("getRateInfo error:", e);
		}
		return jsonResult;
	}

	@At("qxc/getRateInfo_kx")
	@Ok("json")
	public JsonResult getRateInfo_kx(@Param("game") String game, @Param("px") String px, @Param("tj") String tj, @Param("pk") String pk, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		QxcUser qxcuser = (QxcUser) session.getAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("game", game.substring(0, 2));
		parameters.put("sgc", game);
		parameters.put("px", "");
		// 支持盘口切换的游戏
		// if (game.contains("32") || game.contains("33") || game.contains("34")
		// || game.contains("35") || game.contains("40")) {
		parameters.put("pk", pk);
		// }else{
		// parameters.put("pk", "1");
		// }
		parameters.put("username", qxcuser.getAccoutName());
		parameters.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String url = propertiesLoader.getTrim("vinbet.qxc.url") + "/q";
		try {
			JSONObject rateInfo = HttpClientUtil.doGet(url, parameters, true);
			int code = rateInfo.getIntValue("code");
			if (0 == code) {
				String rate = rateInfo.getString("map");
				if (null == rate || "".equals(rate)) {
					jsonResult = JsonResult.createFalied("系统异常");
					log.error("getRateInfo 接口返回数据异常" + rateInfo.toJSONString());
					return jsonResult;
				}
				String snr = rateInfo.getString("snr");
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("g", rateInfo.getString("g"));
				map.put("mi", rateInfo.getString("mi"));
				map.put("mx", rateInfo.getString("mx"));
				map.put("tm", rateInfo.getString("tm"));
				map.put("rate", rate);
				map.put("snr", snr);
				map.put("io", rateInfo.getString("io"));
				map.put("code", code);
				map.put("issue", rateInfo.getString("is"));
				map.put("ob", rateInfo.getString("ob"));
				map.put("ot", rateInfo.getLongValue("oat"));
				map.put("st", rateInfo.getLongValue("st"));
				map.put("c", rateInfo.getString("c"));
				jsonResult.setData(map);
			} else if (2 == code) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("code", code);
				jsonResult.setData(map);
			} else {
				jsonResult = JsonResult.createFalied();
				jsonResult.setM("系统异常，请联系客服！");
				if (-1 == code) {
					log.error("请求赔率失败，七星彩后台返回检测用户不存在！");
				}
				if (1 == code) {
					log.error("请求赔率失败，七星彩后台返回系统异常，获取赔率失败！");
				}
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			jsonResult.setM("系统异常，请联系客服！");
			log.error("getRateInfo error:", e);
		}
		return jsonResult;
	}

	@At("qxc/getRateInfo_kd")
	@Ok("json")
	public JsonResult getRateInfo_kd(@Param("gamecodeStr") String gamecodeStr, @Param("ballStr") String ballStr, @Param("amountStr") String amountStr,
			@Param("pk") String pk, HttpSession session, HttpServletRequest request) {
		JsonResult jsonResult = JsonResult.createSuccess();
		QxcUser qxcuser = (QxcUser) session.getAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("gamecodeStr", gamecodeStr);
		parameters.put("ballStr", ballStr);
		parameters.put("amountStr", amountStr);
		// 支持盘口切换的游戏
		// if (game.contains("32") || game.contains("33") || game.contains("34")
		// || game.contains("35") || game.contains("40")) {
		parameters.put("pk", pk);
		// }else{
		// parameters.put("pk", "1");
		// }
		parameters.put("username", qxcuser.getAccoutName());
		parameters.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String url = propertiesLoader.getTrim("vinbet.qxc.url") + "/complexConfirm";
		try {
			JSONObject rateInfo = HttpClientUtil.doGet(url, parameters, true);
			int code = rateInfo.getIntValue("code");
			if (10000 == code) {
				JSONArray rate = rateInfo.getJSONArray("r");
				if (null == rate || "".equals(rate)) {
					jsonResult = JsonResult.createFalied("系统异常");
					log.error("getRateInfo 接口返回数据异常" + rateInfo.toJSONString());
					return jsonResult;
				}
				
				JSONArray array = new JSONArray();
				String gc = null;
				String comm = null;
				for (Object sr : rate) {
					JSONArray obj = JSONArray.parseArray(sr.toString());
					if (gc == null) {
						gc = obj.get(0) + "";
						
						JSONObject comms = null;
						try {
							Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
							String curl = new StringBuilder(propertiesLoader.getTrim("vinbet.qxc.url")).append("/comminfo").toString();
							Map<String, String> prams = new HashMap<String, String>();
							prams.put("username", qxcuser.getAccoutName());
							prams.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
							comms = HttpClientUtil.doGet(curl, prams);
							if (comms != null && comms.getString("comm") != null) {
								JSONObject object = JSONObject.parseObject(comms.getString("comm"));
								String[] keys = object.keySet().toArray(new String[0]);
								Arrays.sort(keys);
								for (String key : keys) {
									JSONObject value = object.getJSONObject(key);
									if(value.get("gameCode").equals(gc.substring(0, 2))){
										comm = value.get("comm") + "";
										break;
									}
								}
							}
						} catch (Exception e) {
							log.error("获取用户交易回水信息,调用七星彩手机服务端[comminfo]接口返回数据格式异常,response >> " + (null == comms ? null : comms.toJSONString()), e);
						}
					}
					obj.add(comm);
					array.add(obj);
				}
				
				jsonResult.setList(array);
				
			} else if (2 == code) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("code", code);
				jsonResult.setData(map);
			} else {
				jsonResult = JsonResult.createFalied();
				jsonResult.setM("系统异常，请联系客服！");
				if (-1 == code) {
					log.error("请求赔率失败，七星彩后台返回检测用户不存在！");
				}
				if (1 == code) {
					log.error("请求赔率失败，七星彩后台返回系统异常，获取赔率失败！");
				}
			}
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			jsonResult.setM("系统异常，请联系客服！");
			log.error("getRateInfo error:", e);
		}
		return jsonResult;
	}

	@At("qxc/addOrder")
	@Ok("json")
	public JsonResult addOrder(@Param("betAmount") String betAmount, @Param("betBall") String betBall, @Param("gameCode") String gameCode, @Param("hcType") String hcType, @Param("comm") String comm,
			@Param("isChange") String isChange, @Param("issue") String issue, @Param("pgameCode") String pgameCode, @Param("rateAll") String rateAll, @Param("betType") String betType, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo != null && userInfo.getUserStatus() == USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("code", "99998");
			data.put("description", "下注失败，原因：您的用户状态已经被冻结！");
			jsonResult.setData(data);
			return jsonResult;
		}
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
		QxcUser qxcuser = (QxcUser) session.getAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("betAmount", betAmount);
		parameters.put("betBall", betBall);
		parameters.put("gameCode", gameCode);
		if ("35".equals(pgameCode)) {// 四定位特殊处理，如果不处理提示下注成功，实际上没有入库（已跟后台沟通）
			parameters.put("gameCode", pgameCode);
		}
		if ("34".equals(pgameCode)) {
			parameters.put("betBall", betBall.replaceAll("X", ""));
		}
		// parameters.put("hcType", qxcuser.getHandype());
		// 支持盘口切换的游戏
		// if (gameCode.contains("32") || gameCode.contains("33") ||
		// gameCode.contains("34") || gameCode.contains("35") ||
		// gameCode.contains("40")) {
		parameters.put("hcType", hcType);
		// }else{
		// parameters.put("hcType", "1");
		// }
		if(betType != null && !betType.equals("")) {
			parameters.put("betType", betType);
		}
		parameters.put("comm", comm);
		parameters.put("isChange", isChange);
		parameters.put("issue", issue);
		parameters.put("pgameCode", pgameCode);
		parameters.put("rateAll", rateAll);
		parameters.put("userName", qxcuser.getAccoutName());
		parameters.put("ip", super.getClientIp(request));
		parameters.put("ct", System.currentTimeMillis() + "");
		Map<String, String> param = new HashMap<String, String>();
		for (String key : parameters.keySet()) {
			if (null != parameters.get(key) && !"".equals(parameters.get(key))) {
				param.put(key, parameters.get(key).replaceAll(" ", ""));
			}
		}
		param.put("cburl", "");
		param.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String url = propertiesLoader.getTrim("vinbet.qxc.order.url");
		try {
			JSONObject jo = HttpClientUtil.doPost(url, param);
			int code = jo.getIntValue("code");
			// {"code":"2","description":"2XXX的赔率由8变化为9.85\\n是否继续下注?","isChange":"0"}
			if (1 != code && 2 != code) {
				log.info("调用七星彩手机服务器端[storage]接口下注失败>> code：" + code + " ,description:" + jo.getString("description"));
			}
			if (code == 1) {
				Date now = new Date();
				QxcOrder order = new QxcOrder();
				order.setGid(gameCode);
				order.setIssue(issue);
				order.setYear(DateUtil.getYear(now));
				order.setMonth(DateUtil.getMonth(now));
				order.setDay(DateUtil.getDay(now));
				order.setTime(DateUtil.getTime(now));
				order.setUname(qxcuser.getAccoutName());
				String[] ol = betAmount.split(",");
				int amount = 0;
				for (int i = 0; i < ol.length; i++) {
					amount += Integer.parseInt(ol[i]);
				}
				order.setNum(ol.length);
				order.setAmount(amount);
				// OrderRecorder.recordQxcOrder(order);
			} else {
				session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, 0);
			}
			jsonResult.setData(jo);
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			log.error("调用七星彩手机服务器端[storage]接口异常>> ", e);
		}
		return jsonResult;
	}
	
	/**
	 * 快da下单接口
	 * @param betAmount
	 * @param betBall
	 * @param gameCode
	 * @param hcType
	 * @param rateAll
	 * @param isChange
	 * @param issue
	 * @param request
	 * @param session
	 * @return
	 */
	@At("qxc/complex/storage")
	@Ok("json")
	public JsonResult storage(@Param("betAmount") String betAmount, @Param("betBall") String betBall, @Param("gameCode") String gameCode, @Param("hcType") String hcType,
			@Param("comm") String comm,@Param("rateAll") String rateAll, @Param("isChange") String isChange, @Param("issue") String issue, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		UserInfo userInfo = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		if (userInfo != null && userInfo.getUserStatus() == USER_STATUS.USERSTATUS_FREEZE.getCode()) {
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("code", "99998");
			data.put("description", "下注失败，原因：您的用户状态已经被冻结！");
			jsonResult.setData(data);
			return jsonResult;
		}
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
		QxcUser qxcuser = (QxcUser) session.getAttribute(com.vinbet.mobile.util.Constants.QXC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("gameCode", gameCode);
		parameters.put("betBall", betBall);
		parameters.put("rateAll", rateAll);
		parameters.put("betAmount", betAmount);
		parameters.put("hcType", hcType);
		parameters.put("isChange", isChange);
		parameters.put("issue", issue);
		parameters.put("userName", qxcuser.getAccoutName());
		parameters.put("comm", comm);
		parameters.put("ip", super.getClientIp(request));
		parameters.put("ct", System.currentTimeMillis() + "");
		Map<String, String> param = new HashMap<String, String>();
		for (String key : parameters.keySet()) {
			if (null != parameters.get(key) && !"".equals(parameters.get(key))) {
				param.put(key, parameters.get(key).replaceAll(" ", ""));
			}
		}
		param.put("cburl", "");
		param.put(Constants.TOKEN_HKC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.qxc")));
		String url = propertiesLoader.getTrim("vinbet.qxc.order.url");
		/* http://order.bb.com:8090/z3/order/client/complex/storage
		 * 快打下单接口 按原接口替换
		 */
		url = url.replace("/storage", "/complex/storage");
		try {
			JSONObject jo = HttpClientUtil.doPost(url, param);
			int code = jo.getIntValue("code");
			// {"code":"2","description":"2XXX的赔率由8变化为9.85\\n是否继续下注?","isChange":"0"}
			if (1 != code && 2 != code) {
				log.info("调用七星彩手机服务器端[storage]接口下注失败>> code：" + code + " ,description:" + jo.getString("description"));
			}
			if (code == 1) {
				Date now = new Date();
				QxcOrder order = new QxcOrder();
				order.setGid(gameCode);
				order.setIssue(issue);
				order.setYear(DateUtil.getYear(now));
				order.setMonth(DateUtil.getMonth(now));
				order.setDay(DateUtil.getDay(now));
				order.setTime(DateUtil.getTime(now));
				order.setUname(qxcuser.getAccoutName());
				String[] ol = betAmount.split(",");
				int amount = 0;
				for (int i = 0; i < ol.length; i++) {
					amount += Integer.parseInt(ol[i]);
				}
				order.setNum(ol.length);
				order.setAmount(amount);
				// OrderRecorder.recordQxcOrder(order);
			} else {
				session.setAttribute(com.vinbet.mobile.util.Constants.LATEST_ORDER_TIME_SESSION, 0);
			}
			jsonResult.setData(jo);
		} catch (Exception e) {
			jsonResult = JsonResult.createFalied();
			log.error("调用七星彩手机服务器端[storage]接口异常>> ", e);
		}
		return jsonResult;
	}
}
