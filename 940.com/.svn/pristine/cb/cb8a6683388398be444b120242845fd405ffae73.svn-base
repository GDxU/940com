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

import com.chuangdun.jsl.bean.Teacher;
import com.chuangdun.jsl.bean.Teacher;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class TeacherDao {

	

	private final static String INSERT_SQL = "insert into jsl_teacher(name,title,introduction,profile_img,profile_thumb,priority,t_level) values(?,?,?,?,?,?,?)";
	private final static String UPDATE_SQL = "update jsl_teacher set name=?,title=?,introduction=?,profile_img=?,profile_thumb=?,priority=?,t_level=? where id=?";
	private final static String DELETE_SQL = "delete from jsl_teacher  where id=?";
	public Page getTeacherPage(int page, int line ) {
		Page teacherPage = new Page();
		teacherPage.setCurrentPage(page);
		teacherPage.setPageSize(line);
		
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
			String getCountQuery="SELECT COUNT(ID) AS COUNT FROM JSL_TEACHER ";
			String query ="SELECT TOP "+line+"* FROM JSL_TEACHER WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_TEACHER  ORDER BY ID ASC)  ORDER BY ID ASC";
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			all =  rs.getInt("COUNT");
		//	System.out.println("所有的:"+all);
			rs = stmt.executeQuery(query);
			rowset.populate(rs); // rs转成离线结果集rowset
			teacherPage.setStatus(1);
			rs.close();
			conn.close();
			conn = null;
			tips=SYS.doSuccess;
		} catch (Exception e) {
			
			System.out.println(1111111);
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
			teacherPage.setStatus(-1);
			teacherPage.setError(error);
		}
		teacherPage.setTotalCount(all);
		teacherPage.setTips(tips);
		teacherPage.setCachedRowSetImpl(rowset);
		return teacherPage;
	}

	public Page getTeacherPage(int page, int line ,String searchStr) {
		Page teacherPage = new Page();
		teacherPage.setCurrentPage(page);
		teacherPage.setPageSize(line);
		
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
			String getCountQuery="SELECT COUNT(ID) AS COUNT FROM JSL_TEACHER ";
			String query ="SELECT TOP "+line+"* FROM JSL_TEACHER WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_TEACHER  ORDER BY ID ASC)  ORDER BY ID ASC";
			if(searchStr!=null&&!searchStr.isEmpty()){
			 getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_TEACHER WHERE NAME LIKE'%"+searchStr+"%' OR INTRODUCTION LIKE'%"+searchStr+"%' OR TITLE LIKE'%"+searchStr+"%'";
			
			 query = "SELECT TOP "+line+" * FROM JSL_TEACHER WHERE ID NOT IN(SELECT TOP "+topIndex + " ID FROM JSL_TEACHER WHERE NAME LIKE'%"+searchStr+"%' OR INTRODUCTION LIKE'%"+searchStr+"%' OR TITLE LIKE'%"+searchStr+"%' ORDER BY ID ASC)AND NAME LIKE'%"+searchStr+"%' OR INTRODUCTION LIKE'%"+searchStr+"%' OR TITLE LIKE'%"+searchStr+"%' ORDER BY ID ASC " ;// 创建表SQL语句
			}
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			all =  rs.getInt("COUNT");
		//	System.out.println("所有的:"+all);
			rs = stmt.executeQuery(query);
			rowset.populate(rs); // rs转成离线结果集rowset
			teacherPage.setStatus(1);
			rs.close();
			conn.close();
			conn = null;
		} catch (Exception e) {
			
			System.out.println(1111111);
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
			teacherPage.setStatus(-1);
			teacherPage.setError(error);
		}
		teacherPage.setTotalCount(all);
		teacherPage.setTips(tips);
		teacherPage.setCachedRowSetImpl(rowset);
		return teacherPage;
	}

	
	//删除公告
	public boolean deleteTeacher(int id) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println("deleteTeacher() id:" + id);

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
	
	//添加公告
	public boolean insertOrUpdateTeacher(Teacher teacher, String doStr) {
		
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
//			System.out.println(teacher);
			ps = conn.prepareStatement(exeSql);
			
			ps.setString(1, teacher.getName());
			ps.setString(2, teacher.getTitle());
			ps.setString(3, teacher.getIntroduction());
			ps.setString(4, teacher.getProfileUrl());
			ps.setString(5, teacher.getProfileThumbUrl());
			ps.setInt(6, teacher.getPriority());
			ps.setInt(7, teacher.getLevel());
			if (doStr.equals("edit")) {
				ps.setInt(8, teacher.getId());
			}
			int i = ps.executeUpdate();
			System.out.println(i);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
			return false;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		} 
		return true;
	}
	
	
	public Teacher getTeacherById(int id) {
		Connection con = null;
		Teacher teacher = new Teacher();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select * from jsl_teacher where id =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, id);

			rs = pst.executeQuery();
			while (rs.next()) {
				teacher.setId(rs.getInt("id"));
				teacher.setTitle(rs.getString("title"));
				teacher.setName(rs.getString("name"));
				teacher.setYy(rs.getString("yy"));
				teacher.setIntroduction(rs.getString("introduction"));
				teacher.setProfileUrl(rs.getString("profile_img"));
				teacher.setProfileThumbUrl(rs.getString("profile_thumb"));
				teacher.setPriority(rs.getInt("priority"));
				teacher.setLevel(rs.getInt("t_level"));
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
		return teacher;
	}
	
}
