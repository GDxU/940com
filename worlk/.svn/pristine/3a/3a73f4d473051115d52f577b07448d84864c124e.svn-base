package com.vinbet.mobile.util;

import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketTimeoutException;
import java.nio.charset.CodingErrorAction;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.NameValuePair;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.GzipDecompressingEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.MessageConstraints;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.HttpHostConnectException;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.vinbet.mobile.util.yjpay.RSA;

/**
 * <p>
 * <li>ConnectionRequestTimeout 从连接池中获取连接时间 单位毫秒</li>
 * <li>ConnectTimeout 创建连接时间 Sets the timeout until a connection is etablished.</li>
 * <li>SocketTimeout 传输时间 is the timeout to receive data (socket timeout).</li>
 * </p>
 */
public class HttpClientUtil {
	private static final Logger logger = LogManager.getLogger(HttpClientUtil.class);
	private static PoolingHttpClientConnectionManager connManager = null;
	private static CloseableHttpClient httpclient = null;
	public final static int connectTimeout = 30 * 1000;
	static {
		try {
			SSLContext sslContext = SSLContexts.custom().useTLS().build();
			sslContext.init(null, new TrustManager[] { new X509TrustManager() {
				public X509Certificate[] getAcceptedIssuers() {
					return null;
				}

				public void checkClientTrusted(X509Certificate[] certs, String authType) {
				}

				public void checkServerTrusted(X509Certificate[] certs, String authType) {
				}
			} }, null);
			Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory> create().register("http", PlainConnectionSocketFactory.INSTANCE)
					.register("https", new SSLConnectionSocketFactory(sslContext)).build();
			connManager = new PoolingHttpClientConnectionManager(socketFactoryRegistry);
			SocketConfig socketConfig = SocketConfig.custom().setTcpNoDelay(true).build();
			connManager.setDefaultSocketConfig(socketConfig);
			MessageConstraints messageConstraints = MessageConstraints.custom().setMaxHeaderCount(200).setMaxLineLength(2000).build();
			ConnectionConfig connectionConfig = ConnectionConfig.custom().setMalformedInputAction(CodingErrorAction.IGNORE).setUnmappableInputAction(CodingErrorAction.IGNORE).setCharset(Consts.UTF_8)
					.setMessageConstraints(messageConstraints).build();
			connManager.setDefaultConnectionConfig(connectionConfig);
			connManager.setMaxTotal(500);
			connManager.setDefaultMaxPerRoute(200);
			HttpClientBuilder builder = HttpClients.custom();
			builder.addInterceptorFirst(new HttpResponseInterceptor() {
				public void process(final HttpResponse response, final HttpContext context) throws HttpException, IOException {
					HttpEntity entity = response.getEntity();
					Header ceheader = entity.getContentEncoding();
					if (ceheader != null) {
						for (HeaderElement element : ceheader.getElements()) {
							if (element.getName().equalsIgnoreCase("gzip")) {
								response.setEntity(new GzipDecompressingEntity(response.getEntity()));
							}
						}
					}
				}
			});
			httpclient = builder.disableAutomaticRetries().setConnectionManager(connManager).build();
		} catch (KeyManagementException e) {
			logger.error("KeyManagementException", e);
		} catch (NoSuchAlgorithmException e) {
			logger.error("NoSuchAlgorithmException", e);
		}
	}

	/**
	 * 关闭连接管理器
	 */
	public static void closeHttpClient() {
		if (httpclient != null) {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		logger.info("Http连接管理器已关闭.");
	}

	/**
	 * 使用连接池管理器调用Get请求,返回JSONObject.
	 * <p>
	 * 默认打印请求返回的消息
	 * </p>
	 * 
	 * @param url
	 * @param params
	 * @return JSONObject
	 */
	public static JSONObject doGet(String url, Map<String, String> params) {
		return doGet(url, params, true);
	}

	/**
	 * 使用连接池管理器调用Get请求,返回JSONObject
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @param isLog
	 *            是否打印返回消息
	 * @return JSONObject
	 */
	public static JSONObject doGet(String url, Map<String, String> params, boolean isLog) {
		JSONObject jsonObject = null;
		String responseString = doGetString(url, params, isLog);
		if (responseString != null && responseString.length() > 0) {
			jsonObject = JSON.parseObject(responseString);
		}
		return jsonObject;
	}

	/**
	 * 使用连接池管理器调用Get请求,返回String.
	 * <p>
	 * 默认打印请求返回的消息
	 * </p>
	 * 
	 * @param url
	 * @param params
	 * @return JSONObject
	 */
	public static String doGetString(String url, Map<String, String> params) {
		return doGetString(url, params, true);
	}

	/**
	 * 使用连接池管理器调用Get请求,返回字符串
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @param isLog
	 *            是否打印返回请求参数和返回消息
	 * @return String
	 */
	public static String doGetString(String url, Map<String, String> params, boolean isLog) {
		HttpGet httpget = null;
		String responseString = null;
		StringBuilder sb = new StringBuilder();
		try {
			RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(connectTimeout).setConnectTimeout(connectTimeout).setConnectionRequestTimeout(connectTimeout).build();
			sb.append(url);
			if (null != params && params.size() != 0) {
				List<NameValuePair> nvps = new ArrayList<NameValuePair>();
				for (String key : params.keySet()) {
					nvps.add(new BasicNameValuePair(key, params.get(key)));
				}
				sb.append("?").append(EntityUtils.toString(new UrlEncodedFormEntity(nvps, Consts.UTF_8)));
			}
			if (isLog) {
				logger.info("[HttpUtils Get]begin invoke >> " + new String(sb.toString().getBytes(Consts.UTF_8), Consts.UTF_8));
			}
			httpget = new HttpGet(sb.toString());
			httpget.setConfig(requestConfig);
			// 添加头信息告诉服务端可以对Response进行GZip压缩
			httpget.addHeader("Accept-Encoding", "gzip,deflate");
			CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				HttpEntity entity = response.getEntity();
				try {
					if (entity != null) {
						responseString = EntityUtils.toString(entity, Consts.UTF_8);
					}
				} finally {
					if (entity != null) {
						entity.getContent().close();
					}
				}
			} catch (Exception e) {
				logger.error(String.format("[HttpUtils Get]get response error: \nurl:%s \nexception:%s", sb.toString(), e.fillInStackTrace()));
				return responseString;
			} finally {
				if (response != null) {
					response.close();
				}
			}
			if (isLog)
				logger.info(String.format("[HttpUtils Get]response string << %s", responseString));
		} catch (SocketTimeoutException e) {
			logger.error(String.format("[HttpUtils Get]invoke get timeout error: \nurl:%s \nexception:%s", sb.toString(), e.fillInStackTrace()), e);
			return responseString;
		} catch (Exception e) {
			logger.error(String.format("[HttpUtils Get]invoke get error: \nurl:%s \nexception:%s", sb.toString(), e.fillInStackTrace()));
		} finally {
			if (httpget != null) {
				httpget.releaseConnection();
			}
		}
		return responseString;
	}

	/**
	 * 使用连接池管理器调用Get请求,返回JSONObject
	 * 
	 * @param url
	 *            请求地址
	 * @param params
	 *            请求参数
	 * @return JSONObject
	 */
	public static JSONObject doPost(String url, Map<String, String> params) {
		JSONObject jsonObject = null;
		String responseString = doPostString(url, params);
		if (responseString != null && responseString.length() > 0) {
			jsonObject = JSON.parseObject(responseString);
		}
		return jsonObject;
	}

	/**
	 * 使用连接池管理器调用Post请求,返回字符串 </br> HTTPS协议使用该方法
	 * 
	 * @param reqURL
	 * @param params
	 * @return String
	 */
	public static String doPostString(String reqURL, Map<String, String> params) {
		int executionCount = 5;
		String responseContent = null;
		while (true) {
			HttpPost httpPost = new HttpPost(reqURL);
			try {
				executionCount--;
				RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(connectTimeout).setConnectTimeout(connectTimeout).setConnectionRequestTimeout(connectTimeout).build();
				if (null != params && params.size() != 0) {
					List<NameValuePair> formParams = new ArrayList<NameValuePair>();
					for (String key : params.keySet()) {
						formParams.add(new BasicNameValuePair(key, params.get(key)));
					}
					httpPost.setEntity(new UrlEncodedFormEntity(formParams, Consts.UTF_8));
				}
				httpPost.setConfig(requestConfig);
				httpPost.addHeader("Accept-Encoding", "gzip,deflate");
				logger.info("[HttpUtils Post]begin invoke >> " + new String(httpPost.getRequestLine().getUri().getBytes(Consts.UTF_8), Consts.UTF_8));
				CloseableHttpResponse response = httpclient.execute(httpPost);
				try {
					HttpEntity entity = response.getEntity();
					try {
						if (null != entity) {
							responseContent = EntityUtils.toString(entity, Consts.UTF_8);
						}
					} finally {
						if (entity != null) {
							entity.getContent().close();
						}
					}
				} finally {
					if (response != null) {
						response.close();
					}
				}
				logger.info(String.format("[HttpUtils Post]response string << %s", responseContent));
				return responseContent;
			} catch (Exception e) {
				logger.error(String.format("[HttpUtils Post]invoke post " + e.getClass().getSimpleName() + ", url:%s", httpPost.getRequestLine().getUri()), e);
				if (e instanceof NoHttpResponseException || e instanceof ClientProtocolException) {
					if (executionCount <= 0) {
						return null;
					}
				} else {
					return null;
				}
			} finally {
				if (httpPost != null) {
					httpPost.releaseConnection();
				}
			}
		}
	}

	public static String doGetRequest(String url) {
		// CloseableHttpClient httpclient = HttpClients.createDefault();
		String result = "";
		CloseableHttpResponse resp = null;
		try {
			HttpGet httpGet = new HttpGet(url);
			resp = httpclient.execute(httpGet);
			int status = resp.getStatusLine().getStatusCode();
			if (status >= 200 && status < 303) {
				HttpEntity entity = resp.getEntity();
				String content = EntityUtils.toString(entity, "utf-8");
				result = content == null ? "" : content;
			} else {
				StringBuilder sb = new StringBuilder("抓取页页出错  ").append(httpGet.getURI()).append(" STAUTS:").append(status);
				logger.info(sb.toString());
				result = "ERROR";
			}
		} catch (HttpHostConnectException e) {
			logger.error("执行doGetRequest:" + url + "时出错连接异常！");
			result = "ERROR";
		} catch (SocketTimeoutException e) {
			logger.error("执行doGetRequest:" + url + "时出错连接异常！");
			result = "ERROR";
		} catch (Exception e) {
			logger.error("执行doGetRequest:" + url + "时出错：\n", e);
			result = "ERROR";
		} finally {
			try {
				if (resp != null) {
					resp.close();
					// httpclient.close();
				}
			} catch (IOException e) {
				logger.error("关闭response时出错", e);
				result = "ERROR";
			}
		}
		return result;
	}

	public static String doPostRequest(String url, List<NameValuePair> nvps) {
		// CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpost = new HttpPost(url);
		httpost.setEntity(new UrlEncodedFormEntity(nvps, Consts.UTF_8));
		CloseableHttpResponse resp = null;
		try {
			resp = httpclient.execute(httpost);
			int status = resp.getStatusLine().getStatusCode();
			if (status >= 200 && status < 303) {
				HttpEntity entity = resp.getEntity();
				String content = EntityUtils.toString(entity, "utf-8");
				return content == null ? "" : content;
			} else {
				logger.info("抓取页页出错  " + httpost.getURI() + " STAUTS:" + status);
				return "ERROR";
			}
		} catch (ConnectException e) {
			logger.error("执行doGetRequest:" + url + "时出错连接异常！");
		} catch (Exception e) {
			logger.error("执行doGetRequest:" + url + "时出错：\n", e);
		} finally {
			try {
				if (resp != null) {
					resp.close();
					// httpclient.close();
				}
			} catch (IOException e) {
				logger.error("关闭response时出错", e);
			}
		}
		return "ERROR";
	}

	public static String doPostRequest(String url, List<NameValuePair> nvps, String encode) {
		// CloseableHttpClient httpclient = HttpClients.createDefault();
		HttpPost httpost = new HttpPost(url);
		CloseableHttpResponse resp = null;
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, encode));
			resp = httpclient.execute(httpost);
			int status = resp.getStatusLine().getStatusCode();
			if (status >= 200 && status < 303) {
				HttpEntity entity = resp.getEntity();
				String content = EntityUtils.toString(entity, "utf-8");
				return content == null ? "" : content;
			} else {
				logger.info("抓取页页出错  " + httpost.getURI() + " STAUTS:" + status);
				return "ERROR";
			}
		} catch (ConnectException e) {
			logger.error("执行doGetRequest:" + url + "时出错连接异常！");
		} catch (Exception e) {
			logger.error("执行doGetRequest:" + url + "时出错：\n", e);
		} finally {
			try {
				if (resp != null) {
					resp.close();
					// httpclient.close();
				}
			} catch (IOException e) {
				logger.error("关闭response时出错", e);
			}
		}
		return "ERROR";
	}

	public static void main(String[] args) throws Exception {
		
		
		final Map<String, String> parameters = new HashMap<String, String>();
		//parameters.put("data", "{rec:{'lv':'1','phnm':'2356546456456','lstnm':'fff','rfe':'','ust':'1','fstnm':'fff','mnt':'CNY','regip':'172.17.109.70','unm':'elfza19','eml':'sd65.gf','ntlty':'8','upwd':'6846860684F05029ABCCC09A53CD66F1','arcd':'+86','sex':'0','bthdy':'2002-05-05'},opt:'1'}");
		//parameters.put("data", "{rec:{'lv':'1','phnm':'2356546456456','lstnm':'刚刚','rfe':'','ust':'1','fstnm':'分','mnt':'CNY','regip':'172.17.109.70','unm':'elfza19','eml':'sd65@54.re','ntlty':'8','upwd':'6846860684F05029ABCCC09A53CD66F1','arcd':'%2B86','sex':'0','bthdy':'2002-05-05'},opt:'1'}");
		//String xml = "{rec:{'lgip':'172.17.109.70','unm':'elfza3','upwd':'6846860684F05029ABCCC09A53CD66F1'},opt:'1'}";
		String publicKey= RSAUtil.getPublicKey();
		System.out.println(publicKey);
		 //publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCM4hgAV3MK9M/PVNc1jK3b9BBcuAgS/RFnJlXt3dzTanVJVQLul49njW5y9y+YBuEY6f9NODAZRm0Sy1GTgqC6FdPV1juopaVVvMsFJ540hEPz94LEiO/8h9W2PWZFKLBuGKiqOXHEBFVe42rwiB6md78jzbjAErXYpBgvLHNiAwIDAQAB";
		// String  privateKey = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAIziGABXcwr0z89U1zWMrdv0EFy4CBL9EWcmVe3d3NNqdUlVAu6Xj2eNbnL3L5gG4Rjp/004MBlGbRLLUZOCoLoV09XWO6ilpVW8ywUnnjSEQ/P3gsSI7/yH1bY9ZkUosG4YqKo5ccQEVV7javCIHqZ3vyPNuMAStdikGC8sc2IDAgMBAAECgYA8JU5P3wW7WLbbcgIK14tmCvVtUBgKW0YxvlkTGxPqoll+PC/rQoMzl1re9A66nb090LBw/Br0v29Thb/G9Q6+oMNOGS3azCnz343THrK1ttAsAfEX+IZ/kUo3IfBjiXbBYS5qYmPjXF5K1exnLmbLeDXemArsbA4sOfi2MdtFOQJBAMYxtd6QMOVD2nS2DK9zdPc1ABGaP/Vz3eqbmGAIzr7h/sQ3GCwt/C2xzxZZr5+5zI+dBIe2k1pUSQ6kAxKrCs8CQQC1+TjqEIkpya/4XPkDe2+T4pi1/9m3varV5wGCIOMV+66CXjIEpKtVr5nTwO+0sGknnGabATEAo+AeSdXCPjKNAkASXytHrUALEIYgiXuVi/NMswoFl7HUE+B/TdsLE+XuRc6y65R/C+gzaCcVIE0qVjPDID/6QI9aMTPwen2abmZ7AkEApH9NBrG5/E94xi/tXkt3+pxM5cEJo8JNqx0uzN5DyXyBLRJPbskYpNWfXb88MP+Dny4PxrEWBfkdwOOH2xZ0hQJBALz1D6UxirPkHinhzGtfUJaEZeKEueQUEzUEU5BHBRqU67XK1YSGZOR3DEpkfNixAhU5qRyfzI1LQI0Ov/oqxV8=";
		String xml = "{rec:{key3:764212973,key2:603518573,key1:620935244}}";
		
//		xml=XmlConverUtil.xmltoJson(xml);
//		System.out.println(xml);
		parameters.put("data", xml);
		

		final String url = "http://app.kutuba.cn/download/android/vinbet.apk";
		//System.out.println(HttpClientUtil.doPostString(url, parameters));
		//System.out.println(HttpClientUtil.doPostString(url, parameters));
		String str = HttpClientUtil.doPostString(url, parameters);
		JSONObject jsonObject = JSON.parseObject(str);
		JSONObject js = jsonObject.getJSONObject("rec");
		String aesdata = js.getString("key");
		System.out.println(aesdata);
		String decodedData = RSA.decrypt(aesdata, RSAUtil.getPrivateKey());
		System.out.println(decodedData);
//		Map<String, String> map = JSON.parseObject(str, new TypeReference<Map<String, String>>() {
//		});
//		System.out.println(map);
		// ExecutorService executor = Executors.newFixedThreadPool(1);
		// long y = System.currentTimeMillis();
		// final CountDownLatch countDownLatch = new CountDownLatch(100);
		// for (int i = 0; i < 100; i++) {
		// executor.execute(new Runnable() {
		// public void run() {
		// try {
		// String responseBody = HttpClientUtil.doGetString(url, parameters);
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// countDownLatch.countDown();
		// }
		// });
		// }
		// try {
		// countDownLatch.await();
		// } catch (InterruptedException e) {
		// }
		// System.out.println(System.currentTimeMillis() - y);
	}
}
