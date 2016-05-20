package com.vinbet.mobile.action.portal;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.Mvcs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.By;
import org.nutz.mvc.annotation.Filters;
import org.nutz.mvc.annotation.Ok;

import com.vinbet.mobile.domain.UserInfo;
import com.vinbet.mobile.entity.portal.Dict;
import com.vinbet.mobile.entity.portal.MessageInfo;
import com.vinbet.mobile.sys.AppCache;
import com.vinbet.mobile.sys.CEPUserCenterIceClient;
import com.vinbet.mobile.sys.PropertiesLoader;
import com.vinbet.mobile.util.BASE64Util;
import com.vinbet.mobile.util.CheckSession;
import com.vinbet.mobile.util.Constants;
import com.vinbet.mobile.util.JsonResult;

/**
 * Created by Ray on 2014/12/13.
 */
@IocBean(singleton = false)
@At("/user/message")
@Filters(@By(type = CheckSession.class, args = { "USER_SESSION", "/timeout" }))
public class MessageAction {
	@Inject
	private PropertiesLoader propertiesLoader;
	@Inject
	private CEPUserCenterIceClient cEPUserCenterIceClient;
	private Log log = Logs.getLog(UserAction.class);

	/**
	 * 系统消息
	 * 
	 * @return
	 */
	@At("/")
	@Ok("jsp:page.portal.message")
	public Object message() {
		HashMap<String, Object> obj = new HashMap<String, Object>();
		List<Dict> msgTop = AppCache.getI18nDictListByType("msgTop");
		// String array =JSONArray.toJSONString(msgTop);
		obj.put("msgTop", msgTop);
		return obj;
	}

	@At("/msg/?/?/?")
	@Ok("json")
	public Object msg(String type, int page, String opt, HttpSession session, HttpServletRequest request) {
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String iterface = "getUserMessage";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		List<MessageInfo> messageInfos = new ArrayList<MessageInfo>();
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("opt", opt);// 操作 1.登录查询2.站内信查询3.获取最近的信息
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("uid", user.getUserId());// 用户ID
			if (!opt.equals("1")) {// 如果是登录查询则不区分主题类型
				recElm.addAttribute("subjt", type);// 主题类型
			}
			if(Mvcs.getLocalizationKey()!=null){
				recElm.addAttribute("lg", Mvcs.getLocalizationKey());// 语言
			}else{
				recElm.addAttribute("lg", "zh");// 语言
			}
			recElm.addAttribute("pgnm", String.valueOf(page < 1 ? 1 : page));// 第几页
			recElm.addAttribute("pgsz", "200");// 一页多少条
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					List<Dict> msgTop = AppCache.getI18nDictListByType("msgTop");
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						for (Element reqElm : childNodes) {
							if (reqElm.attributeValue("rdst").equals("1") && opt.equals("1")) {
								continue;
							}
							MessageInfo info = new MessageInfo();
							info.setSubject(reqElm.attributeValue("subjt"));
							info.setTime(reqElm.attributeValue("tm"));
							info.setReadStatus(reqElm.attributeValue("rdst"));
							try {
								info.setIntro(BASE64Util.getBASE64(reqElm.attributeValue("brief")));
								info.setContent(BASE64Util.getBASE64(reqElm.attributeValue("cntxt")));
							} catch (UnsupportedEncodingException e) {
							}
							info.setMsgid(reqElm.attributeValue("msgid"));
							for (Dict dict : msgTop) {
								if (dict.getDictCode().equals(info.getSubject())) {
									info.setSubjectName(dict.getDictName());
								}
							}
							messageInfos.add(info);
						}
					} else {
						log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response.replace("\n", ""));
					}
				}
			} else {
				log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (DocumentException e) {
			log.error("调用[CEP]用户中心[" + iterface + "]接口处理异常.", e);
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		jsonResult.setList(messageInfos);
		return jsonResult;

	}

	@At("/getUnreadCount")
	@Ok("json")
	public Object getUnreadCount(HttpSession session, HttpServletRequest request) {
		UserInfo user = (UserInfo) session.getAttribute(com.vinbet.mobile.util.Constants.USER_SESSION);
		String iterface = "getUserMessage";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		Map<String, Integer> unreadNum = new HashMap<String, Integer>();
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("opt", "2");// 操作 1.登录查询2.站内信查询3.获取最近的信息
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("uid", user.getUserId());// 用户ID
			if(Mvcs.getLocalizationKey()!=null){
				recElm.addAttribute("lg", Mvcs.getLocalizationKey());// 语言
			}else{
				recElm.addAttribute("lg", "zh");// 语言
			}
			recElm.addAttribute("pgnm", "1");// 第几页
			recElm.addAttribute("pgsz", "1000");// 一页多少条
			recElm.addAttribute("rdst", "0");// 阅读状态 0.未读1.已读
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (resultCode.equals(Constants.SUCCESS)) {
					// log.info("调用[CEP]用户中心[" + iterface + "]接口返回数据:" + response);
					List<Dict> msgTop = AppCache.getI18nDictListByType("msgTop");
					List<Element> childNodes = root.elements();
					if (childNodes.size() > 0) {
						for (Element reqElm : childNodes) {
							String subjt = reqElm.attributeValue("subjt");
							if (unreadNum.get(subjt) != null) {
								int num = unreadNum.get(subjt);
								unreadNum.put(subjt, num + 1);
							} else {
								unreadNum.put(subjt, 1);
							}
						}
					} else {
						log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response.replace("\n", ""));
					}
				}
			} else {
				log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (DocumentException e) {
			log.error("调用[CEP]用户中心[" + iterface + "]接口处理异常.", e);
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("unreadNum", unreadNum);
		jsonResult.setData(data);
		return jsonResult;

	}

	@At("/receipt/?")
	@Ok("json")
	public Object receipt(String msgId, HttpSession session, HttpServletRequest request) {
		String iterface = "optUserMessage";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("opt", "1");// 操作 1.更新2.删除
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("msgids", msgId);// 站内信ID
			recElm.addAttribute("rdst", "1");// 阅读状态0.未读1.已读
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
					return JsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
				return jsonResult;
			} else {
				log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (DocumentException e) {
			log.error("调用[CEP]用户中心[" + iterface + "]接口处理异常.", e);
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

	@At("/del/?")
	@Ok("json")
	public Object del(String msgIds, HttpSession session, HttpServletRequest request) {
		String iterface = "optUserMessage";
		Map<String, String> i18n = (Map<String, String>) request.getAttribute("msg");
		JsonResult jsonResult = JsonResult.createSuccess();
		try {
			Document outDoc = DocumentHelper.createDocument();// 需要输出的xml节点
			Element rootElm = outDoc.addElement("req");
			rootElm.addAttribute("opt", "3");// 操作 1.更新3.删除
			Element recElm = rootElm.addElement("rec");
			recElm.addAttribute("msgids", msgIds);// 站内信ID
			String xml = outDoc.asXML();
			String response = cEPUserCenterIceClient.otherTypeZreocSrvIPrx(iterface, xml);
			if (response != null && !response.equals("")) {
				Document doc = DocumentHelper.parseText(response);
				Element root = doc.getRootElement();
				String resultCode = root.attributeValue("st");
				if (!resultCode.equals(Constants.SUCCESS)) {
					log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据:" + response);
					return JsonResult.createFalied(i18n.get("msg.common.systemError"));
				}
				return jsonResult;
			} else {
				log.error("调用[CEP]用户中心[" + iterface + "]请求报文：" + xml + "接口返回数据为空");
				return JsonResult.createFalied(i18n.get("msg.common.systemError"));
			}
		} catch (DocumentException e) {
			log.error("调用[CEP]用户中心[" + iterface + "]接口处理异常.", e);
			return JsonResult.createFalied(i18n.get("msg.common.systemError"));
		}
	}

}
