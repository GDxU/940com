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
var sno = 0;
$(function(){
	$("label").addClass("ui-btn-z"); 
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeBetOn('" + $("#bon").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	$("ul li .ui-btn-active").click();
	$("input[type='checkbox']").on("click",function(e){
		if($(this).attr("id").indexOf("QIAN")>=0){
			if($(this).prop("checked")){
				qno++;
			}else{
				qno--;
			}
		}else if($(this).attr("id").indexOf("HOU")>=0){
			if($(this).prop("checked")){
				hno++;
			}else{
				hno--;
			}	
		}else{
			if($(this).prop("checked")){
				sno++;
			}else{
				sno--;
			}
		}
		if(qno>10){
			//alert('选二连直前位最多选择10个号码');
			$(this).prop("checked",false).checkboxradio("refresh");
			setTimeout("alert('直选第一位最多选择10个号码');",200);
			qno--;
		}else if(hno>10){
			//alert('选二连直后位最多选择10个号码');
			$(this).prop("checked",false).checkboxradio("refresh");
			setTimeout("alert('直选第二位最多选择10个号码');",200);
			hno--;
		}else if(sno>10){
			$(this).prop("checked",false).checkboxradio("refresh");
			setTimeout("alert('直选第三位最多选择10个号码');",200);
			sno--;
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
				if(creShowOrder_2lz()){
		    		$.mobile.changePage("#showOrder", {changeHash:false});
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
        if (checkBox()) {
        	$("#isid").html($("#issue").val());
        	$("#hcid").html($("#hcType").val());
        	$("#maxws").html($("#mawh").val());
            var ot = $("#orderTable");
            ot.children("tbody").remove();
            var tbody = $("<tbody></tbody>");
            var flagq = 0;
            var flagh = 0;
            var flags = 0;
            $("input:checked").each(function (i) {
                var o = $("label[for='" + $(this).attr("id") + "']");
                var item = new Array(o.attr("for"), o.attr("title"), o.text());
                var str = "";
                if(flagq==0&&$(this).attr("id").indexOf("QIAN")>=0){
                	str += "<tr><td style='border:none;' class='titled'>第一位</td></tr>"
                	flagq = 1;
                }
                if(flagh==0&&$(this).attr("id").indexOf("HOU")>=0){
                	str += "<tr><td style='border:none;' class='titled'>第二位</td></tr>"
                	flagh = 1;
                }
                if($("#bon").val()=='SERIAL_ZHI_3'){
                	if(flags==0&&$(this).attr("id").indexOf("SAN")>=0){
	                	str += "<tr><td style='border:none;' class='titled'>第三位</td></tr>"
	                	flags = 1;
	                }
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
		if($("#issue").val()!=$("#isid").html()){
			alert('期号不一致！');
			$.mobile.changePage("#rateInfoPage", "slideup");
	    	changeBetOn($("#bon").val(),1);
		}else{
			var obj = $("[name='amount']");
			var amount = $("#serial_money").val();
			for(var j = 0; j < obj.length; j++){
				obj[j].value = amount;
			}
			subOrderzx();
		}
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
	var sarr = new Array();
	for(var i=0;i<objt.length;i++){
		if(objt[i].value.indexOf("QIAN")>=0){
			qarr.push(objtt[i].value);
		}
		if(objt[i].value.indexOf("HOU")>=0){
			harr.push(objtt[i].value);
		}
		if($("#bon").val()=='SERIAL_ZHI_3'){
			if(objt[i].value.indexOf("SAN")>=0){
				sarr.push(objtt[i].value);
			}
		}
	}
	var rarr = new Array();
	if($("#bon").val()=='SERIAL_ZHI_2'){
		for(var i=0;i<qarr.length;i++){
			for(var k=0;k<harr.length;k++){
				if(qarr[i] != harr[k]){
					rarr.push(qarr[i] + ',' + harr[k]);
				}
			}
		}
	}else{
		for(var i=0;i<qarr.length;i++){
			for(var k=0;k<harr.length;k++){
				for(var m=0;m<sarr.length;m++){
					if(qarr[i] != harr[k] && qarr[i] != sarr[m] && harr[k] != sarr[m]){
						rarr.push(qarr[i] + ',' + harr[k] + ',' + sarr[m]);
					}
				}
			}
		}
	}
	if(rarr.length<1){
		alert(utf8to16(base64decode( '5qC55o2u5ri45oiP6KeE5YiZ77yM5peg5rOV57uE5oiQ5rOo5Y2V5LiL5rOo77yB' )));
       	$.mobile.changePage("#rateInfoPage", "slideup");
      	changeBetOn($("#bon").val(),1);
      	return false;
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
		if('SERIAL_ZHI_3'==$("#bon").val()){
			var sno = nos[2];
			if(sno.substring(0,1)==0){
				sno = sno.substring(1, sno.length);
			}
			if(parseFloat($("#r_SAN-NO_" + sno).val())<mr){
				mr = parseFloat($("#r_SAN-NO_" + sno).val());
			}
			//console.log(qno + ':' + $("#r_QIAN-NO_" + qno).val() + '@' + hno + ':' + $("#r_HOU-NO_" + hno).val() + '@' + hno + ':' + $("#r_SAN-NO_" + sno).val() + '!!' + mr);
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
	$("#totalOrders").text("总注数：" + rarr.length +"，合计金额：" + formNumber(rarr.length * $("#serial_money").val(), 2));
	return true;
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
			if($("#mawh").length>0){
				$("#mawh").val(obj.data.maxw);
			}
			var tem_is = '0' + issue.substring(8,issue.length);
			$("#issueNow").html('<font color="green">' + tem_is + '期</font>&nbsp;<font color="#00F">' + $("#play_text").val()+'</font>');
			
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
			$("#ykmoney").html(showColor1(0 == obj.data.yk ? "0.00" : obj.data.yk));
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
						if(betOn == "SERIAL_ZHI_3"){
							ids[k++] = 'SAN-' + id;
						}
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
					
					if(betOn == "SERIAL_ZHI_3"){
						var objS = $('[for="SAN-'+ id +'"]');
						objS.attr("rateInfo",value);
						objS.text(value);
					}					
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
			alert("用户会话失效，请重新登录！");
			window.location.href = ctx + "/login";
		};
	});	
};

function checkBox(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
   	if($("input:checked").length == 0){
   		if($("#bon").val()=='SERIAL_ZHI_2'){
	   		alert("第一球或者第二球都必须选择一个号码!");
   		}else{
   			alert("第一球或者第二球或者第三球都必须选择一个号码!");
   		}
   		return false;
   	}else{
   		if($("#bon").val()=='SERIAL_ZHI_2'){
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
	    		alert("第一球或者第二球都必须选择一个号码!");
	   			return false;
	    	}
	    	if(qn==1&&hn==1&&qv==hv){
	    		alert(utf8to16(base64decode('5omA6YCJ5Y+356CB6YeN5aSN77yM5peg5rOV57uE5oiQ5pyJ5pWI5rOo5Y2VLOivt+mHjeaWsOmAieaLqeWPt+egge+8gQ==')));
	   			return false;
	    	};
   		}else{//$("#bon").val()=='SERIAL_ZHI_3'
   			var qn = 0;
	    	var qv = '';
			var hn = 0;
	    	var hv = '';
	    	var sn = 0;
	    	var sv = '';
	    	$("input:checked").each(function () {
	    		if($(this).attr("id").indexOf("QIAN")>=0){
	    			qn++;
	    			qv = $(this).attr("id").replace("QIAN","");
	    		}else if($(this).attr("id").indexOf("HOU")>=0){
	    			hn++;
	    			hv = $(this).attr("id").replace("HOU","");
	    		}else{
	    			sn++;
	    			sv = $(this).attr("id").replace("SAN","");
	    		}
	    	});
	    	if(qn==0||hn==0||sn==0){
	    		alert("第一球或者第二球或者第三球都必须选择一个号码!");
	   			return false;
	    	}
	    	if((qn==1&&hn==1&&qv==hv) || (qn==1&&sn==1&&qv==sv) || (hn==1&&sn==1&&hv==sv)){
	    		alert(utf8to16(base64decode('5omA6YCJ5Y+356CB6YeN5aSN77yM5peg5rOV57uE5oiQ5pyJ5pWI5rOo5Y2VLOivt+mHjeaWsOmAieaLqeWPt+egge+8gQ==')));
	   			return false;
	    	};
   		}
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
function changeBetOn(betOn,flag){
	if(betOn != $("#bon").val()){
		$('input:checked').attr("checked", false).checkboxradio("refresh");
	}
	$("#bon").val(betOn);
	if(betOn=='SERIAL_ZHI_2'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_ZHI_2']}"));
		$("#sanno").hide();
	}
	if(betOn=='SERIAL_ZHI_3'){
		$("#play_text").val(replaceAllHtml("${msg['label.ssc.play.SERIAL_ZHI_3']}"));
		$("#sanno").show();
	}
	if(betOn=='SERIAL_ZHI_2'){
		$('input[id^="SAN-NO_"]').attr("checked", false).checkboxradio("refresh");
	}
	qno = 0;hno = 0;sno = 0;
	if(flag==1){
		var str = "changeBetOn('" + betOn + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
	}else{
		getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
	}
}

function subOrderzx(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit();
	var url = ctx + '/ssc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.success == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    obch();
                    alert(utf8to16(base64decode('5LiL5rOo5oiQ5Yqf77yM6K+35qOA5p+l5LiL5rOo54q25Ya15ZKM6LSm5oi35Y6G5Y+y77yB')));
                    $("input[name='isChange']").val("0");
                    $.mobile.changePage("#rateInfoPage", "slideup");
               	    changeBetOn($("#bon").val(),1);
                }else if(jsonResult.data.success == 0){
                	enableSubmitBtn();
                	alert(jsonResult.data.promptName);
                }else if(jsonResult.data.success == 2){
                	enableSubmitBtn();
                	var r = confirm(jsonResult.data.promptName);
                	if(r==true){
                		$("input[name='isChange']").val("1");
                		$("#submitBtn").click();
                	}else{
                		getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
               		    changeBetOn($("#bon").val(),1);
                		$.mobile.changePage("#rateInfoPage", "slideup");
                	}
                }
			}else{
				if(jsonResult.m!=""){
					enableSubmitBtn();
					alert(jsonResult.m);
				}else{
					alert('系统错误！');
                    $.mobile.changePage("#rateInfoPage", "slideup");
				}
			}
		}else{
			alert('系统错误！');
            $.mobile.changePage("#rateInfoPage", "slideup");
		}
	},"json");
	
    jqxhr.always(function() {
    	//setTimeout(enableSubmitBtn, 100);
	});	
}
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.JSSYXW']}" scope="request"/>
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
  			<div data-role="navbar">
			    <ul>
			    	<li><a href="#" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_ZHI_2')">前二</a></li>
			        <li><a href="#" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('SERIAL_ZHI_3')">前三</a></li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">
			<table border="1" class="hdptable">
				<thead>
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="8">第一位</th>
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
			     <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_1" id="QIAN-NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="QIAN-NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_2" id="QIAN-NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="QIAN-NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_3" id="QIAN-NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="QIAN-NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_4" id="QIAN-NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="QIAN-NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_5" id="QIAN-NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="QIAN-NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_6" id="QIAN-NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="QIAN-NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_7" id="QIAN-NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="QIAN-NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_8" id="QIAN-NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="QIAN-NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9" id="QIAN-NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="QIAN-NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_10" id="QIAN-NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="QIAN-NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="QIAN-NO_11" id="QIAN-NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="QIAN-NO_11">0.00</label></fieldset></td>
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			<table border="1" style="width:100%;vertical-align:middle;text-align:center;font-size:12px;">
				<thead>
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="8">第二位</th>
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
			     <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_1" id="HOU-NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="HOU-NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_2" id="HOU-NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="HOU-NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_3" id="HOU-NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="HOU-NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_4" id="HOU-NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="HOU-NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_5" id="HOU-NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="HOU-NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_6" id="HOU-NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="HOU-NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_7" id="HOU-NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="HOU-NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_8" id="HOU-NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="HOU-NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_9" id="HOU-NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="HOU-NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_10" id="HOU-NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="HOU-NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="HOU-NO_11" id="HOU-NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="HOU-NO_11">0.00</label></fieldset></td>
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			<div id="sanno" style="display: none">
			<table border="1" style="width:100%;vertical-align:middle;text-align:center;font-size:12px;">
				<thead>
				<tr class="tr-bgcolor">
			      <th data-priority="1" colspan="8">第三位</th>
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
			     <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num01"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_1" id="SAN-NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="SAN-NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num02"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_2" id="SAN-NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="SAN-NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num03"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_3" id="SAN-NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="SAN-NO_3">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num04"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_4" id="SAN-NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="SAN-NO_4">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num05"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_5" id="SAN-NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="SAN-NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num06"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_6" id="SAN-NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="SAN-NO_6">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num07"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_7" id="SAN-NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="SAN-NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num08"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_8" id="SAN-NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="SAN-NO_8">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num09"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_9" id="SAN-NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="SAN-NO_9">0.00</label></fieldset></td>
			    </tr>
			    <tr class="gdsyxw">
			      <td class="td-bgcolor"><span class="number num10"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_10" id="SAN-NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="SAN-NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="number num11"></span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="SAN-NO_11" id="SAN-NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="SAN-NO_11">0.00</label></fieldset></td>
			      <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			</div>			
		</div>
		<input type="hidden" id="play_text" value="${msg['label.ssc.play.SERIAL_ZHI_2']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_s_bet.jsp" %>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>
