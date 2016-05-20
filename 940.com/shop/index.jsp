<!doctype html>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.*"%>

<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%
	//技巧 2 推广5 干货3
	ToolArticleDao articleDao = new ToolArticleDao();
	Page skillPage = articleDao.getArticlePage(1, 7, "2");
	CachedRowSetImpl skillRs = skillPage.getCachedRowSetImpl();

	Page tuiguangPage = articleDao.getArticlePage(1, 7, "5");
	CachedRowSetImpl tuiguangRs = tuiguangPage.getCachedRowSetImpl();

	Page sharePage = articleDao.getArticlePage(1, 8, "3");
	CachedRowSetImpl shareRs = sharePage.getCachedRowSetImpl();

	//技巧推荐
	Page recommendSkillPage = articleDao.getRecommendArticle(1, 2, "2",
			0);
	CachedRowSetImpl recommendSkillRs = recommendSkillPage
			.getCachedRowSetImpl();

	Page recommendTuiguangPage = articleDao.getRecommendArticle(1, 2,
			"5", 0);
	CachedRowSetImpl recommendTuiguangRs = recommendTuiguangPage
			.getCachedRowSetImpl();

	Page recommendSharePage = articleDao.getRecommendArticle(1, 2, "3",
			0);
	CachedRowSetImpl recommendShareRs = recommendSharePage
			.getCachedRowSetImpl();
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>940-开店指南</title>
<link rel="stylesheet" type="text/css" href="/style/style.css">
<link rel="stylesheet" type="text/css" href="/style/shop.css">
</head>

<body>
	<%@ include file="/inc/header.jsp"%>
	<div id='kd_content'>
		<div id="wrapShop">
			<h2 class='title_txt'>
				<span>开店流程</span> <em>淘宝开店全程讲解，助您轻松开店</em> <a class='fr'
					href="/shop/jiqiao"> 更多>></a>
			</h2>
			<div class='page_link'>
				<div class='wrapLink'>
					<a class='page1' href="/shop/liucheng/page1.html"> <em
						class='iconp'>淘宝账号注册</em> <b></b>
					</a> <a class='page2' href="/shop/liucheng/page2.html"> <em
						class='iconp'>支付宝实名认证</em> <b></b>
					</a> <a class='page3' href="/shop/liucheng/page3.html"> <em
						class='iconp'>身份证认证</em> <b></b>
					</a> <a class='page4' href="/shop/liucheng/page4.html"> <em
						class='iconp'>免费申请开店</em> <b></b>
					</a> <a class='page5' href="/shop/liucheng/page5.html"> <em
						class='iconp'>店铺基础设置</em> <b></b>
					</a> <a class='page6' href="/shop/liucheng/page6.html"> <em
						class='iconp'>淘宝高级营销</em> <b></b>
					</a>
				</div>
			</div>
			<h2 class='title_txt'>
				<span>开店技巧</span> <em>开店技巧实录分享，让您事半功倍</em> <a class='fr'
					href="/shop/jiqiao"> 更多>></a>
			</h2>
			<ul class='kd_list_ul'>
				<li>
					<%
						int sIndex = 1;
						while (recommendSkillRs.next()) {
							int id = recommendSkillRs.getInt("a_id");
							String title = recommendSkillRs.getString("a_TITLE");
							String content = recommendSkillRs.getString("a_content");
							String preview = recommendSkillRs.getString("a_preview");
							content = HtmlRegexpUtil.getTextFromHtml(content);
							if (content.length() > 90)
								content = content.substring(0, 90) + "......";
							if (title.length() > 13)
								title = title.substring(0, 13) + "......";
					%>
					<div class='kd_box'>
						<a class='topa a<%=sIndex++ %>' href="/shop/jiqiao/details.jsp?id=<%=id%>">
							<em class='fl'><img src="<%=preview%>"></em> <span
							class='fl'> <strong>今日推荐</strong><br /> <i><%=title%></i>
						</span>
						</a>
						<div class='txtp'>
							<%=content%>
						</div>
						<a class='linka' href="/shop/jiqiao/details.jsp?id=<%=id%>">查看详情</a>
					</div> <%}	recommendSkillRs.close(); %>
					<dl class='fr kd_dl'>
						<%
							int skillIndex = 0;
							while (skillRs.next()) {
								int id = skillRs.getInt("a_id");
								String title = skillRs.getString("a_TITLE");
								if (skillIndex == 0) {
						%>
						<dt>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dt>
						<%
							} else {
						%>
						<dd>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dd>
						<%
							}
								skillIndex++;
							}
							skillRs.close();
						%>
					</dl>
				</li>
			</ul>
			<h2 class='title_txt'>
				<span>干货分享</span> <em>开店技巧实录分享，让您事半功倍</em> <a class='fr'
					href="/shop/fenxiang"> 更多>></a>
			</h2>
			<ul class='kd_list_ul'>
				<li>
					<%
						while (recommendShareRs.next()) {
							int id = recommendShareRs.getInt("a_id");
							String title = recommendShareRs.getString("a_TITLE");
							String content = recommendShareRs.getString("a_content");
							String preview = recommendShareRs.getString("a_preview");
							content = HtmlRegexpUtil.getTextFromHtml(content);
							if (content.length() > 90)
								content = content.substring(0, 90) + "......";
							if (title.length() > 13)
								title = title.substring(0, 13) + "......";
					%>
					<div class='kd_box'>
						<a class='topa a<%=sIndex++ %>' href="/shop/fenxiang/details.jsp?id=<%=id%>">
							<em class='fl'><img src="<%=preview%>"></em> <span
							class='fl'> <strong>今日推荐</strong><br /> <i><%=title%></i>
						</span>
						</a>
						<div class='txtp'>
							<%=content%>
						</div>
						<a class='linka' href="/shop/fenxiang/details.jsp?id=<%=id%>">查看详情</a>
					</div> <%
 	}
 	recommendShareRs.close();
 %>
					<dl class='fr kd_dl'>
						<%
							int shareIndex = 0;
							while (shareRs.next()) {
								int id = shareRs.getInt("a_id");
								String title = shareRs.getString("a_TITLE");
								if (shareIndex == 0) {
						%>
						<dt>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dt>
						<%
							} else {
						%>
						<dd>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dd>
						<%
							}
								shareIndex++;
							}
							shareRs.close();
						%>
					</dl>
				</li>
			</ul>
			<h2 class='title_txt'>
				<span>网店推广</span> <em>开店技巧实录分享，让您事半功倍</em> <a class='fr'
					href="/shop/tuiguang"> 更多>></a>
			</h2>
			<ul class='kd_list_ul'>
				<li>
					<%
						while (recommendTuiguangRs.next()) {
							int id = recommendTuiguangRs.getInt("a_id");
							String title = recommendTuiguangRs.getString("a_TITLE");
							String content = recommendTuiguangRs.getString("a_content");
							String preview = recommendTuiguangRs.getString("a_preview");
							content = HtmlRegexpUtil.getTextFromHtml(content);
							if (content.length() > 90)
								content = content.substring(0, 90) + "......";
							if (title.length() > 13)
								title = title.substring(0, 13) + "......";
					%>
					<div class='kd_box'>
						<a class='topa a<%=sIndex %>' href="/shop/tuiguang/details.jsp?id=<%=id%>">
							<em class='fl'><img src="<%=preview%>"></em> <span
							class='fl'> <strong>今日推荐</strong><br /> <i><%=title%></i>
						</span>
						</a>
						<div class='txtp'>
							<%=content%>
						</div>
						<a class='linka' href="/shop/tuiguang/details.jsp?id=<%=id%>">查看详情</a>
					</div> <%}	recommendTuiguangRs.close(); %>
					<dl class='fr kd_dl'>
						<%
							int tuiguangIndex = 0;
							while (tuiguangRs.next()) {
								int id = tuiguangRs.getInt("a_id");
								String title = tuiguangRs.getString("a_TITLE");
								if (tuiguangIndex == 0) {
						%>
						<dt>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dt>
						<%
							} else {
						%>
						<dd>
							<a href="/shop/jiqiao/details.jsp?id=<%=id%>"><%=title%></a>
						</dd>
						<%
							}
								tuiguangIndex++;
							}
							tuiguangRs.close();
						%>
					</dl>
				</li>
			</ul>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>

	<script type="text/javascript">
		Fengs.use('940/shop/index', function(d) {
			d.shopInit();
		});
	</script>
</body>
</html>