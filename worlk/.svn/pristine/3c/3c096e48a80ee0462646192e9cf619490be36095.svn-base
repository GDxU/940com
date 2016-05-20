package com.vinbet.mobile.action.sport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ViewWrapper;

import com.vinbet.mobile.action.portal.LoginAction;
import com.vinbet.mobile.domain.SportUser;
import com.vinbet.mobile.sys.AppStatusCheckFilter;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.HttpClientUtil;
import com.vinbet.mobile.util.MD5Util;

/**
 * Created by Ray on 15/3/7.
 */
@IocBean(singleton = false)
@At("/sport")
@Filters({ @By(type = CheckSession.class, args = { "SPORT_USER_SESSION", "/timeout" }), @By(type = AppStatusCheckFilter.class) })
public class SportAction {
	private static final Logger logger = LogManager.getLogger(LoginAction.class);
	@Inject
	private PropertiesLoader propertiesLoader;

	@At("/")
	@Ok("jsp:page.sport.main_menu")
	public void toMenuPage() {

	}

	@At("/tradedInfo")
	@Ok("jsp:page.sport.tradedInfo")
	public Object toTradedInfo(String date) {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		obj.put("date", date);
		return obj;
	}

	@At("/getTradedInfo")
	@Ok("raw")
	public String getTradedInfo(String date, HttpSession session) {
		String xmlResp = null;
		try {
			SportUser userInfo = (SportUser) session.getAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.getSettledRecord.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("uid", userInfo.getUserIdInSport());
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put("date", date);
			parameters.put("sid", userInfo.getSessionid());
			xmlResp = HttpClientUtil.doGetString(url, parameters);
			if (xmlResp != null && !xmlResp.equals("")) {
				Document doc = DocumentHelper.parseText(xmlResp);
				Element element = doc.getRootElement();
				String errcode = element.attributeValue("errcode");
				if (errcode != null && errcode.equals("1015")) {
					session.invalidate();
				}
				List<Element> records = element.elements();
				for (Element record : records) {
					String game = record.attributeValue("game");
					record.addAttribute("game", BASE64Util.getBASE64(game));
					List<Element> items = record.elements();
					for (Element item : items) {
						String gname = item.attributeValue("gname");
						item.addAttribute("gname", BASE64Util.getBASE64(gname));
					}
				}
				xmlResp = doc.asXML();
			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiUser.getUnSettledRecord.do]接口返回数据格式异常,response << " + xmlResp, e);
			xmlResp = "<recoreds sid='0' st='1' errcode='-1'/>";
		}
		return xmlResp;
	}

	@At("/getTradingInfo")
	@Ok("raw")
	public String getTradingInfo(HttpSession session) {
		String xmlResp = null;
		try {
			SportUser userInfo = (SportUser) session.getAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.getUnSettledRecord.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("uid", userInfo.getUserIdInSport());
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put("sid", userInfo.getSessionid());
			parameters.put("s", "0");
			xmlResp = HttpClientUtil.doGetString(url, parameters);
			if (xmlResp != null && !xmlResp.equals("")) {
				Document doc = DocumentHelper.parseText(xmlResp);
				Element element = doc.getRootElement();
				String errcode = element.attributeValue("errcode");
				if (errcode != null && errcode.equals("1015")) {
					session.invalidate();
				}
				List<Element> records = element.elements();
				for (Element record : records) {
					String game = record.attributeValue("game");
					record.addAttribute("game", BASE64Util.getBASE64(game));
					List<Element> items = record.elements();
					for (Element item : items) {
						String gname = item.attributeValue("gname");
						item.addAttribute("gname", BASE64Util.getBASE64(gname));
					}
				}
				xmlResp = doc.asXML();
			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiUser.getUnSettledRecord.do]接口返回数据格式异常,response << " + xmlResp, e);
			xmlResp = "<recoreds sid='0' st='1' errcode='-1'/>";
		}
		return xmlResp;
	}

	@At("/tradingInfo/?")
	@Ok("jsp:page.sport.tradingInfo")
	public Object toTradingInfo(Object status) {
		if ((status == null || String.valueOf(status).equals("")) || (!String.valueOf(status).equals("1") && !String.valueOf(status).equals("2"))) {
			status = 1;
		}
		HashMap<String, Object> obj = new HashMap<String, Object>();
		status = Integer.parseInt(String.valueOf(status));
		obj.put("status", status);
		return obj;
	}

	@At("/history")
	@Ok("jsp:page.sport.history")
	public void toHistory() {

	}

	@At("/sportGameRules")
	public View tosportGameRules() {
		String lang = Mvcs.getLocalizationKey();
		String page = "page.sport.sportGameRules";
		if (lang != null && !lang.equals("zh")) {
			page = "page.sport.sportGameRules_en";
		}
		return new ViewWrapper(new JspView(page), null);
	}

	@At("/getHistory")
	@Ok("raw")
	public String getHistory(HttpSession session) {
		String xmlResp = null;
		try {
			SportUser userInfo = (SportUser) session.getAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.getUserHistory.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("uid", userInfo.getUserIdInSport());
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put("sid", userInfo.getSessionid());
			xmlResp = HttpClientUtil.doGetString(url, parameters);
			if (xmlResp != null && !xmlResp.equals("")) {
				Document doc = DocumentHelper.parseText(xmlResp);
				Element element = doc.getRootElement();
				String errcode = element.attributeValue("errcode");
				if (errcode != null && errcode.equals("1015")) {
					session.invalidate();
				}
			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiUser.getUserHistory.do]接口返回数据格式异常,response << " + xmlResp, e);
			xmlResp = "<userhistorys sid='0' st='1' errcode='-1'/>";
		}
		return xmlResp;
	}

	@At("/matchResult")
	@Ok("jsp:page.sport.matchResult")
	public void toMatchResult() {

	}

	@At("/getMatchResult")
	@Ok("raw")
	public String getMatchResult(@Param("sdate") String sdate, @Param("sportType") String sportType) {
		String response = null;
		try {
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiData.getMatchResultData.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("s", sportType);
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put("date", sdate);
			parameters.put(com.vinbet.mobile.util.Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
			response = HttpClientUtil.doGetString(url, parameters);
			// 临时规避踢出问题
			if (response == null || response.toLowerCase().equals("null") || response.indexOf("null\n") > -1) {
				response = "<sports sid=\"1\" snm=\"足球\"/>";
			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiData.getMatchResultData.do]接口返回数据格式异常,response << " + response, e);
			response = "<sports sid='0' st='1' errcode='-1'/>";
		}
		return response;
	}

	@At("/message")
	@Ok("jsp:page.sport.message")
	public void toMessage() {

	}

	@At("/getMessage")
	@Ok("raw")
	public String getMessage() {
		String response = null;
		try {
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiData.getMessageData.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put(com.vinbet.mobile.util.Constants.TOKEN_SPORT, MD5Util.md5Hex(propertiesLoader.getTrim("vinbet.token.sport")));
			response = HttpClientUtil.doGetString(url, parameters);
			if (response != null && !"".equals(response)) {
				Document doc = DocumentHelper.parseText(response);
				Element element = doc.getRootElement();
				List<Element> messages = element.elements();
				for (Element message : messages) {
					String content = message.attributeValue("content");
					message.addAttribute("content", BASE64Util.getBASE64(content));
				}
				response = doc.asXML();

			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiData.getMessageData.do]接口返回数据格式异常,response << " + response, e);
			response = "<messages sid='0' st='1' errcode='-1'/>";
		}
		return response;
	}

	@At("/getBalance")
	@Ok("raw")
	public String getBalance(HttpSession session) {
		String xmlResp = null;
		try {
			SportUser userInfo = (SportUser) session.getAttribute(com.vinbet.mobile.util.Constants.SPORT_USER_SESSION);
			String url = new StringBuilder(propertiesLoader.getTrim("vinbet.sport.url")).append("/core/apiUser.getMoney.do").toString();
			Map<String, String> parameters = new HashMap<String, String>();
			parameters.put("uid", userInfo.getUserIdInSport());
			parameters.put("l", Mvcs.getLocalizationKey());
			parameters.put("sid", userInfo.getSessionid());
			xmlResp = HttpClientUtil.doGetString(url, parameters);
			if (xmlResp != null && !xmlResp.equals("")) {
				Document doc = DocumentHelper.parseText(xmlResp);
				Element element = doc.getRootElement();
				String errcode = element.attributeValue("errcode");
				if (errcode != null && errcode.equals("1015")) {
					session.invalidate();
				}
			}
		} catch (Exception e) {
			logger.error("调用[Sport]手机服务器端[apiUser.getMoney.do]接口返回数据格式异常,response << " + xmlResp, e);
		}
		return xmlResp;
	}
}
