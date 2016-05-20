package com.chuangdun.jsl.lab;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.PropertyConfigurator;

public class Init extends HttpServlet {

	public void init() throws ServletException
	{
		//---------------加载log4j参数---------------
		String prefix = this.getServletContext().getRealPath("/");
		String file = this.getServletContext().getInitParameter("log4jConfigLocation");
		PropertyConfigurator.configure(prefix + file);
		//---------------加载系统配置参数---------------
//		java.util.Properties props = new java.util.Properties();
//		String path = this.getClass().getProtectionDomain().getCodeSource().getLocation().toString().substring(5);
//
//		path = path.substring(0, path.indexOf("classes"));
//		if (!path.endsWith("/"))
//		{
//			path += "/";
//		}
//		path += "config.properties";
//
//		if (path.indexOf(":") == -1)
//		{ // for LINUX OS
//			path = "/" + path;
//		}
//		java.io.FileInputStream fis;
//		try
//		{
//			fis = new java.io.FileInputStream(new java.io.File(path));
//			props.load(fis);
//		}
//		catch (Exception e)
//		{
//			e.printStackTrace();
//
//		}
	}

}
