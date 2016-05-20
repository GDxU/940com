package com.chuangdun.jsl.web.video;

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

import com.chuangdun.jsl.bean.Video;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.VideoDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class VideoInfoServlet
 */
@WebServlet("/VideoInfoServlet")
public class VideoInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoInfoServlet() {
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

		String order = request.getParameter("order");
		String type = request.getParameter("type");
		int page = SYS.RequestInt(request, "page", 1);
		int line = SYS.RequestInt(request, "line", 10);

		VideoDao videoDao = new VideoDao();

		Page videoPage = videoDao.getVideoPage(page, line, type, order);
		JSONObject result = new JSONObject();

		result.element("count", videoPage.getTotalCount());
		result.element("tips", videoPage.getTips());
		
		CachedRowSetImpl rs = videoPage.getCachedRowSetImpl();
		JSONArray jsArray = new JSONArray();
		System.out.println("result beforeArray:" + result.toString() + " " + videoPage.getStatus());
		try {
			
			while (rs.next()) {
				String vidoeId = rs.getString("video_id");
				String preview = rs.getString("preview");
				String time = rs.getString("time");
				String author = rs.getString("author");
				String title = rs.getString("title");
				int id = rs.getInt("id");
				int typeInt = rs.getInt("type");
				int clickNum  = rs.getInt("click_num");
				Video video = new Video();
				video.setId(id);
				video.setVideoId(vidoeId);
				video.setPreview(preview);
				video.setTime(time);
				video.setClick_num(clickNum);
				video.setTitle(title);
				video.setAuthor(author);
				video.setType(typeInt);
				jsArray.add(video);
			}
			System.out.println(result.toString());
			result.element("status", videoPage.getStatus());
			System.out.println(result.toString());
			if(jsArray.size()!=0)
				result.element("list", jsArray);
			else
				result.element("list", "");
			System.out.println("type:"+type + "   "+result.toString());
			response.getOutputStream().write(result.toString().getBytes("utf-8"));
		} catch (SQLException e) {
			e.printStackTrace();
			result.element("status", 0);
			result.element("list", "");
			response.getOutputStream().write(result.toString().getBytes("utf-8"));
		}
		System.out.println("result:" + result.toString());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}



	
}
