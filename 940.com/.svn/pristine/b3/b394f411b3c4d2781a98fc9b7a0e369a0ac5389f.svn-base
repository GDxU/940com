package com.chuangdun.jsl.web.reginfo;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.RegInfoDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.DateUtil;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/RegInfoEditSubmitServlet")
public class RegInfoEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegInfoEditSubmitServlet() {

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
		String from= SYS.RequestString(request, "from");
		Enumeration enu=request.getParameterNames();  
		
		while(enu.hasMoreElements()){  
			String paraName=(String)enu.nextElement();  
			System.out.println(paraName+": "+request.getParameter(paraName));  
		} 
		int id = SYS.RequestInt(request, "id", 0);
		String doStr = SYS.RequestString(request, "do");
		
		if (doStr.equals("add") || doStr.equals("edit")||from==null||from.isEmpty()) {
			String userName = SYS.RequestString(request, "user_name");
			String phoneNum = SYS.RequestString(request, "phone_number");
			String qq = SYS.RequestString(request, "qq");
			RegInfo regInfo = new RegInfo();
			regInfo.setUserName(userName);
			regInfo.setId(id);
			regInfo.setPhoneNum(phoneNum);
			regInfo.setQq(qq);
			regInfo.setTime(DateUtil.getDateTime());

			RegInfoDao regInfoManagerDao = new RegInfoDao();
			JSONObject result = new JSONObject();
			int isSuccess = regInfoManagerDao.insertOrUpdateRegInfo(regInfo,
					doStr);
			result.element("status", isSuccess);
			result.element("tips", isSuccess == 0 ? "服务器维护30分钟" : "报名成功");
			if(from==null||from.isEmpty())
				response.getOutputStream().write(
						result.toString().getBytes("UTF-8"));
			else{
				response.sendRedirect("manager_index/manager_index.jsp?go=reginfo_edit&do="
					+ doStr + "&id=" + id);
			}
		} else if (doStr.equals("delete")) {
			
			RegInfoDao regInfoManagerDao = new RegInfoDao();
			boolean isSuccess = regInfoManagerDao.deleteRegInfo(id);
			JSONObject result = new JSONObject();
			result.element("status", isSuccess);
			result.element("tips", isSuccess ? "服务器维护30分钟" : "删除成功");
			if(isSuccess)
				response.sendRedirect("manager_index/manager_index.jsp?go=reginfo_manager_list&page=1");
			else
				response.getOutputStream().write(
						result.toString().getBytes("UTF-8"));
		}
	}
}
