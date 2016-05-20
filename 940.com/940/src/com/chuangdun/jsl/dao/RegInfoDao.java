package com.chuangdun.jsl.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.bean.RegInfo;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;
import static com.chuangdun.jsl.lab.Constant.*;

public class RegInfoDao {

	private static final int LINE = 10;
	private final static String INSERT_SQL = "insert into jsl_reginfo(user_name,phone_num,qq) values(?,?,?)";
	private final static String UPDATE_SQL = "update jsl_reginfo set user_name=?,phone_num=?,qq=? where id=?";
	private final static String DELETE_SQL = "delete from jsl_reginfo where id=?";

	
	public Page getRegInfoPage(int page, int line) {
		Page reginfoPage = new Page();
		reginfoPage.setCurrentPage(page);
		reginfoPage.setPageSize(line);
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
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_REGINFO";
			
			String query = "SELECT TOP "+line+" * FROM JSL_REGINFO WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_REGINFO  ORDER BY time desc)   ORDER BY time desc" ;// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("reginfo count:" + rs.getInt("COUNT"));
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
			reginfoPage.setError(error);
		}
		reginfoPage.setTotalCount(all);
		reginfoPage.setTips(tips);
		reginfoPage.setCachedRowSetImpl(rowset);
		return reginfoPage;
	}

	public RegInfo getRegInfoById(int id) {
		Connection con = null;
		RegInfo reginfo = new RegInfo();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select * from jsl_reginfo where id =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				reginfo.setId(rs.getInt("id"));
				reginfo.setPhoneNum(rs.getString("phone_num"));
				
				reginfo.setUserName(rs.getString("user_name"));
				reginfo.setQq(rs.getString("qq"));
				reginfo.setTime(rs.getString("time"));
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
		return reginfo;
	}
	public int insertOrUpdateRegInfo(RegInfo regInfo, String doStr) {
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
			ps.setString(1, regInfo.getUserName());
			ps.setString(2, regInfo.getPhoneNum());
			ps.setString(3, regInfo.getQq());
			if (doStr.equals("edit")) {
				ps.setInt(4, regInfo.getId());
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

	public boolean deleteRegInfo(int id) {
		Connection conn = null;
		CallableStatement call = null;
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
		}
		return true;
	}

	public Page regInfoPage(int page, int line,String searchStr) {
		Page regInfoPage = new Page();
		regInfoPage.setCurrentPage(page);
		regInfoPage.setPageSize(line);
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
			
			String getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_REGINFO ";
			String query = "SELECT TOP "+line+" * FROM JSL_REGINFO WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_REGINFO  ORDER BY ID ASC)  ORDER BY ID ASC" ;
			if(searchStr!=null&&!searchStr.isEmpty()){
				getCountQuery+= " WHERE USER_NAME LIKE '%"+searchStr+"%' OR PHONE_NUM LIKE'%"+searchStr+"%' OR TIME LIKE '%"+searchStr+"%' OR QQ LIKE '%"+searchStr+"%'";
				
				query ="SELECT TOP "+line+"* FROM JSL_REGINFO  WHERE USER_NAME LIKE '%"+searchStr+"%' OR PHONE_NUM LIKE'%"+searchStr+"%' OR TIME LIKE '%"+searchStr+"%' OR QQ LIKE '%"+searchStr+"%' ";
				//query = "SELECT TOP "+line+" * FROM JSL_REGINFO WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_REGINFO WHERE USER_NAME LIKE '%"+searchStr+"%' OR PHONE_NUM LIKE'%"+searchStr+"%' OR TIME LIKE '%"+searchStr+"%' OR QQ LIKE '%"+searchStr+"%' ORDER BY ID ASC) OR USER_NAME LIKE '%"+searchStr+"%' OR PHONE_NUM LIKE'%"+searchStr+"%' OR TIME LIKE '%"+searchStr+"%' OR QQ LIKE '%"+searchStr+"%' ORDER BY ID ASC" ;
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
			regInfoPage.setError(error);
		}
		regInfoPage.setTotalCount(all);
		regInfoPage.setTips(tips);
		regInfoPage.setCachedRowSetImpl(rowset);
		return regInfoPage;
	}
	
}
