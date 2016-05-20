<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg["title.ssc.XYNC"]}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
				<li><a href="${ctx}/xync/topage?pageName=liangmianXYNC&gameId=XYNC&betOn=LIANGMIAN" data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANGMIAN']}</a></li>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_1 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_1" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_1']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_2 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_2" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_2']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_3 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_3" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_3']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_4 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_4" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_4']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_5 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_5" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_5']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_6 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_6" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_6']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_7 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_7" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_7']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_8 == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=BALL_8" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_8']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_zm == 1}">
				<li><a href="${ctx}/xync/topage?pageName=ballXYNC&gameId=XYNC&betOn=ZHENGMA" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.ZHENGMA']}</a></li>
				</c:if>
				<c:if test = "${empty sscSysConfig || sscSysConfig.xync_lm == 1}">
				<li><a href="${ctx}/xync/topage?pageName=serialXYNC&gameId=XYNC&betOn=SERIAL_2&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANMA']}</a></li>
				</c:if>		
		</div>
    </div>
</div>