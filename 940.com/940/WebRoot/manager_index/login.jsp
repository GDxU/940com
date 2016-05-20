<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<!doctype html>
<script type="text/javascript">
	function loadXMLDoc() {
		var xmlhttp;
		var user = document.getElementById('user_name').value;
		var password = document.getElementById('password').value;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				if (xmlhttp.responseText == "success") {
					window.location.href="manager_index.jsp"; 
				} else {
					document.getElementById("tips").innerHTML = xmlhttp.responseText;
				}
			}

		}
	
		xmlhttp.open("GET", "../managerLogin?user_name="+user+"&password="+password,
				true);
		xmlhttp.send();
	}
</script>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940电商学院 - 后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="style/index.css">
</head>
<body>
	<div id="loging">
		<div class='log_center'>
			<form action="../managerLogin">
				<div class='logo'>
					<img src="images/log_logo.png">
				</div>
				<div class='inputBox'>
					<input class='acc_input' name="user_name" id="user_name" type="txt" placeholder="帐号"/>
					<input class='pass_input' name="password" id="password" type="password" placeholder="密码"/>
				</div>
				<div class='log_but'>
					<input type="submit" value="登 录" />
				</div>
				<div id="tips"></div>
			</form>
			<p class='foot'>深圳市九四零教育有限公司&nbsp;&nbsp;&nbsp;&nbsp;粤ICP备15080486号</p>
		</div>
	</div>
</body>
</html>