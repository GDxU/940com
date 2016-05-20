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
<script src="${staticFileUrl}/js/combet.js"></script>
<script src="${staticFileUrl}/js/data.js"></script>
<script type="text/javascript">
$(function(){
	$("label").addClass("ui-btn-z");//pei率按钮缩小
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
    $("#submitBtn").unbind("click").on("click",function(){
    	sbc();
    });
   //游戏是否隐藏
    if("${obj.cf.jxssc_1}" != '' && "${obj.cf.jxssc_1}" != 1){
	   	$.each($("[id^='BALL_1-']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.jxssc_2}" != '' && "${obj.cf.jxssc_2}" != 1){
	   	$.each($("[id^='BALL_2-']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.jxssc_3}" != '' && "${obj.cf.jxssc_3}" != 1){
	   	$.each($("[id^='BALL_3-']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }    
    if("${obj.cf.jxssc_4}" != '' && "${obj.cf.jxssc_4}" != 1){
	   	$.each($("[id^='BALL_4-']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    } 
    if("${obj.cf.jxssc_5}" != '' && "${obj.cf.jxssc_5}" != 1){
	   	$.each($("[id^='BALL_5-']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }  
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
<c:set var="page_title" value="${msg['title.ssc.JXSSC']}" scope="request"/>
<body>
	<section  data-role="page" id="rateInfoPage" data-eventbind="N">
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
		    <c:if test = "${empty obj.cf || obj.cf.jxssc_zh == 1}">    
			<table border="1" class="hdptable">
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="6">${msg['label.ssc.play.TOTAL']}-${msg['label.ssc.play.longhuhe']}</th>
			    </tr>
				<tbody>
			    <tr>
			      <td class="td-bgcolor"  width="20%">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.BIG']}</td>
			      <td width="30%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-BIG" id="TOTAL-BIG" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.BIG']}" for="TOTAL-BIG">0.00</label></fieldset></td>
			      <td class="td-bgcolor" width="20%">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.SMALL']}</td>
			      <td width="30%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-SMALL" id="TOTAL-SMALL" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.SMALL']}" for="TOTAL-SMALL">0.00</label></fieldset></td>
			     </tr>
			     <tr>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-ODD" id="TOTAL-ODD" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.ODD']}" for="TOTAL-ODD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-EVEN" id="TOTAL-EVEN" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.EVEN']}" for="TOTAL-EVEN">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.DRAGON']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-DRAGON" id="TOTAL-DRAGON" data-mini="true"><label title="${msg['label.ssc.ball.DRAGON']}" for="TOTAL-DRAGON">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.TIGER']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-TIGERL" id="TOTAL-TIGER" data-mini="true"><label title="${msg['label.ssc.ball.TIGER']}" for="TOTAL-TIGER">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.HE']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-HE" id="TOTAL-HE" data-mini="true"><label title="${msg['label.ssc.ball.HE']}" for="TOTAL-HE">0.00</label></fieldset></td>	
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			</c:if>
			<table border="1" class="hdptable">
			  <thead>
			    <tr class="tr-bgcolor">
			      <th width="15%">项目</th>
			      <th>${msg['label.ssc.play.BALL_1']}</th>
			      <th>${msg['label.ssc.play.BALL_2']}</th>
			      <th>${msg['label.ssc.play.BALL_3']}</th>
			      <th>${msg['label.ssc.play.BALL_4']}</th>
			      <th>${msg['label.ssc.play.BALL_5']}</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.BIG']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-BIG" id="BALL_1-BIG" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']}${msg['label.ssc.ball.BIG']}" for="BALL_1-BIG">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-BIG" id="BALL_2-BIG" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']}${msg['label.ssc.ball.BIG']}" for="BALL_2-BIG">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-BIG" id="BALL_3-BIG" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']}${msg['label.ssc.ball.BIG']}" for="BALL_3-BIG">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-BIG" id="BALL_4-BIG" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']}${msg['label.ssc.ball.BIG']}" for="BALL_4-BIG">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-BIG" id="BALL_5-BIG" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']}${msg['label.ssc.ball.BIG']}" for="BALL_5-BIG">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.SMALL']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-SMALL" id="BALL_1-SMALL" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']}${msg['label.ssc.ball.SMALL']}" for="BALL_1-SMALL">0.00</label></fieldset></td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-SMALL" id="BALL_2-SMALL" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']}${msg['label.ssc.ball.SMALL']}" for="BALL_2-SMALL">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-SMALL" id="BALL_3-SMALL" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']}${msg['label.ssc.ball.SMALL']}" for="BALL_3-SMALL">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-SMALL" id="BALL_4-SMALL" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']}${msg['label.ssc.ball.SMALL']}" for="BALL_4-SMALL">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-SMALL" id="BALL_5-SMALL" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']}${msg['label.ssc.ball.SMALL']}" for="BALL_5-SMALL">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.ODD']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-ODD" id="BALL_1-ODD" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']}${msg['label.ssc.ball.ODD']}" for="BALL_1-ODD">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-ODD" id="BALL_2-ODD" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']}${msg['label.ssc.ball.ODD']}" for="BALL_2-ODD">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-ODD" id="BALL_3-ODD" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']}${msg['label.ssc.ball.ODD']}" for="BALL_3-ODD">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-ODD" id="BALL_4-ODD" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']}${msg['label.ssc.ball.ODD']}" for="BALL_4-ODD">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-ODD" id="BALL_5-ODD" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']}${msg['label.ssc.ball.ODD']}" for="BALL_5-ODD">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.EVEN']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-EVEN" id="BALL_1-EVEN" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']}${msg['label.ssc.ball.EVEN']}" for="BALL_1-EVEN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-EVEN" id="BALL_2-EVEN" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']}${msg['label.ssc.ball.EVEN']}" for="BALL_2-EVEN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-EVEN" id="BALL_3-EVEN" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']}${msg['label.ssc.ball.EVEN']}" for="BALL_3-EVEN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-EVEN" id="BALL_4-EVEN" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']}${msg['label.ssc.ball.EVEN']}" for="BALL_4-EVEN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-EVEN" id="BALL_5-EVEN" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']}${msg['label.ssc.ball.EVEN']}" for="BALL_5-EVEN">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">质</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-ZHISHU" id="BALL_1-ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']} 质" for="BALL_1-ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-ZHISHU" id="BALL_2-ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']} 质" for="BALL_2-ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-ZHISHU" id="BALL_3-ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']} 质" for="BALL_3-ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-ZHISHU" id="BALL_4-ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']} 质" for="BALL_4-ZHISHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-ZHISHU" id="BALL_5-ZHISHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']} 质" for="BALL_5-ZHISHU">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">合</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1-HESHU" id="BALL_1-HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_1']} 合" for="BALL_1-HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2-HESHU" id="BALL_2-HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_2']} 合" for="BALL_2-HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3-HESHU" id="BALL_3-HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_3']} 合" for="BALL_3-HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4-HESHU" id="BALL_4-HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_4']} 合" for="BALL_4-HESHU">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_5-HESHU" id="BALL_5-HESHU" data-mini="true"><label title="${msg['label.ssc.play.BALL_5']} 合" for="BALL_5-HESHU">0.00</label></fieldset></td>
			  	</tr>
			  </tbody>
			</table>
			<c:if test = "${empty obj.cf || obj.cf.jxssc_zh == 1}">
			<table border="1" class="hdptable">
			  <thead>
			    <tr class="tr-bgcolor">
			      <th width="15%">项目</th>
			      <th>${msg['label.ssc.play.FIRST3']}</th>
			      <th>${msg['label.ssc.play.MIDDLE3']}</th>
			      <th>${msg['label.ssc.play.LAST3']}</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.BAOZI']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="FIRST3-BAOZI" id="FIRST3-BAOZI" data-mini="true"><label title="${msg['label.ssc.play.FIRST3']}${msg['label.ssc.ball.BAOZI']}" for="FIRST3-BAOZI">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MIDDLE3-BAOZI" id="MIDDLE3-BAOZI" data-mini="true"><label title="${msg['label.ssc.play.MIDDLE3']}${msg['label.ssc.ball.BAOZI']}" for="MIDDLE3-BAOZI">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="LAST3-BAOZI" id="LAST3-BAOZI" data-mini="true"><label title="${msg['label.ssc.play.LAST3']}${msg['label.ssc.ball.BAOZI']}" for="LAST3-BAOZI">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.SHUNZI']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="FIRST3-SHUNZI" id="FIRST3-SHUNZI" data-mini="true"><label title="${msg['label.ssc.play.FIRST3']}${msg['label.ssc.ball.SHUNZI']}" for="FIRST3-SHUNZI">0.00</label></fieldset></td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MIDDLE3-SHUNZI" id="MIDDLE3-SHUNZI" data-mini="true"><label title="${msg['label.ssc.play.MIDDLE3']}${msg['label.ssc.ball.SHUNZI']}" for="MIDDLE3-SHUNZI">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="LAST3-SHUNZI" id="LAST3-SHUNZI" data-mini="true"><label title="${msg['label.ssc.play.LAST3']}${msg['label.ssc.ball.SHUNZI']}" for="LAST3-SHUNZI">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.DUIZI']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="FIRST3-DUIZI" id="FIRST3-DUIZI" data-mini="true"><label title="${msg['label.ssc.play.FIRST3']}${msg['label.ssc.ball.DUIZI']}" for="FIRST3-DUIZI">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MIDDLE3-DUIZI" id="MIDDLE3-DUIZI" data-mini="true"><label title="${msg['label.ssc.play.MIDDLE3']}${msg['label.ssc.ball.DUIZI']}" for="MIDDLE3-DUIZI">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="LAST3-DUIZI" id="LAST3-DUIZI" data-mini="true"><label title="${msg['label.ssc.play.LAST3']}${msg['label.ssc.ball.DUIZI']}" for="LAST3-DUIZI">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.BANSHUN']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="FIRST3-BANSHUN" id="FIRST3-BANSHUN" data-mini="true"><label title="${msg['label.ssc.play.FIRST3']}${msg['label.ssc.ball.BANSHUN']}" for="FIRST3-BANSHUN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MIDDLE3-BANSHUN" id="MIDDLE3-BANSHUN" data-mini="true"><label title="${msg['label.ssc.play.MIDDLE3']}${msg['label.ssc.ball.BANSHUN']}" for="MIDDLE3-BANSHUN">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="LAST3-BANSHUN" id="LAST3-BANSHUN" data-mini="true"><label title="${msg['label.ssc.play.LAST3']}${msg['label.ssc.ball.BANSHUN']}" for="LAST3-BANSHUN">0.00</label></fieldset></td>
			  	</tr>
			  	<tr>
			  		<td class="td-bgcolor">${msg['label.ssc.ball.ZA_6']}</td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="FIRST3-ZA_6" id="FIRST3-ZA_6" data-mini="true"><label title="${msg['label.ssc.play.FIRST3']}${msg['label.ssc.ball.ZA_6']}" for="FIRST3-ZA_6">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MIDDLE3-ZA_6" id="MIDDLE3-ZA_6" data-mini="true"><label title="${msg['label.ssc.play.MIDDLE3']}${msg['label.ssc.ball.ZA_6']}" for="MIDDLE3-ZA_6">0.00</label></fieldset></td>
			  		<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="LAST3-ZA_6" id="LAST3-ZA_6" data-mini="true"><label title="${msg['label.ssc.play.LAST3']}${msg['label.ssc.ball.ZA_6']}" for="LAST3-ZA_6">0.00</label></fieldset></td>
			  	</tr>
			  </tbody>
			</table>
			</c:if>
			</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="${msg['title.ssc.LIANGMIAN']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type= "text/javascript" >
	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script >
</html>