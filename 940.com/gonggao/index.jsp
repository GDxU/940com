<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.NoticeDao"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%

//公告
	NoticeDao noticeDao = new NoticeDao();
	Page noticePage;
	noticePage = noticeDao.getNoticePage(1, 20);
	CachedRowSetImpl noticeRs = noticePage.getCachedRowSetImpl();
	
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940 - 公告</title>
	<link rel="stylesheet" type="text/css" href="/style/style.css">
	<link rel="stylesheet" type="text/css" href="/style/gonggao.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>
	<div id="gg_conent">
		<div id="wrapGonggao">
			<h2>940公告</h2>
			<div class="gonggao">
				<ul>
				<%
						while (noticeRs.next()) {
											int noticeId = noticeRs.getInt("id");
											String title = noticeRs.getString("title");
											String noticeTime=noticeRs.getString("time").substring(0,10);
											String author = noticeRs.getString("author");
											String content = noticeRs.getString("a_content");
					%>
					<li value="<%=noticeId %>">
						<div class='title' >
							<b class='fl'><%=title %></b>
							<span class='fr'>
								<%=noticeTime %> |  <%=author %>
							</span>
						</div>
						<div class='content'>
							<p>
								<%=content %>
							</p>
						</div>
					</li>
					<%
						}
								noticeRs.close();
					%>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>

	<script type="text/javascript">
		Fengs.use('940/utils/gonggao');
	</script>
</body>
</html>