<!--------------------------------HKC{[{6LSm}]}户历史---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<script type="text/javascript">
$(function() {
	$("#summaryMsg").hide();
    getAccoutHistory(); 
});
//按天汇总
function getAccoutHistory() {
    showLoader();
    var accHisList = $("#accHisList");
    var summaryMsg = $("#summaryMsg");
    $.ajax({
        url: '${ctx}/hkc/getAccoutHistory',
        data: {"t" : new Date().getTime()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
            	accHisList.empty();
                var arr = jsonResult.list;
                //遍历数据
                if (arr != undefined && arr.length > 0) {
                	//var numTotal = 0, amtTotal = 0, comTotal = 0, plTotal = 0;
                    $.each(arr,
                    function(key, value) {
                    	var url = "${ctx}/hkc/historyDetail?issue=" + value.issue;
                    	var orderDetailUrl = '<li><a href="' + url + '" data-ajax="false">{[{5rOo}]}{[{5Y2V}]}明细</a></li>';
                    	var num = value.bc, amt = value.ba, com = value.com, pl = value.win;
                    	//numTotal += num;
                    	//amtTotal += amt;
                    	//comTotal += com;
                    	//plTotal += pl;
                    	pl = pl == undefined ? 0 :pl;
                        var content = '<div data-role="collapsible" data-collapsed="true" data-theme="a" data-content-theme="a" data-iconpos="right"><h3>' + value.issue + '{[{5pyf}]}&nbsp;' + value.date +'</h3><ul data-role="listview"><li>{[{5rOo}]}{[{5Y2V}]}数<span class="ui-li-count">' + num + '</span></li><li>投{[{5rOo}]}{[{6YeR}]}额<span class="ui-li-count">' + formNumber(amt,2) + '</span></li><li>{[{5L2j}]}{[{6YeR}]}<span class="ui-li-count">' + formNumber(com,2) + '</span></li><li>结果<span class="ui-li-count">' + showColor(pl) + '</span></li>' + orderDetailUrl + '</ul></div>';
                        content = replaceAllHtml(content);
                        accHisList.append(content);
                    });
                     var summaryContent = "{[{5rOo}]}数:" + jsonResult.data.tbc + "&nbsp;下{[{5rOo}]}{[{6YeR}]}额:" + formNumber(jsonResult.data.tba,2) + "&nbsp;{[{5L2j}]}{[{6YeR}]}:" + formNumber(jsonResult.data.tc,2) + "&nbsp;嬴亏:" + showColor(Math.round(jsonResult.data.tr * 1000 )/ 1000);
                     summaryContent = replaceAllHtml(summaryContent);
                     summaryMsg.html(summaryContent).show();                    
		            //$('div[data-role=collapsible]').collapsible({theme: 'a'}).collapsible("refresh");
		            accHisList.find('div[data-role=collapsible]').collapsible({theme: 'a'});
		            //$('ul[data-role=listview]').listview({theme: 'a'}).listview("refresh");
		           accHisList.find('ul[data-role=listview]').listview({theme: 'a'});  
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
				accHisList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络{[{5Lit}]}断,请检测网络</h5>');
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}        
        },
        complete: function() {
		    hideLoader();     
        }
    });
}
</script>
</head>
<body>
<!-- {[{6LSm}]}户历史按天汇总 -->
<div data-role="page" id="accountHistoryPage">
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
	 		<h1>{[{6LSm}]}户历史</h1>
		 </div>
		</div>
  <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
		<h5 class="ui-bar ui-bar-b ui-corner-all content-info" id="summaryMsg" style="font-size: 12px">
		{[{5rOo}]}数:0&nbsp;下{[{5rOo}]}{[{6YeR}]}额:0&nbsp;{[{5L2j}]}{[{6YeR}]}:0&nbsp;嬴亏:0
  		</h5>
		<div id="accHisList">
		<!--
		   	<div data-role="collapsible" data-collapsed="true" data-theme="a" data-content-theme="a" data-iconpos="right">
				<h3>2014-07-22 Tue</h3>
				<ul data-role="listview" data-count-theme="b">
					<li>{[{5rOo}]}数<span class="ui-li-count">10</span></li>
					<li>下{[{5rOo}]}{[{6YeR}]}额<span class="ui-li-count">0.00</span></li>
					<li>{[{5L2j}]}{[{6YeR}]}<span class="ui-li-count">0.00</span></li>
					<li><a>嬴亏<span class="ui-li-count">0.00</span></a></li>
					<li><a onclick="getAccHisDay('2014-08-05');return false;">{[{5rOo}]}{[{5Y2V}]}明细</a></li>
				</ul>
			</div>	
			-->
		</div>
  </div>
</div>
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>