<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
</head>
<body>
	<div data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<c:set var="page_title" value="组{[{6YCJ}]}六" />
		<%@ include file="/WEB-INF/page/qxc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/qxc/panel_left_qxc.jsp" %>
		<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
		<div data-role="content" id="rateRefInfo">
			<div style="text-align: center;">
			 <div class="ui-on-lottery">	
	            <div id="openball" alt="ob" class="ob">
	            </div>
	            <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" id="s_is"></span> 期 <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
	            </div>
	        </div>
	        <div class="list_dingtime">
	        <div data-role="navbar">
	        	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'5001') || fn:contains(obj.gcl,'5002') || fn:contains(obj.gcl,'5003')}">
			    <ul>
			   		<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'5001')}">
				    	<li><a href="#" ${obj.gameCode == 5001 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('5001')">{[{5YmN5LiJ}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'5002')}">
				    	<li><a href="#" ${obj.gameCode == 5002 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('5002')">{[{5Lit5LiJ}]}</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'5003')}">
				    	<li><a href="#" ${obj.gameCode == 5003 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('5003')">{[{5ZCO5LiJ}]}</a></li>
			    	</c:if>
			    </ul>
			    </c:if>
			</div>
			<div class="table-cotent-lottery">   
			<div style="margin:2px; 0;"></div>
	        <div class="mainframe01">
	            <div class="min-overflow" id="h_div">
	                <div class="div01">
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	                <div class="div02">
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">号码</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_012"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="012" data-mini="true"><label for="012">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_013"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="013" data-mini="true"><label for="013">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_014"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="014" data-mini="true"><label for="014">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_015"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="015" data-mini="true"><label for="015">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_016"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="016" data-mini="true"><label for="016">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_017"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="017" data-mini="true"><label for="017">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_018"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="018" data-mini="true"><label for="018">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_019"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="019" data-mini="true"><label for="019">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_023"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="023" data-mini="true"><label for="023">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_024"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="024" data-mini="true"><label for="024">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_025"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="025" data-mini="true"><label for="025">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_026"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="026" data-mini="true"><label for="026">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_027"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="027" data-mini="true"><label for="027">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_028"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="028" data-mini="true"><label for="028">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_029"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="029" data-mini="true"><label for="029">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_034"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="034" data-mini="true"><label for="034">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_035"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="035" data-mini="true"><label for="035">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_036"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="036" data-mini="true"><label for="036">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_037"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="037" data-mini="true"><label for="037">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_038"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="038" data-mini="true"><label for="038">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_039"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="039" data-mini="true"><label for="039">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_045"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="045" data-mini="true"><label for="045">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_046"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="046" data-mini="true"><label for="046">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_047"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="047" data-mini="true"><label for="047">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_048"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="048" data-mini="true"><label for="048">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_049"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="049" data-mini="true"><label for="049">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_056"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="056" data-mini="true"><label for="056">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_057"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="057" data-mini="true"><label for="057">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_058"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="058" data-mini="true"><label for="058">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_059"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="059" data-mini="true"><label for="059">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_067"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="067" data-mini="true"><label for="067">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_068"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="068" data-mini="true"><label for="068">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_069"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="069" data-mini="true"><label for="069">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_078"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="078" data-mini="true"><label for="078">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_079"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="079" data-mini="true"><label for="079">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_089"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="089" data-mini="true"><label for="089">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_123"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="123" data-mini="true"><label for="123">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_124"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="124" data-mini="true"><label for="124">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_125"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="125" data-mini="true"><label for="125">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_126"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="126" data-mini="true"><label for="126">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_127"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="127" data-mini="true"><label for="127">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_128"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="128" data-mini="true"><label for="128">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_129"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="129" data-mini="true"><label for="129">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_134"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="134" data-mini="true"><label for="134">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_135"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="135" data-mini="true"><label for="135">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_136"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="136" data-mini="true"><label for="136">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_137"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="137" data-mini="true"><label for="137">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_138"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="138" data-mini="true"><label for="138">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_139"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="139" data-mini="true"><label for="139">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_145"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="145" data-mini="true"><label for="145">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_146"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="146" data-mini="true"><label for="146">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_147"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="147" data-mini="true"><label for="147">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_148"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="148" data-mini="true"><label for="148">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_149"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="149" data-mini="true"><label for="149">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_156"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="156" data-mini="true"><label for="156">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_157"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="157" data-mini="true"><label for="157">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_158"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="158" data-mini="true"><label for="158">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_159"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="159" data-mini="true"><label for="159">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_167"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="167" data-mini="true"><label for="167">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_168"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="168" data-mini="true"><label for="168">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_169"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="169" data-mini="true"><label for="169">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_178"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="178" data-mini="true"><label for="178">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_179"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="179" data-mini="true"><label for="179">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_189"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="189" data-mini="true"><label for="189">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_234"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="234" data-mini="true"><label for="234">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_235"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="235" data-mini="true"><label for="235">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_236"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="236" data-mini="true"><label for="236">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_237"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="237" data-mini="true"><label for="237">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_238"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="238" data-mini="true"><label for="238">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_239"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="239" data-mini="true"><label for="239">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_245"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="245" data-mini="true"><label for="245">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_246"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="246" data-mini="true"><label for="246">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_247"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="247" data-mini="true"><label for="247">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_248"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="248" data-mini="true"><label for="248">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_249"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="249" data-mini="true"><label for="249">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_345"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="345" data-mini="true"><label for="345">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_346"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="346" data-mini="true"><label for="346">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_347"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="347" data-mini="true"><label for="347">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_348"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="348" data-mini="true"><label for="348">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_349"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="349" data-mini="true"><label for="349">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_356"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="356" data-mini="true"><label for="356">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_357"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="357" data-mini="true"><label for="357">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_358"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="358" data-mini="true"><label for="358">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_359"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="359" data-mini="true"><label for="359">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_367"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="367" data-mini="true"><label for="367">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_368"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="368" data-mini="true"><label for="368">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_369"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="369" data-mini="true"><label for="369">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_378"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="378" data-mini="true"><label for="378">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_379"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="379" data-mini="true"><label for="379">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_389"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="389" data-mini="true"><label for="389">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_456"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="456" data-mini="true"><label for="456">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_457"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="457" data-mini="true"><label for="457">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_458"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="458" data-mini="true"><label for="458">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_459"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="459" data-mini="true"><label for="459">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_467"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="467" data-mini="true"><label for="467">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_468"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="468" data-mini="true"><label for="468">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_469"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="469" data-mini="true"><label for="469">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_478"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="478" data-mini="true"><label for="478">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_479"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="479" data-mini="true"><label for="479">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_489"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="489" data-mini="true"><label for="489">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_567"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="567" data-mini="true"><label for="567">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_568"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="568" data-mini="true"><label for="568">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_569"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="569" data-mini="true"><label for="569">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_578"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="578" data-mini="true"><label for="578">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_589"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="589" data-mini="true"><label for="589">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_678"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="678" data-mini="true"><label for="678">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_689"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="689" data-mini="true"><label for="689">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_789"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="789" data-mini="true"><label for="789">0.00</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>	        
		</div>
		<a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 500);" class="ui-btn-top" data-role="button">返回顶部</a></p><!-- 回到顶部 -->
		</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/page/qxc/com_bet.jsp" %>
</body>
<script type="text/javascript">
function changeHandType(){
	getRate($("#gameCode").val());
}
$(function(){
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gameCode").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	
	getRate($("#gameCode").val());
	
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
	
    $("#orderBtn").on("click",function(e) {
    	$('#h_title').text(replaceAllHtml('${page_title}') +' - '+ $("ul .ui-btn-active").text());
    	
        enableSubmitBtn();
		if ($("input:checked").length == 0) {
	        alert("请先选择号码!");
	    } else {
	    	$("#issue").val($("#s_is").text());
	    	$("#isid").text($("#s_is").text());
	        var ot = $("#orderTable");
	        ot.children("tbody").remove();
	        var tbody = $("<tbody></tbody>");
	        $("input:checked").each(function (i) {
	            var o = $("label[for='" + $(this).attr("id") + "']");
	            var str = "";
	            var temStr = "";
	            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	            str += temStr + $("#t_" + $(this).attr("id")).text() + "</span>";
	            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + o.text() + "</span>";
	            str += "<input type='hidden' name='type' value='" + $(this).attr("id") + "'>";
	            str += "<input type='hidden' name='rate' value='" + o.text() + "'></td>";
	            str += "<td align='right' class='tdselect' style='border:none;'><span>"
	            str += "<input type='number' min='1' max='50000' name='amount' class='numb_px' data-role='none'/>";
	            str += "<input type='button' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'/>";
	            str += "<input type='button' value='删' rel='d' s='" + o.attr("for") + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
	            $(str).appendTo(tbody);
	        });
	        var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
	        tst += tst;
	        $(tst).appendTo(tbody);
	        ot.append(tbody);
	        $.mobile.changePage("#toBet", {changeHash:false ,transition:'none'});
	        getUserInfo();
	    }
    });
    <%--下*_*注页面点击删按钮--%>
    $(document).on("click","input[rel='d']",function(e){
       	$("#"+$(this).attr("s")).prop("checked",false).checkboxradio("refresh");
		var b = $(this).parent().parent().parent().siblings().length;
	    $(this).parent().parent().parent().remove();
	    if($("input:checked").length>0){
	    	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
	    if(b == 2){
	        $.mobile.changePage("#rateInfoPage", {transition:'none'});
	    	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	    	var str = "changeBetOn('" + $("#bon").val() + "')";
	    	$("[onclick='" + str + "']").addClass("ui-btn-active");
	    }
    });
    <%--下*_*注页面，点击填按钮--%>
    $(document).on("click","input[rel='w']",function(e){
    	var num = 5;
		if(''!=$(this).prev().val()){
	        num = $(this).prev().val();
		}
		var o = $("[name='amount']");
		for(var j = 0; j < o.length; j++){
			o[j].value = num;
		}
    });
    
    $("#submitBtn").on("click",function(){
    	var checkR = checkParam();
		if(checkR){
			var tobj = $("[name='type']");
			var betBall = "";
			for(var i=0;i<tobj.length;i++){
				betBall +=  tobj[i].value + ",";
			}
			var robj = $("[name='rate']");
			var rateAll = "";
			for(var i=0;i<robj.length;i++){
				rateAll +=  robj[i].value + ",";
			}
			var aobj = $("[name='amount']");
			var betAmount = "";
			for(var i=0;i<aobj.length;i++){
				betAmount +=  aobj[i].value + ",";
			}
			$("#betBall").val(betBall.substring(0, betBall.length-1));
			$("#rateAll").val(rateAll.substring(0, rateAll.length-1));
			$("#betAmount").val(betAmount.substring(0, betAmount.length-1));
			subOrder();
		}
    });
});

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit(replaceAllHtml("{[{5rOo}]}单提交中，请稍后..."));
	var url = ctx + '/qxc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.code == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
                    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
                    var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	alert(jsonResult.data.description);
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                }
			}else{
				alert('系统错误！');
				$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                $.mobile.changePage("#rateInfoPage", {transition:'none'});
			}
		}else{
			alert('系统错误！');
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
		}
	},"json");

    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	hideLoader();
		if(textStatus == 'error'){
			console.log("error:" + jqXHR.responseText);
		}else if(textStatus == 'parsererror'){
			if(jqXHR.responseText.indexOf("session invalidate") > -1){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";					
			}else{
				console.log("parsererror:" + jqXHR.responseText);
			}
		} 
    });
    	
    jqxhr.always(function() {
    	$("#isChange").val("0");
    	$("ul li .ui-btn-active").removeClass("ui-btn-active");
    	var str = "changeGame('" + $("#gameCode").val() + "')";
    	$("[onclick='" + str + "']").addClass("ui-btn-active");
	});	
}

function enableSubmitBtn(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
}

function checkParam(){
	var obj = $("[name='amount']");
	var te= /^[1-9]+[0-9]*]*$/;
	for(var i = 0; i < obj.length; i++){
		if(!te.test(obj[i].value)){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
			return false;
		}
		if(parseInt(obj[i].value)<parseInt($("#mi").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能低于单{[{5rOo}]}最低限额' + $("#mi").val());alert(btem);
			return;
		}
		if(parseInt(obj[i].value)>parseInt($("#mx").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能高于单{[{5rOo}]}最高限额' + $("#mx").val());alert(btem);
			return;
		}
	}
	if($("#issue").val()!=$("#s_is").text()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
		return false;
	}
	return true;
}


function getUserInfo(){
	var url = ctx + '/qxc/getUserInfo?t=' + new Date().getTime();
	$.get(url,function(jsonResult, status){
		if(status=="success"){
			var obj = eval('(' + jsonResult + ')');
			if(obj.r==0){
				$("#anid").html(obj.data.an + "&nbsp;&nbsp;");
				$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
			}
		}
	});
}

var s_is = '';
var s_ob = '';
var s_ot = '';
var s_st = '';
var s_io = '';// 封：0，开*盘*中为：1
var s_flag = 0;
function getRate(game,px,tj){
	var url = ctx + '/qxc/getRateInfo';
	var pk = ss.getItem("pk");
	$.get(url,{game:game,px:px,tj:tj,pk:pk},function(jsonResult){
		var obj = eval('(' + jsonResult + ')');
		if(obj.r==0){
			if(obj.data.code==0){
				s_is = obj.data.issue;
				s_ob = obj.data.ob;
				s_ot = obj.data.ot;
				s_io = obj.data.io;
				s_st = obj.data.st;
				s_flag = 1;
				$("#mi").val(obj.data.mi);
				$("#mx").val(obj.data.mx);
				$("#tm").val(obj.data.tm);
				$("#comm").val(obj.data.c);
				var rateObj = eval('(' + obj.data.rate + ')');
				for(o in rateObj){
					var value = rateObj[o][1];
					$("#t_"+o).text(rateObj[o][0]);
					var ro = $('[for="'+ o +'"]');
					if((value + "").split(".").length == 1){
						value = value + ".00";
					}
					
					if(rateObj[o][2] == 0 && s_io == 1){
						ro.text('封单');
						$("#"+o).prev().css('color','red');
						$("#"+o).attr("checked", false).checkboxradio("refresh").checkboxradio("disable");
					} else {
						if(s_io == 1 && $("#"+o).prop('checked') == 0){
							$("#"+o).checkboxradio("enable").prev().css('color','#000000');
						}
						ro.text(value);
					}
				}
			}else if(obj.data.code==2){
				var btem = replaceAllHtml('该玩法已经隐藏，不能{[{5oqV5rOo}]}!');alert(btem);
				window.location.href = ctx + "/qxc";
			}
		}else{
			var obj = eval('(' + jsonResult + ')');
			alert(obj.m);
			window.location.href = ctx + "/index";
		}
	});
}
var otime = 20;<%--开*_*盘请求间隔时间--%>
var stime = otime;
setInterval(function(){
	stime--;
	if(stime<=0){
		stime=otime;
		getRate($("#gameCode").val());
	}
	if(s_flag == 1){
		setOpenBall(s_ob);
		countdown();
		$("#s_is").text(s_is);
		if(s_io==0){
			$("#close_id").html(' 已封盘');
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			$("input[type='radio']").checkboxradio("disable");
		}
	}
},1000);

function countdown(){
	$countdown = $("#cdt").countdown(s_st);
	$countdown.on('update.countdown' , function(event) {
     	var totalHours = event.offset.totalDays * 24 + event.offset.hours;
     	if(s_io==0){
     		$("#cdt").html('');
     	}else{
     		$("#close_id").html('');
     		$("#cdt").html('<font color="black">&nbsp;距封盘 </font>' + event.strftime(totalHours + ':%M:%S'));
     	}
     });
     $countdown.on('finish.countdown' , function(event) {
     	//getRate();
     });
}
function setOpenBall(balls){
	var ball = balls.split(',');
	var str = '';
	for(var i=0;i<ball.length;i++){
		//<div class="ball2 red-ball float-l" ball="2">2</div>
		var tcl = '';//ball red-ball
		if(i<4){
			tcl = 'border-color-r ball-result float-l';
		}else if(i>3&&i<7){
			tcl = 'border-color-b ball-result float-l';
		}else{
			tcl = 'border-color-g ball-result float-l';
		}
		if(i==4){
			str += '<div class="b-txt">+</div>'
		}
		str += '<div class="' + tcl + '" ball="2">' + ('' == ball[i] ? '?' : ball[i]) + '</div>';
	}
	$("#openball").html(str);
}
function changeGame(game){
	if(game != $("#gameCode").val()){
		showLoader();
		$("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGame('" + game + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
		$("#gameCode").val(game);
		$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
        $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
		$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").removeClass('spnicon').text('');
		getRate($("#gameCode").val());
		setTimeout(function(){
			hideLoader();
			},300);
	}
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>