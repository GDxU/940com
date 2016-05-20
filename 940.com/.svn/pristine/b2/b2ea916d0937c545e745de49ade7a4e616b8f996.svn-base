package com.chuangdun.jsl.web.article;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;

/**
 * Servlet implementation class ArticleManagerServlet
 */
@WebServlet("/ArticleManagerServlet")
public class ArticleManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = SYS.RequestString(request, "type");
		String searchStr = SYS.RequestString(request,"search");
		int page = SYS.RequestInt(request, "page", 1);
		ArticleManagerDao aManagerDao=new ArticleManagerDao();
		Page articlePage=aManagerDao.getArticlePage(type, searchStr, page);
		articlePage.setSearchStr(searchStr);
		articlePage.setType(type);
		request.setAttribute("articlePage", articlePage);
		System.out.println("articleManagerServlet doGet()");
		request.getRequestDispatcher("article/article_manager_list.jsp").forward(request, response);
		return;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
