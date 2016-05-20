package com.chuangdun.jsl.web.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chuangdun.jsl.lab.LAB;

/**
 * Servlet implementation class ManagerLoginServlet
 */
@WebServlet("/ManagerLoginServlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
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
		String userName = request.getParameter("user_name");
		String password = request.getParameter("password");
		System.out.println("ddddddddd"+userName + password);
		if (userName.equals("940") && password.equals("my007")) {
			setReffer(response, userName, password);
			response.sendRedirect("manager_index/manager_index.jsp");
		} else {
			response.setContentType("text/html");  
	        PrintWriter out = response.getWriter();  
	        out.println("<html>");  
	        
	        out.print("用户名或密码错误，请重新登录。<a href='manager_index/login.jsp'>确定</a>");
		}
		
	}

	/**
	 * 设置SSO认证标识(把用户名,密码 写入客户端浏览器的cookie),关闭浏览器后，cookie立即失效
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param userName
	 *            用户名
	 * @param password
	 *            密码
	 */
	public static void setReffer(final HttpServletResponse response,
			final String userName, final String password) {
		final String sSession =userName +"!vab"+ password ; // 密码是SHA1加密,长度为40个字符(160位)
		Cookie oItem;
		oItem = new Cookie("SSO", LAB.getBASE64(sSession.getBytes()));
		// oItem.setDomain(.google.com); //请用自己的域
		oItem.setMaxAge(-1); // 关闭浏览器后，cookie立即失效
		oItem.setPath("/");
		response.addCookie(oItem);
		
		oItem = new Cookie("TAG","940");
		// oItem.setDomain(.google.com); //请用自己的域
		oItem.setMaxAge(-1); // 关闭浏览器后，cookie立即失效
		oItem.setPath("/");
		response.addCookie(oItem);
	}

}
