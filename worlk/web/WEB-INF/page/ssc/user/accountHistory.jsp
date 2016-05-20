<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<script type="text/javascript">
var orderType = 1,navActiveTask;
$(function() {
	$("#summaryMsg").hide();
    //默认加载已结算数据
    getAccoutHistory(1); 
    $("#nav_closed,#nav_open,#nav_open3").click(function() { //点击tabs事件
    	if(navActiveTask != undefined){
    		clearInterval(navActiveTask)
    	}
        var $this = $(this);
        orderType = $this.jqmData("type");
	    //解决回退到该页面页签选中失效的问题
	    navActiveTask = setInterval(function(){
	    	if(orderType == 1){
	    		$("#nav_closed").addClass("ui-btn-active");
	    		$("#nav_open").removeClass("ui-btn-active");
	    		$("#nav_open3").removeClass("ui-btn-active");
	    	}else if(orderType == 2){
	    		$("#nav_open").addClass("ui-btn-active");
	    		$("#nav_closed").removeClass("ui-btn-active");
	    		$("#nav_open3").removeClass("ui-btn-active");
	    	}else if(orderType == 3){
	    		$("#nav_open").removeClass("ui-btn-active");
	    		$("#nav_closed").removeClass("ui-btn-active");
	    		$("#nav_open3").addClass("ui-btn-active");
	    	}
	    }, 1000);   
	            
        getAccoutHistory();
    });

});
//按天汇总
function getAccoutHistory() {
	$("div[data-role='navbar']").addClass("ui-disabled");
    showLoader();
    var accHisList = $("#accHisList");
    var summaryMsg = $("#summaryMsg");
    $.ajax({
        url: '${ctx}/ssc/getAccoutHistory',
        data: {"orderType" : orderType,"t" : new Date().getTime()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
            	accHisList.empty();
                var arr = jsonResult.list;
                //遍历数据
                if (arr != undefined && arr.length > 0) {
                	var numTotal = 0, amtTotal = 0, comTotal = 0, plTotal = 0;
                    $.each(arr,
                    function(key, value) {
                    	var url = "${ctx}/ssc/accHisDay?bt=" + value.date + "&rtype=" + orderType;
                    	var orderDetailUrl = '<li><a href="' + url + '" data-ajax="false">{[{5rOo}]}单明细</a></li>';
                    	var num = value.num, amt = value.amt, com = value.com, pl = value.pl;
                    	numTotal += num;
                    	amtTotal += amt;
                    	comTotal += com;
                    	plTotal += pl;
                        var content = '<div data-role="collapsible" data-collapsed="true" data-theme="a" data-content-theme="a" data-iconpos="right"><h3>' + value.date +'&nbsp;' + value.wk + '</h3><ul data-role="listview"><li>{[{5rOo5pWw}]}<span class="ui-li-count">' + num + '</span></li><li>{[{5LiL5rOo}]}金额<span class="ui-li-count">' + formNumber(amt,2) + '</span></li><li>{[{5L2j6YeR}]}<span class="ui-li-count">' + formNumber(com,2) + '</span></li><li>嬴亏<span class="ui-li-count">' + showColor(pl) + '</span></li>' + orderDetailUrl + '</ul></div>';
                        accHisList.append(content);
                    });
                     var summaryContent = "{[{5rOo5pWw}]}:" + numTotal + "&nbsp;{[{5LiL5rOo}]}金额:" + formNumber(amtTotal,2) + "&nbsp;{[{5L2j6YeR}]}:" + formNumber(comTotal,2) + "&nbsp;嬴亏:" + showColor(Math.round(plTotal * 1000 )/ 1000);
                     summaryMsg.html(summaryContent).show();                    
		            //$('div[data-role=collapsible]').collapsible({theme: 'a'}).collapsible("refresh");
                } else { //没有数据的情况
                	summaryMsg.hide();
                    accHisList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
                }
            } else { //系统异常
               accHisList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常</h5>');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				accHisList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络中断,请检测网络</h5>');
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}        
        },
        complete: function() {
		    $("div[data-role='navbar']").removeClass("ui-disabled");  
		    accHisList.html(replaceAllHtml(accHisList.html()));
		    accHisList.find('div[data-role=collapsible]').collapsible({theme: 'f'});
		    accHisList.find('ul[data-role=listview]').listview({theme: 'a'}); 
		    $("#summaryMsg").html(replaceAllHtml($("#summaryMsg").html()));
		    hideLoader();  
        }
    });
}
</script>
</head>
<body>
<!-- 账户历史按天汇总 -->
<div data-role="page" id="accountHistoryPage">
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
	 		<h1>账户历史</h1>
		 </div>
		</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<div data-role="tabs">
		<div data-role="navbar"> 
			 <ul>
				<li><a href="#accHisList" class='ui-btn-active' id="nav_closed" data-type="1"  data-ajax="false">已结算</a></li>
				<li><a href="#accHisList" id="nav_open" data-type="2" data-ajax="false">未结算</a></li>
				<li><a href="#accHisList" id="nav_open3" data-type="3" data-ajax="false">已划单</a></li>
			</ul>
		</div>
		<h5 class="ui-bar ui-bar-b ui-corner-all content-info" id="summaryMsg" style="font-size: 12px">
		{[{5rOo5pWw}]}:0&nbsp;{[{5LiL5rOo}]}金额:0&nbsp;{[{5L2j6YeR}]}:0&nbsp;嬴亏:0
  		</h5>
		<div id="accHisList">
		<%--
		   	<div data-role="collapsible" data-collapsed="true" data-theme="a" data-content-theme="a" data-iconpos="right">
				<h3>2014-07-22 Tue</h3>
				<ul data-role="listview" data-count-theme="b">
					<li>{[{5rOo5pWw}]}<span class="ui-li-count">10</span></li>
					<li>{[{5LiL5rOo}]}金额<span class="ui-li-count">0.00</span></li>
					<li>{[{5L2j6YeR}]}<span class="ui-li-count">0.00</span></li>
					<li><a>嬴亏<span class="ui-li-count">0.00</span></a></li>
					<li><a onclick="getAccHisDay('2014-08-05');return false;">{[{5rOo}]}单明细</a></li>
				</ul>
			</div>	
			--%>
		</div>
	</div>
  </div>
</div>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>