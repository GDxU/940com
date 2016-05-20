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
        <c:if test = "${empty obj.cf || obj.cf.bjc_12 == 1}">
        <table border="1" class="hdptable">
            <tr width="100%" class="tr-bgcolor">
                <th colspan="4">冠、亚军和</th>
            </tr>
            <tr>
                <td class="td-bgcolor" width="20%">{[{5Yag5Lqa5aSn}]}</td>
                <td width="30%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="GOLD_SILVER-BIG" data-mini="true"><label title="冠亚-大" for="GOLD_SILVER-BIG">0.00</label></fieldset></td>
                <td class="td-bgcolor" width="20%">{[{5Yag5Lqa5bCP}]}</td>
                <td width="30%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="GOLD_SILVER-SMALL" data-mini="true"><label title="冠亚-小" for="GOLD_SILVER-SMALL">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">{[{5Yag5Lqa5Y2V}]}</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="GOLD_SILVER-ODD" data-mini="true"><label title="冠亚-单" for="GOLD_SILVER-ODD">0.00</label></fieldset></td>
                <td class="td-bgcolor">{[{5Yag5Lqa5Y+M}]}</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="GOLD_SILVER-EVEN" data-mini="true"><label title="冠亚-双" for="GOLD_SILVER-EVEN">0.00</label></fieldset></td>            
            </tr>
        </table>
        </c:if>
        <c:if test = "${empty obj.cf || obj.cf.bjc_1_5 == 1}">
        <table border="1" class="hdptable">
            <tr width="100%" class="tr-bgcolor">
                <th width="20%">组合</th>
                <th>冠军</th>
                <th>亚军</th>
                <th>第三名</th>
                <th>第四名</th>
                <th>第五名</th>
            </tr>
            <tr>
                <td class="td-bgcolor">大</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-BIG" data-mini="true"><label title="冠军-大" for="BALL_1-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-BIG" data-mini="true"><label title="亚军-大" for="BALL_2-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-BIG" data-mini="true"><label title="第三名-大" for="BALL_3-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-BIG" data-mini="true"><label title="第四名-大" for="BALL_4-BIG">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-BIG" data-mini="true"><label title="第五名-大" for="BALL_5-BIG">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">小</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-SMALL" data-mini="true"><label title="冠军-小" for="BALL_1-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-SMALL" data-mini="true"><label title="亚军-小" for="BALL_2-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-SMALL" data-mini="true"><label title="第三名-小" for="BALL_3-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-SMALL" data-mini="true"><label title="第四名-小" for="BALL_4-SMALL">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-SMALL" data-mini="true"><label title="第五名-小" for="BALL_5-SMALL">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">单</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-ODD" data-mini="true"><label title="冠军-单" for="BALL_1-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-ODD" data-mini="true"><label title="亚军-单" for="BALL_2-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-ODD" data-mini="true"><label title="第三名-单" for="BALL_3-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-ODD" data-mini="true"><label title="第四名-单" for="BALL_4-ODD">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-ODD" data-mini="true"><label title="第五名-单" for="BALL_5-ODD">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">双</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-EVEN" data-mini="true"><label title="冠军-双"  for="BALL_1-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-EVEN" data-mini="true"><label title="亚军-双"  for="BALL_2-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-EVEN" data-mini="true"><label title="第三名-双" for="BALL_3-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-EVEN" data-mini="true"><label title="第四名-双" for="BALL_4-EVEN">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-EVEN" data-mini="true"><label title="第五名-双" for="BALL_5-EVEN">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">龙</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-DRAGON" data-mini="true"><label title="冠军-龙"  for="BALL_1-DRAGON">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-DRAGON" data-mini="true"><label title="亚军-龙"  for="BALL_2-DRAGON">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-DRAGON" data-mini="true"><label title="第三名-龙" for="BALL_3-DRAGON">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-DRAGON" data-mini="true"><label title="第四名-龙" for="BALL_4-DRAGON">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-DRAGON" data-mini="true"><label title="第五名-龙" for="BALL_5-DRAGON">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">虎</td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_1-TIGER" data-mini="true"><label title="冠军-虎"  for="BALL_1-TIGER">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_2-TIGER" data-mini="true"><label title="亚军-虎"  for="BALL_2-TIGER">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_3-TIGER" data-mini="true"><label title="第三名-虎" for="BALL_3-TIGER">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_4-TIGER" data-mini="true"><label title="第四名-虎" for="BALL_4-TIGER">0.00</label></fieldset></td>
                <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ti" id="BALL_5-TIGER" data-mini="true"><label title="第五名-虎" for="BALL_5-TIGER">0.00</label></fieldset></td>
            </tr>
        </table>
        </c:if>
        <c:if test = "${empty obj.cf || obj.cf.bjc_6_10 == 1}">
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
        </table>
        </c:if>
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