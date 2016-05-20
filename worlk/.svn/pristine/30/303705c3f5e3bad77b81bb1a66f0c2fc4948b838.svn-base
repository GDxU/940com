<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg['title.ssc.JXSSC']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
			<li><a href="${ctx}/jxss/topage?pageName=liangmianJxss&gameId=JXSSC&betOn=ZHHE" style="background-color:transparent" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_1_5 == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=jxss_1_5&gameId=JXSSC&betOn=BALL_1_5" style="background-color:transparent" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_yizhi == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=yz&gameId=JXSSC&betOn=YIZI_QW&nav=4" style="background-color:transparent" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_erzi == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=ez&gameId=JXSSC&betOn=ERZI_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_sanzi == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=sz&gameId=JXSSC&betOn=SANZI_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_erzidw == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=edw&gameId=JXSSC&betOn=ERZIDW_WQ&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_sanzidw == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=sdw&gameId=JXSSC&betOn=SANZIDW_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_zuxuansan == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=zxs&gameId=JXSSC&betOn=ZUXUANSAN_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_zuxuanliu == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=zxl&gameId=JXSSC&betOn=ZUXUANLIU_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc_kuadu == 1}">
				<li><a href="${ctx}/jxss/topage?pageName=kd&gameId=JXSSC&betOn=KUADU_QS&nav=1" style="background-color:transparent" data-ajax="false">${msg['title.ssc.KD']}</a></li>
				</c:if>
		</div>
    </div>
</div>
