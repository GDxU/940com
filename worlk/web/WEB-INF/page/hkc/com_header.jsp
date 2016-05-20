<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
</script>
<div data-role="header" data-position="fixed" data-tap-toggle="false">
	<c:if test="${page_type == 1}"><!-- //0 主目录 1 子菜{[{5Y2V}]} 2 下{[{5rOo}]}页面 -->
		<a href="#quick-links" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
	</c:if> 
	<div class="header-bg">
		<div class="logo inline-block">
		    <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
		</div>
	</div>
	<c:if test="${page_type == 1}"></c:if>
	<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" id="showUserInfo" data-iconpos="right">个人{[{5Lit}]}心</a>
	
	<div data-role="header">
		<c:if test="${page_type == 1}">
			<a href="${ctx}/hkc/hkmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		</c:if>
		<c:if test="${page_type == 1}">
		<h1 >${page_title}</h1>
		</c:if>
		<c:if test="${page_type != 1}">
		<h1 class="ui-title-noindent">${page_title}</h1>
		</c:if>
		<c:if test="${page_type == 1}">
			<a href="#" id="orderBtn" style="overflow:visible; line-height:1.4em;" class="ui-link ui-btn-right ui-shadow ui-corner-all" data-ajax="false" >{[{5rOo}]}{[{5Y2V}]}<font color="white"><span id="orderCount"></span></font></a>
		</c:if>
	</div>
</div>
