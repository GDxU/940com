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
		<c:set var="page_title" value="四{[{5a6a}]}位" />
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
	        <div data-role="navbar" data-mini="true">
	        	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3501') || fn:contains(obj.gcl,'3502') || fn:contains(obj.gcl,'3503')}">
			    <ul>
			    	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3501')}">
			    		<li><a href="#" ${obj.gameCode == 3501 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3501')">口口XX</a></li>
			    	</c:if>
			    	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3502')}">
				    	<li><a href="#" ${obj.gameCode == 3502 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3502')">口X口X</a></li>
				    </c:if>
			    	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3503')}">
				    	<li><a href="#" ${obj.gameCode == 3503 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3503')">口XX口</a></li>
			    	</c:if>
			    </ul>
			    </c:if>
			    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3504') || fn:contains(obj.gcl,'3505') || fn:contains(obj.gcl,'3506')}">
			    <ul>
			    	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3504')}">
				    	<li><a href="#" ${obj.gameCode == 3504 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3504')">X口口X</a></li>
				    </c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3505')}">
				    	<li><a href="#" ${obj.gameCode == 3505 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3505')">X口X口</a></li>
				   	</c:if>
				    <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3506')}">
				    	<li><a href="#" ${obj.gameCode == 3506 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('3506')">XX口口</a></li>
			    	</c:if>
			    </ul>
			    </c:if>
			</div>
			<br>
			<input type="hidden" id="tj" value=""/>
			<div data-role="navbar" data-mini="true">
			    <ul style="margin-top:-20px; margin-bottom: -20px;">
			        <li class="w5"><span id="tj_a" style="float:left; margin-top:15px; font-weight:bold; width:100%; text-align: center;">千位</span></li>
			    	<li class="w45"><select id="tj_va" onchange="changeTJ()">
				    		<option value="0">0</option>
				    		<option value="1">1</option>
				    		<option value="2">2</option>
				    		<option value="3">3</option>
				    		<option value="4">4</option>
				    		<option value="5">5</option>
				    		<option value="6">6</option>
				    		<option value="7">7</option>
				    		<option value="8">8</option>
				    		<option value="9">9</option>
				    	</select>
			    	</li>
			    	<li class="w5"><span id="tj_b" style="float:left; margin-top:15px; font-weight:bold; width:100%; text-align: center;">百位</span></li>
			    	<li class="w45">
				    	<select id="tj_vb" onchange="changeTJ()">
				    		<option value="0">0</option>
				    		<option value="1">1</option>
				    		<option value="2">2</option>
				    		<option value="3">3</option>
				    		<option value="4">4</option>
				    		<option value="5">5</option>
				    		<option value="6">6</option>
				    		<option value="7">7</option>
				    		<option value="8">8</option>
				    		<option value="9">9</option>
				    	</select>
			    	</li>
			    </ul>
			</div>
			<br>
			<div class="table-cotent-lottery">   
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
	                <div class="o-number line-color brl-1"><span id="t_00">00XX</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="00" data-mini="true"><label for="00">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_01">01XX</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="01" data-mini="true"><label for="01">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_02">02XX</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="02" data-mini="true"><label for="02">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_03">03XX</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="03" data-mini="true"><label for="03">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_04"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="04" data-mini="true"><label for="04">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_05"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="05" data-mini="true"><label for="05">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_06"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="06" data-mini="true"><label for="06">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_07"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="07" data-mini="true"><label for="07">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_08"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="08" data-mini="true"><label for="08">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_09"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="09" data-mini="true"><label for="09">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_10"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="10" data-mini="true"><label for="10">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_11"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="11" data-mini="true"><label for="11">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_12"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="12" data-mini="true"><label for="12">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_13"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="13" data-mini="true"><label for="13">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_14"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="14" data-mini="true"><label for="14">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_15"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="15" data-mini="true"><label for="15">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_16"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="16" data-mini="true"><label for="16">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_17"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="17" data-mini="true"><label for="17">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_18"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="18" data-mini="true"><label for="18">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_19"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="19" data-mini="true"><label for="19">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_20"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="20" data-mini="true"><label for="20">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_21"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="21" data-mini="true"><label for="21">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_22"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="22" data-mini="true"><label for="22">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_23"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="23" data-mini="true"><label for="23">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_24"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="24" data-mini="true"><label for="24">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_25"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="25" data-mini="true"><label for="25">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_26"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="26" data-mini="true"><label for="26">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_27"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="27" data-mini="true"><label for="27">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_28"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="28" data-mini="true"><label for="28">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_29"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="29" data-mini="true"><label for="29">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_30"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="30" data-mini="true"><label for="30">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_31"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="31" data-mini="true"><label for="31">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_32"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="32" data-mini="true"><label for="32">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_33"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="33" data-mini="true"><label for="33">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_34"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="34" data-mini="true"><label for="34">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_35"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="35" data-mini="true"><label for="35">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_36"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="36" data-mini="true"><label for="36">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_37"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="37" data-mini="true"><label for="37">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_38"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="38" data-mini="true"><label for="38">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_39"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="39" data-mini="true"><label for="39">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_40"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="40" data-mini="true"><label for="40">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_41"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="41" data-mini="true"><label for="41">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_42"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="42" data-mini="true"><label for="42">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_43"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="43" data-mini="true"><label for="43">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_44"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="44" data-mini="true"><label for="44">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_45"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="45" data-mini="true"><label for="45">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_46"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="46" data-mini="true"><label for="46">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_47"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="47" data-mini="true"><label for="47">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_48"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="48" data-mini="true"><label for="48">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_49"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="49" data-mini="true"><label for="49">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_50"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="50" data-mini="true"><label for="50">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_51"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="51" data-mini="true"><label for="51">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_52"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="52" data-mini="true"><label for="52">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_53"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="53" data-mini="true"><label for="53">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_54"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="54" data-mini="true"><label for="54">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_55"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="55" data-mini="true"><label for="55">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_56"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="56" data-mini="true"><label for="56">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_57"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="57" data-mini="true"><label for="57">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_58"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="58" data-mini="true"><label for="58">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_59"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="59" data-mini="true"><label for="59">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_60"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="60" data-mini="true"><label for="60">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_61"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="61" data-mini="true"><label for="61">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_62"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="62" data-mini="true"><label for="62">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_63"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="63" data-mini="true"><label for="63">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_64"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="64" data-mini="true"><label for="64">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_65"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="65" data-mini="true"><label for="65">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_66"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="66" data-mini="true"><label for="66">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_67"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="67" data-mini="true"><label for="67">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_68"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="68" data-mini="true"><label for="68">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_69"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="69" data-mini="true"><label for="69">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_70"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="70" data-mini="true"><label for="70">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_71"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="71" data-mini="true"><label for="71">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_72"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="72" data-mini="true"><label for="72">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_73"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="73" data-mini="true"><label for="73">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_74"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="74" data-mini="true"><label for="74">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_75"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="75" data-mini="true"><label for="75">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_76"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="76" data-mini="true"><label for="76">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_77"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="77" data-mini="true"><label for="77">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_78"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="78" data-mini="true"><label for="78">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_79"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="79" data-mini="true"><label for="79">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_80"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="80" data-mini="true"><label for="80">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_81"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="81" data-mini="true"><label for="81">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_82"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="82" data-mini="true"><label for="82">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_83"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="83" data-mini="true"><label for="83">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_84"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="84" data-mini="true"><label for="84">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_85"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="85" data-mini="true"><label for="85">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_86"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="86" data-mini="true"><label for="86">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_87"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="87" data-mini="true"><label for="87">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_88"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="88" data-mini="true"><label for="88">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_89"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="89" data-mini="true"><label for="89">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_90"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="90" data-mini="true"><label for="90">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_91"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="91" data-mini="true"><label for="91">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_92"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="92" data-mini="true"><label for="92">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_93"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="93" data-mini="true"><label for="93">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_94"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="94" data-mini="true"><label for="94">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_95"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="95" data-mini="true"><label for="95">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_96"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="96" data-mini="true"><label for="96">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_97"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="97" data-mini="true"><label for="97">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_98"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="98" data-mini="true"><label for="98">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_99"></span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="99" data-mini="true"><label for="99">0.00</label></fieldset></div>
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
<%--切换盘口，重新加载赔率--%>
function changeHandType(){
	getRate($("#gameCode").val(),"",$("#tj").val());
}
$(function(){
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeGame('" + $("#gameCode").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	getRate($("#gameCode").val(),"",$("#tj").val());
	<%--选择号码下注--%>
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
    <%--点击注单按钮，展示注单--%>
    $("#orderBtn").on("click",function(e) {
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
	            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	            str += $("#t_" + $(this).attr("id")).text() + "</span>";
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
	        $.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
	        getUserInfo();
	    }
    });
    <%--下注页面点击删按钮--%>
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
    <%--提交注*_*单--%>
    $("#submitBtn").on("click",function(){
    	var checkR = checkParam();
		if(checkR){
			var tobj = $("[name='type']");
			var betBall = "";
			for(var i=0;i<tobj.length;i++){
				betBall +=  $("#t_" + tobj[i].value).text() + ",";
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
		//$("#submitBtn").removeClass("ui-state-disabled");
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
var s_io = '';<%-- 封：0，开*盘*中为：1--%>
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
							$("#"+o).checkboxradio("enable");
							$("#"+o).prev().css('color','#000000');
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
var otime = 20;<%--开盘请求间隔时间--%>
var stime = otime;
setInterval(function(){
	stime--;
	if(stime<=0){
		stime=otime;
		getRate($("#gameCode").val(),"",$("#tj").val());
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
			tcl = 'border-color-g2 ball-result float-l';
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
		$("#tj").val("");
		$("#tj_va").val(0).selectmenu("refresh");
		$("#tj_vb").val(0).selectmenu("refresh");
		$("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGame('" + game + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
		$("#gameCode").val(game);
		$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
        $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
        $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").removeClass('spnicon').text('');
		getRate($("#gameCode").val(),"",$("#tj").val());
	}
	if(game==3501){
		$("#tj_a").text("千位");
		$("#tj_b").text("百位");
	}
	if(game==3502){
		$("#tj_a").text("千位");
		$("#tj_b").text("十位");
	}
	if(game==3503){
		$("#tj_a").text("千位");
		$("#tj_b").text("个位");
	}
	if(game==3504){
		$("#tj_a").text("百位");
		$("#tj_b").text("十位");
	}
	if(game==3505){
		$("#tj_a").text("百位");
		$("#tj_b").text("个位");
	}
	if(game==3506){
		$("#tj_a").text("十位");
		$("#tj_b").text("个位");
	}
}

function changeTJ(){
	var tj = $("#tj_va").find("option:selected").val() + "#" + $("#tj_vb").find("option:selected").val();
	if(tj!=$("#tj").val()){
		$("#tj").val(tj);
		//alert($("#tj").val());
		getRate($("#gameCode").val(),"",$("#tj").val());
	}
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>