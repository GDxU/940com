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
<link rel="stylesheet" href="${staticFileUrl}/css/trip.min.css">
<script src="${staticFileUrl}/js/jquery.cookie.js"></script>
<script src="${staticFileUrl}/js/combet.js"></script>
<script src="${staticFileUrl}/js/trip.min.js"></script>
<script type="text/javascript">
$(function(){
	$("label").addClass("ui-btn-z");
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	obcs();
		}else{
			obch();
		}
    });
    $(document).on("click","input[rel='d']",function(e){
        cdb(this,2);
    });
    $(document).on("click","input[rel='w']",function(e){
    	cwb(this);
    });
	$("#orderBtn").on("click",function(e) {
        obc();
    });
    $("#submitBtn").on("click",function(){
    	sbc();
    });

    if("${obj.cf.ynssc_1}" != '' && "${obj.cf.ynssc_1}" != 1){
	   	$.each($("[id^='BALL_1_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.ynssc_2}" != '' && "${obj.cf.ynssc_2}" != 1){
	   	$.each($("[id^='BALL_2_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.ynssc_3}" != '' && "${obj.cf.ynssc_3}" != 1){
	   	$.each($("[id^='BALL_3_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }    
    if("${obj.cf.ynssc_4}" != '' && "${obj.cf.ynssc_4}" != 1){
	   	$.each($("[id^='BALL_4_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    } 
    if("${obj.cf.ynssc_5}" != '' && "${obj.cf.ynssc_5}" != 1){
	   	$.each($("[id^='BALL_5_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }      
    //checkIntro();
    $("#hcth").on("click",function(){
    	if(hca == 1){
	    	$.mobile.changePage("#hctm", "slideup");
    	}
    });
    showhc();
});
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.YNSSC']}" scope="request"/>
<body>
	<div  data-role="page" id="rateInfoPage" data-eventbind="N">
		<c:set var="page_type" value="2" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_left_ssc.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" id="rateRefInfo">
		<div class="ui-on-lottery">	
			<table border="1" class="rslttable" id="oit">
				<thead>
				    <tr class="On-Number">
				      <th class="wNumber"><span id="oiss"></span>期开奖号码</th>
				    </tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>		
			</div>	
			<div class="clear"></div>
			<div class="list_dingtime">
		    <div class="handicap-info">
		    	<span id="issueNow"><font color='red'>加载中...</font></span>&nbsp;<span id="closeCountdown"></span>&nbsp;<span id="optm"></span>
		       	<div style="float:right;" id="ykMoneyDiv">${msg['title.ssc.todayWinLoss']}:<span id="ykmoney">0.00</span></div>
		    </div> 
		    <div class="table-cotent-lottery">
			<table border="1" class="hdptable">
				<thead>
			    <tr class="tr-bgcolor">
			      <th data-priority="1">组合</th>
			      <th data-priority="2">第一球</th>
			      <th data-priority="3">第二球</th>
			      <th data-priority="4">第三球</th>
			      <th data-priority="5">第四球</th>
			      <th data-priority="6">第五球</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_BIG" id="BALL_1_BIG" data-mini="true"><label for="BALL_1_BIG" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_BIG" id="BALL_2_BIG" data-mini="true"><label for="BALL_2_BIG" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_BIG" id="BALL_3_BIG" data-mini="true"><label for="BALL_3_BIG" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_BIG" id="BALL_4_BIG" data-mini="true"><label for="BALL_4_BIG" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_BIG" id="BALL_5_BIG" data-mini="true"><label for="BALL_5_BIG" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_SMALL" id="BALL_1_SMALL" data-mini="true"><label for="BALL_1_SMALL" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_SMALL" id="BALL_2_SMALL" data-mini="true"><label for="BALL_2_SMALL" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_SMALL" id="BALL_3_SMALL" data-mini="true"><label for="BALL_3_SMALL" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_SMALL" id="BALL_4_SMALL" data-mini="true"><label for="BALL_4_SMALL" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_SMALL" id="BALL_5_SMALL" data-mini="true"><label for="BALL_5_SMALL" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_ODD" id="BALL_1_ODD" data-mini="true"><label for="BALL_1_ODD" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_ODD" id="BALL_2_ODD" data-mini="true"><label for="BALL_2_ODD" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_ODD" id="BALL_3_ODD" data-mini="true"><label for="BALL_3_ODD" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_ODD" id="BALL_4_ODD" data-mini="true"><label for="BALL_4_ODD" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_ODD" id="BALL_5_ODD" data-mini="true"><label for="BALL_5_ODD" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_EVEN" id="BALL_1_EVEN" data-mini="true"><label for="BALL_1_EVEN" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_EVEN" id="BALL_2_EVEN" data-mini="true"><label for="BALL_2_EVEN" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_EVEN" id="BALL_3_EVEN" data-mini="true"><label for="BALL_3_EVEN" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_EVEN" id="BALL_4_EVEN" data-mini="true"><label for="BALL_4_EVEN" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_EVEN" id="BALL_5_EVEN" data-mini="true"><label for="BALL_5_EVEN" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr>
			  		<td class="td-bgcolor">质</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_ZHISHU" id="BALL_1_ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']} 质" for="BALL_1_ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_ZHISHU" id="BALL_2_ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']} 质" for="BALL_2_ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_ZHISHU" id="BALL_3_ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']} 质" for="BALL_3_ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_ZHISHU" id="BALL_4_ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']} 质" for="BALL_4_ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_ZHISHU" id="BALL_5_ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']} 质" for="BALL_5_ZHISHU">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">合</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_HESHU" id="BALL_1_HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']} 合" for="BALL_1_HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_HESHU" id="BALL_2_HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']} 合" for="BALL_2_HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_HESHU" id="BALL_3_HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']} 合" for="BALL_3_HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_HESHU" id="BALL_4_HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']} 合" for="BALL_4_HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_HESHU" id="BALL_5_HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']} 合" for="BALL_5_HESHU">0.00</label></fieldset></td>
			  	</tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num0"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_0" id="BALL_1_NO_0" data-mini="true"><label for="BALL_1_NO_0" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_0']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_0" id="BALL_2_NO_0" data-mini="true"><label for="BALL_2_NO_0" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_0']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_0" id="BALL_3_NO_0" data-mini="true"><label for="BALL_3_NO_0" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_0']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_0" id="BALL_4_NO_0" data-mini="true"><label for="BALL_4_NO_0" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_0']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_0" id="BALL_5_NO_0" data-mini="true"><label for="BALL_5_NO_0" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_0']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_1" id="BALL_1_NO_1" data-mini="true"><label for="BALL_1_NO_1" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_1']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_1" id="BALL_2_NO_1" data-mini="true"><label for="BALL_2_NO_1" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_1']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_1" id="BALL_3_NO_1" data-mini="true"><label for="BALL_3_NO_1" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_1']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_1" id="BALL_4_NO_1" data-mini="true"><label for="BALL_4_NO_1" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_1']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_1" id="BALL_5_NO_1" data-mini="true"><label for="BALL_5_NO_1" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_1']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_2" id="BALL_1_NO_2" data-mini="true"><label for="BALL_1_NO_2" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_2']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_2" id="BALL_2_NO_2" data-mini="true"><label for="BALL_2_NO_2" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_2']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_2" id="BALL_3_NO_2" data-mini="true"><label for="BALL_3_NO_2" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_2']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_2" id="BALL_4_NO_2" data-mini="true"><label for="BALL_4_NO_2" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_2']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_2" id="BALL_5_NO_2" data-mini="true"><label for="BALL_5_NO_2" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_2']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_3" id="BALL_1_NO_3" data-mini="true"><label for="BALL_1_NO_3" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_3']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_3" id="BALL_2_NO_3" data-mini="true"><label for="BALL_2_NO_3" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_3']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_3" id="BALL_3_NO_3" data-mini="true"><label for="BALL_3_NO_3" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_3']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_3" id="BALL_4_NO_3" data-mini="true"><label for="BALL_4_NO_3" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_3']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_3" id="BALL_5_NO_3" data-mini="true"><label for="BALL_5_NO_3" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_3']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_4" id="BALL_1_NO_4" data-mini="true"><label for="BALL_1_NO_4" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_4']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_4" id="BALL_2_NO_4" data-mini="true"><label for="BALL_2_NO_4" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_4']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_4" id="BALL_3_NO_4" data-mini="true"><label for="BALL_3_NO_4" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_4']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_4" id="BALL_4_NO_4" data-mini="true"><label for="BALL_4_NO_4" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_4']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_4" id="BALL_5_NO_4" data-mini="true"><label for="BALL_5_NO_4" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_4']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_5" id="BALL_1_NO_5" data-mini="true"><label for="BALL_1_NO_5" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_5']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_5" id="BALL_2_NO_5" data-mini="true"><label for="BALL_2_NO_5" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_5']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_5" id="BALL_3_NO_5" data-mini="true"><label for="BALL_3_NO_5" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_5']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_5" id="BALL_4_NO_5" data-mini="true"><label for="BALL_4_NO_5" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_5']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_5" id="BALL_5_NO_5" data-mini="true"><label for="BALL_5_NO_5" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_5']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_6" id="BALL_1_NO_6" data-mini="true"><label for="BALL_1_NO_6" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_6']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_6" id="BALL_2_NO_6" data-mini="true"><label for="BALL_2_NO_6" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_6']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_6" id="BALL_3_NO_6" data-mini="true"><label for="BALL_3_NO_6" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_6']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_6" id="BALL_4_NO_6" data-mini="true"><label for="BALL_4_NO_6" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_6']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_6" id="BALL_5_NO_6" data-mini="true"><label for="BALL_5_NO_6" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_6']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_7" id="BALL_1_NO_7" data-mini="true"><label for="BALL_1_NO_7" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_7']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_7" id="BALL_2_NO_7" data-mini="true"><label for="BALL_2_NO_7" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_7']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_7" id="BALL_3_NO_7" data-mini="true"><label for="BALL_3_NO_7" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_7']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_7" id="BALL_4_NO_7" data-mini="true"><label for="BALL_4_NO_7" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_7']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_7" id="BALL_5_NO_7" data-mini="true"><label for="BALL_5_NO_7" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_7']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_8" id="BALL_1_NO_8" data-mini="true"><label for="BALL_1_NO_8" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_8']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_8" id="BALL_2_NO_8" data-mini="true"><label for="BALL_2_NO_8" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_8']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_8" id="BALL_3_NO_8" data-mini="true"><label for="BALL_3_NO_8" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_8']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_8" id="BALL_4_NO_8" data-mini="true"><label for="BALL_4_NO_8" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_8']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_8" id="BALL_5_NO_8" data-mini="true"><label for="BALL_5_NO_8" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_8']}">0.00</label></fieldset></td>	
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_NO_9" id="BALL_1_NO_9" data-mini="true"><label for="BALL_1_NO_9" title="${msg['label.ssc.play.BALL_1']} ${msg['label.ssc.ball.NO_9']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_NO_9" id="BALL_2_NO_9" data-mini="true"><label for="BALL_2_NO_9" title="${msg['label.ssc.play.BALL_2']} ${msg['label.ssc.ball.NO_9']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_NO_9" id="BALL_3_NO_9" data-mini="true"><label for="BALL_3_NO_9" title="${msg['label.ssc.play.BALL_3']} ${msg['label.ssc.ball.NO_9']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_NO_9" id="BALL_4_NO_9" data-mini="true"><label for="BALL_4_NO_9" title="${msg['label.ssc.play.BALL_4']} ${msg['label.ssc.ball.NO_9']}">0.00</label></fieldset></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5_NO_9" id="BALL_5_NO_9" data-mini="true"><label for="BALL_5_NO_9" title="${msg['label.ssc.play.BALL_5']} ${msg['label.ssc.ball.NO_9']}">0.00</label></fieldset></td>	
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="1 ~ 5">
	</div>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type= "text/javascript" >
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script >

</html>