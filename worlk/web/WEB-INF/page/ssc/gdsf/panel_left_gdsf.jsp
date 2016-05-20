<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2>${msg['title.ssc.KLC']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/ssc" data-ajax="false" style="background-color:transparent">时时彩大厅</a></li>
			<li><a href="${ctx}/gdsf/topage?pageName=liangmianGdsf&gameId=KLC&betOn=LIANGMIAN"  data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANGMIAN']}</a></li>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_1 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_1"  data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_1']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_2 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_2"  data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_2']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_3 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_3" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_3']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_4 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_4" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_4']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_5 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_5" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_5']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_6 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_6" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_6']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_7 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_7" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_7']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_8 == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=ballGdsf&gameId=KLC&betOn=BALL_8" data-ajax="false" style="background-color:transparent">${msg['label.ssc.play.BALL_8']}</a></li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc_lm == 1}">
			<li><a href="${ctx}/gdsf/topage?pageName=serialGdsf&gameId=KLC&betOn=SERIAL_2&nav=1" data-ajax="false" style="background-color:transparent">${msg['title.ssc.LIANMA']}</a></li>
			</c:if>			
		</div>
    </div>
</div>
