
<!doctype html>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
	<link rel="stylesheet" type="text/css" href="/style/style.css">
	<link rel="stylesheet" type="text/css" href="/style/user.css">
	
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='user_content'>
		<div id='wrapUser'>
			<div class='fl l_datum'>
				<div class='user_data'>
					<dl class='user_dl'>
						<dt><span><img></span></dt>
						<dd>
							<a class='enroll' href="javascript:"><i class='icon_bm'></i>报名</a>
						</dd>
						<dd>
							<a id="a_dope" href="javascript:"><i class='icon_xx'></i>消息</a>
						</dd>
						<dd>
							<a id="a_advise" href="javascript:"><i class='icon_jy'></i>建议</a>
						</dd>
					</dl>
					<div class='user_info'>
						<p class='account'>加载中...</p>
						<p>学员：</p>
						<p>编号：</p>
					</div>
					<ul class='user_ul'>
						<li><i class='icon_sj'></i><span></span></li>
						<li><i class='icon_qq'></i><span></span></li>
						<li id="edit" class='edit'><a href="javascript:">编辑个人资料</a><i class='icon_bj'></i></li>
					</ul>
				</div>
				<div class='user_follow'>
					<p class='ewm'>
						<img src="/images/user/ewm.png"><br/>
						微信扫一扫，关注940电商学院
					</p>
					<div class='user_sign'>
						 <div class='enroll'>
						 	
						 </div>
						 <img src="/images/user/user_enroll_txt.png">
					</div>
				</div>
			</div>
			<!-- 右边内容 -->
			<div class='fl r_cont'>
				<ul class='user_tabUl'>
					<li>个人信息</li>
					<li>我的课表</li>
					<li>公告</li>
				</ul>
				<div class='wrap_list' id="wrap_list">
					
			  </div>
			</div>
			<h1 style="clear: both;"></h1>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>

	
	<script type="text/javascript">
		Fengs.use('940/user/user', function(d){d.init();});
	</script>
</body>
</html>