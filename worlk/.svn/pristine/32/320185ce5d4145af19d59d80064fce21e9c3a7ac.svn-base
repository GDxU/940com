<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <link rel="stylesheet" href="${ctx}/css/hkc.css?v=${rsvn}">
    <script src="${ctx}/js/hkc/panel.js?v=${rsvn}"></script>
</head>
<body>
<div data-role="page" id="one">
    <div data-role="header">
    	<a href="${ctx}/sys/main" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
        <h1>应用维护</h1>
        <a href="${ctx}/sys/logout" data-ajax="false" data-icon="power" class="ui-btn-right">退出</a>
    </div>
    <div data-role="main" class="ui-content">
        <ul data-role="listview" class="reset" data-divider-theme="b">
            <c:forEach items="${obj}" varStatus="s" var="info">
            <li data-role="list-divider">${info[1]}（<span st>${info[2]?"正常":"维护"}</span>）</li>
            <li><a swbtn i="${s.index}" s="0">设为开启</a></li>
            <li><a swbtn i="${s.index}" s="1">设为维护</a></li>
            <li><a swbtn i="${s.index}" s="-1">恢复自动</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("a[swbtn]").on("click", function () {
        	if(confirm("确定执行该操作？")){
	            var i, s, st;
	            i = $(this).attr("i");
	            s = $(this).attr("s");
	            st = $($("span[st]").get(i));
	            $.getJSON("${ctx}/sys/maintain/set/" + i + "/" + s, function (o) {
	                if (o.c == 0) {
	                    st.text(s == 0 ? "正常" : "维护");
	                    alert("设置应用状态成功！");
	                } else {
	                    alert("设置应用状态失败！");
	                }
	            }).fail(function() {
					window.location.href = "${ctx}/admin";
				})        	
        	}
        });
    });
</script>
</html>