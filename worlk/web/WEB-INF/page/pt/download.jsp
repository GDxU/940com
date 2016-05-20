<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<style>
</style>
</head>
<body>
<div data-role="page" id="userMessage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/index" data-role="none" class="ui-btn-left ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>浩游戏客户端</h1>
		 </div>
	</div>
	<div data-role="main"  class="ui-content">
		<ul data-role="listview" data-inset="true" style="margin-top:0px;">
			<li data-role="divider">欢迎您下载安装</li>
			<li data-icon="arrow-d"><a href="http://mlive.hb161.com" target="_blank"><img src="${staticFileUrl}/images/mlive.jpg"><h2>Android 真人游戏</h2><p>点击下载</p></a></li> 
			<li data-icon="arrow-d"><a href="http://mgames.hb161.com" target="_blank"><img src="${staticFileUrl}/images/mgames.jpg"><h2>Android 老虎机</h2><p>点击下载</p></a></li>
		</ul>
</div>
</body>
</html>