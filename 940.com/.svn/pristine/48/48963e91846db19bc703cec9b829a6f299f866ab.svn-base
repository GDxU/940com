package com.chuangdun.jsl.dao;


import java.io.IOException;
import java.io.StringReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;



public class Tool_article_edit extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6403383720775485808L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String title = request.getParameter("title");// 标签不能转
		String content = request.getParameter("content");// 标签不能转
		int id = SYS.RequestInt(request, "id", 0);
		int click = SYS.RequestInt(request, "click", 0);
		String type = SYS.RequestString(request, "type");
		int status = SYS.RequestInt(request, "status", 1);
		String time = SYS.RequestString(request, "time");
		String preview = SYS.RequestString(request, "preview");
		String author=SYS.RequestString(request, "author");
		StringReader reader = getReader(content);
		
		// ------------------------- 必用变量 -------------------------
		String tips = null;
		String error = null;
		StringBuffer XML = new StringBuffer();
		String state = "-9";// 状态码默认-9表示异常

		// ------------------------- 以下访问数据库 -------------------------
		Connection conn = null;
		CallableStatement call = null;
		try
		{
			conn = DBM.getInstance().getConnection();
			call = conn.prepareCall("{CALL M2_TOOL_ARTICLE_EDIT(?,?,?,?,?,?,?,?,?,?)}");
			call.setInt(1, id);
			call.setString(2, type);
			call.setString(3, title);
			call.setClob(4, reader);
			call.setInt(5, click);
			call.setInt(6, status);
			call.setString(7, time);
			call.setString(8, preview);
			call.setString(9, author);
			call.registerOutParameter(10, oracle.jdbc.OracleTypes.VARCHAR);
			call.execute();
			tips = call.getString(10);
			call.close();
			conn.close();
			conn = null;
		}
		catch (Exception e)
		{
			tips = e.getMessage();
			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try
				{
					call.close();
					conn.close();
				}
				catch (Exception e2)
				{

				}
			}
		}
		if ("$OK$".equals(tips))
		{
			tips = "操作成功！";
			state = "1";
		}
		
		XML.append("<tips>" + tips + "</tips>\n");
		XML.append("<status>" + state + "</status>\n");
		SYS.Write(request, response, XML.toString(), error);
		XML.setLength(0);// 清空 （此法效率最高）
	}
	
	public StringReader getReader(String content)
	{
		StringReader reader = null;
		if (!"".equals(content) && content != null)
		{
			reader = new StringReader(content);
		}
		return reader;
	}
	public Page list(String dostr, String param, int line, int page)
	{
		// ------------------------- 必用变量 -------------------------
		Page ariclePage = new Page();
		ariclePage.setCurrentPage(page);
		ariclePage.setPageSize(line);
		String error = "";
		int count = 0;

		// ------------------------- 以下访问数据库 -------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try
		{
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnection();
			call = conn.prepareCall("{CALL M2_TOOL_ARTICLE_LIST(?,?,?,?,?,?)}");
			call.setString(1, dostr);
			call.setString(2, param);
			call.setInt(3, ariclePage.getCurrentPage());
			call.setInt(4, ariclePage.getPageSize());
			call.registerOutParameter(5, oracle.jdbc.OracleTypes.NUMBER);
			call.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR);
			call.execute();
			count = call.getInt(5);
			rs = (ResultSet) call.getObject(6);
			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
			call.close();
			conn.close();
			conn = null;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			error = e.getMessage();
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
					error = error + " " + e2.getMessage();// 累加错误信息
				}
			}
		}
		ariclePage.setTotalCount(count);
		ariclePage.setCachedRowSetImpl(rowset);
		return ariclePage;
	}
}
