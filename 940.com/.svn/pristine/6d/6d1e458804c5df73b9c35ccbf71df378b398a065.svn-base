package com.chuangdun.jsl.web.video;

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
import com.chuangdun.jsl.bean.Video;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.VideoDao;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/VideoEditSubmitServlet")
public class VideoEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoEditSubmitServlet() {

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
//		VideoDao videoManagerDao = new VideoDao();
//		boolean isSuccess = videoManagerDao.deleteVideo(id);
//		System.out.println("deleteVideo():" + isSuccess);
//		response.sendRedirect("manager_index/manager_index.jsp?go=video_manager_list&page=1&type=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dostr = SYS.RequestString(request, "do");
		System.out.println("do:" + dostr);
		int id = SYS.RequestInt(request, "id", 0);
		VideoDao videoManagerDao = new VideoDao();
		if (dostr.equals("edit") || dostr.equals("add")) {
			String title = SYS.RequestString(request, "title");
			int type = SYS.RequestInt(request, "type", 1);
			String content = SYS.RequestString(request, "a_content");
			String preview = SYS.RequestString(request, "preview");
			String author = SYS.RequestString(request, "author");
			int priority = SYS.RequestInt(request, "priority",-1);
			
			int isIndexType = SYS.RequestInt(request, "isIndexType", 0);
			System.out.println("request time:"+SYS.RequestString(request, "time"));
			System.out.println("isIndexType:"+isIndexType);
			Date time = null;
			try {
				time = LAB.StringToDate(SYS.RequestString(request, "time"),
						"yyyy-MM-dd HH:mm:ss");
			} catch (ParseException e1) {
				e1.printStackTrace();
			}

			int status = SYS.RequestInt(request, "status", 1);
			Video video = new Video();
			video.setId(id);
			video.setAuthor(author);
			video.setTitle(title);
			video.setPreview(preview);
			video.setVideoId(content);
			video.setPriority(priority);
			video.setStatus(status);
			video.setType(type);
			
			video.setIsIndexType(isIndexType);
			String timeStr = SYS.RequestString(request, "time");
			video.setTime(timeStr);
			boolean isSuccess = videoManagerDao.insertOrUpdateVideo(video,
					dostr);

			System.out.println(dostr + ":" + isSuccess);

			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			
			response.sendRedirect("manager_index/manager_index.jsp?go=video_edit&do="
					+ dostr + "&id=" + id+"&edit_status=" + editStatus);
		} else if (dostr.equals("delete")) {
			boolean isSuccess = videoManagerDao.deleteVideo(id);
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			System.out.println("deleteVideo():" + isSuccess);
			response.sendRedirect("manager_index/manager_index.jsp?go=video_manager_list&page=1"+"&edit_status=" + editStatus);
		}
		return;
	}

}
