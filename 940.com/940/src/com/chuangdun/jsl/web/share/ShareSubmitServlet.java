package com.chuangdun.jsl.web.share;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.Share;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.ShareDao;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/ShareSubmitServlet")
public class ShareSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShareSubmitServlet() {

		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		// int id = SYS.RequestInt(request, "id", 0);
		// ShareDao shareManagerDao = new ShareDao();
		// boolean isSuccess = shareManagerDao.deleteShare(id);
		// System.out.println("deleteShare():" + isSuccess);
		// response.sendRedirect("manager_index/manager_index.jsp?go=share_manager_list&page=1&type=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dostr = SYS.RequestString(request, "do");
		int id = SYS.RequestInt(request, "id", 0);
		ShareDao shareManagerDao = new ShareDao();
		String from = SYS.RequestString(request, "from");
		if (dostr.equals("edit") || dostr.equals("add")) {

			String title = SYS.RequestString(request, "title");
			String content = SYS.RequestString(request, "a_content");
			
			String userName = SYS.RequestString(request, "user_name");
			System.out.println("userName"+userName + " content:"+content+444);
			String realName = SYS.RequestString(request, "real_name");
			String profileUrl = SYS.RequestString(request, "preview");
			String period = SYS.RequestString(request, "period");
			int gender = SYS.RequestInt(request, "gender", 0);
			if (profileUrl == null)
				profileUrl = "http://www.940.com/images/share3.png";
			Date time = null;
			try {
				time = LAB.StringToDate(SYS.RequestString(request, "time"),
						"yyyy-MM-dd HH:mm:ss");
			} catch (ParseException e1) {
				e1.printStackTrace();
			}

			int status = SYS.RequestInt(request, "status", 1);
			Share share = new Share();
			share.setId(id);
			share.setUserName(userName);
			share.setRealName(realName);
			share.setGender(gender);
			share.setContent(content);
			share.setTitle(title);
			share.setProfileUrl(profileUrl);
			share.setStatus(status);
			share.setPeriod(period);
			String timeStr = SYS.RequestString(request, "time");
			share.setTime(timeStr);
			boolean isSuccess = shareManagerDao.insertOrUpdateShare(share,
					dostr);
			
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			
			System.out.println(dostr + ":" + isSuccess);
			String result = "{\"status\":\"1\",\"tips\":分享成功}";
			if (!isSuccess)
				result = "{\"status\":\"-1\",\"tips\":服务器维护30分钟}";

			if (from.equals("manager"))
				response.sendRedirect("manager_index/manager_index.jsp?go=share_edit&do="
						+ dostr + "&id=" + id+"&edit_status=" + editStatus);
			else
				response.getOutputStream().write(result.getBytes("UTF-8"));

		} else if (dostr.equals("delete")) {
			boolean isSuccess = shareManagerDao.deleteShare(id);
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			System.out.println("deleteShare():" + isSuccess);
			response.sendRedirect("manager_index/manager_index.jsp?go=share_manager_list&page=1"+"&edit_status=" + editStatus);
		}
		return;
	}

}
