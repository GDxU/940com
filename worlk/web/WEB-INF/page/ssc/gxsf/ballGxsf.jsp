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
	$("label").addClass("ui-btn-z");
	$("label").css({"font-size":"10px"});
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
<c:set var="page_title" value="${msg['title.ssc.GXKLC']}" scope="request"/>
<body>
	<div  data-role="page" id="rateInfoPage">
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
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			      <th data-priority="7">号码</th>
			      <th data-priority="8">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1" id="NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2" id="NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3" id="NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="NO_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4" id="NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="NO_4">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5" id="NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6" id="NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="NO_6">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7" id="NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8" id="NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="NO_8">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9" id="NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="NO_9">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_10" id="NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_11" id="NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="NO_11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num12"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_12" id="NO_12" data-mini="true"><label title="${msg['label.ssc.ball.NO_12']}" for="NO_12">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num13"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_13" id="NO_13" data-mini="true"><label title="${msg['label.ssc.ball.NO_13']}" for="NO_13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num14"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_14" id="NO_14" data-mini="true"><label title="${msg['label.ssc.ball.NO_14']}" for="NO_14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num15"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_15" id="NO_15" data-mini="true"><label title="${msg['label.ssc.ball.NO_15']}" for="NO_15">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num16"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_16" id="NO_16" data-mini="true"><label title="${msg['label.ssc.ball.NO_16']}" for="NO_16">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num17"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_17" id="NO_17" data-mini="true"><label title="${msg['label.ssc.ball.NO_17']}" for="NO_17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num18"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_18" id="NO_18" data-mini="true"><label title="${msg['label.ssc.ball.NO_18']}" for="NO_18">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num19"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_19" id="NO_19" data-mini="true"><label title="${msg['label.ssc.ball.NO_19']}" for="NO_19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num20"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_20" id="NO_20" data-mini="true"><label title="${msg['label.ssc.ball.NO_20']}" for="NO_20">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gxklc">
			      <td class="td-bgcolor"><span class="number num21"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_21" id="NO_21" data-mini="true"><label title="${msg['label.ssc.ball.NO_21']}" for="NO_21">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.RED']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="RED" id="RED" data-mini="true"><label title="${msg['label.ssc.ball.RED']}" for="RED">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.BLUE']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BLUE" id="BLUE" data-mini="true"><label title="${msg['label.ssc.ball.BLUE']}" for="BLUE">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.GREEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="GREEN" id="GREEN" data-mini="true"><label title="${msg['label.ssc.ball.GREEN']}" for="GREEN">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.BIG']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BIG" id="BIG" data-mini="true"><label title="${msg['label.ssc.ball.BIG']}" for="BIG">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ODD" id="ODD" data-mini="true"><label title="${msg['label.ssc.ball.ODD']}" for="ODD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.TAIL_BIG']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TAIL_BIG" id="TAIL_BIG" data-mini="true"><label title="${msg['label.ssc.ball.TAIL_BIG']}" for="TAIL_BIG">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.SUM_ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SUM_ODD" id="SUM_ODD" data-mini="true"><label title="${msg['label.ssc.ball.SUM_ODD']}" for="SUM_ODD">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.SMALL']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SMALL" id="SMALL" data-mini="true"><label title="${msg['label.ssc.ball.SMALL']}" for="SMALL">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="EVEN" id="EVEN" data-mini="true"><label title="${msg['label.ssc.ball.EVEN']}" for="EVEN">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.TAIL_SMALL']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TAIL_SMALL" id="TAIL_SMALL" data-mini="true"><label title="${msg['label.ssc.ball.TAIL_SMALL']}" for="TAIL_SMALL">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.SUM_EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SUM_EVEN" id="SUM_EVEN" data-mini="true"><label title="${msg['label.ssc.ball.SUM_EVEN']}" for="SUM_EVEN">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.CHUN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="CHUN" id="CHUN" data-mini="true"><label title="${msg['label.ssc.ball.CHUN']}" for="CHUN">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.XIA']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="XIA" id="XIA" data-mini="true"><label title="${msg['label.ssc.ball.XIA']}" for="XIA">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.QIU']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIU" id="QIU" data-mini="true"><label title="${msg['label.ssc.ball.QIU']}" for="QIU">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.DONG']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="DONG" id="DONG" data-mini="true"><label title="${msg['label.ssc.ball.DONG']}" for="DONG">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.JIN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="JIN" id="JIN" data-mini="true"><label title="${msg['label.ssc.ball.JIN']}" for="JIN">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.MU']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="MU" id="MU" data-mini="true"><label title="${msg['label.ssc.ball.MU']}" for="MU">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.SHUI']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SHUI" id="SHUI" data-mini="true"><label title="${msg['label.ssc.ball.SHUI']}" for="SHUI">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.HUO']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HUO" id="HUO" data-mini="true"><label title="${msg['label.ssc.ball.HUO']}" for="HUO">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.TU']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TU" id="TU" data-mini="true"><label title="${msg['label.ssc.ball.TU']}" for="TU">0.00</label></fieldset></td>
				  <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<c:if test="${obj.betOn=='BALL_1'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_1']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_2'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_2']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_3'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_3']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_4'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_4']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_5'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_5']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_6'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_6']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_7'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_7']}">
		</c:if>
		<c:if test="${obj.betOn=='BALL_8'}">
			<input type="hidden" id="play_text" value="${msg['label.ssc.play.BALL_8']}">
		</c:if>
	</div>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>