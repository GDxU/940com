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
@WebServlet("/SaveUserInfoServlet")
public class SaveUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveUserInfoServlet() {

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
		String realname = SYS.RequestString(request, "realname");
		String qq = SYS.RequestString(request, "qq");
		String yy = SYS.RequestString(request, "yy");
		String gender = SYS.RequestString(request, "gender");
		String image = SYS.RequestString(request, "profile");
		String address = SYS.RequestString(request, "address");
		System.out.println(address+"dddd");
		String password = SYS.RequestString(request, "password");
		System.out.println(password);
		
		System.out.println("profile"+image + "yy" + yy);
//		String result = HttpUtil.post(initParams(userName, realname, qq, yy,
//				gender, image, address,MD5.md5_pass(password)));
		
		byte[] result = HttpUtil.doPost(HttpUtil.INDEX+"/px/" + "user_edit?", initParams(userName, realname, qq, yy,
				gender, image, address,MD5.md5_pass(password)), "UTF-8");
		System.out.println(new String(result,"UTF-8"));
		response.getOutputStream().write(result);
	}

	private HashMap initParams(String userName, String realname, String qq,
			String yy, String gender, String image, String address,String password) {
		
		String servlet = "/px/" + "user_edit?";
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("username", userName);
		params.put("realname", realname);
		params.put("qq", qq);
		params.put("yy", yy);
		params.put("sex", gender);

		params.put("image", image);
		params.put("address", address);
		params = HttpUtil.initSignPassParams1(servlet,password, params, 0);
		return params;
	}

	public final static String SERVLET_KEY = "servlet";

}
