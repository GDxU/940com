<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/hkc/combet.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<%@include file="/WEB-INF/page/hkc/games/hkcutil.jsp"%>
<script type="text/javascript">
$(function(){
	$("a[agn]").on("click", function () {
		$("#hcid").text($(this).attr("agn"));
    });
	initTable();
	$("label").addClass("ui-btn-visible");
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gamec").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	//getRateInfo();
	setOpenBall($("#oball").val());
	countdown();
	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
	$("#hcid").text($('a.ui-btn-active').attr("agn"))
	$("#tc_" + tcode).addClass('ui-btn-active');
	changeGame($("#gamec").val(),0);
	$("#cancelBtn").on("click",function(){
		initParam();
		$.mobile.changePage("#rateInfoPage", {changeHash:false, transition:'none'});
		$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
		$("#tc_" + tcode).addClass('ui-btn-active');
	});
	$("#submitBtn").on("click",function(){
		subch();
	});
	$("input[type='checkbox']").on("click",function(e){
		if(tcode == '02'){//拖{[{5aS0}]}投{[{5rOo}]}
			if(ttn<gmmk[$("#gamec").val()]-1){
				$(this).parent().parent().addClass("ui-state-disabled");
				$(this).prev().css("color","red");
				ttn++;
			}
		}
		if(tcode == '01'){
			if($("input:checked").length>9){
				//alert('最多可以选择9种生{[{6IKW}]}进{[{6KGM}]}组{[{5ZCI}]}!');
				$(this).prop("checked",false).checkboxradio("refresh");
				setTimeout(function(){
        			var btem = replaceAllHtml('最多可以选择9种生{[{6IKW}]}进{[{6KGM}]}组{[{5ZCI}]}!');
        			alert(btem);
        		},200);
				
				return;
			}
		}
		if($("input:checked").length>0){
			if('lx'==$("#gct").val()){
				if($("input:checked").length > gmmk[$("#gamec").val()]){
					//alert('只能选择' + gmmk[$("#gamec").val()] + '个生{[{6IKW}]}！');
					var info = '只能选择' + gmmk[$("#gamec").val()] + replaceAllHtml('个生{[{6IKW}]}！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout(function(){
						alert(info);
					},200);
				}
			}
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
        	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
    $("#orderBtn").on("click",function(){
    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
    	if(gmmk[$("#gamec").val()] > $("input:checked").length){
    		var btem = replaceAllHtml('个生{[{6IKW}]}！');
    		alert('请至少选择' + gmmk[$("#gamec").val()] + btem);
   			return;
   		}
   		
   		if('lx'==$("#gct").val()){
			if(gmmk[$("#gamec").val()] == $("input:checked").length){
				var minr = Number.MAX_VALUE;
				var sst = '';
				var ids = '';
				var rst = '';
				$("input:checked").each(function(){
	    			var o = $("label[for='" + this.id + "']");
	    			minr = Math.min(minr,o.text());
	    			sst += $(this).attr("inf") + ',';
	    			ids += this.id + '#';
	    			rst += o.text() + '#';
    			});
    			sst = sst.substring(0, sst.length-1) + '(' + minr + ')';
    			var ot = $("#orderTable");
		        ot.children("tbody").remove();
		        var tbody = $("<tbody></tbody>");
		        var str = '';
		        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
		        str += "{[{5rOo}]}{[{5Y2V}]}：</span><span class='font-size12'>" + sst + "</span></td></tr>";
	    		str = replaceAllHtml(str);
	    		$(str).appendTo(tbody);
	    		ot.append(tbody);
	    		$("#zdn").html(1);
	    		
	    		$("#p_betBall").val(ids.substring(0, ids.length-1));
	    		$("#p_gameCode").val($("#gamec").val());
	    		$("#p_noteCount").val(1);
	    		$("#p_pgameCode").val('16');
	    		$("#p_rate").val(minr);
	    		$("#p_rateAll").val(rst.substring(0, rst.length-1));
	    		
	    		$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	    		getUserInfo();
			}
		}
   		
    	if('sxl'==$("#gct").val()){
    		if(tcode == '01'){//{[{5aSN5byP}]}
	    		var parr = new Array();
	    		var n = 0;
	    		$("input:checked").each(function () {
	    			parr[n++] = this.id;
	    		});
	    		var nra = [];
	    		var nst = '';
	    		var rst = '';
	    		var sst = '';
	    		for(var i=0;i<parr.length;i++){
	    			var o = $("label[for='" + parr[i] + "']");
	    			nra[parr[i]] = o.text();
	    			if(i+1 != parr.length){
	    				nst += parr[i] + ',';
	    				rst += o.text() + ',';
	    				sst += $("#" + parr[i]).attr("inf") + ',';
	    			}else{
	    				nst += parr[i];
	    				rst += o.text();
	    				sst += $("#" + parr[i]).attr("inf");
	    			}
	    		}
	    		var ot = $("#orderTable");
		        ot.children("tbody").remove();
		        var tbody = $("<tbody></tbody>");
		        var str = '';
		        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
		        str += "球号：</span><span class='font-size12'>" + sst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
	    		$(str).appendTo(tbody);
	    		ot.append(tbody);
	    		var rarr = new Array();
	    		getComb(0,'',parr,gmmk[$("#gamec").val()],rarr);
	    		str = '<div class="mainframe01 mgtop6">';
	    		for(var i=0;i<rarr.length;i++){
	    			var tn = rarr[i].substring(0,rarr[i].length-1);
	    			var tr = Number.MAX_VALUE;
	    			var tar = tn.split(',');
	    			var tns = '';
	    			for(var j=0;j<tar.length;j++){
	    				tr = Math.min(tr,nra[tar[j]]);
	    				tns += $("#" + tar[j]).attr("inf") + ', ';
	    			}
	    			str += '<div class="border-result">' + tns.substring(0,tns.length-1) + '(' + tr + ')</div>';
	    		}
	    		str += '</div>';
	    		$("#zdl").html(str);
	    		$("#zdn").html(rarr.length);
	    		
	    		$("#p_betBallStr").val(nst);
	    		$("#p_betBallTou").val(nst.replace(',', '#'));
	    		$("#p_gameCode").val($("#gamec").val());
	    		$("#p_noteCount").val(rarr.length);
	    		$("#p_pgameCode").val('23');
	    		$("#p_rateStr").val(rst);
	    		$("#p_rateAll").val(rst.replace(',', '#'));
	    		$("#p_tuoType").val(0);
	    		
		    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
		    	getUserInfo();
	    	}
	    	
	    	if(tcode == '02'){//拖{[{5aS0}]}
	    		var parr = new Array();
	    		var tarr = new Array();
	    		var n = 0;
	    		var m = 0;
	    		$("input:checked").each(function () {
	    			if($(this).prev().attr("style").indexOf("red")>-1){
	    				tarr[m++] = this.id;
	    			}else{
		    			parr[n++] = this.id;
	    			}
	    		});
	    		parr = tarr.concat(parr);//按照固定位在最前的拖{[{5aS0}]}{[{5Y+3}]}{[{56CB}]}数组
	    		var nra = [];//{[{5Y+3}]}{[{56CB}]}的{[{6LWU546H}]}MAP
	    		var nst = '';//{[{5Y+3}]}{[{56CB}]}字符串
	    		var rst = '';//{[{5Y+3}]}{[{56CB}]}的{[{6LWU546H}]}字符串
	    		var sst = '';//{[{5Y+3}]}{[{56CB}]}{[{5a+5}]}应生{[{6IKW}]}（汉字）字符串
	    		for(var i=0;i<parr.length;i++){
	    			var o = $("label[for='" + parr[i] + "']");
	    			nra[parr[i]] = o.text();
	    			if(i+1 != parr.length){
	    				nst += parr[i] + ',';
	    				rst += o.text() + ',';
	    				sst += $("#" + parr[i]).attr("inf") + ', ';
	    			}else{
	    				nst += parr[i];
	    				rst += o.text();
	    				sst += $("#" + parr[i]).attr("inf");
	    			}
	    		}
	    		var ot = $("#orderTable");
		        ot.children("tbody").remove();
		        var tbody = $("<tbody></tbody>");
		        var str = '';
		        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
		        str += "球号：</span><span class='font-size12'>" + sst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	    		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
	    		$(str).appendTo(tbody);
	    		ot.append(tbody);
	    		var rarr = new Array();//拖{[{5aS0}]}的组{[{5ZCI}]}
	    		var tems = '';//临时存在拖{[{5aS0}]}组{[{5ZCI}]}{[{5Lit}]}前面固定位
	    		var tuon = '';
	    		var tuor = '';
	    		//组装拖{[{5aS0}]}组{[{5ZCI}]}前面固定部分的{[{5Y+3}]}{[{56CB}]}{[{6LWU546H}]}
	    		for(var i=0;i<gmmk[$("#gamec").val()]-1;i++){
	    			tems += parr[i] +',';
	    			tuon += parr[i] +'#';
	    			var o = $("label[for='" + parr[i] + "']");
	    			tuor += o.text() + '#';
	    		}
	    		var toun = '';
	    		var tour = '';
	    		//组装拖{[{5aS0}]}组{[{5ZCI}]}后面变动部分的{[{5Y+3}]}{[{56CB}]}{[{6LWU546H}]}
	    		for(var i=gmmk[$("#gamec").val()]-1;i<parr.length;i++){
	    			rarr.push(tems + parr[i]);
	    			toun += parr[i] +'#';
	    			var o = $("label[for='" + parr[i] + "']");
	    			tour += o.text() + '#';
	    		}
	    		str = '<div class="mainframe01 mgtop6">';
	    		for(var i=0;i<rarr.length;i++){
	    			var tn = rarr[i];
	    			var tr = Number.MAX_VALUE;
	    			var tar = tn.split(',');
	    			var tns = '';
	    			for(var j=0;j<tar.length;j++){
	    				tr = Math.min(tr,nra[tar[j]]);
	    				tns += $("#" + tar[j]).attr("inf") + ', ';
	    			}
	    			str += '<div class="border-result">' + tns.substring(0, tns.length-1) + '(' + tr + ')</div>';
	    		}
	    		str += '</div>';
	    		$("#zdl").html(str);
	    		$("#zdn").html(rarr.length);
	    		
	    		$("#p_betBallStr").val(nst);
	    		$("#p_betBallTou").val(toun.substring(0, toun.length-1).replace(',', '#'));
	    		$("#p_betBallTuo").val(tuon.substring(0, tuon.length-1).replace(',', '#'));
	    		$("#p_gameCode").val($("#gamec").val());
	    		$("#p_noteCount").val(rarr.length);
	    		$("#p_pgameCode").val('23');
	    		$("#p_rateStr").val(rst);
	    		$("#p_rateTou").val(tour.substring(0, tour.length-1).replace(',', '#'));
	    		$("#p_rateTuo").val(tuor.substring(0, tuor.length-1).replace(',', '#'));
	    		$("#p_tuoType").val(gmmk[$("#gamec").val()]-1);
	    		
		    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
		    	getUserInfo();
	    	}
    	}
    });
});

//切换盘口，重新加载赔率
function changeHandType(){
	isAll = true;
	getRateInfo();
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

function changeGame(gm,flag){
	if(1==flag){
		tcode = '01';
	}
	isAll = true;
	$("#gamec").val(gm);
	$("#tc_" + tcode).trigger("click");
	changeTcode(tcode);
	getRateInfo();
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
	$("#zdlt").html('');
}
function changeTcode(tc){
	$("#tc_01").removeClass('ui-btn-active');
	$("#tc_02").removeClass('ui-btn-active');
	tcode = tc;
	$("#tc_" + tcode).addClass('ui-btn-active');
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	$("input[type='checkbox']").each(function(){
		$(this).parent().parent().removeClass("ui-state-disabled");
		$(this).prev().css("color","black");
	});
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
	$("#zdlt").html('');
	ttn = 0;
}

function initTable(){
	var sxs = hkcutil.zodiac;
	var str = '';
	for(var i=0;i<sxs.length;i++){
		str += '<div class="type-hk1 brl-1"><div>' + sxs[i][1] + '</div></div>';
		str += '<div class="group-kh1 brl-1"><div class="float-short">';
		var tnum = eval("hkcutil."+sxs[i][0]+"()");
		for(var j=0;j<tnum.length;j++){
			if($("#pagetype").val() != 'lx' || (tnum[j] != 49 && $("#pagetype").val() == 'lx')){
				if(hkcutil.getRedBall().contains(tnum[j])){
					str += '<div class="ball2 red-ball float-l" ball="2">' + (tnum[j]<10?"0":"") + tnum[j] + '</div>';
				}else if(hkcutil.getBlueBall().contains(tnum[j])){
					str += '<div class="ball2 blue-ball float-l" ball="2">' + (tnum[j]<10?"0":"") + tnum[j] + '</div>';
				}else if(hkcutil.getGreenBall().contains(tnum[j])){
					str += '<div class="ball2 green-ball float-l" ball="2">' + (tnum[j]<10?"0":"") + tnum[j] + '</div>';
				}
			}
		}
		str += '</div></div>';
		//<div class="value-kh1 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball-2" id="ball-2" data-mini="true"><label for="ball-2">0.00</label></fieldset></div>
		str += '<div class="value-kh1 brl-1"><fieldset data-role="controlgroup" data-type="horizontal">';
		str += '<input type="checkbox" name="' + (basic+i) + '" id="' + (basic+i) + '" data-mini="true" inf="' + sxs[i][1] + '">';
		str += '<label for="' + (basic+i) + '">0.00</label></fieldset></div>';
		//str += '</div>';
	}
	str += '<div class="clear"></div>';
	//$("#sxtb").html(str);
	$("#sxtb").append(str);
	$.mobile.pageContainer.trigger("create");
}

var hkcutil = new HKCUtil();
var tcode= '01';
var gmmk = {
    '1601': 2,
    '1602': 3,
    '1603': 4,
    '1604': 5,
    '1605': 6,
    '1606': 2,
    '1607': 3,
    '1608': 4,
    '1609': 5,
    '1610': 6,
    '2301': 2,
    '2302': 3,
    '2303': 4,
    '2304': 2,
    '2305': 3,
    '2306': 4,
    '2307': 5,
    '2308': 5
};
var basic = 65;
var ttn = 0;

var otime = ${obj.interval / 1000};//开盘请求间隔时间
var ctime = 60;//封盘请求间隔时间
var stime = otime;
var flagrate = 0;
setInterval(function(){
	if(flagrate == 1){
		if(s == 0){
			stime--;
			if(stime<=0){
				stime=ctime;
				getRateInfo();
			}
			$("#close_id").html(' 已封盘');
			$("#cdt").html('');
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
		}else if(s == 1){
			stime--;
			if(stime<=0){
				stime=otime;
				getRateInfo();
			}
			$("#close_id").html('');
			if(fd == 1){
				$("input[type='checkbox']").checkboxradio("enable");
			}
		}
	}
},1000);

var isAll = true;
var cv;
var s = 1;//0：封盘；1：开盘
var fd = 1;
function getRateInfo(){
	var url = ctx + '/hkc/rate/' + $("#gamec").val() + "/" + (isAll?"a":cv);
	$.getJSON(url, {t:new Date().getTime()}, function(obj){
		if(obj.c==0){
			flagrate = 1;
			s = obj.s;
			var ids = new Array();
			var k = 0;
			var rmap = obj.r;
			for(o in obj.r){
				var or = $('[for="'+ o +'"]');
				var trate = rmap[o][0];
				if(0 != rmap[o][1]){
					trate += '/' + rmap[o][1];
				}
				if($("#"+o).length>0 && or.text() != '0.00' && or.text() != trate){
					ids[k++] = o;
				}
				if(0 == rmap[o][2]){
					or.text('封单');
					$("#"+o).prev().css('color','red');
					$("#"+o).checkboxradio("disable");
					fd = 0;
				}else{
					fd = 1;
					$("#"+o).prev().css('color','#000000');
					if(s==1){
						$("#"+o).checkboxradio("enable");
					}
					or.text(trate);
				}
			}
			if(ids.length>0&&!isAll){
				blink(ids);
			}
			cv = obj.v;
			if(isAll){
            	isAll = false;
            }
		}else{
			alert(obj.e);
			window.location.href = ctx + "/index";
		}
	},"json").fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = ctx + "/login";
		}     		
	});
}

function blink(ids){
	for(var i=0;i<ids.length;i++){
		$("#"+ids[i]).prev().addClass('myBlink');
	}
	timer = setTimeout(function(){stopBlink(ids);},2000);
}

function stopBlink(ids){
	for(var i=0;i<ids.length;i++){
		$("#"+ids[i]).prev().removeClass('myBlink');
	}
	clearTimeout(timer);
}
</script>
</head>
<c:if test="${obj.type=='lx'}">
	<c:set var="page_title" value="六{[{6IKW}]}" scope="request"/>
</c:if>
<c:if test="${obj.type=='sxl'}">
	<c:set var="page_title" value="生{[{6IKW}]}{[{6L+e}]}" scope="request"/>
</c:if>
<body>
	<div  data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/hkc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<input type="hidden" id="gamec" value="${obj.game}">
		<input type="hidden" id="gct" value="${obj.type}">
		<input type="hidden" id="oball" value="${obj.oball}">
		<input type="hidden" id="pagetype" value="${obj.type}">
		<input type="hidden" id="sealTime" value="${obj.sealTime}">
		<div data-role="content" id="rateRefInfo">
			<div style="text-align: center;">
			 <div class="ui-on-lottery">	
	            <div id="openball" alt="ob" class="ob">
	            </div>
	            <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" >${obj.iss}</span> {[{5pyf}]} <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
	            </div>
	        </div>
	        <div class="list_dingtime">
	        <c:if test="${obj.type=='lx'}">
				<div data-role="navbar">
			    <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
			    	${i.first ? "<ul>":""}
			    	<c:choose>
			    	<c:when test="${pc.gameCode == null}"><li>&nbsp;&nbsp;</li></c:when>
			    	<c:otherwise><li><a href="#" agn="${pc.gameName}" id="gamec_${pc.gameCode}" onclick="changeGame('${pc.gameCode}','1')" ${i.index == 0 ? "class='ui-btn-active'":""}>${pc.gameName}</a></li></c:otherwise>
			    	</c:choose>
                	${((i.index + 1) % obj.perLineNum == 0 && !i.last) ? "</ul><ul>":""}
                	${i.last ? "</ul>":""}
                </c:forEach>
				</div>
			</c:if>
			
			<c:if test="${obj.type=='sxl'}">
				<div data-role="navbar">
			    <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
			    	${i.first ? "<ul>":""}
			    	<c:choose>
			    	<c:when test="${pc.gameCode == null}"><li>&nbsp;&nbsp;</li></c:when>
			    	<c:otherwise><li><a href="#" agn="${pc.gameName}" id="gamec_${pc.gameCode}" onclick="changeGame('${pc.gameCode}','1')" ${i.index == 0 ? "class='ui-btn-active'":""}>${pc.gameName}</a></li></c:otherwise>
			    	</c:choose>
                	${((i.index + 1) % obj.perLineNum == 0 && !i.last) ? "</ul><ul>":""}
                	${i.last ? "</ul>":""}
                </c:forEach>
				</div>
			</c:if>
			<c:if test="${obj.type=='sxl'}">
				<div class="mgtop6"></div>
				<div data-role="navbar">
				    <ul>
				        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
				        <li><a href="#" id="tc_02" data-ajax="false" onclick="changeTcode('02')">拖{[{5aS0}]}投{[{5rOo}]}</a></li>
				    </ul>
				</div>
			</c:if>
			 <div class="table-cotent-lottery">
			<div><span id="zdlt"></span></div>
			<div style="margin-top:10px;"></div>
			<div class="mainframe01" id="sxtb">
	            <div class="min-overflow">
	                <div class="type-hk1-t title-setting brl-1">生{[{6IKW}]}</div>
	                <div class="group-kh1-t title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
	                <div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
	            </div>
			   	<!--  
			   	<div class="div01">
			   	<div class="type-hk1 brl-1"><div>鼠</div></div>
	            <div class="group-kh1 brl-1"><div class="float-short">
		            	<div class="ball2 red-ball float-l" ball="2">2</div>
		            	<div class="ball2 red-ball float-l" ball="2">2</div>
					</div>
				</div>
	            <div class="value-kh1 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball-2" id="ball-2" data-mini="true"><label for="ball-2">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   	<div class="type-hk1 brl-1"><div>鼠</div></div>
	            <div class="group-kh1 brl-1"><div class="float-short">
		            	<div class="ball2 red-ball float-l" ball="2">2</div>
		            	<div class="ball2 red-ball float-l" ball="2">2</div>
					</div>
				</div>
	            <div class="value-kh1 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball-2" id="ball-2" data-mini="true"><label for="ball-2">0.00</label></fieldset></div>
			   	</div>
			   	<div class="clear"></div>
			   	-->
		   </div>
		</div>
		</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/page/hkc/com_s_bet.jsp" %>
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>