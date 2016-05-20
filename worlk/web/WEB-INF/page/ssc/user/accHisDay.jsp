<%-- ------------------------------账户历史按天按彩种明细-------------------------- --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<script type="text/javascript">
$(function() {
	getAccHisDay();
});
//单天按类型汇总
function getAccHisDay(){
    showLoader();
    var accHisDayList = $("#accHisDayList");
    var rtype = $("#rtype").val();
    $.ajax({
        url: '${ctx}/ssc/getAccHisDay',
        data: {
        	"t" : new Date().getTime(),
        	"rtype" : rtype,
        	"bt" : $("#btdate").val()
        },
        dataType: 'json',
        success: function(jsonResult) {
            accHisDayList.empty();
            var result = jsonResult.r;
            if (result == 0) {
                var arr = jsonResult.list;
                //遍历数据
                if (arr != undefined && arr.length > 0) { 
                    $.each(arr,
                    function(key, value) {
                    	var accHisDayDetailURL = "${ctx}/ssc/accHisDayDetail?gid=" + value.gid + "&rtype=" + rtype + "&bt=" + value.date; 
                    	var accHisDayPeriodURL = "${ctx}/ssc/accHisDayPeriod?gid=" + value.gid + "&rtype=" + rtype + "&bt=" + value.date; 
                        var content = '<div data-role="collapsible" data-collapsed="false" data-theme="b"><h2>' + utf8to16(base64decode(value.tn)) + '</h2><ul data-role="listview"><li>${msg["label.ssc.zhushu"]} <span class="ui-li-count">' + value.num + '</span></li><li>{[{5LiL}]}注金额<span class="ui-li-count">' + formNumber(value.amt,2) + '</span></li><li>${msg["label.ssc.yongjin"]}<span class="ui-li-count">' + formNumber(value.com,2) + '</span></li><li>嬴亏<span class="ui-li-count">' + showColor(value.pl) + '</span></li><li><a href="' + accHisDayDetailURL + '"  data-ajax="false">当天明细 </a></li><li><a href="' + accHisDayPeriodURL + '"  data-ajax="false">按期数查看</a></li></ul></div>';
                        accHisDayList.append(replaceAllHtml(content));
                    });
		        	accHisDayList.find('div[data-role=collapsible]').collapsible({theme: 'f'});
		            accHisDayList.find('ul[data-role=listview]').listview({theme: 'a'});	                    
                } else { //没有数据的情况
                    accHisDayList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
                }
            } else { //系统异常
                accHisDayList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常</h5>');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				accHisDayList.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络中断,请检测网络</h5>');
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
<input type="hidden" id="rtype" name="rtype" value="${obj.rtype}"/>
<input type="hidden" id="btdate" name="btdate" value="${obj.date}"/>
<div data-role="page" id="accHisDayPage" data-title="账户历史">
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
	 		<h1>${obj.date}</h1>
	 		<a href="javascript:getAccHisDay();" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
		</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content" id="accHisDayList">
    <%-- 
	   <div data-role="collapsible" data-collapsed="false" data-theme="b">
	    <h2>广东快乐十分</h2>
	        <ul data-role="listview">
			    <li>注数 <span class="ui-li-count">1</span></li>
			    <li>{[{5LiL}]}注金额<span class="ui-li-count">2</span></li>
			    <li>佣金<span class="ui-li-count">0</span></li>
			    <li>嬴亏<span class="ui-li-count">1.96</span></li>
			    <li><a href="${ctx}/ssc/accHisDayDetail"  data-ajax="false">当天明细 </a></li>
			    <li><a href="${ctx}/ssc/accHisDayPeriod"  data-ajax="false">按期数查看</a></li>
	        </ul>
	   </div>
	--%>
  </div>
</div>  
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>