package com.chuangdun.jsl.web.feedback;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.FeedBack;
import com.chuangdun.jsl.dao.FeedBackDao;
import com.chuangdun.jsl.lab.DateUtil;
import com.chuangdun.jsl.lab.SYS;

/**
 * Servlet implementation class FeedBackEditSubmitServlet
 */
@WebServlet("/FeedBackEditSubmitServlet")
public class FeedBackEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedBackEditSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			String content = SYS.RequestString(request, "content");
			String time = SYS.RequestString(request, "time");
			FeedBack feedback = new FeedBack();
			feedback.setContent(content);
			feedback.setId(id);
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
			feedback.setTime(DateUtil.getDateTime());

			FeedBackDao feedBackDao = new FeedBackDao();
		//	response.sendRedirect("manager_index/manager_index.jsp?go=feedback_manager_list&page=1");
			JSONObject result = new JSONObject();
			int isSuccess = feedBackDao.insertOrUpdateFeedBack(feedback, doStr);
			result.element("status", isSuccess);
			result.element("tips", isSuccess == 0 ? "服务器维护30分钟" : "报名成功");
			if(from==null||from.isEmpty())
				response.getOutputStream().write(
						result.toString().getBytes("UTF-8"));
			else{
				response.sendRedirect("manager_index/manager_index.jsp?go=feedback_edit&do="
					+ doStr + "&id=" + id);
			}
		} else if (doStr.equals("delete")) {
			
			FeedBackDao feedBackDao = new FeedBackDao();
			boolean isSuccess = feedBackDao.deleteFeedBack(id);
			JSONObject result = new JSONObject();
			result.element("status", isSuccess);
			result.element("tips", isSuccess ? "服务器维护30分钟" : "删除成功");
			if(isSuccess)
				response.sendRedirect("manager_index/manager_index.jsp?go=feedback_manager_list&page=1");
			else
				response.getOutputStream().write(
						result.toString().getBytes("UTF-8"));
		}
	}

}
