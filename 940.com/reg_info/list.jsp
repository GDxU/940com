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
	String title="报名表";
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
            		String userName= "";
            		String phoneNum  = "";
            		
            	%>
            	<li>
					<div class="infos">
						<div class="title">
							<b><%=userName %></b>
							<b><%=phoneNum %></b>
							<span class="fr"><%="" %></span>
						</div>
					</div>
			
				</li>
                <%}
            	rs.close();%>   
               </ul>
			<div class="pager">
				<%
       //     out.write(articlePage.pager("list"));
            	
      //      out.flush();
            %>
			</div>
			
		</div>
		<div class="slide"></div>
		<div class='clear'></div>
	</div>
	<% /*include file="/inc/footer.jsp" */%>
</body>
</html>