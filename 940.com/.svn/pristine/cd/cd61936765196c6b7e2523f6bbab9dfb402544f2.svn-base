package com.chuangdun.jsl.lab;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import net.sf.ezmorph.object.DateMorpher;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;
import net.sf.json.xml.XMLSerializer;

import org.apache.commons.lang.StringUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Json extends DefaultHandler {

	static final String TEXTKEY = "_text";
	JSONObject result;
	List<JSONObject> stack;

	public Json() {

	}

	public JSONObject getJson()
	{
		Object object = result.getJSONObject("sududa").get("list");
		if (object != null && !"".equals(object))
		{
			JSONObject obj = (JSONObject) object;
			String k = (String) obj.keys().next();
			Object l = obj.get(k);// 当记录1条时需把JSONObject转成JSONArray
			if (l instanceof JSONArray == false)
			{
				JSONObject jsonobj = obj.getJSONObject(k);
				JSONArray arr = new JSONArray();
				JSONObject jso = new JSONObject();
				for (Iterator<String> iter = jsonobj.keys(); iter.hasNext();)
				{
					String key = iter.next();
					jso.put(key, jsonobj.get(key));
				}
				arr.add(jso);
				obj.remove(k);
				obj.put(k, arr);
			}
		}
		return result;
	}

	public String attributeName(String name)
	{
		return "@" + name;
	}

	public void startDocument() throws SAXException
	{
		stack = new ArrayList<JSONObject>();
		stack.add(0, new JSONObject());
	}

	public void endDocument() throws SAXException
	{
		result = stack.remove(0);
	}

	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException
	{
		JSONObject work = new JSONObject();
		for (int ix = 0; ix < attributes.getLength(); ix++)
		{
			work.put(attributeName(attributes.getLocalName(ix)), attributes.getValue(ix));
		}
		stack.add(0, work);

	}

	public void endElement(String uri, String localName, String qName) throws SAXException
	{
		JSONObject pop = stack.remove(0); // examine stack
		Object stashable = pop;
		if (pop.containsKey(TEXTKEY))
		{
			String value = pop.getString(TEXTKEY).trim();
			if (pop.keySet().size() == 1)
				stashable = value; // single value
			else if (StringUtils.isBlank(value))
				pop.remove(TEXTKEY);
		}

		JSONObject parent = stack.get(0);
		if (!parent.containsKey(localName))
		{ // add new object
			parent.put(localName, stashable);
		}
		else
		{ // aggregate into arrays
			Object work = parent.get(localName);
			if (work instanceof JSONArray)
			{
				((JSONArray) work).add(stashable);
			}
			else
			{
				parent.put(localName, new JSONArray());
				parent.getJSONArray(localName).add(work);
				parent.getJSONArray(localName).add(stashable);
			}

		}

	}

	public void characters(char ch[], int start, int length) throws SAXException
	{
		JSONObject work = stack.get(0); // aggregate characters
		String value = (work.containsKey(TEXTKEY) ? work.getString(TEXTKEY) : "");
		work.put(TEXTKEY, value + new String(ch, start, length));
	}

	public static JSONObject xml2Json(InputStream stream) throws Exception
	{
		SAXParserFactory factory = SAXParserFactory.newInstance();
		factory.setNamespaceAware(true);
		SAXParser parser = factory.newSAXParser();
		Json handler = new Json();
		parser.parse(stream, handler);
		stream.close();
		return handler.getJson();
	}

	public static JSONObject xml2Json(String xml) throws Exception
	{
		InputStream stream = new ByteArrayInputStream(xml.getBytes("UTF-8"));
		SAXParserFactory factory = SAXParserFactory.newInstance();
		factory.setNamespaceAware(true);
		SAXParser parser = factory.newSAXParser();
		Json handler = new Json();
		parser.parse(stream, handler);
		stream.close();
		return handler.getJson();
	}

	public static String json2xml(String json)
	{
		JSONObject jobj = JSONObject.fromObject(json);

		String xml = new XMLSerializer().write(jobj);

		return xml;

	}
	
	public static JSONObject getObject(String jsonString)
	{
		JSONObject jsonObject = null;
		try
		{
			setDataFormat2JAVA();
			jsonObject = JSONObject.fromObject(jsonString);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	private static void setDataFormat2JAVA()
	{
		// 设定日期转换格式
		JSONUtils.getMorpherRegistry().registerMorpher(new DateMorpher(new String[] { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss" }));
	}
}
