<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri= "/WEB-INF/tld/const.tld" prefix="ct" %>
<ct:const className="com.vinbet.mobile.util.Constants" scope="request" var="rsvn"></ct:const>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<script src="${ctx}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/common.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${ctx}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
<link rel="stylesheet" href="${ctx}/css/common.css">
<link rel="shortcut icon" href="${ctx}/images/vinbet.ico"></link>
<link rel="stylesheet" href="${ctx}/css/datebox/jqm-datebox-1.4.4.min.css">
<script type="text/javascript" src="${ctx}/js/datebox/jqm-datebox-1.4.4.core.min.js"></script>
<script type="text/javascript" src="${ctx}/js/datebox/jqm-datebox-1.4.4.mode.calbox.min.js"></script>
<script type="text/javascript" src="${ctx}/js/datebox/jqm-datebox-1.4.4.mode.datebox.min.js"></script>
<script type="text/javascript" src="${ctx}/js/datebox/jqm-datebox-i18n.js"></script>
<script type="text/javascript" src="${ctx}/js/dateUtil.js"></script>
<script type="text/javascript" src="${ctx}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<style>
.ui-grid-a a{
    float: left;
}
.ui-grid-a>.ui-block-a{
    width: 45%;
}
.ui-grid-a>.ui-block-b{
    width: 45%;
}
.ui-grid-a>.ui-block-c{
    width: 10%;
}
.ui-block-c{
    margin: 4px 0px;
}
</style>
</head>
<body>
<div data-role="page" id="main">
	<div data-role="header" data-theme="b" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/sys/main" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		<h2>注册记录</h2>
	</div>
	<div data-role="content">
        <fieldset class="ui-grid-a">
        	<div class="ui-block-a"><input name="fromDate" id="fromDate" type="text" data-role="datebox" data-options='{"mode":"datebox","minDays":180,"maxDays":0}'/></div>
     		<div class="ui-block-b"><input name="toDate" id="toDate" type="text" data-role="datebox" data-options='{"mode":"datebox","minDays":180,"maxDays":0}'/></div>
     		<div class="ui-block-c">
			<!--<a href="javascript:setDefaultTime();" class="ui-btn ui-icon-recycle ui-btn-icon-notext ui-corner-all" data-inline="true" title="重置"></a> -->
     		 <a href="javascript:findRegisteredUsers();" class="ui-btn ui-icon-search ui-btn-icon-notext ui-corner-all" data-inline="true" title="查询"></a>
     		</div> 
  		</fieldset> 	
		<table data-role="table" id="registeredUserTable" data-mode="reflow" class="movie-list ui-responsive" style="font-size:12px;">
			<thead>
				<tr>
					<th>序号</th>
					<th>用户名</th>
					<th>姓名</th>
					<th>邮箱</th>
					<th>手机</th>
					<th>代理</th>
					<th>币种</th>
					<th>注册域名</th>
					<th>注册IP</th>
					<th>注册日期</th>
				</tr>
			</thead>
			<tbody id="body_table">
			</tbody>
		</table>
	</div> 
</div>
<script type="text/javascript">
jQuery.extend(jQuery.mobile.datebox.prototype.options, {
    'overrideDateFormat': '%Y/%m/%d',
    'overrideHeaderFormat': '%Y/%m/%d',
    'overrideDateFieldOrder': ['y', 'm', 'd'],    
    'useLang':'${null == sessionScope.nutz_mvc_localization_key ? 'zh' : sessionScope.nutz_mvc_localization_key}',
    'useFocus':true,
    'theme':'a',
    'themeHeader':'b',
    'useNewStyle':true,
    'beforeToday':true,
    'overrideCalHeaderFormat': '%Y %B',
    'calUsePickers':true
});

$(function(){
	setDefaultTime();
	findRegisteredUsers();
});

function setDefaultTime(){
	var d = getToday();
	bt = d[0].Format("yyyy/MM/dd");
	et = d[1].Format("yyyy/MM/dd");
	$("#fromDate").val(bt);
	$("#toDate").val(et);
}

function findRegisteredUsers() {
	showLoader("加载中...");
    var detailTable = $("#registeredUserTable");
    $.ajax({
        url: '${ctx}/sys/findRegisteredUsers',
        data: {"t" : new Date().getTime(), "fromDate":$("#fromDate").val(), "toDate":$("#toDate").val()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
                var arr = jsonResult.list;
                //遍历数据
                $("#body_table").html("");
                if (arr != undefined && arr.length > 0) { 
                    $.each(arr, function(key, value) {
                    	var datatr ="<tr><td>" + (key + 1) + "</td><td>" + value.userName + "</td><td>" + value.trueName + "</td><td>" + value.email + "</td><td>" + value.mobile + "</td><td>" + value.agentName + "</td><td>" + value.currenytype + "</td><td>" + value.domainAddr + "</td><td>" + value.registeredIp + "</td><td>" + value.joinDate + "</td></tr>";
						$("#body_table").append(datatr);
                    });
                    detailTable.table("rebuild");
                }
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
        	window.location.href = "${ctx}/admin";
        },
        complete: function() {
        	hideLoader();
        }
    });
}
</script>
</body>
</html>
