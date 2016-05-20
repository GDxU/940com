<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
</head>
<body>
	<div data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<c:set var="page_title" value="不{[{5Lit}]}" />
		<%@ include file="/WEB-INF/page/qxc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/qxc/panel_left_qxc.jsp" %>
		<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
		<div data-role="content" id="rateRefInfo">
			<div style="text-align: center;">
			 <div class="ui-on-lottery">	
	            <div id="openball" alt="ob" class="ob">
	            </div>
	            <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" id="s_is"></span> 期 <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
	            </div>
	        </div>
	        <div class="list_dingtime">
	        <div data-role="navbar">
	        	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4901') || fn:contains(obj.gcl,'4902') || fn:contains(obj.gcl,'4903')}">
			    <ul>
			   		<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4901')}">
				    	<li><a href="#" ${obj.gameCode == 4901 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4901')">四{[{5LiN5Lit}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4902')}">
				    	<li><a href="#" ${obj.gameCode == 4902 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4902')">五{[{5LiN5Lit}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4903')}">
				    	<li><a href="#" ${obj.gameCode == 4903 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4903')">六{[{5LiN5Lit}]}</a></li>
				    </c:if>
			    </ul>
			    </c:if>
			   <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4904') || fn:contains(obj.gcl,'4905') || fn:contains(obj.gcl,'4906')}">
			    <ul>
			   		<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4904')}">
				    	<li><a href="#" ${obj.gameCode == 4904 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4904')">七{[{5LiN5Lit}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4905')}">
				    	<li><a href="#" ${obj.gameCode == 4905 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4905')">八{[{5LiN5Lit}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4906')}">
				    	<li><a href="#" ${obj.gameCode == 4906 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('4906')">九{[{5LiN5Lit}]}</a></li>
				    </c:if>
			    </ul>
			    </c:if>
			</div>
			<div data-role="navbar" data-mini="true">
		    	<select id="px_v" onchange="changePX()">
		    		<option value="0">千位</option>
		    		<option value="1">百位</option>
		    		<option value="2">十位</option>
		    		<option value="3">个位</option>
		    		<option value="4">球5</option>
		    		<option value="5">球6</option>
		    		<option value="6">球7</option>
		    	</select>
			</div>
			<div data-role="navbar">
			    <ul>
			        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
			        <li><a href="#" id="tc_08" data-ajax="false" onclick="changeTcode('08')">多组投{[{5rOo}]}</a></li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">
			<div><span id="zdlt" class="content-info-zdlt"></span></div>
			<div class="table-cotent-lottery">   
			<div style="margin:2px; 0;"></div>
	        <div class="mainframe01">
	            <div class="min-overflow" id="h_div">
	                <div class="div01">
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	                <div class="div02">
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span>0</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="0" data-mini="true"><label for="0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span>1</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="1" data-mini="true"><label for="1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span>2</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="2" data-mini="true"><label for="2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span>3</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="3" data-mini="true"><label for="3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span>4</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="4" data-mini="true"><label for="4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span>5</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="5" data-mini="true"><label for="5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span>6</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="6" data-mini="true"><label for="6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span>7</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="7" data-mini="true"><label for="7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span>8</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="8" data-mini="true"><label for="8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span>9</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="9" data-mini="true"><label for="9">0.00</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>	        
		</div>
		</div>
		</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/page/qxc/com_s_bet.jsp" %>
</body>
<script type="text/javascript">
var zdn = 0;
var dzar = [];
var tcode = '01';
function changeHandType(){
	getRate($("#gameCode").val());
}
$(function(){
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gameCode").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	changeGame($("#gameCode").val());
	getRate($("#gameCode").val());
	$("input[type='checkbox']").on("click",function(e){
		if (tcode == '01') {
			if($("input:checked").length>0){
       			$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").addClass('spnicon').text($("input:checked").length);
			}else{
				$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").removeClass('spnicon').text('');
			} 
		} else if (tcode == '08') {
			if (zdn >= 5) {
				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
				setTimeout("alert('最多选择五组组合！');",200);
				return;
			}
			
			if ($("input:checked").length == gmmk[$("#gameCode").val()]) {
				var str = '';
				$("input:checked").each(function(){
	    				str += this.id + ',';
	    		});
	    		str = str.substring(0,str.length-1);
	    		str += '';
	    		for(var i=0;i<dzar.length;i++){
	    			if(str==dzar[i]){
	    				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	    				setTimeout("alert('该组合已存在！');",200);
	    				return;
	    			}
	    		}
	    		dzar[zdn] = str;
	    		zdn++;
	    		$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").addClass('spnicon').text(zdn);
				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
				$("#zdlt").html($("#zdlt").html() + '[' + str + ']&nbsp;');
			}
		}
        
    });
	<%--点击注*_*单按钮，展示注*_*单 --%>
    $("#orderBtn").on("click",function(e) {
    	$('#h_title').text($('ul li .ui-btn-active:first').text() +' - '+ $("#px_v").find("option:selected").text());
    	
        enableSubmitBtn();
    	 if(tcode == '01' && $("input:checked").length < gmmk[$("#gameCode").val()]){//{[{5aSN5byP}]}
   			alert('请至少选择' + gmmk[$("#gameCode").val()] + '个号码！');
   			return;
    	}
    	if(tcode == '08' && zdn < 1){//多组
    		alert('请至少选择1个组合！');
   			return;
    	}
    	$('#amount').val('');
    	$("#issue").val($("#s_is").text());
    	$("#isid").text($("#s_is").text());
    	if(tcode == '01'){//{[{5aSN5byP}]}
    		var parr = new Array();
    		var n = 0;
    		$("input:checked").each(function(){
    				parr[n++] = this.id;
    		});
    		var nra = [],nst = '',rst = '',bst = '';
    		for(var i=0;i<parr.length;i++){
    			var o = $("label[for='" + parr[i] + "']");
    			nra[parr[i]] = o.text();
    			if(i+1 != parr.length){
    				nst += parr[i] + ',';
    				rst += o.text() + ',';
    				bst += o.attr('data-type') + ',';
    			}else{
    				nst += parr[i];
    				rst += o.text() ;
    				bst += o.attr('data-type');
    			}
    		}
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	        str += "球号：</span><span class='font-size12'>" + nst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		var rarr = new Array();
    		getComb(0,'',parr,gmmk[$("#gameCode").val()],rarr);
    		str = '<div class="mainframe01">';
    		for(var i=0;i<rarr.length;i++){
    			var tn = rarr[i].substring(0,rarr[i].length-1);
    			var tr = Number.MAX_VALUE;
    			var tar = tn.split(',');
    			var temtn = '';
    			for(var j=0;j<tar.length;j++){
    				tr = Math.min(tr,nra[tar[j]]);
    				if(j<tar.length-1){
    					temtn += temtn + ', '
    				}
    			}
    			str += '<div class="border-result">' + tn + ' (' + tr + ')</div>';
    		}
    		str += '</div>';
    		$("#zdl").html(str);
    		$("#zdn").html(rarr.length);
    		
    		$("#betBall").val(bst);
			$("#rateAll").val(rst);
			$('#betType').val(1);
	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    	getUserInfo();
    	}
    	
    	if(tcode == '08'){//多组
    		$("#zdl").html('');
    		var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        var str = '';
	        var bbs = '';//01#02#03,02#15#20
	        var mrate = '';
	        var ras = '';//2.1#2.2#2.2,2.2#2.1#2.2
    		for(var i=0;i<dzar.length;i++){
    			var tem = dzar[i].split(',');
    			var minr = Number.MAX_VALUE;
    			for(var j=0;j<tem.length;j++){
    				var o = $("label[for='" + tem[j] + "']");
    				minr = Math.min(minr,o.text());
    				bbs += o.attr('data-type') + ',';
    				ras += o.text() + ',';
    			}
		        str += "<tr class='trhight' style='border:none;'>";
		        str += "<td style='border:none;'><span class='spannum1'>{[{5rOo}]}{[{5Y2V}]}：</span><span class='font-size12'>" + dzar[i] + "(" + minr + ")" + "</span></td>";
	    		str += "</tr>";
	    		
	    		bbs = bbs.substring(0, bbs.length-1);
	    		ras = ras.substring(0, ras.length-1);
	    		mrate += minr;
	    		if(i != dzar.length-1){
	    			bbs += '#';
	    			mrate += '#';
	    			ras += '#';
	    		}
    		}
    		str = replaceAllHtml(str);
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		$("#zdn").html(dzar.length);
    		
    		$("#betBall").val(bbs);
			$("#rateAll").val(mrate);
			$('#betType').val(0);
    		
    		$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
    		getUserInfo();
    	}
        
    });
    <%-- 下*_*注页面点击删按钮 --%>
    $(document).on("click","input[rel='d']",function(e){
       	$("#"+$(this).attr("s")).prop("checked",false).checkboxradio("refresh");
		var b = $(this).parent().parent().parent().siblings().length;
	    $(this).parent().parent().parent().remove();
	    if($("input:checked").length>0){
	    	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
	    if(b == 2){
	        $.mobile.changePage("#rateInfoPage", {transition:'none'});
	    	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	    	var str = "changeBetOn('" + $("#bon").val() + "')";
	    	$("[onclick='" + str + "']").addClass("ui-btn-active");
	    }
    });
    <%-- 下*_*注页面，点击填按钮--%>
    $(document).on("click","input[rel='w']",function(e){
    	var num = 5;
		if(''!=$(this).prev().val()){
	        num = $(this).prev().val();
		}
		var o = $("[name='amount']");
		for(var j = 0; j < o.length; j++){
			o[j].value = num;
		}
    });
    <%-- 提交注*_*单--%>
    $("#submitBtn").on("click",function(){
    	var checkR = checkParam();
		if(checkR){
			if (tcode == '08') {
				var l = $("#betBall").val().split('#'), amount = '';
				if (l.length > 1){
					for(var i = 0; i < l.length; i++ ) {
						if( i != l.length - 1){
							amount += $('#amount').val() + ',';
						} else {
							amount += $('#amount').val();
						}
					}
				} else {
					amount = $('#amount').val();
				}
				$("#betAmount").val(amount);
			} else if (tcode == '01') {
				$("#betAmount").val($('#amount').val());
			}
			subOrder();
		}
    });
    
    $("#cancelBtn").on("click",function(){
		$.mobile.changePage("#rateInfoPage", {changeHash:false, transition:'none'});
		$("#tc_" + tcode).addClass('ui-btn-active');
	});
});

var gmmk = {
	    '4901': 4,
	    '4902': 5,
	    '4903': 6,
	    '4904': 7,
	    '4905': 8,
	    '4906': 9,
	};
	
function changeGame(game){
	if(game != $("#gameCode").val()){
		showLoader();
		$("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGame('" + game + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
		$("#gameCode").val(game);
		
		var $px_va = $("#px_v");
		$px_va.empty();
		$px_va.append('<option value="0">千位</option>');
		$px_va.append('<option value="1">百位</option>');
		$px_va.append('<option value="2">十位</option>');
		$px_va.append('<option value="3">个位</option>');
		$px_va.append('<option value="4">球5</option>');
		$px_va.append('<option value="5">球6</option>');
		$px_va.append('<option value="6">球7</option>');
		$px_va.selectmenu("refresh");
		
		tcode = '01';
		getRate($("#gameCode").val());
		
		setTimeout(function(){
			hideLoader();
			},300);
	}
	
	$("#tc_" + tcode).trigger("click");
	
}

function changeTcode(tc){
	$("#tc_01").removeClass('ui-btn-active');
	$("#tc_08").removeClass('ui-btn-active');
	tcode = tc;
	$("#tc_" + tcode).addClass('ui-btn-active');
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
	zdn = 0;
	dzar = [];
	$("#zdlt").html('');
}

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit(replaceAllHtml("{[{5rOo}]}单提交中，请稍后..."));
	var url = ctx + '/qxc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.code == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
                    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
					$("ul li .ui-btn-active").removeClass("ui-btn-active");
			    	var str = "changeGame('" + $("#gameCode").val() + "')";
			    	$("[onclick='" + str + "']").addClass("ui-btn-active");
					zdn = 0;
					dzar = [];
					$("#zdlt").html('');
                    var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	alert(jsonResult.data.description);
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                }
			}else{
				alert('系统错误！');
				$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                $.mobile.changePage("#rateInfoPage", {transition:'none'});
			}
		}else{
			alert('系统错误！');
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
		}
	},"json");

    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	hideLoader();
		if(textStatus == 'error'){
			console.log("error:" + jqXHR.responseText);
		}else if(textStatus == 'parsererror'){
			if(jqXHR.responseText.indexOf("session invalidate") > -1){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";					
			}else{
				console.log("parsererror:" + jqXHR.responseText);
			}
		} 
    });
    	
    jqxhr.always(function() {
    	$("#isChange").val("0");
    	$("#tc_" + tcode).addClass('ui-btn-active');
	});	
}

function enableSubmitBtn(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
}

function checkParam(){
	var obj = $("#amount");
	var te= /^[1-9]+[0-9]*]*$/;
	for(var i = 0; i < obj.length; i++){
		if(!te.test(obj[i].value)){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
			return false;
		}
		if(parseInt(obj[i].value)<parseInt($("#mi").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能低于单{[{5rOo}]}最低限额' + $("#mi").val());alert(btem);
			return;
		}
		if(parseInt(obj[i].value)>parseInt($("#mx").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能高于单{[{5rOo}]}最高限额' + $("#mx").val());alert(btem);
			return;
		}
	}
	if($("#issue").val()!=$("#s_is").text()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
		return false;
	}
	return true;
}


function getUserInfo(){
	var url = ctx + '/qxc/getUserInfo?t=' + new Date().getTime();
	$.get(url,function(jsonResult, status){
		if(status=="success"){
			var obj = eval('(' + jsonResult + ')');
			if(obj.r==0){
				$("#anid").html(obj.data.an + "&nbsp;&nbsp;");
				$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
			}
		}
	});
}

var s_is = '';
var s_ob = '';
var s_ot = '';
var s_st = '';
var s_io = '';// 封：0，开*盘*中为：1
var s_flag = 0;
var temData = '';
function getRate(game,px,tj){
	var url = ctx + '/qxc/getRateInfo';
	var pk = ss.getItem("pk");
	$.get(url,{game:game,px:px,tj:tj,pk:pk},function(jsonResult){
		var obj = eval('(' + jsonResult + ')');
		if(obj.r==0){
			if(obj.data.code==0){
				s_is = obj.data.issue;
				s_ob = obj.data.ob;
				s_ot = obj.data.ot;
				s_io = obj.data.io;
				s_st = obj.data.st;
				s_flag = 1;
				$("#mi").val(obj.data.mi);
				$("#mx").val(obj.data.mx);
				$("#tm").val(obj.data.tm);
				$("#comm").val(obj.data.c);
				var rateObj = eval('(' + obj.data.rate + ')');
				temData = rateObj;
				parseData($("#px_v").val());
				
			}else if(obj.data.code==2){
				var btem = replaceAllHtml('该玩法已经隐藏，不能{[{5oqV5rOo}]}!');alert(btem);
				window.location.href = ctx + "/qxc";
			}
		}else{
			var obj = eval('(' + jsonResult + ')');
			alert(obj.m);
			window.location.href = ctx + "/index";
		}
	});
}

function parseData(type) {
	if (type == null) type = 0;
	var ti = 0;
	for (var i in temData) {
		if (type == 0) {
			if (i < 10) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type == 1) {
			if (i >= 10 && i < 20) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type == 2) {
			if (i >= 20 && i < 30) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type == 3) {
			if (i >= 30 && i < 40) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type == 4) {
			if (i >= 40 && i < 50) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type == 5) {
			if (i >= 50 && i < 60) {
				assign(i,temData[i]);
				ti++;
			}
		} else if (type = 6) {
			if (i >= 60) {
				assign(i,temData[i]);
				ti++;
			}
		}
		
		if (ti == 10) {
			return ;
		}
	}
}

function assign(i,dt) {
	var value = dt[1];
	var ro = $('[for="'+ dt[0].replace(/\X/g, "") +'"]');
	if((value + "").split(".").length == 1){
		value = value + ".00";
	}

	if(dt[2] == 0 && s_io == 1){
		ro.text('封单');
		$("#"+ro.attr('for')).prev().css('color','red');
		$("#"+ro.attr('for')).attr("checked", false).checkboxradio("refresh").checkboxradio("disable");
	} else {
		if(s_io == 1 && $("#"+ro.attr('for')).prop('checked') == 0){
			$("#"+ro.attr('for')).checkboxradio("enable");
			$("#"+ro.attr('for')).prev().css('color','#000000');
		}
		ro.text(value).attr('data-type',i);
	}
} 

function changePX(){
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
	zdn = 0;
	dzar = [];
	$("#zdlt").html('');
	
	var px = $("#px_v").find("option:selected").val();
	showLoader();
	parseData(px);
	
	setTimeout(function(){
		hideLoader();
		},300);
}

var otime = 20; <%--开*盘请求间隔时间--%>
var stime = otime;
setInterval(function(){
	stime--;
	if(stime<=0){
		stime=otime;
		getRate($("#gameCode").val());
	}
	if(s_flag == 1){
		setOpenBall(s_ob);
		countdown();
		$("#s_is").text(s_is);
		if(s_io==0){
			$("#close_id").html(replaceAllHtml(' 已封{[{55uY}]}'));
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			$("input[type='radio']").checkboxradio("disable");
		}
	}
},1000);

function countdown(){
	$countdown = $("#cdt").countdown(s_st);
	$countdown.on('update.countdown' , function(event) {
     	var totalHours = event.offset.totalDays * 24 + event.offset.hours;
     	if(s_io==0){
     		$("#cdt").html('');
     	}else{
     		$("#close_id").html('');
     		$("#cdt").html('<font color="black">&nbsp;距封盘 </font>' + event.strftime(totalHours + ':%M:%S'));
     	}
     });
     $countdown.on('finish.countdown' , function(event) {
     	//getRate();
     });
}

function getComb(i,str,parr,n,rarr){
	if(n==0){
		rarr.push(str);
		return;
	}
	if(i==parr.length){
		return;
	}
	getComb(i+1,str+parr[i]+",",parr,n-1,rarr);
	getComb(i+1,str,parr,n,rarr);
}

function setOpenBall(balls){
	var ball = balls.split(',');
	var str = '';
	for(var i=0;i<ball.length;i++){
		//<div class="ball2 red-ball float-l" ball="2">2</div>
		var tcl = '';//ball red-ball
		if(i<4){
			tcl = 'border-color-r ball-result float-l';
		}else if(i>3&&i<7){
			tcl = 'border-color-b ball-result float-l';
		}else{
			tcl = 'border-color-g ball-result float-l';
		}
		if(i==4){
			str += '<div class="b-txt">+</div>'
		}
		str += '<div class="' + tcl + '" ball="2">' + ('' == ball[i] ? '?' : ball[i]) + '</div>';
	}
	$("#openball").html(str);
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>