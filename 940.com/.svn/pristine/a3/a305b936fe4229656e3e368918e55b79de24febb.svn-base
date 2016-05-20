<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp" %>
<%
	Page articlePage=(Page)request.getAttribute("Page");
	CachedRowSetImpl rs=articlePage.getCachedRowSetImpl();
	String un="";
	String title="文章管理";
	if(articlePage.getCurrentPage()>1)
	{
		title="电商资讯 - 第"+articlePage.getCurrentPage()+"页";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title %></title>
<meta name="keywords" content="淘宝网商事,电商创业故事"/>
<meta name="description" content="网商故事，电商故事，尽在此栏目。"/>
<link type="text/css" rel="stylesheet" href="/css/style.css?<%=ver%>" />
<script src="/scripts/fengs.min.js?<%=ver%>"></script>
<link rel="shortcut icon" href="/favicon.ico" />
</head>
<body>
	<% //include file="/inc/header.jsp"  %>
	<div class="wrap sub_wrap">
		<div class="subnav" id="submenu">
			<h2 class="fl">电商资讯</h2>
		</div>
	</div>
	<div class="article">
		<div class="section">
			<ul>
            	<%
            	while(rs.next()){
            		
            		//String content=LAB.clobToString(rs.getClob("a_content"));
            		String content= rs.getString("a_content");
            		
            		content=LAB.getHtml2Text(content).trim();
            		content=content.replace("　", "");
            		content=content.replace("{$seo1}", "");
            		content=content.replace("{$seo2}", "");
            		if(content.length()>90)
            		{
            			content=content.substring(0,90)+"...";
            		}            		
            		//String preview=LAB.replaceNull(rs.getString("a_preview"));
            		String preview="http://d.sududa.com/zixun/2015-8/P_16.jpg";
            	%>
            	<li>
					<a class="imgs" href="<%=LAB.NumberToABC(rs.getString("a_id")) %>.html" target="_blank"><div style="background-image: url(/img/test.jpg);"></div><img src="<%=preview %>" /></a>
					<div class="infos">
						<div class="title">
							<a href="<%="ae/"+LAB.NumberToABC(rs.getString("a_id")) %>.html" target="_blank" class="fl"><b><%=rs.getString("a_TITLE") %></b></a>
							<span class="fr"><%=LAB.StringToDateToString(rs.getString("a_time"), "yyyy-MM-dd",  "yyyy-MM-dd") %></span>
						</div>
						<p><%=content %>   <a  href="<%="ae/"+LAB.NumberToABC(rs.getString("a_id")) %>.html">编辑</a>  <a type="button" href="<%="ad/"+LAB.NumberToABC(rs.getString("a_id")) %>.html">删除</a> </p>
					</div>
					
				</li>
                <%}
            	rs.close();%>   
               </ul>
			<div class="pager">
				<%
            out.write(articlePage.pager("list") );
            	
            out.flush();
            %>
			</div>
			
		</div>
		<div class="slide"></div>
		<div class='clear'></div>
	</div>
	<script>
	$.config({name:"scripts", tag:"<%=ver%>", debug:<%=js_debug%>, path:"/"});
	$(function(){$.use("utils/navbar",function(S){
	})});
	</script>
	<% /*include file="/inc/footer.jsp" */%>
</body>
</html>