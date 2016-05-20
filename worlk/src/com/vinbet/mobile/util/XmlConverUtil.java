package com.vinbet.mobile.util;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;

/**
 * common xml conver utility
 * 
 * @author viruscodecn@gmail.com
 * @version Framework 2010.10.26
 * @url http://blog.csdn.net/arjick/article/details/6251777
 */
public class XmlConverUtil {
	/**
	 * map to xml xml <node><key label="key1">value1</key><key
	 * label="key2">value2</key>......</node>
	 * 
	 * @param map
	 * @return
	 */
	public static String maptoXml(Map map) {
		Document document = DocumentHelper.createDocument();
		Element nodeElement = document.addElement("node");
		for (Object obj : map.keySet()) {
			Element keyElement = nodeElement.addElement("key");
			keyElement.addAttribute("label", String.valueOf(obj));
			keyElement.setText(String.valueOf(map.get(obj)));
		}
		return doc2String(document);
	}

	/**
	 * list to xml xml <nodes><node><key label="key1">value1</key><key
	 * label="key2">value2</key>......</node><node><key
	 * label="key1">value1</key><key
	 * label="key2">value2</key>......</node></nodes>
	 * 
	 * @param list
	 * @return
	 */
	public static String listtoXml(List list) throws Exception {
		Document document = DocumentHelper.createDocument();
		Element nodesElement = document.addElement("nodes");
		int i = 0;
		for (Object o : list) {
			Element nodeElement = nodesElement.addElement("node");
			if (o instanceof Map) {
				for (Object obj : ((Map) o).keySet()) {
					Element keyElement = nodeElement.addElement("key");
					keyElement.addAttribute("label", String.valueOf(obj));
					keyElement.setText(String.valueOf(((Map) o).get(obj)));
				}
			} else {
				Element keyElement = nodeElement.addElement("key");
				keyElement.addAttribute("label", String.valueOf(i));
				keyElement.setText(String.valueOf(o));
			}
			i++;
		}
		return doc2String(document);
	}

	/**
	 * json to xml {"node":{"key":{"@label":"key1","#text":"value1"}}} conver
	 * <o><node class="object"><key class="object"
	 * label="key1">value1</key></node></o>
	 * 
	 * @param json
	 * @return
	 */
	public static String jsontoXml(String json) {
		try {
			XMLSerializer serializer = new XMLSerializer();
			JSON jsonObject = JSONSerializer.toJSON(json);
			return serializer.write(jsonObject);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * xml to map xml <node><key label="key1">value1</key><key
	 * label="key2">value2</key>......</node>
	 * 
	 * @param xml
	 * @return
	 */
	public static Map xmltoMap(String xml) {
		try {
			Map map = new HashMap();
			Document document = DocumentHelper.parseText(xml);
			Element nodeElement = document.getRootElement();
			List node = nodeElement.elements();
			for (Iterator it = node.iterator(); it.hasNext();) {
				Element elm = (Element) it.next();
				map.put(elm.attributeValue("label"), elm.getText());
				elm = null;
			}
			node = null;
			nodeElement = null;
			document = null;
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * xml to list xml <nodes><node><key label="key1">value1</key><key
	 * label="key2">value2</key>......</node><node><key
	 * label="key1">value1</key><key
	 * label="key2">value2</key>......</node></nodes>
	 * 
	 * @param xml
	 * @return
	 */
	public static List xmltoList(String xml) {
		try {
			List<Map> list = new ArrayList<Map>();
			Document document = DocumentHelper.parseText(xml);
			Element nodesElement = document.getRootElement();
			List nodes = nodesElement.elements();
			for (Iterator its = nodes.iterator(); its.hasNext();) {
				Element nodeElement = (Element) its.next();
				Map map = xmltoMap(nodeElement.asXML());
				list.add(map);
				map = null;
			}
			nodes = null;
			nodesElement = null;
			document = null;
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * xml to json <node><key label="key1">value1</key></node> ת��Ϊ
	 * {"key":{"@label":"key1","#text":"value1"}}
	 * 
	 * @param xml
	 * @return
	 */
	public static String xmltoJson(String xml) {
		XMLSerializer xmlSerializer = new XMLSerializer();
		return xmlSerializer.read(xml).toString().replaceAll("@", "");
	}

	/**
	 * 
	 * @param document
	 * @return
	 */
	public static String doc2String(Document document) {
		String s = "";
		try {
			// ʹ�������������ת��
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			// ʹ��UTF-8����
			OutputFormat format = new OutputFormat("   ", true, "UTF-8");
			XMLWriter writer = new XMLWriter(out, format);
			writer.write(document);
			s = out.toString("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return s;
	}
	
	public static void main(String[] args) {
		String sr = XmlConverUtil.xmltoJson("<?xml version='1.0' encoding='UTF-8'?><resp st='1' msg='成功'><rec subnm='sdfsd' crttm='2015-10-02 10:33:02' index='1' crdid='1353' bnkid='3' bnknm='中国建设银行' cty='390' pro='348' crdnm='345345345435345' st='1' accsp='7'/><rec subnm='sdf' crttm='2015-10-02 10:33:10' index='2' crdid='1354' bnkid='4' bnknm='招商银行' cty='390' pro='348' crdnm='234464365345435' st='1' accsp='7'/><rec subnm='sdfsdf' crttm='2015-10-02 10:33:18' index='3' crdid='1355' bnkid='4' bnknm='招商银行' cty='380' pro='347' crdnm='3426345345345345' st='1' accsp='7'/></resp>").replaceAll("@", "");
		System.out.println(sr);
		JSONObject jsonObject = com.alibaba.fastjson.JSON.parseObject(sr);
		System.out.println(jsonObject.toJSONString());
		Map<String, String> map = com.alibaba.fastjson.JSON.parseObject(sr, new TypeReference<Map<String, String>>(){});
		//Map<String, String> recmap = com.alibaba.fastjson.JSON.parseObject(map.get("rec"), new TypeReference<Map<String, String>>(){});\
		System.out.println(map.get("rec"));
		//List<String> ls = com.alibaba.fastjson.JSON.parseArray(map.get("rec"),ArrayList<String>);
		List<Object> ls = com.alibaba.fastjson.JSON.parseArray(map.get("rec"));
		System.out.println(ls.get(0).toString());
		Map<String, String> recmap = com.alibaba.fastjson.JSON.parseObject(ls.get(0).toString(), new TypeReference<Map<String, String>>(){});
		System.out.println(recmap);
		System.out.println("msg==>"+map.get("msg"));
		String st = XmlConverUtil.xmltoJson("<?xml version='1.0' encoding='UTF-8'?><req opt='1'><rec mnt='CNY' ntlty='8' unm='elfza19' upwd='6846860684F05029ABCCC09A53CD66F1' lstnm='刚刚' fstnm='分' lv='1' rfe='' regip='172.17.109.70' ust='1' bthdy='2002-05-05' sex='0' arcd='+86' phnm='2356546456456' eml='sd@65.gf'/></req>");
		System.out.println(st);
		Map<String, String> stmap = com.alibaba.fastjson.JSON.parseObject(st, new TypeReference<Map<String, String>>(){});
		System.out.println(stmap);
		HashMap<String, String> sreq = new HashMap<String, String>();
		HashMap<String, Object> srec = new HashMap<String, Object>();
		for (String key:stmap.keySet()) {
			if(key.equals("rec")){
				Map<String, String> tmpMap = com.alibaba.fastjson.JSON.parseObject(stmap.get(key), new TypeReference<Map<String, String>>(){});		
				for (String tmpKey : tmpMap.keySet()) {
					srec.put(tmpKey,tmpMap.get(tmpKey));
				}
			}else{
				sreq.put(key, stmap.get(key));
			}
		}
		System.out.println("sreq==>"+sreq);
		System.out.println("srec==>"+srec);
		ApiJsonResult apiJsonResult = ApiJsonResult.createSuccess();
		apiJsonResult.setRec(srec);
		System.out.println(com.alibaba.fastjson.JSON.toJSONString(apiJsonResult));
		System.out.println(XmlConverUtil.xmltoJson("<req t='1'><rec arcd='+86' uid='5000000479' phnm='324546534534' utyp='1'/></req>"));
		
		
	}
}
