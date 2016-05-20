<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link  rel="stylesheet" href="${staticFileUrl}/css/result_skin.css">
<script src="${staticFileUrl}/js/combet.js"></script>
<script src="${staticFileUrl}/js/data.js"></script>
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
<c:set var="page_title" value="${msg['title.ssc.BJKLC']}" scope="request"/>
<body>
	<section  data-role="page" id="rateInfoPage">
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
			    <c:if test = "${empty obj.cf || obj.cf.bjklc_zh == 1}">     			
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="4">${msg['label.ssc.play.TOTAL']}</th>
			    </tr>
				<tbody>
			    <tr>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.BIG']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-BIG" id="TOTAL-BIG" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.BIG']}" for="TOTAL-BIG">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.SMALL']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-SMALL" id="TOTAL-SMALL" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.SMALL']}" for="TOTAL-SMALL">0.00</label></fieldset></td>
			      </tr>
			      <tr>			      
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-ODD" id="TOTAL-ODD" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.ODD']}" for="TOTAL-ODD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-EVEN" id="TOTAL-EVEN" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}${msg['label.ssc.ball.EVEN']}" for="TOTAL-EVEN">0.00</label></fieldset></td>
			      </tr>
			      <td class="td-bgcolor">总${msg['label.ssc.ball.BIG']}${msg['label.ssc.ball.ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-BIGODD" id="TOTAL-BIGODD" data-mini="true"><label title="总${msg['label.ssc.ball.BIG']}${msg['label.ssc.ball.ODD']}" for="TOTAL-BIGODD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">总${msg['label.ssc.ball.BIG']}${msg['label.ssc.ball.EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-BIGEVEN" id="TOTAL-BIGEVEN" data-mini="true"><label title="总${msg['label.ssc.ball.BIG']}${msg['label.ssc.ball.EVEN']}" for="TOTAL-BIGEVEN">0.00</label></fieldset></td>
			      </tr>
			      <tr>			      
			      <td class="td-bgcolor">总${msg['label.ssc.ball.SMALL']}${msg['label.ssc.ball.ODD']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-SMALLODD" id="TOTAL-SMALLODD" data-mini="true"><label title="总${msg['label.ssc.ball.SMALL']}${msg['label.ssc.ball.ODD']}" for="TOTAL-SMALLODD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">总${msg['label.ssc.ball.SMALL']}${msg['label.ssc.ball.EVEN']}</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-SMALLEVEN" id="TOTAL-SMALLEVEN" data-mini="true"><label title="总${msg['label.ssc.ball.SMALL']}${msg['label.ssc.ball.EVEN']}" for="TOTAL-SMALLEVEN">0.00</label></fieldset></td>
			      </tr>
			      <td class="td-bgcolor">${msg['label.ssc.play.TOTAL']}810</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="TOTAL-HE" id="TOTAL-HE" data-mini="true"><label title="${msg['label.ssc.play.TOTAL']}810" for="TOTAL-HE">0.00</label></fieldset></td>
				  <td></td><td></td>
			      </tr>
			      </c:if>
			      <c:if test = "${empty obj.cf || obj.cf.bjklc_qh == 1}">
			      <tr class="tr-bgcolor">
				      <th data-priority="1" colspan="4">${msg['label.ssc.play.QIANHE']}</th>
				  </tr>
			      <tr>
			      <td class="td-bgcolor">前(多)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIANHE-QIAND" id="QIANHE-QIAND" data-mini="true"><label title="前(多)" for="QIANHE-QIAND">0.00</label></fieldset></td>
			      <td class="td-bgcolor">后(多)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIANHE-HOUD" id="QIANHE-HOUD" data-mini="true"><label title="后(多)" for="QIANHE-HOUD">0.00</label></fieldset></td>
			      </tr>
			      <tr>
			      <td class="td-bgcolor">前后(和)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIANHE-HE" id="QIANHE-HE" data-mini="true"><label title="前后(和)" for="QIANHE-HE">0.00</label></fieldset></td>
				  <td></td><td></td>
			      </tr>
			      </c:if>
			      <c:if test = "${empty obj.cf || obj.cf.bjklc_oh == 1}">
			      <tr class="tr-bgcolor">
				      <th data-priority="1" colspan="4">${msg['label.ssc.play.ODDHE']}</th>
				  </tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.ODD']}(多)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ODDHE-ODDD" id="ODDHE-ODDD" data-mini="true"><label title="${msg['label.ssc.ball.ODD']}(多)" for="ODDHE-ODDD">0.00</label></fieldset></td>
			      <td class="td-bgcolor">${msg['label.ssc.ball.EVEN']}(多)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ODDHE-EVEND" id="ODDHE-EVEND" data-mini="true"><label title="${msg['label.ssc.ball.EVEN']}(多)" for="ODDHE-EVEND">0.00</label></fieldset></td>
			      </tr>
			      <tr>
			      <td class="td-bgcolor">${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}(和)</td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ODDHE-HE" id="ODDHE-HE" data-mini="true"><label title="${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}(和)" for="ODDHE-HE">0.00</label></fieldset></td>
				  <td></td><td></td>
			      </tr>
			      </c:if>
			      <c:if test = "${empty obj.cf || obj.cf.bjklc_wx == 1}">
			      <tr class="tr-bgcolor">
				      <th data-priority="1" colspan="4">${msg['label.ssc.play.WUXING']}</th>
				  </tr>
					<tr>
					<td class="td-bgcolor">${msg['label.ssc.ball.JIN']}</td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WUXING-JIN" id="WUXING-JIN" data-mini="true"><label title="${msg['label.ssc.ball.JIN']}" for="WUXING-JIN">0.00</label></fieldset></td>
					<td class="td-bgcolor">${msg['label.ssc.ball.MU']}</td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WUXING-MU" id="WUXING-MU" data-mini="true"><label title="${msg['label.ssc.ball.MU']}" for="WUXING-MU">0.00</label></fieldset></td>
					</tr>
					<tr>
					<td class="td-bgcolor">${msg['label.ssc.ball.SHUI']}</td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WUXING-SHUI" id="WUXING-SHUI" data-mini="true"><label title="${msg['label.ssc.ball.SHUI']}" for="WUXING-SHUI">0.00</label></fieldset></td>
					<td class="td-bgcolor">${msg['label.ssc.ball.HUO']}</td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WUXING-HUO" id="WUXING-HUO" data-mini="true"><label title="${msg['label.ssc.ball.HUO']}" for="WUXING-HUO">0.00</label></fieldset></td>
					</tr>
					<tr>
					  <td class="td-bgcolor">${msg['label.ssc.ball.TU']}</td>
					<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="WUXING-TU" id="WUXING-TU" data-mini="true"><label title="${msg['label.ssc.ball.TU']}" for="WUXING-TU">0.00</label></fieldset></td>
					<td></td><td></td>
					 </tr>
					 </c:if>
			  </tbody>
			</table>
			</div>
			</div>
			
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="${msg['title.ssc.LIANGMIAN']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>