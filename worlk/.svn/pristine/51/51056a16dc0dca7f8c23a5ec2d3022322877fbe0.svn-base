<%@page import="com.vinbet.mobile.sys.AppCache"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri= "/WEB-INF/tld/const.tld" prefix="ct" %>
<ct:const className="com.vinbet.mobile.util.Constants" scope="request" var="rsvn"></ct:const>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!doctype html>
<html>
<head>
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
 -->
<script src="${ctx}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/plugin/wow.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
<link rel="stylesheet" href="${ctx}/css/animate.min.css">
<link rel="shortcut icon" href="${ctx}/images/vinbet.ico"></link>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	overflow-x: hidden;
	font-family: "Microsoft Yahei";
}

.dowebok {
	margin: 0 auto;
	text-shadow: none;
}

.dowebok ul {
	list-style-type: none;
}

.dowebok .row {
	font-size: 0;
	text-align: center;
}

.dowebok .wow {
	display: inline-block;
	width: 180px;
	height: 180px;
	margin: 30px 15px 0;
	border-radius: 50%;
	font: 20px/180px "Microsoft Yahei";
	vertical-align: top;
	*display: inline;
	zoom: 1;
	cursor: pointer;
	color: black;
}

.bg-green {
	background: #5bd5a0;
}

.bg-blue {
	background: #1daee9;
}

.bg-purple {
	background: #c843a5;
}

.bg-red {
	background: #eb3980;
}

.bg-yellow {
	background: #ffcc35;
}
</style>
</head>
<body>
<div data-role="page" id="main" style="height: 99.9% !important; position:relative !important; overflow-y: hidden !important;">
	<div data-role="header" data-theme="b">
		<h2>手机平台后台管理</h2>
		<a href="${ctx}/sys/logout" data-ajax="false" data-icon="power" class="ui-btn-right">退出</a>
	</div>
	<div role="main">
		<div class="dowebok">
			<div class="row">
<!-- 				<div class="wow rollIn bg-blue" onclick="javascript:window.location.href='${ctx}/sys/onLineUser'">在线用户(<%=AppCache.onlineUsers.size() %>)</div> -->
				<div class="wow bounceInDown bg-green" onclick='javascript:openUnlockedUserPop();'>解除用户锁定</div>
				<!-- <div class="wow lightSpeedIn bg-purple" onclick='javascript:refreshAgentDomain();'>刷新代理域名</div> -->
				<div class="wow bounceInRight bg-blue" onclick="javascript:refreshFileVer();">刷新静态文件版本</div>
				<div class="wow pulse bg-red" data-wow-iteration="5" data-wow-duration="0.15s"  onclick="javascript:window.location.href='${ctx}/sys/cdn'">静态资源URL</div>
				<div class="wow bounceInDown bg-green" id="appMaintain">应用维护</div>
			</div>
		
			<div class="row">
			<div class="wow rollIn bg-blue" onclick="javascript:window.location.href='${ctx}/sys/cache'">查看内存数据</div>
				<div class="wow lightSpeedIn bg-purple" onclick='javascript:reloadCache();'>热加载内存数据</div>
				<div class="wow rollIn bg-yellow" data-wow-delay="0.5s" onclick="javascript:reloadI18n();">热加载国际化</div>
				<div class="wow pulse bg-red" data-wow-iteration="5" data-wow-duration="0.15s" onclick="javascript:reloadCfg();">热加载配置文件</div>
				
			</div>
		</div>
		<div data-role="popup" id="popupUnlockUser" data-overlay-theme="b" data-theme="a" data-dismissible="false">
			<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<div style="padding:10px 20px;">
				<h2>请输入被锁定用户的用户名：</h2>
				<label for="uname" class="ui-hidden-accessible">用户名:</label>
				<input type="text" name="uname" id="uname" value="" placeholder="用户名" data-theme="a" maxlength="15">
				<button class="ui-btn ui-corner-all ui-shadow ui-btn-a" id="unlockUserBtn">解除锁定</button>
			</div>
		</div>	
		<div data-role="popup" id="singleOrderPop" data-overlay-theme="b" data-theme="a" data-dismissible="false">
			<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
			<div style="padding:10px 20px;">
				<h2>请输入商户(Vinbet)订单号：</h2>
				<label for="orderid" class="ui-hidden-accessible">订单号:</label>
				<input type="text" name="orderid" id="orderid" value="123451431501233" placeholder="请输入订单号" data-theme="a" maxlength="25">
				<button class="ui-btn ui-corner-all ui-shadow ui-btn-a" id="singleOrderBtn">查询状态</button>
			</div>
		</div>			
	</div>
</div>
<script type="text/javascript">
if(!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};

$(function(){
    $('#uname').keyup(function(){
        this.value = this.value.replace(/[^a-zA-Z0-9]/g,'');
    })
});

function refreshAgentDomain(){
	if(confirm("确定要重新加载代理域名？")){
	    $.mobile.loading('show', {
	        text: '加载中...',
	        textVisible: true, 
	        theme: 'a',
	        textonly: false,
	        html: "" 
	    });	
	    	
	    var jqxhr = $.post("${ctx}/sys/refreshAgentDomain", {t: new Date().getTime()}, function (o) {
	    	$.mobile.loading('hide');
			var result = o.r;
		    if (result == 0) {
		    	alert("代理域名加载成功！");
		    }else{
		    	alert("代理域名加载失败！");
		    }
	    }, "json"); 
	     
	    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
	    	window.location.href = "${ctx}/admin";
	    });	     
	    
		jqxhr.always(function() {
		});		    
    }
}

function reloadCache(){
	if(confirm("确定要重新加载内存数据？")){
	    $.mobile.loading('show', {
	        text: '加载中...',
	        textVisible: true, 
	        theme: 'a',
	        textonly: false,
	        html: "" 
	    });	
	    	
	    var jqxhr = $.post("${ctx}/sys/reloadCache", {t: new Date().getTime()}, function (o) {
	    	$.mobile.loading('hide');
			var result = o.r;
		    if (result == 0) {
		    	alert("内存数据加载成功！");
		    }else{
		    	alert("内存数据加载失败！");
		    }
	    }, "json"); 
	     
	    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
	    	window.location.href = "${ctx}/admin";
	    });	     
	    
		jqxhr.always(function() {
		});		    
    }
}

function reloadCfg(){
	if(confirm("确定要加载配置信息？")){
	    var jqxhr = $.post("${ctx}/sys/reloadCfg", {v: new Date().getTime()}, function (o) {
			var result = o.r;
		    if (result == 0) {
		    	alert("配置文件加载成功！");
		    }
	    }, "json");  
	     
	    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
	    	window.location.href = "${ctx}/admin";
	    });		    
    }
}

function reloadI18n(){
	if(confirm("确定要加载国际化？")){
	    var jqxhr = $.post("${ctx}/sys/reloadI18n", {v: new Date().getTime()}, function (o) {
			var result = o.r;
		    if (result == 0) {
		    	alert("国际化加载成功！");
		    }
	    }, "json");  
	     
	    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
	    	window.location.href = "${ctx}/admin";
	    });		    	
	}
}

function refreshFileVer(){
	if(confirm("确定要刷新静态文件版本？")){
	    var jqxhr = $.post("${ctx}/sys/refreshFileVer", {v: new Date().getTime()}, function (o) {
			var result = o.r;
		    if (result == 0) {
		    	alert("静态文件版本更新成功！");
		    }
	    }, "json");  	
	     
	    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
	    	window.location.href = "${ctx}/admin";
	    });		    
	}
}

function openUnlockedUserPop(){
	$("#popupUnlockUser").popup("open");
}

function openSingleOrderPop(){
	$("#singleOrderPop").popup("open");
}

$("#unlockUserBtn").click(function(){
	var uname = $("#uname").val();
	if(uname == ""){
		alert("请输入被锁定用户的用户名！");
		return;
	}
    var jqxhr = $.post("${ctx}/sys/unlockUser", {t: new Date().getTime(), "userName": uname}, function (o) {
		var result = o.r;
	    if (result == 0) {
	    	alert("用户解除锁定成功！");
	    	$("#popupUnlockUser").popup("close");
	    }
    }, "json");  	
	     
    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	window.location.href = "${ctx}/admin";
    });	    
});

$("#singleOrderBtn").click(function(){
	var orderid = $("#orderid").val();
	if(orderid == ""){
		alert("请输入商户订单号！");
		return;
	}
	//$("#singleOrderBtn").button("disable");
    var jqxhr = $.post("${ctx}/fastpay/querySingleOrder", {t: new Date().getTime(), "orderid": orderid}, function (o) {
		var result = o.r;
	    if (result == 0) {
	    	var error_code = o.data.error_code;
	    	if(undefined == error_code){
		    	var sts = o.data.status;
		    	if(sts == 0){
		    		alert("未支付");
		    	}else if(sts == 1){
		    		alert("支付成功");
		    	}else if(sts == 2){
		    		alert("已过期");
		    	}else if(sts == 4){
		    		alert("阻断交易");
		    	}		    	
	    	}else{
	    		alert(o.data.error);
	    	}
	    	//$("#singleOrderPop").popup("close");
	    }else {
	    	alert(o.m);
	    }
    }, "json");  	
	     
    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	window.location.href = "${ctx}/admin";
    });	  
    
    jqxhr.always(function(){
    	//$("#singleOrderBtn").button("enable");
    });  
});
	$("#appMaintain").on("click",function(){
		window.location.href="${ctx}/sys/maintain";
	});
</script>
</body>
</html>
