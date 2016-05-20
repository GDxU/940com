<%@page import="org.apache.tomcat.util.http.Cookies"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.chuangdun.jsl.dao.ArticleManagerDao"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%
	HttpSession httpSession = request.getSession();
	 
	String userName = "";
	String password = "";
	Cookie[] cookies = request.getCookies();
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("SSO")){
			userName = LAB.getSSOStr("user", cookies[i].getValue());
			password = LAB.getSSOStr("password", cookies[i].getValue());
		}
	}
	String go = null;
	System.out.println("userName:" + userName + "password："+password );
	if (userName != null && userName.equals("940") && password != null
			&& password.equals("my007")) {

		String defaultUrl = "article_manager_list.jsp";
		go = SYS.RequestString(request, "go");
		System.out.println(go);
		String type = "";
		String status = "";
		String search  = "";
		String pageNum = "";
		String id = "";
		if (go.equals(""))
			go = defaultUrl;
		else if (go.contains("article_manager")) {
			go += ".jsp";
			
			type = SYS.RequestString(request, "type");
			status = SYS.RequestString(request, "status");
			search = SYS.RequestString(request, "search");
			pageNum = SYS.RequestString(request, "page");
			go += "?type=" + type + "&status=" + status + "&page="
					+ pageNum;
		} else if (go.contains("video_manager")) {
			go += ".jsp";
			type = SYS.RequestString(request, "type");
			status = SYS.RequestString(request, "status");
			pageNum = SYS.RequestString(request, "page");
			go += "?type=" + type + "&status=" + status + "&page="
					+ pageNum;
		} else if (go.contains("article_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}

		}

		else if (go.contains("video_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		} else if (go.contains("notice_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		} else if (go.contains("reginfo_manager_list")) {
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}else if(go.contains("notice_manager_list")){
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}else if(go.contains("share_manager_list")){
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}else if(go.contains("reginfo_manager_list")){
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}else if(go.contains("teacher_manager_list")){
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}else if(go.contains("class_manager_list")){
			go += ".jsp";
			pageNum = SYS.RequestString(request, "page");
			go += "?page=" + pageNum;
		}
		
		
		else if (go.contains("teacher_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		}else if (go.contains("share_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		}else if (go.contains("reginfo_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		}else if (go.contains("class_edit")) {
			go += ".jsp";
			String doStr = SYS.RequestString(request, "do");
			if (doStr.equals("edit")) {
				id = SYS.RequestString(request, "id");
				go += "?do=edit&id=" + id;
			} else {
				go += "?do=add";
			}
		}
		
		System.out.println("1go:" + go);
		
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940电商学院 - 后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="style/index.css">
</head>
<body>

	<div id="header">
		<a class="fl logo" href="">
			<img src="images/logo.png">
		</a>
		<div class='fr admin'>
			<p class='link'>
				<a href="">后台首页</a>|
				<a href="">修改密码</a>|
				<a style="padding-right:0" href="">访问官网</a>
			</p>
			<div class='account'>
				<a href="" class="a1">940.com</a>
				<a href="" class="a2">退出</a>
			</div>
		</div>
	</div>
	<div id="content">
		<div class='fl l_menu'>
			<ul class='menu_ul'>
				<%
					
					String articleStr="",videoStr="",noticeStr="",reginfoStr="",shareStr="",teacherStr="";
					if(go.contains("video")) 
						videoStr = "act";
					else if(go.contains("article"))
						articleStr = "act";
					else if(go.contains("notice"))
						noticeStr = "act";
					else if(go.contains("reginfo"))
						reginfoStr = "act";
					else if(go.contains("share"))
						shareStr = "act";
					else if(go.contains("teacher"))
						teacherStr = "act";
				%>
				<li class='li1'><a class='<%=articleStr %>' href="manager_index.jsp">图文管理</a></li>
				<li class='li2'><a class='<%=videoStr %>' href="manager_index.jsp?go=video_manager_list&type=0&status=1&page=1">视频管理</a></li>
				<li class='li3'><a class='<%=noticeStr %>' href="manager_index.jsp?go=notice_manager_list&status=1&page=1">公告管理</a></li>
				<li class='li4'><a class='<%=reginfoStr %>' href="manager_index.jsp?go=reginfo_manager_list">报名管理</a></li>
				<li class='li5'><a class='<%=shareStr %>' href="manager_index.jsp?go=share_manager_list&page=1">学员分享</a></li>
				<li class='li6'><a class='<%=teacherStr %>' href="manager_index.jsp?go=teacher_manager_list&page=1">讲师管理</a></li>
			</ul>
		</div>
		<%
	if (go != null) {
%>
<jsp:include page="<%=go%>" />

	</div>
</body>
<%
	}
}else{%>
	用户名或密码错误，请重新登录。<a href="login.jsp">确定</a>
<%} %>
</html>