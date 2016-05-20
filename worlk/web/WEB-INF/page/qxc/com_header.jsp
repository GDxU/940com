<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${staticFileUrl}/js/qxc/panel.js?v=${rsvn}"></script>
<div data-role="header" data-position="fixed" data-tap-toggle="false" id="headDiv">
	<c:if test="${page_type == 1}"><%-- //0 主目录 1 子菜单 2 下注页面 --%>
		<a href="#quick-links" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
	</c:if> 
	<div class="header-bg">
		<div class="logo inline-block">
		    <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
		</div>
	</div>
	<c:if test="${page_type == 1}">
	<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" id="showUserInfo" data-iconpos="right">个人中心</a>
	</c:if>
	<div data-role="header">
		<c:if test="${page_type == 1}">
			<a href="${ctx}/qxc/qxcmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		</c:if>
		<c:if test="${page_type == 1}">
			<h1>${page_title}</h1>
		</c:if>
		<c:if test="${page_type != 1}">
			<h1 class="ui-title-noindent ui-title" id="h_title">${page_title}</h1>
		</c:if>
		<c:if test="${page_type == 1}">
			<a href="#" id="orderBtn" style="overflow:visible; line-height:1.4em;" class="ui-link ui-btn-right ui-shadow ui-corner-all" data-ajax="false" >{[{5rOo5Y2V}]}<font color="white"><span id="orderCount"></span></font></a>
		</c:if>
	</div>
</div>
