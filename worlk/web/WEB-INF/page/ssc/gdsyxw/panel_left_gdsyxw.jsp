<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg['title.ssc.GDSYXW']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
			<li><a href="${ctx}/gdsyxw/topage?pageName=liangmian&gameId=GDSYXW&betOn=ZHHE" data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANGMIAN']}</a></li>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gdsyxw_1_5 == 1}">
			<li><a href="${ctx}/gdsyxw/topage?pageName=dm&gameId=GDSYXW&betOn=BALL_1_5" data-ajax="false" style="background-color:transparent"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gdsyxw_renxuan == 1}">
			<li><a href="${ctx}/gdsyxw/topage?pageName=rx&gameId=GDSYXW&betOn=SERIAL_1_1&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.RX']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gdsyxw_zuxuan == 1}">
			<li><a href="${ctx}/gdsyxw/topage?pageName=zux&gameId=GDSYXW&betOn=SERIAL_ZX_2&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.ZUX']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gdsyxw_zhixuan == 1}">
			<li><a href="${ctx}/gdsyxw/topage?pageName=zx&gameId=GDSYXW&betOn=SERIAL_ZHI_2&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.ZX']}</a></li>
			</c:if>
		</div>
    </div>
</div>
