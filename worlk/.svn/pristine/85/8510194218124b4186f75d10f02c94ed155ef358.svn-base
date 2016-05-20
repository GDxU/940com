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
<c:set var="page_title" value="${msg['title.ssc.SHSSC']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_cqss">
		<c:set var="page_type" value="1" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset ui-listview-padding">
				<c:if test = "${empty obj.cf || obj.cf.shssc_1_5 == 1}">
				<li><a href="${ctx}/shss/topage?pageName=shss_1_5&gameId=SHSSC&betOn=BALL_1_5" title="1 ~ 3" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 3</span></a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_yizhi == 1}">
				<li class="ui-mt-10"><a href="${ctx}/shss/topage?pageName=yz&gameId=SHSSC&betOn=YIZI_QS" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_erzi == 1}">
				<li><a href="${ctx}/shss/topage?pageName=ez&gameId=SHSSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_sanzi == 1}">
				<li><a href="${ctx}/shss/topage?pageName=sz&gameId=SHSSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_erzidw == 1}">
				<li class="ui-mt-10"><a href="${ctx}/shss/topage?pageName=edw&gameId=SHSSC&betOn=ERZIDW_BS&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_sanzidw == 1}">
				<li><a href="${ctx}/shss/topage?pageName=sdw&gameId=SHSSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_zuxuansan == 1}">
				<li class="ui-mt-10"><a href="${ctx}/shss/topage?pageName=zxs&gameId=SHSSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_zuxuanliu == 1}">
				<li><a href="${ctx}/shss/topage?pageName=zxl&gameId=SHSSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_kuadu == 1}">
				<li class="ui-mt-10"><a href="${ctx}/shss/topage?pageName=kd&gameId=SHSSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc_hs == 1}">
				<li class="ui-mt-10"><a href="${ctx}/shss/topage?pageName=hs&gameId=SHSSC&betOn=HS_SM&nav=1" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
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