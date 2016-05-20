<%@page import="com.chuangdun.jsl.lab.HtmlRegexpUtil"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>

<%
	int pageNum = SYS.RequestInt(request, "page", 1);
	ToolArticleDao articleDao = new ToolArticleDao();
	VideoDao videoDao = new VideoDao();
	Page tuiguangPage = articleDao.getArticlePage(pageNum, 8, "5");
	CachedRowSetImpl tuiguangRs = tuiguangPage.getCachedRowSetImpl();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>940-开店技巧</title>
<link rel="stylesheet" type="text/css" href="/style/style.css">
<link rel="stylesheet" type="text/css" href="/style/shop.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='kd_content'>
		<div id="wrapJiqiao">
			<ul class='j_tab_ul'>
				<li><a href="/shop">开店流程</a></li>
				<li><a href="/shop/jiqiao">开店技巧</a></li>
				<li><a href="/shop/fenxiang">干货分享</a></li>
				<li><a href="/shop/wenti">常见问题</a></li>
				<li class='cur'><a href="/shop/tuiguang">网店推广</a></li>
			</ul>
			<ul class='j_list_ul'>
				<%
					while (tuiguangRs.next()) {
						String preview = LAB
								.replaceNull(tuiguangRs.getString("a_preview"));
						String classStr = "";
						int id = tuiguangRs.getInt("a_id");
						String title = tuiguangRs.getString("a_TITLE");
						String time = tuiguangRs.getString("a_TIME").substring(0, 10);
						String click = tuiguangRs.getString("a_click");
						String content=tuiguangRs.getString("a_content");
						content = HtmlRegexpUtil.getTextFromHtml(content);
						if (content.length() > 50)
							content = content.substring(0, 63) + "......";
				%>

				
				<li>
					<p>
						<a href="<%=id+".html"%>"><img src="<%=preview%>"></a>
					</p>
					<dl class='wrapTxtDl'>
						<dt>
							<a href="<%=id+".html"%>"><%=title%></a>
						</dt>
						<div class='txtp'>
							<%=content%>
						</div>
						<dd>
							发表日期：<span><%=time%></span>
						</dd>
						<dd>
							阅读人数：<span><%=click%></span>
						</dd>
					</dl>
				</li>
				<%
					}
					tuiguangRs.close();
				%>

				<h2 style="clear: both;"></h2>
			</ul>
			<div class="tcdPageCode">
			<%=EditUtil.getShopPageStr(tuiguangPage)%>
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>

</body>
</html>