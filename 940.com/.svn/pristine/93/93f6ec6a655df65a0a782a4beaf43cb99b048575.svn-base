<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.ShareDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>


<%
	ToolArticleDao articleDao = new ToolArticleDao();
	Page casePage = articleDao.getArticlePage(1, 6, "6");
	CachedRowSetImpl caseRs = casePage.getCachedRowSetImpl();
	
	
	int pageNum = SYS.RequestInt(request, "page",1);
	ShareDao shareDao = new ShareDao();
	Page sharePage = shareDao.getSharePage(pageNum, 10);
	CachedRowSetImpl sharRs = sharePage.getCachedRowSetImpl();
	
	
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940-成功案例</title>
	<link rel="stylesheet" type="text/css" href="/style/style.css">
	<link rel="stylesheet" type="text/css" href="/style/case.css">
	<link rel="stylesheet" type="text/css" href="/style/layer.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='al_content'>
		<div id="wrapCase">
			<h3 class="ad_case">
				<img src="/images/ad_case.jpg">
			</h3>
			<div class='case_list'>
				<h2><span>成功案例</span></h2>
				<ul class='case_list_ul'>
				
				<%
					while (caseRs.next()) {
						String preview = LAB
								.replaceNull(caseRs.getString("a_preview"));
						String title = caseRs.getString("a_title");
						String author = caseRs.getString("a_author");
						String time = caseRs.getString("a_time").substring(0,10);
						int inCome = caseRs.getInt("a_income");
						int id = caseRs.getInt("a_id");
				%>
				
					<li>
						<p class='fl t_user'><a href="<%=id+".html"%>"><img src="<%=preview %>"></a></p>
						<dl class='fr r_dl'>
							<dt><a href="<%=id+".html"%>"><%=title %></a></dt>
							<dd class='class'><span><%=author %></span><i class='nan'></i></dd>
							<dd class='num'>开店月赚：<em><%=inCome %> RMB</em></dd>
							<dd class='num'>入学日期：<i><%=time %></i></dd>
							<a href="<%=id+".html"%>">查看详情</a>
						</dl>
					</li>
				<%
					}
				caseRs.close();
				%>
					<h1 style="clear: both;"></h1>
				</ul>
				<h2><span>学员分享</span></h2>
				<div class='share_list'>
					 
				 	<div class='fl wrapTx'>
				 		 <ul class='user_ico_ul'></ul>
						 <p class='shaer_but'>换一组</p>
					 </div>
					
					 <div class='fr cont_txt'>
					 	 <div class='s_details'>
					 	 	<div class='s_center'>
					 	 		<p style="width:100%;height:100%;line-height:210px;text-indent: 140px;font-size: 18px;color: #888;">还没有人分享哦~</p>
					 	 	</div>
					 	 	<p class='arrow'><i></i><b></b></p>
					 	 </div>
					 	 <div class='sign_but'>
					 	 	 <a class='enroll' href="javascript:">立即报名</a>
					 	 	 <a id="but_shaer" class="shaer" href="javascript:">我要分享</a>
					 	 </div>
					 </div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="boxs" style="display:none;">
		<div class="sug_cont" id="box_shaer">
			<textarea placeholder="请输入分享内容..." id="saytext" class="textarea"></textarea>
			<div class="biaoqing">
				<span class="fl emotion">添加表情</span>
				<i class="fr">还可以输入 <em>2000</em> 个字</i>
			</div>
			<div class="sub_div">
				<input type="button" class="sub_btn" value="确认分享">
			</div>
			<div class="prompt"></div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	
	<script type="text/javascript">
		Fengs.use('940/case/index', function(d) {d.caseInit();});
	</script>
</body>
</html>