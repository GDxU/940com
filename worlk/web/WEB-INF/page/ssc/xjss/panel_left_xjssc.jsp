<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg["title.ssc.XJSSC"]}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
			<li><a href="${ctx}/xjss/topage?pageName=liangmianXjss&gameId=XJSSC&betOn=ZHHE" style="background-color:transparent" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_1_5 == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=jxss_1_5&gameId=XJSSC&betOn=BALL_1_5" style="background-color:transparent" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_yizhi == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=yz&gameId=XJSSC&betOn=YIZI_QW&nav=4" style="background-color:transparent" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_erzi == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=ez&gameId=XJSSC&betOn=ERZI_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_sanzi == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=sz&gameId=XJSSC&betOn=SANZI_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_erzidw == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=edw&gameId=XJSSC&betOn=ERZIDW_WQ&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_sanzidw == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=sdw&gameId=XJSSC&betOn=SANZIDW_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_zuxuansan == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=zxs&gameId=XJSSC&betOn=ZUXUANSAN_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_zuxuanliu == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=zxl&gameId=XJSSC&betOn=ZUXUANLIU_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc_kuadu == 1}">
				<li><a href="${ctx}/xjss/topage?pageName=kd&gameId=XJSSC&betOn=KUADU_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.KD']}</a></li>
				</c:if>
		</div>
    </div>
</div>
