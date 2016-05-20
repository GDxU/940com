<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/result_skin.css">
<style type="text/css">
.orderTable td {
	border-top: #bbb 1px solid;
}

.orderTable td a {
	cursor: pointer;
}

.orderTable td input {
	width: 40px;
}

.green {
	color: #299A26;
	font-weight: bold;
}

.red {
	color: #F00;
	font-weight: bold;
}
</style>
</head>
<body>
<div data-role="page">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <a href="#quick-links" data-ajax="false" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"> </a>
        <div class="header-bg">
            <div class="logo inline-block">
                <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
            </div>
        </div>
 		<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
     		<a href="${ctx}/ssc/menu" data-ajax="false" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.GXKS']}</h1>
            <a id="orderBtn" style="overflow:visible; line-height:1.4em;" class="ui-link ui-btn-right ui-btn ui-icon-check-b ui-btn-icon-right-b ui-shadow ui-corner-all" data-ajax="false" >{[{5rOo}]}单<font color="white"><span id="orderCount" class="spnicon"></span></font></a>
		 </div>
    </div>
    <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
    <%@ include file="/WEB-INF/page/ssc/panel_left_ssc.jsp" %>
    <div data-role="main" class="ui-content">
    <div class="ui-on-lottery">		
    <table border="1" class="rslttable">
        <tr class="On-Number">
				      <th class="wNumber"><span id="nis">0</span>期开奖号码</th>
        </tr>
        <tr>
            <td class="jsks" id="nr">
                <span class="number num1"></span>&nbsp;&nbsp;
                <span class="number num1"></span>&nbsp;&nbsp;
                <span class="number num1"></span>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    </div>	
			<div class="clear"></div>
			<div class="list_dingtime">
    <div class="handicap-info">
       	<span id="issue" class="green">加载中...</span>期&nbsp;<span id="lbljfp">距封盘:</span><span id="closeTime" class="red">加载中...</span>&nbsp;&nbsp;<span id="lbljkj" style="display: none;">距开奖:</span><span id="openTime" class="red" style="display: none;">加载中...</span>
        <div style="float:right;" id="ykMoneyDiv">${msg['title.ssc.todayWinLoss']}:<span id="ykmoney">0.00</span></div>
    </div>
    <div class="table-cotent-lottery">
    <c:if test = "${empty obj.cf || obj.cf.gxks_sj == 1}">
    <table border="1"  class="hdptable">
        <tr width="100%" class="tr-bgcolor">
            <th colspan="6">{[{5LiJ5Yab44CQ6LWU546H6K+05piO77ya5LiA5ZCM6aqwPe+8iOi1lOeOhy0xKVggMeOAgeS6jOWQjOmqsD3vvIjotZTnjoctMSlYIDLjgIHkuInlkIzpqrA977yI6LWU546HLTEpWCAz44CR}]}</th>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor" width="15%"><span class="number num1"></span></td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_1" data-mini="true"><label title="三军-1" for="SAN_JUN-NO_1">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="15%"><span class="number num2"></span></td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_2" data-mini="true"><label title="三军-2" for="SAN_JUN-NO_2">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="15%"><span class="number num3"></span></td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_3" data-mini="true"><label title="三军-3" for="SAN_JUN-NO_3">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_4" data-mini="true"><label title="三军-4" for="SAN_JUN-NO_4">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_5" data-mini="true"><label title="三军-5" for="SAN_JUN-NO_5">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SAN_JUN-NO_6" data-mini="true"><label title="三军-6" for="SAN_JUN-NO_6">0.00</label></fieldset></td>
        </tr>
    </table>
    <table border="1" class="hdptable">
	    <tr width="100%" class="tr-bgcolor">
            <th colspan="4">${msg['label.ssc.play.BIG_SMALL']}</th>
        </tr>
        <tr class="jsks">
           <td class="td-bgcolor" width="30%">总和大</td><td width="20%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BIG_SMALL-BIG" data-mini="true"><label title="大小-大" for="BIG_SMALL-BIG">0.00</label></fieldset></td>
           <td class="td-bgcolor" width="30%">总和小</td><td width="20%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BIG_SMALL-SMALL" data-mini="true"><label title="大小-小" for="BIG_SMALL-SMALL">0.00</label></fieldset></td>
        </tr>
    </table>
    </c:if>
    <c:if test = "${empty obj.cf || obj.cf.gxks_ws == 1}">
    <table border="1" class="hdptable">
        <tr width="100%" class="tr-bgcolor">
            <th colspan="6">${msg['label.ssc.play.WEI_SUAI']}、${msg['label.ssc.play.QUAN_SUAI']}</th>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor" width="30%"><span class="number num1"></span><span class="number num1"></span><span class="number num1"></span></td>
            <td width="20%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_1_1_1" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-111" for="WEI_SUAI-NO_1_1_1" class="ui-btn-z">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="30%"><span class="number num2"></span><span class="number num2"></span><span class="number num2"></span></td>
            <td width="20%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_2_2_2" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-222" for="WEI_SUAI-NO_2_2_2" class="ui-btn-z">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num3"></span><span class="number num3"></span><span class="number num3"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_3_3_3" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-333" for="WEI_SUAI-NO_3_3_3" class="ui-btn-z">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num4"></span><span class="number num4"></span><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_4_4_4" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-444" for="WEI_SUAI-NO_4_4_4" class="ui-btn-z">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num5"></span><span class="number num5"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_5_5_5" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-555" for="WEI_SUAI-NO_5_5_5" class="ui-btn-z">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num6"></span><span class="number num6"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="WEI_SUAI-NO_6_6_6" data-mini="true"><label title="${msg['label.ssc.play.WEI_SUAI']}-666" for="WEI_SUAI-NO_6_6_6" class="ui-btn-z">0.00</label></fieldset></td>
        </tr>
        <tr>
            <td class="td-bgcolor">${msg['label.ssc.play.QUAN_SUAI']}</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="QUAN_SUAI-NO_0_0_0" data-mini="true"><label title="${msg['label.ssc.play.QUAN_SUAI']}-${msg['label.ssc.play.QUAN_SUAI']}" for="QUAN_SUAI-NO_0_0_0" class="ui-btn-z">0.00</label></fieldset></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </c:if>
    <c:if test = "${empty obj.cf || obj.cf.gxks_point == 1}">
    <table border="1" class="hdptable">
        <tr width="100%"  class="tr-bgcolor">
            <th colspan="6">点数</th>
        </tr>
        <tr>
            <td class="td-bgcolor" width="15%">4点</td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_4" data-mini="true"><label title="点数-4点" for="POINT-P_4">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="15%">5点</td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_5" data-mini="true"><label title="点数-5点" for="POINT-P_5">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="15%">6点</td>
            <td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_6" data-mini="true"><label title="点数-6点" for="POINT-P_6">0.00</label></fieldset></td>
        </tr>
        <tr>
            <td class="td-bgcolor">7点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_7" data-mini="true"><label title="点数-7点" for="POINT-P_7">0.00</label></fieldset></td>
            <td class="td-bgcolor">8点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_8" data-mini="true"><label title="点数-8点" for="POINT-P_8">0.00</label></fieldset></td>
            <td class="td-bgcolor">9点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_9" data-mini="true"><label title="点数-9点" for="POINT-P_9">0.00</label></fieldset></td>
        </tr>
        <tr>
            <td class="td-bgcolor">10点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_10" data-mini="true"><label title="点数-10点" for="POINT-P_10">0.00</label></fieldset></td>
            <td class="td-bgcolor">11点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_11" data-mini="true"><label title="点数-11点" for="POINT-P_11">0.00</label></fieldset></td>
            <td class="td-bgcolor">12点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_12" data-mini="true"><label title="点数-12点" for="POINT-P_12">0.00</label></fieldset></td>
        </tr>
        <tr>
            <td class="td-bgcolor">13点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_13" data-mini="true"><label title="点数-13点" for="POINT-P_13">0.00</label></fieldset></td>
            <td class="td-bgcolor">14点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_14" data-mini="true"><label title="点数-14点" for="POINT-P_14">0.00</label></fieldset></td>
            <td class="td-bgcolor">15点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_15" data-mini="true"><label title="点数-15点" for="POINT-P_15">0.00</label></fieldset></td>
        </tr>
        <tr>
            <td class="td-bgcolor">16点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_16" data-mini="true"><label title="点数-16点" for="POINT-P_16">0.00</label></fieldset></td>
            <td class="td-bgcolor">17点</td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="POINT-P_17" data-mini="true"><label title="点数-17点" for="POINT-P_17">0.00</label></fieldset></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </c:if>
    <c:if test = "${empty obj.cf || obj.cf.gxks_lc == 1}">
    <table border="1" class="hdptable">
        <tr width="100%"  class="tr-bgcolor">
            <th colspan="4">${msg['label.ssc.play.LONG_CARDS']}</th>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor" width="25%"><span class="number num1"></span><span class="number num2"></span></td>
            <td width="25%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_1_2" data-mini="true"><label title="长牌-12" for="LONG_CARDS-NO_1_2">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="25%"><span class="number num1"></span><span class="number num3"></span></td>
            <td width="25%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_1_3" data-mini="true"><label title="长牌-13" for="LONG_CARDS-NO_1_3">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num1"></span><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_1_4" data-mini="true"><label title="长牌-14" for="LONG_CARDS-NO_1_4">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num1"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_1_5" data-mini="true"><label title="长牌-15" for="LONG_CARDS-NO_1_5">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num1"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_1_6" data-mini="true"><label title="长牌-16" for="LONG_CARDS-NO_1_6">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num2"></span><span class="number num3"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_2_3" data-mini="true"><label title="长牌-23" for="LONG_CARDS-NO_2_3">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num2"></span><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_2_4" data-mini="true"><label title="长牌-24" for="LONG_CARDS-NO_2_4">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num2"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_2_5" data-mini="true"><label title="长牌-25" for="LONG_CARDS-NO_2_5">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num2"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_2_6" data-mini="true"><label title="长牌-26" for="LONG_CARDS-NO_2_6">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num3"></span><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_3_4" data-mini="true"><label title="长牌-34" for="LONG_CARDS-NO_3_4">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num3"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_3_5" data-mini="true"><label title="长牌-35" for="LONG_CARDS-NO_3_5">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num3"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_3_6" data-mini="true"><label title="长牌-36" for="LONG_CARDS-NO_3_6">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num4"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_4_5" data-mini="true"><label title="长牌-45" for="LONG_CARDS-NO_4_5">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num4"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_4_6" data-mini="true"><label title="长牌-46" for="LONG_CARDS-NO_4_6">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num5"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="LONG_CARDS-NO_5_6" data-mini="true"><label title="长牌-56" for="LONG_CARDS-NO_5_6">0.00</label></fieldset></td>
            <td></td><td></td>
        </tr>
    </table>
    </c:if>
    <c:if test = "${empty obj.cf || obj.cf.gxks_sc == 1}">
    <table border="1" class="hdptable">
        <tr width="100%" class="tr-bgcolor">
            <th colspan="4">${msg['label.ssc.play.SHORT_CARDS']}</th>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor" width="25%"><span class="number num1"></span><span class="number num1"></span></td>
            <td width="25%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_1_1" data-mini="true"><label title="短牌-11" for="SHORT_CARDS-NO_1_1">0.00</label></fieldset></td>
            <td class="td-bgcolor" width="25%"><span class="number num2"></span><span class="number num2"></span></td>
            <td width="25%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_2_2" data-mini="true"><label title="短牌-22" for="SHORT_CARDS-NO_2_2">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num3"></span><span class="number num3"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_3_3" data-mini="true"><label title="短牌-33" for="SHORT_CARDS-NO_3_3">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num4"></span><span class="number num4"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_4_4" data-mini="true"><label title="短牌-44" for="SHORT_CARDS-NO_4_4">0.00</label></fieldset></td>
        </tr>
        <tr class="jsks">
            <td class="td-bgcolor"><span class="number num5"></span><span class="number num5"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_5_5" data-mini="true"><label title="短牌-55" for="SHORT_CARDS-NO_5_5">0.00</label></fieldset></td>
            <td class="td-bgcolor"><span class="number num6"></span><span class="number num6"></span></td>
            <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="SHORT_CARDS-NO_6_6" data-mini="true"><label title="短牌-66" for="SHORT_CARDS-NO_6_6">0.00</label></fieldset></td>
        </tr>
    </table>
    </c:if>
    </div>
    </div>
    </div>
	<div style="margin-top:35px;"></div>
		<div data-role="footer" class="ui-footer-fixed" style="background-color: #F3F5F2;">
	 	<div data-role="navbar" data-iconpos="left">
	     	<ul>
	         	<!-- <li class="ui-btn-rect-lot-green"></li> -->
	         	<li class="ui-btn-rect-lot-red"><a href="${ctx}/ssc/gameResultSingle?gid=17" data-ajax="false" style="color:green" data-icon="eye">近期开奖结果</a></li>
	     	</ul>
		</div>
	</div>
 </div>
    <form id="tempForm" data-ajax="false" action="${ctx}/ssc/gxsb/order" method="get">
        <input type="hidden" name="bon" value="BIG_SB">
        <input type="hidden" name="gameId" value="GXKS">
        <input type="hidden" name="issue" value="0">
        <input type="hidden" name="hc" value="${sessionScope.SSC_USER_SESSION.cht}">
        <div id="items"></div>
    </form>
</body>
<script type="text/javascript">
	$.base64.utf8encode = true;
    var ot_sw,ct_sw,hc_sw;//s:true,h:false;
    var ot_s,ct_s,hc_s;//s:true,h:false;
    var ot_cd,ct_cd,hc_cd;
    var ct_d = new Date();
    var ot_d = new Date();
    var req_cd;
    var isNew = true;
    var isAll = true;
    var firstLoad = true;

    function otCountDown(){
        if(ot_d.getUTCMinutes() > 0 || ot_d.getUTCSeconds() > 0) {
            ot_d.setUTCSeconds(ot_d.getUTCSeconds() - 1);
            var ms = ot_d.getUTCMinutes() < 10 ? "0" + ot_d.getUTCMinutes() : ot_d.getUTCMinutes();
            var ss = ot_d.getUTCSeconds() < 10 ? "0" + ot_d.getUTCSeconds() : ot_d.getUTCSeconds();
            if(ot_sw)
                $("#lbljkj").show();
            $("#openTime").text(ms + ":" + ss);
        }else{
        	//$("#ykMoneyDiv").hide();
            $("#lbljkj").hide();
            $("#openTime").text("正在开奖...");
        }
        if(ot_d.getUTCHours() > 0 && !hc_sw){
            $("#lbljkj").hide();
            //$("#ykMoneyDiv").show();
            ot_sw = false;
        }
        if(ot_sw != ot_s){
            if(ot_sw == true){
                $("#lbljkj").show();
                $("#openTime").show();
                //$("#ykMoneyDiv").hide();
            }else{
                $("#lbljkj").hide();
                $("#openTime").hide();
                //$("#ykMoneyDiv").show();
            }
            ot_s = ot_sw;
        }
        ot_cd = setTimeout("otCountDown()", 1000);
    }

    function ctCountDown(){
        if((ct_d.getUTCMinutes() > 0 || ct_d.getUTCSeconds() > 0) && hc_sw) {
            ct_d.setUTCSeconds(ct_d.getUTCSeconds() - 1);
            var ms = ct_d.getUTCMinutes()<10?"0"+ct_d.getUTCMinutes():ct_d.getUTCMinutes();
            var ss = ct_d.getUTCSeconds()<10?"0"+ct_d.getUTCSeconds():ct_d.getUTCSeconds();
            $("#closeTime").text(ms+":"+ss);
            $("#lbljfp").show();
            ot_sw = false;
        }else{
            $("#lbljfp").hide();
            $("#closeTime").text("已封盘");
            hc_sw = false;
            ot_sw = true;
        }
        if(ct_sw != ct_s){
            if(ct_sw == true){
                $("#lbljfp").show();
                $("#closeTime").show();
            }else{
                $("#lbljfp").hide();
                $("#closeTime").hide();
            }
            ct_s = ct_sw;
        }
        ct_cd = setTimeout("ctCountDown()", 1000);
    }

    function hcCountDown(){
        if(hc_sw != hc_s){
            if(hc_sw == true){
                $("input[type='checkbox']").checkboxradio("enable");
            }else{
                $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                showOrderCount();
                $("label").each(function(){
                    $(this).text("0.00");
                });
                $("input[type='checkbox']").checkboxradio("disable");
            }
            hc_s = hc_sw;
        }
        hc_cd = setTimeout("hcCountDown()", 1000);
    }

    var timer = null;
    function blink(ids){
        for(var i=0;i<ids.length;i++){
            $("#"+ids[i]).prev().addClass('myBlink');
        }
        timer = setTimeout(function(){stopBlink(ids);},2000);
    }

    function stopBlink(ids){
        for(var i=0;i<ids.length;i++){
            $("#"+ids[i]).prev().removeClass('myBlink');
        }
        clearTimeout(timer);
    }

    function getRate(){
        if(firstLoad){
            firstLoad = false;
            showLoader();
        }
        //var hc = $("#hcts").jqmData("cht");
        $.getJSON("${ctx}/ssc/gxsb/rate/"+(isAll?"all":"v")+"/"+new Date().getTime(),function(o) {
        	if(o.c == 0){
	            ct_d.setTime(o.closeTime);
	            ot_d.setTime(o.openTime);
	            // $("#issue").text(o.issue);
	            var tem = o.issue;
	            $("#issue").text(tem.substring(8,tem.length));
	            $("#ykmoney").html(showColor1(0 == o.ykMoney ? "0.00" : o.ykMoney));
	            $("input[name='issue']").val(o.issue);
	            var ids = new Array();
	            if(o.rateMap != undefined){
	                var i = 0;
	                $.each(o.rateMap,function(k,v){
	                    $.each(v,function(kk,vv){
	                        var old = $("label[for='"+k+"-"+kk+"']").text();
	                        var last = Math.round(vv * 1000 )/1000;
	                        if(old != '' && old != '0.00' && old != last){
	                            ids[i] = k+"-"+kk;
	                        }
	                        if((last + "").split(".").length == 1){
	                            last = last + ".00"
	                        }
	                        $("label[for='"+k+"-"+kk+"']").text(last);
	                        i++;
	                    });
	                });
	            }
	            if(o.newIssue != undefined){
	            	if(o.newIssue != $("#nis").text()){
	            		isNew=true;
	            	}
	                $("#nis").text(o.newIssue);
	            }
	            if(o.ball != undefined && isNew){
	                var nrs = o.ball.split(",");
	                $("#nr > span").each(function(i){
	                    $(this).attr("class","number num"+nrs[i]);
	                });
	            }
	            if(ids.length > 0){
	                blink(ids);
	            }
	            if(o.hcStatus == 0 || o.hcStatus == 10 || o.closeTime < 0) {
	                isAll = true;
	                hc_sw = false;
	                req_cd = setTimeout("getRate()", 5000);
	            }else{
	                isAll = false;
	                hc_sw = true;
	                req_cd = setTimeout("getRate()", 20000);
	            }
	            if(isNew){
	                if(ct_cd != undefined)
	                    clearTimeout(ct_cd);
	                if(ot_cd != undefined)
	                    clearTimeout(ot_cd);
	                ctCountDown();
	                otCountDown();
	                isNew = false;
	            }
            }else{
				alert(o.e);
				window.location.href = ctx + "/index";	             
            }
        }).fail(function(jqxhr, textStatus, error) {
            if(textStatus == 'error'){
                //alert("网络中断,请检测网络！");
            }else if(textStatus == 'parsererror'){
                alert("${msg['msg.common.sessionExpired']}");
                window.location.href = "${ctx}/login";
            }
        }).always(function() {
            hideLoader();
        });
    }

    function showOrderCount(){
        var count = $("input:checked").length;
        if(count > 0){
            $("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
            $("#orderCount").addClass('spnicon').text($("input:checked").length);
        }else{
            $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
            $("#orderCount").removeClass('spnicon').text('');
        }
    }

    function showSelected(){
        var ods = "${obj.ods}";
        if(ods!=undefined){
            ods = ods.split(",");
            $.each(ods,function(i,v){
                $("#"+v).prop("checked",true).checkboxradio("refresh");
            });
        }
    }

    $(function(){
        hc_sw = false;
        hcCountDown();
        $("label").addClass("ui-btn-z");//pei率按钮缩小
        showSelected();
        showOrderCount();
        $("input[type='checkbox']").on("click",function(e){
            showOrderCount();
        });
        $("a[name='chc']").on("click",function(e){
            var hc = $(this).attr("hc");
            $("#hcts").attr('class', "btt-" + hc).jqmData("cht", hc);
            $("input[name='hc']").val(hc);
            $("#hdcpPopup").popup( "close" );
            first = true;
            clearTimeout(req_cd);
            req_cd = setTimeout("getRate()", 1000);
        });
        $("#orderBtn").on("click",function(e) {
            if ($("input:checked").length == 0) {
                alert("请先选择号码!");
                e.stopPropagation();
            } else {
                var tempForm = $("#tempForm");
                var items = $("#items").empty();
                $("input:checked").each(function(i){
                    var o = $("label[for='" + $(this).attr("id") + "']");
                    $("<input type='hidden'name='type' value='" + o.attr("for") + "'>").appendTo(items);
                    //$("<input type='hidden'name='title' value='" + o.attr("title") + "'>").appendTo(items);
                    $("<input type='hidden'name='title' value='" + $.base64.encode(o.attr("title")) + "'>").appendTo(items);
                    $("<input type='hidden'name='rate' value='" + o.text() + "'>").appendTo(items);
                });
                clearTimeout(req_cd);
                tempForm.submit();
            }
        });
        getRate();
    });
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>