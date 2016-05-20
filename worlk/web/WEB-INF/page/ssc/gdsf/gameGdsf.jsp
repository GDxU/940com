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
<c:set var="page_title" value="${msg['title.ssc.KLC']}" scope="request"/>
<body>
	<%-- 广东快乐十分厅 --%>
	<section data-role="page" id="lobby_gdsf">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<li><a href="${ctx}/gdsf/topage?pageName=liangmianGdsf&gameId=KLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty obj.cf || obj.cf.klc_1 == 1}">
				<li class="ui-mt-10"><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_1" title="${msg['label.ssc.play.BALL_1']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_1']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_2 == 1}">
				<li  ><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_2" title="${msg['label.ssc.play.BALL_2']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_2']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_3 == 1}">
				<li ><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_3" title="${msg['label.ssc.play.BALL_3']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_3']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_4 == 1}">
				<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_4" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_4']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_5 == 1}">
				<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_5" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_5']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_6 == 1}">
				<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_6" title="${msg['label.ssc.play.BALL_6']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_6']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_7 == 1}">
				<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_7" title="${msg['label.ssc.play.BALL_7']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_7']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_8 == 1}">
				<li ><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_8" title="${msg['label.ssc.play.BALL_8']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_8']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc_lm == 1}">
				<li class="ui-mt-10"><a href="${ctx}/gdsf/topage?pageName=serialGdsf&gameId=KLC&betOn=SERIAL_2&nav=1" title="${msg['title.ssc.LIANMA']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANMA']}</a></li>
				</c:if>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>