<%--------------------------------账户历史----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<%@ include file="/WEB-INF/page/i18n.jsp" %>    
<script type="text/javascript" src="${staticFileUrl}/js/sport/panel.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/sport.css">
<!-- <link rel="stylesheet" href="${staticFileUrl}/css/sport/history.table.css"> -->
</head>
<body>
<div data-role="page" id="betInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
			<a href="#quick-links" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"></a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
		<%--       
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>账户历史摘要</h1>
	 		<a id="refreshBtn" href="#" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
		  --%>		
		</div>
	<%@ include file="panel_left.jsp"%>
	<%@ include file="panel_right.jsp" %>
  <div data-role="main" class="ui-content">
  	  	<div data-role="navbar" data-grid="b" style="margin:5px 0px 5px 0px !important">
		  	<ul>
		        <li><a href="${ctx}/sport/tradingInfo/1" data-ajax="false">${msg['label.sport.betinfo']}</a></li>
				<li><a href="${ctx}/sport/tradingInfo/2" data-ajax="false">${msg['label.sport.cancelledbets']}</a></li>
				<li><a href="${ctx}/sport/history" data-ajax="false" class="ui-btn-active">${msg['label.sport.history']}</a></li>
			</ul>
		</div>  
	  <div class="div_table">
		<table class="tb_set" width="100%" border="0" cellpadding="0" cellspacing="1" id="historyTable">
		<thead>
		  <tr>
		    <th>${msg['label.sport.betinfo.date']}</th>
		    <th><span class="span_line3">${msg['label.sport.betinfo.stakeamount']}</span><br/>${msg['label.sport.betinfo.effectivestake']}</th>
		    <th><span class="span_line3">${msg['label.sport.betinfo.winloss']}</span><br/>${msg['label.sport.betinfo.commission']}</th>
		    <th>${msg['label.sport.betinfo.returns']}</th>
		  </tr>
		  </thead>
		  <tbody>
		  <%--
		  <tr class="tr1">
		    <td class="date_txt">5月5日<br/>星期二</td>
		    <td><span class="span_gray">1265999.00</span><br/><span class="span_gray">(1265.00)</span></td>
		    <td><span class="span_gray">1265999.00</span><br/><span class="span_gray">(65.00)</span></td>
		    <td><span class="span_red">-1265999.00</span></td>
		  </tr>
		  <tr class="tr2">
		    <td class="date_txt">5月5日<br />星期二</td>
		    <td><span class="span_gray">1,265.00</span><br/><span class="span_gray">(1265.00)</span></td>
		    <td><span class="span_gray">1,265.00</span><br/><span class="span_gray">(0)</span></td>
		    <td><span class="span_green">1,265.00</span></td>
		  </tr>
		  <tr class="tr1 txt_b">
		    <td class="date_txt">总结</td>
		     <td><span class="span_gray">1,265.00</span><br/><span class="span_gray">(1265.00)</span></td>
		    <td><span class="span_gray">1,265.00</span><br/><span class="span_gray">(0)</span></td>
		    <td><span class="span_green">1,265.00</span></td>
		  </tr>
		   --%>
		  </tbody>
		</table>
	</div>
  </div>
</div> 
<script>
$(function(){
	loadHistory1();
});
function loadHistory1() {
	showLoader();
	var tbody = $("#historyTable > tbody");
	var request = $.ajax({
	    url: '${ctx}/sport/getHistory',
	    data: {
	        "t": new Date().getTime()
	    },
	    dataType: 'xml'
	});
	
	request.done(function(xmlResult) {
		tbody.empty();
		var root = $(xmlResult);
		var errcode = root.find("userhistorys").attr("errcode");
		if(errcode != undefined){
			if(errcode == 1015){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";			
			}else if(errcode == -1){
				alert("${msg['msg.common.systemError']}");				
			}
		}
		var betSum = 0, effSum = 0, winSum = 0, commSum = 0, resSum = 0;
		var history = root.find('date');
		if(history.length > 0){
			history.each(function(index){
				var element = $(this);
				var dateWeek = element.attr("d");
				var date = dateWeek.split(" ")[0];
				var week = dateWeek.split(" ")[1];
				var bet = Number(element.attr("bet"));
				betSum += bet;
				var eff = Number(element.attr("eff"));
				effSum += eff;
				var win = Number(element.attr("win"));
				winSum += win;
				var comm = Number(element.attr("comm"));
				commSum += comm;
				var res = Number(element.attr("res"));
				resSum += res;
				
				var trCls = 'tr2';
				if(index % 2 == 0){
					trCls = 'tr1';
				}else{
					trCls = 'tr2';
				}
				tbody.append('<tr class="' + trCls + '"><td class="date_txt"><a data-rel="external" data-ajax="false" href="${ctx}/sport/tradedInfo?date=' + date + '">' + $.format.date(new Date(date.replace(/-/g, "/")), "MM-dd") + '<br/>' + week + '</a></td><td><span class="span_gray span_line">' + formNumber(bet) + '</span><br/><span class="span_gray ">' + formNumber(eff) + '</span></td><td><span class="span_gray span_line">' + showColor2(win) + '</span><br/><span class="span_gray">' + formNumber(comm) + '</span></td><td><span class="span_green">' + showColor2(res) + '</span></td></tr>');
				
			});
			tbody.append('<tr class="tr3 txt_b"><td class="date_txt">${msg["label.sport.betinfo.total"]}</td><td><span class="span_gray span_line2">' + formNumber(betSum) + '</span><br/><span class="span_gray">' + formNumber(effSum, 3) + '</span></td><td><span class="span_gray span_line2">' + showColor(winSum) + '</span><br/><span class="span_gray">' + formNumber(commSum) + '</span></td><td><span class="span_green">' + showColor(resSum) + '</span></td></tr>');		
		}else{
			$("#historyTable").html('<div class="nodata" style="text-align: center;">' + '${msg["msg.common.nodata"]}' + '</div>');
		}
	});	
	
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			console.log(textStatus);
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		} 	
	});
	
	request.always(function() {
		//$("#historyTable").table("rebuild");
		hideLoader();		
	});	
}
function loadHistory() {
	showLoader();
	var tbody = $("#historyTable > tbody");
	var request = $.ajax({
	    url: '${ctx}/sport/getHistory',
	    data: {
	        "t": new Date().getTime()
	    },
	    dataType: 'xml'
	});
	
	request.done(function(xmlResult) {
		tbody.empty();
		var root = $(xmlResult);
		var errcode = root.find("userhistorys").attr("errcode");
		if(errcode != undefined){
			if(errcode == 1015){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";			
			}else if(errcode == -1){
				alert("${msg['msg.common.systemError']}");				
			}
		}
		var betSum = 0, effSum = 0, winSum = 0, commSum = 0, resSum = 0;
		root.find('date').each(function(index){
			var element = $(this);
			var dateWeek = element.attr("d");
			var date = dateWeek.split(" ")[0];
			var week = dateWeek.split(" ")[1];
			var bet = Number(element.attr("bet"));
			betSum += bet;
			var eff = Number(element.attr("eff"));
			effSum += eff;
			var win = Number(element.attr("win"));
			winSum += win;
			var comm = Number(element.attr("comm"));
			commSum += comm;
			var res = Number(element.attr("res"));
			resSum += res;
			tbody.append("<tr><th>" + (index + 1) + "</th><td class='title'><a href='${ctx}/sport/tradedInfo?date=" + date + "' data-rel='external' data-ajax='false'>" + $.format.date(new Date(date.replace(/-/g, "/")), "MM-dd") + " " + week +"</a></td><td>" + formNumber(bet) + "</td><td>" + formNumber(eff) + "</td><td>" + showColor2(win) + "</td><td>" + formNumber(comm) + "</td><td>" + showColor2(res) + "</td></tr>");
		});
		tbody.append("<tr><th>&nbsp;&nbsp;</th><td class='title'><a style='text-decoration: none;' data-rel='external' data-ajax='false'>总计（最近7天）</a></td><td><strong>" + formNumber(betSum) + "</strong></td><td><strong>" + formNumber(effSum) + "</strong></td><td><strong>" + showColor2(winSum) + "</strong></td><td><strong>" + formNumber(commSum) + "</strong></td><td><strong>" + showColor2(resSum) + "</strong></td></tr>");
	});	
	
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			console.log(textStatus);
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		} 	
	});
	
	request.always(function() {
		$("#historyTable").table("rebuild");
		hideLoader();		
	});	
}
$("#historyTable").html(replaceAllHtml($("#historyTable").html()));
</script>
</body>
</html>