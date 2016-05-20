<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.dao.RegInfoDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page articlePage = (Page) request.getAttribute("articlePage");
	int pageNum = SYS.RequestInt(request, "page", 1);
	RegInfoDao regInfoDao = new RegInfoDao();

	int type = SYS.RequestInt(request, "type", 0);
	int status = SYS.RequestInt(request, "status", 1);
	String searchStr = SYS.RequestString(request, "search");
	Page regInfoPage = regInfoDao.getRegInfoPage(pageNum, 30);
	CachedRowSetImpl regInfoRs = regInfoPage.getCachedRowSetImpl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link type="text/css" rel="stylesheet" href="/css/style.css?<%=ver%>" />
<script src="/scripts/fengs.min.js?<%=ver%>"></script>
<script type="text/javascript">
	function search(){
		
		var searchStr = document.getElementById('search').value;
		var type = document.getElementById('type').value;
		var status = document.getElementById('status').value;
		var url;
		//if(!searchStr){
	//	 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search="+searchStr+"&page=<%=page%>";
	//	}else{
	//		 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search=<%=searchStr%>" +"&page=<%=page%>
	//";
		//	}
		window.location.href = url;
	}
</script>
<link rel="shortcut icon" href="/favicon.ico" />
</head>

<body>
	<%
		//include file="/inc/header.jsp"
	%>
	
	<div>
		<br /> <input type="text" id="search" name="search" value="" /> <input
			type="button" value="搜索" onclick="search()" /><a
			href="manager_index.jsp?go=reginfo_edit&do=add">添加</a> <br /> <br />
		<table border frame=box>
			<tr>
				<td>姓名</td>
				<td>电话</td>
				<td>报名时间</td>
				<td>操作</td>
			</tr>

			<%
				while (regInfoRs.next()) {
					int id = regInfoRs.getInt("id");
					String userName = regInfoRs.getString("user_name");
					String phone = regInfoRs.getString("phone_num");
					String time = regInfoRs.getString("time");
					time = time.substring(0, 10);
			%>
			<tr>
				<td><%=userName%></td>
				<td><%=phone%></td>
				<td><%=time%></td>
				<td>
					<p>
						<a target="_blank"
							href="<%="manager_index.jsp?go=reginfo_edit&do=edit&id=" + id%>">编辑</a>
						<a type="button"
							href="<%="../enroll?do=delete&from=ht&id=" + id%>">删除</a>
					</p>
				</td>
			</tr>
			</tr>
			<%
				}
				regInfoRs.close();
			%>

		</table>

		<%
			int totalCount = regInfoPage.getTotalCount();
			if (totalCount > 0) {
				int pageSize = regInfoPage.getPageSize();
				int moreCount = totalCount % pageSize;
				int pageCount = 0;

				if (moreCount > 0) {
					pageCount = totalCount / pageSize;
				} else {
					pageCount = totalCount / pageSize + 1;
				}
				for (int i = 1; i <= pageCount + 1; i++) {
					if (i == regInfoPage.getCurrentPage()) {
		%>
		<a href="manager_index.jsp?go=reginfo_manager_list&page=<%=i%>"><b><%=i%></b></a>
		<%
			} else {
		%>
		<a href="manager_index.jsp?go=reginfo_manager_list&page=<%=i%>"><b><%=i%></b></a>
		<%
			}
				}
			} else {

			}
		%>
	
</body>
</html>