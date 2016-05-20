package com.chuangdun.jsl.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JavaConSQL
{
 public static void main(String[] args)
 {
	 
  String JDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";//SQL数据库引擎
  String connectDB=  "jdbc:sqlserver://localhost:1433;DatabaseName=chuangdun_jsl";//数据源
 try
  {
   Class.forName(JDriver);//加载数据库引擎，返回给定字符串名的类
  }catch(ClassNotFoundException e)
  {
   //e.printStackTrace();
   System.out.println("加载数据库引擎失败");
   System.exit(0);
  }    
  System.out.println("数据库驱动成功");
 
  try
  {
   String user="sa";
   String password="my007";
   Connection con=DriverManager.getConnection(connectDB,user,password);//连接数据库对象
   System.out.println("连接数据库成功");
   Statement stmt=con.createStatement();//创建SQL命令对象
  
   //创建表
   System.out.println("开始创建表");
   String query="create table 测试表(列1 varchar(4),列2 varchar(50))";//创建表SQL语句
   stmt.executeUpdate(query);//执行SQL命令对象
   System.out.println("表创建成功");
     
   //输入数据
   System.out.println("开始插入数据");
   String a1="INSERT INTO 测试表 VALUES('1','我成功了')";//插入数据SQL语句
   String a2="INSERT INTO 测试表 VALUES('2','我qq：11276965')";
   String a3="INSERT INTO 测试表 VALUES('3','我博客：http://blog.163.com/roc_sp/')";
   stmt.executeUpdate(a1);//执行SQL命令对象
   stmt.executeUpdate(a2);  
   stmt.executeUpdate(a3);
   System.out.println("插入数据成功");
  
   //读取数据
   System.out.println("开始读取数据");
   ResultSet rs=stmt.executeQuery("SELECT * FROM 测试表");//返回SQL语句查询结果集(集合)
   //循环输出每一条记录
   while(rs.next())
   {
    //输出每个字段
    System.out.println(rs.getString("列1")+"\t"+rs.getString("列2"));
   }
   System.out.println("读取完毕");
  
   //关闭连接
   stmt.close();//关闭命令对象连接
   con.close();//关闭数据库连接
  }
  catch(SQLException e)
  {
   e.printStackTrace();
   //System.out.println("数据库连接错误");
   System.exit(0);
  }
 }
}