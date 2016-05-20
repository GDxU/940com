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

import com.chuangdun.jsl.bean.Article;
import com.chuangdun.jsl.bean.Video;
import com.chuangdun.jsl.lab.DBM;
import com.chuangdun.jsl.lab.LAB;
import com.chuangdun.jsl.lab.Memcached;
import com.chuangdun.jsl.lab.Page;
import com.chuangdun.jsl.lab.SYS;
import com.sun.rowset.CachedRowSetImpl;

public class VideoDao {

	private final static String INSERT_SQL = "insert into jsl_video(author,title,video_id,preview,time,type,status,a_priority,is_index) values(?,?,?,?,?,?,?,?,?)";
	private final static String UPDATE_SQL = "update jsl_video set author=?,title=?,video_id=?,preview=?,time=?,type=?,status=?,a_priority=?,is_index=? where id=?";
	private final static String DELETE_SQL = "update jsl_video set status=? where id=?";
	private static final int LINE = 10;

	public Page getArticlePage(int page, int line) {
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
			int topIndex = (page - 1) * line;

			String query = "SELECT TOP "
					+ line
					+ " * FROM JSL_ARTICLE WHERE A_ID NOT IN(SELECT TOP "
					+ topIndex
					+ " A_ID FROM JSL_ARTICLE ORDER BY A_ID ASC) ORDER BY A_ID ASC";// 创建表SQL语句
			System.out.println(query);
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
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);
		return articlePage;
	}

	public Page getVideoPageByConditions(String searchStr, int page, int type,
			int status) {
		System.out.println("getVideoPageByConditions() searchStr:" + searchStr
				+ " page:" + page + "  type:" + type + " status: " + status);
		Page articlePage = new Page();
		articlePage.setCurrentPage(page);
		articlePage.setPageSize(LINE);
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
					.prepareCall("{call GET_SEARCH_VIDEO_BY_CONDITION_COUNT(?,?,?,?)}");
			call.setString(1, searchStr);
			call.setInt(2, type);
			call.setInt(3, status);
			call.registerOutParameter(4, java.sql.Types.INTEGER);
			call.execute();
			System.out.println("ALL COUNT:" + call.getInt(4));

			all = call.getInt(4);
			call = conn
					.prepareCall("{call SEARCH_VIDEO_BY_CONDITIONS(?,?,?,?)}");

			call.setString(1, searchStr);
			call.setInt(2, type);
			call.setInt(3, page);
			call.setInt(4, status);
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
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);

		return articlePage;
	}

	public Page getAllVideoPage(String searchStr, int page,int status) {
		System.out.println("getAllArticlePage() searchStr:" + searchStr
				+ " page:" + page);
		Page articlePage = new Page();
		articlePage.setCurrentPage(page);
		articlePage.setPageSize(LINE);
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
			call = conn.prepareCall("{call GET_SEARCH_VIDEO_ALL_COUNT(?,?,?,?)}");
			call.setString(1, searchStr);
			call.setInt(2, page);
			call.registerOutParameter(3, java.sql.Types.INTEGER);
			call.setInt(4, status);
			call.execute();

			
			System.out.println("ALL COUNT:" + call.getInt(3));

			
			all = call.getInt(3);
			call = conn.prepareCall("{call SEARCH_VIDEO_ALL(?,?,?,?)}");
			call.setString(1, searchStr);
			call.setInt(2, page);
			call.setInt(3, 8);
			call.setInt(4, status);
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
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);

		return articlePage;
	}

	public CachedRowSetImpl getVideoRowSet(int id) {
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

			String query = "select * from jsl_video where id=" + id;// 创建表SQL语句
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

	public String getArticleCached() throws SQLException {
		String str = (String) Memcached.get("ARTICLEPAGE");
		if (str == null || "".equals(str)) {
			StringBuffer sb = new StringBuffer(100);
			Page articlePage = getArticlePage(1, 10);
			CachedRowSetImpl rs = articlePage.getCachedRowSetImpl();
			while (rs.next()) {
				sb.append("<a href='x/" + LAB.NumberToABC(rs.getString("id"))
						+ ".html'>" + rs.getString("TITLE") + "</a>");
			}
			rs.close();
			str = sb.toString();
			Memcached.put("ARTICLEPAGE", str, new Date(43200000));
		}

		return str;
	}

	public void insertTestArticle() {
		String sql = "insert into jsl_video";
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

			String query = "select * from jsl_video where id=" + id;// 创建表SQL语句
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

	public Page getRegInfoPage(int page, int line) {
		System.out.println("getRegInfoPage()");
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
			int topIndex = (page - 1) * line;
			String getCountQuery = "SELECT COUNT(USER_NAME) AS COUNT FROM JSL_REGINFO";

			String query = "SELECT TOP " + line
					+ " * FROM JSL_REGINFO WHERE ID NOT IN(SELECT TOP "
					+ topIndex
					+ " ID FROM JSL_REGINFO ORDER BY ID ASC) ORDER BY ID ASC";// 创建表SQL语句
			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("reginfo count:" + rs.getInt("COUNT"));
			all = rs.getInt("COUNT");
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
			articlePage.setError(error);
		}
		articlePage.setTotalCount(all);
		articlePage.setTips(tips);
		articlePage.setCachedRowSetImpl(rowset);
		return articlePage;
	}

	public Page getVideoPage(int page, int line, String type, String order) {
		Page videoPage = new Page();
		videoPage.setCurrentPage(page);
		videoPage.setPageSize(line);
		System.out.println("page:" + page + " line:" + line + " type:" + type
				+ " order:" + order);

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
			String getCountQuery;
			String query;

			if (type != null && !type.equals("4")) {
				getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_VIDEO WHERE TYPE="
						+ type+" AND STATUS>0";
				query = "SELECT TOP " + line
						+ " * FROM JSL_VIDEO WHERE ID NOT IN(SELECT TOP "
						+ topIndex + " ID FROM JSL_VIDEO WHERE TYPE=" + type
						+ " ORDER BY TIME DESC) AND TYPE=" + type
						+ "AND STATUS>0 ORDER BY TIME DESC";// 创建表SQL语句
			} else {
				getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_VIDEO where status>0";
				query = "SELECT TOP "
						+ line
						+ " * FROM JSL_VIDEO WHERE ID NOT IN(SELECT TOP "
						+ topIndex
						+ " ID FROM JSL_VIDEO   ORDER BY TIME DESC) AND STATUS>0  ORDER BY TIME DESC";// 创建表SQL语句
			}

			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("video count:" + rs.getInt("COUNT"));
			all = rs.getInt("COUNT");
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
			videoPage.setError(error);
			videoPage.setStatus(0);
		}
		videoPage.setTotalCount(all);
		videoPage.setTips(tips);
		videoPage.setStatus(1);
		videoPage.setCachedRowSetImpl(rowset);
		return videoPage;
	}
	
	public Page getIndexVideoPage(int page, int line, String type, String order) {
		Page videoPage = new Page();
		videoPage.setCurrentPage(page);
		videoPage.setPageSize(line);
		System.out.println("page:" + page + " line:" + line + " type:" + type
				+ " order:" + order);

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
			String getCountQuery;
			String query;

			if (type != null && !type.equals("4")) {
				getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_VIDEO WHERE STATUS>0 AND IS_INDEX=1";
				query = "SELECT TOP " + line
						+ " * FROM JSL_VIDEO WHERE ID NOT IN(SELECT TOP "
						+ topIndex + " ID FROM JSL_VIDEO WHERE "
						+ " IS_INDEX=1 ORDER BY TIME DESC) "
						+ " AND IS_INDEX=1 AND STATUS>0 ORDER BY TIME DESC";// 创建表SQL语句
			} else {
				getCountQuery = "SELECT COUNT(ID) AS COUNT FROM JSL_VIDEO where status>0";
				query = "SELECT TOP "
						+ line
						+ " * FROM JSL_VIDEO WHERE ID NOT IN(SELECT TOP "
						+ topIndex
						+ " ID FROM JSL_VIDEO AND IS_INDEX=1  ORDER BY TIME DESC) AND AND IS_INDEX=1 STATUS>0  ORDER BY TIME DESC";// 创建表SQL语句
			}

			System.out.println(query);
			Statement stmt = conn.createStatement();// 创建SQL命令对象
			rs = stmt.executeQuery(getCountQuery);
			rs.next();
			System.out.println("video count:" + rs.getInt("COUNT"));
			all = rs.getInt("COUNT");
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
			videoPage.setError(error);
			videoPage.setStatus(0);
		}
		videoPage.setTotalCount(all);
		videoPage.setTips(tips);
		videoPage.setStatus(1);
		videoPage.setCachedRowSetImpl(rowset);
		return videoPage;
	}
	

	public Video getVideoById(String id) {
		Connection con = null;
		Video video = new Video();
		ResultSet rs = null;
		PreparedStatement pst = null;
		try {
			con = DBM.getInstance().getConnectionByClassForName();

			String str = "select * from jsl_video where id =?";
			pst = con.prepareStatement(str);
			pst.setInt(1, Integer.parseInt(id));

			rs = pst.executeQuery();
			while (rs.next()) {
				video.setTitle(rs.getString("title"));
				video.setClick_num(rs.getInt("click_num"));
				video.setVideoId(rs.getString("video_id"));
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
		return video;
	}

	public boolean insertOrUpdateVideo(Video video, String doStr) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println(video);
		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			String exeSql;
			if (doStr.equals(ADD))
				exeSql = INSERT_SQL;
			else
				exeSql = UPDATE_SQL;
			System.out.println(exeSql);
			ps = conn.prepareStatement(exeSql);
			ps.setString(1, video.getAuthor());
			ps.setString(2, video.getTitle());
			ps.setString(3, video.getVideoId());
			ps.setString(4, video.getPreview());
			java.sql.Timestamp ts = new Timestamp(LAB.StringToDate(
					video.getTime(), "yyyy-MM-dd HH:mm:ss").getTime());// 用Date生成一个时间戳
			ps.setTimestamp(5, ts);
			ps.setInt(6, video.getType());
			ps.setInt(7, video.getStatus());
			ps.setInt(8, video.getPriority());
			ps.setInt(9,video.getIsIndexType());
			System.out.println("doStr:" + doStr);
			if (doStr.equals("edit")) {
				ps.setInt(10, video.getId());
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

	public boolean deleteVideo(int id) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println("deleteVideo() id:" + id);

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

	private static final String UPDATE_CLICK_NUM_SQL = "update jsl_video set click_num = (click_num+1) where video_id =?";

	public boolean updateClickNum(String videoId) {
		Connection conn = null;
		CallableStatement call = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CachedRowSetImpl rowset = null;
		System.out.println("updateClickNum() video:" + videoId);
		int i = 0;
		try {
			conn = DBM.getInstance().getConnectionByClassForName();
			ps = conn.prepareStatement(UPDATE_CLICK_NUM_SQL);
			ps.setString(1, videoId);
			i = ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
		return true;

	}

}
