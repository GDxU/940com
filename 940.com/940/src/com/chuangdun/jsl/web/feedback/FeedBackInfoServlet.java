package com.chuangdun.jsl.web.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.dao.ToolArticleDao;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class FeedBackInfoServlet
 */
@WebServlet("/FeedBackInfoServlet")
public class FeedBackInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedBackInfoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getAttribute("id").toString());
		System.out.println("article doGet id:" + id);
		ToolArticleDao articleDao=new ToolArticleDao();
		CachedRowSetImpl rs=articleDao.getArticleRowSet(id);
		request.setAttribute("rowset", rs);
		request.getRequestDispatcher("article/details.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
