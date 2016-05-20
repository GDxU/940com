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
			    <tr>
			      <td class="td-bgcolor">龙1</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_DRAGON_1_2" id="BALL_1_DRAGON_1_2" data-mini="true"><label title="第一球[龙1VS虎2]龙1" for="BALL_1_DRAGON_1_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙1</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_DRAGON_1_3" id="BALL_1_DRAGON_1_3" data-mini="true"><label title="第一球[龙1VS虎3]龙1" for="BALL_1_DRAGON_1_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙1</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_DRAGON_1_4" id="BALL_1_DRAGON_1_4" data-mini="true"><label title="第一球[龙1VS虎4]龙1" for="BALL_1_DRAGON_1_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙1</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_DRAGON_1_5" id="BALL_1_DRAGON_1_5" data-mini="true"><label title="第一球[龙1VS虎5]龙1" for="BALL_1_DRAGON_1_5">0.00</label></fieldset></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">虎2</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_TIGER_1_2" id="BALL_1_TIGER_1_2" data-mini="true"><label title="第一球[龙1VS虎2]虎2" for="BALL_1_TIGER_1_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎3</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_TIGER_1_2" id="BALL_1_TIGER_1_3" data-mini="true"><label title="第一球[龙1VS虎3]虎3" for="BALL_1_TIGER_1_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎4</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_TIGER_1_2" id="BALL_1_TIGER_1_4" data-mini="true"><label title="第一球[龙1VS虎4]虎4" for="BALL_1_TIGER_1_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎5</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_1_TIGER_1_2" id="BALL_1_TIGER_1_5" data-mini="true"><label title="第一球[龙1VS虎5]虎5" for="BALL_1_TIGER_1_5">0.00</label></fieldset></td>
			    </tr>
			    <tr><td colspan="8"></td></tr>
			    <tr>
			      <td class="td-bgcolor">龙2</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_DRAGON_2_3" id="BALL_2_DRAGON_2_3" data-mini="true"><label title="第二球[龙2VS虎3]龙2" for="BALL_2_DRAGON_2_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙2</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_DRAGON_2_4" id="BALL_2_DRAGON_2_4" data-mini="true"><label title="第二球[龙2VS虎4]龙2" for="BALL_2_DRAGON_2_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙2</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_DRAGON_2_5" id="BALL_2_DRAGON_2_5" data-mini="true"><label title="第二球[龙2VS虎5]龙2" for="BALL_2_DRAGON_2_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">虎3</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_TIGER_2_3" id="BALL_2_TIGER_2_3" data-mini="true"><label title="第二球[龙2VS虎3]虎3" for="BALL_2_TIGER_2_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎4</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_TIGER_2_4" id="BALL_2_TIGER_2_4" data-mini="true"><label title="第二球[龙2VS虎4]虎4" for="BALL_2_TIGER_2_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎5</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_2_TIGER_2_5" id="BALL_2_TIGER_2_5" data-mini="true"><label title="第二球[龙2VS虎5]虎5" for="BALL_2_TIGER_2_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			    <tr><td colspan="8"></td></tr>
			    <tr>
			      <td class="td-bgcolor">龙3</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_DRAGON_3_4" id="BALL_3_DRAGON_3_4" data-mini="true"><label title="第三球[龙3VS虎4]龙3" for="BALL_3_DRAGON_3_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">龙3</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_DRAGON_3_5" id="BALL_3_DRAGON_3_5" data-mini="true"><label title="第三球[龙3VS虎5]龙3" for="BALL_3_DRAGON_3_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">虎4</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_TIGER_3_4" id="BALL_3_TIGER_3_4" data-mini="true"><label title="第三球[龙3VS虎4]虎4" for="BALL_3_TIGER_3_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor">虎5</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_3_TIGER_3_5" id="BALL_3_TIGER_3_5" data-mini="true"><label title="第三球[龙3VS虎5]虎5" for="BALL_3_TIGER_3_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			    <tr><td colspan="8"></td></tr>
			    <tr>
			      <td class="td-bgcolor">龙4</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_DRAGON_4_5" id="BALL_4_DRAGON_4_5" data-mini="true"><label title="第四球[龙4VS虎5]龙4" for="BALL_4_DRAGON_4_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			    <tr>
			      <td class="td-bgcolor">虎5</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BALL_4_TIGER_4_5" id="BALL_4_TIGER_4_5" data-mini="true"><label title="第四球[龙4VS虎5]虎5" for="BALL_4_TIGER_4_5">0.00</label></fieldset></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
				  <td class="td-bgcolor"> </span></td><td></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="${msg['label.ssc.play.longhu']}">
	</div>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>