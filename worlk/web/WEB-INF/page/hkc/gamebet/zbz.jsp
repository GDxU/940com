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
	
	$("label").addClass("ui-btn-visible");
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gamec").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
	$("#tc_" + tcode).addClass('ui-btn-active');
	$("#hcid").text($('a.ui-btn-active').attr("agn"))
	setOpenBall($("#oball").val());
	countdown();
	changeGame($("#gamec").val(),0);
	//getRateInfo();
	$("[name='ball']").each(function(){
		var tcl = '';//ball red-ball
		if(hkcutil.getRedBall().contains($(this).html())){
			tcl = 'ball red-ball';
		}else if(hkcutil.getBlueBall().contains($(this).html())){
			tcl = 'ball blue-ball';
		}else if(hkcutil.getGreenBall().contains($(this).html())){
			tcl = 'ball green-ball';
		}
		$(this).addClass(tcl);
	});
	$("#cancelBtn").on("click",function(){
		$.mobile.changePage("#rateInfoPage", {changeHash:false, transition:'none'});
		$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
		$("#tc_" + tcode).addClass('ui-btn-active');
	});
	$("#submitBtn").on("click",function(){
		subch();
	});
	$("input[type='checkbox']").on("click",function(e){
		if(tcode == '01'){
			if($("#gamec").val()=='2213'){
				if($("input:checked").length > 18){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择18个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='2212'){
				if($("input:checked").length > 17){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择17个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='2211'){
				if($("input:checked").length > 16){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择16个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='2210'){
				if($("input:checked").length > 15){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择15个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='2209'){
				if($("input:checked").length > 14){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择14个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='2208'){
				if($("input:checked").length > 13){
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择13个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='3006' || $("#gamec").val()=='2206' || $("#gamec").val()=='2207'||$("#gamec").val()=='3110'){
				if($("input:checked").length>12){
					//alert('最多只能选择12个号码！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择12个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='3005'||$("#gamec").val()=='2205'||$("#gamec").val()=='3109'){
				if($("input:checked").length>11){
					//alert('最多只能选择11个号码！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择11个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='3101'||$("#gamec").val()=='3102'||$("#gamec").val()=='3003'||$("#gamec").val()=='3004'||$("#gamec").val()=='3007'||$("#gamec").val()=='2203'||$("#gamec").val()=='2204'||$("#gamec").val()=='3108'||$("#gamec").val()=='3107'){
				if($("input:checked").length>10){
					//alert('最多只能选择10个号码！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择10个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='3103'||$("#gamec").val()=='3104'||$("#gamec").val()=='3002'||$("#gamec").val()=='3008'||$("#gamec").val()=='3009'||$("#gamec").val()=='2202'||$("#gamec").val()=='3106'){
				if($("input:checked").length>9){
					//alert('最多只能选择9个号码！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择9个号码！');",200);
					return;
				}
			} else if($("#gamec").val()=='3105'||$("#gamec").val()=='3001'||$("#gamec").val()=='2201'){
				if($("input:checked").length>8){
					//alert('最多只能选择8个号码！');
					$(this).prop("checked",false).checkboxradio("refresh");
					setTimeout("alert('最多只能选择8个号码！');",200);
					return;
				}
			}
	        if($("input:checked").length>0){
	        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").addClass('spnicon').text($("input:checked").length);
			}else{
	        	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").removeClass('spnicon').text('');
			}
		}else if(tcode = '08'){
			if(zdn >= 5){
				//alert('最多选择五组组合！');
				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
				setTimeout("alert('最多选择五组组合！');",200);
				return;
			}
			if($("input:checked").length == gmmk[$("#gamec").val()]){
				var str = '';
				$("[name='fstt']").each(function(){
	    			if($(this).prop("checked")){
	    				str += this.id + ',';
	    			}
	    		});
	    		str = str.substring(0,str.length-1);
	    		str += '';
	    		for(var i=0;i<dzar.length;i++){
	    			if(str==dzar[i]){
	    				//alert('该组合已存在！');
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
    $("#orderBtn").on("click",function(){
    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
    	if(tcode == '01' && $("input:checked").length < gmmk[$("#gamec").val()]){//{[{5aSN5byP}]}
   			alert('请至少选择' + gmmk[$("#gamec").val()] + '个号码！');
   			return;
    	}
    	if(tcode == '08' && zdn < 1){//多组
    		alert('请至少选择1个组合！');
   			return;
    	}
    	
    	if(tcode == '01'){//{[{5aSN5byP}]}
    		var parr = new Array();
    		var n = 0;
    		$("[name='fstt']").each(function(){
    			if($(this).prop("checked")){
    				parr[n++] = this.id;
    			}
    		});
    		var nra = [];
    		var nst = '';
    		var rst = '';
    		for(var i=0;i<parr.length;i++){
    			var o = $("label[for='" + parr[i] + "']");
    			nra[parr[i]] = o.text();
    			if(i+1 != parr.length){
    				nst += parr[i] + ', ';
    				rst += o.text() + ', ';
    			}else{
    				nst += parr[i];
    				rst += o.text() ;
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
    		getComb(0,'',parr,gmmk[$("#gamec").val()],rarr);
    		str = '<div class="mainframe01 mgtop6">';
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
    		
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_betBallStr").val(nst);
    		$("#p_noteCount").val(rarr.length);
    		$("#p_pgameCode").val($("#gamec").val().substring(0,2));
    		$("#p_rateStr").val(rst);
    		
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
    				bbs += tem[j] + '#';
    				ras += o.text() + '#';
    			}
		        str += "<tr class='trhight' style='border:none;'>";
		        str += "<td style='border:none;'><span class='spannum1'>{[{5rOo}]}{[{5Y2V}]}：</span><span class='font-size12'>" + dzar[i] + "(" + minr + ")" + "</span></td>";
	    		str += "</tr>";
	    		
	    		bbs = bbs.substring(0, bbs.length-1);
	    		ras = ras.substring(0, ras.length-1);
	    		mrate += minr;
	    		if(i != dzar.length-1){
	    			bbs += ',';
	    			mrate += ',';
	    			ras += ',';
	    		}
    		}
    		str = replaceAllHtml(str);
    		$(str).appendTo(tbody);
    		ot.append(tbody);
    		$("#zdn").html(dzar.length);
    		
    		$("#p_gameCode").val($("#gamec").val());
    		$("#p_betBall").val(bbs);
    		$("#p_betType").val(tcode);
    		$("#p_noteCount").val(dzar.length);
    		$("#p_pgameCode").val($("#gamec").val().substring(0,2));
    		$("#p_rate").val(mrate);
    		$("#p_rateAll").val(ras);
    		
    		$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
    		getUserInfo();
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
	getRateInfo();
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	zdn = 0;
	dzar = [];
	$("#zdlt").html('');
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

var hkcutil = new HKCUtil();
var tcode = '01';
var gmmk = {
    '2201': 5,
    '2202': 6,
    '2203': 7,
    '2204': 8,
    '2205': 9,
    '2206': 10,
    '2207': 11,
    '2208': 12,
    '2209': 13,
    '2210': 14,
    '2211': 15,
    '2212': 16,
    '2213': 17,
    '3001': 5,
    '3002': 6,
    '3003': 7,
    '3004': 8,
    '3005': 9,
    '3006': 10,
    '3007': 2,
    '3008': 3,
    '3009': 4,
    '3101': 1,
    '3102': 2,
    '3103': 3,
    '3104': 4,
    '3105': 5,
    '3106': 6,
    '3107': 7,
    '3108': 8,
    '3109': 9,
    '3110': 10
};
var zdn = 0;
var dzar = [];

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
					//$("#"+o).checkboxradio("enable");
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
<c:if test="${obj.type=='bz'}">
	<c:set var="page_title" value="{[{5LiN}]}{[{5Lit}]}" scope="request"/>
</c:if>
<c:if test="${obj.type=='dxzy'}">
	<c:set var="page_title" value="多选{[{5Lit}]}一" scope="request"/>
</c:if>
<c:if test="${obj.type=='tzp'}">
	<c:set var="page_title" value="{[{54m5}]}平{[{5Lit}]}" scope="request"/>
</c:if>
<body>
	<div  data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/hkc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<input type="hidden" id="gamec" value="${obj.game}">
		<input type="hidden" id="oball" value="${obj.oball}">
		<input type="hidden" id="sealTime" value="${obj.sealTime}">
		<div data-role="content" id="rateRefInfo">
			<div style="text-align: center;">
			<div class="ui-on-lottery">	
	            <div id="openball" alt="ob" class="ob">
	            </div>
	            <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" >${obj.iss}</span> {[{5pyf}]} <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
	            </div>
	        </div>
			<!--  
			<c:if test="${obj.type=='bz'}">
				<div data-role="navbar">
				    <ul>
				        <li><a href="#" id="gamec_2201" onclick="changeGame('2201','1')" data-ajax="false">五{[{5LiN}]}{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_2202" onclick="changeGame('2202','1')" data-ajax="false">六{[{5LiN}]}{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_2203" onclick="changeGame('2203','1')" data-ajax="false">七{[{5LiN}]}{[{5Lit}]}</a></li>
				    </ul>
				    <ul>
				    	<li><a href="#" id="gamec_2204" onclick="changeGame('2204','1')" data-ajax="false">八{[{5LiN}]}{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_2205" onclick="changeGame('2205','1')" data-ajax="false">九{[{5LiN}]}{[{5Lit}]}</a></li>
				    	<li><a href="#" id="gamec_2206" onclick="changeGame('2206','1')" data-ajax="false">十{[{5LiN}]}{[{5Lit}]}</a></li>
				    </ul>
				</div>
			</c:if>
			<c:if test="${obj.type=='dxzy'}">
				<div data-role="navbar">
				    <ul>
				        <li><a href="#" id="gamec_3001" onclick="changeGame('3001','1')" data-ajax="false">五选{[{5Lit}]}一</a></li>
				        <li><a href="#" id="gamec_3002" onclick="changeGame('3002','1')" data-ajax="false">六选{[{5Lit}]}一</a></li>
				        <li><a href="#" id="gamec_3003" onclick="changeGame('3003','1')" data-ajax="false">七选{[{5Lit}]}一</a></li>
				    </ul>
				    <ul>
				    	<li><a href="#" id="gamec_3004" onclick="changeGame('3004','1')" data-ajax="false">八选{[{5Lit}]}一</a></li>
				        <li><a href="#" id="gamec_3005" onclick="changeGame('3005','1')" data-ajax="false">九选{[{5Lit}]}一</a></li>
				    	<li><a href="#" id="gamec_3006" onclick="changeGame('3006','1')" data-ajax="false">十选{[{5Lit}]}一</a></li>
				    </ul>
				</div>
			</c:if>
			<c:if test="${obj.type=='tzp'}">
				<div data-role="navbar">
				    <ul>
				        <li><a href="#" id="gamec_3101" onclick="changeGame('3101','1')" data-ajax="false">一{[{57KS}]}任{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_3102" onclick="changeGame('3102','1')" data-ajax="false">二{[{57KS}]}任{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_3103" onclick="changeGame('3103','1')" data-ajax="false">三{[{57KS}]}任{[{5Lit}]}</a></li>
				    </ul>
				    <ul>
				    	<li><a href="#" id="gamec_3104" onclick="changeGame('3104','1')" data-ajax="false">四{[{57KS}]}任{[{5Lit}]}</a></li>
				        <li><a href="#" id="gamec_3105" onclick="changeGame('3105','1')" data-ajax="false">五{[{57KS}]}任{[{5Lit}]}</a></li>
				    	<li></li>
				    </ul>
				</div>
			</c:if>
			-->
			<div class="list_dingtime">
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
			<div class="mgtop6"></div>
			<div data-role="navbar">
			    <ul>
			        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
			        <li><a href="#" id="tc_08" data-ajax="false" onclick="changeTcode('08')">多组投{[{5rOo}]}</a></li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">
			<div><span id="zdlt" class="content-info-zdlt"></span></div>
			<div class="mainframe01 mgtop6">
			   	<div class="min-overflow">
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
			   		<div class="o-number brl-1"><div name="ball">01</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="01" data-mini="true"><label for="01">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">02</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="02" data-mini="true"><label for="02">0.00</label></fieldset></div>
				</div>
				<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">03</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="03" data-mini="true"><label for="03">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">04</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="04" data-mini="true"><label for="04">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">05</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="05" data-mini="true"><label for="05">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">06</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="06" data-mini="true"><label for="06">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">07</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="07" data-mini="true"><label for="07">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">08</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="08" data-mini="true"><label for="08">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">09</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="09" data-mini="true"><label for="09">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">10</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="10" data-mini="true"><label for="10">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">11</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="11" data-mini="true"><label for="11">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">12</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="12" data-mini="true"><label for="12">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">13</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="13" data-mini="true"><label for="13">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">14</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="14" data-mini="true"><label for="14">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">15</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="15" data-mini="true"><label for="15">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">16</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="16" data-mini="true"><label for="16">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">17</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="17" data-mini="true"><label for="17">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">18</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="18" data-mini="true"><label for="18">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">19</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="19" data-mini="true"><label for="19">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">20</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="20" data-mini="true"><label for="20">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">21</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="21" data-mini="true"><label for="21">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">22</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="22" data-mini="true"><label for="22">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">23</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="23" data-mini="true"><label for="23">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">24</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="24" data-mini="true"><label for="24">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">25</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="25" data-mini="true"><label for="25">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">26</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="26" data-mini="true"><label for="26">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">27</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="27" data-mini="true"><label for="27">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">28</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="28" data-mini="true"><label for="28">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">29</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="29" data-mini="true"><label for="29">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">30</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="30" data-mini="true"><label for="30">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">31</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="31" data-mini="true"><label for="31">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">32</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="32" data-mini="true"><label for="32">0.00</label></fieldset></div>	
				</div>  
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">33</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="33" data-mini="true"><label for="33">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">34</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="34" data-mini="true"><label for="34">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">35</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="35" data-mini="true"><label for="35">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">36</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="36" data-mini="true"><label for="36">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">37</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="37" data-mini="true"><label for="37">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">38</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="38" data-mini="true"><label for="38">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">39</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="39" data-mini="true"><label for="39">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">40</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="40" data-mini="true"><label for="40">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">41</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="41" data-mini="true"><label for="41">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">42</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="42" data-mini="true"><label for="42">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">43</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="43" data-mini="true"><label for="43">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">44</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="44" data-mini="true"><label for="44">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">45</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="45" data-mini="true"><label for="45">0.00</label></fieldset></div>	
			   		<div class="o-number brl-1"><div name="ball">46</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="46" data-mini="true"><label for="46">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number brl-1"><div name="ball">47</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="47" data-mini="true"><label for="47">0.00</label></fieldset></div>
			   		<div class="o-number brl-1"><div name="ball">48</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="48" data-mini="true"><label for="48">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number brl-1"><div name="ball">49</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="fstt" id="49" data-mini="true"><label for="49">0.00</label></fieldset></div>	
				</div>
				<div class="clear"></div>     
				<a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="top">返回顶部</a></p>
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
