<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.chuangdun.jsl.dao.RegInfoDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	Page articlePage = (Page) request.getAttribute("articlePage");
	int pageNum = SYS.RequestInt(request, "page", 1);
	RegInfoDao regInfoDao = new RegInfoDao();

	//int type = SYS.RequestInt(request, "type", 0);
	//int status = SYS.RequestInt(request, "status", 1);
	String searchStr = SYS.RequestString(request, "search");
	Page regInfoPage =regInfoDao.regInfoPage(pageNum, 12, searchStr); //regInfoDao.getRegInfoPage(pageNum, 12);
	regInfoPage.setPageStr("reginfo_manager_list");
	regInfoPage.setSearchStr(searchStr);
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
	
	var url;
	if(searchStr!=null){
		 url = "manager_index.jsp?go=reginfo_manager_list&search="+searchStr+"&page=<%=page%>";
	}else{
		 url = "manager_index.jsp?go=reginfo_manager_list&search=<%=searchStr%>" +"&page=<%=page%>";
	}
	window.location.href = url;
	
	}
</script>
<link rel="shortcut icon" href="/favicon.ico" />
</head>

<body>
  <div class='r_content'>
	   			<div class='title'>
				<i class='fl'>报名管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=reginfo_edit&do=add">
						添加
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
							<th width="500px;">姓名</th>
							<th>电话</th>
							<th>报名时间</th>
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
			<%
				while (regInfoRs.next()) {
					int id = regInfoRs.getInt("id");
					String userName = regInfoRs.getString("user_name");
					String phone = regInfoRs.getString("phone_num");
					String time = regInfoRs.getString("time");
					time = time.substring(0, 10);
			%>
			<tr>
							<td><input type="checkbox" /></td>
							<td><%-- <a href="<%="../gonggao#id="+id%>"> --%><%=userName %><!-- </a> --></td>
							<td><%=phone %></td>
							<td><%=time %></td>
							<td><a class='revise' href="<%="manager_index.jsp?go=reginfo_edit&do=edit&id=" + id%>"></a><a class='delete'  onclick= "if(confirm( '是否删除！ ')==false)return   false; " href="<%=request.getContextPath()+"/enroll?do=delete&from=ht&id=" + id%>"></a></td>
						</tr>
							<%}regInfoRs.close(); %>
					</tbody>
				</table>
				<div class='page'>
					<%=EditUtil.getPageStr(regInfoPage, pageNum)%>
				</div>
			</div>
</div>
			<%-- 
			<tr>
				<td><%=userName%></td>
				<td><%=phone%></td>
				<td><%=time%></td>
				<td>
					<p>
						<a target="_blank"
							href="<%="manager_index.jsp?go=reginfo_edit&do=edit&id=" + id%>">编辑</a>
						<a type="button" onclick= "if(confirm( '是否删除！ ')==false)return   false; "
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
		%> --%>
	
</body>
</html>