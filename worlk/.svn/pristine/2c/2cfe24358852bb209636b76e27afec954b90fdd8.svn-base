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
<link rel="stylesheet" href="${ctx}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
<link rel="stylesheet" href="${ctx}/css/common.css">
<link rel="shortcut icon" href="${ctx}/images/vinbet.ico"></link>
</head>
<body>
<div data-role="page" id="main">
	<div data-role="header" data-theme="b" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/sys/main" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		<h2>在线用户</h2>
		<a href="${ctx}/sys/logout" data-ajax="false" data-icon="power" class="ui-btn-right">退出</a>
	</div>
	<div data-role="content">
		<table data-role="table" id="onLineUserTable" data-mode="reflow" class="movie-list ui-responsive" style="font-size:12px;">
			<thead>
				<tr>
					<th>用户名</th>
					<th data-priority="1">用户类型</th>
					<th data-priority="2">登陆时间</th>
					<th data-priority="3">登陆IP</th>
					<th><a href="#" onclick="getOnlineUser()">刷新</a></th>
				</tr>
			</thead>
			<tbody id="body_table">
			</tbody>
		</table>
	</div> 
</div>
<script src="${ctx}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/common.js?v=${rsvn}"></script>
<script type="text/javascript">
$(function(){
	getOnlineUser();
});

function getOnlineUser() {
	showLoader("加载中...");
    var detailTable = $("#onLineUserTable");
    $.ajax({
        url: '${ctx}/sys/seachOnlineUser',
        data: {"t" : new Date().getTime()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
                var arr = jsonResult.list;
                //遍历数据
                $("#body_table").html("");
                if (arr != undefined && arr.length > 0) { 
                    $.each(arr,
                    function(key, value) {
                    	var tem = '"' + value.userName + '"';
                    	var str = "<a href='#' data-ajax='false' onclick='killout("+ tem +")'>踢出</a>";
                    	var datatr ="<tr'><td>"+value.userName+"</td><td>" + (1 == value.type ? "现金" : "信用") + "</td><td>" + value.time + "</td><td>"+value.ip+"</td><td>"+str+"</td></tr>";
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

function killout(username){
	if (confirm("确认要踢出用户？")) {
		$.ajax({
	        url: '${ctx}/sys/killout',
	        data: {"t" : new Date().getTime(),"username" : username},
	        dataType: 'json',
	        success: function(jsonResult) {
	            var result = jsonResult.r;
	            if (result == 0) {
	            	alert('踢出用户成功！');
	            	setTimeout(getOnlineUser(),500);
	            }else{
	            	alert('操作失败！');
	            }
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	        	window.location.href = "${ctx}/admin";
	        },
	        complete: function() {
	        }
	    });
    }
}
</script>
</body>
</html>
