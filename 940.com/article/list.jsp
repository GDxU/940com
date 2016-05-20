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
	String title="客户达 - 电商资讯";
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
            		String preview=LAB.replaceNull(rs.getString("a_preview"));
            	%>
            	<li>
					<a class="imgs" href="<%="a/"+LAB.NumberToABC(rs.getString("a_id")) %>.html" target="_blank"><img src=<%=preview%> /></a>
					<div class="infos">
						<div class="title">
							<a href="<%="a/"+LAB.NumberToABC(rs.getString("a_id")) %>.html" target="_blank" class="fl"><b><%=rs.getString("a_TITLE") %></b></a>
							<span class="fr"><%=LAB.StringToDateToString(rs.getString("a_time"), "yyyy-MM-dd",  "yyyy-MM-dd") %></span>
						</div>
						<p><%=content %></p>
					</div>
				</li>
                <%}
            	rs.close();%>   
               </ul>
			<div class="pager">
				<%
            out.write(articlePage.pager("list"));
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