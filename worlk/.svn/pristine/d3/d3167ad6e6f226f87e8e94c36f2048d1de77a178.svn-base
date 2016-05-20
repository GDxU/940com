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

    if("${obj.cf.shssc_1}" != '' && "${obj.cf.shssc_1}" != 1){
	   	$.each($("[id^='BALL_1_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.shssc_2}" != '' && "${obj.cf.shssc_2}" != 1){
	   	$.each($("[id^='BALL_2_']"), function(){
	   		$(this).parent().parent().hide();
	   	});    
    }
    if("${obj.cf.shssc_3}" != '' && "${obj.cf.shssc_3}" != 1){
	   	$.each($("[id^='BALL_3_']"), function(){
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
<c:set var="page_title" value="${msg['title.ssc.SHSSC']}" scope="request"/>
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
			      <td class="td-bgcolor"><span>百十${msg['label.ssc.play.HS_SM']} OOX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_ODD" id="BS_ODD" data-mini="true"><label for="BS_ODD" title="百十${msg['label.ssc.play.HS_SM']} OOX ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_EVEN" id="BS_EVEN" data-mini="true"><label for="BS_EVEN" title="百十${msg['label.ssc.play.HS_SM']} OOX ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百个${msg['label.ssc.play.HS_SM']} OXO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_ODD" id="BG_ODD" data-mini="true"><label for="BG_ODD" title="百个${msg['label.ssc.play.HS_SM']} OXO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_EVEN" id="BG_EVEN" data-mini="true"><label for="BG_EVEN" title="百个${msg['label.ssc.play.HS_SM']} OXO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>十个${msg['label.ssc.play.HS_SM']} XOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_ODD" id="SG_ODD" data-mini="true"><label for="SG_ODD" title="十个${msg['label.ssc.play.HS_SM']} XOO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_EVEN" id="SG_EVEN" data-mini="true"><label for="SG_EVEN" title="十个${msg['label.ssc.play.HS_SM']} XOO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十个${msg['label.ssc.play.HS_SM']} OOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.ODD']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_ODD" id="BSG_ODD" data-mini="true"><label for="BSG_ODD" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.ODD']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.EVEN']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_EVEN" id="BSG_EVEN" data-mini="true"><label for="BSG_EVEN" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.EVEN']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十个${msg['label.ssc.play.HS_SM']} OOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_BIG" id="BSG_BIG" data-mini="true"><label for="BSG_BIG" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.BIG']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_SMALL" id="BSG_SMALL" data-mini="true"><label for="BSG_SMALL" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.SMALL']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十${msg['label.ssc.play.HS_SM']} OOX</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_TAIL_BIG" id="BS_TAIL_BIG" data-mini="true"><label for="BS_TAIL_BIG" title="百十${msg['label.ssc.play.HS_SM']} OOX ${msg['label.ssc.ball.TAIL_BIG']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_TAIL_SMALL" id="BS_TAIL_SMALL" data-mini="true"><label for="BS_TAIL_SMALL" title="百十${msg['label.ssc.play.HS_SM']} OOX ${msg['label.ssc.ball.TAIL_SMALL']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十${msg['label.ssc.play.HS_SM']} OOX</span></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_ZHISHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_TAIL_ZHISHU" id="BS_TAIL_ZHISHU" data-mini="true"><label for="BS_TAIL_ZHISHU" title="百十${msg['label.ssc.play.HS_SM']} OOX 尾${msg['label.ssc.ball.TAIL_ZHISHU']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_HESHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BS_TAIL_HESHU" id="BS_TAIL_HESHU" data-mini="true"><label for="BS_TAIL_HESHU" title="百十${msg['label.ssc.play.HS_SM']} OOX 尾${msg['label.ssc.ball.TAIL_HESHU']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百个${msg['label.ssc.play.HS_SM']} OXO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_TAIL_BIG" id="BG_TAIL_BIG" data-mini="true"><label for="BG_TAIL_BIG" title="百个${msg['label.ssc.play.HS_SM']} OXO ${msg['label.ssc.ball.TAIL_BIG']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_TAIL_SMALL" id="BG_TAIL_SMALL" data-mini="true"><label for="BG_TAIL_SMALL" title="百个${msg['label.ssc.play.HS_SM']} OXO ${msg['label.ssc.ball.TAIL_SMALL']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百个${msg['label.ssc.play.HS_SM']} OXO</span></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_ZHISHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_TAIL_ZHISHU" id="BG_TAIL_ZHISHU" data-mini="true"><label for="BG_TAIL_ZHISHU" title="百个${msg['label.ssc.play.HS_SM']} OXO 尾${msg['label.ssc.ball.TAIL_ZHISHU']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_HESHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BG_TAIL_HESHU" id="BG_TAIL_HESHU" data-mini="true"><label for="BG_TAIL_HESHU" title="百个${msg['label.ssc.play.HS_SM']} OXO 尾${msg['label.ssc.ball.TAIL_HESHU']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>十个${msg['label.ssc.play.HS_SM']} XOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_TAIL_BIG" id="SG_TAIL_BIG" data-mini="true"><label for="SG_TAIL_BIG" title="十个${msg['label.ssc.play.HS_SM']} XOO ${msg['label.ssc.ball.TAIL_BIG']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_TAIL_SMALL" id="SG_TAIL_SMALL" data-mini="true"><label for="SG_TAIL_SMALL" title="十个${msg['label.ssc.play.HS_SM']} XOO ${msg['label.ssc.ball.TAIL_SMALL']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>十个${msg['label.ssc.play.HS_SM']} XOO</span></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_ZHISHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_TAIL_ZHISHU" id="SG_TAIL_ZHISHU" data-mini="true"><label for="SG_TAIL_ZHISHU" title="十个${msg['label.ssc.play.HS_SM']} XOO 尾${msg['label.ssc.ball.TAIL_ZHISHU']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_HESHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SG_TAIL_HESHU" id="SG_TAIL_HESHU" data-mini="true"><label for="SG_TAIL_HESHU" title="十个${msg['label.ssc.play.HS_SM']} XOO 尾${msg['label.ssc.ball.TAIL_HESHU']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十个${msg['label.ssc.play.HS_SM']} OOO</span></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_BIG']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_TAIL_BIG" id="BSG_TAIL_BIG" data-mini="true"><label for="BSG_TAIL_BIG" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.TAIL_BIG']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>${msg['label.ssc.ball.TAIL_SMALL']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_TAIL_SMALL" id="BSG_TAIL_SMALL" data-mini="true"><label for="BSG_TAIL_SMALL" title="百十个${msg['label.ssc.play.HS_SM']} OOO ${msg['label.ssc.ball.TAIL_SMALL']}">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>百十个${msg['label.ssc.play.HS_SM']} OOO</span></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_ZHISHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_TAIL_ZHISHU" id="BSG_TAIL_ZHISHU" data-mini="true"><label for="BSG_TAIL_ZHISHU" title="百十个${msg['label.ssc.play.HS_SM']} OOO 尾${msg['label.ssc.ball.TAIL_ZHISHU']}">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>尾${msg['label.ssc.ball.TAIL_HESHU']}</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="BSG_TAIL_HESHU" id="BSG_TAIL_HESHU" data-mini="true"><label for="BSG_TAIL_HESHU" title="百十个${msg['label.ssc.play.HS_SM']} OOO 尾${msg['label.ssc.ball.TAIL_HESHU']}">0.00</label></fieldset></td>
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