<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>

<%
	CachedRowSetImpl article=(CachedRowSetImpl)request.getAttribute("rowset");
	article.next();
	String title=article.getString("a_title");
	//String content=LAB.clobToString(article.getClob("a_content"));
	String content=article.getString("a_content");
	String seo1="<span class='goods'><a href='http://www.kehuda.com/'>淘宝查号</a><a href='http://www.kehuda.com/'>淘宝装修教程</a></span>";
	String seo2="<span class='goods'><a href='http://www.kehuda.com/'>淘宝开店流程</a><a href='http://www.kehuda.com/'>创业小项目</a></span>";
	content=content.replace("{$seo1}", seo1);
	content=content.replace("{$seo2}", seo2);
	String author=LAB.replaceNull(article.getString("a_author"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="keywords" content="淘宝网商事,电商创业故事"/>
<meta name="description" content="网商故事，电商故事，尽在此栏目。"/>
<title><%=title %></title>
<link type="text/css" rel="stylesheet" href="/css/style.css?" />
<script src="/scripts/fengs.min.js?"></script>
<link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>
	
	<div class="wrap sub_wrap">
		<div class="subnav" id="submenu">
			<h2 class="fl">电商资讯</h2>
		</div>
	</div>
	<div class="article">
	<div class="section">
            	
           <h1><%=title %></h1>
			<div class="author">
			<%if(!"".equals(author)&&!"N".equals(author)){ %>
			<span><%=author %></span>
			<%} %>
				<span><%=LAB.StringToDateToString(article.getString("a_time"), "yyyy-MM-dd HH:mm:ss",  "yyyy-MM-dd HH:mm:ss") %></span>
				<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=<%=LAB.decode("http://www.kehuda.com/x/"+LAB.NumberToABC(article.getString("a_id"))+".html") %>&title=<%=LAB.decode(title) %>&desc=&summary=<%=LAB.decode("客户达 - 电商资讯") %>" title="分享到QQ空间" target="_blank"><em class="icon share-qq"></em></a>
				&nbsp;<a href="http://service.weibo.com/share/share.php?url=<%=LAB.decode("http://www.kehuda.com/x/"+LAB.NumberToABC(article.getString("a_id"))+".html") %>&title=<%=LAB.decode(title) %>" title="分享到新浪微博" target="_blank"><em class="icon share-weibo"></em></a>
				
			</div>
			<div class="content">
				<%=content %>
			</div>
		</div>
		<div class="slide"></div>
		<div class='clear'></div>
	</div>
<!-- <script>
	$.config({name:"scripts", tag:"", debug:, path:"/"});
	$(function(){$.use("utils/navbar",function(S){
	})});
	</script>
 -->	
</body>
</html>
<%article.close();%>