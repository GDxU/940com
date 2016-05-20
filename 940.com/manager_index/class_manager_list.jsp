<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//Page articlePage = (Page) request.getAttribute("articlePage");
	int status = SYS.RequestInt(request, "status", 1);
	ArticleManagerDao aManagerDao = new ArticleManagerDao();
	String searchStr = SYS.RequestString(request, "search");
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page articlePage;
		articlePage = aManagerDao.getArticlePageByConditions(searchStr,
				pageNum, 8, status);


	articlePage.setSearchStr(searchStr);
	articlePage.setType(8 + "");

	CachedRowSetImpl rs = articlePage.getCachedRowSetImpl();
	String un = "";
	String title = "文章管理";
	if (articlePage.getCurrentPage() > 1) {
		title = " 第" + articlePage.getCurrentPage() + "页";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link type="text/css" rel="stylesheet" href="/css/style.css?<%=ver%>" />
<script src="/scripts/fengs.min.js?<%=ver%>"></script>
<script type="text/javascript">
	//function search() {
	//	var searchStr = document.getElementById('search').value;
	//	var url = "manager_index.jsp?go=article_manager_list&search=" + searchStr;
	//	window.location.href=url; 
	//}
	function search(){
		
		var searchStr = document.getElementById('search').value;
		var type = document.getElementById('type').value;
		var status = document.getElementById('status').value;
		var url;
		if(searchStr!=null){
		 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search="+searchStr+"&page=<%=page%>";
		}else{
			 url = "manager_index.jsp?go=article_manager_list&status="+ status+"&type="+type+"&search=<%=searchStr%>" +"&page=<%=page%>";
		}
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
		 <br />
		<table border frame=box>
			<tr>
				<td>标题</td>
				<td>时间</td>
				<td><select name="status" id="status" onchange="search()">
						<option value="-2"
							<%if (status == -2)
				out.print("selected");%>>状态</option>
						<option value="1" <%if (status == 1)
				out.print("selected");%>>显示</option>
						<option value="0" <%if (status == 0)
				out.print("selected");%>>隐藏</option>
				</select></td>
				<td>点击</td>
				<td>操作</td>
			</tr>
			<%
				while (rs.next()) {
					String preview = LAB.replaceNull(rs.getString("a_preview"));
					String typeStr = EditUtil.getTypeById(rs.getString("a_type"));
					String statusStr = EditUtil.getStatusById(rs
							.getString("a_status"));
			%>
			<tr>
				<td><a
					href="<%="manager_index.jsp?go=article_edit&do=edit&id="
						+ rs.getString("a_id")%>"
					target="_blank" class="fl"><b><%=rs.getString("a_TITLE")%></b></a></td>
				<td><%=LAB.StringToDateToString(rs.getString("a_time"),
						"yyyy-MM-dd", "yyyy-MM-dd")%></td>
				<td><%=statusStr%></td>
				<td><%=rs.getString("a_click")%></td>
				<td><p>
						<a target="_blank"
							href="<%="manager_index.jsp?go=class_edit&do=edit&id="
						+ rs.getString("a_id")%>">编辑</a>
						
					</p></td>
			</tr>

			<%
				}
				rs.close();
			%>

			<div class="pager">
				<%
					//out.write(articlePage.pager("list"));

					out.flush();
				%>
			</div>
		</table>
		<%
			int totalCount = articlePage.getTotalCount();
			if (totalCount > 0) {
				int pageSize = articlePage.getPageSize();
				int moreCount = totalCount % pageSize;
				int pageCount = 0;

				if (moreCount > 0) {
					pageCount = totalCount / pageSize;
				} else {
					pageCount = totalCount / pageSize + 1;
				}

				for (int i = 1; i <= pageCount + 1; i++) {
					if (i == articlePage.getCurrentPage()) {
		%>
		<a
			href="manager_index.jsp?go=article_manager_list&page=<%=i + "&search=" + articlePage.getSearchStr()
								+ "&type=" + articlePage.getType() + "&status="
								+ status%>"><b><%=i%></b></a>
		<%
			} else {
		%>
		<a
			href="manager_index.jsp?go=article_manager_list&page=<%=i + "&search=" + articlePage.getSearchStr()
								+ "&type=" + articlePage.getType() + "&status="
								+ status%>"><%=i%></a>
		<%
			}
				}
			} else {

			}
		%>
	
</body>
</html>