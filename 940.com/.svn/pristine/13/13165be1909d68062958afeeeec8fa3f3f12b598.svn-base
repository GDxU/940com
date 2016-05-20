package com.chuangdun.jsl.web.notice;

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
import com.chuangdun.jsl.bean.Notice;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.NoticeDao;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/NoticeEditSubmitServlet")
public class NoticeEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeEditSubmitServlet() {

		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
//		int id = SYS.RequestInt(request, "id", 0);
//		NoticeDao noticeManagerDao = new NoticeDao();
//		boolean isSuccess = noticeManagerDao.deleteNotice(id);
//		System.out.println("deleteNotice():" + isSuccess);
//		response.sendRedirect("manager_index/manager_index.jsp?go=notice_manager_list&page=1&type=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dostr = SYS.RequestString(request, "do");
		System.out.println("notice edit do:" + dostr);
		int id = SYS.RequestInt(request, "id", 0);
		NoticeDao noticeManagerDao = new NoticeDao();
		if (dostr.equals("edit") || dostr.equals("add")) {
			String title = SYS.RequestString(request, "title");
			String content = SYS.RequestString(request, "a_content");
			String author = SYS.RequestString(request, "author");
			System.out.println(SYS.RequestString(request, "time") + " id:" + id);
			Date time = null;
			try {
				time = LAB.StringToDate(SYS.RequestString(request, "time"),
						"yyyy-MM-dd HH:mm:ss");
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			
			int status = SYS.RequestInt(request, "status", 1);
			Notice notice = new Notice();
			notice.setId(id);
			notice.setAuthor(author);
			notice.setContent(content);
			notice.setTitle(title);
			String timeStr = SYS.RequestString(request, "time");
			notice.setTime(timeStr);
			boolean isSuccess = noticeManagerDao.insertOrUpdateNotice(notice,
					dostr);
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			System.out.println(dostr + ":" + isSuccess);
			
			response.sendRedirect("manager_index/manager_index.jsp?go=notice_edit&do="
					+ dostr + "&id=" + id+"&edit_status=" + editStatus);
		} else if (dostr.equals("delete")) {
			boolean isSuccess = noticeManagerDao.deleteNotice(id);
			System.out.println("deleteNotice():" + isSuccess);
			response.sendRedirect("manager_index/manager_index.jsp?go=notice_manager_list&page=1");
		}
		return;
	}

}
