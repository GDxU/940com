<%--------------------------------开奖结果----------------------------%>
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
<link rel="stylesheet" href="${staticFileUrl}/css/datebox/jqm-datebox-1.4.4.min.css">
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-1.4.4.core.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-1.4.4.mode.calbox.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-i18n.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<script type="text/javascript">
jQuery.extend(jQuery.mobile.datebox.prototype.options, {
    'overrideDateFormat': '%Y-%m-%d',
    'overrideHeaderFormat': '%Y-%m-%d',
    'useLang':'zh',
    'useFocus':true,
    'theme':'a',
    'themeHeader':'b',
    'useNewStyle':true
});
$(function(){
	getGameResult();
	
	$("#btDate").change(function(){
		getGameResult();
	});
});
function getGameResult(){
    showLoader();
    var gameResultListView = $("#gameResultListView");
    var request = $.ajax({
        url: '${ctx}/ssc/getGameResultSingle',
        data: {
        	"t": new Date().getTime(),
        	"gid": $("#gameId").val(),
        	"bd" : $("#btDate").val()
        },
        dataType: 'json'
    });
	request.done(function(jsonResult) {
	    var result = jsonResult.r;
	    if (result == 0) {
	    	gameResultListView.empty();
	        var arr = jsonResult.list;
	        if (arr != undefined && arr.length > 0) {
	            $.each(arr, function(key, value) {
	            	if('JSKS' == value.gid || 'AHKS' == value.gid || 'GXKS' == value.gid){
	            		var ballHtml = '<li class="' + value.gid.toLowerCase() + ' b_num_arr">'; 
		            	var ballArr = value.ball.split(",");
		            	$.each(ballArr, function(n, value){
		            		ballHtml = ballHtml.concat('<span class="number num' + value + '"></span>');
		            	});
		            	//ballHtml = ballHtml.concat(' <span class="number"><strong>{[{5oC75ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs +'</span>');
		            	//ballHtml = ballHtml.concat('</li>');
		            	var rc = '<font size="1"><strong>{[{5oC75ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs + '</font>';
		            	var content = '<li class="his_issue"><strong>' + value.issue + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count">' + rc + '</span>' + ballHtml + '</li>';
		                gameResultListView.append(replaceAllHtml(content));
	            	}else{
	            		var ballHtml = ''; 
		            	var ballArr = value.ball.split(",");
		            	if(value.gid.toLowerCase() == 'bjklc'){
		            		ballHtml = '<li>';
		            		$.each(ballArr, function(n, value){
		            		ballHtml = ballHtml.concat('<span class="bjklc">' + value + '</span>');
			            		if(n==9){
			            			ballHtml += '<br>';
			            		}
			            	});
		            	}else{
		            		ballHtml = '<li class="' + value.gid.toLowerCase() + ' b_num_arr">';
		            		$.each(ballArr, function(n, value){
			            		ballHtml = ballHtml.concat('<span class="number num' + value + '"></span>');
			            	});
		            	}
		            	ballHtml = ballHtml.concat('</li>');
		            	var rc = '';
		            	var content = '';
		            	if('KLC' == value.gid || 'TJKLC' == value.gid || 'GXKLC' == value.gid || 'HNKLC' == value.gid || 'BJKLC' == value.gid){
			            	rc = '<font size="1"><strong>{[{5oC75ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + ' ' + value.tbs + '</font>';
		            		if('BJKLC' == value.gid){
		            			rc = '<font size="1"><strong>{[{5oC75ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + '</font>';
		            		}else{
		            			rc = '<font size="1"><strong>{[{5oC75ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + ' ' + value.tbs + '</font>';
		            		}
		            		var tem_is = (value.issue).substring(8,value.issue.length);
		            		if('BJKLC' == value.gid){
		            			tem_is = value.issue;
		            		}
		            		content = '<li class="his_issue"><strong>0' + tem_is + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count">' + rc + '</span>' + ballHtml + '</li>';
		            	}else if('SSC' == value.gid || 'JXSSC' == value.gid || 
		            			'XJSSC' == value.gid || 'TJSSC' == value.gid ||
		            			'YNSSC' == value.gid || 'SHSSC' == value.gid){
		            		rc = '{[{5oC75ZKM}]}: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + '&nbsp;&nbsp;${msg["label.ssc.ball.DRAGON"]}${msg["label.ssc.ball.TIGER"]}: ' + value.dt;
		            		var tem_is = (value.issue).substring(8,value.issue.length);
		            		if('SHSSC' == value.gid){
		            			content = '<li class="his_issue"><strong>' + tem_is + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span>' + ballHtml + '</li>';
		            		}else{
			            		content = '<li class="his_issue"><strong>' + tem_is + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count" style="font-weight: normal; font-size: 10px">' + rc + '</span>' + ballHtml + '</li>';
		            		}
		            	}else if('BJC' == value.gid){
		            		rc = '<font size="1"><strong>{[{5Yag5Lqa5ZKM}]}</strong>: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + '</font>';
		            		content = '<li class="his_issue"><strong>' + value.issue + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count">' + rc + '</span>' + ballHtml + '</li>';
		            	}else if('XYNC' == value.gid){
		            		rc = '{[{5oC75ZKM}]}: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + ' ' + value.tbs;
		            		var tem_is = (value.issue).substring(8,value.issue.length);
		            		content = '<li class="his_issue"><strong>' + tem_is + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count" style="font-weight: normal; font-size: 10px">' + rc + '</span>' + ballHtml + '</li>';
		            	}else if('GDSYXW' == value.gid || 'SHSYXW' == value.gid 
		            			|| 'SDSYXW' == value.gid || 'JXSYXW' == value.gid
		            			|| 'LNSYXW' == value.gid || 'HBSYXW' == value.gid
		            			|| 'JSSYXW' == value.gid){
		            		rc = '{[{5oC75ZKM}]}: ' + value.sum + ' ' + value.sbs + ' ' + value.soe + ' ' + value.tbs + '&nbsp;&nbsp;${msg["label.ssc.ball.DRAGON"]}${msg["label.ssc.ball.TIGER"]}: ' + value.dt;
				            var tem_is = (value.issue).substring(8,value.issue.length);
				            content = '<li class="his_issue"><strong>0' + tem_is + '期 </strong><span class="b_num_arr">' + $.format.date(value.date, "HH:mm") + '</span><span class="ui-li-count" style="font-weight: normal; font-size: 10px">' + rc + '</span>' + ballHtml + '</li>';
		            	}
		                gameResultListView.append(replaceAllHtml(content));
	            	}
	            	
	            });
	            if(arr.length > 10){
	            	$("#topBtn").show();
	            }else{
	            	$("#topBtn").hide();
	            }
	        } else {
	            gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
	        }
	    } else {
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
		gameResultListView.listview("refresh");
	    hideLoader();
	});    
}
</script>
</head>
<body>
<input type="hidden" id="gameId" name="gameId" value="${obj.gid}"/>
<div data-role="page" id="gameResultPage" data-title="开奖结果">
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
	 		<h1 id="title">${obj.gname}</h1>
	 		<a href="javascript:getGameResult()" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="content">
    <input name="btDate" id="btDate" type="text" value="${obj.date}" data-role="datebox" data-options='{"mode":"calbox","minDays":30,"beforeToday":true}'/>
	<ul data-role="listview" id="gameResultListView" data-theme="a" class="reset">
	<%-- 
	  <li><strong>第437620期 </strong><span class="ui-li-count">2014-07-21 10:11:14</span>
	  	<li class="klc">
		  	<span class="number num02"></span>
		  	<span class="number num12"></span>
		  	<span class="number num04"></span>
		  	<span class="number num06"></span>
		  	<span class="number num07"></span>
		  	<span class="number num19"></span>
		  	<span class="number num02"></span>
		  	<span class="number num09"></span>
	  	</li>
	  </li>
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