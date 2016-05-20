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
		<c:set var="page_title" value="一{[{5a2X}]}现" />
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
	         <div class="table-cotent-lottery">   
	        <div class="mainframe01 mgtop6">
				   	<div class="min-overflow" id="h_div">
				   		<div class="div01">
				   			<div class="o-number title-setting brl-1">号码</div>
					   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number title-setting brl-1">号码</div>
					   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   		<div class="div02">
				   			<div class="o-number title-setting brl-1">号码</div>
					   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
					   		<div class="o-number title-setting brl-1">号码</div>
					   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
				   		</div>
				   	</div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_0"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="0" data-mini="true"><label for="0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_1"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="1" data-mini="true"><label for="1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="o-number line-color brl-1"><span id="t_2"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="2" data-mini="true"><label for="2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_3"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="3" data-mini="true"><label for="3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_4"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="4" data-mini="true"><label for="4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_5"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="5" data-mini="true"><label for="5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="o-number line-color brl-1"><span id="t_6"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="6" data-mini="true"><label for="6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_7"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="7" data-mini="true"><label for="7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_8"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="8" data-mini="true"><label for="8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_9"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="9" data-mini="true"><label for="9">0.00</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	            </div>
	            </div>
	        </div>
	        <br>
		</div>
	</div>
	<%@ include file="/WEB-INF/page/qxc/com_bet.jsp" %>
</body>
<script type="text/javascript">
<%--切换盘*_*口，重新加载赔*+*率--%>
function changeHandType(){
	getRate($("#gameCode").val());
}
$(function(){
	getRate($("#gameCode").val());
	<%--选择号码下*+*注--%>
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
	<%--点击注*+*单按钮，展示注*+*单--%>
    $("#orderBtn").on("click",function(e) {
        enableSubmitBtn();
		if ($("input:checked").length == 0) {
	        alert("请先选择号码!");
	    } else {
	    	$("#issue").val($("#s_is").text());
	    	$("#isid").text($("#s_is").text());
	        var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        $("input:checked").each(function (i) {
	            var o = $("label[for='" + $(this).attr("id") + "']");
	            var str = "";
	            var temStr = "";
	            if($(this).attr("id")>40&&$(this).attr("id")<51){
	            	temStr = "球5:";
	            }else if($(this).attr("id")>50&&$(this).attr("id")<61){
	            	temStr = "球6:";
	            }else if($(this).attr("id")>60&&$(this).attr("id")<71){
	            	temStr = "球7:";
	            }
	            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	            str += temStr + $("#t_" + $(this).attr("id")).text() + "</span>";
	            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + o.text() + "</span>";
	            str += "<input type='hidden' name='type' value='" + $(this).attr("id") + "'>";
	            str += "<input type='hidden' name='rate' value='" + o.text() + "'></td>";
	            str += "<td align='right' class='tdselect' style='border:none;'><span>"
	            str += "<input type='number' min='1' max='50000' name='amount' class='numb_px' data-role='none'/>";
	            str += "<input type='button' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'/>";
	            str += "<input type='button' value='删' rel='d' s='" + o.attr("for") + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
	            $(str).appendTo(tbody);
	        });
	        var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
	        tst += tst;
	        $(tst).appendTo(tbody);
	        ot.append(tbody);
	        $.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	        getUserInfo();
	    }
    });
    <%--下*+*注页面点击删按钮--%>
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
    <%--下*+*注页面，点击填按钮--%>
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
    $("#submitBtn").on("click",function(){
    	var checkR = checkParam();
		if(checkR){
			var tobj = $("[name='type']");
			var betBall = "";
			for(var i=0;i<tobj.length;i++){
				betBall +=  tobj[i].value + ",";
			}
			var robj = $("[name='rate']");
			var rateAll = "";
			for(var i=0;i<robj.length;i++){
				rateAll +=  robj[i].value + ",";
			}
			var aobj = $("[name='amount']");
			var betAmount = "";
			for(var i=0;i<aobj.length;i++){
				betAmount +=  aobj[i].value + ",";
			}
			$("#betBall").val(betBall.substring(0, betBall.length-1));
			$("#rateAll").val(rateAll.substring(0, rateAll.length-1));
			$("#betAmount").val(betAmount.substring(0, betAmount.length-1));
			subOrder();
		}
    });
});

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
		//$("#submitBtn").removeClass("ui-state-disabled");
	});	
}

function enableSubmitBtn(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
}

function checkParam(){
	var obj = $("[name='amount']");
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
var s_io = '';<%-- 封：0，开*盘*中为：1--%>
var s_flag = 0;
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
				for(o in rateObj){
					var value = rateObj[o][1];
					$("#t_"+o).text(rateObj[o][0]);
					var ro = $('[for="'+ o +'"]');
					if((value + "").split(".").length == 1){
						value = value + ".00";
					}

					if(rateObj[o][2] == 0 && s_io == 1){
						ro.text('封单');
						$("#"+o).prev().css('color','red');
						$("#"+o).attr("checked", false).checkboxradio("refresh").checkboxradio("disable");
					} else {
						if(s_io == 1 && $("#"+o).prop('checked') == 0){
							$("#"+o).checkboxradio("enable").prev().css('color','#000000');
						}
						ro.text(value);
					}
				}
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
var otime = 20;<%--开盘请求间隔时间--%>
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
			$("#close_id").html(' 已封盘');
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
			tcl = 'border-color-g2 ball-result float-l';
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
