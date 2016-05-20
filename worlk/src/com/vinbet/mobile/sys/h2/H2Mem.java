package com.vinbet.mobile.sys.h2;

import java.sql.Connection;
import java.sql.SQLException;

import org.h2.jdbcx.JdbcConnectionPool;

/**
 * H2内存
 * 
 * @author ray
 * 
 */
public class H2Mem {
	private static class Singleton {
		// static final JdbcConnectionPool CP = JdbcConnectionPool.create("jdbc:h2:mem:h2cache", "admin", "admin");
		static final JdbcConnectionPool CP = JdbcConnectionPool.create("jdbc:h2:file:D:/mobile", "admin", "admin");
		//static final JdbcConnectionPool CP = JdbcConnectionPool.create("jdbc:h2:file:/usr/local/mobile", "admin", "admin");
	}

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		try {
			return Singleton.CP.getConnection();
		} catch (SQLException e) {
			throw e;
		}
	}

	/**
	 * 初始化连接池
	 * <ul>
	 * <li><b>count</b>: 最大连接数
	 * <li><b>seconds</b>: 获取连接超时时间,单位秒
	 * </ul>
	 */
	public static void init(int count, int seconds) {
		Singleton.CP.setMaxConnections(count);
		Singleton.CP.setLoginTimeout(seconds);
	}

	private H2Mem() {
	}

	/**
	 * Gets the maximum number of connections to use.
	 * 
	 * @return
	 */
	public static int getMaxConnections() {
		return Singleton.CP.getMaxConnections();
	}

	/**
	 * <pre>
	 * Returns the number of active (open) connections of this pool
	 * This is the number of Connection objects that have been issued by getConnection() for which Connection.close() has not yet been called.
	 * 
	 * @return
	 */
	public static int getActiveConnections() {
		return Singleton.CP.getActiveConnections();
	}
}
