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
                <th colspan="6">冠、亚军和(冠军车号 + 亚军车号 = 和)</th>
            </tr>
            <tr>
                <td class="td-bgcolor" width="15%">3</td><td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_3" data-mini="true"><label title="冠亚-3" for="GOLD_SILVER-NO_3">0.00</label></fieldset></td>
                <td class="td-bgcolor" width="15%">4</td><td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_4" data-mini="true"><label title="冠亚-4" for="GOLD_SILVER-NO_4">0.00</label></fieldset></td>
                <td class="td-bgcolor" width="15%">5</td><td width="18%"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_5" data-mini="true"><label title="冠亚-5" for="GOLD_SILVER-NO_5">0.00</label></fieldset></td>
            </tr>
            <tr>
  				<td class="td-bgcolor">6</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_6" data-mini="true"><label title="冠亚-6" for="GOLD_SILVER-NO_6">0.00</label></fieldset></td>            
                <td class="td-bgcolor">7</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_7" data-mini="true"><label title="冠亚-7" for="GOLD_SILVER-NO_7">0.00</label></fieldset></td>
                <td class="td-bgcolor">8</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_8" data-mini="true"><label title="冠亚-8" for="GOLD_SILVER-NO_8">0.00</label></fieldset></td>
   
            </tr>
            <tr>
            	<td class="td-bgcolor">9</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_9" data-mini="true"><label title="冠亚-9" for="GOLD_SILVER-NO_9">0.00</label></fieldset></td>
                <td class="td-bgcolor">10</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_10" data-mini="true"><label title="冠亚-10" for="GOLD_SILVER-NO_10">0.00</label></fieldset></td>            
                <td class="td-bgcolor">11</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_11" data-mini="true"><label title="冠亚-11" for="GOLD_SILVER-NO_11">0.00</label></fieldset></td>
            </tr>
            <tr>
                <td class="td-bgcolor">12</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_12" data-mini="true"><label title="冠亚-12" for="GOLD_SILVER-NO_12">0.00</label></fieldset></td>
                <td class="td-bgcolor">13</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_13" data-mini="true"><label title="冠亚-13" for="GOLD_SILVER-NO_13">0.00</label></fieldset></td>
                <td class="td-bgcolor">14</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_14" data-mini="true"><label title="冠亚-14" for="GOLD_SILVER-NO_14">0.00</label></fieldset></td>            
            </tr>
            <tr>
                <td class="td-bgcolor">15</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_15" data-mini="true"><label title="冠亚-15" for="GOLD_SILVER-NO_15">0.00</label></fieldset></td>
                <td class="td-bgcolor">16</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_16" data-mini="true"><label title="冠亚-16" for="GOLD_SILVER-NO_16">0.00</label></fieldset></td>
                <td class="td-bgcolor">17</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_17" data-mini="true"><label title="冠亚-17" for="GOLD_SILVER-NO_17">0.00</label></fieldset></td>
            </tr>
            <tr>
            	<td class="td-bgcolor">18</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_18" data-mini="true"><label title="冠亚-18" for="GOLD_SILVER-NO_18">0.00</label></fieldset></td>
                <td class="td-bgcolor">19</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-NO_19" data-mini="true"><label title="冠亚-19" for="GOLD_SILVER-NO_19">0.00</label></fieldset></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </tr>
        </table>
        <table border="1" class="hdptable">
            <tr width="100%" class="tr-bgcolor">
                <th colspan="4">两面</th>
            </tr>
             <tr>
                <td class="td-bgcolor">{[{5Yag5Lqa5aSn}]}</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-BIG" data-mini="true"><label title="冠亚-大" for="GOLD_SILVER-BIG">0.00</label></fieldset></td>
                <td class="td-bgcolor">{[{5Yag5Lqa5bCP}]}</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-SMALL" data-mini="true"><label title="冠亚-小" for="GOLD_SILVER-SMALL">0.00</label></fieldset></td>
                
            </tr>
            <tr>
            <td class="td-bgcolor">{[{5Yag5Lqa5Y2V}]}</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-ODD" data-mini="true"><label title="冠亚-单" for="GOLD_SILVER-ODD">0.00</label></fieldset></td>
            <td class="td-bgcolor">{[{5Yag5Lqa5Y+M}]}</td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="tid" id="GOLD_SILVER-EVEN" data-mini="true"><label title="冠亚-双" for="GOLD_SILVER-EVEN">0.00</label></fieldset></td>
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