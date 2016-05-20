<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<div data-role="header" data-position="fixed" data-tap-toggle="false">
    <a href="#quick-links" data-ajax="false" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"> </a>
    <div class="header-bg">
        <div class="logo inline-block">
            <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
        </div>
    </div>
    <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
     <div data-role="header" data-theme="c" data-mini="true">
     	<a href="${ctx}/ssc/menu" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
 		<h1>${msg['title.ssc.BJC']}</h1>
 		<a id="orderBtn" style="overflow:visible; line-height:1.4em;" class="ui-link ui-btn-right ui-btn ui-icon-check-b ui-btn-icon-right-b ui-shadow ui-corner-all" data-ajax="false" >{[{5rOo}]}单<font color="white"><span id="orderCount" class="spnicon"></span></font></a>
	 </div>      
</div>
<form id="tempForm" data-ajax="false" action="${ctx}/ssc/bjsc/order" method="post">
    <input type="hidden" name="bon" value="${obj.bon}">
    <input type="hidden" id="gameId" name="gameId" value="BJC">
    <input type="hidden" name="issue" value="0">
    <input type="hidden" name="hc" value="${sessionScope.SSC_USER_SESSION.cht}">
    <div id="items"></div>
</form>
<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
<c:set var='t_gameId' value='BJC'></c:set>
<%@ include file="/WEB-INF/page/ssc/panel_left_ssc.jsp" %>