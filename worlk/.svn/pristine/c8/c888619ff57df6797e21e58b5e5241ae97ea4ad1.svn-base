package com.vinbet.mobile.util.wechatpay;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.net.ssl.HttpsURLConnection;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.util.MD5Util;

public class CommonUtil {
	private static Log log = Logs.getLog(CommonUtil.class);
	private static final int TIME_OUT = 10 * 1000;// 超时时间

	public static StringBuffer httpsRequest(String requestUrl, String requestMethod, String output) {
		HttpsURLConnection connection = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		StringBuffer buffer = null;
		try {
			URL url = new URL(requestUrl);
			connection = (HttpsURLConnection) url.openConnection();
			// connection.setConnectTimeout(TIME_OUT);
			// connection.setReadTimeout(TIME_OUT);
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setRequestMethod(requestMethod);
			if (null != output) {
				OutputStream outputStream = connection.getOutputStream();
				outputStream.write(output.getBytes("UTF-8"));
				outputStream.close();
			}
			int statusCode = connection.getResponseCode();
			if (statusCode >= 200 && statusCode < 303) {
				// 从输入流读取返回内容
				inputStream = connection.getInputStream();
				inputStreamReader = new InputStreamReader(inputStream, "utf-8");
				bufferedReader = new BufferedReader(inputStreamReader);
				String str = null;
				buffer = new StringBuffer();
				while ((str = bufferedReader.readLine()) != null) {
					buffer.append(str);
				}
			} else {
				log.error("httpsRequest failed, url:" + requestUrl + ", status code:" + statusCode);
			}

		} catch (Exception e) {
			log.error("httpsRequest error, url:" + requestUrl, e);
		} finally {
				if (bufferedReader != null) {
					try {
						bufferedReader.close();
					} catch (IOException e) {
					}
				}
				if (inputStreamReader != null) {
					try {
						inputStreamReader.close();
					} catch (IOException e) {
					}
				}
				if (inputStream != null) {
					try {
						inputStream.close();
						inputStream = null;
					} catch (IOException e) {
					}
				}
				if (connection != null) {
					connection.disconnect();
				}
		}
		return buffer;
	}

	public static String mapToXml(Map<String, String> map) {
		Document doc = DocumentHelper.createDocument();
		Element reqElement = doc.addElement("xml");
		for (String key : map.keySet()) {
			String str = map.get(key);
			Element ele = reqElement.addElement(key);
			ele.addCDATA(str);
		}
		return doc.asXML();
	}

	public static Map<String, String> xmlToMap(String xml) {
		Map<String, String> map = new HashMap<String, String>();
		if (xml != null && !xml.equals("")) {
			try {
				Document doc = DocumentHelper.parseText(xml);
				Element root = doc.getRootElement();
				for (Iterator it = root.elementIterator(); it.hasNext();) {
					Element element = (Element) it.next();
					map.put(element.getName(), element.getText());
				}
			} catch (DocumentException e) {
				e.printStackTrace();
			}

		}
		return map;
	}

	/**
	 * 生成微信支付签名
	 * stringSignTemp="stringA&key=192006250b4c09247ec02edce69f6a2d";
	 */
	public static String createSign(TreeMap<String, String> map) {
		StringBuffer sbuffer = new StringBuffer();
		String key = (String) map.get("key");
		map.remove("key");
		
		for (Map.Entry<String, String> entry : map.entrySet()) {
			sbuffer.append(entry.getKey());
			sbuffer.append("=");
			sbuffer.append(entry.getValue());
			sbuffer.append("&");
		}
		sbuffer.append("key="+key);
		String signTemp = sbuffer.toString();
		String sign = MD5Util.md5(signTemp);
		return sign;
	}
	
    /**
     * 创建指定数量的随机字符串
     * @param numberFlag 是否是数字
     * @param length
     * @return
     */
    public static String createRandom(boolean numberFlag, int length){
     String retStr = "";
     String strTable = numberFlag ? "1234567890" : "1234567890abcdefghijkmnpqrstuvwxyz";
     int len = strTable.length();
     boolean bDone = true;
     do {
      retStr = "";
      int count = 0;
      for (int i = 0; i < length; i++) {
       double dblR = Math.random() * len;
       int intR = (int) Math.floor(dblR);
       char c = strTable.charAt(intR);
       if (('0' <= c) && (c <= '9')) {
        count++;
       }
       retStr += strTable.charAt(intR);
      }
      if (count >= 2) {
       bDone = false;
      }
     } while (bDone);

     return retStr;
    }

	public static void main(String[] args) {
		
		
		TreeMap<String,String> tm = new TreeMap<String, String>();
		tm.put("mch_id", "1317609301");
		tm.put("appid", "wx6daa3ab666aa34f2");
		tm.put("device_info", "WEB");
		tm.put("nonce_str", "5K8264ILTKCH16CQ2502I8ZNMTM67VS5");
		tm.put("body", "测试商品描述");
		tm.put("out_trade_no", "50001562551");
		tm.put("total_fee", "1");
		tm.put("spbill_create_ip", "174.54.56.54");
		tm.put("notify_url", "http://www.weixin.qq.com/wxpay/pay.php");
		tm.put("trade_type", "NATIVE");
		tm.put("product_id", "50001562551");
		tm.put("key", "18DCFCD9386EB39B05ADA59D3C17A544");
		String sign = CommonUtil.createSign(tm);
		tm.put("sign", sign);
		String str = CommonUtil.httpsRequest("https://api.mch.weixin.qq.com/pay/unifiedorder", "POST", CommonUtil.mapToXml(tm)).toString();
		System.out.println(str);
		System.out.println(CommonUtil.xmlToMap(str));
	}

}
