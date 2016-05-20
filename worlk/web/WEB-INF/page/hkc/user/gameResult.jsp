<!--------------------------------HKC{[{5byA5aWW}]}结果---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<link rel="stylesheet" href="${staticFileUrl}/css/scroll.common.css?v=${rsvn}" media="all">
<script src="${staticFileUrl}/js/iscroll-v4.js?v=${rsvn}"></script>
<%@include file="/WEB-INF/page/hkc/games/hkcutil.jsp"%>
<script type="text/javascript">
var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset, totalPages = 1, currentPage = 1, firstLoad = true;
$(function(){
	loaded();
	$(pullUpEl).hide();
	pullDownEl.className = 'loading';
	pullDownEl.querySelector('.pullDownLabel').innerHTML = '数据加载中...';				
	pullDownAction();
});
/**
*isRefresh=true加载最新,type=false加载下一页
*/
function getGameResult(isRefresh){
    if(firstLoad){
    	showLoader();
    }
    var gameResultListView = $("#gameResultListView");
    var request = $.ajax({
        url: '${ctx}/hkc/getGameResult',
        data: {
        	"cp": currentPage,
        	"t": new Date().getTime()
        },
        dataType: 'json'
    });
	request.done(function(jsonResult) {
	    var result = jsonResult.r;
	    if (result == 0) {
	    	if(isRefresh){
	    		gameResultListView.empty();
	    	}
	        var arr = jsonResult.list;
	        if (arr != undefined && arr.length > 0) {
	            $.each(arr, function(key, value) {
	            	var ballHtml = '<li>'; 
	            	var ballArr = value.ball.split(",");
	            	var nums = ballArr.takeColor();
	            	$.each(nums, function(n, v){
	            		ballHtml = ballHtml.concat('<div class="ball2 '+ nums[n][1] + '-ball fl">' + nums[n][0] + '</div>');
	            		if(n == 5){
	            			ballHtml = ballHtml.concat('<div class="fl numadd"> + </div>');
	            		}
	            	});
	            	ballHtml = ballHtml.concat('</li>');
	            	var resultCxt = '<li class="result_content">&nbsp;&nbsp;' + value.anml + '&nbsp;&nbsp;' + value.sum + '|' + value.eo + '|' + value.bs + '|' + value.ceo + '|' + value.seo + '|' + value.sbs + '</li>';
					if(value.sum == undefined){
						resultCxt = "";
					}	               
	                var content = '<li class="his_issue"><strong>第' + value.issue + '{[{5pyf}]} </strong><span class="ui-li-count">' + value.date + '</span>' + ballHtml + resultCxt + '</li>';
	                gameResultListView.append(content);
	            });
	            if(arr.length == 20 ){
	            	$(pullUpEl).show();
	            }
	            if(isRefresh){
	            	currentPage = 2;
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '向上拖动加载更多...';	            	
	            }else{
	            	currentPage ++;
	            }
	        } else {
	         	if(isRefresh){
	            	gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
	            }
	            if(!isRefresh && currentPage > 1){
	            	$(pullUpEl).show();
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '没有更多的数据可加载';	
	            }
	        }
	    } else {
	        gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常,请联系管理员</h5>');
	    }
	});
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			gameResultListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络{[{5Lit}]}断,请检测网络</h5>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}		    
	});
	request.always(function() {
		gameResultListView.listview("refresh");
		myScroll.refresh();
		if(firstLoad){
			hideLoader();
		}
		firstLoad = false;
		gameResultListView.html(replaceAllHtml(gameResultListView.html()));
	});    
}
function pullDownAction () {
	setTimeout(function () {
		currentPage = 1;
		getGameResult(true);
	}, 500);
	
}

function pullUpAction () {
	setTimeout(function () {
		getGameResult(false);
	}, 500);
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
</script>
<style>
.result_content {
	font-size: 13px;
}

.fl {
	float: left;
	margin-left: 6px;
}

.fl1 {
	float: left;
}

.numadd {
	font-weight: bold;
	font-size: 15px;
	font-family: \5FAE\8F6F\96C5\9ED1;
	display: inline-block;
	display: inline;
	zoom: 1;
	margin-right: 0px
}
</style>
</head>
<body>
<input type="hidden" id="gameId" name="gameId" value="${obj.gid}"/>
<div data-role="page" id="gameResultPage" data-title="{[{5byA5aWW}]}结果">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/hkc/hkmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>{[{5byA5aWW}]}结果</h1>
<!-- 	 		<a href="javascript:getGameResult()" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a> -->
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<div data-role="main" class="ui-content" id="wrapper" style="top:2px;">
			<div id="scroller">
				<div id="pullDown">
					<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
				</div>
				<ul data-role="listview" id="gameResultListView" data-theme="a" class="reset">
					<!-- 
						<li><strong>第2014117{[{5pyf}]} </strong><span class="ui-li-count">2014-10-11</span>
						<li>
							<div class="ball2 blue-ball fl">37</div>
							<div class="ball2 red-ball fl">29</div>
							<div class="ball2 red-ball fl">35</div>
							<div class="ball2 blue-ball fl">26</div>
							<div class="ball2 red-ball fl">34</div>
							<div class="ball2 blue-ball fl">47</div>
							<div class="fl numadd">+</div>
							<div class="ball2 red-ball fl">08</div></li>
						<li class="result_content">&nbsp;&nbsp;马 虎 猴 蛇 鸡 猴 +
							猪&nbsp;&nbsp;216|{[{5Y+M}]}|{[{5bCP}]}|{[{5ZCI}]}{[{5Y+M}]}|总{[{5Y+M}]}|总{[{5aSn}]}</li>
						</li>
					-->
				</ul>
				<div id="pullUp">
					<span class="pullUpIcon"></span><span class="pullUpLabel">向上拖动加载更多...</span>
				</div>
			</div>
		</div>
	</div> 
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>