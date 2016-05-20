package com.chuangdun.jsl.lab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBM {
	private static DBM dbM  = new DBM();
	private static DataSource dataSource;
	private Connection oracle_conn;

	/**
	 * 初始化
	 * **/
	public static DBM getInstance()  //饿汉式，同步？
	{
		if (dbM == null)
		{
			dbM = new DBM();
		}
		return dbM;
	}

	/**
	 * 获取连接池
	 * 
	 * **/
	private DataSource getDataSource() throws NamingException 
	{
		if (dataSource == null) 
		{
			javax.naming.Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/sududa");
		}
		return dataSource;
	}

	
	/**
	 * 用class forname方式获取链接
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	public Connection getConnectionByClassForName() throws ClassNotFoundException, SQLException{
	System.out.println("method: getConnectionByClassForName");
		 String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";//SQL数据库引擎
		
		
		 Class.forName(JDriver);
		  String connectDB=  "jdbc:sqlserver://192.168.16.223:1433;DatabaseName=chuangdun_jsl";//数据源
		  oracle_conn = DriverManager.getConnection(connectDB, "sa", "my007");
//		  String connectDB=  "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=chuangdun_940";//数据源
//		  oracle_conn = DriverManager.getConnection(connectDB, "sa", "My007007_");
		return oracle_conn;
	}
	/**
	 * 获取链接 
	 * 
	 * **/
	public Connection getConnection() throws SQLException, NamingException
	{
		return getDataSource().getConnection();
	}
}
