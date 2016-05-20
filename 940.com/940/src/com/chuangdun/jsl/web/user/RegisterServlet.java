package com.chuangdun.jsl.web.user;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.RegInfoDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.MD5;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {

		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String userName = SYS.RequestString(request, "user_name");
		String password = SYS.RequestString(request, "password");
		String result = postSign(initRegistParams(userName, password));
		response.getOutputStream().write(result.getBytes("UTF-8"));
	}

	public static final String USERNAME = "username";
	public static final String REGISTER = "reg?";
	public final static String SERVLET_KEY = "servlet";

	private HashMap initRegistParams(String userName, String password) {
		String servlet = "/es/" + REGISTER;
		HashMap<String, String> params = new HashMap<String, String>();
		params.put(USERNAME, userName);
		params.put("pass", MD5.md5_pass(password));
		params = initSignParams(servlet, params, 0);
		return params;
	}

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

	public String postSign(final HashMap map) {

		String jsonResult = "";

		try {
			jsonResult = connWithPost(map);
			System.out.println("postSign:" + jsonResult);

			JSONObject jsonObject = JSONObject.fromObject(jsonResult)
					.getJSONObject("sududa");
			System.out.println(jsonObject.getString("tips"));
			System.out.println(jsonObject.getString("status"));
			return jsonObject.toString();

		} catch (JSONException e) {
			e.printStackTrace();
			return "{\"status\":\"-1\",\"tips\":服务器维护30分钟}";
		}
	}

	public static final String INDEX = "http://app.sududa.com:1024";

	public static String connWithPost(HashMap<String, String> params) {
		String response = "";
		try {
			URL url;
			HttpURLConnection uRLConnection;
			url = new URL(INDEX + params.get(SERVLET_KEY));
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
					System.out.println(" key:" + entry.getKey() + " value:"
							+ entry.getValue());
					content += entry.getKey() + "=" + entry.getValue() + "&";
				}
			}
			content = content.substring(0, content.length() - 1);
			System.out.println(content);

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

}
