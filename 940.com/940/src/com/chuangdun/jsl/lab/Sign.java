package com.chuangdun.jsl.lab;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public abstract class Sign extends HttpServlet {

	private static final long serialVersionUID = -1312957501291270788L;

	public Sign() {
		super();
	}

	
	public void destroy()
	{
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// boolean loadOK = true; // 全局开关
		// String tips = "签名类型错误！";// 默认
		boolean loadOK = false; // 全局开关

		String tips = "签名类型错误！";// 默认
		String para = "";
		para = request.getRequestURI() + "?";
		String sign0 = SYS.RequestString(request, "sign0") + ",";// 不参与加密的参数，获取参数并追加逗号
		Map<String, String[]> map = request.getParameterMap();// 获取所有参数
		List<Map.Entry<String, String[]>> list = new ArrayList<Map.Entry<String, String[]>>(map.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<String, String[]>>() {
			// ----------------------按key排序----------------------
			public int compare(Map.Entry<String, String[]> o1, Map.Entry<String, String[]> o2)
			{
				return (o1.getKey()).toString().compareTo(o2.getKey());
			}
		});

		// ----------------------排序后获得签名串----------------------
		for (int i = 0; i < list.size(); i++)
		{
			Map.Entry<String, String[]> m = list.get(i);
			String key = m.getKey();
			if (!"sign".equals(key.toLowerCase()) && (sign0).indexOf(key + ",") == -1)// 不参与加密
			{
				if (!"validatecode".equals(key))
				{
					para += key + "=" + m.getValue()[0] + "&";
				}
				else
				{
					HttpSession session = request.getSession();
					String sessionCode = (String) session.getAttribute("ValidateCode");
					if (sessionCode == null)
					{
						sessionCode = "";
					}
					para += key + "=" + sessionCode.toLowerCase() + "&";

				}
			}
		}
		if (para != null)
		{
			
			para = para.substring(0, para.lastIndexOf("&"));// 删除最后一个$符
			
			para = URLEncoder.encode(para, "UTF-8");// 签名串utf-8转码
		}
		String sign = SYS.RequestString(request, "sign");

		if ("".equals(sign))
		{
			tips = "签名不能为空！";
		}
		else
		{
			String md5 = LAB.md5(para);
			if (sign.equals(md5))
				loadOK = true;
			else
			{
				// tips = "sign签名错误！" + para + " md5:" + md5;
				if (para.indexOf("validatecode") == -1)
				{
					tips = "sign签名错误！";
				}
				else
				{
					tips = "验证码错误！";
				}
			}

		}

		// ------------------------- 以下输出XML -------------------------
		if (loadOK == true)
		{
			load(request, response);
		}
		else
		{
			StringBuffer json = new StringBuffer();
			json.append("\"tips\":\"" + tips + "\"");
			json.append(",\"status\":\"-9\"");
			SYS.Write(request, response, json.toString(), null);
			json.setLength(0);// 清空 （此法效率最高）
		}

	}

	protected abstract void load(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

	public void init() throws ServletException
	{

	}
}
