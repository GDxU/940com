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

import com.chuangdun.jsl.bean.Share;
import com.chuangdun.jsl.bean.Share;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class ShareDao {

	private final static String INSERT_SQL = "insert into jsl_share(title,a_content,user_name,real_name,status,profile_img,period,gender,time) values(?,?,?,?,?,?,?,?,?)";
	private final static String UPDATE_SQL = "update jsl_share set title=?,a_content=?,user_name=?,real_name=?,status=?,profile_img=?,period=?,gender=?,time=? where id=?";
	private final static String DELETE_SQL = "update jsl_share set status=? where id=?";

	public Page getSharePage(int page,int line,String searchStr,int status){
		Page sharePage = new Page();
		sharePage.setCurrentPage(page);
		sharePage.setPageSize(line);
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
			call = conn
					.prepareCall("{call GET_SEARCH_SHARE_COUNT(?,?,?,?)}");
			call.setString(1, searchStr);
			call.setInt(2, page);
			call.registerOutParameter(3, java.sql.Types.INTEGER);
			call.setInt(4, status);
			call.execute();
			System.out.println("ALL COUNT:" + call.getInt(3));

			all = call.getInt(3);
			call = conn.prepareCall("{call SEARCH_SHARE_BY_CONDITIONS(?,?,?,?)}");
			call.setString(1, searchStr);
			call.setInt(2, page);
			call.setInt(3, status);
			call.setInt(4, line);
			rs = call.executeQuery();
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
			sharePage.setError(error);
		}
		sharePage.setTotalCount(all);
		sharePage.setTips(tips);
		sharePage.setCachedRowSetImpl(rowset);

		return sharePage;
	}
	
	public Page getSharePage(int page,int line ,String searchStr){
	Page getSharePage = new Page();
	getSharePage.setCurrentPage(page);
	getSharePage.setPageSize(line);
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
		String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_SHARE WHERE STATUS!=-1 ";
		String query = "SELECT TOP "+line+" * FROM JSL_SHARE WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_SHARE WHERE STATUS!=-1 ORDER BY ID ASC)AND STATUS!=-1  ORDER BY ID ASC" ;
		if(searchStr!=null&&!searchStr.isEmpty()){
			getCountQuery+= "AND REAL_NAME LIKE '%"+searchStr+"%' OR USER_NAME LIKE'%"+searchStr+"%' OR A_CONTENT LIKE '%"+searchStr+"%' ";
			
			query ="SELECT TOP "+line+"* FROM JSL_SHARE  WHERE STATUS!=-1 AND REAL_NAME LIKE '%"+searchStr+"%' OR USER_NAME LIKE'%"+searchStr+"%' OR A_CONTENT LIKE '%"+searchStr+"%'";
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
		getSharePage.setError(error);
	}
	getSharePage.setTotalCount(all);
	getSharePage.setTips(tips);
	getSharePage.setCachedRowSetImpl(rowset);
	return getSharePage;
}

	public Page getSharePage(int page, int line) {
		Page sharePage = new Page();
		sharePage.setCurrentPage(page);
		sharePage.setPageSize(line);
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
			int topIndex = (page - 1) * line;
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_SHARE WHERE STATUS!=-1";

			String query = "SELECT TOP "
					+ line
					+ " * FROM JSL_SHARE WHERE ID NOT IN(SELECT TOP "
					+ topIndex
					+ " ID FROM JSL_SHARE WHERE STATUS!=-1 ORDER BY ID ASC) AND STATUS!=-1  ORDER BY ID ASC";// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			all = rs.getInt("COUNT");
			rs = stmt.executeQuery(query);
			rowset.populate(rs); // rs转成离线结果集rowset
			sharePage.setStatus(1);
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
			sharePage.setStatus(-1);
			sharePage.setError(error);
		}
		sharePage.setTotalCount(all);
		sharePage.setTips(tips);
		sharePage.setCachedRowSetImpl(rowset);
		return sharePage;
	}

	// 删除公告
	public boolean deleteShare(int id) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println("deleteShare() id:" + id);

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

	// 添加公告
	public boolean insertOrUpdateShare(Share share, String doStr) {
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

			ps.setString(1, share.getTitle());
			ps.setString(2, share.getContent());
			ps.setString(3, share.getUserName());
			ps.setString(4, share.getRealName());
			ps.setInt(5, share.getStatus());
			ps.setString(6, share.getProfileUrl());
			ps.setString(7, share.getPeriod());
			java.sql.Timestamp ts = new Timestamp(LAB.StringToDate(
					share.getTime(), "yyyy-MM-dd HH:mm:ss").getTime());// 用Date生成一个时间戳
			ps.setInt(8, share.getGender());

			ps.setTimestamp(9, ts);

			if (doStr.equals("edit")) {
				ps.setInt(10, share.getId());
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

	public Share getShareById(int id) {
		Connection con = null;
		Share share = new Share();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select * from jsl_share where id =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				share.setId(rs.getInt("id"));
				share.setStatus(rs.getInt("status"));
				share.setRealName(rs.getString("real_name"));
				share.setUserName(rs.getString("user_name"));
				share.setTitle(rs.getString("title"));
				share.setContent(rs.getString("a_content"));
				share.setTime(rs.getString("time"));
				share.setPeriod(rs.getString("period"));
				share.setProfileUrl(rs.getString("profile_img"));
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
		return share;
	}

}
