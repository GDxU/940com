package com.chuangdun.jsl.web.teacher;

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
import com.chuangdun.jsl.bean.Teacher;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.dao.TeacherDao;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/TeacherEditSubmitServlet")
public class TeacherEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherEditSubmitServlet() {
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
//		TeacherDao teacherManagerDao = new TeacherDao();
//		boolean isSuccess = teacherManagerDao.deleteTeacher(id);
//		System.out.println("deleteTeacher():" + isSuccess);
//		response.sendRedirect("manager_index/manager_index.jsp?go=teacher_manager_list&page=1&type=1");
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
		TeacherDao teacherManagerDao = new TeacherDao();
		if (dostr.equals("edit") || dostr.equals("add")) {
			
			String title = SYS.RequestString(request, "title");
			String introduction = SYS.RequestString(request, "introduction");
			String profileUrl = SYS.RequestString(request, "preview");
			String profileThumbUrl = SYS.RequestString(request, "preview_thumb");
			String name =SYS.RequestString(request, "name");
			int priority = SYS.RequestInt(request, "priority", -1);
			int level =  SYS.RequestInt(request, "level", -1);
			
			
			Teacher teacher = new Teacher();
			teacher.setId(id);
			teacher.setTitle(title);
			teacher.setIntroduction(introduction);
			teacher.setProfileUrl(profileUrl);
			teacher.setProfileThumbUrl(profileThumbUrl);
			teacher.setName(name);
			teacher.setPriority(priority);
			teacher.setLevel(level);
			
//			System.out.println(teacher);
			boolean isSuccess = teacherManagerDao.insertOrUpdateTeacher(teacher,
					dostr);

			System.out.println(dostr + ":" + isSuccess);

			response.sendRedirect("manager_index/manager_index.jsp?go=teacher_edit&do="
					+ dostr + "&id=" + id);
		} else if (dostr.equals("delete")) {
			boolean isSuccess = teacherManagerDao.deleteTeacher(id);
			System.out.println("deleteTeacher():" + isSuccess);
			response.sendRedirect("manager_index/manager_index.jsp?go=teacher_manager_list&page=1");
		}
		return;
	}

}
