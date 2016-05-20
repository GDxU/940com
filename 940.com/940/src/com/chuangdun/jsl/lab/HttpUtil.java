package com.chuangdun.jsl.lab;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

public class HttpUtil {

	public static final String INDEX = "http://app.sududa.com:1024";
	private static final String SERVLET_KEY = "servlet";

	
	
	public static HashMap<String, String> initSignParams(String servlet,
			HashMap<String, String> map, int timeDifference) {
		
		int timeStamp = (int) (System.currentTimeMillis() / 1000);
		timeStamp = timeStamp + timeDifference;
		map.put("ver", "3");
		map.put("timestamp", "" + timeStamp);
		map.put("format", "json");
		map.put("client", 80 + "");
		Collection<String> keyset = map.keySet();
		List<String> list = new ArrayList<String>(keyset);
		Collections.sort(list);
		String params = servlet;
		for (int i = 0; i < list.size(); i++) {
			if (i == list.size() - 1)
				params += list.get(i) + "=" + map.get(list.get(i));
			else
				params += list.get(i) + "=" + map.get(list.get(i)) + "&";
		}
		try {
			params = URLEncoder.encode(params, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sign = MD5.md5(params);
		map.put("sign", sign);
		map.put(SERVLET_KEY, servlet);
		return map;
	}
	
	public static HashMap<String, String> initSignParams1(String servlet,
			HashMap<String, String> map, int timeDifference) {
		
		int timeStamp = (int) (System.currentTimeMillis() / 1000);
		timeStamp = timeStamp + timeDifference;
		map.put("ver", "3");
		map.put("timestamp", "" + timeStamp);
		map.put("format", "json");
		map.put("client", 80 + "");
		Collection<String> keyset = map.keySet();
		List<String> list = new ArrayList<String>(keyset);
		Collections.sort(list);
		String params = servlet;
		for (int i = 0; i < list.size(); i++) {
			if (i == list.size() - 1)
				params += list.get(i) + "=" + map.get(list.get(i));
			else
				params += list.get(i) + "=" + map.get(list.get(i)) + "&";
		}
		try {
			params = URLEncoder.encode(params, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String sign = MD5.md5(params);
		map.put("sign", sign);
		return map;
	}

	
	
	public static HashMap<String, String> initSignPassParams(String servlet,
			String password, HashMap<String, String> map, int timeDifference,int client) {
		int timeStamp = (int) (System.currentTimeMillis() / 1000);
		timeStamp = timeStamp + timeDifference;
		map.put("timestamp", "" + timeStamp);
		map.put("format", "json");
		if(client!=80)
			client =49;
			
		map.put("client", client + "");
		
		map.put("ver", "4");
		
		Collection<String> keyset = map.keySet();
		List<String> list = new ArrayList<String>(keyset);
		Collections.sort(list);
		String params = servlet;
		
		for (int i = 0; i < list.size(); i++) {
			params += list.get(i) + "=" + map.get(list.get(i)) + "&";
		}
		
		params += password;
		System.out.println(params);
		try {
			params = URLEncoder.encode(params, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		System.out.println(params);
		String signpass = MD5.md5(params);
		map.put("signpass", signpass);
		map.put(SERVLET_KEY, servlet);
		return map;
	}
	
	

	public static HashMap<String, String> initSignPassParams1(String servlet,
			String password, HashMap<String, String> map, int timeDifference) {
		int timeStamp = (int) (System.currentTimeMillis() / 1000);
		timeStamp = timeStamp + timeDifference;
		map.put("timestamp", "" + timeStamp);
		map.put("format", "json");
		map.put("client", 80 + "");
		map.put("ver", "4");
		
		Collection<String> keyset = map.keySet();
		List<String> list = new ArrayList<String>(keyset);
		Collections.sort(list);
		String params = servlet;
		
		for (int i = 0; i < list.size(); i++) {
			params += list.get(i) + "=" + map.get(list.get(i)) + "&";
		}
		
		params += password;
		System.out.println(params);
		try {
			params = URLEncoder.encode(params, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		System.out.println(params);
		String signpass = MD5.md5(params);
		map.put("signpass", signpass);
		return map;
	}
	
	
	public static String post(final HashMap map) {

		String jsonResult = "";

		try {
			jsonResult = connWithPost(map);
			System.out.println("postSign:" + jsonResult);

			JSONObject jsonObject = JSONObject.fromObject(jsonResult)
					.getJSONObject("sududa");
			return jsonObject.toString();

		} catch (JSONException e) {
			e.printStackTrace();
			return "{\"status\":\"-1\",\"tips\":服务器维护30分钟}";
		}
	}
	
	public static String connWithPost(HashMap<String, String> params) {
		String response = "";
		try {
			URL url;
			HttpURLConnection uRLConnection;
			url = new URL(INDEX + params.get(SERVLET_KEY));
			String urlStr = INDEX + params.get(SERVLET_KEY);
			params.remove(SERVLET_KEY);
			uRLConnection = (HttpURLConnection) url.openConnection();
			uRLConnection.setDoInput(true);
			uRLConnection.setDoOutput(true);
			uRLConnection.setConnectTimeout(18000);
			uRLConnection.setRequestMethod("POST");
			uRLConnection.setUseCaches(false);
			uRLConnection.setInstanceFollowRedirects(true);
			uRLConnection.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			uRLConnection.connect();
			DataOutputStream out = new DataOutputStream(
					uRLConnection.getOutputStream());
			String content = "";
			if (params != null && !params.isEmpty()) {
				for (Map.Entry<String, String> entry : params.entrySet()) {
					content += entry.getKey() + "=" + entry.getValue() + "&";
				}
			}
			content = content.substring(0, content.length() - 1);
			System.out.println(urlStr +content);

			out.write(content.getBytes());
			String redirect = uRLConnection.getHeaderField("Location");
			out.flush();
			out.close();

			InputStream is = uRLConnection.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is,
					"UTF-8"));
			String readLine = null;
			while ((readLine = br.readLine()) != null) {
				response = response + readLine;
			}

			is.close();
			br.close();
			uRLConnection.disconnect();

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return response;
	}

	
	/**
	 * <p>发送POST请求
	 * 
	 * @param  url          POST请求地址
	 * @param  parameterMap POST请求参数容器
	 * @param  paramCharset 参数字符集名称
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 * @modify 窦海宁, 2012-05-21
	 */
	public static byte[] doPost(String url , Map parameterMap , String paramCharset) {

		return HttpUtil.doPost(url , null , parameterMap , paramCharset , null , 0);
	}

	/**
	 * <p>发送POST请求
	 * 
	 * @param  url          POST请求地址
	 * @param  headerMap    POST请求头参数容器
	 * @param  parameterMap POST请求参数容器
	 * @param  paramCharset 参数字符集名称
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 * @modify 窦海宁, 2012-05-21
	 */
	public static byte[] doPost(String url , Map headerMap , Map parameterMap , String paramCharset) {

		return HttpUtil.doPost(url , headerMap , parameterMap , paramCharset , null , 0);
	}

	/**
	 * <p>发送POST请求
	 * 
	 * @param  url          POST请求地址
	 * @param  parameterMap POST请求参数容器
	 * @param  paramCharset 参数字符集名称
	 * @param  proxyUrl     代理服务器地址
	 * @param  proxyPort    代理服务器端口号
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 */
	public static byte[] doPost(String url , Map parameterMap , String paramCharset , String proxyUrl , int proxyPort) {

		return HttpUtil.doPost(url , null , parameterMap , paramCharset , proxyUrl , proxyPort);
	}

	/**
	 * <p>发送POST请求
	 * 
	 * @param  url          POST请求地址
	 * @param  headerMap    POST请求头参数容器
	 * @param  parameterMap POST请求参数容器
	 * @param  paramCharset 参数字符集名称
	 * @param  proxyUrl     代理服务器地址
	 * @param  proxyPort    代理服务器端口号
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 * @modify 窦海宁, 2012-05-21
	 */
	public static byte[] doPost(String url , Map headerMap , Map parameterMap , String paramCharset , String proxyUrl , int proxyPort) {

		byte[]     content    = null;
		HttpClient httpClient = new HttpClient();
		PostMethod postMethod = new PostMethod(url);

		if (StringUtils.isNotBlank(paramCharset)) {
			postMethod.getParams().setContentCharset(paramCharset);
			postMethod.getParams().setHttpElementCharset(paramCharset);
		}

		if (headerMap != null) {
			//头部请求信息
			if (headerMap != null) {

				Iterator iterator = headerMap.entrySet().iterator();
				while (iterator.hasNext()) {

					Entry entry = (Entry) iterator.next();
					postMethod.addRequestHeader(entry.getKey().toString() , entry.getValue().toString());
				}
			}
		}

		Iterator iterator = parameterMap.keySet().iterator();
		while (iterator.hasNext()) {

			String key = (String) iterator.next();
			postMethod.addParameter(key , (String) parameterMap.get(key));
		}

		if (StringUtils.isNotBlank(proxyUrl)) {

			httpClient.getHostConfiguration().setProxy(proxyUrl , proxyPort);
		}

		//设置成了默认的恢复策略，在发生异常时候将自动重试3次，在这里你也可以设置成自定义的恢复策略
		postMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT , 10000);
		//postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER , new DefaultHttpMethodRetryHandler());
		InputStream inputStream = null;
		try {

			if (httpClient.executeMethod(postMethod) == HttpStatus.SC_OK) {

				//读取内容
				inputStream = postMethod.getResponseBodyAsStream();
				content     = IOUtils.toByteArray(inputStream);
			} else {

				System.err.println("Method failed: " + postMethod.getStatusLine());
			}
		} catch (IOException ex) {

			ex.printStackTrace();
		} finally {

			IOUtils.closeQuietly(inputStream);
			postMethod.releaseConnection();
		}
		return content;
	}
	
	
	/**
	 * <p>发送GET请求
	 * 
	 * @param  url GET请求地址
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 */
	public static byte[] doGet(String url) {

		return HttpUtil.doGet(url , null , null , 0);
	}

	/**
	 * <p>发送GET请求
	 * 
	 * @param  url       GET请求地址
	 * @param  headerMap GET请求头参数容器
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 */
	public static byte[] doGet(String url , Map headerMap) {

		return HttpUtil.doGet(url , headerMap , null , 0);
	}

	/**
	 * <p>发送GET请求
	 * 
	 * @param  url       GET请求地址
	 * @param  proxyUrl  代理服务器地址
	 * @param  proxyPort 代理服务器端口号
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 * @modify 窦海宁, 2012-03-19
	 */
	public static byte[] doGet(String url , String proxyUrl , int proxyPort) {

		return HttpUtil.doGet(url , null , proxyUrl , proxyPort);
	}

	/**
	 * <p>发送GET请求
	 * 
	 * @param  url       GET请求地址
	 * @param  headerMap GET请求头参数容器
	 * @param  proxyUrl  代理服务器地址
	 * @param  proxyPort 代理服务器端口号
	 * 
	 * @return 与当前请求对应的响应内容字节数组
	 * 
	 * @modify 窦海宁, 2012-03-19
	 */
	public static byte[] doGet(String url , Map headerMap , String proxyUrl , int proxyPort) {

		byte[]     content    = null;
		HttpClient httpClient = new HttpClient();
		GetMethod  getMethod  = new GetMethod(url);

		if (headerMap != null) {

			//头部请求信息
			if (headerMap != null) {

				Iterator iterator = headerMap.entrySet().iterator();
				while (iterator.hasNext()) {

					Entry entry = (Entry) iterator.next();
					getMethod.addRequestHeader(entry.getKey().toString() , entry.getValue().toString());
				}
			}
		}

		if (StringUtils.isNotBlank(proxyUrl)) {

			httpClient.getHostConfiguration().setProxy(proxyUrl , proxyPort);
		}

		//设置成了默认的恢复策略，在发生异常时候将自动重试3次，在这里你也可以设置成自定义的恢复策略
		getMethod.getParams().setParameter(HttpMethodParams.SO_TIMEOUT , 10000);
		//postMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER , new DefaultHttpMethodRetryHandler());
		InputStream inputStream = null;
		try {

			if (httpClient.executeMethod(getMethod) == HttpStatus.SC_OK) {

				//读取内容
				inputStream = getMethod.getResponseBodyAsStream();
				content     = IOUtils.toByteArray(inputStream);
			} else {

				System.err.println("Method failed: " + getMethod.getStatusLine());
			}
		} catch (IOException ex) {

			ex.printStackTrace();
		} finally {

			IOUtils.closeQuietly(inputStream);
			getMethod.releaseConnection();
		}
		return content;
	}
	
}
