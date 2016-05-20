package com.chuangdun.jsl.web.notice;

import java.beans.Encoder;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Notice;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.NoticeDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class NoticeInfoServlet
 */
@WebServlet("/NoticeListServlet")
public class NoticeListServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7134495973503186106L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoticeListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("restriction")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		int id = SYS.RequestInt(request, "id", 0);
		NoticeDao noticeDao = new NoticeDao();
		Notice notice = noticeDao.getNoticeById(id);
		JSONObject result = new JSONObject();
		String tips = "cuccess";
		if (notice == null)
			tips = "error";

		result.element("tips", tips);
		result.element("notice", notice);
		
//		result.element("next_id", noticeDao.getNextId(id));
//		result.element("last_id", noticeDao.getLastId(id));
		
		int status = 1;
		
		if (notice == null) {
			status = -1;
		}
		
		result.element("status", status);
		System.out.println(result.toString());
		response.getOutputStream().write(result.toString().getBytes());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
