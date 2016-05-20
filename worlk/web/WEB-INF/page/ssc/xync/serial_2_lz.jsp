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
var qno = 0;
var hno = 0;
$(function(){
	$("label").addClass("ui-btn-z"); 
	$("input[type='checkbox']").on("click",function(e){
		if($(this).attr("id").indexOf("QIAN")>=0){
			if($(this).prop("checked")){
				qno++;
			}else{
				qno--;
			}
		}else{
			if($(this).prop("checked")){
				hno++;
			}else{
				hno--;
			}	
		}
		if(qno>10){
			$(this).prop("checked",false).checkboxradio("refresh");
			setTimeout("alert(utf8to16(base64decode('6YCJ5LqM6L+e55u05YmN5L2N5pyA5aSa6YCJ5oupMTDkuKrlj7fnoIE=')));",200);
			qno--;
		}else if(hno>10){
			$(this).prop("checked",false).checkboxradio("refresh");
			setTimeout("alert(utf8to16(base64decode('6YCJ5LqM6L+e55u05ZCO5L2N5pyA5aSa6YCJ5oupMTDkuKrlj7fnoIE=')));",200);
			hno--;
		}else {
	        if($("input:checked").length>0){
	        	obcs();
			}else{
				obch();
			}
		}
    });
    $(document).on("click","input[rel='d']",function(e){
        cdb(this,2);
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
			}else{
				creShowOrder_2lz();
	    		$.mobile.changePage("#showOrder", {changeHash:false});
			}
    	}
    });
    $("#cancelBtn").on("click",function(){
        $.mobile.changePage("#rateInfoPage", "slideup");
        changeBetOn($("#bon").val(),1);
    });
	$("#orderBtn").on("click",function(e) {
		$("#serial_money").val('');
        if (checkBox()) {
        	$("#isid").html($("#issue").val());
        	$("#hcid").html($("#hcType").val());
        	$("#maxws").html($("#mawh").val());
            var ot = $("#orderTable");
            ot.children("tbody").remove();
            var tbody = $("<tbody></tbody>");
            var flagq = 0;
            var flagh = 0;
            $("input:checked").each(function (i) {
                var o = $("label[for='" + $(this).attr("id") + "']");
                var item = new Array(o.attr("for"), o.attr("title"), o.text());
                var str = "";
                if(flagq==0&&$(this).attr("id").indexOf("QIAN")>=0){
                	str += "<tr><td style='border:none;' class='titled'>前位</td></tr>"
                	flagq = 1;
                }
                if(flagh==0&&$(this).attr("id").indexOf("HOU")>=0){
                	str += "<tr><td style='border:none;' class='titled'>后位</td></tr>"
                	flagh = 1;
                }
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
    showhcZ();
});

function creShowOrder_2lz(){
	var objtt = $("[name='typeTitle']");
	var objt = $("[name='type']");
	var qarr = new Array();
	var harr = new Array();
	for(var i=0;i<objt.length;i++){
		if(objt[i].value.indexOf("QIAN")>=0){
			qarr.push(objtt[i].value);
		}
		if(objt[i].value.indexOf("HOU")>=0){
			harr.push(objtt[i].value);
		}
	}
	var rarr = new Array();
	for(var i=0;i<qarr.length;i++){
		for(var k=0;k<harr.length;k++){
			if(qarr[i] != harr[k]){
				rarr.push(qarr[i] + ',' + harr[k]);
			}
		}
	}
	if(rarr.length<1){
		alert(utf8to16(base64decode('J+agueaNrua4uOaIj+inhOWIme+8jOaXoOazlee7hOaIkOazqOWNleS4i+azqO+8gQ==')));
       	$.mobile.changePage("#rateInfoPage", "slideup");
      	changeBetOn($("#bon").val(),1);
	}
	var ot = $("#showOrderTable");
    ot.children("tbody").remove();
    var tbody = $("<tbody></tbody>");
	for(var i=0;i<rarr.length;i++){
		var nos = rarr[i].substring(0,rarr[i].length).split(",");
		var qno = nos[0];
		if(qno.substring(0,1)==0){
			qno = qno.substring(1, qno.length);
		}
		var hno = nos[1];
		if(hno.substring(0,1)==0){
			hno = hno.substring(1, hno.length);
		}
		var mr = parseFloat($("#r_HOU-NO_" + hno).val());
		if(parseFloat($("#r_QIAN-NO_" + qno).val())<mr){
			mr = parseFloat($("#r_QIAN-NO_" + qno).val());
		}
		var str = "";
		str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
		str += $("#play_text").val() + rarr[i] + "</span>";
		str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + mr + "</span></td>";
		str += "<td align='right' class='tdselect' style='border:none;font-size:12px;'><span>" + formNumber($("#serial_money").val(),2) + " &nbsp; </span></td></tr>";
		$(str).appendTo(tbody);
	}
	var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
	tst += tst;
	$(tst).appendTo(tbody);
	ot.append(tbody);
	ot.trigger( "create" );
	$("#totalOrders").text(utf8to16(base64decode('5oC75rOo5pWw77ya')) + rarr.length + utf8to16(base64decode('77yM5oC75LiL5rOo6YeR6aKd77ya')) + formNumber((rarr.length*$("#serial_money").val()),2));
}

function getRateInfo_2lz(gameId,betOn,isRefulsh){
	if(0==firstFlag){
		showLoader();
	}
	var url = '${ctx}/ssc/getRateInfo';
	var handType = $("#hcType").val();
	$.get(url,{gameId:gameId,betOn:betOn,handType:handType,isRefulsh:isRefulsh},function(jsonResult, status){
		if(status=="success"){
			firstFlag = 1;
			var obj = jsonResult;
			var issue = obj.data.issue;
			closeCountdown = obj.data.closeCountdown;
			optm = obj.data.optm;
			stopBet = obj.data.stopBetFlag;
			if(stopBet!=1){
				$("#optm").html('');
			}
			var tem_is = issue.substring(8,issue.length);
			$("#issueNow").html("<font color='green'>" + tem_is + "期</font>&nbsp;");
			
			if(''==obj.data.oiss||null==obj.data.oiss){
				$("#oit").hide();
			}else{
				$("#oit").show();
				$("#oiss").html(obj.data.oiss);
				var ot = $("#oit");
				ot.children("tbody").remove();
				var tbody = $("<tbody></tbody>");
				var balls = obj.data.ball.split(",");
				var bstr = '<tr><td class="' + gameClass[gameId] + '">';
				for ( var i=0;i<balls.length;i++) {
					bstr += '<span class="number num' + balls[i] + '"></span>';
				}
				bstr += '</td></tr>';
				$(bstr).appendTo(tbody);
				ot.append(tbody);
			}
			
			getCloseTime();
			$("#issue").val(issue);
			$("#ykmoney").html(showColor(obj.data.yk));
			$("#mawh").val(obj.data.maxw);
			if(obj.r==0){
				var arr = obj.list;
				var ids = new Array();
				var k = 0;
				for(var i=0;i<arr.length;i++){
					var id = arr[i].mKey;
					var value = arr[i].mValue;
					if($("#QIAN-"+id).length>0 && $("#QIAN-"+id).prev().html()!= '0.00' && $("#QIAN-"+id).prev().html()!=value){
						ids[k++] = 'QIAN-' + id;
						ids[k++] = 'HOU-' + id;
					}
					var objQ = $('[for="QIAN-'+ id +'"]');
					if((value + "").split(".").length == 1){
						value = value + ".00"
					}					
					objQ.attr("rateInfo",value);
					objQ.text(value);
					
					var objH = $('[for="HOU-'+ id +'"]');
					objH.attr("rateInfo",value);
					objH.text(value);					
				}
				if(ids.length>0){
					blink(ids);
				}
			}else{
				alert(jsonResult.m);
				window.location.href = ctx + "/ssc/menu";
			}
		}else{
			alert("系统错误...");
			window.location.href = ctx + "/ssc/menu";
		}
		var orderCount = $('input:checkbox:checked').length;
		if(orderCount>0){
			obcs();
		}else{
			obch();
		}
		hideLoader();
	},"json").fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = ctx + "/login";
		};
	});	
};

function checkBox(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
   	if($("input:checked").length == 0){
   		alert("前位或者后位都必须选择一个号码!");
   		return false;
   	}else{
    	var qn = 0;
    	var qv = '';
		var hn = 0;
    	var hv = '';
    	$("input:checked").each(function () {
    		if($(this).attr("id").indexOf("QIAN")>=0){
    			qn++;
    			qv = $(this).attr("id").replace("QIAN","");
    		}else{
    			hn++;
    			hv = $(this).attr("id").replace("HOU","");
    		}
    	});
    	if(qn==0||hn==0){
    		alert("前位或者后位都必须选择一个号码!");
   			return false;
    	}
    	if(qn==1&&hn==1&&qv==hv){
    		alert("前位和后位都只选择一个号码时，两个号码不能相同！");
   			return false;
    	};
   	}
   	return true;
}
function showhcZ(){
	if(null!=cht&&''!=cht){
		$("#hcts").attr('class', "btt-" + cht);
		$("#hcType").val(cht);
	}else{
		hca = 1;
		$("#hcts").attr('class', "btt-" + uhc[0]);
		$("#hcType").val(uhc[0]);
	}
	getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
}
function changeHCZ(v){
	$("#hdcpPopup").popup("close");
	$("#hcts").attr('class', "btt-" + v);
	$("#hcType").val(v);
	getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
}
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.XYNC']}" scope="request"/>
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
		       	 <span id="issueNow"><font color='red'>加载中...</font></span>&nbsp;<font color='blue'>选二连直</font>&nbsp;<span id="closeCountdown"></span>&nbsp;<span id="optm"></span>
		       	 <div style="float:right;" id="ykMoneyDiv">${msg['title.ssc.todayWinLoss']}:<span id="ykmoney">0.00</span></div>
		    </div> 
  			<div data-role="navbar">
			    <ul>
			        <li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_2&nav=1" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_2']}</a></li>
			        <li><a href="${ctx}/xync/topage?pageName=serial_2_lz&gameId=XYNC&betOn=SERIAL_2_LZ&nav=7" ${obj.nav == 7 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_2_LZ']}</a></li>
			        <li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_2_Z&nav=2" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_2_Z']}</a></li>
			        <li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_3&nav=3" ${obj.nav == 3 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_3']}</a></li>
			    </ul>
			    <ul>
			    	<li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_3_Z&nav=4" ${obj.nav == 4 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_3_Z']}</a></li>
			        <li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_4&nav=5" ${obj.nav == 5 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_4']}</a></li>
			        <li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_5&nav=6" ${obj.nav == 6 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['label.ssc.play.SERIAL_5']}</a></li>
			        <li>&nbsp;&nbsp;</li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">
			<table border="1" class="hdptable">
				<thead>
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="8">前位</th>
			    </tr>
			    <tr class="td-bgcolor">
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			     <tr class="xync">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_1" id="QIAN-NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="QIAN-NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_2" id="QIAN-NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="QIAN-NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_3" id="QIAN-NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="QIAN-NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_4" id="QIAN-NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="QIAN-NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_5" id="QIAN-NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="QIAN-NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_6" id="QIAN-NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="QIAN-NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_7" id="QIAN-NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="QIAN-NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_8" id="QIAN-NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="QIAN-NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9" id="QIAN-NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="QIAN-NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_10" id="QIAN-NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="QIAN-NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_11" id="QIAN-NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="QIAN-NO_11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num12"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_12" id="QIAN-NO_12" data-mini="true"><label title="${msg['label.ssc.ball.NO_12']}" for="QIAN-NO_12">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num13"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_13" id="QIAN-NO_13" data-mini="true"><label title="${msg['label.ssc.ball.NO_13']}" for="QIAN-NO_13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num14"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_14" id="QIAN-NO_14" data-mini="true"><label title="${msg['label.ssc.ball.NO_14']}" for="QIAN-NO_14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num15"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_15" id="QIAN-NO_15" data-mini="true"><label title="${msg['label.ssc.ball.NO_15']}" for="QIAN-NO_15">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num16"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_16" id="QIAN-NO_16" data-mini="true"><label title="${msg['label.ssc.ball.NO_16']}" for="QIAN-NO_16">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num17"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_17" id="QIAN-NO_17" data-mini="true"><label title="${msg['label.ssc.ball.NO_17']}" for="QIAN-NO_17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num18"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_18" id="QIAN-NO_18" data-mini="true"><label title="${msg['label.ssc.ball.NO_18']}" for="QIAN-NO_18">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num19"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_19" id="QIAN-NO_19" data-mini="true"><label title="${msg['label.ssc.ball.NO_19']}" for="QIAN-NO_19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num20"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_20" id="QIAN-NO_20" data-mini="true"><label title="${msg['label.ssc.ball.NO_20']}" for="QIAN-NO_20">0.00</label></fieldset></td>
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			<table><tr><td></td></tr></table>
			<table border="1" style="width:100%;vertical-align:middle;text-align:center;font-size:12px;">
				<thead>
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="8">后位</th>
			    </tr>				
			    <tr class="td-bgcolor">
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			     <tr class="xync">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_1" id="HOU-NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="HOU-NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_2" id="HOU-NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="HOU-NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_3" id="HOU-NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="HOU-NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_4" id="HOU-NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="HOU-NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_5" id="HOU-NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="HOU-NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_6" id="HOU-NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="HOU-NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_7" id="HOU-NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="HOU-NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_8" id="HOU-NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="HOU-NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_9" id="HOU-NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="HOU-NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_10" id="HOU-NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="HOU-NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_11" id="HOU-NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="HOU-NO_11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num12"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_12" id="HOU-NO_12" data-mini="true"><label title="${msg['label.ssc.ball.NO_12']}" for="HOU-NO_12">0.00</label></fieldset></td>
			    
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num13"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_13" id="HOU-NO_13" data-mini="true"><label title="${msg['label.ssc.ball.NO_13']}" for="HOU-NO_13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num14"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_14" id="HOU-NO_14" data-mini="true"><label title="${msg['label.ssc.ball.NO_14']}" for="HOU-NO_14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num15"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_15" id="HOU-NO_15" data-mini="true"><label title="${msg['label.ssc.ball.NO_15']}" for="HOU-NO_15">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num16"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_16" id="HOU-NO_16" data-mini="true"><label title="${msg['label.ssc.ball.NO_16']}" for="HOU-NO_16">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num17"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_17" id="HOU-NO_17" data-mini="true"><label title="${msg['label.ssc.ball.NO_17']}" for="HOU-NO_17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num18"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_18" id="HOU-NO_18" data-mini="true"><label title="${msg['label.ssc.ball.NO_18']}" for="HOU-NO_18">0.00</label></fieldset></td>
			    </tr>
			    <tr class="xync">
			      <td class="td-bgcolor"><span class="number num19"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_19" id="HOU-NO_19" data-mini="true"><label title="${msg['label.ssc.ball.NO_19']}" for="HOU-NO_19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num20"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_20" id="HOU-NO_20" data-mini="true"><label title="${msg['label.ssc.ball.NO_20']}" for="HOU-NO_20">0.00</label></fieldset></td>
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>	
			</div>
			</div>		
		</div>
		<input type="hidden" id="play_text" value="${obj.ballName}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_s_bet.jsp" %>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>