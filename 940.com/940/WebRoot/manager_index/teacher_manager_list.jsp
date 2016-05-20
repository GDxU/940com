<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.TeacherDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page teacherPage = (Page) request.getAttribute("teacherPage");
	int status = SYS.RequestInt(request, "status", 1);
	TeacherDao aManagerDao = new TeacherDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page teacherPage;
	teacherPage = aManagerDao.getTeacherPage(pageNum, 6,searchStr);
	teacherPage.setSearchStr(searchStr);
	teacherPage.setPageStr("teacher_manager_list");
	CachedRowSetImpl rs = teacherPage.getCachedRowSetImpl();
	String un = "";
%>

<script type="text/javascript">
	function search(){
		
		var searchStr = document.getElementById('search').value;
	//	var type = document.getElementById('type').value;
	//	var status = document.getElementById('status').value;

		var url;
		if(searchStr!=null){
		 url = "manager_index.jsp?go=teacher_manager_list&search="+searchStr+"&page=<%=page%>";
		}else{
			 url = "manager_index.jsp?go=teacher_manager_list&search=<%=searchStr%>" +"&page=<%=page%>";
		}
		window.location.href = url;
	}
	</script>
<div class='r_content'>
			<div class='title'>
				<i class='fl'>图文管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=teacher_edit&do=add">
						添加文章
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" id="search" />
						<input class='but' type="submit" value="" onclick="search()"/>
					</div>
				</div>
			</div>
			<div class='center_cont teacher wrapTable'>
				<table cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<th class='h1'><input type="checkbox" /></th>
							<th width="150">首页头像</th>
							<th width="150">分页头像</th>
							<th width="100">讲师姓名</th>
							<th width="100">等级</th>
							<th width="150">头衔</th>
							<th width="350">简介</th>
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
					
					<%
						while (rs.next()) {
							int id = rs.getInt("id");
							String profileUrl  = rs.getString("profile_img");
							String name = rs.getString("name");
							String title = rs.getString("title");
							String introduction = rs.getString("introduction");
							String profileThumbUrl =rs.getString("profile_thumb");
							String levelStr = EditUtil.getTeacherLevelStr(rs.getInt("t_level"));
					%>
						<tr>
							<td><input type="checkbox" /></td>
							<td><img style="height: 100px" src="<%=profileUrl%>"></td>
							<td><img style="height: 100px" src="<%=profileThumbUrl%>"></td>
							<td><%=name %></td>
							<td><%=levelStr %></td>
							<td><%=title %></td>
							<td><%=introduction %></td>
							<td><a class='revise' href="<%="manager_index.jsp?go=teacher_edit&do=edit&id="
						+ id%>"></a><a class='delete'  onclick= "if(confirm( '是否删除！ ')==false)return   false; " href="<%="../teacherEditSubmit?do=delete&id="
						+ id%>"></a></td>
						</tr>
				    <%
						}rs.close();
				    %>
					</tbody>	
				</table>
				<div class='page'>
						<%=EditUtil.getPageStr(teacherPage, pageNum)			%>
				</div>
			</div>
</div>