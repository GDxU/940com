package com.chuangdun.jsl.web.article;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;

public class List extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3327030433749793438L;

	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String type = SYS.RequestString(request, "1");
		int page = SYS.RequestInt(request, "page", 1);
		int line = SYS.RequestInt(request, "line", 10);
		ToolArticleDao articleDao=new ToolArticleDao();
		Page articlePage=articleDao.getArticlePage(page, line,type);
		request.setAttribute("Page", articlePage);
		request.getRequestDispatcher("list.jsp").forward(request, response);
		return;
	}

}
