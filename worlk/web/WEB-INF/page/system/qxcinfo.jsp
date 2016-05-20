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
</head>
<body>
<div data-role="page" id="main">
	<div data-role="header" data-theme="b">
		<a href="${ctx}/sys/main" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		<h2>七{[{5pif}]}彩信息</h2>
		<a href="javascript:findQxcinfo();" data-ajax="false" data-icon="refresh" class="ui-btn-right">查询</a>
	</div>
	<div data-role="content" style="font-size:14px;">
        <fieldset class="ui-grid-c">
     		<div class="ui-block-a">
     			<select id="yy">
					<option value="">--年--</option>
					<option value="2014">2014年</option>
					<option value="2015">2015年</option>
					<option value="2016">2016年</option>
					<option value="2017">2017年</option>
					<option value="2018">2018年</option>
					<option value="2019">2019年</option>
					<option value="2020">2020年</option>
				</select>
     		</div>
     		<div class="ui-block-b">
     			<select id="mm">
					<option value="">--月--</option>
					<option value="1">1月</option>
					<option value="2">2月</option>
					<option value="3">3月</option>
					<option value="4">4月</option>
					<option value="5">5月</option>
					<option value="6">6月</option>
					<option value="7">7月</option>
					<option value="8">8月</option>
					<option value="9">9月</option>
					<option value="10">10月</option>
					<option value="11">11月</option>
					<option value="12">12月</option>
				</select>
     		</div>  
        	<div class="ui-block-c">
				<select id="dd">
					<option value="">--日--</option>
					<% for(int i=1;i<32;i++){%>
						<option value="<%= i%>"><%= i%>日</option>
					<% }%>
				</select>
        	</div>
     		<div class="ui-block-d">
     			<select id="sum">
					<option value="true">合计</option>
					<option value="false">详细</option>
				</select>
     		</div>     		
  		</fieldset>
  		<span id="total"></span>
		<div id="tableinfo">
			<table data-role="table" id="infoTable" data-mode="reflow" class="movie-list ui-responsive">
				<thead>
					<tr>
						<th>期数</th>
						<th>姓名</th>
						<th>金额</th>
						<th>时间</th>
						<th>日期</th>
					</tr>
				</thead>
				<tbody id="body_table">
				</tbody>
			</table>
		</div>
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
	var d = getToday();
	$("#yy").val(d[0].Format("yyyy"));
	$("#mm").val(Number(d[0].Format("MM")));
	$("#dd").val(Number(d[0].Format("dd")));
	$("#yy").selectmenu('refresh', true); 
	$("#mm").selectmenu('refresh', true);
	$("#dd").selectmenu('refresh', true);
});

function findQxcinfo() {
	showLoader("加载中...");
    var detailTable = $("#infoTable");
    $.ajax({
        url: '${ctx}/sys/findQxcinfo',
        data: {"t" : new Date().getTime(), "gid":$("#gid").val(), "yy":$("#yy").val(), "mm":$("#mm").val(), "dd":$("#dd").val(), "sum":$("#sum").val()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
            	if("true" == $("#sum").val()){
            		$("#tableinfo").hide();
            		$("#total").html("合计注单：" + jsonResult.data.num + "；  合计金额：" + jsonResult.data.sum);
            	}else{
            		$("#tableinfo").show();
            		$("#total").html("");
	                var arr = jsonResult.list;
	                //遍历数据
	                $("#body_table").html("");
	                if (arr != undefined && arr.length > 0) { 
	                    $.each(arr, function(key, value) {
	                    	var datatr ="<tr><td>" + value.issue + "</td><td>" + value.uname + "</td><td>" + value.amount + "</td><td>" + value.time + "</td><td>" + value.year+"/"+value.month+"/"+value.day + "</td></tr>";
							$("#body_table").append(datatr);
	                    });
	                    detailTable.table("rebuild");
	                }
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
