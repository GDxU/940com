<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg['title.ssc.SSC']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
				<li><a href="${ctx}/cqss/topage?pageName=liangmianCqss&gameId=SSC&betOn=ZHHE" data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_1_5 == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=cqss_1_5&gameId=SSC&betOn=BALL_1_5" data-ajax="false" style="background-color:transparent">1 ~ 5</span></a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_yizhi == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=yz&gameId=SSC&betOn=YIZI_QW&nav=4" data-ajax="false" style="background-color:transparent">${msg['title.ssc.YZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_erzi == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=ez&gameId=SSC&betOn=ERZI_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.EZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_sanzi == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=sz&gameId=SSC&betOn=SANZI_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.SZ']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_erzidw == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=edw&gameId=SSC&betOn=ERZIDW_WQ&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.EDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_sanzidw == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=sdw&gameId=SSC&betOn=SANZIDW_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.SDW']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_zuxuansan == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=zxs&gameId=SSC&betOn=ZUXUANSAN_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.ZXS']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_zuxuanliu == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=zxl&gameId=SSC&betOn=ZUXUANLIU_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.ZXL']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.ssc_kuadu == 1}">
				<li><a href="${ctx}/cqss/topage?pageName=kd&gameId=SSC&betOn=KUADU_QS&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.KD']}</a></li>
				</c:if>		
		</div>
    </div>
</div>
