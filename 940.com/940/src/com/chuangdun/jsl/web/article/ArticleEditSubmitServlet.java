package com.chuangdun.jsl.web.article;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/ArticleEditSubmitServlet")
public class ArticleEditSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleEditSubmitServlet() {

		super();
		System.out.println(11111111);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id = SYS.RequestInt(request, "id", 0);
		ArticleManagerDao articleManagerDao = new ArticleManagerDao();
		boolean isSuccess = articleManagerDao.deleteArticle(id);
		System.out.println("deleteArticle():" + isSuccess);
		response.sendRedirect("manager_index/manager_index.jsp");
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
		ArticleManagerDao articleManagerDao = new ArticleManagerDao();
		if (dostr.equals("edit") || dostr.equals("add")) {
			String type = "0";
			String title = SYS.RequestString(request, "title");
			type = SYS.RequestString(request, "type");
			String content = SYS.RequestString(request, "a_content");
			String preview = SYS.RequestString(request, "preview");
			String author = SYS.RequestString(request, "author");
			int priority = SYS.RequestInt(request, "priority", -1);
			int click = SYS.RequestInt(request, "click", 1);
			int inCome = SYS.RequestInt(request, "income", -1);
			String keywords=SYS.RequestString(request, "keywords");
			String desc=SYS.RequestString(request, "desc");
			System.out.println(SYS.RequestString(request, "time"));

			
			String status = SYS.RequestString(request, "status");
			Article article = new Article();
			article.setId(id);
			article.setAuthor(author);
			article.setTitle(title);
			article.setPreview(preview);
			article.setContent(content);
			article.setStatus(status);
			article.setClickNum(click);
			article.setType(type);
			article.setPriority(priority);
			article.setInCome(inCome);
			article.setKeywords(keywords);
			article.setDesc(desc);

			try {
				String time = SYS.RequestString(request, "time");
				article.setTime(LAB.StringToSqlDate(time, "yyyy-MM-dd HH:mm:ss").getTime());

				String jionTime = SYS.RequestString(request, "join_time");
				System.out.println("jionTime:" + jionTime + " time:" + time);
				article.setJoinTime(LAB.StringToSqlDate(jionTime, "yyyy-MM-dd")
						.getTime());

			} catch (ParseException e) {
				System.out.println("时间格式有误");
				e.printStackTrace();
			}
			boolean isSuccess = articleManagerDao.insertOrUpdateArticle(
					article, dostr);
			System.out.println(dostr + ":" + isSuccess);
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;

			if (SYS.RequestString(request, "from").equals("class_i"))
				response.sendRedirect("manager_index/manager_index.jsp?go=class_edit&do="
						+ dostr + "&id=" + id + "&edit_status=" + editStatus);
			else {

				response.sendRedirect("manager_index/manager_index.jsp?go=article_edit&do="
						+ dostr + "&id=" + id + "&edit_status=" + editStatus);

			}
		} else if (dostr.equals("delete")) {
			boolean isSuccess = articleManagerDao.deleteArticle(id);
			
			int editStatus = 0;
			if (isSuccess)
				editStatus = 1;
			
			System.out.println("deleteArticle():" + isSuccess);
			response.sendRedirect("manager_index/manager_index.jsp&edit_status=" + editStatus);
		}
		return;
	}

}
