<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.NoticeDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page noticePage = (Page) request.getAttribute("noticePage");
	NoticeDao aManagerDao = new NoticeDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page noticePage;
	noticePage = aManagerDao.searchNoticePage(pageNum, 12,searchStr);
	
	noticePage.setSearchStr(searchStr);
	noticePage.setPageStr("notice_manager_list");
	CachedRowSetImpl rs = noticePage.getCachedRowSetImpl();
	String un = "";
%>

<script type="text/javascript">
	function search(){
		var searchStr = document.getElementById('search').value;
		
		var url;
		if(searchStr!=null){
			 url = "manager_index.jsp?go=notice_manager_list&search="+searchStr+"&page=<%=page%>";
		}else{
			 url = "manager_index.jsp?go=notice_manager_list&search=<%=searchStr%>" +"&page=<%=page%>";
		}
		window.location.href = url;
	}
</script>

<div class='r_content'>
			<div class='title'>
				<i class='fl'>公告管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=notice_edit&do=add">
						添加公告
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
							<th width="500px;">标题</th>
							<th>发布时间</th>
							<th>作者</th>
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
					<%
						while (rs.next()) {
							int id = rs.getInt("id");
							String author = rs.getString("author");
							String time = LAB.StringToDateToString(rs.getString("time"),
								"yyyy-MM-dd", "yyyy-MM-dd");
							String titleStr = rs.getString("title");
					%>
						<tr>
							<td><input type="checkbox" /></td>
							<td><a href=""><%=titleStr %></a></td>
							<td><%=time %></td>
							<td><%=author %></td>
							<td><a class='revise' href="<%="manager_index.jsp?go=notice_edit&do=edit&id=" + id%>"></a><a class='delete' href="<%="../noticeEditSubmit?do=delete&id=" + id%>"></a></td>
						</tr>
						<%}rs.close(); %>
					</tbody>
				</table>
				<div class='page'>
					<%=EditUtil.getPageStr(noticePage, pageNum)			%>
				</div>
			</div>
</div>