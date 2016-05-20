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
<c:set var="page_title" value="${msg['title.ssc.GXKLC']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_gdsf">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<li><a href="${ctx}/gxsf/topage?pageName=liangmianGxsf&gameId=GXKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<li class="ui-mt-10"><a href="${ctx}/gxsf/topage?pageName=gxsf_1_5&gameId=GXKLC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_1_5 == 1}">
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_1 == 1}">
				<li class="ui-mt-10"><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_1" title="${msg['label.ssc.play.BALL_1']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_1']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_2 == 1}">
				<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_2" title="${msg['label.ssc.play.BALL_2']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_2']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_3 == 1}">
				<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_3" title="${msg['label.ssc.play.BALL_3']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_3']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_4 == 1}">
				<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_4" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_4']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_5 == 1}">
				<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_5" title="${msg['label.ssc.play.BALL_5']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_5']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_lh == 1}">
				<li class="ui-mt-10"><a href="${ctx}/gxsf/topage?pageName=lh&gameId=GXKLC&betOn=LONGHU" title="${msg['label.ssc.play.longhu']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.longhu']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc_zm == 1}">
				<li class="ui-mt-10"><a href="${ctx}/gxsf/topage?pageName=zm&gameId=GXKLC&betOn=ZHENGMA" title="${msg['label.ssc.play.ZHENGMA']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.ZHENGMA']}</a></li>
				</c:if>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>