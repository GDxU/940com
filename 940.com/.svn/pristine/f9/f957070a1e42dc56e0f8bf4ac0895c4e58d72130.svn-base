<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page articlePage = (Page) request.getAttribute("articlePage");
	int type = SYS.RequestInt(request, "type", 0);
	int status = SYS.RequestInt(request, "status", 1);
	ArticleManagerDao aManagerDao = new ArticleManagerDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page articlePage;
	if (type == 0) {
		articlePage = aManagerDao.getAllArticlePage(searchStr, pageNum);
	} else {
		articlePage = aManagerDao.getArticlePageByConditions(searchStr,
				pageNum, type, status);
	}
	articlePage.setStatus(status);
	articlePage.setPageStr("article_manager_list");
	System.out
			.println("current jsp article_manager_list type: " + type);

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
		if(searchStr!=null){
		 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search="+searchStr+"&page=<%=1%>";
		}else{
			 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search=<%=searchStr%>" +"&page=<%=1%>";
		}
		
		window.location.href = url;
	}
</script>
<div class='r_content'>
	<div class='title'>
		<i class='fl'>图文管理</i>
		<div class='fr log_search'>
			<a class="fl" href="manager_index.jsp?go=article_edit&do=add"> 添加文章 </a>
			<div class='fr wrapSearch'>
				<input class='text' type="text" id="search" name="search" />
				<input	class='but' type="submit" value="" onclick="search()" />
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
					<th>分类 <select id="type" name="type" onchange="search()">
							<option value="0" <%=type == 0 ? "selected" : ""%>>全部</option>
							<option value="1" <%=type == 1 ? "selected" : ""%>>开店流程</option>
							<option value="2" <%=type == 2 ? "selected" : ""%>>开店技巧</option>
							<option value="3" <%=type == 3 ? "selected" : ""%>>干货分享</option>
							<option value="4" <%=type == 4 ? "selected" : ""%>>常见问题</option>
							<option value="5" <%=type == 5 ? "selected" : ""%>>网店推广</option>
							<option value="6" <%=type == 6 ? "selected" : ""%>>成功案例</option>
					</select>
					</th>
					<th>发布时间</th>
					<th>状态 <select name="status" id="status" onchange="search()">
							<option value="-2"
								<%if (status == -2)
								out.print("selected");%>>状态</option>
							<option value="1"
								<%if (status == 1)
								out.print("selected");%>>显示</option>
							<option value="0"
								<%if (status == 0)
								out.print("selected");%>>隐藏</option>
					</select>
					</th>
					<th>点击次数</th>
					<th class='h8'>操作</th>
				</tr>
			</thead>
			<tbody>

				<%
					while (rs.next()) {
						String preview = LAB.replaceNull(rs.getString("a_preview"));
						String typeStr = EditUtil.getTypeById(rs.getString("a_type"));
						String a_title = rs.getString("a_TITLE");
						String time = LAB.StringToDateToString(rs.getString("a_time"),
								"yyyy-MM-dd", "yyyy-MM-dd");
						
						String statusStr = EditUtil.getStatusById(rs
							.getString("a_status"));
						String clickNum = rs.getString("a_click");
					%>
				<tr>
					<td><input type="checkbox" /></td>
					<td><img src="<%=rs.getString("a_preview")%>"></td>
					<td class='left'><a href="<%="manager_index.jsp?go=article_edit&do=edit&id="
						+ rs.getString("a_id")%>"><%=a_title %></a></td>
					<td><%=typeStr %></td>
					<td><%=time %></td>
					<td><%=statusStr %></td>
					<td><%=clickNum %></td>
					<td><a class='revise'
						href="<%="manager_index.jsp?go=article_edit&do=edit&id="
						+ rs.getString("a_id")%>"></a><a
						class='delete'
						href="<%="../articleEditSubmit?do=delete&id="
						+ rs.getString("a_id")%>"></a></td>
				</tr>
				<%	}	rs.close();%>
			</tbody>
		</table>
		<div class='page'>
			<%=EditUtil.getPageStr(articlePage, pageNum)			%>
		</div>
	</div>
</div>