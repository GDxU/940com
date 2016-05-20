<%--------------------------------已结算----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<%@ include file="/WEB-INF/page/i18n.jsp" %>
<script src="${staticFileUrl}/js/sport/panel.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/hashMap.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/sport.css">
<style>
.ui-listview>.ui-li-divider {
  padding: .5em .5em !important;
  font-size: 14px !important;
  font-weight: 700 !important;
  cursor: default !important;
  outline: 0 !important;
  margin: 6px 5px 0 5px !important;
}
.ui-bar-aa {
  border: #C4CAC1 1px solid;
  background: #C4CAC1;
  color: #3C4F48;
  text-shadow: none;
}
.ui-bar-bb {
  border: #C4CAC1 1px solid;
  background: #C4CAC1;
  color: #3C4F48;
  text-shadow: none;
}
#tradedListView > .ui-li-static {
  padding: .7em .5em;
  margin:0 5px !important; 
  border-top:none !important;
  border-left:#ddd 1px solid !important; 
  border-right:#ddd 1px solid !important;
  border-bottom:#ddd 1px solid !important;
}
.ui-title {
   margin: 0 10% 0 5% !important;
}
</style>
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
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	     	<fmt:parseDate value="${obj.date}" var="registTime" pattern="yyyy-MM-dd" />
	 		<h1>${msg["label.sport.betinfo.settled"]}(<fmt:formatDate pattern='MM/dd' value='${registTime}'/>)</h1>
			<a id="refreshBtn" href="javascript:loadTrading();" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a> 		
		 </div>
		</div>
	<%@ include file="panel_left.jsp"%>
	<%@ include file="panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<ul data-role="listview" class="reset" data-divider-theme="bb" id="tradedListView">
		<%--
		<li data-role="list-divider">欧洲冠军杯<br>中央海岸 v 墨尔本城</li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">足球&nbsp;让球</div><div class="ui-block-b">中央海岸 -0.5&1@0.90&nbsp;HK</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">投##注额：50.00</div><div class="ui-block-b">输 / 赢：12.58</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">注单号：1236007</div><div class="ui-block-b">投##时间：03-08 15:29:16</div></div>
		</li>
		<li data-role="list-divider">综合过关<span class="ui-li-count">3串1</span></li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">中国超级联赛</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">重庆力帆 VS 北京国安 (6:1) 赢</div></div>		
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">足球&nbsp;&nbsp;滚球 (1:0)&nbsp;&nbsp;让球</div><div class="ui-block-b">重庆力帆 +0.5&2.04&nbsp;&nbsp;HK</div></div>
		</li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">投##注额：50.00</div><div class="ui-block-b">输 / 赢：45.00</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">注单号：1236007</div><div class="ui-block-b">投##注时间：03-08 15:29:16</div></div>
		</li>
		 --%>
	</ul> 
	<a id="topBtn" style="display:none;" href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="y">${msg["button.common.backTop"]}</a></p> 
  </div>
</div> 
<script>
var tradedListView = null;
var marketTypes = new HashMap();
$(function(){
	marketTypes.put(1, "HK");
	marketTypes.put(2, "ID");
	marketTypes.put(3, "MY");
	marketTypes.put(4, "EU");
	
	loadTrading();
});

//1=香港盘 2=印尼盘 3=马来盘 4=欧盘
function loadTrading() {
	showLoader("${msg['msg.common.loading']}");
	tradedListView = $("#tradedListView");
	var request = $.ajax({
	    url: '${ctx}/sport/getTradedInfo',
	    data: {
	        "t": new Date().getTime(),
	        "date": "${obj.date}"
	    },
	    dataType: 'xml'
	});
	
	request.done(function(xmlResult) {
		tradedListView.empty();
		var root = $(xmlResult);
		//var sid = root.find("records").attr("sid");
		//var sname = root.find("records").attr("snm");
		var errcode = root.find("records").attr("errcode");
		if(errcode != undefined){
			if(errcode == 1015){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";			
			}else if(errcode == -1){
				tradedListView.html('<h5 class="ui-bar ui-bar-b" style="text-align: center; margin-top:5px;">' + '${msg["msg.common.systemError"]}' + '</h5>');	
				tradedListView.listview("refresh");	
				return false;			
			}
		}
		var list = root.find('record');
		if(list.length > 0){
			var totalMoney = 0, totalWin = 0;
			list.each(function(){
				var record = $(this);
				var items = record.find('item');
				var recoredStatus = record.attr('status');
				var recoredReason = record.attr('reason');
				var sname = record.attr('s');
				if(items.length == 1){
					items.each(function(){
						var item = $(this);
						var dateStr = (record.attr("time")).replace(/-/g, "/");
						var gmt0 = new Date(dateStr);
						var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);
						var money = record.attr("money");
						totalMoney += Number(money);
						//佣金
						var comm = record.attr("comm");
						<%--显示：派彩 + 佣金--%> 
						var win = Number(record.attr("win")) + Number(comm);
						if(recoredStatus == 5){
							totalWin += win;
						}
						
						if(win > 0){
							win = "<strong class='green-text'>" +formNumber(win) + "</strong>"
						}else{
							win = "<strong class='red-text'>" + formNumber(win) + "</strong>"
						}
						if(recoredStatus != 5){
							win = "-"
						}
						if(isNaN(comm) == false && Number(comm) != 0){
							comm = "(<span class='green-text'>" + formNumber(comm) + "</span>)"
						}else{
							comm = "";
						}
						if(recoredStatus != 5){
							comm = "-"
						}	
						var cancelCss = "";					
						//状态
						var winstatus = item.attr("winstatus");
						if(recoredStatus != 5){
							winstatus =  "<strong class='red-bold-text'>" + recoredReason + "</strong>";
							cancelCss = "order-del";
						}else{
							if(Number(record.attr("win")) > 0){
								winstatus = "<strong class='green-text'>" + winstatus + "</strong>";
							}else if(Number(record.attr("win")) < 0){
								winstatus = "<strong class='red-text'>" + winstatus + "</strong>";
							}
						}
						var dr = item.attr("dr")//半/全#场
						var playId = item.attr("playId")//玩法
						//比分
						var score;
						var hmres = item.attr("hmres");
						var fmres = item.attr("fmres");
						
						if(dr == 1){//全#场
							if(playId == 7){
								if((hmres != undefined && hmres != '' && hmres != ':') && (fmres != undefined && fmres != '' && fmres != ':')){
									score = "${msg['label.sport.result.ft']} " + fmres + ",${msg['label.sport.result.ht']} " + hmres;
								}else{
									score = "--";
								}
							}else{
								if(fmres != undefined && fmres != ''){
									score = "${msg['label.sport.result.ft']} " + fmres;
								}else{
									score = "--";
								}
							}
						}else{//半#场
							if(hmres != undefined && hmres != ''){
								score = "${msg['label.sport.result.ht']} " + hmres;
							}else{
								score = "--";
							}
						}
						/**
						if((hmres != undefined && hmres != '' && hmres != ':') && (fmres != undefined && fmres != '' && fmres != ':')){
							score = "${msg['label.sport.result.ft']} " + fmres + ",${msg['label.sport.result.ht']} " + hmres;
							//score = "${msg['label.sport.result.ft']} " + fmres;
						}else if(hmres != undefined && hmres != '' && (fmres == undefined  || fmres == '' || fmres == ':')){
							score = "${msg['label.sport.result.ht']} " + hmres;
						}else if((hmres == undefined || hmres == '' || hmres == ':') && fmres != undefined && fmres != ''){
							score = "${msg['label.sport.result.ft']} " + fmres;
						}else{
							score = "--";
						}
						*/
						var league = item.attr("league");
						var match = item.attr("match");
						var roll = record.attr("roll");
						var rollInfo = "";
						if(roll == 1){
							rollInfo = "<span class='red-text'>${msg['label.sport.fb.live']}</span>" + "<span class='red-text'>(" + record.attr("score") + ")</span>";
						}
						var gname = utf8to16(base64decode(item.attr("gname")));
						var tname = item.attr("tname").replace("&", "/");;
						var radio = item.attr("rt");
						var mt = marketTypes.get(item.attr("mt")).toString();
						var orderId = record.attr("id");
						var content = "<li data-role='list-divider'>" + league + "<br><span class='order-title'>" + match + "</span></li><li>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + sname + "&nbsp;" + rollInfo + "&nbsp;" + gname + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'><span class='red-text " + cancelCss + "'>" + tname + "</span>@<span class='red-text " + cancelCss + "'>" + radio +"</span>&nbsp;<span class='blue-text'>" + mt + "</span></div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>${msg['label.sport.betinfo.stakeamount']}: " + money + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.score']}: " + score + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>${msg['label.sport.betinfo.orderid']}: " + orderId + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.bettime']}: " + $.format.date(gmt8, "MM-dd HH:mm") + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>${msg['label.sport.betinfo.status']}: " + winstatus + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.returns']}: " + win + comm + "</div></div></li>";
						tradedListView.append(content);
					});		
				}else{//综合过关
					tradedListView.append('<li data-role="list-divider">${msg['label.sport.fb.parlay']}<span class="ui-li-count">' + items.length + '${msg["label.sport.betinfo.in"]}1</span></li>');
					items.each(function(){
						var item = $(this);
						var roll = record.attr("roll") == 1 ? "${msg['label.sport.fb.live']} ("+record.attr("score")+")" : "";
						var score;
						var hmres = item.attr("hmres");
						var fmres = item.attr("fmres");
						if((hmres != undefined && hmres != '' && hmres != ':') && (fmres != undefined && fmres != '' && fmres != ':')){
							score = "&nbsp;<span class='blue'>" + "${msg['label.sport.result.ft']}:" + fmres + "&nbsp;&nbsp;${msg['label.sport.result.ht']}:" + hmres + "</span>";
							//score = "&nbsp;<span class='blue'>" + "${msg['label.sport.result.ft']}:" + fmres + "</span>";
						}else if(hmres != undefined && hmres != '' && (fmres == undefined  || fmres == '' || fmres == ':')){
							score = "&nbsp;<span class='blue'>(" + hmres + ")</span>";
						}else if((hmres == undefined || hmres == '' || hmres == ':') && fmres != undefined && fmres != ''){
							score = "&nbsp;<span class='blue'>(" + fmres+ ")</span>";
						}else{
							score = "";
						}

						var itemStatus = item.attr("status");
						var winstatus = item.attr("winstatus");
						if(itemStatus != 5){
							winstatus = "";
						}else{
							if(winstatus == '赢' || winstatus == 'Win' || winstatus == '赢半' || winstatus == 'Win Half'){
								winstatus = "<span class='green-text'>" + winstatus + "</span>"
							}else if(winstatus == '输' || winstatus == 'Full Loss' || winstatus == '输半' || winstatus == 'Loss Half'  ){
								winstatus = "<span class='red-text'>" + winstatus + "</span>"
							}						
						}
						
						var reason = item.attr("reason");
						var cancelCss = "";
						if(itemStatus != 5 && reason != undefined && reason != ""){
							reason ="<strong class='red-bold-text'>" + reason + "</strong>"
							cancelCss = "order-del";
						}else{
							reason = "" ;
						}
												
						var tname = "<span class='red-text " + cancelCss + "'>" + item.attr("tname").replace("&", "/") + "</span>";
						var radio = "<span class='red-text " + cancelCss + "'>" + item.attr("rt") + "</span>";
						var content = "<li><div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" +sname + "&nbsp;" + roll + "&nbsp;" + utf8to16(base64decode(item.attr("gname"))) + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + item.attr("league") + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + item.attr("match") + score + "&nbsp;&nbsp;" + winstatus + "&nbsp;" + reason + "</div></div>"
									  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + tname + "@" + radio + "&nbsp;&nbsp;<span class='blue-text'>" + marketTypes.get(item.attr("mt")).toString() + "</span></div></div></li>";
						tradedListView.append(content);
					});	
					//时间
					var dateStr = (record.attr("time")).replace(/-/g, "/");
					var gmt0 = new Date(dateStr);
					var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);		
					<%--派彩,综合没有反水--%>
					var win = Number(record.attr("win")), winstatus;
					if(recoredStatus == 5){
						totalWin += win;
					}
					
					if(recoredStatus != 5){
						winstatus = "<strong class='red-bold-text'>" + recoredReason + "</strong>";
						win = "--";
					}else{
						if(win > 0){
							win = "<strong class='green-text'>" + formNumber(record.attr("win"), 3) + "</strong>"
							winstatus = "<strong class='green-text'>"+ "${msg['label.sport.betinfo.win']}" + "</strong>";
						}else if (win < 0){
							win = "<strong class='red-text'>" + formNumber(record.attr("win"), 3) + "</strong>"
							winstatus = "<strong class='red-text'>" + "${msg['label.sport.betinfo.fullloss']}" + "</strong>"
						}else{
							win = "<strong class='red-text'>" + formNumber(record.attr("win"), 3) + "</strong>"
							winstatus = "${msg['label.sport.betinfo.draw']}";
						}			
					}		
					var money = record.attr("money");
					totalMoney += Number(money);	
					var total = "<li><div class='ui-grid-a' style='font-size: .75em;font-weight: bold;'><div class='ui-block-a'>${msg['label.sport.betinfo.orderid']}: " + record.attr("id") + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.bettime']}: " + $.format.date(gmt8, "MM-dd HH:mm") + "</div></div>"
								+ "<div class='ui-grid-a' style='font-size: .75em;font-weight: bold;'><div class='ui-block-a'>${msg['label.sport.betinfo.stakeamount']}: " + money + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.returns']}: " + win + "&nbsp;&nbsp;" + winstatus + "</div></div></li>";
					tradedListView.append(total);
				}
			});		
			if(totalMoney != 0){
				tradedListView.append('<li data-role="list-divider" style="background:#ff635e; color: #FFFFFF; white-space:pre-wrap;">${msg['label.sport.betinfo.total']}: ${msg['label.sport.betinfo.stakeamount']} ' + formNumber(totalMoney) + ', ${msg['label.sport.betinfo.returns']} ' + formNumber(totalWin) + '</li>');
			}
			tradedListView.listview("refresh");	
			if(list.length > 5){
				$("#topBtn").show();
			}else{
				$("#topBtn").hide();
			}		
		}else{
			tradedListView.html('<h5 class="ui-bar ui-bar-aa" style="text-align: center; margin-top:5px;">' + '${msg["msg.common.nodata"]}' + '</h5>');	
			tradedListView.listview("refresh");
		}		
	});	
	
	request.fail(function(jqXHR, textStatus, errorThrown) {
		//console.log(jqXHR);
		//console.log("status:" + jqXHR.status);
		//console.log("statusText:" +jqXHR.statusText);
		//console.log("responseText:" + jqXHR.responseText);
		if(textStatus == 'error'){
			console.log(errorThrown);
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		} 	
	});
	
	request.always(function() {
		$("#tradedListView").html(replaceAllHtml($("#tradedListView").html()));
		hideLoader();
	});	
}
</script>
</body>
</html>