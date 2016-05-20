package com.vinbet.mobile.sys.h2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.nutz.log.Log;
import org.nutz.log.Logs;

import com.vinbet.mobile.sys.h2.util.Cnd;
import com.vinbet.mobile.sys.h2.util.ColMapping;
import com.vinbet.mobile.sys.h2.util.EO;
import com.vinbet.mobile.sys.h2.util.EO.FO;
import com.vinbet.mobile.sys.h2.util.Entity;
import com.vinbet.mobile.sys.h2.util.EntityUtil;
import com.vinbet.mobile.sys.h2.util.SqlCnd;

/**
 * H2内存数据库操作类
 * 
 * @author ray
 * 
 */
public class H2Dao {

	private Log log = Logs.getLog(H2Dao.class);

	public void createTable(Object o) {
		try {
			Entity entity = EntityUtil.toEntity(o);
			String sql = SqlCnd.createTable(entity);
			execSql(sql);
			log.debug("Create table Succeed.");
			for (String s : SqlCnd.createIndex(entity)) {
				execSql(s);
			}
			log.debug("Create index Succeed.");
		} catch (Exception e) {
			log.error("Create table fail!", e.fillInStackTrace());
		}
	}

	public void dropTable(Object o) {
		try {
			Entity entity = EntityUtil.toEntity(o);
			String sql = SqlCnd.dropTable(entity);
			execSql(sql);
			log.debug("Drop table Succeed.");
		} catch (Exception e) {
			log.error("Drop table fail!", e.fillInStackTrace());
		}
	}

	public int insert(Object o) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rc = 0;
		try {
			entity = EntityUtil.toEntity(o);
			String sql = SqlCnd.insert(entity);
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < entity.getCols().size(); i++) {
				Object obj = entity.getCols().get(i).getPojoFieldVal();
				pstmt.setObject(i + 1, obj);
			}
			// log.debug("Exec SQL:" +
			// pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
			rc = pstmt.executeUpdate();
		} catch (Exception e) {
			String es = e.getMessage().toLowerCase();
			if (es.contains("table") && es.contains("not found")) {
				log.warn("Table \"" + entity.getTableName() + "\" not found!! Automatically create it!!");
				try {
					createTable(o);
					rc = insert(o);
				} catch (Exception e1) {
					throw e1;
				}
			} else {
				throw e;
			}
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
		return rc;
	}

	public <T> List<T> select(Class<T> cls, Cnd cnd) throws Exception {
		Entity entity = null;
		List<T> ns = new ArrayList<T>();
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		try {
			ResultSet rs;
			entity = EntityUtil.toEntity(cls.newInstance());
			sql = SqlCnd.selectPfix(entity) + cnd.toSQL();
			conn = H2Mem.getConnection();
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			log.debug("Exec SQL:" + sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				EO eo = EntityUtil.getEO(entity.getCls());
				T n = (T) eo.newInstance();
				for (ColMapping cm : entity.getCols()) {
					FO fo = eo.getFO(cm.getPojoField());
					if (null != fo) {
						fo.set(n, rs.getObject(cm.getTableColumn()));
					}
				}
				ns.add(n);
			}
			return ns;
		} catch (Exception e) {
			String es = e.getMessage().toLowerCase();
			if (es.contains("table") && es.contains("not found")) {
			} else {
				log.error("Error!!! Exec SQL:" + sql);
				throw e;
			}
		} finally {
			try {
				if (null != stmt)
					stmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
		return ns;
	}

	public <T> List<T> select(T o) throws Exception {
		Entity entity = null;
		List<T> ns = new ArrayList<T>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			ResultSet rs;
			entity = EntityUtil.toEntity(o);
			sql = SqlCnd.select(entity);
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			boolean isOk = false;
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
					isOk = true;
				}
			}
			if (isOk) {
				sql = pstmt.toString().substring(pstmt.toString().indexOf(":") + 2);
				log.debug("Exec SQL:" + pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
				rs = pstmt.executeQuery();
				while (rs.next()) {
					EO eo = EntityUtil.getEO(entity.getCls());
					T n = (T) eo.newInstance();
					for (ColMapping cm : entity.getCols()) {
						FO fo = eo.getFO(cm.getPojoField());
						if (null != fo) {
							fo.set(n, rs.getObject(cm.getTableColumn()));
						}
					}
					ns.add(n);
				}
			} else {
				return (List<T>) select(o.getClass(), new Cnd());
			}
			return ns;
		} catch (Exception e) {
			String es = e.getMessage().toLowerCase();
			if (es.contains("table") && es.contains("not found")) {
			} else {
				log.error("Error!!! Exec SQL:" + sql);
				throw e;
			}
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
		return ns;
	}

	public <T> T selectOne(T o) throws Exception {
		List<T> list = this.select(o);
		if (null != list && list.size() != 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public <T> T selectOne(Class<T> cls, Cnd cnd) throws Exception {
		List<T> list = this.select(cls, cnd);
		if (null != list && list.size() != 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public int update(Object o) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			entity = EntityUtil.toEntity(o);
			sql = SqlCnd.update(entity);
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
				}
			}
			sql = pstmt.toString().substring(pstmt.toString().indexOf(":") + 2);
			log.debug("Exec SQL:" + pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int update(Object o, boolean isLog) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			entity = EntityUtil.toEntity(o);
			sql = SqlCnd.update(entity);
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
				}
			}
			sql = pstmt.toString().substring(pstmt.toString().indexOf(":") + 2);
			log.debug("Exec SQL:" + pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int update(Object o, Cnd cnd) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			entity = EntityUtil.toEntity(o);
			sql = SqlCnd.updatePfix(entity) + cnd.toSQL();
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
				}
			}
			sql = pstmt.toString().substring(pstmt.toString().indexOf(":") + 2);
			// log.debug("Exec SQL:" +
			// pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int update(Object o, Cnd cnd, boolean isLog) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			entity = EntityUtil.toEntity(o);
			sql = SqlCnd.updatePfix(entity) + cnd.toSQL();
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
				}
			}
			sql = pstmt.toString().substring(pstmt.toString().indexOf(":") + 2);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int delete(Class<?> cls, Cnd cnd) throws Exception {
		Entity entity = null;
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		try {
			entity = EntityUtil.toEntity(cls.newInstance());
			sql = SqlCnd.deletePfix(entity) + cnd.toSQL();
			conn = H2Mem.getConnection();
			stmt = conn.createStatement();
			// log.debug("Exec SQL:" + sql);
			return stmt.executeUpdate(sql);
		} catch (Exception e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != stmt)
					stmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public int delete(Object o) throws Exception {
		Entity entity = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			entity = EntityUtil.toEntity(o);
			String sql = SqlCnd.delete(entity);
			conn = H2Mem.getConnection();
			pstmt = conn.prepareStatement(sql);
			for (ColMapping cm : entity.getCols()) {
				if (cm.isEnabled()) {
					pstmt.setObject(cm.getPi(), cm.getPojoFieldVal());
				}
			}
			log.debug("Exec SQL:" + pstmt.toString().substring(pstmt.toString().indexOf(":") + 2));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (null != pstmt)
					pstmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public void execSql(String sql) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = H2Mem.getConnection();
			stmt = conn.createStatement();
			// log.debug("Exec SQL:" + sql);
			stmt.execute(sql);
		} catch (SQLException e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != stmt)
					stmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

	public void execSql(String sql, boolean isLog) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = H2Mem.getConnection();
			stmt = conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			log.error("Exec SQL:" + sql);
			throw e;
		} finally {
			try {
				if (null != stmt)
					stmt.close();
				if (null != conn)
					conn.close();
			} catch (Exception e) {
			}
		}
	}

}
