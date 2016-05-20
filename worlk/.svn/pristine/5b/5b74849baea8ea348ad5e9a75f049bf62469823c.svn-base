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
<c:set var="page_title" value="${msg['title.ssc.SSC']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_cqss">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset">
				<li><a href="${ctx}/cqss/topage?pageName=liangmianCqss&gameId=SSC&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty obj.cf || obj.cf.ssc_1_5 == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=cqss_1_5&gameId=SSC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_yizhi == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=yz&gameId=SSC&betOn=YIZI_QW&nav=4" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_erzi == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=ez&gameId=SSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_sanzi == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=sz&gameId=SSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_erzidw == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=edw&gameId=SSC&betOn=ERZIDW_WQ&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_sanzidw == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=sdw&gameId=SSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_zuxuansan == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=zxs&gameId=SSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_zuxuanliu == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=zxl&gameId=SSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_kuadu == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=kd&gameId=SSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc_hs == 1}">
				<li class="ui-mt-10"><a href="${ctx}/cqss/topage?pageName=hs&gameId=SSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
				</c:if>
			</div>
		</div>
	</section>
</body>
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
</html>