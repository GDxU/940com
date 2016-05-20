package com.chuangdun.jsl.dao;

import static com.chuangdun.jsl.lab.Constant.ADD;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import com.chuangdun.jsl.bean.Notice;
import com.chuangdun.jsl.bean.Notice;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class NoticeDao {

	

	private final static String INSERT_SQL = "insert into jsl_notice(title,a_content,author,time) values(?,?,?,?)";
	private final static String UPDATE_SQL = "update jsl_notice set title=?,a_content=?,author=?,time=? where id=?";
	private final static String DELETE_SQL = "update jsl_notice set status=? where id=?";
	

	public Page getNoticePage(int page, int line) {
		Page noticePage = new Page();
		noticePage.setCurrentPage(page);
		noticePage.setPageSize(line);
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
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_NOTICE WHERE STATUS!=-1";
			
			String query = "SELECT TOP "+line+" * FROM JSL_NOTICE WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_NOTICE WHERE STATUS!=-1 ORDER BY ID ASC) AND STATUS!=-1  ORDER BY ID ASC" ;// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("notice count:" + rs.getInt("COUNT"));
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
			noticePage.setError(error);
		}
		noticePage.setTotalCount(all);
		noticePage.setTips(tips);
		noticePage.setCachedRowSetImpl(rowset);
		return noticePage;
	}

	
	public Page searchNoticePage(int page, int line,String searchStr) {
		Page noticePage = new Page();
		noticePage.setCurrentPage(page);
		noticePage.setPageSize(line);
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
			
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_NOTICE WHERE STATUS!=-1";
			String query = "SELECT TOP "+line+" * FROM JSL_NOTICE WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_NOTICE WHERE STATUS!=-1 ORDER BY ID ASC) AND STATUS!=-1  ORDER BY ID ASC" ;
			if(searchStr!=null&&!searchStr.isEmpty()){
				getCountQuery+= " AND TITLE LIKE '%"+searchStr+"%'";
				query = "SELECT TOP "+line+" * FROM JSL_NOTICE WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_NOTICE WHERE STATUS!=-1  AND TITLE LIKE '%"+searchStr+"%' ORDER BY ID ASC) AND STATUS!=-1  AND TITLE LIKE '%"+searchStr+"%' ORDER BY ID ASC" ;
			}
			
			
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("notice count:" + rs.getInt("COUNT"));
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
			noticePage.setError(error);
		}
		noticePage.setTotalCount(all);
		noticePage.setTips(tips);
		noticePage.setCachedRowSetImpl(rowset);
		return noticePage;
	}
	
	
	//删除公告
	public boolean deleteNotice(int id) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println("deleteNotice() id:" + id);

		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			ps = conn.prepareStatement(DELETE_SQL);
			ps.setInt(1, -1);
			ps.setInt(2, id);
			int i = ps.executeUpdate();
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return false;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//添加公告
	public boolean insertOrUpdateNotice(Notice notice, String doStr) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			String exeSql;
			if (doStr.equals(ADD))
				exeSql = INSERT_SQL;
			else
				exeSql = UPDATE_SQL;
			System.out.println(exeSql);
			ps = conn.prepareStatement(exeSql);
			ps.setString(1, notice.getTitle());
			ps.setString(2, notice.getContent());
			ps.setString(3, notice.getAuthor());
			java.sql.Timestamp ts = new Timestamp(LAB.StringToDate(
					notice.getTime(), "yyyy-MM-dd HH:mm:ss").getTime());// 用Date生成一个时间戳
			ps.setTimestamp(4, ts);
			System.out.println("doStr:" + doStr);
			if (doStr.equals("edit")) {
				ps.setInt(5, notice.getId());
			}
			int i = ps.executeUpdate();
			System.out.println(i);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return false;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	
	public Notice getLast(int id){
		Connection con = null;
		Notice notice = new Notice();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select top 1 * from jsl_notice where id<? order by id DESC";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				notice.setId(rs.getInt("id"));
				notice.setTitle(rs.getString("title"));
//				notice.setContent(rs.getString("a_content"));
				notice.setAuthor(rs.getString("author"));
				notice.setTime(rs.getString("time"));
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
		return notice;
	}
	
	
	public Notice getNext(int id){
		Connection con = null;
		Notice notice = new Notice();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select top 1 * from jsl_notice where id>? order by id ASC";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				notice.setId(rs.getInt("id"));
				notice.setTitle(rs.getString("title"));
//				notice.setContent(rs.getString("a_content"));
				notice.setAuthor(rs.getString("author"));
				notice.setTime(rs.getString("time"));
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
		return notice;
	}
	
	public Notice getNoticeById(int id) {
		Connection con = null;
		Notice notice = new Notice();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select * from jsl_notice where id =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				notice.setId(rs.getInt("id"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("a_content"));
				notice.setAuthor(rs.getString("author"));
				notice.setTime(rs.getString("time"));
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
		return notice;
	}
	
}
