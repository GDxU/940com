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
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeBetOn('" + $("#bon").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	$("input[type='checkbox']").on("click",function(e){
		scbox(this);
    });
    $(document).on("click","input[rel='d']",function(e){
    	cdb(this,0);
    });
    $("#cancelOrderBtn").on("click",function(){
    	$.mobile.changePage("#rateInfoPage", "slideup");
        changeBetOn($("#bon").val(),1);
    });
    $("#submitOrderBtn").on("click",function(){
    	if(isMoney($("#serial_money").val())){
    		if($("#issue").val()!=$("#isid").html()){
				alert('期号不一致！');
				$.mobile.changePage("#rateInfoPage", "slideup");
	        	changeBetOn($("#bon").val(),1);
			}else{
				if(creShowOrder()){
			    	$.mobile.changePage("#showOrder", {changeHash:false});
		        }else{
		        	alert(utf8to16(base64decode( '5qC55o2u5ri45oiP6KeE5YiZ77yM5peg5rOV57uE5oiQ5rOo5Y2V5LiL5rOo77yB' )));
		        	$.mobile.changePage("#rateInfoPage", "slideup");
	        		changeBetOn($("#bon").val(),1);
		        }
			}
    	}
    });
    $("#cancelBtn").on("click",function(){
        $.mobile.changePage("#rateInfoPage", "slideup");
        changeBetOn($("#bon").val(),1);
    });
	$("#orderBtn").on("click",function(e) {
		$("#serial_money").val('');
        if (sobc()){
            $("#isid").html($("#issue").val());
            $("#hcid").html($("#hcType").val());
            $("#maxws").html($("#mawh").val());
	        var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        $("input:checked").each(function (i) {
	            var o = $("label[for='" + $(this).attr("id") + "']");
	            var item = new Array(o.attr("for"), o.attr("title"), o.text());
	            var str = "";
	            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>" + $("#play_text").val() + o.attr("title") + "</span>";
	            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + o.text() + "</span>";
	            str += "<input type='hidden' name='type' value='" + $(this).attr("id") + "'>";
	            str += "<input type='hidden' id='r_" + $(this).attr("id") + "' name='rate' value='" + o.text() + "'><input type='hidden' min='1' max='50000' name='amount'>";
	            str += "<input type='hidden' name='typeTitle' value='" + o.attr("title") + "'></td>";
	            str += "<td align='right' class='tdselect' style='border:none;'><span>"
	            str += "<input type='button' value='删' rel='d' s='" + o.attr("for") + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
	            $(str).appendTo(tbody);
	        });
	        ot.append(tbody);
	        $.mobile.changePage("#toBet", {changeHash:false});
	        getUserInfo();
        } 
    });
    $("#submitBtn").on("click",function(){
    	ssbc();
    });
    $("#hcth").on("click",function(){
    	if(hca == 1){
	    	$.mobile.changePage("#hctm", "slideup");
    	}
    });
    showhc();
});

function changeBetOn(betOn,flag){
	$("#bon").val(betOn);
	if(betOn=='SERIAL_2'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_2']}"));
	}
	if(betOn=='SERIAL_2_Z'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_2_Z']}"));
	}
	if(betOn=='SERIAL_3'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_3']}"));
	}
	if(betOn=='SERIAL_3_Z'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_3_Z']}"));
	}
	if(betOn=='SERIAL_4'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_4']}"));
	}
	if(betOn=='SERIAL_5'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_5']}"));
	}
	if(flag==1){
		var str = "changeBetOn('" + betOn + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
	}else{
		getRateInfo($("#gameId").val(),$("#bon").val(),0);
	}
}
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
var bonStr = '{"SERIAL_2":"2","SERIAL_2_Z":"2","SERIAL_3":"3","SERIAL_3_Z":"3","SERIAL_4":"4","SERIAL_5":"5"}';
var bonNum = eval('(' + bonStr + ')');
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.TJKLC']}" scope="request"/>
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
  			<div data-role="navbar">
			    <ul>
			        <li><a href="#" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_2')">${msg['label.ssc.play.SERIAL_2']}</a></li>
			        <li><a href="#" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_2_Z')">${msg['label.ssc.play.SERIAL_2_Z']}</a></li>
			        <li><a href="#" ${obj.nav == 3 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_3')">${msg['label.ssc.play.SERIAL_3']}</a></li>
			    </ul>
			    <ul>
			    	<li><a href="#" ${obj.nav == 4 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_3_Z')">${msg['label.ssc.play.SERIAL_3_Z']}</a></li>
			        <li><a href="#" ${obj.nav == 5 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_4')">${msg['label.ssc.play.SERIAL_4']}</a></li>
			        <li><a href="#" ${obj.nav == 6 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_5')">${msg['label.ssc.play.SERIAL_5']}</a></li>
			    </ul>
			</div>
			<table border="1" class="hdptable">
				<thead>
			    <tr class="tr-bgcolor">
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			     <tr class="klc">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1" id="NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2" id="NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3" id="NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4" id="NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5" id="NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6" id="NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7" id="NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8" id="NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9" id="NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_10" id="NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_11" id="NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="NO_11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num12"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_12" id="NO_12" data-mini="true"><label title="${msg['label.ssc.ball.NO_12']}" for="NO_12">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num13"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_13" id="NO_13" data-mini="true"><label title="${msg['label.ssc.ball.NO_13']}" for="NO_13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num14"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_14" id="NO_14" data-mini="true"><label title="${msg['label.ssc.ball.NO_14']}" for="NO_14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num15"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_15" id="NO_15" data-mini="true"><label title="${msg['label.ssc.ball.NO_15']}" for="NO_15">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num16"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_16" id="NO_16" data-mini="true"><label title="${msg['label.ssc.ball.NO_16']}" for="NO_16">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num17"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_17" id="NO_17" data-mini="true"><label title="${msg['label.ssc.ball.NO_17']}" for="NO_17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num18"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_18" id="NO_18" data-mini="true"><label title="${msg['label.ssc.ball.NO_18']}" for="NO_18">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="number num19"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_19" id="NO_19" data-mini="true"><label title="${msg['label.ssc.ball.NO_19']}" for="NO_19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num20"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_20" id="NO_20" data-mini="true"><label title="${msg['label.ssc.ball.NO_20']}" for="NO_20">0.00</label></fieldset></td>
				  <td></td><td></td>				    
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br><br>
		</div>
		<input type="hidden" id="play_text" value="${msg['label.ssc.play.SERIAL_2']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_s_bet.jsp" %>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>