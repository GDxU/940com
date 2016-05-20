<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page articlePage = (Page) request.getAttribute("articlePage");
	int type = SYS.RequestInt(request, "type", 0);
	int status = SYS.RequestInt(request, "status", 0);
	
	VideoDao videoDao = new VideoDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page articlePage;
	if (type == 0) {
		articlePage = videoDao.getAllVideoPage(searchStr, pageNum);
	} else {
		articlePage = videoDao.getVideoPageByConditions(searchStr,
				pageNum, type, status);
	}
	articlePage.setPageStr("video_manager_list");
	articlePage.setStatus(status);
	System.out
			.println("current jsp article_manager_list type: " + type + "");

	articlePage.setSearchStr(searchStr);
	articlePage.setType(type + "");

	CachedRowSetImpl rs = articlePage.getCachedRowSetImpl();
	String un = "";
	String title = "文章管理";
	if (articlePage.getCurrentPage() > 1) {
		title = " 第" + articlePage.getCurrentPage() + "页";
	}
%>
<script type="text/javascript">
	function search(){
		var searchStr = document.getElementById('search').value;
		var type = document.getElementById('type').value;
		var status = document.getElementById('status').value;
		var url;
		
		if(searchStr){
		 url = "manager_index.jsp?go=video_manager_list&status="+ status+"&type="+type+"&search="+searchStr+"&page=<%=page%>";
		}else{
			url = "manager_index.jsp?go=video_manager_list&status="+ status+"&type="+type+"&search=<%=searchStr%>" +"&page=<%=pageNum%>";
		}
		window.location.href = url;
	}
</script>
<div class='r_content'>
			<div class='title'>
				<i class='fl'>视频管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=video_edit&do=add">
						添加视频
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" id="search" />
						<input class='but' type="submit" value="" />
					</div>
				</div>
			</div>
			<div class='center_cont wrapTable'>
				<table cellpadding="0" cellspacing="0">
					<thead>
					
						<tr>
							<th class='h1'><input type="checkbox" /></th>
							<th class='h2'>缩略图</th>
							<th class='h3'>标题</th>
							<th>发布时间</th>
							<th>状态
								<select name="status" id="status" onchange="search()">
									
									<option value="1" <%if (status == 1)out.print("selected");%>>显示</option>
									<option value="-1" <%if (status == -1)out.print("selected");%>>隐藏</option>
								</select> 
							</th>
							<th>类型
								<select name="type" id="type" onchange="search()">
									<option value="0"	<%if (type  <0)out.print("selected");%>>全部</option>
									<option value="1" <%if (type == 1)out.print("selected");%>>会员</option>
									<option value="2" <%if (type == 2)out.print("selected");%>>免费</option>
									<option value="3" <%if (type == 3)out.print("selected");%>>热门</option>
									<option value="4" <%if (type == 4)out.print("selected");%>>最新</option>
								</select> 
							</th>
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {
								int  id = rs.getInt("id");
								String preview = LAB.replaceNull(rs.getString("preview"));
								String typeStr = EditUtil.getVideoTypeById(rs.getString("type"));
								String statusStr = EditUtil.getStatusById(rs.getString("status"));
								String a_title = rs.getString("title");
								String time = LAB.StringToDateToString(rs.getString("time"),
										"yyyy-MM-dd", "yyyy-MM-dd");
						%>
						
						<tr>
							<td><input type="checkbox" /></td>
							<td><img  style="width:100px;padding-right:0;" src="<%=preview %>"></td>
							<td class='left'><a href=""><%=a_title %></a></td>
							<td><%=time %></td>
							<td><%=statusStr%></td>
							<td><%=typeStr%></td>
							<td><a class='revise' href="<%="manager_index.jsp?go=video_edit&do=edit&id="
						+ rs.getString("id")%>"></a><a class='delete' href="<%="../videoEditSubmit?do=delete&id="
						+ rs.getString("id")%>"></a></td>
						</tr>
						<%
							}rs.close();
						%>
					</tbody>	
				</table>
				<div class='page'>
					<%=EditUtil.getPageStr(articlePage, pageNum)			%>
				</div>
			</div>
</div>