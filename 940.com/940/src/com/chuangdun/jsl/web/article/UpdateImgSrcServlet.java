package com.chuangdun.jsl.web.article;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.dao.ArticleManagerDao;
import com.chuangdun.jsl.dao.ToolArticleDao;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

/**
 * Servlet implementation class ArticleEdit
 */
@WebServlet("/UpdateImgSrcServlet")
public class UpdateImgSrcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String dirPath;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateImgSrcServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ToolArticleDao articleDao = new ToolArticleDao();
		ArticleManagerDao articleManagerDao = new ArticleManagerDao();
		String type  =  SYS.RequestString(request, "type");
		if(type==null||type.isEmpty())
			return;
		dirPath = request.getRealPath("images/article");
		Page sharePage = articleDao.getArticlePageByType(type);
		CachedRowSetImpl shareRs = sharePage.getCachedRowSetImpl();
		try {
			ArrayList<Article> shareLsit = articleDao.getArticlesByRs(shareRs);
			for (Article article : shareLsit) {
				String content = article.getContent();
				int id = article.getId();
				String docStr = getImgFromContent(id, content);
				
				if(docStr==null)
					continue;
				System.out.println("update id:" + id);
				article.setContent(docStr);
				boolean isSuccess = articleManagerDao.updateContent(article);
				Thread.sleep(200);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}

	public  String getImgFromContent(int id, String content) {
		System.out.println("getImgFromContent()");
		Document doc = Jsoup.parse(content);
		Elements imgs = doc.getElementsByTag("img");
		if(imgs.size()==0){
			return null;
		}
		for (Element img : imgs) {
			String src = img.attr("src");
			if (src.contains("http")) {
				int random = (int) (Math.random()*1000000);
				String fileName = id + "_" + System.currentTimeMillis() / 1000 + "_" + random
						+ ".jpg";
				downloadFile(src, dirPath+"/"+fileName);
				img.attr("src", "/images/article/"+fileName);
				try {
					Thread.sleep(30);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}

		return doc.toString();
	}

	public  void downloadFile(String remoteFilePath, String localFilePath) {
		URL urlfile = null;
		HttpURLConnection httpUrl = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		File f = new File(localFilePath);
		try {
			System.out.println("get:" +remoteFilePath);
			urlfile = new URL(remoteFilePath);
			httpUrl = (HttpURLConnection) urlfile.openConnection();
			httpUrl.connect();
			bis = new BufferedInputStream(httpUrl.getInputStream());
			bos = new BufferedOutputStream(new FileOutputStream(f));
			int len = 2048;
			byte[] b = new byte[len];
			while ((len = bis.read(b)) != -1) {
				bos.write(b, 0, len);
			}
			System.out.println(f.getAbsolutePath()+"dd");
			bos.flush();
			bis.close();
			httpUrl.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(bis!=null)
					bis.close();
				if(bos!=null)
					bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
