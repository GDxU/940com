package com.chuangdun.jsl.web.user;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/CheckCodeServlet")
public class CheckCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckCodeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");
		String sessionCode = request.getSession().getAttribute("code")
				.toString();
		System.out.println("code:" + code + "  sessionCode:" + sessionCode);
		ServletOutputStream os = response.getOutputStream();
		String result = "{\"status\": 1}";
		System.out.println(code.equalsIgnoreCase(sessionCode));
		if (code.equalsIgnoreCase(sessionCode)) {
			os.write(result.getBytes("UTF-8"));
		}else{
			result = "{\"status\": 0}";
			os.write(result.getBytes("UTF-8"));
		}
	}
}
