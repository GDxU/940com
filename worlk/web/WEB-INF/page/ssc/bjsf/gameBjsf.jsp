<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
</head>
<c:set var="page_title" value="${msg['title.ssc.BJKLC']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_gdsf">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<li><a href="${ctx}/bjsf/topage?pageName=liangmianBjsf&gameId=BJKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty obj.cf || obj.cf.bjklc_zm == 1}">
				<li class="ui-mt-10"><a href="${ctx}/bjsf/topage?pageName=ballBjsf&gameId=BJKLC&betOn=ZHENGMA" title="${msg['label.ssc.play.ZHENGMA']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.ZHENGMA']}</a></li>
				</c:if>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>