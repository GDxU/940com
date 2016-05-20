package com.chuangdun.jsl.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import com.chuangdun.jsl.bean.FeedBack;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class FeedBackDao {

	
	private static final int LINE = 10;
	private final static String INSERT_SQL = "insert into jsl_feedback (content,time) values (?,?)";
	private final static String UPDATE_SQL = "update jsl_feedback set content=?,time=? where id=?";
	private final static String DELETE_SQL = "delete from jsl_feedback where id=?";

	
	public Page getFeedBackPage(int page, int line,String searchStr) {
		Page feedbackPage = new Page();
		feedbackPage.setCurrentPage(page);
		feedbackPage.setPageSize(line);
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
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_FEEDBACK WHERE CONTENT LIKE '%"+searchStr+"%'";
			
			String query = "SELECT TOP "+line+" * FROM JSL_FEEDBACK WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_FEEDBACK  WHERE CONTENT LIKE '%"+searchStr+"%' ORDER BY time desc)AND CONTENT LIKE '%"+searchStr+"%'  ORDER BY time desc" ;// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("feedback count:" + rs.getInt("COUNT"));
			all =  rs.getInt("COUNT");
			rs = stmt.executeQuery(query);
			rowset.populate(rs); // rs转成离线结果集rowset
			rs.close();
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
			feedbackPage.setError(error);
		}
		feedbackPage.setTotalCount(all);
		feedbackPage.setTips(tips);
		feedbackPage.setCachedRowSetImpl(rowset);
		return feedbackPage;
	}

	public FeedBack getFeedBackById(int id) {
		Connection con = null;
		FeedBack feedback = new FeedBack();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "SELECT * FROM JSL_FEEDBACK WHERE ID =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				feedback.setId(rs.getInt("id"));
				feedback.setContent(rs.getString("content"));
				feedback.setTime(rs.getString("time"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pst != null)
					pst.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return feedback;
	}
	public int insertOrUpdateFeedBack(FeedBack feedBack, String doStr) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		int i=0;
		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			String exeSql= INSERT_SQL;
			if (doStr.equals("edit"))
		    	exeSql = UPDATE_SQL;
			ps = conn.prepareStatement(exeSql);
			ps.setString(1, feedBack.getContent());
			ps.setString(2, feedBack.getTime());
			
			if (doStr.equals("edit")) {
				ps.setInt(3, feedBack.getId());
			}
			
			 i = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {

			e.printStackTrace();
			return 0;
		}
		return i;
	}

	public boolean deleteFeedBack(int id) {
		Connection conn = null;
		//CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;

		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			ps = conn.prepareStatement(DELETE_SQL);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return false;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}finally{
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
}
