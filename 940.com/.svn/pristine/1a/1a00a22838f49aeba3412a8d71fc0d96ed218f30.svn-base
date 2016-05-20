package com.chuangdun.jsl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chuangdun.jsl.lab.LAB;

public class SetCharSetEncoding implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();

		System.out.println("uri:" + uri);
		String suffix = ".html";
		String videoSubStr = "/video/";
		String jiqiaoDetailSubStr = "/shop/jiqiao/";
		String fenxiangDetailSubStr = "/shop/fenxiang/";
		String tuiguangDetailSubStr = "/shop/tuiguang/";
		String wentiDetailSubStr = "/shop/wenti/";
		String caseDetailSubStr = "/case/";
		if (uri.contains(videoSubStr) && uri.contains(suffix)) {
			int startIndex = uri.indexOf(videoSubStr) + videoSubStr.length();
			int endIndex = uri.indexOf(suffix);
			String idNum = uri.substring(startIndex, endIndex);
			request.setAttribute("id", idNum);
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);

		} else if ((uri.contains(jiqiaoDetailSubStr)
				|| uri.contains(caseDetailSubStr)
				|| uri.contains(fenxiangDetailSubStr)
				|| uri.contains(tuiguangDetailSubStr) || uri
					.contains(wentiDetailSubStr)) && uri.contains(suffix)) {
			String subStr ;
			if (uri.contains(jiqiaoDetailSubStr))
				subStr = jiqiaoDetailSubStr;
			else if (uri.contains(caseDetailSubStr))
				subStr = caseDetailSubStr;
			else if (uri.contains(fenxiangDetailSubStr))
				subStr = fenxiangDetailSubStr;
			else if (uri.contains(tuiguangDetailSubStr))
				subStr = tuiguangDetailSubStr;
			else
				subStr = wentiDetailSubStr;
			
			String id = getIdByUrl(uri, subStr);
			System.out.println("id:" + id);

			request.setAttribute("id", id);
			request.getRequestDispatcher("details.jsp").forward(request,
					response);

		} else if (uri.contains("/a/") && uri.contains(".html")) {
			int startIndex = uri.indexOf("/a/") + "/a/".length();
			int endIndex = uri.indexOf(".html");
			String idAbc = uri.substring(startIndex, endIndex);

			String idNum = LAB.ABCToNumber(idAbc);
			request.setAttribute("id", idNum);
			request.getRequestDispatcher("/articles")
					.forward(request, response);
			return;

		} else if (uri.contains("/aee/") && uri.contains(".html")) {
			int startIndex = uri.indexOf("/aee/") + "/aee/".length();
			int endIndex = uri.indexOf(".html");
			String idAbc = uri.substring(startIndex, endIndex);
			String idNum = LAB.ABCToNumber(idAbc);
			request.setAttribute("id", idNum);
			request.setAttribute("doWhat", "edit");
			request.getRequestDispatcher("/articleEdit").forward(request,
					response);
			return;

		} else if (uri.contains("/aea/") && uri.contains(".html")) {
			request.setAttribute("doWhat", "add");
			request.getRequestDispatcher("/articleEdit").forward(request,
					response);
			return;

		}

		else if (uri.contains("/ad/") && uri.contains(".html")) {
			int startIndex = uri.indexOf("/ad/") + "/ad/".length();
			int endIndex = uri.indexOf(".html");
			String idAbc = uri.substring(startIndex, endIndex);
			String idNum = LAB.ABCToNumber(idAbc);
			request.setAttribute("id", idNum);
			request.getRequestDispatcher("/articleDelete").forward(request,
					response);
			return;

		} else if (uri.contains("/al/")) {
			int startIndex = uri.indexOf("/a/") + "/a/".length();

		} else if (uri.indexOf("/x/") > -1)
		// /x/details_1.html ==> details_[id].html
		{
			if (!"".equals(request.getContextPath())
					&& request.getContextPath() != null) {
				uri = uri.replaceAll("^\\" + request.getContextPath(), "");// 去掉工程路径
			}
			if (uri.lastIndexOf(".html") > -1) {
				String newUrl = "/x/";
				uri = uri.substring(0, uri.lastIndexOf("."));
				String path = "details";
				String value = "";
				String str = "";

				if (uri.indexOf("_") > -1) {
					String[] arr = uri.split("_");
					str = arr[0];
					value = arr[1];
				} else {
					str = uri;
				}
				String[] arr2 = str.split("/");
				String param = "id";
				if ("list".equals(arr2[2])) {
					param = "page";
					path = "list";
				} else {
					value = arr2[2];
				}
				newUrl += path + "?" + param + "=" + LAB.ABCToNumber(value);

				request.getRequestDispatcher(newUrl).forward(request, response);
			} else if (uri.equals("/x/")) {
				request.getRequestDispatcher("/x/list").forward(request,
						response);
			} else {
				chain.doFilter(request, response);
			}
		} else {
			chain.doFilter(request, response);
		}
	}

	private String getIdByUrl(String uri, String subStr) {
		int startIndex = uri.indexOf(subStr) + subStr.length();
		int endIndex = uri.indexOf(".html");
		String id = uri.substring(startIndex, endIndex);
		return id;
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
