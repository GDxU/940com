package com.chuangdun.jsl.web.reginfo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.lab.SYS;

/**
 * Servlet implementation class ArticleDeleteServlet
 */
@WebServlet("/RegInfoDeleteServlet")
public class RegInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegInfoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = SYS.RequestIntByAttribute(request, "id", 0);
		System.out.println("delete servlet doGet() " +request.getAttribute("id"));
		ArticleManagerDao articleManagerDao = new ArticleManagerDao();
		boolean isSuccess  = articleManagerDao.deleteArticle(id);
		System.out.println("isSuccess:" + isSuccess);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
