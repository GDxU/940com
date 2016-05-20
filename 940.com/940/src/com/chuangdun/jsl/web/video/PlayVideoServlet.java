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
@WebServlet("/PlayVideoServlet")
public class PlayVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PlayVideoServlet() {
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
		System.out.println("doGet");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String videoId = request.getParameter("v_id");
		System.out.println("v_id:" + videoId); 
		VideoDao videoDao = new VideoDao();
		boolean isSuccess = videoDao.updateClickNum(videoId);
		JSONObject result  = new JSONObject();
		if(isSuccess){
			result.element("status", 1);
			result.element("tips", "修改成功");
		}
		else{
			result.element("status", 0);
			result.element("tips", "修改失败");
		}
		response.getOutputStream().write(result.toString().getBytes("UTF-8"));
		
	}



	
}
