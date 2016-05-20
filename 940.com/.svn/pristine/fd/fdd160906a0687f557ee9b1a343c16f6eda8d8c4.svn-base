package com.chuangdun.jsl.web.article;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class NewsList
 */
@WebServlet("/AticleList")
public class ArticleListServlet extends HttpServlet {
	 static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type =request.getParameter("type");
		int page = SYS.RequestInt(request, "page", 1);
		int line = SYS.RequestInt(request, "line", 10);
		ToolArticleDao articleDao=new ToolArticleDao();
		Page articlePage=articleDao.getArticlePage(page, line,type);
		JSONObject result = new JSONObject();
		
		result.element("count", articlePage.getTotalCount());
		result.element("tips", articlePage.getTips());
		
		CachedRowSetImpl rs = articlePage.getCachedRowSetImpl();
		JSONArray jsArray = new JSONArray();
		System.out.println("result beforeArray:"+jsArray.toString());
		//request.setAttribute("Page", articlePage);
		//System.out.println("doGet()1");
		//request.getRequestDispatcher("article/list.jsp").forward(request, response);

		try {
			while (rs.next()){
				 int id=rs.getInt("a_id");
				 String title=rs.getString("a_title");
				 String typeInt=rs.getString("a_type");
				 String author=rs.getString("a_author");
				 String preview=rs.getString("a_preview");
				 String content=rs.getString("a_content");
				 int clickNum=rs.getInt("a_click");
				 String time=rs.getString("a_time");
				 String status=rs.getString("a_status");
				 int priority=rs.getInt("a_priority");
				 int inCome=rs.getInt("a_income");
				 String joinTime=rs.getString("a_join_time");
				 System.out.println("time和jion_time是："+time+"  "+joinTime);
				 Article article=new Article();
				 article.setId(id);
				 article.setTitle(title);
				 article.setType(typeInt);
				 article.setAuthor(author);
				 article.setPreview(preview);
				 article.setContent(content);
				 article.setClickNum(clickNum);
				 article.setStatus(status);
				 article.setPriority(priority);
				 article.setInCome(inCome);
				 try {
					article.setTime(LAB.StringToSqlDate(time, "yyyy-MM-dd HH:mm:ss").getTime());
					 article.setJoinTime(LAB.StringToSqlDate(joinTime, "yyyy-MM-dd HH:mm:ss").getTime());
				} catch (ParseException e) {
					e.printStackTrace();
				}
			
				 jsArray.add(article);
			}
			System.out.println(result.toString());
			result.element("status", articlePage.getStatus());
			System.out.println(result.toString());
			if (jsArray.size() != 0)
				result.element("list", jsArray);
			else
				result.element("list", "");
			System.out.println( result.toString());
			response.getOutputStream().write(
					result.toString().getBytes("utf-8"));
			
		} catch (SQLException e) {
			e.printStackTrace();
			result.element("status", 0);
			result.element("list", "");
			response.getOutputStream().write(
					result.toString().getBytes("utf-8"));
		}
		System.out.println("result122:" + result.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
