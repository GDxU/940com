<tr class="On-Number">
				      <th class="wNumber"><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
function toRate(){
	$.mobile.changePage("#rateInfoPage", "slideup");
	if($("#bon").val().indexOf('SERIAL')>=0&&$("#bon").val()!='SERIAL_2_LZ'){
	    changeBetOn($("#bon").val(),1);
	}
	if ($("#bon").val().indexOf('YIZI') >= 0
		|| $("#bon").val().indexOf('ERZI') >= 0
		|| $("#bon").val().indexOf('SANZI') >= 0
		|| $("#bon").val().indexOf('ZUXUANSAN') >= 0
		|| $("#bon").val().indexOf('ZUXUANLIU') >= 0
		|| $("#bon").val().indexOf('KUADU') >= 0) {
		if($("#bon").val().indexOf('SANZIDW') >= 0){
			bkflag = 1;
		}
		changeBetOn($("#bon").val(), 1);
	}
}
</script>
<div data-role="header" data-position="fixed" data-tap-toggle="false">
	<c:if test="${page_type == 1}"><%-- //0 主目录 1 子菜单 2 下注页面 --%>
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
	</c:if> 
	<c:if test="${page_type == 2}"><%-- //0 主目录 1 子菜单 2 下注页面 --%>
		<a href="#quick-links" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
	</c:if>	
	<div class="header-bg">
		<div class="logo inline-block">
		    <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
		</div>
	</div>
	<c:if test="${page_type != 3}">
		<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
    </c:if>		
	<div data-role="header">
		<c:if test="${page_type != 2&&page_type != 1&&page_type != 3}">
			<a href="#" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		</c:if>
		<c:if test="${page_type == 3}">
			<a href="#" data-icon="arrow-l" onclick="toRate()" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		</c:if>
		<c:if test="${page_type == 1}">
			<a href="${ctx}/ssc/menu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		</c:if>
		<c:if test="${page_type == 2}">
			<c:if test="${obj.gameId == 'KLC'}">
				<a href="${ctx}/ssc/gdsfmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'SSC'}">
				<a href="${ctx}/ssc/cqssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'BJC'}">
				<a href="${ctx}/ssc/bjsc/liangmian" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'XYNC'}">
				<a href="${ctx}/ssc/xync" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'JSKS'}">
				<a href="${ctx}/ssc/jssb/dxsb" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'JXSSC'}">
				<a href="${ctx}/ssc/jxssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'XJSSC'}">
				<a href="${ctx}/ssc/xjssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'GDSYXW'}">
				<a href="${ctx}/ssc/gdsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'GXKLC'}">
				<a href="${ctx}/ssc/gxsfmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'TJKLC'}">
				<a href="${ctx}/ssc/tjsfmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'TJSSC'}">
				<a href="${ctx}/ssc/tjssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'SHSYXW'}">
				<a href="${ctx}/ssc/shsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'SDSYXW'}">
				<a href="${ctx}/ssc/sdsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'JXSYXW'}">
				<a href="${ctx}/ssc/jxsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'LNSYXW'}">
				<a href="${ctx}/ssc/lnsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'HBSYXW'}">
				<a href="${ctx}/ssc/hbsyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'JSSYXW'}">
				<a href="${ctx}/ssc/jssyxwmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'YNSSC'}">
				<a href="${ctx}/ssc/ynssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'SHSSC'}">
				<a href="${ctx}/ssc/shssmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'HNKLC'}">
				<a href="${ctx}/ssc/hnsfmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
			<c:if test="${obj.gameId == 'BJKLC'}">
				<a href="${ctx}/ssc/bjsfmenu" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			</c:if>
		</c:if>
		<h1>${page_title}</h1>
		<c:if test="${page_type == 2}">
			<a href="#" id="orderBtn" style="overflow:visible; line-height:1.4em;" class="ui-link ui-btn-right ui-shadow ui-corner-all" data-ajax="false" >{[{5rOo}]}单<font color="white"><span id="orderCount"></span></font></a>
		</c:if>
	</div>
</div>
