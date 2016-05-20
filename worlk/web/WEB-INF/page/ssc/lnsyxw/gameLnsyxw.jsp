<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/trip.min.css">
<script src="${staticFileUrl}/js/jquery.cookie.js"></script>
<script src="${staticFileUrl}/js/trip.min.js"></script>
</head>
<c:set var="page_title" value="${msg['title.ssc.LNSYXW']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_cqss">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw_lm == 1}">
				<li ><a href="${ctx}/lnsyxw/topage?pageName=liangmian&gameId=LNSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw_1_5 == 1}">
				<li class="ui-mt-10"><a href="${ctx}/lnsyxw/topage?pageName=dm&gameId=LNSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw_renxuan == 1}">
				<li class="ui-mt-10"><a href="${ctx}/lnsyxw/topage?pageName=rx&gameId=LNSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw_zuxuan == 1}">
				<li><a href="${ctx}/lnsyxw/topage?pageName=zux&gameId=LNSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw_zhixuan == 1}">
				<li><a href="${ctx}/lnsyxw/topage?pageName=zx&gameId=LNSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
				</c:if>
			</div>
		</div>
	</section>
<script type="text/javascript">
$(document).ready(function() {
	checkIntro();
});

//是否显示操作引导信息
function checkIntro() {
   if ($.cookie('firstVistPlay') == undefined) {
        var trip = new Trip([{
            sel: $('#enterPlay'),
            content: '选择玩法',
            position: "e",
            delay: 2000,
            animation: 'fadeInLeft'
        }], {
            "tripTheme": "white"
        });
        
        trip.start();
        
        $.cookie('firstVistPlay', false, {
            expires: 365
        });
    }
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>	
</body>
