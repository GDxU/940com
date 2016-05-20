<!--------------------------------账户历史按期明细---------------------------->
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
	$("#summaryMsg").hide();
	getAccHisDay();
	//屏幕切换事件
	$(window).on("orientationchange", function(event) {
		//window.location.href= "${ctx}/ssc/accHisDayPeriod?gid=" + $("#gid").val() +"&rtype=" + $("#rtype").val() +"&bt=" + $("#btdate").val() + "&t=" + new Date().getTime();
	});		
});
//单天按类型汇总
function getAccHisDay(){
    showLoader();
    var accHisDayPeriodTable = $("#accHisDayPeriodTable");
    var tbody =  $("#accHisDayPeriodTable > tbody");
    var summaryMsg = $("#summaryMsg");
    $.ajax({
        url: '${ctx}/ssc/getAccHisDayPeriod',
        data: {
        	"t" : new Date().getTime(),
        	"rtype": $("#rtype").val(),
        	"bt": $("#btdate").val(),
        	"gid": $("#gid").val()
        },
        dataType: 'json',
        success: function(jsonResult) {
        	tbody.empty();
            var result = jsonResult.r;
            if (result == 0) {
                var arr = jsonResult.list;
                //遍历数据
                if (arr != undefined && arr.length > 0) { 
                	var numTotal = 0, amtTotal = 0, comTotal = 0, plTotal = 0;
                    $.each(arr,
                    function(key, value) {
                    	var num = value.num, amt = value.amt, com = value.com, pl = value.pl;
                    	numTotal += num;
                    	amtTotal += amt;
                    	comTotal += com;
                    	plTotal += pl;
                    	var url =  "<a data-ajax='false' href='${ctx}/ssc/accHisDayDetail?gid=" + $("#gid").val() + "&rtype=" + $("#rtype").val() + "&bt=" + $("#btdate").val() + "&issue=" + value.issue +"'>" + value.issue + "</a>"                   	
                        var content = '<tr><th>' + url + '</th><td>' + num + '</td><td>' + formNumber(amt,2) + '</td><td>' + formNumber(value.com,2) + '</td><td>' + showColor(pl) + '</td></tr>';
                        tbody.append(content);
                    });
                    var summaryContent = "总${msg['label.ssc.zhushu']}:" + numTotal + "&nbsp;总${msg['label.ssc.betamt']}:" + formNumber(Math.round(amtTotal * 1000 )/ 1000,2) + "&nbsp;&nbsp;总${msg['label.ssc.yongjin']}:" + formNumber(Math.round(comTotal * 1000 )/ 1000,2) + "&nbsp;&nbsp;总嬴亏:" + showColor(Math.round(plTotal * 1000 )/ 1000);
                    summaryMsg.html(summaryContent).css("text-align","left").show();
                    accHisDayPeriodTable.show();
                } else { //没有数据的情况
                	summaryMsg.html('暂无符合条件的记录').css("text-align","center").show();
                	accHisDayPeriodTable.hide();
                }
            } else { //系统异常
            	summaryMsg.html('系统异常').css("text-align","center").show();
            	accHisDayPeriodTable.hide();
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				summaryMsg.html('网络中断,请检测网络').css("text-align","center").show();
				accHisDayPeriodTable.hide();
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}          	
        },
        complete: function() {
        	accHisDayPeriodTable.table("rebuild");
        	accHisDayPeriodTable.html(replaceAllHtml(accHisDayPeriodTable.html()));
        	summaryMsg.html(replaceAllHtml(summaryMsg.html()));        	
            hideLoader();
        }
    });
}
</script>
</head>
<body>
<input type="hidden" id="rtype" name="rtype" value="${obj.rtype}"/>
<input type="hidden" id="btdate" name="btdate" value="${obj.bt}"/>
<input type="hidden" id="gid" name="gid" value="${obj.gid}"/>
<div data-role="page" id="accHisDayPeriodPage" data-title="账户历史">
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
	 		<a href="javascript:getAccHisDay()" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>		
		</div>
    <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
  	<h5 class="ui-bar ui-bar-b ui-corner-all content-info" id="summaryMsg" style="font-size: 12px">
  		总${msg['label.ssc.zhushu']}:加载中...&nbsp;&nbsp;总${msg['label.ssc.yongjin']}:加载中...&nbsp;&nbsp;嬴亏:加载中...
  	</h5>
	<table data-role="table" id="accHisDayPeriodTable" data-mode="reflow" class="ssc-list ssc-table-breakpoint" style="font-size: 14px">
		<thead>
			<tr>
				<th>${msg['label.ssc.issue']}</th>
				<th>${msg['label.ssc.zhushu']}</th>
				<th>${msg['label.ssc.betamt']}</th>
				<th>${msg['label.ssc.yongjin']}</th>
				<th>嬴亏</th>
			</tr>
		</thead>
		<tbody>
		<!-- 
			<tr>
				<td>20140721048</td>
				<td>1</td>
				<td>2</td>
				<td>2</td>
				<td>-2</td>
			</tr>
		 -->
		</tbody>
	</table>
  </div>
</div> 
</body>
<script type= "text/javascript">
     $("#title").html(utf8to16(base64decode($("#title").html()))); 
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);     
</script>
</html>