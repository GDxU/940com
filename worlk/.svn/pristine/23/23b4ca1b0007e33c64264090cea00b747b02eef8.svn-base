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
	initTable();
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
    $("#cancelBtn").on("click",function(){
    	$.mobile.changePage("#rateInfoPage", "slideup");
    	bkflag=1;
        changeBetOn($("#bon").val(),1);
    });
    //checkIntro();
    $("#hcth").on("click",function(){
    	if(hca == 1){
	    	$.mobile.changePage("#hctm", "slideup");
    	}
    });
    showhc();
});

function changeBetOn(betOn,flag){
	$("#bon").val(betOn);
	if(betOn=='SANZIDW_QS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.SDW']}"));
	}
	/*
	if(betOn=='SANZIDW_ZS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.SDW']} ${msg['label.ssc.play.ZS']}"));
	}
	if(betOn=='SANZIDW_HS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.SDW']} ${msg['label.ssc.play.HS']}"));
	}
	*/
	if(flag==1){
		var str = "changeBetOn('" + betOn + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
	}else{
		getRateInfo($("#gameId").val(),$("#bon").val(),0);
	}
	if(bkflag==1){
		bkflag=0;
	}else{
		pages = 1;
		changepage('up','0');
	}
}

function initTable(){
    for ( var b = 0; b < 2; b++) {
    	setTable(b);
	}
}

var bkflag = 0;
var pages = 0;
function changepage(flag,ref){
	if('up' == flag&&pages>0){
		pages--;
		var ot = $("#brstable");
	  	ot.children("tbody").remove();
		for ( var b = pages*2; b < pages*2+2; b++) {
	   		setTable(b);
		}
		if(ref=='1'){
			getRateInfo($("#gameId").val(),$("#bon").val(),0);
		}
	}else if('down'==flag&&pages<4){
		pages++;
		var ot = $("#brstable");
	  	ot.children("tbody").remove();
		for ( var b = pages*2; b < pages*2+2; b++) {
	   		setTable(b);
		}
		if(ref=='1'){
			getRateInfo($("#gameId").val(),$("#bon").val(),0);
		}
	}
	$("input[type='checkbox']").off("click").on("click",function(e){
        if($("input:checked").length>0){
        	obcs();
		}else{
			obch();
		}
    });
}
/*
setTimeout(function(){
	for ( var b = 1; b < 10; b++) {
    	setTable(b);
	}
	showhc();
	$("label").addClass("ui-btn-z");//pei率按钮缩小
},100);
*/

function setTable(b){
	var str='';
	var n = 0;
   	var ot = $("#brstable");
   	//ot.children("tbody").remove();
	for ( var s = 0; s < 10; s++) {
		for ( var g = 0; g < 10; g++) {
			var tem = 'NO_' + b + '-NO_' + s + '-NO_' + g;
			var temn = '' + b + s + g;
			if(n%4==0){
				str += '<tr class="ssc">';
			}
			str += '<td class="td-bgcolor"><span>' + temn + '</span></td>';
			str += '<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="' + tem + '" id="' + tem;
			str += '" data-mini="true"><label for="' + tem + '" title="' + temn + '">0.00</label></fieldset></td>';
			if(n%4==3 || 'NO_9-NO_9-NO_9' == tem){
				str += '</tr>';
				ot.append(str);
				str = '';
			}
			n++;
		}
	}
	//$("#brstable").trigger("create");
	$.mobile.pageContainer.trigger("create");
	$("label").addClass("ui-btn-z-b").css({"font-size":"10px"});
}

var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.SHSSC']}" scope="request"/>
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
			<table border="1" class="hdptable" id="brstable">
				<thead>
			    <tr class="tr-bgcolor">
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			      <th data-priority="7">号码</th>
			      <th data-priority="8">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>
			  </tbody>
			</table>
		   <div data-role="footer" class="ui-footer-fixed" >
               <div data-role="navbar" id="pagectr">
                    <ul>
                         <li class="ui-btn-rect-lot-green"><a href="#" id="pre_page" onclick="changepage('up','1')" rel="external">&lt;&lt;上一页 </a>
                         </li>
                         <li class="ui-btn-rect-lot-green"><a href="#" id="next_page" onclick="changepage('down','1')" rel="external">下一页&gt;&gt;</a >
                         </li>
                    </ul>
               </div>
           </div>
           </div>
           </div>
			<br><br>
		</div>
		<input type="hidden" id="play_text" value="${msg['title.ssc.SDW']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>