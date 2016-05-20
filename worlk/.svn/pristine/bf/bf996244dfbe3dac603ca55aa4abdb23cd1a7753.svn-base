package com.vinbet.mobile.action.ssc;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.domain.SscUser;
import com.vinbet.mobile.enums.LotteryType;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.ArithUtil;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.DateUtil;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.JsonResult;
import com.vinbet.mobile.util.MD5Util;

/**
 * 会员信息相关（个人资讯和账号历史等）
 * 
 * 
 * @date 2014-07-22 上午10:14:42
 */
@IocBean(singleton = false)
@Filters({ @By(type = CheckSession.class, args = { "SSC_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class MemberAction {
	private Log log = Logs.getLog(MemberAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	/**
	 * 跳转到账户历史按天汇总
	 */
	@At("ssc/accountHistory")
	@Ok("jsp:page.ssc.user.accountHistory")
	public void toAccoutHistory() {
	}

	/**
	 * 获取账户历史按天汇总数据
	 * 
	 * @param orderType
	 * @return
	 */
	@At("ssc/getAccoutHistory")
	@Ok("json")
	public JsonResult getAccoutHistory(String orderType, HttpSession session) {
		log.debug("getAccoutHistory-->orderType:" + orderType);
		JsonResult jsonResult = JsonResult.createSuccess();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/getAccHis").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("rtype", orderType);
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'accHis':[{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-18','ordDateXq':'Mon','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-19','ordDateXq':'Tue','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-20','ordDateXq':'Wed','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-21','ordDateXq':'Thu','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-22','ordDateXq':'Fri','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':1,'ordMoney':2.0,'yMoney':0.0,'ykMoney':-2.0,'ordDate':'2014-08-23','ordDateXq':'Sat','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-24','ordDateXq':'Sun','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':1,'ordMoney':2.0,'yMoney':0.0,'ykMoney':-2.0,'ordDate':'2014-08-25','ordDateXq':'Mon','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-26','ordDateXq':'Tue','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':1,'ordMoney':2.0,'yMoney':0.0,'ykMoney':1.96,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-28','ordDateXq':'Thu','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-29','ordDateXq':'Fri','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-30','ordDateXq':'Sat','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0},{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':0,'ordNum':0,'ordMoney':0.0,'yMoney':0.0,'ykMoney':0.0,'ordDate':'2014-08-31','ordDateXq':'Sun','gid':null,'issue':null,'userName':null,'lossAmount':0.0,'winAmount':0.0}]}";
		if (response != null && !response.equals("")) {
			try {
				JSONObject jsonObject = JSON.parseObject(response);
				// List<Map<String, Object>> resultList = JSON.parseObject(jsonObject.get("accHis").toString(), new TypeReference<List<Map<String,
				// Object>>>() {});
				Object accHisObj = jsonObject.get("accHis");
				JSONArray jsonArray = JSON.parseArray(accHisObj == null ? null : jsonObject.get("accHis").toString());
				List<Map<String, Object>> accResults = new ArrayList<Map<String, Object>>();
				if (jsonArray != null) {
					for (Object obj : jsonArray) {
						JSONObject acc = (JSONObject) obj;
						Map<String, Object> result = new HashMap<String, Object>();
						int ordderNum = acc.getInteger("ordNum");
						if (ordderNum > 0) {
							result.put("num", ordderNum);// 注数
							result.put("amt", acc.getDouble("ordMoney"));// 下注金额
							result.put("com", acc.getDouble("yMoney"));// 佣金
							result.put("pl", acc.getDouble("ykMoney"));// 盈亏：profit and loss
							result.put("date", acc.getString("ordDate"));// 日期
							result.put("wk", acc.getString("ordDateXq"));// 周几
							accResults.add(result);
						}
					}
					// 按日期倒序
					Collections.sort(accResults, new Comparator<Map<String, Object>>() {
						@Override
						public int compare(Map<String, Object> o1, Map<String, Object> o2) {
							return o2.get("date").toString().compareTo(o1.get("date").toString());
						}
					});
				}
				jsonResult.addAll(accResults);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("调用时时彩手机服务器端[getAccHis]接口返回数据格式异常", e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("调用时时彩手机服务器端[getAccHis]接口返回数据为空");
		}
		return jsonResult;
	}

	/**
	 * 跳转到账户历史单天按类型的汇总信息
	 */
	@At("ssc/accHisDay")
	@Ok("jsp:page.ssc.user.accHisDay")
	public Object toAccoutHistoryDay(@Param("bt") String btDate, int rtype) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("date", btDate);
		obj.put("rtype", rtype);
		return obj;
	}

	/**
	 * 获取账户历史单天按类型的汇总信息
	 * 
	 * @param orderType
	 *            1已结算、2未结算
	 * @param btDate
	 *            归属日期
	 * @return
	 */
	@At("ssc/getAccHisDay")
	@Ok("json")
	public JsonResult getAccHisDay(@Param("rtype") int orderType, @Param("bt") String btDate, HttpSession session) {
		log.debug("getAccHisDay-->orderType:" + orderType + ",btDate:" + btDate);
		JsonResult jsonResult = JsonResult.createSuccess();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append(orderType == 1 ? "/getAccHisDay" : "/getAccHisDay2").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("rtype", orderType + "");// 1所有彩种、2某一彩种
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("gid", "");// gid 如果给空值的话默认会按天统计数据不分彩种 (参数可为：KLC,SSC,BJC,XYNC,JSKS).给相应彩种参数的话就是按特定彩种查一天的按期汇总数据
		parameters.put("startTime", btDate);
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'accHisMap':{'JSKS':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':3,'ordNum':3,'ordMoney':7.0,'yMoney':0.0,'ykMoney':362.0,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':'JSKS','issue':'20140827017','userName':null,'lossAmount':0.0,'winAmount':0.0},'BJC':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':1,'ordNum':1,'ordMoney':2.0, 'yMoney':0.0,'ykMoney':1.96,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':'BJC','issue':'444112','userName':null,'lossAmount':0.0,'winAmount':0.0},'XYNC':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':2,'ordNum':1,'ordMoney':2.0,'yMoney':0.0,'ykMoney':1.96,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':'XYNC','issue':'20140827022','userName':null,'lossAmount':0.0,'winAmount':0.0}}}";
		if (response != null && !response.equals("")) {
			try {
				JSONObject jsonObject = JSON.parseObject(response);
				// List<Map<String, Object>> resultList = JSON.parseObject(jsonObject.get("accHis").toString(), new TypeReference<List<Map<String,
				// Object>>>() {});
				Object accHisObj = jsonObject.get("accHisMap");
				JSONObject accHis = JSON.parseObject(accHisObj == null ? null : jsonObject.get("accHisMap").toString());
				List<Map<String, Object>> accResults = new ArrayList<Map<String, Object>>();
				if (accHis != null) {
					for (Entry<String, Object> entry : accHis.entrySet()) {
						JSONObject acc = JSON.parseObject(entry.getValue().toString());
						Map<String, Object> result = new HashMap<String, Object>();
						result.put("date", acc.getString("ordDate"));// 日期
						result.put("wk", acc.getString("ordDateXq"));// 周几
						String gid = acc.getString("gid");
						result.put("gid", acc.getString("gid"));// 类型标示
						result.put("tn", BASE64Util.getBASE64(LotteryType.getName(gid)));// 类型名称
						result.put("num", acc.getInteger("ordNum"));// 注数
						result.put("amt", acc.getDouble("ordMoney"));// 下注金额
						result.put("com", acc.getDouble("yMoney"));// 佣金
						result.put("pl", acc.getDouble("ykMoney"));// 盈亏：profit and loss
						accResults.add(result);
					}
				}
				jsonResult.addAll(accResults);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("调用时时彩手机服务器端[getAccHisDay]接口返回数据格式异常", e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("调用时时彩手机服务器端[getAccHisDay]接口返回数据为空");
		}
		return jsonResult;
	}

	/**
	 * 账户历史当天明细
	 */
	@At("ssc/accHisDayDetail")
	@Ok("jsp:page.ssc.user.accHisDayDetail")
	public Object toAccHisDayDetail(String gid, int rtype, String bt, String issue) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("gid", gid);
		try {
			obj.put("game", BASE64Util.getBASE64(LotteryType.getName(gid)));
		} catch (UnsupportedEncodingException e) {
		}
		obj.put("rtype", rtype);
		obj.put("bt", bt);
		obj.put("issue", issue);
		return obj;
	}

	/**
	 * 获取账户历史当天明细
	 * 
	 * @param gid
	 *            游戏编号:KLC,SSC,JBC...
	 * @param rtype
	 *            1已结算、2未结算
	 * @param btDate
	 *            归属日期
	 * @param cp
	 *            当前页
	 * @return
	 */
	@At("ssc/getAccHisDayDetail")
	@Ok("json")
	public JsonResult getAccHisDayDetail(String gid, int rtype, String bt, int cp, String issue, HttpServletRequest request, HttpSession session) {
		log.debug("getAccHisDayDetail-->gid:" + gid + ",rtype:" + rtype + ",bt:" + bt + ",cp:" + cp);
		JsonResult jsonResult = JsonResult.createSuccess();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append(rtype == 1 ? "/getAccHisDetail" : "/getAccHisDetail2").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("rtype", rtype + "");// 1所有彩种、2某一彩种
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("gid", gid);
		parameters.put("startTime", bt);
		parameters.put("issue", issue);
		parameters.put("targetpage1", cp + "");
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'recordCount':4,'listAccHis':[{'gid':'JSKS','bid':'0af2101889eb4b16a334660bdd873b05','btm':1409131011122,'iss':'20140827053','betOn':'QUAN_SUAI','bty':'NO_0_0_0','ban':2.0,'odd':28.0,'wan':-2.0,'ucm':0.0,'ta':'A','recordCount':4},{'gid':'JSKS','bid':'4e4dd531d74442658c959d8b684208b1','btm':1409110068618,'iss':'20140827018','betOn':'WEI_SUAI','bty':'NO_1_1_1','ban':2.0,'odd':180.0,'wan':358.0,'ucm':0.0,'ta':'A','recordCount':4},{'gid':'JSKS','bid':'e68999094805433d9280b7606dd46bd0','btm':1409109397330,'iss':'20140827017','betOn':'SAN_JUN','bty':'NO_2','ban':2.0,'odd':2.0,'wan':-2.0,'ucm':0.0,'ta':'A','recordCount':4},{'gid':'JSKS','bid':'9c400e4b5d39446aa0f55a3ce45b43bb','btm':1409109325839,'iss':'20140827017','betOn':'SAN_JUN','bty':'NO_1','ban':3.0,'odd':2.0,'wan':6.0,'ucm':0.0,'ta':'A','recordCount':4}],'targetpage':1,'totalPage':1}";
		if (response != null && !response.equals("")) {
			try {
				Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
				JSONObject jsonObject = JSON.parseObject(response);
				jsonResult.setCp(jsonObject.getInteger("targetpage"));
				jsonResult.setTps(jsonObject.getInteger("totalPage"));
				jsonResult.setTc(jsonObject.getInteger("recordCount"));
				JSONObject sum = JSON.parseObject(jsonObject.getString("sum"));// 汇总信息
				jsonResult.setData(sum);
				Object listAccHisObj = jsonObject.get("listAccHis");
				JSONArray jsonArray = JSON.parseArray(null == listAccHisObj ? null : jsonObject.get("listAccHis").toString());
				List<Map<String, Object>> orderResult = new ArrayList<Map<String, Object>>();
				if (jsonArray != null) {
					double ban_2 = 0;
					for (Object obj : jsonArray) {
						JSONObject acc = (JSONObject) obj;
						Map<String, Object> order = new HashMap<String, Object>();
						if (rtype == 1) {// 已结算
							// 编号:f059457eb14b4e108323b304fc9370c2
							order.put("id", acc.getString("bid"));
							// 彩种:KLC
							String gameId = acc.getString("gid");
							order.put("gn", i18n.get("title.ssc." + gameId));
							// 玩法名称:SERIAL_2
							String pt = acc.getString("betOn");
							if (!"SHSSC".equals(gameId)) {
								order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
								if (gameId.indexOf("SSC") > -1 && pt.equals("TOTAL")
										&& ("HE".equals(acc.getString("bty")) || "TIGER".equals(acc.getString("bty")) || "DRAGON".equals(acc.getString("bty")))) {
									order.put("pn", "龙虎和 ");
								}
							} else {
								if ("YIZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.YZ"));
								} else if ("ERZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.EZ"));
								} else if ("SANZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SZ"));
								} else if ("SANZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SZ"));
								} else if ("SANZIDW_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SDW"));
								} else if ("ZUXUANSAN_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.ZXS"));
								} else if ("ZUXUANLIU_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.ZXL"));
								} else if ("KUADU_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.KD"));
								} else {
									order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
								}
							}

							// 交易项名称:NO_1,NO_2
							String ball = acc.getString("bty");
							StringBuilder betBall = new StringBuilder();
							if ("HS_SM".equals(pt)) {
								for (String str : ball.split(",")) {
									int index = str.indexOf("_");// label.ssc.play.SG
									if (!"SHSSC".equals(gameId)) {
										betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
									} else {
										if (str.indexOf("ZHISHU") > -1 || str.indexOf("HESHU") > -1) {
											betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 尾" + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
										} else {
											betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
										}
									}
								}
								order.put("ball", betBall.toString());
							} else {
								for (String str : ball.split(",")) {
									if (str.indexOf("-") > -1) {// 兼容SSC新玩法：二字、三字等
										String balls[] = str.split("-");
										for (String b : balls) {
											String bx = i18n.get("label.ssc.ball." + b);
											betBall.append(bx.substring(bx.length() - 1));// 01显示为1
										}
										betBall.append(",");
									} else {
										betBall.append(i18n.get("label.ssc.ball." + str)).append(",");
									}
								}
								order.put("ball", betBall.deleteCharAt(betBall.length() - 1).toString());
							}
							// 期号
							order.put("issue", acc.getString("iss"));
							// 盘口Handicap
							order.put("hdcp", acc.getString("ta"));
							// 赔率odds
							order.put("ods", acc.getDouble("odd"));
							// 下注时间bet time
							order.put("bt", acc.getDate("btm"));
							// 下注金额
							order.put("amt", acc.getDouble("ban"));
							// 佣金(退水)
							order.put("com", ArithUtil.formatDouble(acc.getDouble("ucm") * 100));
							// 可赢金额 can money
							order.put("cmny", ArithUtil.formatDouble(acc.getDouble("wan")));
						} else if (rtype == 2 || rtype == 3) {// 未结算
							order.put("id", acc.getString("bid"));
							// 彩种:KLC
							String gameId = acc.getString("gameID");
							order.put("gn", i18n.get("title.ssc." + gameId));
							// 玩法名称:SERIAL_2
							String pt = acc.getString("playType");
							if (!"SHSSC".equals(gameId)) {
								order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
								if (gameId.indexOf("SSC") > -1 && pt.equals("TOTAL")
										&& ("HE".equals(acc.getString("betBall")) || "TIGER".equals(acc.getString("betBall")) || "DRAGON".equals(acc.getString("betBall")))) {
									order.put("pn", "龙虎和 ");
								}
							} else {
								if ("YIZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.YZ"));
								} else if ("ERZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.EZ"));
								} else if ("SANZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SZ"));
								} else if ("SANZI_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SZ"));
								} else if ("SANZIDW_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.SDW"));
								} else if ("ZUXUANSAN_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.ZXS"));
								} else if ("ZUXUANLIU_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.ZXL"));
								} else if ("KUADU_QS".equals(pt)) {
									order.put("pn", i18n.get("title.ssc.KD"));
								} else {
									order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
								}
							}
							// 交易项名称:NO_1,NO_2
							String ball = acc.getString("betBall");
							StringBuilder betBall = new StringBuilder();
							if ("HS_SM".equals(pt)) {
								for (String str : ball.split(",")) {
									int index = str.indexOf("_");// label.ssc.play.SG
									if (!"SHSSC".equals(gameId)) {
										betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
									} else {
										if (str.indexOf("ZHISHU") > -1 || str.indexOf("HESHU") > -1) {
											betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 尾" + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
										} else {
											betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
										}
									}
								}
								order.put("ball", betBall.toString());
							} else {
								for (String str : ball.split(",")) {
									if (str.indexOf("-") > -1) {// 兼容SSC新玩法：二字、三字等
										String balls[] = str.split("-");
										for (String b : balls) {
											String bx = i18n.get("label.ssc.ball." + b);
											betBall.append(bx.substring(bx.length() - 1));// 01显示为1
										}
										betBall.append(",");
									} else {
										betBall.append(i18n.get("label.ssc.ball." + str)).append(",");
									}
								}
								order.put("ball", betBall.deleteCharAt(betBall.length() - 1).toString());
							}
							// 期号
							order.put("issue", acc.getString("issue"));
							// 盘口Handicap
							order.put("hdcp", acc.getString("hpType"));
							// 赔率odds
							order.put("ods", acc.getDouble("betRate"));
							// 下注时间bet time
							order.put("bt", acc.getDate("betTime"));
							// 下注金额
							order.put("amt", acc.getDouble("betMoney"));
							ban_2 += acc.getDouble("betMoney");
							// 佣金(退水)
							order.put("com", ArithUtil.formatDouble(acc.getDouble("huiYong") * 100));
							// 输赢
							order.put("cmny", 0);
							// 状态
							order.put("sta", acc.getString("status"));
						}
						orderResult.add(order);
					}
					if (rtype == 2 || rtype == 3) {
						Map<String, Object> sum_2 = new HashMap<String, Object>();
						sum_2.put("ban", ban_2);
						jsonResult.setData(sum_2);
					}
				}
				jsonResult.addAll(orderResult);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("调用时时彩手机服务器端[getAccHisDetail]按期明细接口返回数据格式异常,response << " + response, e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("调用时时彩手机服务器端[getAccHisDetail]按期明细接口返回数据为空");
		}
		return jsonResult;
	}

	/**
	 * 账户历史分期明细
	 */
	@At("ssc/accHisDayPeriod")
	@Ok("jsp:page.ssc.user.accHisDayPeriod")
	public Object toAccHisDayPeriod(String gid, int rtype, String bt) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("gid", gid);
		try {
			obj.put("game", BASE64Util.getBASE64(LotteryType.getName(gid)));
		} catch (UnsupportedEncodingException e) {
		}
		obj.put("rtype", rtype);
		obj.put("bt", bt);
		return obj;
	}

	/**
	 * 获取账户历史按期明细
	 * 
	 * @param gid
	 * @param rtype
	 * @param btDate
	 * @return
	 */
	@At("ssc/getAccHisDayPeriod")
	@Ok("json")
	public JsonResult getAccHisDayPeriod(String gid, int rtype, String bt, HttpSession session) {
		log.debug("getAccHisDayPeriod-->gid:" + gid + ",rtype:" + rtype + ",bt:" + bt);
		JsonResult jsonResult = JsonResult.createSuccess();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append(rtype == 1 ? "/getAccHisDay" : "/getAccHisDay2").toString();
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("rtype", rtype + "");// 1所有彩种、2某一彩种
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("gid", gid);// gid 如果给空值的话默认会按天统计数据不分彩种 (参数可为：KLC,SSC,BJC,XYNC,JSKS).给相应彩种参数的话就是按特定彩种查一天的按期汇总数据
		parameters.put("startTime", bt);
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'accHisMap':{'JSKS_20140827018':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':2,'ordNum':1,'ordMoney':2.0,'yMoney':0.0,'ykMoney':358.0,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':'JSKS','issue':'20140827018','userName':null,'lossAmount':0.0,'winAmount':0.0},'JSKS_20140827017':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'num':1,'ordNum':2,'ordMoney':5.0,'yMoney':0.0,'ykMoney':4.0,'ordDate':'2014-08-27','ordDateXq':'Wed','gid':'JSKS','issue':'20140827017','userName':null,'lossAmount':0.0,'winAmount':0.0}}}";
		if (response != null && !response.equals("")) {
			try {
				JSONObject jsonObject = JSON.parseObject(response);
				Object accHisObj = jsonObject.get("accHisMap");
				JSONObject accHis = JSON.parseObject(accHisObj == null ? null : jsonObject.get("accHisMap").toString());
				List<Map<String, Object>> accResults = new ArrayList<Map<String, Object>>();
				if (accHis != null) {
					for (Entry<String, Object> entry : accHis.entrySet()) {
						JSONObject acc = JSON.parseObject(entry.getValue().toString());
						Map<String, Object> result = new HashMap<String, Object>();
						result.put("issue", acc.getString("issue"));// 期数
						result.put("num", acc.getInteger("ordNum"));// 注数
						result.put("amt", acc.getDouble("ordMoney"));// 下注金额
						result.put("com", ArithUtil.formatDouble(acc.getDouble("yMoney")));// 佣金
						result.put("pl", ArithUtil.formatDouble(acc.getDouble("ykMoney")));// 嬴亏
						accResults.add(result);
					}
					// 按期数倒序
					Collections.sort(accResults, new Comparator<Map<String, Object>>() {
						@Override
						public int compare(Map<String, Object> o1, Map<String, Object> o2) {
							return o2.get("issue").toString().compareTo(o1.get("issue").toString());
						}
					});
				}
				jsonResult.addAll(accResults);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("调用时时彩手机服务器端[getAccHisDay]按期明细接口返回数据格式异常", e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("调用时时彩手机服务器端[getAccHisDay]按期明细接口返回数据为空");
		}
		return jsonResult;
	}

	/**
	 * 跳转到用户基本信息页面
	 */
	@At("ssc/userInfo")
	@Ok("jsp:page.ssc.user.userInfo")
	public Object toUserInfo() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("cf", AppCache.sscSysConfig);
		return obj;
	}

	/**
	 * 获取用户基本信息
	 * 
	 * @return
	 */
	@At("ssc/getUserInfo")
	@Ok("json")
	public JsonResult getUserInfo(HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/userInfo").toString();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("type", "0");
		parameters.put("gameId", "SSC");// gameId参数对用户基本信息没有意义
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		JSONObject jsonObject = HttpClientUtil.doGet(url, parameters);
		if (jsonObject != null && jsonObject.size() != 0) {
			try {
				Map<String, Object> user = new HashMap<String, Object>();
				user.put("sc", jsonObject.getDoubleValue("sscCredit"));// 信用额度
				double balance = ArithUtil.formatDouble(Double.parseDouble(jsonObject.getString("avacredits")));
				// DecimalFormat df = new DecimalFormat("0");
				// user.put("ac", df.format(balance));// 信用余额
				user.put("ac", balance);// 信用余额
				String hdt = jsonObject.getString("handTypeMap");
				user.put("ht", hdt);// 所属盘口
				double todayPl = jsonObject.getDoubleValue("ykMoney");// 今日输赢
				user.put("pl", todayPl);
				JSONObject userAccount = JSON.parseObject(jsonObject.get("UserAccount").toString());
				user.put("an", userAccount.getString("name"));// 账号
				user.put("nm", userAccount.getString("username"));// 会员名称
				user.put("sts", userAccount.getString("status"));// 状态: 1 正常、 2 停用
				user.put("tp", userAccount.getString("accountType"));// 用户类型:1现金、0信用
				jsonResult.setData(user);
				// 覆盖session中sscuser信息
				sscUser.setBalance(balance);
				sscUser.setHandype(hdt);
				sscUser.setTodayPL(todayPl);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("获取用户基本信息,调用时时彩手机服务端[userInfo]接口返回数据格式异常,response >> " + (null == jsonObject ? null : jsonObject.toJSONString()), e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("获取用户基本信息,调用时时彩手机服务端[userInfo]接口返回数据为空,response >> " + (null == jsonObject ? null : jsonObject.toJSONString()));
		}
		return jsonResult;

	}

	/**
	 * 跳转到用户详细信息页面
	 */
	@At("ssc/userDetail")
	@Ok("jsp:page.ssc.user.userDetail")
	public Object toUserDetail(String gid) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("gid", gid);
		return obj;
	}

	/**
	 * 获取用户投注限额信息
	 * 
	 * @param gid
	 * @return
	 */
	@At("ssc/getUserDetail")
	@Ok("json")
	public JsonResult getUserDetail(String gid, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/userInfo").toString();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("type", "1");// type参数是固定的
		parameters.put("gameId", gid);
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'recordminMap':{'SERIAL_5-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_5-NO_1','gameCode':null,'singlelowest':2,'singlehighest':500,'danxhighest':2000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04},'TOTAL-TAIL_BIG':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'TOTAL-TAIL_BIG','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'TOTAL-BIG':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'TOTAL-BIG','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_8-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_8-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-SUM_ODD':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-SUM_ODD','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-TAIL_BIG':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-TAIL_BIG','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_3-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_3-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'SERIAL_2_Z-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_2_Z-NO_1','gameCode':null,'singlelowest':2,'singlehighest':2000,'danxhighest':20000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04},'BALL_1-BIG':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-BIG','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-EAST':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-EAST','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.025,'bcommission':0.025,'ccommission':0.025,'dcommission':0.01,'linkage':null,'zhx':null,'ip':null,'commission':0.01},'BALL_5-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_5-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-DRAGON':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-DRAGON','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.005,'bcommission':0.01,'ccommission':0.015,'dcommission':0.01,'linkage':null,'zhx':null,'ip':null,'commission':0.01},'TOTAL-ODD':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'TOTAL-ODD','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'SERIAL_3-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_3-NO_1','gameCode':null,'singlelowest':2,'singlehighest':1000,'danxhighest':20000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04},'BALL_6-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_6-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'SERIAL_2-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_2-NO_1','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':100000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04},'SERIAL_3_Z-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_3_Z-NO_1','gameCode':null,'singlelowest':2,'singlehighest':500,'danxhighest':1000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04},'BALL_7-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_7-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_1-ZHONG':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-ZHONG','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.025,'bcommission':0.025,'ccommission':0.025,'dcommission':0.01,'linkage':null,'zhx':null,'ip':null,'commission':0.01},'BALL_1-ODD':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_1-ODD','gameCode':null,'singlelowest':2,'singlehighest':50000,'danxhighest':300000,'acommission':0.03,'bcommission':0.04,'ccommission':0.05,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_2-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_2-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'BALL_4-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'BALL_4-NO_1','gameCode':null,'singlelowest':2,'singlehighest':30000,'danxhighest':100000,'acommission':0.025,'bcommission':0.035,'ccommission':0.045,'dcommission':0.015,'linkage':null,'zhx':null,'ip':null,'commission':0.015},'SERIAL_4-NO_1':{'returnResult':0,'entity':null,'targetpage':1,'pagesize':20,'orderinfo':'','version':null,'playname':'SERIAL_4-NO_1','gameCode':null,'singlelowest':2,'singlehighest':500,'danxhighest':2000,'acommission':0.085,'bcommission':0.085,'ccommission':0.085,'dcommission':0.04,'linkage':null,'zhx':null,'ip':null,'commission':0.04}}}";
		if (response != null && !response.equals("")) {
			try {
				JSONObject jsonObject = JSON.parseObject(response);
				JSONObject gameRecords = JSON.parseObject(jsonObject.get("recordminMap").toString());
				List<Map<String, Object>> gameRecordList = new ArrayList<Map<String, Object>>();
				for (String key : gameRecords.keySet()) {
					Map<String, Object> result = new HashMap<String, Object>();
					JSONObject record = JSON.parseObject(gameRecords.get(key).toString());
					result.put("pn", key);
					result.put("sl", record.getString("dd"));// singlelowest
					result.put("sh", record.getString("dg"));// singlehighest
					result.put("dh", record.getString("dx"));// danxhighest
					// result.put("com", ArithUtil.formatDouble(record.getDouble("commission") * 100));
					result.put("acom", ArithUtil.formatDouble(record.getDouble("a") * 100));
					result.put("bcom", ArithUtil.formatDouble(record.getDouble("b") * 100));
					result.put("ccom", ArithUtil.formatDouble(record.getDouble("c") * 100));
					result.put("dcom", ArithUtil.formatDouble(record.getDouble("d") * 100));
					gameRecordList.add(result);
				}
				jsonResult.addAll(gameRecordList);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("获取用户限额信息,调用时时彩手机服务端[userInfo-->type=1]接口返回数据格式异常,response >> " + response, e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("获取用户限额信息,调用时时彩手机服务端[userInfo-->type=1]接口返回数据为空");
		}
		return jsonResult;
	}

	/**
	 * 跳转到下注状况页面
	 */
	@At("ssc/betInfo")
	@Ok("jsp:page.ssc.user.betInfo")
	public void toBetInfo() {
	}

	/**
	 * 获取下注状况数据
	 * 
	 * @param gid
	 *            彩种:KLC/SSC/BJC...
	 * @param cp
	 *            当前页
	 * @param session
	 * @return
	 */
	@At("ssc/getBetInfo")
	@Ok("json")
	public JsonResult getBetInfo(String gid, int cp, HttpServletRequest request, HttpSession session) {
		JsonResult jsonResult = JsonResult.createSuccess();
		String url = new StringBuilder(propertiesLoader.getTrim("vinbet.ssc.url")).append("/getBillInfo").toString();
		SscUser sscUser = (SscUser) session.getAttribute(com.vinbet.mobile.util.Constants.SSC_USER_SESSION);
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("userName", sscUser.getAccoutName());
		parameters.put("tg", cp + "");
		parameters.put(Constants.TOKEN_SSC, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.ssc")));
		String response = HttpClientUtil.doGetString(url, parameters);
		// String response =
		// "{'recordCount':2,'billList':[{'bid':'c5d94d629223472d880a91657ebd849e','betTime':1409131029786,'issue':'20140827068','gameID':'SSC','playType':'SERIAL_2','betBall':'NO_1,NO_2','betMoney':'2.0','betRate':'1.98','hpType':'A','huiYong':'0.0','kMoney':'1.96','recordCount':2},{'bid':'0af2101889eb4b16a334660bdd873b05','betTime':1409131011122,'issue':'20140827053','gameID':'JSKS','playType':'QUAN_SUAI','betBall':'NO_0_0_0','betMoney':'2.0','betRate':'28.0','hpType':'A','huiYong':'0.0','kMoney':'54.0','recordCount':2}],'targetpage':1,'totalPage':1}";
		if (response != null && !response.equals("")) {
			try {
				Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
				JSONObject jsonObject = JSON.parseObject(response);
				jsonResult.setCp(jsonObject.getInteger("targetpage"));
				jsonResult.setTps(jsonObject.getInteger("totalPage"));
				jsonResult.setTc(jsonObject.getInteger("recordCount"));
				JSONObject jsonSum = JSON.parseObject(jsonObject.getString("sum"));
				Map<String, Object> sum = new HashMap<String, Object>();
				sum.put("samt", jsonSum.getDouble("xMoney"));// 总下注
				sum.put("spl", jsonSum.getDouble("kMoney"));// 总可赢
				jsonResult.setData(sum);
				JSONArray jsonArray = JSON.parseArray(jsonObject.get("billList").toString());
				List<Map<String, Object>> orderResult = new ArrayList<Map<String, Object>>();
				for (Object obj : jsonArray) {
					JSONObject acc = (JSONObject) obj;
					Map<String, Object> order = new HashMap<String, Object>();
					// 编号:f059457eb14b4e108323b304fc9370c2
					order.put("id", acc.getString("bid"));
					// 彩种:KLC
					String gameId = acc.getString("gameID");
					order.put("gn", i18n.get("title.ssc." + gameId));
					// 玩法名称:SERIAL_2
					String pt = acc.getString("playType");
					if (!"SHSSC".equals(gameId)) {
						order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
						if (gameId.indexOf("SSC") > -1 && pt.equals("TOTAL")
								&& ("HE".equals(acc.getString("betBall")) || "TIGER".equals(acc.getString("betBall")) || "DRAGON".equals(acc.getString("betBall")))) {
							order.put("pn", "龙虎和 ");
						}
					} else {
						if ("YIZI_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.YZ"));
						} else if ("ERZI_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.EZ"));
						} else if ("SANZI_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.SZ"));
						} else if ("SANZI_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.SZ"));
						} else if ("SANZIDW_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.SDW"));
						} else if ("ZUXUANSAN_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.ZXS"));
						} else if ("ZUXUANLIU_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.ZXL"));
						} else if ("KUADU_QS".equals(pt)) {
							order.put("pn", i18n.get("title.ssc.KD"));
						} else {
							order.put("pn", i18n.get("label." + (gameId.equals("BJC") ? "bjc" : "ssc") + ".play." + pt));
						}
					}
					// 交易项名称:NO_1,NO_2
					String ball = acc.getString("betBall");
					StringBuilder betBall = new StringBuilder();
					if ("HS_SM".equals(pt)) {
						for (String str : ball.split(",")) {
							int index = str.indexOf("_");// label.ssc.play.SG
							if (!"SHSSC".equals(gameId)) {
								betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
							} else {
								if (str.indexOf("ZHISHU") > -1 || str.indexOf("HESHU") > -1) {
									betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 尾" + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
								} else {
									betBall.append(i18n.get("label.ssc.ball." + str.substring(0, index)) + "和 " + i18n.get("label.ssc.ball." + str.substring(index + 1, str.length())));
								}
							}
						}
						order.put("ball", betBall.toString());
					} else {
						for (String str : ball.split(",")) {
							if (str.indexOf("-") > -1) {// 兼容SSC新玩法：二字、三字等
								String balls[] = str.split("-");
								for (String b : balls) {
									String bx = i18n.get("label.ssc.ball." + b);
									betBall.append(bx.substring(bx.length() - 1));// 01显示为1
								}
								betBall.append(",");
							} else {
								betBall.append(i18n.get("label.ssc.ball." + str)).append(",");
							}
						}
						order.put("ball", betBall.deleteCharAt(betBall.length() - 1).toString());
					}
					// 期号
					order.put("issue", acc.getString("issue"));
					// 盘口Handicap
					order.put("hdcp", acc.getString("hpType"));
					// 赔率odds
					order.put("ods", acc.getDouble("betRate"));
					// 下注时间bet time
					order.put("bt", DateUtil.getTime(acc.getDate("betTime")));
					// 下注金额
					order.put("amt", acc.getDouble("betMoney"));
					// 佣金(退水)
					order.put("com", ArithUtil.formatDouble(acc.getDouble("huiYong") * 100));
					// 可赢金额 can money
					order.put("cmny", ArithUtil.formatDouble(acc.getDouble("kMoney")));
					if ((gid == null || gid.equals("")) || gid.equals(gameId)) {
						orderResult.add(order);
					}
				}
				jsonResult.addAll(orderResult);
			} catch (Exception e) {
				jsonResult = JsonResult.createFalied();
				log.error("调用时时彩手机服务端[getBillInfo]接口返回数据格式异常:", e);
			}
		} else {
			jsonResult = JsonResult.createFalied();
			log.error("调用时时彩手机服务端[getBillInfo]接口返回数据为空");
		}
		return jsonResult;
	}
}