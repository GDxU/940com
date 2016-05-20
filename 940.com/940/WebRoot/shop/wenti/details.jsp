<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%
	ToolArticleDao articleDao = new ToolArticleDao();
	VideoDao videoDao = new VideoDao();
	Page wentiPage = articleDao.getArticlePage(1, 12, "4");
	CachedRowSetImpl wentiRs = wentiPage.getCachedRowSetImpl();

	String dostr = "", title = "", type = "", preview = "", author = "", id = "", content = "",keywords="",desc="", time = DateUtil
			.getDateTime();
	int click = 0;
	int status = 1;
	CachedRowSetImpl article = null;
	String doWhat = SYS.RequestString(request, "do");
	int idInt = SYS.RequestIntByAttribute(request, "id", 0);
	article = articleDao.getArticleRowSet(idInt);

	article.next();
	type = article.getString("a_type");
	title = article.getString("a_title");
	//String content=LAB.clobToString(article.getClob("a_content"));
	content = article.getString("a_content");
	click = article.getInt("a_click");
	time = LAB.StringToDateToString(article.getString("A_TIME"),
			"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");

	author = LAB.replaceNull(article.getString("a_author"));
	preview = article.getString("a_preview");
	id = article.getString("a_id");
	status = article.getInt("a_status");
	keywords=article.getString("a_keywords");
	desc=article.getString("a_desc");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>940-开店技巧</title>
<meta name="keywords" content="<%=keywords %>" />
<meta name="description" content="<%=desc %>"/>
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
				<li class='cur'><a href="/shop/wenti">常见问题</a></li>
				<li><a href="/shop/tuiguang">网店推广</a></li>
			</ul>
			<div class='j_details'>
				<div class='fl l_hot'>
					<div class="k_hot">
						<h1>热门排行</h1>
						<ul class="top5box">
							<%
								int position = 1;
								while (wentiRs.next()) {
									String listPreview = LAB.replaceNull(wentiRs
											.getString("a_preview"));
									String listTitle = wentiRs.getString("a_title");
									String listAuthor = wentiRs.getString("a_author");
									String listTime = wentiRs.getString("a_time").substring(0, 10);
									int listId = wentiRs.getInt("a_id");
									String classStr = "";
									if (position <= 5)
										classStr = "hover";
							%>
							<li class="<%=classStr%>">
								<div class="pic">
									<a href="<%=listId+".html"%>"><img
										src="<%=listPreview%>"></a>
								</div>
								<div class="title">
									<i><%=position%></i><a href="<%=listId+".html"%>"><%=listTitle%></a>
								</div> <span>时间：<%=listTime%></span>
							</li>
							<%
								position++;
								}
								wentiRs.close();
							%>
						</ul>
					</div>
				</div>
				<div class='fl r_cont_txt'>
					<div class='txtTitle'>
						<h1><%=title%></h1>
						<div class='boot'>
							<div class='wrapfx' style="display: inline-block;">
								<span>时间：<%=time%></span>| <span>发布：<%=author%></span>| <span>分享到：</span>
								<div class="bdsharebuttonbox" data-tag="share_1">
									<a class="bds_weixin" data-cmd="weixin"></a> <a
										class="bds_qzone" data-cmd="qzone" href="#"></a> <a
										class="bds_tqq" data-cmd="tqq"></a> <a class="bds_tsina"
										data-cmd="tsina"></a> <a class="bds_renren" data-cmd="renren"></a>
									<a class="bds_sqq" data-cmd="sqq"></a> <a class="bds_tieba"
										data-cmd="tieba"></a> <a class="bds_more" data-cmd="more"></a>
								</div>
							</div>
						</div>
					</div>
					<div class='show_cont'>

						<%=content%>

					</div>


				</div>
				<h1 style="clear: both;"></h1>
			</div>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>

	<script type="text/javascript">
		var top5box = $('.top5box li:gt(3)');
		var tLi = $('.top5box li');
		top5box.mouseover(function() {
			$(this).addClass('hover').siblings().removeClass('hover');
			$('.top5box li:lt(4)').addClass('hover');
		});
		with (document)
			0[(getElementsByTagName('head')[0] || body)
					.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='
					+ ~(-new Date() / 36e5)];
	</script>
</body>
</html>