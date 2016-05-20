package com.chuangdun.jsl.web.video;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VideoInfoServlet
 */
@WebServlet("/VideoUploadServlet")
public class VideoUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("restriction")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ServletInputStream ss = request.getInputStream();
		System.out.println(111111);
		byte[] b = new byte[1024];
		int n = 0;

		while ((n = ss.read(b)) != -1) {
			System.out.println(111);
		}

		ss.close();

		// System.out.println("doGet()1");
		// request.getRequestDispatcher("article/list.jsp").forward(request,
		// response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ServletInputStream ss = request.getInputStream();
		
		File f = new File("d:/", "111.png");
		FileOutputStream fos = new FileOutputStream(f);
		
		byte[] b = new byte[1024];
		int n = 0;
		int size = 0;
		while ((n = ss.read(b)) != -1) {
			fos.write(b, 0, n);
			size++;
		}
		System.out.println("size:" + size);
		ss.close();
		fos.close();
	}

}
