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
	$("label").addClass("ui-btn-visible");
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gamec").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
	$("#tc_" + tcode).addClass('ui-btn-active');
	changeGame($("#gamec").val(),0);
	setOpenBall($("#oball").val());
	countdown();
	//getRateInfo();
	$("#cancelBtn").on("click",function(){
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
			if($("input:checked").length>8){
				//alert('最多可以选择8种{[{5bC+}]}数进{[{6KGM}]}组{[{5ZCI}]}!');
				$(this).prop("checked",false).checkboxradio("refresh");
				alert(replaceAllHtml('最多可以选择8种{[{5bC+}]}数进{[{6KGM}]}组{[{5ZCI}]}!'));
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
    });
    $("#orderBtn").on("click",function(){
    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
    	if(gmmk[$("#gamec").val()] > $("input:checked").length){
    		alert('请至少选择' + gmmk[$("#gamec").val()] + replaceAllHtml('个{[{5Y+3}]}{[{56CB}]}！'));
   			return;
   		}
   		
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
    		$("#p_pgameCode").val('24');
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
    		parr = tarr.concat(parr);
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
    		var tems = '';
    		var tuon = '';
    		var tuor = '';
    		for(var i=0;i<gmmk[$("#gamec").val()]-1;i++){
    			tems += parr[i] +',';
    			tuon += parr[i] +'#';
    			var o = $("label[for='" + parr[i] + "']");
    			tuor += o.text() + '#';
    		}
    		var toun = '';
    		var tour = '';
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
    		$("#p_pgameCode").val('24');
    		$("#p_rateStr").val(rst);
    		$("#p_rateTou").val(tour.substring(0, tour.length-1).replace(',', '#'));
    		$("#p_rateTuo").val(tuor.substring(0, tuor.length-1).replace(',', '#'));
    		$("#p_tuoType").val(gmmk[$("#gamec").val()]-1);
    		
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

var hkcutil = new HKCUtil();
var tcode= '01';
var gmmk = {'2401':2,'2402':3,'2403':4,'2404':2,'2405':3,'2406':4,'2407':5,'2408':5};
var wsmk = {'0':{'nm':'0{[{5bC+}]}','num':'10,20,30,40'},'1':{'nm':'1{[{5bC+}]}','num':'1,11,21,31,41'},'2':{'nm':'2{[{5bC+}]}','num':'2,12,22,32,42'},'3':{'nm':'3{[{5bC+}]}','num':'3,13,23,33,43'},'4':{'nm':'4{[{5bC+}]}','num':'4,14,24,34,44'},
'5':{'nm':'5{[{5bC+}]}','num':'5,15,25,35,45'},'6':{'nm':'6{[{5bC+}]}','num':'6,16,26,36,46'},'7':{'nm':'7{[{5bC+}]}','num':'7,17,27,37,47'},'8':{'nm':'8{[{5bC+}]}','num':'8,18,28,38,48'},'9':{'nm':'9{[{5bC+}]}','num':'9,19,29,39,49'}};

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
<c:set var="page_title" value="{[{5bC+}]}数{[{6L+e}]}" scope="request"/>
<body>
	<div  data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/hkc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<input type="hidden" id="gamec" value="${obj.game}">
		<input type="hidden" id="gct" value="${obj.type}">
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
	        <div class="list_dingtime">        
			<div data-role="navbar">
				<!--  
			    <ul>
			        <li><a href="#" id="gamec_2401" onclick="changeGame('2401','1')" class="ui-btn-active" data-ajax="false">二{[{5bC+}]}{[{6L+e}]}[{[{5Lit}]}]</a></li>
			        <li><a href="#" id="gamec_2402" onclick="changeGame('2402','1')" data-ajax="false">三{[{5bC+}]}{[{6L+e}]}[{[{5Lit}]}]</a></li>
			        <li><a href="#" id="gamec_2403" onclick="changeGame('2403','1')" data-ajax="false">四{[{5bC+}]}{[{6L+e}]}[{[{5Lit}]}]</a></li>
			    </ul>
			    <ul>
			    	<li><a href="#" id="gamec_2404" onclick="changeGame('2404','1')" data-ajax="false">二{[{5bC+}]}{[{6L+e}]}[{[{5LiN}]}{[{5Lit}]}]</a></li>
			        <li><a href="#" id="gamec_2405" onclick="changeGame('2405','1')" data-ajax="false">三{[{5bC+}]}{[{6L+e}]}[{[{5LiN}]}{[{5Lit}]}]</a></li>
			    	<li><a href="#" id="gamec_2406" onclick="changeGame('2406','1')" data-ajax="false">四{[{5bC+}]}{[{6L+e}]}[{[{5LiN}]}{[{5Lit}]}]</a></li>
			    </ul>
			    -->
			    <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
			    	${i.first ? "<ul>":""}
			    	<c:choose>
			    	<c:when test="${pc.gameCode == null}"><li>&nbsp;&nbsp;</li></c:when>
			    	<c:otherwise><li><a href="#" id="gamec_${pc.gameCode}" onclick="changeGame('${pc.gameCode}','1')" ${i.index == 0 ? "class='ui-btn-active'":""}>${pc.gameName}</a></li></c:otherwise>
			    	</c:choose>
                	${((i.index + 1) % obj.perLineNum == 0 && !i.last) ? "</ul><ul>":""}
                	${i.last ? "</ul>":""}
                </c:forEach>
			</div>
			<div class="table-cotent-lottery">
			<div class="mgtop6"></div>
			<div data-role="navbar">
			    <ul>
			        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
			        <li><a href="#" id="tc_02" data-ajax="false" onclick="changeTcode('02')">拖{[{5aS0}]}投{[{5rOo}]}</a></li>
			    </ul>
			</div>
			<div><span id="zdlt"></span></div>
			<div class="mainframe01 mgtop6 b-line">
			   	<div class="min-overflow">
			   		<div class="div01">
			   			<div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
				   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
				   		<div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
				   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
			   		</div>
			   		<div class="div02">
			   			<div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
				   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
				   		<div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
				   		<div class="o-number title-setting brl-1">{[{6LWU546H}]}</div>
			   		</div>
			   	</div>
			   	  
			   	<div class="div01">
			   		<div class="o-number line-color brl-1"><div name="ball">0{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="77" inf="0{[{5bC+}]}" data-mini="true"><label for="77">0.00</label></fieldset></div>	
			   		<div class="o-number line-color brl-1"><div name="ball">1{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="78" inf="1{[{5bC+}]}" data-mini="true"><label for="78">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number line-color brl-1"><div name="ball">2{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="79" inf="2{[{5bC+}]}" data-mini="true"><label for="79">0.00</label></fieldset></div>
			   		<div class="o-number line-color brl-1"><div name="ball">3{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="80" inf="3{[{5bC+}]}" data-mini="true"><label for="80">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number line-color brl-1"><div name="ball">4{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="81" inf="4{[{5bC+}]}" data-mini="true"><label for="81">0.00</label></fieldset></div>	
			   		<div class="o-number line-color brl-1"><div name="ball">5{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="82" inf="5{[{5bC+}]}" data-mini="true"><label for="82">0.00</label></fieldset></div>
			   	</div>
			   	<div class="div02">
			   		<div class="o-number line-color brl-1"><div name="ball">6{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="83" inf="6{[{5bC+}]}" data-mini="true"><label for="83">0.00</label></fieldset></div>
			   		<div class="o-number line-color brl-1"><div name="ball">7{[{5bC+}]}</div></div>
			   		<div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="84" inf="7{[{5bC+}]}" data-mini="true"><label for="84">0.00</label></fieldset></div>	
				</div>
				<div class="div01">
			   		<div class="o-number line-color brl-1"><div name="ball">8{[{5bC+}]}</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="85" inf="8{[{5bC+}]}" data-mini="true"><label for="85">0.00</label></fieldset></div>
			   		<div class="o-number line-color brl-1"><div name="ball">9{[{5bC+}]}</div></div>
			   		<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="wstt" id="86" inf="9{[{5bC+}]}" data-mini="true"><label for="86">0.00</label></fieldset></div>		
			   	</div>
			   	<div class="div02">
			   		<div class="o-number line-color brl-1"><div name="ball"></div></div>
			   		<div class="b-number brl-1"></div>
			   		<div class="o-number line-color brl-1"><div name="ball"></div></div>
			   		<div class="b-number brl-1"></div>
				</div>
			   	<div class="clear"></div>
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