<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/result_skin.css">
<%@ include file="css.jsp"%>
</head>
<body>
<div data-role="page">
    <%@include file="head.jsp"%>
    <div data-role="main" class="ui-content">
    <div class="ui-on-lottery">	
        <table border="1" class="rslttable">
           <tr class="On-Number">
				      <th class="wNumber"><span id="nis">0</span>期开奖号码</th>
            </tr>
            <tr class="bjc">
                <td id="nr">
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                    <span class="number num01"></span>
                </td>
            </tr>
        </table>  
        </div>	
			<div class="clear"></div>
			<div class="list_dingtime">    
		<div class="handicap-info">
		           期数:<span id="issue" class="green">加载中...</span>&nbsp;&nbsp;<span id="lbljfp">距封盘:</span><span id="closeTime" class="red">加载中...</span>&nbsp;&nbsp;<span id="lbljkj" style="display: none;">距开奖:</span><span id="openTime" class="red" style="display: none;">加载中...</span>
            <div style="float:right;" id="ykMoneyDiv">${msg['title.ssc.todayWinLoss']}:<span id="ykmoney">0.00</span></div>
        </div>
		<div data-role="navbar" data-mini="true">
		    <ul>
		        <li><a href="${ctx}/ssc/bjsc/liangmian" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false">${msg['title.ssc.LIANGMIAN']}</a></li>
		        <c:if test = "${empty obj.cf || obj.cf.bjc_1_5 == 1}">
		        <li><a href="${ctx}/ssc/bjsc/1to5" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false">1 ~ 5</a></li>
		        </c:if>
		        <c:if test = "${empty obj.cf || obj.cf.bjc_6_10 == 1}">
		        <li><a href="${ctx}/ssc/bjsc/6to10" ${obj.nav == 3 ? "class='ui-btn-active'" : ""} data-ajax="false">6 ~ 10</a></li>
		        </c:if>
		        <c:if test = "${empty obj.cf || obj.cf.bjc_12 == 1}">
		        <li><a href="${ctx}/ssc/bjsc/champion" ${obj.nav == 4 ? "class='ui-btn-active'" : ""} data-ajax="false">冠亚军</a></li>
		        </c:if>
		    </ul>
		</div>
		<div class="table-cotent-lottery">
        <table border="1" class="hdptable">
            <tr width="100%" class="tr-bgcolor">
                <th width="20%">组合</th>
                <th>第六名</th>
                <th>第七名</th>
                <th>第八名</th>
                <th>第九名</th>
                <th>第十名</th>
            </tr>
            <tr>
                <td class="td-bgcolor">大</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-BIG" data-mini="true"><label  title="第六名-大" for="BALL_6-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-BIG" data-mini="true"><label  title="第七名-大" for="BALL_7-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-BIG" data-mini="true"><label  title="第八名-大" for="BALL_8-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-BIG" data-mini="true"><label  title="第九名-大" for="BALL_9-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-BIG" data-mini="true"><label title="第十名-大" for="BALL_10-BIG">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">小</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-SMALL" data-mini="true"><label  title="第六名-小" for="BALL_6-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-SMALL" data-mini="true"><label  title="第七名-小" for="BALL_7-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-SMALL" data-mini="true"><label  title="第八名-小" for="BALL_8-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-SMALL" data-mini="true"><label  title="第九名-小" for="BALL_9-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-SMALL" data-mini="true"><label title="第十名-小" for="BALL_10-SMALL">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">单</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-ODD" data-mini="true"><label  title="第六名-单" for="BALL_6-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-ODD" data-mini="true"><label  title="第七名-单" for="BALL_7-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-ODD" data-mini="true"><label  title="第八名-单" for="BALL_8-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-ODD" data-mini="true"><label  title="第九名-单" for="BALL_9-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-ODD" data-mini="true"><label title="第十名-单" for="BALL_10-ODD">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">双</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-EVEN" data-mini="true"><label  title="第六名-双" for="BALL_6-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-EVEN" data-mini="true"><label  title="第七名-双" for="BALL_7-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-EVEN" data-mini="true"><label  title="第八名-双" for="BALL_8-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-EVEN" data-mini="true"><label  title="第九名-双" for="BALL_9-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-EVEN" data-mini="true"><label title="第十名-双" for="BALL_10-EVEN">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num01"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_1" data-mini="true"><label  title="第六名-1" for="BALL_6-NO_1">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_1" data-mini="true"><label  title="第七名-1" for="BALL_7-NO_1">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_1" data-mini="true"><label  title="第八名-1" for="BALL_8-NO_1">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_1" data-mini="true"><label  title="第九名-1" for="BALL_9-NO_1">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_1" data-mini="true"><label title="第十名-1" for="BALL_10-NO_1">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num02"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_2" data-mini="true"><label  title="第六名-2" for="BALL_6-NO_2">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_2" data-mini="true"><label  title="第七名-2" for="BALL_7-NO_2">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_2" data-mini="true"><label  title="第八名-2" for="BALL_8-NO_2">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_2" data-mini="true"><label  title="第九名-2" for="BALL_9-NO_2">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_2" data-mini="true"><label title="第十名-2" for="BALL_10-NO_2">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num03"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_3" data-mini="true"><label  title="第六名-3" for="BALL_6-NO_3">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_3" data-mini="true"><label  title="第七名-3" for="BALL_7-NO_3">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_3" data-mini="true"><label  title="第八名-3" for="BALL_8-NO_3">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_3" data-mini="true"><label  title="第九名-3" for="BALL_9-NO_3">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_3" data-mini="true"><label title="第十名-3" for="BALL_10-NO_3">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num04"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_4" data-mini="true"><label  title="第六名-4" for="BALL_6-NO_4">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_4" data-mini="true"><label  title="第七名-4" for="BALL_7-NO_4">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_4" data-mini="true"><label  title="第八名-4" for="BALL_8-NO_4">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_4" data-mini="true"><label  title="第九名-4" for="BALL_9-NO_4">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_4" data-mini="true"><label title="第十名-4" for="BALL_10-NO_4">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num05"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_5" data-mini="true"><label  title="第六名-5" for="BALL_6-NO_5">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_5" data-mini="true"><label  title="第七名-5" for="BALL_7-NO_5">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_5" data-mini="true"><label  title="第八名-5" for="BALL_8-NO_5">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_5" data-mini="true"><label  title="第九名-5" for="BALL_9-NO_5">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_5" data-mini="true"><label title="第十名-5" for="BALL_10-NO_5">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num06"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_6" data-mini="true"><label  title="第六名-6" for="BALL_6-NO_6">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_6" data-mini="true"><label  title="第七名-6" for="BALL_7-NO_6">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_6" data-mini="true"><label  title="第八名-6" for="BALL_8-NO_6">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_6" data-mini="true"><label  title="第九名-6" for="BALL_9-NO_6">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_6" data-mini="true"><label title="第十名-6" for="BALL_10-NO_6">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num07"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_7" data-mini="true"><label  title="第六名-7" for="BALL_6-NO_7">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_7" data-mini="true"><label  title="第七名-7" for="BALL_7-NO_7">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_7" data-mini="true"><label  title="第八名-7" for="BALL_8-NO_7">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_7" data-mini="true"><label  title="第九名-7" for="BALL_9-NO_7">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_7" data-mini="true"><label title="第十名-7" for="BALL_10-NO_7">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num08"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_8" data-mini="true"><label  title="第六名-8" for="BALL_6-NO_8">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_8" data-mini="true"><label  title="第七名-8" for="BALL_7-NO_8">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_8" data-mini="true"><label  title="第八名-8" for="BALL_8-NO_8">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_8" data-mini="true"><label  title="第九名-8" for="BALL_9-NO_8">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_8" data-mini="true"><label title="第十名-8" for="BALL_10-NO_8">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num09"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_9" data-mini="true"><label  title="第六名-9" for="BALL_6-NO_9">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_9" data-mini="true"><label  title="第七名-9" for="BALL_7-NO_9">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_9" data-mini="true"><label  title="第八名-9" for="BALL_8-NO_9">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_9" data-mini="true"><label  title="第九名-9" for="BALL_9-NO_9">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_9" data-mini="true"><label title="第十名-9" for="BALL_10-NO_9">0.00</label></fieldset></td>
            </tr>
            <tr class="bjc">
                <td class="td-bgcolor"><span class="number num10"></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_6-NO_10" data-mini="true"><label  title="第六名-10" for="BALL_6-NO_10">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_7-NO_10" data-mini="true"><label  title="第七名-10" for="BALL_7-NO_10">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_8-NO_10" data-mini="true"><label  title="第八名-10" for="BALL_8-NO_10">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_9-NO_10" data-mini="true"><label  title="第九名-10" for="BALL_9-NO_10">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_10-NO_10" data-mini="true"><label title="第十名-10" for="BALL_10-NO_10">0.00</label></fieldset></td>
            </tr>
        </table>
        </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
</div>    
<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<%@ include file="js.jsp"%>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>