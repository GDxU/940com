<!--------------------------------qxc下#注#明细---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/qxc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<link rel="stylesheet" href="${staticFileUrl}/css/scroll.common.css?v=${rsvn}" media="all">
<script src="${staticFileUrl}/js/iscroll-v4.js?v=${rsvn}"></script>
<script type="text/javascript">
var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset, totalPages = 1, currentPage = 1, betInfoTable, tbody, summaryMsg, index = 1,first = true;
	
$(function(){
	//$("#summaryMsg").hide();
	loaded();
	pullUpEl.className = 'loading';
	pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';	
	
	getBetInfo(true);
	
	//屏幕切换事件
	$(window).on("orientationchange", function(event) {
		//getBetInfo(true);
		//currentPage = 1;
		//index = 1;
		//$("#betInfoTable").table("rebuild");
	});
	
	$("#gameId,#status").change(function(){
		summaryMsg.html("${msg['label.qxc.ordernum']}：加载中...&nbsp;&nbsp;${msg['label.qxc.betamt']}：加载中...").css("text-align","left");
		currentPage = 1;
		index = 1;	
		tbody.empty();
		$(pullUpEl).show();
		pullUpEl.className = 'loading';
		pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';		
		getBetInfo(true);
	});
		
});	
function openOrderIdPopup(orderId){
	var options = {"positionTo":"#" + orderId};
	$("#orderIdPopup").html("<p>" + orderId + "</p>").popup( "open", options);
} 
function openOrderCtxPopup(ctx, orderId){
	var options = {"positionTo":"#ctx" + orderId};
	$("#orderCtxPopup").html("<p>" + ctx + "</p>").popup( "open", options);
}
function openOddsPopup(odds, orderId){
	var options = {"positionTo":"#odds" + orderId};
	$("#orderOddsPopup").html("<p>" + odds + "</p>").popup( "open", options);
}
function getBetInfo(isRefresh){
    $.ajax({
        url: '${ctx}/qxc/getBetInfo',
        data: {
        	"t": new Date().getTime(),
        	"gid": $("#gameId").val(),
        	"status": $("#status").val(),
        	"cp": currentPage,
        	"first": first      
        },
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
	        	if(isRefresh == true){
	        		tbody.empty();
	        	}            	
                var arr = jsonResult.list;
                totalPages = jsonResult.tps;
                currentPage = jsonResult.cp;
                //遍历数据
                if (arr != undefined && arr.length > 0) {
                 	var size = 20;
                    $.each(arr,
                    function(key, value) {
                    	var ballCxt = value.ball;
                    	if(ballCxt.length > size){
                   			var newBallCxt = formatString(ballCxt, size);
                   			ballCxt = '<a style="text-decoration: none;" href="javascript:openOrderCtxPopup(\'' + ballCxt + '\',\'' + value.id + '\')" id="ctx' + value.id + '">'+ newBallCxt +'</a>';
                   		}
                    	var rate = value.ods1;
                    	if(value.ods2 != undefined && value.ods2 != 0){
                    		rate = rate + "," + value.ods2;
                    	}
                    	if(value.bid != undefined){
                    		rate = value.odsz;
                    	}
                    	if(rate.length > size){
							if(undefined != value.bid ){
								rate = formatString(rate, size);
							}else{
                    			rate = '<a style="text-decoration: none;" href="javascript:openOddsPopup(\'' + rate + '\',\'' + value.id + '\')" id="odds'+value.id+'">'+ formatString(rate, size) +'</a>';
                    		}
                    	}
                        var content ='<tr><th>'+ index++ +'</th> <td><font color="green"><a style="text-decoration: none;" href="javascript:openOrderIdPopup(\'' + value.id + '\')" id="'+value.id+'">'+value.gn+'</a></font></td><td>'+value.issue+'</td><td>'+value.bt+'</td><td>'+ballCxt+'<td>' + rate + '</a></td><td>' + formNumber(value.amt,2) + '</td><td>' + value.com+ '</td><td>' + formNumber(value.cmny,2) + '</td></tr>';
                        tbody.append(replaceAllHtml(content));
                    });
                    var summaryContent = "${msg['label.qxc.ordernum']}:" + jsonResult.data.bc + "&nbsp;${msg['label.qxc.betamt']}:" + formNumber(Math.round(jsonResult.data.samt * 1000 )/ 1000,2)+replaceAllHtml("&nbsp;{[{5L2j6YeR}]}:")+formNumber(Math.round(jsonResult.data.com),2)+"&nbsp;可赢金额:" + formNumber(Math.round(jsonResult.data.spl),2);
                    summaryMsg.html(summaryContent).css("text-align","left").show();
                    betInfoTable.show();
                } else { //没有数据的情况
               		betInfoTable.hide();summaryMsg.html('暂无符合条件的记录').css("text-align","center").show();
                }
                //渲染玩法列表
                if(first){
	                var plays = jsonResult.data.plays;
	                if(plays != undefined){
	                	var $gid = $("#gameId");
	               		$gid.empty().append('<option value="" selected>--玩法类型--</option>');
		            	$.each(plays, function(key, value) {
		            		$gid.append('<option value="' + key + '">' + utf8to16(base64decode(value)) + '</option>');
		            	});
		            	$gid.selectmenu("refresh");
	                }                
                }
                if(totalPages > currentPage){
                	$(pullUpEl).show();
                }else if(currentPage == 1){
                	$(pullUpEl).hide();
                }else{
                	$(pullUpEl).hide();
                }
            } else { //系统异常
            	betInfoTable.hide();summaryMsg.html('系统异常').css("text-align","center").show();$(pullUpEl).hide();
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				betInfoTable.hide();summaryMsg.html('网络中断,请检测网络').css("text-align","center").show();$(pullUpEl).hide();
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}           
        },
        complete: function() {
        	first = false;
         	betInfoTable.table("rebuild");
        	myScroll.refresh();
        	//$("#betInfoTable").html(replaceAllHtml($("#betInfoTable").html()));
        	summaryMsg.html(replaceAllHtml(summaryMsg.html()));         	
        }
    });
}

function pullDownAction () {
	setTimeout(function () {
		$(pullUpEl).hide();	
		currentPage = 1;
		index = 1;
		//重新获取数据
		getBetInfo(true);
		//myScroll.refresh();
	}, 10);
}

function pullUpAction () {
	setTimeout(function () {
		if(currentPage == 1 && totalPages == 1){
			return;
		}	
		if(totalPages == currentPage){
			$(pullUpEl).show();
			pullUpEl.className = '';
			pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多的数据可加载';	
			return;
		}
		currentPage ++;		
		getBetInfo(false);
		//myScroll.refresh();	
	}, 10);
}

function loaded() {
	betInfoTable = $("#betInfoTable");
	tbody = $("#betInfoTable > tbody");
	summaryMsg = $("#summaryMsg");
	pullDownEl = document.getElementById('pullDown');
	pullDownOffset = pullDownEl.offsetHeight;
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;
	
	myScroll = new iScroll('wrapper', {
		useTransition: true,
		topOffset: pullDownOffset,
		onRefresh: function () {
			if (pullDownEl.className.match('loading')) {
				pullDownEl.className = '';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
			} else if (pullUpEl.className.match('loading')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '向上拖动加载更多...';
			}
		},
		onScrollMove: function () {
			if (this.y > 5 && !pullDownEl.className.match('flip')) {
				pullDownEl.className = 'flip';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '释放更新...';
				this.minScrollY = 0;
			} else if (this.y < 5 && pullDownEl.className.match('flip')) {
				pullDownEl.className = '';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
				this.minScrollY = -pullDownOffset;
			} else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '向上拖动加载更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = '数据加载中...';				
				pullDownAction();
			} else if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loading';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';				
				pullUpAction();	
			}
		}
	});
	
	setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 0);
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
//document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 0); }, false);
</script>
</head>
<body>
<div data-role="page" id="betInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/qxc/qxcmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["label.qxc.betdetail"]}</h1>
<!-- 	 		<a href="javascript:getBetInfo(true);" data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-icon-left ui-icon-refresh ui-btn-icon-notext"></a> -->
		 </div>		
		</div>
    <%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<div class="ui-grid-a">
		<div class="ui-block-a ">
			<select name="status" id="status" data-mini="true">
				<option value="" selected>--状态--</option>
				<option value="1">${msg["label.qxc.succeedOrder"]}</option>
				<option value="0">${msg["label.qxc.failedOrder"]}</option>
			</select>
		</div>
		<div class="ui-block-b">
			<select name="gameId" id="gameId" data-mini="true">
				<option value="" selected>--玩法类型--</option>
			</select>
		</div>
	</div>

	<h5 class="ui-bar ui-bar-b ui-corner-all content-info1" id="summaryMsg" style="font-size: 12px">
  	${msg['label.qxc.ordernum']}：加载中...&nbsp;${msg['label.qxc.betamt']}：加载中...
  	</h5>
	<div id="wrapper" style="top:95px;">
		<div id="scroller">
		<div id="pullDown">
			<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
		</div>	
<!-- 		<table data-role="table" id="betInfoTable" data-mode="reflow" class="movie-list table-stroke" style="font-size: 12px"> -->
		  <table data-role="table" id="betInfoTable" data-mode="reflow" class="qxc-list qxc-table-breakpoint" style="font-size: 12px">
			<thead>
				<tr>
					<th>序号</th>
					<th>类型</th>
					<th>${msg["label.qxc.issue"]}</th>
					<th>${msg["label.qxc.bettime"]}</th>
					<th>内容</th>
					<th>${msg["label.qxc.radio"]}</th>
					<th>金额</th>
					<th>${msg["label.qxc.yongjin"]}</th>
					<th>可赢金额</th>
				</tr>
			</thead>
			<tbody>
			<!-- 
			<tr>
				<td>1</td>
				<td><font color="green"><a style="text-decoration: none;"
					href="javascript:openOrderIdPopup('fa92954d708d494b80ee854fa41f3ea5')"
					id="fa92954d708d494b80ee854fa41f3ea5">二全中</a></font></td>
				<td>2014122</td>
				<td>2014-10-23 16:03:25</td>
				<td><a href="${ctx}/qxc/orderGroup" data-ajax="false" style="text-decoration: none;">12,15,12,12,12,12,12,12,12,12</a>
				<td>71,71,71,71,71,71,71,71,71,71</a></td>
				<td>2.00</td>
				<td>0&nbsp;[D盘]</td>
				<td>37.00</td>
			</tr>
			 -->
			</tbody>
		</table>
		<div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">向上拖动加载更多...</span>
		</div>
		</div>
	</div>	
	<div data-role="popup" id="orderIdPopup" class="ui-content" data-theme="b" data-history="false" data-corners="false"></div>
	<div data-role="popup" id="orderCtxPopup" class="ui-content" data-theme="a" data-history="false" data-corners="true" data-arrow="true"></div>
	<div data-role="popup" id="orderOddsPopup" class="ui-content" data-theme="a" data-history="false" data-corners="true" data-arrow="true"></div>
  </div>
</div> 
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);     
</script>
</html>