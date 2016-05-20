<!-- <style>
#quick-links .ui-btn{
	font-size:13px !important;
}
</style> -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a" style="
 	-webkit-box-shadow: none !important; -moz-box-shadow: none !important; box-shadow: none !important;">
	<div data-role="header" data-theme="b" class="ui-them-defut"> 
		<h2 class="ui-icon-time-qu icon-black">${msg['title.ssc']}</h2>
	</div>
	<div data-role="content" > 
			<div id="to_index" onclick="toIndex()" class="ui-collapsible-inset ui-corner-all">
				<h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed"><a href="#" class="ui-collapsible-heading-toggle ui-btn ui-icon-home ui-btn-icon-right ui-btn-c">首页</a></h3>
			</div>
		<div id="col_id" data-role="collapsible-set" data-theme="c">
			<c:if test = "${empty sscSysConfig || sscSysConfig.klc == 1}">
			<li id="gdsf_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'KLC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
				<h3>${msg['title.ssc.KLC']}</h3>
				<ul data-role="listview">
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
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gxklc == 1}">
				<li id="gxsf_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'GXKLC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.GXKLC']}</h3>
					<ul data-role="listview">
						<li><a href="${ctx}/gxsf/topage?pageName=liangmianGxsf&gameId=GXKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						<li><a href="${ctx}/gxsf/topage?pageName=gxsf_1_5&gameId=GXKLC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_1_5 == 1}">
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_1 == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_1" title="${msg['label.ssc.play.BALL_1']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_1']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_2 == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_2" title="${msg['label.ssc.play.BALL_2']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_2']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_3 == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_3" title="${msg['label.ssc.play.BALL_3']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_3']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_4 == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_4" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_4']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_5 == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=ballGxsf&gameId=GXKLC&betOn=BALL_5" title="${msg['label.ssc.play.BALL_5']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_5']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_lh == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=lh&gameId=GXKLC&betOn=LONGHU" title="${msg['label.ssc.play.longhu']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.longhu']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.gxklc_zm == 1}">
						<li><a href="${ctx}/gxsf/topage?pageName=zm&gameId=GXKLC&betOn=ZHENGMA" title="${msg['label.ssc.play.zhengma']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.zhengma']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.tjklc == 1}">
				<li id="tjsf_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'TJKLC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.TJKLC']}</h3>
					<ul data-role="listview">
						<li><a href="${ctx}/tjsf/topage?pageName=liangmianTjsf&gameId=TJKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_1 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_1" title="${msg['label.ssc.play.BALL_1']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_1']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_2 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_2" title="${msg['label.ssc.play.BALL_2']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_2']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_3 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_3" title="${msg['label.ssc.play.BALL_3']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_3']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_4 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_4" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_4']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_5 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_5" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_5']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_6 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_6" title="${msg['label.ssc.play.BALL_6']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_6']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_7 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_7" title="${msg['label.ssc.play.BALL_7']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_7']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_8 == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=ballTjsf&gameId=TJKLC&betOn=BALL_8" title="${msg['label.ssc.play.BALL_8']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_8']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.tjklc_lm == 1}">
						<li><a href="${ctx}/tjsf/topage?pageName=serialTjsf&gameId=TJKLC&betOn=SERIAL_2&nav=1" title="${msg['title.ssc.LIANMA']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANMA']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.hnklc == 1}">
				<li id="hnsf_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'HNKLC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.HNKLC']}</h3>
					<ul data-role="listview">
						<li><a href="${ctx}/hnsf/topage?pageName=liangmianHnsf&gameId=HNKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_1 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_1" title="${msg['label.ssc.play.BALL_1']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_1']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_2 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_2" title="${msg['label.ssc.play.BALL_2']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_2']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_3 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_3" title="${msg['label.ssc.play.BALL_3']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_3']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_4 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_4" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_4']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_5 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_5" title="${msg['label.ssc.play.BALL_4']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_5']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_6 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_6" title="${msg['label.ssc.play.BALL_6']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_6']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_7 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_7" title="${msg['label.ssc.play.BALL_7']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_7']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_8 == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=ballHnsf&gameId=HNKLC&betOn=BALL_8" title="${msg['label.ssc.play.BALL_8']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.BALL_8']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hnklc_lm == 1}">
						<li><a href="${ctx}/hnsf/topage?pageName=serialHnsf&gameId=HNKLC&betOn=SERIAL_2&nav=1" title="${msg['title.ssc.LIANMA']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANMA']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.bjklc == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'BJKLC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.BJKLC']}</h3>
					<ul data-role="listview">
						<li><a href="${ctx}/bjsf/topage?pageName=liangmianBjsf&gameId=BJKLC&betOn=LIANGMIAN" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						<c:if test = "${empty obj.cf || obj.cf.bjklc_zm == 1}">
						<li><a href="${ctx}/bjsf/topage?pageName=ballBjsf&gameId=BJKLC&betOn=ZHENGMA" title="${msg['label.ssc.play.ZHENGMA']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.ZHENGMA']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.ssc == 1}">
			<li id="cqss_l" data-role="collapsible" data-iconpos="right"  ${obj.gameId == 'SSC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.SSC']}</h3>
				<ul data-role="listview">
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
					<c:if test = "${empty obj.cf || obj.cf.ssc_hs == 1}">
					<li><a href="${ctx}/cqss/topage?pageName=hs&gameId=SSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.jxssc == 1}">
			<li id="jxssc_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'JXSSC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.JXSSC']}</h3>
				<ul data-role="listview">
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
					<c:if test = "${empty obj.cf || obj.cf.jxssc_hs == 1}">
					<li><a href="${ctx}/jxss/topage?pageName=hs&gameId=JXSSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.xjssc == 1}">
			<li id="xjssc_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'XJSSC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.XJSSC']}</h3>
				<ul data-role="listview">
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
					<c:if test = "${empty obj.cf || obj.cf.xjssc_hs == 1}">
					<li><a href="${ctx}/xjss/topage?pageName=hs&gameId=XJSSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.tjssc == 1}">
			<li id="tjssc_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'TJSSC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.TJSSC']}</h3>
				<ul data-role="listview">
					<li><a href="${ctx}/tjss/topage?pageName=liangmianTjss&gameId=TJSSC&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_1_5 == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=tjss_1_5&gameId=TJSSC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_yizhi == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=yz&gameId=TJSSC&betOn=YIZI_QW&nav=4" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_erzi == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=ez&gameId=TJSSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_sanzi == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=sz&gameId=TJSSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_erzidw == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=edw&gameId=TJSSC&betOn=ERZIDW_WQ&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_sanzidw == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=sdw&gameId=TJSSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_zuxuansan == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=zxs&gameId=TJSSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_zuxuanliu == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=zxl&gameId=TJSSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_kuadu == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=kd&gameId=TJSSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.tjssc_hs == 1}">
					<li><a href="${ctx}/tjss/topage?pageName=hs&gameId=TJSSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.ynssc == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'YNSSC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.YNSSC']}</h3>
					<ul data-role="listview">
						<li><a href="${ctx}/ynss/topage?pageName=liangmian&gameId=YNSSC&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_1_5 == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=jxss_1_5&gameId=YNSSC&betOn=BALL_1_5" title="1 ~ 5" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 5</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_yizhi == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=yz&gameId=YNSSC&betOn=YIZI_QW&nav=4" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_erzi == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=ez&gameId=YNSSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_sanzi == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=sz&gameId=YNSSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_erzidw == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=edw&gameId=YNSSC&betOn=ERZIDW_WQ&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_sanzidw == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=sdw&gameId=YNSSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_zuxuansan == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=zxs&gameId=YNSSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_zuxuanliu == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=zxl&gameId=YNSSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_kuadu == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=kd&gameId=YNSSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.ynssc_hs == 1}">
						<li><a href="${ctx}/ynss/topage?pageName=hs&gameId=YNSSC&betOn=HS_SM" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.shssc == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'SHSSC' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.SHSSC']}</h3>
					<ul data-role="listview">
						<c:if test = "${empty obj.cf || obj.cf.shssc_1_5 == 1}">
						<li><a href="${ctx}/shss/topage?pageName=shss_1_5&gameId=SHSSC&betOn=BALL_1_5" title="1 ~ 3" data-transition="slide" data-ajax="false"><span id="enterPlay">1 ~ 3</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_yizhi == 1}">
						<li><a href="${ctx}/shss/topage?pageName=yz&gameId=SHSSC&betOn=YIZI_QS" title="${msg['title.ssc.YZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.YZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_erzi == 1}">
						<li><a href="${ctx}/shss/topage?pageName=ez&gameId=SHSSC&betOn=ERZI_QS&nav=1" title="${msg['title.ssc.EZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_sanzi == 1}">
						<li><a href="${ctx}/shss/topage?pageName=sz&gameId=SHSSC&betOn=SANZI_QS&nav=1" title="${msg['title.ssc.SZ']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SZ']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_erzidw == 1}">
						<li><a href="${ctx}/shss/topage?pageName=edw&gameId=SHSSC&betOn=ERZIDW_BS&nav=1" title="${msg['title.ssc.EDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.EDW']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_sanzidw == 1}">
						<li><a href="${ctx}/shss/topage?pageName=sdw&gameId=SHSSC&betOn=SANZIDW_QS&nav=1" title="${msg['title.ssc.SDW']}" data-transition="slide" data-ajax="false">${msg['title.ssc.SDW']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_zuxuansan == 1}">
						<li><a href="${ctx}/shss/topage?pageName=zxs&gameId=SHSSC&betOn=ZUXUANSAN_QS&nav=1" title="${msg['title.ssc.ZXS']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXS']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_zuxuanliu == 1}">
						<li><a href="${ctx}/shss/topage?pageName=zxl&gameId=SHSSC&betOn=ZUXUANLIU_QS&nav=1" title="${msg['title.ssc.ZXL']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZXL']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_kuadu == 1}">
						<li><a href="${ctx}/shss/topage?pageName=kd&gameId=SHSSC&betOn=KUADU_QS&nav=1" title="${msg['title.ssc.KD']}" data-transition="slide" data-ajax="false">${msg['title.ssc.KD']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.shssc_hs == 1}">
						<li><a href="${ctx}/shss/topage?pageName=hs&gameId=SHSSC&betOn=HS_SM&nav=1" title="${msg['label.ssc.play.HS_SM']}" data-transition="slide" data-ajax="false">${msg['label.ssc.play.HS_SM']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gdsyxw == 1}">
			<li id="gdsyxw_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'GDSYXW' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.GDSYXW']}</h3>
				<ul data-role="listview">
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
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.shsyxw == 1}">
			<li id="shsyxw_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'SHSYXW' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.SHSYXW']}</h3>
				<ul data-role="listview">
					<c:if test = "${empty obj.cf || obj.cf.shsyxw_lm == 1}">
					<li><a href="${ctx}/shsyxw/topage?pageName=liangmian&gameId=SHSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.shsyxw_1_5 == 1}">
					<li><a href="${ctx}/shsyxw/topage?pageName=dm&gameId=SHSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.shsyxw_renxuan == 1}">
					<li><a href="${ctx}/shsyxw/topage?pageName=rx&gameId=SHSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.shsyxw_zuxuan == 1}">
					<li><a href="${ctx}/shsyxw/topage?pageName=zux&gameId=SHSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.shsyxw_zhixuan == 1}">
					<li><a href="${ctx}/shsyxw/topage?pageName=zx&gameId=SHSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.sdsyxw == 1}">
			<li id="sdsyxw_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'SDSYXW' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.SDSYXW']}</h3>
				<ul data-role="listview">
					<c:if test = "${empty obj.cf || obj.cf.sdsyxw_lm == 1}">
					<li><a href="${ctx}/sdsyxw/topage?pageName=liangmian&gameId=SDSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.sdsyxw_1_5 == 1}">
					<li><a href="${ctx}/sdsyxw/topage?pageName=dm&gameId=SDSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.sdsyxw_renxuan == 1}">
					<li><a href="${ctx}/sdsyxw/topage?pageName=rx&gameId=SDSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.sdsyxw_zuxuan == 1}">
					<li><a href="${ctx}/sdsyxw/topage?pageName=zux&gameId=SDSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
					</c:if>
					<c:if test = "${empty obj.cf || obj.cf.sdsyxw_zhixuan == 1}">
					<li><a href="${ctx}/sdsyxw/topage?pageName=zx&gameId=SDSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
					</c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.jxsyxw == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'JXSYXW' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.JXSYXW']}</h3>
					<ul data-role="listview">
						<c:if test = "${empty obj.cf || obj.cf.jxsyxw_lm == 1}">
						<li><a href="${ctx}/jxsyxw/topage?pageName=liangmian&gameId=JXSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jxsyxw_1_5 == 1}">
						<li><a href="${ctx}/jxsyxw/topage?pageName=dm&gameId=JXSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jxsyxw_renxuan == 1}">
						<li><a href="${ctx}/jxsyxw/topage?pageName=rx&gameId=JXSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jxsyxw_zuxuan == 1}">
						<li><a href="${ctx}/jxsyxw/topage?pageName=zux&gameId=JXSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jxsyxw_zhixuan == 1}">
						<li><a href="${ctx}/jxsyxw/topage?pageName=zx&gameId=JXSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.lnsyxw == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'LNSYXW' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.LNSYXW']}</h3>
					<ul data-role="listview">
						<c:if test = "${empty obj.cf || obj.cf.lnsyxw_lm == 1}">
						<li><a href="${ctx}/lnsyxw/topage?pageName=liangmian&gameId=LNSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.lnsyxw_1_5 == 1}">
						<li><a href="${ctx}/lnsyxw/topage?pageName=dm&gameId=LNSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.lnsyxw_renxuan == 1}">
						<li><a href="${ctx}/lnsyxw/topage?pageName=rx&gameId=LNSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.lnsyxw_zuxuan == 1}">
						<li><a href="${ctx}/lnsyxw/topage?pageName=zux&gameId=LNSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.lnsyxw_zhixuan == 1}">
						<li><a href="${ctx}/lnsyxw/topage?pageName=zx&gameId=LNSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.hbsyxw == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'HBSYXW' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.HBSYXW']}</h3>
					<ul data-role="listview">
						<c:if test = "${empty obj.cf || obj.cf.hbsyxw_lm == 1}">
						<li><a href="${ctx}/hbsyxw/topage?pageName=liangmian&gameId=HBSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hbsyxw_1_5 == 1}">
						<li><a href="${ctx}/hbsyxw/topage?pageName=dm&gameId=HBSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hbsyxw_renxuan == 1}">
						<li><a href="${ctx}/hbsyxw/topage?pageName=rx&gameId=HBSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hbsyxw_zuxuan == 1}">
						<li><a href="${ctx}/hbsyxw/topage?pageName=zux&gameId=HBSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.hbsyxw_zhixuan == 1}">
						<li><a href="${ctx}/hbsyxw/topage?pageName=zx&gameId=HBSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.jssyxw == 1}">
				<li data-role="collapsible" data-iconpos="right" ${obj.gameId == 'JSSYXW' ? "data-collapsed='false'" : ""} data-theme="l"><!--${obj.gameId} data-collapsed="false" -->
					<h3>${msg['title.ssc.JSSYXW']}</h3>
					<ul data-role="listview">
						<c:if test = "${empty obj.cf || obj.cf.jssyxw_lm == 1}">
						<li><a href="${ctx}/jssyxw/topage?pageName=liangmian&gameId=JSSYXW&betOn=ZHHE" title="${msg['title.ssc.LIANGMIAN']}" data-transition="slide" data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jssyxw_1_5 == 1}">
						<li><a href="${ctx}/jssyxw/topage?pageName=dm&gameId=JSSYXW&betOn=BALL_1_5" title="${msg['title.ssc.DM']}" data-transition="slide" data-ajax="false"><span id="enterPlay">${msg['title.ssc.DM']}</span></a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jssyxw_renxuan == 1}">
						<li><a href="${ctx}/jssyxw/topage?pageName=rx&gameId=JSSYXW&betOn=SERIAL_1_1&nav=1" title="${msg['title.ssc.RX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.RX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jssyxw_zuxuan == 1}">
						<li><a href="${ctx}/jssyxw/topage?pageName=zux&gameId=JSSYXW&betOn=SERIAL_ZX_2&nav=1" title="${msg['title.ssc.ZUX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZUX']}</a></li>
						</c:if>
						<c:if test = "${empty obj.cf || obj.cf.jssyxw_zhixuan == 1}">
						<li><a href="${ctx}/jssyxw/topage?pageName=zx&gameId=JSSYXW&betOn=SERIAL_ZHI_2&nav=1" title="${msg['title.ssc.ZX']}" data-transition="slide" data-ajax="false">${msg['title.ssc.ZX']}</a></li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.bjc == 1}">
			<li id="bjsc_l" data-role="collapsible" data-iconpos="right" ${t_gameId == 'BJC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.BJC']}</h3>
				<ul data-role="listview">
					<li><a href="${ctx}/ssc/bjsc/liangmian" data-ajax="false">两面盘</a></li>
			        <c:if test = "${empty sscSysConfig || sscSysConfig.bjc_1_5 == 1}">
			        <li><a href="${ctx}/ssc/bjsc/1to5" data-ajax="false">1 ~ 5</a></li>
			        </c:if>
			        <c:if test = "${empty sscSysConfig || sscSysConfig.bjc_6_10 == 1}">
			        <li><a href="${ctx}/ssc/bjsc/6to10" data-ajax="false">6 ~ 10</a></li>
			        </c:if>
			        <c:if test = "${empty sscSysConfig || sscSysConfig.bjc_12 == 1}">
			        <li><a href="${ctx}/ssc/bjsc/champion" data-ajax="false">冠亚军</a></li>
			        </c:if>
				</ul>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.jsks == 1}">
			<li onclick="tojssb()"><h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed"><a href="#" class="ui-collapsible-heading-toggle ui-btn ui-icon-carat-r ui-btn-icon-right ui-btn-l">${msg['title.ssc.JSKS']}</a></h3>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.ahks == 1}">
			<li onclick="toahsb()"><h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed"><a href="#" class="ui-collapsible-heading-toggle ui-btn ui-icon-carat-r ui-btn-icon-right ui-btn-l">${msg['title.ssc.AHKS']}</a></h3>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.gxks == 1}">
			<li onclick="togxsb()"><h3 class="ui-collapsible-heading ui-collapsible-heading-collapsed"><a href="#" class="ui-collapsible-heading-toggle ui-btn ui-icon-carat-r ui-btn-icon-right ui-btn-l">${msg['title.ssc.GXKS']}</a></h3>
			</li>
			</c:if>
			<c:if test = "${empty sscSysConfig || sscSysConfig.xync == 1}">
			<li id="xync_l" data-role="collapsible" data-iconpos="right" ${obj.gameId == 'XYNC' ? "data-collapsed='false'" : ""} data-theme="l">
				<h3>${msg['title.ssc.XYNC']}</h3>
				<ul data-role="listview">
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
				</ul>
			</li>
			</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
function toIndex(){
	window.location.href = ctx + "/index";
}
function tojssb(){
	window.location.href = ctx + "/ssc/jssb/dxsb";
}
function toahsb(){
	window.location.href = ctx + "/ssc/ahsb/dxsb";
}
function togxsb(){
	window.location.href = ctx + "/ssc/gxsb/dxsb";
}
</script>
