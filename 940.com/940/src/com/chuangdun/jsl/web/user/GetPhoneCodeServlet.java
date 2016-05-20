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
import java.text.MessageFormat;
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
@WebServlet("/GetPhoneCodeServlet")
public class GetPhoneCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPhoneCodeServlet() {

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
		String phone = SYS.RequestString(request, "phone");
		String result = HttpUtil.post(initParams(userName,
				MD5.md5_pass(password), phone));
		response.getOutputStream().write(result.getBytes("UTF-8"));
	}

	public static final String USERNAME = "username";
	public static final String REGISTER = "reg?";
	public final static String SERVLET_KEY = "servlet";

	private HashMap initParams(String userName, String password, String phone) {

		HashMap<String, String> params = new HashMap<String, String>();
		params.put(USERNAME, userName);
		String servlet = "/exe/" + "msg_code_send?";
		params.put("channel", "1");
		if (phone != null && !phone.isEmpty()) {
			params.put("to", phone);
			servlet = "/cd/" + "msg_code_send_first?";
			params = HttpUtil.initSignPassParams(servlet, password, params, 0,
					80);
		} else {
			params = HttpUtil.initSignParams(servlet, params, 0);
		}
		return params;
	}

}
