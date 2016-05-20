<!--------------------------------开奖结果---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/result_skin.css">
<script src="${staticFileUrl}/js/data.js"></script>
<script type="text/javascript">
$(function(){
	getGameResultLatest();
});
function getGameResultLatest(){
    showLoader();
    var gameResultListView = $("#gameResultListView");
    var request = $.ajax({
        url: '${ctx}/ssc/getGameResultLatest',
        data: {
        	"t": new Date().getTime()
        },
        dataType: 'json'
    });   
    request.done(function(jsonResult) {
    	var result = jsonResult.r;
    	if(result == 0){
    		gameResultListView.empty();
    		var arr = jsonResult.list;
    		if (arr != undefined && arr.length > 0) {
    			$.each(arr, function(key, value){
 	            	var ballHtml = ''; 
	            	var ballArr = value.result.split(",");
	            	if(value.code.toLowerCase() == 'bjklc'){
	            		ballHtml = '<p>';
	            		$.each(ballArr, function(n, value){
		            		ballHtml = ballHtml.concat('<span class="bjklc">' + value + '</span>');
		            		if(n==9){
		            			ballHtml += '<br>';
		            		}
		            	});
	            	}else{
	            		ballHtml = '<p class="' + value.code.toLowerCase() + '">';
		            	$.each(ballArr, function(n, value){
		            		ballHtml = ballHtml.concat('<span class="number num' + value + '"></span>');
		            	});
	            	}
	            	ballHtml = ballHtml.concat('</p>');  
	            	//var content = '<li data-role="list-divider">' + value.name + '</li><li><a href="${ctx}/ssc/gameResultSingle?gid=' + value.gid + '" data-ajax="false"><strong>第' + value.issue + '期 </strong>' + ballHtml + '<p class="ui-li-aside"><strong>' + value.time + '</strong></p></a></li>';
	            	var content = '<li data-role="list-divider">' + value.name + '</li><li><a href="${ctx}/ssc/gameResultSingle?gid=' + value.gid + '" data-ajax="false"  style="padding:0.4em 0 0.2em 1em ;"><strong>第' + value.issue + '期 </strong>' + ballHtml + '</a></li>';
	            	gameResultListView.append(replaceAllHtml(content)); 	
    			});
    			gameResultListView.listview("refresh");
    			$("#topBtn").show();
    		}else{
    			gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
    		}
    	} else {
    		$("#topBtn").hide();
	        gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常,请联系管理员</h5>');
	    }
    }); 
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络中断,请检测网络</h5>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}	    
	});
	request.always(function() {
	    hideLoader();
	});    
}
</script>
</head>
<body>
<div data-role="page" id="gameResultLatestPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>开奖结果</h1>
	 		<a href="javascript:getGameResultLatest()" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="content">
	<ul data-role="listview" id="gameResultListView" class="reset" style="margin-top:2px;">
	<%-- 
	  <li data-role="list-divider">广东快乐十分</li>
	  <li><a href="${ctx}/ssc/gameResultSingle" data-ajax="false">
	    <strong>第437620期 </strong>
	  		<p class="klc">
			  	<span class="number num02"></span>
			  	<span class="number num12"></span>
			  	<span class="number num04"></span>
			  	<span class="number num06"></span>
			  	<span class="number num07"></span>
			  	<span class="number num19"></span>
			  	<span class="number num02"></span>
			  	<span class="number num09"></span>
		  	</p>
		  	<p class="ui-li-aside">
		  		<strong>10:11:14</strong>
		  	</p>
	  	</a></li>
	  
	  <li data-role="list-divider">重庆时时彩</li>
	  <li><a href="${ctx}/ssc/gameResultSingle" data-ajax="false">
	    <strong>第437620期 </strong>
	  		<p class="ssc">
			  	<span class="number num02"></span>
			  	<span class="number num12"></span>
			  	<span class="number num04"></span>
			  	<span class="number num06"></span>
			  	<span class="number num07"></span>
		  	</p>
		  	<p class="ui-li-aside">
		  		<strong>10:11:14</strong>
		  	</p>
	  	</a></li>	
	  	
	  <li data-role="list-divider">北京赛车(PK10)</li>
	  <li><a href="${ctx}/ssc/gameResultSingle" data-ajax="false">
	    <strong>第437620期 </strong>
	  		<p class="bjc">
			  	<span class="number num02"></span>
			  	<span class="number num12"></span>
			  	<span class="number num04"></span>
			  	<span class="number num06"></span>
			  	<span class="number num07"></span>
			  	<span class="number num19"></span>
			  	<span class="number num02"></span>
			  	<span class="number num09"></span>
		  	</p>
		  	<p class="ui-li-aside">
		  		<strong>10:11:14</strong>
		  	</p>
	  	</a></li>		

	  <li data-role="list-divider">幸运农场</li>
	  <li><a href="${ctx}/ssc/gameResultSingle" data-ajax="false">
	    <strong>第437620期 </strong>
	  		<p class="xync">
			  	<span class="number num10"></span>
			  	<span class="number num11"></span>
			  	<span class="number num18"></span>
			  	<span class="number num17"></span>
			  	<span class="number num06"></span>
			  	<span class="number num01"></span>
			  	<span class="number num07"></span>
			  	<span class="number num04"></span>
		  	</p>
		  	<p class="ui-li-aside">
		  		<strong>10:11:14</strong>
		  	</p>
	  	</a></li>	

	  <li data-role="list-divider">江苏骰宝</li>
	  <li><a href="${ctx}/ssc/gameResultSingle" data-ajax="false">
	    <strong>第437620期 </strong>
	  		<p class="jsks">
			  	<span class="number num1"></span>
			  	<span class="number num3"></span>
			  	<span class="number num4"></span>
			  	<span class="number num6"></span>
			  	<span class="number num5"></span>
		  	</p>
		  	<p class="ui-li-aside">
		  		<strong>10:11:14</strong>
		  	</p>
	  	</a></li>			  				  			  		  
	  --%>		  			  
	</ul>
	<a id="topBtn" style="display:none;" href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="y">${msg["button.common.backTop"]}</a></p>
  </div>  
</div> 
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>