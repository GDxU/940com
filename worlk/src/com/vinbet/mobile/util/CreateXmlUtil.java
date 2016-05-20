package com.vinbet.mobile.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 报文组装解析通用工具类。
 * 
 * @author cjp
 * @date 2015-5-14 上午11:33:56
 */
@IocBean
public class CreateXmlUtil {
	/**
	 * 组装通用请求报文。
	 * 
	 * @author cjp
	 * @param reqMap
	 * @param recMap
	 * @return
	 * @since 2015-5-13 下午7:15:34
	 */
	public static String createPublicReqXML(Map<String, String> reqMap, Map<String, String> recMap) {
		Document document = DocumentHelper.createDocument();
		Element reqEle = document.addElement("req");
		Element recEle = reqEle.addElement("rec"); // 根下面创造一个子节点
		Set<String> keys;
		if (reqMap != null) {
			if(reqMap.get("start") != null && "1".equals(reqMap.get("start"))){
				reqEle.addAttribute("start", "1");
			}
			keys = reqMap.keySet();
			for (String key : keys) {
				reqEle.addAttribute(key, reqMap.get(key));
			}
		}
		if (recMap != null) {
			keys = recMap.keySet();
			for (String key : keys) {
				recEle.addAttribute(key, recMap.get(key));
			}
		}
		document.setXMLEncoding("UTF-8");
		String reqXML = document.asXML();
		return reqXML;
	}

	/**
	 * 验证返回报文是否成功。
	 * 
	 * @author cjp
	 * @param xml
	 * @return
	 * @throws Exception
	 * @since 205-5-14 下午3:01:53
	 */
	public boolean getXmlSt(String xml) throws Exception {
		boolean flag = false;
		if (!StringUtil.isEmpty(xml)) {
			try {
				Document dom = DocumentHelper.parseText(xml);
				Element elementRoot = dom.getRootElement();
				String st = elementRoot.attribute("st").getValue();// 获取是否成功标识。SUCCESS("1","成功"),EXCEPTION("0","未知异常"),INVALID_XML("1001001","报文格式错误"),INVALID_XML_DATA("1001002","报文数据有误"),DB_EXCEPTION("1002001","数据库调用异常"),TABLE_NOT_EXISTS("1002002","数据库表不存在");
				if (!StringUtil.isEmpty(st) && Constants.SUCCESS.equals(st))
					flag = true;
			} catch (DocumentException de) {
				throw de;

			} catch (Exception e) {
				throw e;
			}
		}
		return flag;
	}

	public static void main(String[] args) throws Exception {
		CreateXmlUtil test = new CreateXmlUtil();
		Map<String, String> recMap = new HashMap<String, String>();
		recMap.put("strnm", "123");
		recMap.put("trmnl", "456");
		recMap.put("st", "789");
		try {
			String reqXML = CreateXmlUtil.createPublicReqXML(null, recMap);
			System.out.println(reqXML);
		} catch (Exception e) {
			throw e;
		}

	}

}
