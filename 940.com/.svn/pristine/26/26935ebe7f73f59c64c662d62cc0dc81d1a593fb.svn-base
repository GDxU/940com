<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.dao.FeedBackDao"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>

<%
	//Page articlePage = (Page) request.getAttribute("articlePage");
	int pageNum = SYS.RequestInt(request, "page", 1);
	FeedBackDao feedBackDao = new FeedBackDao();

	int type = SYS.RequestInt(request, "type", 0);
	int status = SYS.RequestInt(request, "status", 1);
	String searchStr = SYS.RequestString(request, "search");
	Page feedBackPage = feedBackDao.getFeedBackPage(pageNum, 8,searchStr);
	feedBackPage.setSearchStr(searchStr);
	feedBackPage.setPageStr("feedback_manager_list");
	CachedRowSetImpl feedBackRs = feedBackPage.getCachedRowSetImpl();
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
	
		var url;
		if(searchStr!=null){
			 url = "manager_index.jsp?go=feedback_manager_list&search="+searchStr+"&page=<%=page%>";
			}else{
				 url = "manager_index.jsp?go=feedback_manager_list&search=<%=searchStr%>" +"&page=<%=page%>";
			}
	window.location.href = url;
	}
</script>
<link rel="shortcut icon" href="/favicon.ico" />
</head>

<body>
	<div class='r_content'>
	   			<div class='title'>
				<i class='fl'>反馈管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=feedback_edit&do=add">
						添加反馈
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" id="search" name="search"  />
						<input class='but' type="submit" value="" onclick="search()" />
					</div>
				</div>
			</div>
			<div class='center_cont notice wrapTable'>
				<table cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<th class='h1'><input type="checkbox" /></th>
							<th width="500px;">内容</th>
							<th>发布时间</th>
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
			<%
				while (feedBackRs.next()) {
					int id = feedBackRs.getInt("id");
					String content = feedBackRs.getString("content");
					String time = feedBackRs.getString("time");
					time = time.substring(0, 10);
			%>
			<tr>
							<td><input type="checkbox" /></td>
							<td><%-- <a href="<%="../gonggao#id="+id%>"> --%><%=content %><!-- </a> --></td>
							<td><%=time %></td>
							<td><a class='delete'  onclick= "if(confirm( '是否删除！ ')==false)return   false; " href="<%=request.getContextPath()+"/feedback?do=delete&from=ht&id=" + id%>"></a></td>
						</tr>
							<%}feedBackRs.close(); %>
					</tbody>
				</table>
				<div class='page'>
					<%=EditUtil.getPageStr(feedBackPage, pageNum)%>
				</div>
			</div>
</div>
	
</body>
</html>