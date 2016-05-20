package com.chuangdun.jsl.web.article;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class Details extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1567787375891234612L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		int id = SYS.RequestInt(request, "id", 0);

		// ------------------------- 以下访问数据库 -------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try
		{
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnection();
			call = conn.prepareCall("{call TOOL_ARTICLE_DETAIL(?,?)}");
			call.setInt(1, id);
			call.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			call.execute();
			rs = (ResultSet) call.getObject(2);
			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
			call.close();
			conn.close();
			conn = null;

		}
		catch (Exception e)
		{
			e.printStackTrace();

			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try
				{
					rs.close();
					call.close();
					conn.close();
				}
				catch (Exception e2)
				{

				}
			}
		}
		request.setAttribute("Article", rowset);
		request.getRequestDispatcher("details.jsp").forward(request, response);
		return;
	}

}
