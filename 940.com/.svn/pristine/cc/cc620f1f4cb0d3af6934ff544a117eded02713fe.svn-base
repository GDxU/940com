package com.chuangdun.jsl.lab;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class SYS {

	
	/**
	 * 输出网页内容 error 错误信息
	 * **/
	public static void Write(HttpServletRequest request,
			HttpServletResponse response, String json, String error)
			throws IOException {
		String gzip = RequestString(request, "gzip");
		String callback = SYS.RequestString(request, "callback");
		response.setCharacterEncoding("UTF-8");
		if (error != null && !"".equals(error)) {
			json = json + ",\"error\":\"" + error + "\"";
		}
		json = "{\"kehuda\":{" + json + "}}";
		// ------------------------- 输出 -------------------------
		if (!"".equals(callback)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(callback + "(" + json + ");");
			out.flush();
			out.close();
		} else {
			if ("true".equals(gzip))// 判断是否需要GZIP
			{
				response.setContentType("application/x-gzip;charset=UTF-8");

				byte[] data = GZipUtils.compress(json.getBytes("UTF-8")); // GZIP压缩
				OutputStream toClient = new BufferedOutputStream(
						response.getOutputStream());
				toClient.write(data);
				toClient.flush();
				toClient.close();
				data = null;// 清空
			} else {
				response.setContentType("text/x-json;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print(json);
				out.flush();
				out.close();
			}
		}
	}

	
	// /**
	// * 输出网页内容
	// * format json xml 格式
	// * error 错误信息
	// * **/
	// public static void Write(HttpServletRequest request, HttpServletResponse
	// response, String xml, String error) throws IOException
	// {
	// String format = RequestString(request, "format");
	// String gzip = RequestString(request, "gzip");
	// response.setCharacterEncoding("UTF-8");
	// if (error != null && !"".equals(error))
	// {
	// xml += "<error>" + error + "</error>\n";
	// }
	// xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<sududa>\n" + xml +
	// "</sududa>";
	// // ------------------------- 输出 -------------------------
	// if ("true".equals(gzip))// 判断是否需要GZIP
	// {
	// response.setContentType("application/x-gzip;charset=UTF-8");
	//
	// if ("json".equals(format))
	// {
	// xml = xml2JSON(xml);
	// }
	// // String uri = request.getRequestURI().replace(request.getContextPath(),
	// "");// 获得访问路径 去除工程名
	// // String client = RequestString(request, "client");
	// // String power = RequestString(request, "power");
	// // power = power.replace(",", "");
	// // String path = request.getServletContext().getRealPath(uri + "_" +
	// client + "_" + format + "_power" + power + ".txt");// 访问路径+参数生成新文件
	// byte[] data = GZipUtils.compress(xml.getBytes("UTF-8")); // GZIP压缩
	// // ------------------------- 输出到文件 -------------------------
	// // FileOutputStream fos = new FileOutputStream(path);
	// // fos.write(data);
	// // fos.flush();
	// // fos.close();
	//
	// // ------------------------- 输出到客户端 -------------------------
	// // String base64=RequestString(request, "base64");
	// // if("true".equals(base64))
	// // {
	// // data=(new BASE64Encoder().encode(data)).getBytes("UTF-8");
	// // }
	// OutputStream toClient = new
	// BufferedOutputStream(response.getOutputStream());
	// toClient.write(data);
	// toClient.flush();
	// toClient.close();
	// data = null;// 清空
	// }
	// else
	// {
	// PrintWriter out = response.getWriter();
	// if ("json".equals(format))
	// {
	// xml = xml2JSON(xml);
	// response.setContentType("text/x-json;charset=UTF-8");
	// }
	// else
	// {
	// response.setContentType("application/xml;charset=UTF-8");
	// }
	// out.print(xml);
	// out.flush();
	// out.close();
	// }
	// }
	/**
	 * 输出网页内容 error 错误信息
	 * **/
	public static void print(HttpServletRequest request,
			HttpServletResponse response, String tips) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(tips);
		response.getWriter().flush();
		response.getWriter().close();
	}

	/**
	 * xml转换成json
	 * 
	 * @param xml
	 *            输入的xml <?xml version=\"1.0\"
	 *            encoding=\"utf-8\"?>\n<sududa></sududda>
	 * @return String json
	 * @throws Exception
	 * **/
	public static String xml2JSON(String xml) {
		JSONObject json = new JSONObject();
		try {
			json = Json.xml2Json(xml.replace("{", "\\{").replace("}", "\\}")
					.replace("&", "&amp;"));
		} catch (Exception e) {
		}
		// return json.toString().replace("{}", "\"\"");
		return json.toString().replace("{}", "\"\"").replace("\\", "")
				.replace("\"{", "[{").replace("}\"", "}]");
	}

	/**
	 * 获取int请求参数 如果类型转换错误就按默认值输出
	 * **/
	public static int RequestInt(HttpServletRequest request, String word,
			int defaultValue) {
		word = request.getParameter(word);
		if (!LAB.isNumber(word))
			return defaultValue;
		return Integer.parseInt(word);
	}

	/**
	 * 服务端重定向 获取int请求参数 如果类型转换错误就按默认值输出
	 * **/
	public static int RequestIntByAttribute(HttpServletRequest request,
			String word, int defaultValue) {
		word = request.getAttribute(word).toString();
		if (!LAB.isNumber(word))
			return defaultValue;
		return Integer.parseInt(word);
	}

	/**
	 * 获取long请求参数 如果类型转换错误就按默认值输出
	 * **/
	public static Long RequestLong(HttpServletRequest request, String word,
			Long defaultValue) {
		word = request.getParameter(word);
		if (!LAB.isNumber(word))
			return defaultValue;
		return Long.parseLong(word);

	}

	/**
	 * 获取float请求参数 如果类型转换错误就按默认值输出
	 * **/
	public static float RequestFloat(HttpServletRequest request, String word,
			float defaultValue) {
		word = RequestString(request, word);
		if ("".equals(word)) {
			return defaultValue;
		}
		if (!LAB.isBigDecimal(word))
			return defaultValue;
		return Float.parseFloat(word);
	}

	/**
	 * 获取double请求参数 如果类型转换错误就按默认值输出
	 * **/
	public static double RequestDouble(HttpServletRequest request, String word,
			double defaultValue) {
		word = RequestString(request, word);
		if ("".equals(word)) {
			return defaultValue;
		}
		if (!LAB.isBigDecimal(word))
			return defaultValue;
		return Double.parseDouble(word);
	}

	/**
	 * 获取String请求参数 并转换非法字符串
	 * **/
	public static String RequestString(HttpServletRequest request, String word) {
		word = request.getParameter(word);
		if (word == null || "".equals(word))
			return "";
		return WordCheck(word);
	}

	/**
	 * 获取String请求参数 并转换成小写
	 * **/
	public static String RequestStringToLower(HttpServletRequest request,
			String word) {
		word = RequestString(request, word);
		return word.toLowerCase();
	}

	/**
	 * 获取String请求参数 并转换非法字符串
	 * **/
	public static String[] RequestStringValues(HttpServletRequest request,
			String word) {
		return request.getParameterValues(word);
	}

	/**
	 * 检查字符串 替换非法字符
	 * 
	 * 
	 * **/
	public static String WordCheck(String word) {
		word = word + "";// 不管 null否，直接变成 "" 。避免参数不存在时，SQL传参报错
		word = word.trim();// 过滤两边空格
		// word = word.replaceAll("'", "’");
		// word = word.replace("{", "｛");
		// word = word.replace("}", "｝");
		// word = word.replace("~", "～");
		// word = word.replace("<", "＜");
		// word = word.replace(">", "＞");
		// word = word.replace("\\", "＼");
		// word = word.replace("^", "∧");
		// word = word.replace("\"", "＂");
		return word;
	}

	public static int OEM = 0;
	public static final String dbError = "服务器维护，30分钟后恢复！";
	public static final String ccError = "访问过于频繁！";
	public static final String[] memCashedHost = { "127.0.0.1:11211" };
	// public static final String[] memCashedHost = { "192.168.16.40:22222" };
	public static final Integer[] memCashedWeights = { 3 };
	public static final String ipbind = "127.0.0.1;192.168.16.24;192.168.16.53;192.168.16.213;192.168.16.236";
	public static final String M = "ABC123";
	public static final String productIndexPath = "D:\\lucene\\product";
	public static final String keywordIndexPath = "D:\\lucene\\keyword";
	public static boolean isIndex = false;// 为了防止更新索引和重构索引冲突
	public static long indexUpdateCount = 0;
}
