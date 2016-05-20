<!doctype html>
<html lang="en">
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<title>电商培训 - 用户注册</title>
	<link rel="stylesheet" type="text/css" href="../style/style.css">
	<link rel="stylesheet" type="text/css" href="../style/reg.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='reg_content'>
		 <div id="wrapReg">
			 <h3 class="cont_title">
		 	 	<span class="fl">用户注册</span>
		 	 	<p class="fr">已有账户，<a id="regLoin" href="javascript:">马上登录</a>   或   <a href="/"> 返回首页</a></p>
			 </h3>
			 <div class="center_reg">
			 	<ul class="reg_ul">
			 		<li class='li_input'>
			 			<input id='name' class="input_text" type="text" placeholder="用户名 (邮箱)">
			 			<div class='cue'><i></i><span>用户名格式错误！</span></div>
			 			
			 		</li>
			 		<li class='li_input'>
			 			<input id='password' class="input_text" type="password" placeholder="设置密码 (6-12位)">
			 			<div class='cue poss'>
			 			  <i></i><span>密码格式错误！</span>
			 			</div>
			 			<div class='stren st1'></div>
			 		</li>
			 		<li class='li_input'>
			 			<input id='passwords' class="input_text" type="password" placeholder="确认密码">
			 			<div class='cue poss'>
			 			  <i></i><span>密码不正确！</span>
			 			</div>
			 		</li>
			 		<li class="reg_code li_input">
			 			<input id='validCode' class="input_text" type="text" placeholder="请输入图片中的验证码">
			 			<div class="change_opcity">
			 				<img src="/code.jpeg">
			 				<i title='刷新' class="change_reg"></i>
			 			</div>
			 			<div class="cue">
			 			  <i></i><span>验证码不正确！</span>
			 			</div>
			 		</li>
			 		<!-- <li class="reg_proto">
				 	     <input id="J_agree" type="checkbox" value="" tabindex="5">
				 		 <label for="J_agree">
		                  我已阅读并接受 <a href="">版权声明</a> 和 <a href="">隐私保护</a> 条款
		                </label>
			 		</li> -->
			 		<li class="txt_checkbox reg_checkbox">
							<div class="fl check checked"></div>
							<p class="fl"> 我已阅读并接受 <a href="">版权声明</a> 和 <a href="">隐私保护</a> 条款</p>
					</li>
			 		<li class="reg_submit">
				 	     <input id='submit' type="submit" name="" value="马上注册">
			 		</li>
			 	</ul>
			 	<div id="regBox">
			 		<span class=""></span>
			 	</div>
			 </div>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
	


	<script type="text/javascript">
		Fengs.use('940/reg/index', function(d){d.regFn();});
	</script>
</body>
</html>