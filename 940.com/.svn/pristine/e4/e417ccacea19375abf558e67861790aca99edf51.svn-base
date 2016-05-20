<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ShareDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page sharePage = (Page) request.getAttribute("sharePage");
	int status = SYS.RequestInt(request, "status", 1);
	ShareDao aManagerDao = new ShareDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page sharePage;
	sharePage = aManagerDao.getSharePage(pageNum, 6);
	sharePage.setSearchStr(searchStr);
	sharePage.setPageStr("share_manager_list");
	CachedRowSetImpl rs = sharePage.getCachedRowSetImpl();
	String un = "";
	String title = "文章管理";
	if (sharePage.getCurrentPage() > 1) {
		title = " 第" + sharePage.getCurrentPage() + "页";
	}
%>

<script type="text/javascript">
	function search(){
		
		var searchStr = document.getElementById('search').value;
		var type = document.getElementById('type').value;
		var status = document.getElementById('status').value;
		var url;
		if(searchStr!=null){
		 url = "manager_index.jsp?go=share_manager_list&status="+ status+"&search="+searchStr+"&page=<%=page%>";
		}else{
			 url = "manager_index.jsp?go=share_manager_list&status="+ status+"&search=<%=searchStr%>" +"&page=<%=page%>";
		}
		window.location.href = url;
	}
</script>

		<div class='r_content'>
			<div class='title'>
				<i class='fl'>图文管理</i>
				<div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=share_edit&do=add">
						添加分享文章
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" />
						<input class='but' type="submit" value="" />
					</div>
				</div>
			</div>
			<div class='center_cont share wrapTable'>
				<table cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<th class='h1'><input type="checkbox" /></th>
							<th class='h2'>头像</th>
							<th width="200">姓名</th>
							<th width="200">帐号</th>
							<th width="200">学期</th>
							<th width="400">内容</th>
							<th>报名时间</th>
							<th>状态
								<select name="status" id="status" onchange="search()">
									<option value="-2"	<%if (status == -2) out.print("selected");%>>全部</option>
						            <option value="1" <%if (status == 1)out.print("selected");%>>显示</option>
						            <option value="0" <%if (status == 0)out.print("selected");%>>隐藏</option>
								</select>
							</th>
							
							<th class='h8'>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (rs.next()) {
								int id = rs.getInt("id");
								String profileUrl  = rs.getString("profile_img");
								String content = rs.getString("a_content");
								String realName = rs.getString("real_name");
								String userName = rs.getString("user_name");
								String period = rs.getString("period");
								String time = rs.getString("time");
								String statusStr = EditUtil.getStatusById(rs
										.getString("status"));
						%>
						
						<tr>
							<td><input type="checkbox" /></td>
							<td><img src="<%=profileUrl%>"></td>
							<td><%=realName %></td>
							<td><%=userName %></td>
							<td>第<%=period %>期</td>
							<td><%=content %></td>
							<td><%=time %></td>
							<td><%=statusStr %></td>
							<td><a class='revise' href="<%="manager_index.jsp?go=share_edit&do=edit&id="+ id%>"></a>
							 <a class='delete' href="<%="../shareSubmit?do=delete&id="+ id%>"></a></td>
						</tr>
						<%}rs.close(); %>
					</tbody>	
				</table>
				<div class='page'>
						<%=EditUtil.getPageStr(sharePage, pageNum)			%>
				</div>
			</div>
		</div>
</html>