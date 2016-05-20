package com.chuangdun.jsl.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class ToolArticleDao {
/**
 * 
 * 
 * @param page
 * @param line
 * @param type  1：开店流程 2：开店技巧 3：干货分享 4：常见问题 5： 网店推广 6:成功案例 7:视频教程
 * @return
 */
	public Page getArticlePage(int page, int line,String type) {
		Page articlePage = new Page();
		System.out.println();
		articlePage.setCurrentPage(page);
		articlePage.setPageSize(line);
		String tips = "";
		String error = "";
		int all = 0;
		// ------------------------- 以下访问数据-------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try {
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnectionByClassForName();
			int topIndex = (page-1)*line;
			String countQueury = "SELECT COUNT(*) AS COUNT FROM JSL_ARTICLE WHERE  A_TYPE = "+ type +" AND A_STATUS>0" ;// 创建表SQL语句
			
			String query = "SELECT TOP "+line+" * FROM JSL_ARTICLE WHERE A_ID NOT IN(SELECT TOP "+topIndex + " A_ID FROM JSL_ARTICLE WHERE A_TYPE = "+ type +" AND A_STATUS>0 ORDER BY A_TIME DESC) AND A_TYPE = "+ type +" AND A_STATUS>0 ORDER BY a_TIME DESC" ;// 创建表SQL语句
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			ResultSet countRs  = stmt.executeQuery(countQueury);
			
			if(countRs.next()){
				all = countRs.getInt("COUNT");
			}
			System.out.println();
			rs = stmt.executeQuery(query);
			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
//			call.close();
			conn.close();
			conn = null;
		} catch (Exception e) {
			e.printStackTrace();
			tips = SYS.dbError;
			error = e.getMessage();
			LAB.logs("ARTICLE", error);
			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					rs.close();
					call.close();
					conn.close();
				} catch (Exception e2) {
					error = error + " " + e2.getMessage();// 累加错误信息
				}
			}
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);
		return articlePage;
	}
	
	
	/**
	 * 
	 * 
	 * @param page
	 * @param line
	 * @param type  1：开店流程 2：开店技巧 3：干货分享 4：常见问题 5： 网店推广 6:成功案例 7:视频教程
	 * @return
	 */
		public Page getArticlePageByType(String type) {
			Page articlePage = new Page();
			System.out.println();
			String tips = "";
			String error = "";
			int all = 0;
			// ------------------------- 以下访问数据-------------------------
			Connection conn = null;
			CallableStatement call = null;
			ResultSet rs = null;
			CachedRowSetImpl rowset = null;
			try {
				rowset = new CachedRowSetImpl();
				conn = DBM.getInstance().getConnectionByClassForName();
				String countQueury = "SELECT COUNT(*) AS COUNT FROM JSL_ARTICLE WHERE  A_TYPE = "+ type +" AND A_STATUS>0" ;// 创建表SQL语句
				
				String query = "SELECT  * FROM JSL_ARTICLE  WHERE A_TYPE = "+ type +" AND A_STATUS>0 ORDER BY A_TIME DESC" ;// 创建表SQL语句
				Statement stmt = conn.createStatement();// 创建SQL命令对象
				ResultSet countRs  = stmt.executeQuery(countQueury);
				
				if(countRs.next()){
					all = countRs.getInt("COUNT");
				}
				System.out.println();
				rs = stmt.executeQuery(query);
				rowset.populate(rs); // rs转成离线结果集rowset
				rs.close();
//				call.close();
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
				tips = SYS.dbError;
				error = e.getMessage();
				LAB.logs("ARTICLE", error);
				if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
				{
					try {
						rs.close();
						call.close();
						conn.close();
					} catch (Exception e2) {
						error = error + " " + e2.getMessage();// 累加错误信息
					}
				}
				articlePage.setError(error);
			}
			articlePage.setTotalCount(all);
			articlePage.setTips(tips);
			articlePage.setCachedRowSetImpl(rowset);
			return articlePage;
		}
		
	
	
	public Page getArticlePage(int page, int line,String type,String status) {
		Page articlePage = new Page();
		articlePage.setCurrentPage(page);
		articlePage.setPageSize(line);
		String tips = "";
		String error = "";
		int all = 0;
		// ------------------------- 以下访问数据-------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try {
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnectionByClassForName();
			int topIndex = (page-1)*line;
			
			String query = "SELECT TOP "+line+" * FROM JSL_ARTICLE WHERE A_ID NOT IN(SELECT TOP "+topIndex + " A_ID FROM JSL_ARTICLE ORDER BY A_ID ASC) AND A_TYPE = "+ type +" AND A_STATUS="+ status +" ORDER BY A_ID ASC" ;// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(query);

			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
//			call.close();
			conn.close();
			conn = null;
		} catch (Exception e) {
			e.printStackTrace();
			tips = SYS.dbError;
			error = e.getMessage();
			LAB.logs("ARTICLE", error);
			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					rs.close();
					call.close();
					conn.close();
				} catch (Exception e2) {
					error = error + " " + e2.getMessage();// 累加错误信息
				}
			}
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);
		return articlePage;
	}

	public String getArticleCached() throws SQLException {
		String str = (String) Memcached.get("ARTICLEPAGE");
		if (str == null || "".equals(str)) {
			StringBuffer sb = new StringBuffer(100);
			Page articlePage = getArticlePage(1, 10,"3");
			CachedRowSetImpl rs = articlePage.getCachedRowSetImpl();
			while (rs.next()) {
				sb.append("<a href='x/" + LAB.NumberToABC(rs.getString("a_id"))
						+ ".html'>" + rs.getString("a_TITLE") + "</a>");
			}
			rs.close();
			str = sb.toString();
			Memcached.put("ARTICLEPAGE", str, new Date(43200000));
		}

		return str;
	}

	public void insertTestArticle() {
		String sql = "insert into jsl_article";
	}

	public CachedRowSetImpl getArticleRowSet(int id) {
		String tips = "";
		String error = "";
		int all = 0;
		// ------------------------- 以下访问数据-------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try {
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnectionByClassForName();

			String query = "select * from jsl_article where a_id=" + id;// 创建表SQL语句
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(query);
			// rs = (ResultSet) call.getObject(5);
			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
			// call.close();
			conn.close();
			conn = null;
		} catch (Exception e) {
			e.printStackTrace();
			tips = SYS.dbError;
			error = e.getMessage();
			LAB.logs("ARTICLE", error);
			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					rs.close();
					call.close();
					conn.close();
				} catch (Exception e2) {
					error = error + " " + e2.getMessage();// 累加错误信息
				}
			}
		}
		
		return rowset;
	}
	
	public static Article getArtiCleByRs(CachedRowSetImpl rowSet) throws SQLException{
		Article article=null;
		System.out.println(111);
		while (rowSet.next()) {
			article = new Article();
			int id = rowSet.getInt("a_ID");
			String title = rowSet.getString("a_TITLE");
			String type = rowSet.getString("a_TYPE");
			article.setId(id);
			article.setContent(rowSet.getString("a_content"));
			article.setTitle(title);
			article.setType(type);
			break;
		}
		rowSet.previous();
		return article;
	}
	
	
	public static ArrayList<Article> getArticlesByRs(CachedRowSetImpl rowSet) throws SQLException{
		ArrayList<Article> articles = new ArrayList<Article>();
		
		System.out.println(111);
		while (rowSet.next()) {
			Article article = new Article();
			
			int id = rowSet.getInt("a_ID");
			String title = rowSet.getString("a_TITLE");
			String type = rowSet.getString("a_TYPE");
			article.setId(id);
			article.setContent(rowSet.getString("a_content"));
			article.setTitle(title);
			article.setType(type);
			articles.add(article);
		}
		rowSet.previous();
		return articles;
	}
	
	
	public Page getRecommendArticle(int page, int line,String type,int priority) {
		Page articlePage = new Page();
		articlePage.setCurrentPage(page);
		articlePage.setPageSize(line);
		String tips = "";
		String error = "";
		int all = 0;
		// ------------------------- 以下访问数据-------------------------
		Connection conn = null;
		CallableStatement call = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try {
			rowset = new CachedRowSetImpl();
			conn = DBM.getInstance().getConnectionByClassForName();
			int topIndex = (page-1)*line;
			
			String query = "SELECT TOP "+line+" * FROM JSL_ARTICLE WHERE A_ID NOT IN(SELECT TOP "+topIndex + " A_ID FROM JSL_ARTICLE ORDER BY A_TIME DESC) AND A_TYPE = "+ type +" AND A_STATUS=1 AND A_PRIORITY="+ priority +" ORDER BY A_TIME DESC" ;// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(query);

			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
//			call.close();
			conn.close();
			conn = null;
		} catch (Exception e) {
			e.printStackTrace();
			tips = SYS.dbError;
			error = e.getMessage();
			LAB.logs("ARTICLE", error);
			if (conn != null)// 避免二次try (不放在finally块，避免每次if判断)
			{
				try {
					rs.close();
					call.close();
					conn.close();
				} catch (Exception e2) {
					error = error + " " + e2.getMessage();// 累加错误信息
				}
			}
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);
		return articlePage;
	}
	
}
