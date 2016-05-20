<%--------------------------------交易状况----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,java.lang.Integer" %>
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
#tradingListView >.ui-li-static {
  padding: .7em .5em;
  margin:0 5px !important; 
  border-top:none !important;
  border-left:#ddd 1px solid !important; 
  border-right:#ddd 1px solid !important;
  border-bottom:#ddd 1px solid !important;
}
</style>
</head>
<body>
<input type="hidden" id="ordertype" value="${obj.status}">
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
	 		<h1>交易状况</h1>
			<a id="refreshBtn" href="#" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a> 		
		 </div>
		  --%>
		</div>
	<%@ include file="panel_left.jsp"%>
	<%@ include file="panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	 <div data-role="navbar" data-grid="b" style="margin:5px 0px 5px 0px !important">
	  	<ul>
	        <li><a href="${ctx}/sport/tradingInfo/1" <c:if test="${1 == obj.status}">class="ui-btn-active"</c:if> data-ajax="false" data-type="${obj.status}">${msg['label.sport.betinfo']}</a></li>
			<li><a href="${ctx}/sport/tradingInfo/2" <c:if test="${2 == obj.status}">class="ui-btn-active"</c:if> data-ajax="false" data-type="${obj.status}">${msg['label.sport.cancelledbets']}<span id="cancelOrder"></span></a></li>
			<li><a href="${ctx}/sport/history" data-ajax="false">${msg['label.sport.history']}</a></li>
		</ul>
	</div>  
	<ul data-role="listview" class="reset" data-divider-theme="aa" id="tradingListView">
	<%-- 
		<li data-role="list-divider">欧洲冠军杯<br>中央海岸 v 墨尔本城</li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">足球&nbsp;&nbsp;滚球 (1:0)&nbsp;&nbsp;大小</div><div class="ui-block-b">大&nbsp;&nbsp;2.5@0.90&nbsp;&nbsp;HK</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">投注额：50.00</div><div class="ui-block-b">可赢金额：45.00</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">已确认[1236007]</div><div class="ui-block-b">03-08 15:29:16</div></div>
		</li>
		<li data-role="list-divider">综合过关<span class="ui-li-count">3串1</span></li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">中国超级联赛</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">重庆力帆 VS 北京国安</div></div>		
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">足球&nbsp;&nbsp;滚球 (1:0)&nbsp;&nbsp;让球</div><div class="ui-block-b">重庆力帆 +0.5&nbsp;&nbsp;HK</div></div>
		</li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">俄罗斯超级联赛</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">莫斯科斯巴达 VS 克拉斯诺达尔</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">足球&nbsp;&nbsp;滚球 (1:0)&nbsp;&nbsp;大小</div><div class="ui-block-b">大&nbsp;&nbsp;2.5@0.90&nbsp;&nbsp;HK</div></div>
		</li>
		<li>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">投注额：50.00</div><div class="ui-block-b">可赢金额：45.00</div></div>
			<div class="ui-grid-a" style="font-size: .75em;font-weight: 400;"><div class="ui-block-a">已确认[1236007]</div><div class="ui-block-b">03-08 15:29:16</div></div>
		</li>
		 --%>
	</ul>
	<a id="topBtn" style="display:none;" href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="y">${msg["button.common.backTop"]}</a></p>  
  </div>
</div> 
<script>
var tradingListView = null;
var marketTypes = new HashMap();
var ordertype = $("#ordertype").val();
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
	tradingListView = $("#tradingListView");
	var request = $.ajax({
	    url: '${ctx}/sport/getTradingInfo',
	    data: {
	        "t": new Date().getTime()
	    },
	    dataType: 'xml'
	});
	
	request.done(function(xmlResult) {
		tradingListView.empty();
		var root = $(xmlResult);
		//var sid = root.find("records").attr("sid");
		//var sname = root.find("records").attr("snm");
		var errcode = root.find("records").attr("errcode");
		if(errcode != undefined){
			if(errcode == 1015){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";			
			}else if(errcode == -1){
				tradingListView.html('<h5 class="ui-bar ui-bar-b" style="text-align: center; margin-top:5px;">' + '${msg["msg.common.systemError"]}' + '</h5>');	
				tradingListView.listview("refresh");
				return false;				
			}
		}
		var list = root.find('record');
		if(list.length > 0){
			var totalMoney = 0, size = 0, cancelOrderSize = 0;
			list.each(function(){
				var record = $(this);
				var reason = record.attr("reason");
				var recoredStatus = record.attr('status');
				var sname = record.attr('s');
				if((ordertype == 1) || (ordertype == 2 && recoredStatus != 1 && recoredStatus != 2 && recoredStatus != 3)){
					size ++;
					var items = record.find('item');
					if(items.length == 1){
						items.each(function(){
							var item = $(this);
							var dateStr = (record.attr("time")).replace(/-/g, "/");
							var gmt0 = new Date(dateStr);
							var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);
							//投注额
							var money = record.attr("money");
							var win = formNumber(record.attr("win"));
							totalMoney += Number(money);
							//状态
							var istatus = record.attr("istatus");
							if(recoredStatus != 1){
								istatus = "<span class='red-bold-text'>" + istatus + "</span>"
							}else{
								istatus = "<span class='blue-bold-text'>" + istatus + "</span>";
							}
							if(reason == undefined ){
								reason = "";
							}
							reason = (recoredStatus == 1 || recoredStatus == 2 || recoredStatus == 3 ) ? "" : reason;
							var cancelCss = "";
							if(recoredStatus != 1 && recoredStatus != 2 && recoredStatus != 3){
								cancelOrderSize ++;
								cancelCss = "order-del";
								win = "--"
							}
							var league = item.attr("league");
							var match = item.attr("match");
							var rollInfo = "";
							if(1 == record.attr("roll")){
								rollInfo = "&nbsp;${msg['label.sport.fb.live']}" + "(" + record.attr("score") + ")&nbsp;";
							}
							var gname = utf8to16(base64decode(item.attr("gname")));
							var tname = item.attr("tname").replace("&", "/");
							var radio = item.attr("rt");
							var orderId = record.attr("id");
							var content = "<li data-role='list-divider'>" + league + "<br><span class='order-title'>" + match + "</span></li>"
										   + "<li><div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + sname + rollInfo + "&nbsp;" + gname + "</div><div class='ui-block-b'></div></div>"
										   + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'><span class='red-text " + cancelCss + "'>" + tname + "</span>@<span class='red-text " + cancelCss + "'>" + radio + "</span> <span class='red-bold-text'>" + reason + "</span></div></div>"
										   + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>${msg['label.sport.betinfo.stakeamount']}: " + money + "</div><div class='ui-block-b'>${msg['label.sport.betinfo.estWin']}: " + win + "</div></div>"
										   + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + istatus + " [" + orderId + "]</div><div class='ui-block-b'>" + $.format.date(gmt8, "MM-dd HH:mm") + " <span class='blue-text'>" + marketTypes.get(item.attr("mt")) + "</span></div></div></li>";
							tradingListView.append(content);
						});		
					}else{//综合过关
						tradingListView.append('<li data-role="list-divider">${msg['label.sport.fb.parlay']}<span class="ui-li-count">'+items.length+'${msg["label.sport.betinfo.in"]}1</span></li>');
						var roll = record.attr("roll");
						var rollInfo = "";
						//if(roll == 1){
							//rollInfo = "&nbsp;滚球" + "(" + record.attr("score") + ")";
						//}
						var marketType;
						items.each(function(){
							var item = $(this);
							var itemStatus = item.attr("status");
							var itemReason = item.attr("reason");
							if(itemReason == undefined){
								itemReason = '';
							}
							itemReason = itemStatus == 1 ? "" : itemReason;
							var cancelCss = "";
							if(itemStatus != 1 && itemStatus != 2 && itemStatus != 3){
								cancelCss = "order-del";
							}
							var gname = utf8to16(base64decode(item.attr("gname")));
							var league = item.attr("league");
							var match = item.attr("match");
							var tname = item.attr("tname").replace("&", "/");
							var radio = item.attr("rt");
							var content = "<li><div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + sname + rollInfo + "&nbsp;&nbsp;" + gname + "</div></div>"
										  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + league + "</div></div>"
										  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'>" + match + "</div></div>"
										  + "<div class='ui-grid-a' style='font-size: .75em;font-weight: 400;'><div class='ui-block-a'><span class='red-text " + cancelCss + "'>" + tname + "</span>@<span class='red-text " + cancelCss + "'>" + radio + "</span>&nbsp;&nbsp;<span class='red-bold-text'>" + itemReason + "</span></div></div></li>";
							tradingListView.append(content);
							marketType = item.attr("mt");
						});	
						var dateStr = (record.attr("time")).replace(/-/g, "/");
						var gmt0 = new Date(dateStr);
						var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);	
						var money = record.attr("money");
						totalMoney += Number(money);
						var estWin = record.attr("win");	
						//状态
						var istatus = record.attr("istatus");
						if(recoredStatus != 1 && recoredStatus != 2 && recoredStatus != 3){
							cancelOrderSize ++;
							istatus = "<font color='red'>" + istatus + "</font>"
							estWin = "--";
						}
						
																					
						var total = "<li><div class='ui-grid-a' style='font-size: .75em; font-weight:bold;'><div class='ui-block-a'>${msg['label.sport.betinfo.stakeamount']}: {0}</div><div class='ui-block-b'>${msg['label.sport.betinfo.estWin']}: {1}</div></div>"
								  +"<div class='ui-grid-a' style='font-size: .75em;font-weight: bold;'><div class='ui-block-a'><span class='blue-text'>{2}</span> [{3}] <span class='red-text'>{4}</span></div><div class='ui-block-b'>{5} <span class='blue-text'>{6}</span></div></div></li>";
						tradingListView.append(total.format(money, estWin, istatus, record.attr("id"), "", $.format.date(gmt8, "MM-dd HH:mm"), marketTypes.get(marketType)));
					}		
				}
			});
			if(totalMoney != 0){
				tradingListView.append('<li data-role="list-divider" style="background:#ff635e; color: #FFFFFF;">${msg['label.sport.betinfo.total']} ${msg['label.sport.betinfo.stakeamount']}:<span class="ui-li-count">' + formNumber(totalMoney) + '</span></li>');
			}
			tradingListView.listview("refresh");
			if(size > 5){
				$("#topBtn").show();
			}else{
				$("#topBtn").hide();
			}
			if(cancelOrderSize > 0){
				$("#cancelOrder").html("("+ cancelOrderSize +")");
			}
		}else{
			tradingListView.html('<h5 class="ui-bar ui-bar-aa" style="text-align: center; margin-top:5px;">' + '${msg["msg.common.nodata"]}' + '</h5>');	
			tradingListView.listview("refresh");		
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
		tradingListView.html(replaceAllHtml(tradingListView.html()));
		hideLoader();	
	});	
}
</script>
</body>
</html>