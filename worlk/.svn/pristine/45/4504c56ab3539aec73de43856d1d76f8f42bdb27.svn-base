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
<c:set var="page_title" value="${msg['title.ssc.TJSSC']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_cqss">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<li><a href="${ctx}/tjss/topage?pageName=liangmianTjss&gameId=TJSSC&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_1_5 == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=tjss_1_5&gameId=TJSSC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_yizhi == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=yz&gameId=TJSSC&betOn=YIZI_QW&nav=4" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_erzi == 1}">
				<li><a href="${ctx}/tjss/topage?pageName=ez&gameId=TJSSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_sanzi == 1}">
				<li><a href="${ctx}/tjss/topage?pageName=sz&gameId=TJSSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_erzidw == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=edw&gameId=TJSSC&betOn=ERZIDW_WQ&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_sanzidw == 1}">
				<li><a href="${ctx}/tjss/topage?pageName=sdw&gameId=TJSSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_zuxuansan == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=zxs&gameId=TJSSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_zuxuanliu == 1}">
				<li><a href="${ctx}/tjss/topage?pageName=zxl&gameId=TJSSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_kuadu == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=kd&gameId=TJSSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc_hs == 1}">
				<li class="ui-mt-10"><a href="${ctx}/tjss/topage?pageName=hs&gameId=TJSSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
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
