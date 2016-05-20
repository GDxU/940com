package com.chuangdun.jsl.web.user;

import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.chuangdun.jsl.lab.SYS;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
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
		JSONObject result = new JSONObject();
		try {
			System.out.println(1122111);
			String idGood = SYS.RequestString(request, "id_good");
			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();
			String dirPath = request.getRealPath("images");
			System.out.println(dirPath);
			File tempFile  =  new File(dirPath+"/uploads/profiles");
			// Set factory constraints
			factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是4kb
			factory.setRepository(tempFile);// 设置缓冲区目录
			System.out.println(1122111);
			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Set overall request size constraint
			upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB

			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
			Iterator<FileItem> i = items.iterator();
			
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				String fileName = fi.getName();
				if (fileName != null) {
					File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题
					String name  = idGood+System.currentTimeMillis()/1000+fullFile.getName();
					File savedFile = new File(dirPath+"/uploads/profiles", name);
					result.element("file_url", "images/uploads/profiles/"+name);
					fi.write(savedFile);
				}
			}
			
			result.element("tips", "上传成功");
			result.element("status", "1");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			result.element("tips", "上传失败");
			result.element("status", "-9");
			
		}
		
		response.getOutputStream().write(result.toString().getBytes());
	}

}
