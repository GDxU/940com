<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/scroll.common.css" media="all">
<script src="${staticFileUrl}/js/iscroll-v4.js"></script>
<script type="text/javascript">
var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset, totalPages = 1, currentPage = 1, betInfoTable, tbody, summaryMsg, index = 1;
	
$(function(){
	//$("#summaryMsg").hide();
	loaded();
	pullUpEl.className = 'loading';
	pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';	
	
	getBetInfo(true);
	
	//屏幕切换事件
	$(window).on("orientationchange", function(event) {
		getBetInfo(true);
		currentPage = 1;
		index = 1;
		//$("#betInfoTable").table("rebuild");
	});
	
	$("#gameId").change(function(){
		summaryMsg.html("{[{5oC75rOo5pWw}]}：加载中...&nbsp;&nbsp;&nbsp;&nbsp;总{[{5LiL5rOo}]}金额：加载中...").css("text-align","left");	
		tbody.empty();
		$(pullUpEl).show();
		pullUpEl.className = 'loading';
		pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';		
		pullDownAction();
	});
		
});	
function openOrderIdPopup(orderId){
	var options = {"positionTo":"#" + orderId}
	$("#orderIdPopup").html("<p>" + orderId + "</p>").popup( "open", options);
} 

function getBetInfo(isRefresh){
    $.ajax({
        url: '${ctx}/ssc/getBetInfo',
        data: {
        	"t" : new Date().getTime(),
        	//"gid": $("#gameId").val(),
        	"cp" : currentPage        
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
                console.log(arr);
                    $.each(arr,
                    function(key, value) {
                    	var amt = value.amt;
                        var content = '<tr><th>'+ index++ +'</th><td><font color="green">' + value.gn + '</font> </td><td>' + value.issue + '</td><td>' + value.bt + '</td><td><a style="text-decoration: none;" href="javascript:openOrderIdPopup(\'' + value.id + '\')"  id="' + value.id + '">' + value.pn + ' ' + value.ball + '@' + Math.round(value.ods * 1000) / 1000 + '</a></td><td>' + formNumber(amt,2) + '</td><td>' + value.com + '&nbsp;[' + value.hdcp + '盘]</td><td>' + formNumber(value.cmny,3) + '</td></tr>';
                        tbody.append(replaceAllHtml(content));
                    });
                    var summaryContent = "{[{5oC75rOo5pWw}]}:" + jsonResult.tc + "&nbsp;&nbsp;总{[{5LiL5rOo}]}金额:" + formNumber(Math.round(jsonResult.data.samt * 1000 )/ 1000,2);
                    summaryMsg.html(summaryContent).css("text-align","left").show();
                    betInfoTable.show();
                } else { //没有数据的情况
               		betInfoTable.hide();summaryMsg.html('暂无符合条件的记录').css("text-align","center").show();
                }
                if(totalPages > currentPage){
                	$(pullUpEl).show();
                }else if(currentPage == 1){
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
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1 id="title">{[{5LiL5rOo}]}状况</h1>
<!-- 	 		<a href="javascript:getBetInfo(true);" data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-icon-left ui-icon-refresh ui-btn-icon-notext"></a> -->
		 </div>		
		</div>
    <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
  	<h5 class="ui-bar ui-bar-b ui-corner-all content-info" id="summaryMsg" style="font-size: 12px">
  	{[{5oC75rOo5pWw}]}：加载中...&nbsp;&nbsp;&nbsp;&nbsp;总{[{5LiL5rOo}]}金额：加载中...
  	</h5>
	<div id="wrapper" style="top:50px;">
		<div id="scroller">
		<div id="pullDown">
			<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
		</div>	
<!-- 		<table data-role="table" id="betInfoTable" data-mode="reflow" class="movie-list table-stroke"> -->
		  <table data-role="table" id="betInfoTable" data-mode="reflow" class="ssc-list ssc-table-breakpoint ui-table-list-tr" style="font-size: 14px">
			<thead>
				<tr>
					<th>序号</th>
					<th>类型</th>
					<th>${msg['label.ssc.issue']}</th>
					<th>${msg['label.ssc.bettime']}</th>
					<th>玩法</th>
					<th>${msg['label.ssc.betamt']}</th>
					<th>${msg['label.ssc.tuishui']}(%)</th>
					<th>可赢金额</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">向上拖动加载更多...</span>
		</div>
		</div>
	</div>	
	<div data-role="popup" id="orderIdPopup" class="ui-content" data-theme="b" data-history="false" data-corners="false"></div>
  </div>
</div> 
</body>
<script type= "text/javascript">
     $("#title").html(replaceAllHtml($("#title").html())); 
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);     
</script>
</html>