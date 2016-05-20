<%--------------------------------明细----------------------------%>
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
var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset, totalPages = 1, currentPage = 1, index = 1 ,tj_betMoney = 0;
	
$(function(){
	$("#summaryMsg").hide();
	loaded();
	pullUpEl.className = 'loading';
	pullUpEl.querySelector('.pullUpLabel').innerHTML = '数据加载中...';	
	getBetInfo(true);
	//屏幕切换事件
	$(window).on("orientationchange", function(event) {
		getBetInfo(true);
		currentPage = 1;
		index = 1;
		tj_betMoney = 0;
	});	
});	
function openOrderIdPopup(orderId){
	var options = {"positionTo":"#" + orderId}
	$("#orderIdPopup").html("<p>" + orderId + "</p>").popup( "open", options);
}

function getBetInfo(isRefresh){
	var betInfoTable = $("#accHisDayDetail");
	var tbody = $("#accHisDayDetail > tbody");
	var summaryMsg = $("#summaryMsg");
    $.ajax({
        url: '${ctx}/ssc/getAccHisDayDetail',
        data: {
        	"t" : new Date().getTime(),
        	"rtype": $("#rtype").val(),
        	"bt": $("#btdate").val(),
        	"gid": $("#gid").val(),
        	"cp" : currentPage,
        	"issue" : $("#issue").val()
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
                    $.each(arr,
                    function(key, value) {
                    	var amt = value.amt,cmny = value.cmny,isWin;
                    	if(cmny > 0){
                    		isWin = "中奖";
                    	}else if(cmny < 0){
                    		isWin = "未中奖";
                    	}else{
                    		isWin = "和";
                    	}
                    	if($("#rtype").val() == 2){
	                    	isWin = "未结算";
                    	}else if($("#rtype").val() == 3){
                    		isWin = "<font color='red'>划单</font>";
                    	}
                    	tj_betMoney += amt;
                        var content = '<tr><th><font color=green>'+ index++ +'</font></th><td>' + value.issue + '</td><td>' + value.bt + '</td><td><a style="text-decoration: none;" href="javascript:openOrderIdPopup(\'' + value.id + '\')"  id="' + value.id + '">' + value.pn + '&nbsp;' + value.ball + '@' + Math.round(value.ods * 1000) / 1000 + '</a></td><td>' + formNumber(amt,2) + '</td><td>' + value.com + '&nbsp;[' + value.hdcp + '盘]</td><td>' + isWin + '</td><td>' + showColor(cmny) + '</td></tr>';
                        tbody.append(content);
                    });
                    var totalPl = jsonResult.data.wan;
                    var summaryContent = "总${msg['label.ssc.zhushu']}:" + (index-1) + "&nbsp;总${msg['label.ssc.betamt']}:" + formNumber(tj_betMoney,2) + "&nbsp;总嬴亏:" + showColor(Math.round(totalPl == undefined ? 0 : totalPl * 1000 )/ 1000,2);
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
                betInfoTable.hide();summaryMsg.html('系统异常').css("text-align","center").show(); $(pullUpEl).hide();
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
        	betInfoTable.html(replaceAllHtml(betInfoTable.html()));
        	summaryMsg.html(replaceAllHtml(summaryMsg.html()));    
        }
    });
}

function pullDownAction () {
	setTimeout(function () {
		$(pullUpEl).hide();
		currentPage = 1;
		index = 1;
		tj_betMoney = 0;
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
<input type="hidden" id="rtype" name="rtype" value="${obj.rtype}"/>
<input type="hidden" id="btdate" name="btdate" value="${obj.bt}"/>
<input type="hidden" id="gid" name="gid" value="${obj.gid}"/>
<input type="hidden" id="issue" name="issue" value="${obj.issue}"/>
<div data-role="page" id="accHisDayDetailPage" data-title="账户历史">
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
	 		<h1 id="title">${obj.game}</h1>
<!-- 	 		<a href="javascript:getBetInfo(true);" data-ajax="false" class="ui-btn ui-shadow ui-corner-all ui-btn-icon-left ui-icon-refresh ui-btn-icon-notext"></a> -->
		 </div>		
		</div>
    <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
  	<h5 class="ui-bar ui-bar-b ui-corner-all content-info" id="summaryMsg" style="font-size: 12px">
  	</h5>
	<div id="wrapper" style="top:50px;">
		<div id="scroller">
		<div id="pullDown">
			<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
		</div>	
<!-- 		<table data-role="table" id="betInfoTable" data-mode="reflow" class="movie-list table-stroke"> -->
		  <table data-role="table" id="accHisDayDetail" data-mode="reflow" class="ssc-list ssc-table-breakpoint" style="font-size: 14px">
			<thead>
				<tr>
					<th>序号</th>
					<th>${msg['label.ssc.issue']}</th>
					<th>${msg['label.ssc.bettime']}</th>
					<th>玩法</th>
					<th>${msg['label.ssc.betamt']}</th>
					<th>${msg['label.ssc.tuishui']}(%)</th>
					<th>结果</th>
					<th>${msg['label.ssc.winloss']}</th>
				</tr>
			</thead>
			<tbody>
			<%-- 
				<tr>
					<td><font color="green">广东快乐十分</font> </td>
					<td>2014072242期</td>
					<td>2014-7-22 15:52:21</td>
					<td>总和 大@1.98 <a href="javascript:openOrderIdPopup('3486994fcdc24b3497c71acfde5afc23')"  id="3486994fcdc24b3497c71acfde5afc23">单号</a></td>
					<td>200</td>
					<td>0&nbsp;[A盘]</td>
					<td>1.96</td>
				</tr>
			 --%>	
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
     $("#title").html(utf8to16(base64decode($("#title").html()))); 
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);     
</script>
</html>