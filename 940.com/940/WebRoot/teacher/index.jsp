<%@page import="com.chuangdun.jsl.dao.NoticeDao"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.dao.*"%>
<%@page import="com.chuangdun.jsl.bean.Article"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	//讲师
	TeacherDao teacherDao = new TeacherDao();
	int pageNum = SYS.RequestInt(request, "page", 1);
	Page teacherPage = teacherDao.getTeacherPage(pageNum, 6,"");
	CachedRowSetImpl teacherRs = teacherPage.getCachedRowSetImpl();
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>940-讲师团队</title>
<link rel="stylesheet" type="text/css" href="/style/style.css">
<link rel="stylesheet" type="text/css" href="/style/teacher.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='js_content'>

		<div id="wrapTeacher">
			<h3 class='ad_teacher'>
				<img src="/images/ad_teacher.jpg">
			</h3>
			<div class='teacher_list'>
				<h2>
					<span>讲师团队</span>
				</h2>
				<ul class='list_ul'>
					<%
						while (teacherRs.next()) {
							String name = teacherRs.getString("name");
							String introduction = teacherRs.getString("introduction");
							String title = teacherRs.getString("title");
							String profileUrl = teacherRs.getString("profile_img");
							String profileThumbUrl =teacherRs.getString("profile_thumb");
							int level  = teacherRs.getInt("t_level");
					%>
					<li>
						<p class='fl tc_tx'>
							<img src="<%=profileThumbUrl %>">
						</p>
						<div class='fl name_txt'>
							<h3><%=name %></h3>
							<p class='p1'>【<%=title %>】</p>
							<p class='p2'>
								<%=introduction %>
							</p>
							<a class="enroll" herf="javascript:">预约讲师</a> <%if(level==1){ %><span class='t_r'></span><%} %>
						</div>
					</li>
					<%
						}
						teacherRs.close();
					%>
					
					<h1 style="clear: both;"></h1>
				</ul>
				<div class="tcdPageCode">
					<%=EditUtil.getShopPageStr(teacherPage)%>
				</div>
				<ul class="but_tab">
					<li><a href="javascript:" class='enroll'>预约讲师</a></li>
					<li class='act'><a href="javascript:" class='enroll'>免费试听</a></li>
					<li><a  href="javascript:" class='enroll'>我要报名</a></li>
				</ul>

			</div>
			<div class="b_state">全部讲师均获得国家电商教师培训资格证，即刻咨询，获取名师在线指导400-1000-940</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
</body>
</html>