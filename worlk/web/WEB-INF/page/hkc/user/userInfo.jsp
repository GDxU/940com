<!--------------------------------个人资讯---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<script type="text/javascript">
$(function(){
	getUserInfo();
});
function getUserInfo(){
    showLoader();
    var userBaseInfo = $("#userBaseInfo");
    var limitTbody = $("#limit_table > tbody");
    var request = $.ajax({
        url: '${ctx}/hkc/getUserInfo',
        data: {
        	"rtype": 0,
        	"t": new Date().getTime()
        },
        dataType: 'json'
    });   
    request.done(function(json) {
    	var result = json.r;
    	if(result == 0){
    		userBaseInfo.empty();
    		var userType = json.data.tp;//类型
    		var status = json.data.sts;//状态
    		if(status == 1){
    			status = "{[{5q2j}]}常";
    		}else if(status == 2){
    			status = "锁定";
    		}else if(status == 3){
    			status = "禁用";
    		}else if(status == 4){
    			status = "冻结";
    		}
    		//1、用户基本信息
    		if(userType == 0){//信用
    			userBaseInfo.append('<li>代{[{5Y+3}]}<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>姓名<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>信用额度<span class="ui-li-count">' + formNumber(json.data.sc,2) + '</span></li>');
    			userBaseInfo.append('<li>信用余额<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>{[{6LSm}]}{[{5Y+3}]}状态<span class="ui-li-count">' + status + '</span></li>');
//     			userBaseInfo.append('<li>经销类别<span class="ui-li-count">' + json.data.hts + '</span></li>');
    		}else{//现{[{6YeR}]}
    			userBaseInfo.append('<li>代{[{5Y+3}]}<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>姓名<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>RMB<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>{[{6LSm}]}{[{5Y+3}]}状态<span class="ui-li-count">' + status + '</span></li>');
//     			userBaseInfo.append('<li>经销类别<span class="ui-li-count">' + json.data.hts + '</span></li>');    		
    		}
    		userBaseInfo.listview("refresh");
    		//2、用户限额信息
    		$.each(json.list, function(key, value){
    			limitTbody.append("<tr><th style='color:#076600'>" + value.p + "</th><td>" + value.l + "</td><td>" + value.h + "</td><td>" + value.x + "</td><td>" + value.m + "</td></tr>");
    		});
    		$("#limit_table").table("rebuild");
    	} else {
	        userBaseInfo.html('<h4 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">获取用户基本信息失败,请联系管理员</h4>');
	    }
    }); 
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			userBaseInfo.html('<h4 class="ui-bar ui-bar-b ui-corner-all" style="color:#FFF;text-align: center;">网络{[{5Lit}]}断,请检测网络</h4>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}	    
	});
	request.always(function() {
	    hideLoader();
	    userBaseInfo.html(replaceAllHtml(userBaseInfo.html()));
	    limitTbody.html(replaceAllHtml(limitTbody.html()));
	}); 	
}
</script>
</head>
<body>
<div data-role="page" id="userInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/hkc/hkmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>会员资料</h1>
		 </div>
	</div>
  	<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
	<div data-role="main"  class="ui-content" >
		<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
		<h3>基本信息</h3>
		<div data-role="listview" id="userBaseInfo">
			<li style="text-align :center;"><font color="red">{[{5q2j}]}在加载用户基本信息...</font></li>
			<!-- 
			<li id="accnum">{[{6LSm}]}{[{5Y+3}]}<span class="ui-li-count">testaaa</span></li>
			<li id="accname">会员名称<span class="ui-li-count">testaaa</span></li>
			<li id="cash_balance">RMB<span class="ui-li-count">1000</span></li>
			<li id="credit_default">信用额度<span class="ui-li-count">1000</span></li>
			<li id="credit_balance">信用余额<span class="ui-li-count">2000</span></li>
			<li id="acc_status">{[{6LSm}]}{[{5Y+3}]}状态<span class="ui-li-count">{[{5q2j}]}常 </span></li>
			<li id="handType">所属盘口<span class="ui-li-count">A,B,C,D</span></li>
			 -->
		</div>		
		</div>

		<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
		<h3>限额信息</h3>
		<table data-role="table" id="limit_table" data-mode="reflow" class="hkc-list hkc-table-breakpoint ui-hkc-table-user">
			<thead>
				<tr>
					<th>玩法</th>
					<th>{[{5Y2V}]}{[{5rOo}]}最低限额</th>
					<th>{[{5Y2V}]}{[{5rOo}]}限额</th>
					<th>{[{5Y2V}]}项(号)最高</th>
					<th>{[{55uY5Y+j5L2j6YeR}]}(%)</th>
				</tr>
			</thead>
			<tbody>
			<!-- 
				<tr>
					<td>{[{54m5}]}A</td>
					<td>1</td>
					<td>5000</td>
					<td>10000</td>
					<td>D: 0.1200</td>
				</tr>
			 -->				
			</tbody>
		</table>	
		</div>
	</div> 
</div>
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>