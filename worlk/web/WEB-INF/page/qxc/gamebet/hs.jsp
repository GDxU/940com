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
		<c:set var="page_title" value="{[{5ZKM5pWw}]}" />
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
			    <ul>
			    	<li>
			    		<select id="gamec" onchange="changeTJ()">
			    			<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4701') || fn:contains(obj.gcl,'4703')}">
			    				<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4701')}">
				    			<option value="4701">二字{[{5ZKM}]}</option>
				    			</c:if>
				    			<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'4703')}">
				    			<option value="4703">四字{[{5ZKM}]}</option>
				    			</c:if>
				    		</c:if>
				    	</select>
			    	</li>
			    </ul>
			</div>
			
	        <div id="ezh" data-role="navbar" data-mini="true">
			    <ul>
		    		<li><a href="#" class="ui-btn-active" data-ajax="false" onclick="changeZh(1,'千百{[{5ZKM}]}')">千百和</a></li>
			    	<li><a href="#" data-ajax="false" onclick="changeZh(2,'千十{[{5ZKM}]}')">千十{[{5ZKM}]}</a></li>
			    	<li><a href="#" data-ajax="false" onclick="changeZh(3,'千个{[{5ZKM}]}')">千个{[{5ZKM}]}</a></li>
			    </ul>
			    <ul>
			    	<li><a href="#" data-ajax="false" onclick="changeZh(4,'百十{[{5ZKM}]}')">百十{[{5ZKM}]}</a></li>
			    	<li><a href="#" data-ajax="false" onclick="changeZh(5,'百个{[{5ZKM}]}')">百个{[{5ZKM}]}</a></li>
			    	<li><a href="#" data-ajax="false" onclick="changeZh(6,'个十{[{5ZKM}]}')">个十{[{5ZKM}]}</a></li>
			    </ul>
			</div>
			<input type="hidden" id="zhid" value="1"/>
			<input type="hidden" id="zh" value="千百{[{5ZKM}]}"/>
			<input type="hidden" id="zhOld" value=""/>
			
			<div class="table-cotent-lottery">  
	        <div class="mainframe01" id="main1">
	            <div class="min-overflow">
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
	                <div class="o-number line-color brl-1"><span id="t_N_0">0</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_0" data-mini="true"><label id="" for="N_0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_1">1</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_1" data-mini="true"><label id="" for="N_1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_N_2">2</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_2" data-mini="true"><label id="" for="N_2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_3">3</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_3" data-mini="true"><label id="" for="N_3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_N_4">4</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_4" data-mini="true"><label id="" for="N_4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_5">5</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_5" data-mini="true"><label id="" for="N_5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_N_6">6</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_6" data-mini="true"><label id="" for="N_6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_7">7</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_7" data-mini="true"><label id="" for="N_7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_N_8">8</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_8" data-mini="true"><label id="" for="N_8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_8">9</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_9" data-mini="true"><label id="" for="N_9">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_N_10">10</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_10" data-mini="true"><label id="" for="N_10">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_11">11</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_11" data-mini="true"><label id="" for="N_11">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_N_12">12</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_12" data-mini="true"><label id="" for="N_12">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_13">13</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_13" data-mini="true"><label id="" for="N_13">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_N_14">14</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_14" data-mini="true"><label id="" for="N_14">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_15">15</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_15" data-mini="true"><label id="" for="N_15">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_N_16">16</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_16" data-mini="true"><label id="" for="N_16">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_N_17">17</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_17" data-mini="true"><label id="" for="N_17">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_N_18">18</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="N_18" data-mini="true"><label id="" for="N_18">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"></div>
	                <div class="b-number brl-1"></div>
	            </div>
	            
	            <p></p>
	            <div class="min-overflow sm-mg-15">
	                <div class="div01">
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	                <div class="div02">
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	            </div>
	            
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_B_0">0</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_0" data-mini="true"><label id="" for="B_0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_B_1">1</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_1" data-mini="true"><label id="" for="B_1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_B_2">2</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_2" data-mini="true"><label id="" for="B_2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_B_3">3</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_3" data-mini="true"><label id="" for="B_3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_B_4">4</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_4" data-mini="true"><label id="" for="B_4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_B_5">5</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_5" data-mini="true"><label id="" for="B_5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_B_6">6</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_6" data-mini="true"><label id="" for="B_6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_B_7">7</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_7" data-mini="true"><label id="" for="B_7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_B_8">8</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_8" data-mini="true"><label id="" for="B_8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_B_9">9</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="B_9" data-mini="true"><label id="" for="B_9">0.00</label></fieldset></div>
	            </div>
	            
	            <div class="clear"></div>
	        </div>
	        
	        <div class="mainframe01" id="main2" style="display:none">
	            <div class="min-overflow">
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
	                <div class="o-number line-color brl-1"><span id="t_S_N_0">1-10</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_0" data-mini="true"><label id="" for="S_N_0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_1">11</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_1" data-mini="true"><label id="" for="S_N_1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_N_2">12</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_2" data-mini="true"><label id="" for="S_N_2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_3">13</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_3" data-mini="true"><label id="" for="S_N_3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_N_4">14</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_4" data-mini="true"><label id="" for="S_N_4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_5">15</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_5" data-mini="true"><label id="" for="S_N_5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_N_6">16</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_6" data-mini="true"><label id="" for="S_N_6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_7">17</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_7" data-mini="true"><label id="" for="S_N_7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_N_8">18</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_8" data-mini="true"><label id="" for="S_N_8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_9">19</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_9" data-mini="true"><label id="" for="S_N_9">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_N_10">20</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_10" data-mini="true"><label id="" for="S_N_10">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_11">21</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_11" data-mini="true"><label id="" for="S_N_11">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_N_12">22</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_12" data-mini="true"><label id="" for="S_N_12">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_13">23</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_13" data-mini="true"><label id="" for="S_N_13">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_N_14">24</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_14" data-mini="true"><label id="" for="S_N_14">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_N_15">25-36</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_N_15" data-mini="true"><label id="" for="S_N_15">0.00</label></fieldset></div>
	            </div>
	            
	            <p></p>
	            <div class="min-overflow sm-mg-15">
	                <div class="div01">
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	                <div class="div02">
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                    <div class="o-number title-setting brl-1">尾数</div>
	                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
	                </div>
	            </div>
	            
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_B_0">0</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_0" data-mini="true"><label id="" for="S_B_0">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_B_1">1</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_1" data-mini="true"><label id="" for="S_B_1">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_B_2">2</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_2" data-mini="true"><label id="" for="S_B_2">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_B_3">3</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_3" data-mini="true"><label id="" for="S_B_3">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_B_4">4</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_4" data-mini="true"><label id="" for="S_B_4">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_B_5">5</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_5" data-mini="true"><label id="" for="S_B_5">0.00</label></fieldset></div>
	            </div>
	            <div class="div02">
	                <div class="o-number line-color brl-1"><span id="t_S_B_6">6</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_6" data-mini="true"><label id="" for="S_B_6">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_B_7">7</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_7" data-mini="true"><label id="" for="S_B_7">0.00</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="o-number line-color brl-1"><span id="t_S_B_8">8</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_8" data-mini="true"><label id="" for="S_B_8">0.00</label></fieldset></div>
	                <div class="o-number line-color brl-1"><span id="t_S_B_9">9</span></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" id="S_B_9" data-mini="true"><label id="" for="S_B_9">0.00</label></fieldset></div>
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
var B_0_1 = [],B_0_2 = [],B_0_3 = [],B_1_2 = [],B_1_3 = [],B_2_3 = [];
var N_0_1 = [],N_0_2 = [],N_0_3 = [],N_1_2 = [],N_1_3 = [],N_2_3 = [];

<%-- //切换pan口，重新加载价格--%>
function changeHandType(){
	getRate($("#gameCode").val());
}
$(function(){
	
	changeTJ();
	<%-- //选择号码下单--%>
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text($("input:checked").length);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
    
    <%-- //点击zhu单按钮，展示zhu单--%>
    $("#orderBtn").on("click",function(e) {
    	$('#h_title').text(replaceAllHtml('${page_title}') +' - '+ $("#gamec").find("option:selected").text());
    	
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
	            var str = "",w = '';
				if($(this).attr('id').indexOf('B_') > -1){
	        		w = '尾';
	        	}
	            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
	            str += $('#zh').val() + w + '@' + $("#t_" + $(this).attr("id")).text() + '  ' + "</span>";
	            str += "<span class='spannum2'>&nbsp;@</span> <span class='spannum3'>"  + o.text() + "</span>";
	            str += "<input type='hidden' name='type' value='" + o.attr("id") + "'>";
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
    
    <%-- //下单页面点击删按钮--%>
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
	    	//$("ul li .ui-btn-active").removeClass("ui-btn-active");
	    	var str = "changeBetOn('" + $("#bon").val() + "')";
	    	$("[onclick='" + str + "']").addClass("ui-btn-active");
	    }
    });
    
    <%-- //下单页面，点击填按钮--%>
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
    
    <%-- //提交zhu单 --%>
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
    	if($('#zhid').val() != undefined && $('#zhid').val().length > 0){
    		$("[onclick='changeZh(" + $('#zhid').val() + ",'" + $('#zh').val() + "')']").addClass("ui-btn-active");
    	}
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

function claerRate(){
	B_0_1 = [];B_0_2 = [];B_0_3 = [];B_1_2 = [];B_1_3 = [];B_2_3 = [];
	N_0_1 = [];N_0_2 = [];N_0_3 = [];N_1_2 = [];N_1_3 = [];N_2_3 = [];
}

var s_is = '';
var s_ob = '';
var s_ot = '';
var s_st = '';
var s_io = '';<%-- 封：0，开*pan*中为：1 --%>
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
				claerRate();
				for(o in rateObj){
					var t = o.split("_");
					eval(o.substring(0,5)).push([t[3],rateObj[o][1],o]);
				}
				if($('#gameCode').val() == '4701'){
					showRate($('#zhid').val());
				} else {
					showRate(1,1)
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
var otime = 20;<%-- 开盘请求间隔时间 --%>
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
			$("#close_id").html(replaceAllHtml(' 已封{[{55uY}]}'));
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			$("input[type='radio']").checkboxradio("disable");
		}else{
			$("#close_id").html('');
			$("input[type='checkbox']").checkboxradio("enable");
			$("input[type='radio']").checkboxradio("enable");
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

<%-- 切换组合 --%>
function changeZh(zh,zhStr){
	showLoader();
	if(zh != $('#zhid').val()){
		$('#zhid').val(zh);
	}
	if(zhStr != $('#zh').val()){
		$('#zhOld').val(zhStr);
		$('#zh').val(zhStr);
		
		$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
	    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").removeClass('spnicon').text('');
	}
	showRate(zh);
	setTimeout(function(){
		hideLoader();
		},300);
}

<%-- 展示数据 --%>
function showRate(zh,Prefix){
	
	if(Prefix == 1){
		Prefix = 'S_';
	} else {
		Prefix = '';
	}
	if (zh == 1) {
		zh = '0_1';
	} else if (zh == 2) {
		zh = '0_2';
	} else if (zh == 3) {
		zh = '0_3';
	} else if (zh == 4) {
		zh = '1_2';
	} else if (zh == 5) {
		zh = '1_3';
	} else if (zh == 6) {
		zh = '2_3';
	} else {
		zh = '0_1';
	}
	var Nary = eval('N_'+zh),Bary = eval('B_'+zh);
	for(i in Nary){
		var value = Nary[i][1];
		if((value + "").split(".").length == 1){
			value = value + ".00";
		}
		$('[for=' + Prefix + 'N_' + Nary[i][0] + ']').text(value).attr("id",Nary[i][2]);
	}
	for(i in Bary){
		var value = Bary[i][1];
		if((value + "").split(".").length == 1){
			value = value + ".00";
		}
		$('[for=' + Prefix + 'B_' + Bary[i][0] + ']').text(value).attr("id",Bary[i][2]);
	}
}

function changeGame(index){
	//$('.mainframe01').hide().eq(index - 1).show();
	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
}

function changeTJ(){
	showLoader();
	var gc = $("#gamec").find("option:selected").val();

	if(gc == '4703'){
		$('#zhOld').val($('#zh').val());
		$('#zh').val(replaceAllHtml('{[{5ZKM}]}'));
		$('#ezh').hide();
		$('#main1').hide();
		$('#main2').show();
	} else if(gc == '4701') {
		if($('#zhOld').val() != '' && $('#zhOld').val() != $('#zh').val()){
			$('#zh').val($('#zhOld').val());
		}
		$('#ezh').show();
		$('#main1').show();
		$('#main2').hide();
	} else {
		$('#ezh').hide();
		$('#main1').hide();
		$('#main2').hide();
	}
	
	if(gc!=$("#gameCode").val()){
		$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
	    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
	    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").removeClass('spnicon').text('');
		$("#gameCode").val(gc);
	}
	
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	if(gc != '4703' && $("[onclick='changeZh(" + $('#zhid').val() + ",'" + $('#zh').val() + "')']").size() <= 0){
		$('#zhid').val(1);
		$('#zh').val(replaceAllHtml('千百{[{5ZKM}]}'));
		$('#zhOld').val('');
	}
	$("[onclick='changeZh(" + $('#zhid').val() + ",'" + $('#zh').val() + "')']").addClass("ui-btn-active");
	
	setTimeout(function(){
		hideLoader();
		},300);
	getRate($("#gameCode").val());
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>