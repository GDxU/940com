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
<c:set var="page_title" value="${msg['title.ssc.XJSSC']}" scope="request"/>
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
			      <th data-priority="1"> </th>
			      <th>号码</th>
			      <th>${msg['title.ssc.radio']}</th>
			      <th>号码</th>
			      <th>${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<tr class="ssc">
			      <td class="td-bgcolor"><span>万千${msg['label.ssc.play.HS_SM']} OOXXX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WQ_ODD" id="WQ_ODD" data-mini="true"><label for="WQ_ODD" title="万千${msg['label.ssc.play.HS_SM']} OOXXX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WQ_EVEN" id="WQ_EVEN" data-mini="true"><label for="WQ_EVEN" title="万千${msg['label.ssc.play.HS_SM']} OOXXX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			  	<tr class="ssc">
			      <td class="td-bgcolor"><span>万百${msg['label.ssc.play.HS_SM']} OXOXX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WB_ODD" id="WB_ODD" data-mini="true"><label for="WB_ODD" title="万百${msg['label.ssc.play.HS_SM']} OXOXX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WB_EVEN" id="WB_EVEN" data-mini="true"><label for="WB_EVEN" title="万百${msg['label.ssc.play.HS_SM']} OXOXX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			  	<tr class="ssc">
			      <td class="td-bgcolor"><span>万十${msg['label.ssc.play.HS_SM']} OXXOX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WS_ODD" id="WS_ODD" data-mini="true"><label for="WS_ODD" title="万十${msg['label.ssc.play.HS_SM']} XOXOX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WS_EVEN" id="WS_EVEN" data-mini="true"><label for="WS_EVEN" title="万十${msg['label.ssc.play.HS_SM']} XOXOX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>万个${msg['label.ssc.play.HS_SM']} OXXXO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WG_ODD" id="WG_ODD" data-mini="true"><label for="WG_ODD" title="万个${msg['label.ssc.play.HS_SM']} XOXXO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WG_EVEN" id="WG_EVEN" data-mini="true"><label for="WG_EVEN" title="万个${msg['label.ssc.play.HS_SM']} XOXXO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			  	<tr class="ssc">
			      <td class="td-bgcolor"><span>千百${msg['label.ssc.play.HS_SM']} XOOXX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QB_ODD" id="QB_ODD" data-mini="true"><label for="QB_ODD" title="千百${msg['label.ssc.play.HS_SM']} XOOXX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QB_EVEN" id="QB_EVEN" data-mini="true"><label for="QB_EVEN" title="千百${msg['label.ssc.play.HS_SM']} XOOXX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			  	<tr class="ssc">
			      <td class="td-bgcolor"><span>千十${msg['label.ssc.play.HS_SM']} XOXOX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QS_ODD" id="QS_ODD" data-mini="true"><label for="QS_ODD" title="千十${msg['label.ssc.play.HS_SM']} XOXOX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QS_EVEN" id="QS_EVEN" data-mini="true"><label for="QS_EVEN" title="千十${msg['label.ssc.play.HS_SM']} XOXOX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>千个${msg['label.ssc.play.HS_SM']} XOXXO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QG_ODD" id="QG_ODD" data-mini="true"><label for="QG_ODD" title="千个${msg['label.ssc.play.HS_SM']} XOXXO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QG_EVEN" id="QG_EVEN" data-mini="true"><label for="QG_EVEN" title="千个${msg['label.ssc.play.HS_SM']} XOXXO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十${msg['label.ssc.play.HS_SM']} XXOOX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_ODD" id="BS_ODD" data-mini="true"><label for="BS_ODD" title="百十${msg['label.ssc.play.HS_SM']} XXOOX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_EVEN" id="BS_EVEN" data-mini="true"><label for="BS_EVEN" title="百十${msg['label.ssc.play.HS_SM']} XXOOX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百个${msg['label.ssc.play.HS_SM']} XXOXO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_ODD" id="BG_ODD" data-mini="true"><label for="BG_ODD" title="百个${msg['label.ssc.play.HS_SM']} XXOXO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_EVEN" id="BG_EVEN" data-mini="true"><label for="BG_EVEN" title="百个${msg['label.ssc.play.HS_SM']} XXOXO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>十个${msg['label.ssc.play.HS_SM']} XXXOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_ODD" id="SG_ODD" data-mini="true"><label for="SG_ODD" title="十个${msg['label.ssc.play.HS_SM']} XXXOO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_EVEN" id="SG_EVEN" data-mini="true"><label for="SG_EVEN" title="十个${msg['label.ssc.play.HS_SM']} XXXOO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="${msg['label.ssc.play.HS_SM']}">
	</div>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type= "text/javascript" >
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script >

</html>