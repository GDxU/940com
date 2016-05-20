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

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.RegInfoDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.HttpUtil;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.MD5;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfoServlet() {
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
		String result = HttpUtil.post(initUserParams(userName, password));
		System.out.println(result);
		response.getOutputStream().write(result.getBytes("UTF-8"));
	}

	public static final String USERNAME = "username";
	public static final String REGISTER = "reg?";
	public final static String SERVLET_KEY = "servlet";

	private HashMap initLoginParams(String userName, String password) {
		String servlet = "/es/" + "login?";
		HashMap<String, String> params = new HashMap<String, String>();
		params.put(USERNAME, userName);
		params = initSignPassParams(servlet, MD5.md5_pass(password), params, 0);
		return params;
	}

	
	HashMap<String, String> initUserParams(String userName, String password) {
		String servlet = "/es/" + "login_userinfo?";
		HashMap<String, String> params = new HashMap<String, String>();
		params.put(USERNAME, userName);
		params = initSignPassParams(servlet,
				MD5.md5_pass(password), params, 0);
		return params;
	}
	
	

	public static final String INDEX = "http://app.sududa.com:1024";

	public static HashMap<String, String> initSignPassParams(String servlet,
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
		try {
			params = URLEncoder.encode(params, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		String signpass = MD5.md5(params);
		map.put("signpass", signpass);
		map.put(SERVLET_KEY, servlet);
		return map;
	}


}
