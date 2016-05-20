<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
    <script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
    <%@include file="hkcutil.jsp"%>
</head>
<body>
<c:set var="title" value="${msg['title.hkc.game10']}" />
<div data-role="page" id="choosePage">
	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
    <%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
    <div data-role="main" class="ui-content">
    <div id="testt"></div>
        <div style="text-align: center;">
        <div class="ui-on-lottery">	
            <div alt="ob" class="ob ">
                <div class=" ball-result float-l">01</div>
                <div class=" ball-result float-l">02</div>
                <div class=" ball-result float-l">33</div>
                <div class=" ball-result float-l">04</div>
                <div class=" ball-result float-l">05</div>
                <div class=" ball-result float-l">06</div>
                <div class=" ball-result float-l">+</div>
                <div class=" ball-result float-l">07</div>
            </div>
            <div class="w100 arr-center font-bold txt-12" mpid="issue"></div>
            </div>
        </div>
        <div class="list_dingtime">
        <c:set var="flag_li" value="0"></c:set>
        <div data-role="navbar" pid="10" data-mini="true">
            <ul>
                <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
                    <c:if test="${pc.isShow}">
                        <c:choose>
                    		<c:when test="${flag_li == 0}">
						    	<li><a gid="${pc.gameCode}" class='ui-btn-active'>${pc.gameName}</a></li>
                    			<c:set var="flag_li" value="1"></c:set>
						    </c:when>
						    <c:otherwise>
					            <li><a gid="${pc.gameCode}">${pc.gameName}</a></li>
					       </c:otherwise>
                    	</c:choose>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
         <div class="table-cotent-lottery">
        <div>
            <input id="lblcsb" type="button" value="快速下{[{5rOo}]}" />
        </div>
        <div class="mainframe01">
            <div class="min-overflow">
                <div class="div01">
                    <div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                    <div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                </div>
                <div class="div02">
                    <div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                    <div class="o-number title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                </div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="1">01</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-1" data-mini="true"><label for="ball-1">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="2">02</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-2" data-mini="true"><label for="ball-2">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="3">03</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-3" data-mini="true"><label for="ball-3">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="4">04</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-4" data-mini="true"><label for="ball-4">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="5">05</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-5" data-mini="true"><label for="ball-5">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="6">06</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-6" data-mini="true"><label for="ball-6">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="7">07</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-7" data-mini="true"><label for="ball-7">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="8">08</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-8" data-mini="true"><label for="ball-8">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="9">09</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-9" data-mini="true"><label for="ball-9">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="10">10</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-10" data-mini="true"><label for="ball-10">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="11">11</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-11" data-mini="true"><label for="ball-11">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="12">12</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-12" data-mini="true"><label for="ball-12">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="13">13</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-13" data-mini="true"><label for="ball-13">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="14">14</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-14" data-mini="true"><label for="ball-14">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="15">15</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-15" data-mini="true"><label for="ball-15">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="16">16</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-16" data-mini="true"><label for="ball-16">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="17">17</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-17" data-mini="true"><label for="ball-17">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="18">18</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-18" data-mini="true"><label for="ball-18">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="19">19</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-19" data-mini="true"><label for="ball-19">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="20">20</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-20" data-mini="true"><label for="ball-20">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="21">21</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-21" data-mini="true"><label for="ball-21">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="22">22</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-22" data-mini="true"><label for="ball-22">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="23">23</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-23" data-mini="true"><label for="ball-23">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="24">24</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-24" data-mini="true"><label for="ball-24">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="25">25</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-25" data-mini="true"><label for="ball-25">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="26">26</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-26" data-mini="true"><label for="ball-26">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="27">27</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-27" data-mini="true"><label for="ball-27">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="28">28</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-28" data-mini="true"><label for="ball-28">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="29">29</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-29" data-mini="true"><label for="ball-29">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="30">30</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-30" data-mini="true"><label for="ball-30">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="31">31</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-31" data-mini="true"><label for="ball-31">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="32">32</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-32" data-mini="true"><label for="ball-32">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="33">33</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-33" data-mini="true"><label for="ball-33">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="34">34</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-34" data-mini="true"><label for="ball-34">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="35">35</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-35" data-mini="true"><label for="ball-35">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="36">36</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-36" data-mini="true"><label for="ball-36">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="37">37</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-37" data-mini="true"><label for="ball-37">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="38">38</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-38" data-mini="true"><label for="ball-38">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="39">39</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-39" data-mini="true"><label for="ball-39">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="40">40</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-40" data-mini="true"><label for="ball-40">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="41">41</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-41" data-mini="true"><label for="ball-41">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="42">42</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-42" data-mini="true"><label for="ball-42">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="43">43</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-43" data-mini="true"><label for="ball-43">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="44">44</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-44" data-mini="true"><label for="ball-44">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="45">45</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-45" data-mini="true"><label for="ball-45">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="46">46</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-46" data-mini="true"><label for="ball-46">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="47">47</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-47" data-mini="true"><label for="ball-47">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="48">48</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-48" data-mini="true"><label for="ball-48">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="49">49</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-49" data-mini="true"><label for="ball-49">0.00</label></fieldset></div>
                <div class="o-number brl-1">&nbsp;</div>
                <div class="o-number brl-1">&nbsp;</div>
            </div>
            <div class="div02">
                <div class="o-number brl-1">&nbsp;</div>
                <div class="o-number brl-1">&nbsp;</div>
                <div class="o-number brl-1">&nbsp;</div>
                <div class="o-number brl-1">&nbsp;</div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-50" data-mini="true"><label for="ball-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-51" data-mini="true"><label for="ball-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-52" data-mini="true"><label for="ball-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-53" data-mini="true"><label for="ball-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">${msg['title.hkc.ball54']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-54" data-mini="true"><label for="ball-54">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">${msg['title.hkc.ball55']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-55" data-mini="true"><label for="ball-55">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">${msg['title.hkc.ball59']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-59" data-mini="true"><label for="ball-59">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">${msg['title.hkc.ball60']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-60" data-mini="true"><label for="ball-60">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">${msg['title.hkc.ball56']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-56" data-mini="true"><label for="ball-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">${msg['title.hkc.ball57']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-57" data-mini="true"><label for="ball-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">${msg['title.hkc.ball58']}</div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-58" data-mini="true"><label for="ball-58">0.00</label></fieldset></div>
                <div class="o-number brl-1">&nbsp;</div>
                <div class="o-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear" style="height:10px;"></div>
        </div>
        <a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="top">返回顶部</a></p>
        </div>
        </div>
    </div>
</div>
<div data-role="page" id="fastChoosePage">
	<c:set var="page_type" value="1" scope="request"/>
    <%@ include file="page_head.jsp"%>
    <div data-role="main" class="ui-content-ks">
        <div style="text-align: center;">
            <div alt="ob" class="ob ">
                <div class=" ball-result float-l">01</div>
                <div class=" ball-result float-l">02</div>
                <div class=" ball-result float-l">33</div>
                <div class=" ball-result float-l">04</div>
                <div class=" ball-result float-l">05</div>
                <div class=" ball-result float-l">06</div>
                <div class=" ball-result float-l">+</div>
                <div class=" ball-result float-l">07</div>
            </div>
            <div class="w100 arr-center font-bold" mpid="issue"></div>
        </div>
        <div class="divider t-line">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSingle">{[{5Y2V}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getDouble">{[{5Y+M}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBig">{[{5aSn}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSmall">{[{5bCP}]}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBigSingle">{[{5aSn}]}{[{5Y2V}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBigDouble">{[{5aSn}]}{[{5Y+M}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSmallSingle">{[{5bCP}]}{[{5Y2V}]}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSmallDouble">{[{5bCP}]}{[{5Y+M}]}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSumSingle">${msg['title.hkc.ball54']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSumDouble">${msg['title.hkc.ball55']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getTailBig">${msg['title.hkc.ball59']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getTailSmall">${msg['title.hkc.ball60']}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRedBall">${msg['title.hkc.ball147']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getGreenBall">${msg['title.hkc.ball149']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBlueBall">${msg['title.hkc.ball148']}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRedSingle">${msg['title.hkc.ball97']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRedDouble">${msg['title.hkc.ball98']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRedBig">${msg['title.hkc.ball107']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRedSmall">${msg['title.hkc.ball100']}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getGreenSingle">${msg['title.hkc.ball105']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getGreenDouble">${msg['title.hkc.ball106']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getGreenBig">${msg['title.hkc.ball107']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getGreenSmall">${msg['title.hkc.ball108']}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBlueSingle">${msg['title.hkc.ball101']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBlueDouble">${msg['title.hkc.ball102']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBlueBig">${msg['title.hkc.ball103']}</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getBlueSmall">${msg['title.hkc.ball104']}</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getMouse">鼠</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getCow">牛</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getTiger">虎</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getRabbit">兔</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getLoong">龙</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSnake">蛇</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getHorse">马</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getSheep">羊</div>
            </div>
        </div>
        <div class="divider">
            <div class="float-controler">
                <div class="round-select" name="csb" id="getMonkey">猴</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getChicken">鸡</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getDog">狗</div>
            </div>
            <div class="float-controler">
                <div class="round-select" name="csb" id="getPig">猪</div>
            </div>
        </div>
    </div>
</div>
<%@include file="bet.jsp"%>
</body>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<script type="text/javascript">
    var hkcutil = new HKCUtil();
    var ob = "${obj.ob}".split(",");
    var gid, gn;
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var rateTimer;
    var s;
    var issue = "${obj.issue}";
    
	//切换盘口，重新加载赔率
	function changeHandType(){
		clearTimeout(rateTimer);
		isAll = true;
		getRate();
	}    

    function getElm(mpid) {
        var elm = $("[mpid='" + mpid + "']").get(pageIdx);
        return $(elm);
    }

    function toChoosePage() {
        pageIdx = 0;
        $.mobile.changePage("#choosePage", {changeHash: false, transition:'none'});
        $("[gid='" + gid + "']").addClass("ui-btn-active");
        showOrderCount();
    }

    function toFastChoosePage() {
        pageIdx = 1;
        $.mobile.changePage("#fastChoosePage", {changeHash: false, transition:'none'});
        getElm("userinfo").hide();
        clearSelected();
        $("[name='csb']").each(function(){
            if($(this).hasClass("menubtn")){
                $(this).toggleClass("menubtn");
                $(this).toggleClass("round-select");
            }
        });
        getElm("returnBtn").off("click");
        getElm("returnBtn").on("click", function (e) {
            e.preventDefault();
            clearSelected();
            toChoosePage();
        });
        showOrderCount();
    }

    function toOrderPage() {
        pageIdx = 2;
        $.mobile.changePage("#orderPage", {changeHash: false});
        $("#p_isChange").val("0");
        getElm("userinfo").hide();
        getElm("returnBtn").hide();
        getElm("orderBtn").hide();
        getElm("titleLbl").addClass("ui-title-noindent ui-title");
        $.getJSON("${ctx}/hkc/getUserInfo?rtype=1&t=" + new Date().getTime(), function (o) {
            if (o.r == 0) {
                var an = o.data.an + "[" + o.data.htn + "]";
                $("#anid").text(an);
                $("#acid").text(o.data.ac);
            }
        });
    }

    function showOrderCount() {
        var count = $("[name='ball']:checked").length;
        if (count > 0) {
            getElm("orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
            getElm("orderCount").addClass('spnicon').text(count);
        } else {
            getElm("orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
            getElm("orderCount").removeClass('spnicon').text('');
        }
    }

    function clearSelected() {
        $("input[type='checkbox']").each(function (i) {
            $(this).prop("checked", false).checkboxradio("refresh");
        });
    }

    function showSelected(ods) {
        if (ods != undefined && ods != null && ods.length > 0) {
            $.each(ods, function (i, v) {
                $("#" + v).prop("checked", true).checkboxradio("refresh");
                if (i == 0) {
                    $.mobile.silentScroll($("#" + v).offset().top - 30);
                }
            });
        }
        showOrderCount();
    }

    function initGameInfo() {
        var g = $("a[gid][class*='ui-btn-active']");
        gid = g.attr("gid");
        gn = g.text();
    }

    function initNumbers() {
        var balls = hkcutil.getRedBall();
        for (var i = 0; i < balls.length; i++) {
            $("[ball='" + balls[i] + "']").addClass("red-ball");
        }
        balls = hkcutil.getBlueBall();
        for (var i = 0; i < balls.length; i++) {
            $("[ball='" + balls[i] + "']").addClass("blue-ball");
        }
        balls = hkcutil.getGreenBall();
        for (var i = 0; i < balls.length; i++) {
            $("[ball='" + balls[i] + "']").addClass("green-ball");
        }
    }

    function mc(ts) {
        if (ts != undefined && ts != null && ts >= 0 && ts != s) {
            if (ts == 0) {
                for (var i = 1; i <= 49; i++) {
                    $("#ball-" + i).checkboxradio("disable");
                }
                for (var i = 50; i <= 60; i++) {
                    $("#ball-" + i).checkboxradio("enable");
                }
                $("#lblcsb").button("disable");
                clearSelected();
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期&nbsp;<span class='color-red'>已封盘</span>");
                });
            } else if (ts == 1) {
            	if(fd==1){
	                for (var i = 1; i <= 60; i++) {
	                    $("#ball-" + i).checkboxradio("enable");
	                }
	            }
                $("#lblcsb").button("enable");
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期");
                });
            } else if (ts == 2) {
                for (var i = 1; i <= 60; i++) {
                    $("#ball-" + i).checkboxradio("disable");
                }
                $("#lblcsb").button("disable");
                clearSelected();
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期&nbsp;<span class='color-red'>已封盘</span>");
                });
            } else if (ts == 3) {
            	if(fd==1){
	                for (var i = 1; i <= 49; i++) {
	                    $("#ball-" + i).checkboxradio("enable");
	                }
                }
                for (var i = 50; i <= 60; i++) {
                    $("#ball-" + i).checkboxradio("disable");
                }
                $("#lblcsb").button("enable");
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期");
                });
            }
            s = ts;
        }
    }

	var fd = 1;
    function getRate() {
        $.getJSON("${ctx}/hkc/rate/" + gid + "/" + (isAll ? "a" : cv), {t:new Date().getTime()} ,function (o) {
            if (o.c == 0) {
                if (isAll || (!isAll && cv != o.v)) {
                    if (o.r != undefined && o.r != null) {
                        $.each(o.r, function (k, v) {
                            if(0==v[2]){
                            	$("[for='ball-" + eval(k) + "']").text('封单');
                            	$("#ball-" + eval(k)).prev().css('color','red');
								$("#ball-" + eval(k)).checkboxradio("disable");
                            	fd = 0;
                            }else{
                            	fd = 1;
                            	$("#ball-" + eval(k)).prev().css('color','#000000');
								if(o.s==1){
									$("#ball-" + eval(k)).checkboxradio("enable");
								}
                            	$("[for='ball-" + eval(k) + "']").text(v[0]);
                            }
                        });
                    }
                    cv = o.v;
                }
                mc(o.s);
                if (isAll) {
                    isAll = false;
                }
            }else{
 				alert(o.e);
				window.location.href = ctx + "/index";           
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = ctx + "/login";
			}     		
		});
        rateTimer = setTimeout("getRate()", ${obj.interval});
    }

    function showOb() {
        var nums = ob.takeColor();
        var html = "";
        for (var j = 0; j < nums.length; j++) {
            if (j == 6) {
                html += "<div class='b-txt'>+</div>";
            }
            html += "<div class='border-color-" + nums[j][2] + " ball-result float-l'>" + nums[j][0] + "</div>";
        }
        $("[alt='ob']").each(function () {
            $(this).empty();
            $(this).append(html);
        });
    }
    
    function countdown(){
		$("[mpid='issue']").each(function() {
		    var $this = $(this), $countdown = $this.countdown(${obj.nsealTime});
		     $countdown.on('update.countdown' , function(event) {
		     	var totalHours = event.offset.totalDays * 24 + event.offset.hours;
		     	$this.html("当前第&nbsp;<span class='color-red'>" + issue + "</span>&nbsp;期&nbsp;距封盘&nbsp;<span class='color-red'>" + event.strftime(totalHours + ':%M:%S') + "</span>");
		     });
		     $countdown.on('finish.countdown' , function(event) {
		     	//getRate();
		     });
		});	     
    }

    $(function () {
    	$("label").addClass("ui-btn-visible");
        $("a[gid]").on("click", function () {
	        clearSelected();
	        showOrderCount();        
            clearTimeout(rateTimer);
            gid = $(this).attr("gid");
            gn = $(this).text();
            isAll = true;
            setTimeout("getRate()", 200);
        });
        $("[name='ball']").on("click", function (e) {
            showOrderCount();
        });
        $("[name='csb']").on("click", function (e) {
            $(this).toggleClass("menubtn");
            $(this).toggleClass("round-select");
            var ods = new Array();
            var idx = 0;
            $(".menubtn").each(function (i, v) {
                var nums = eval("hkcutil." + $(v).attr("id") + "()");
                if (nums != undefined && nums != null && nums.length > 0) {
                    for (var i = 0; i < nums.length; i++) {
                        ods[idx] = "ball-" + nums[i];
                        idx++;
                    }
                }
            });
            $("[name='ball']").each(function (i) {
                $(this).prop("checked", false).checkboxradio("refresh");
            });
            showSelected(ods);
            showOrderCount();
        });
        $("#choose_series").on("change", function () {
            var method = $(this).val();
            if (method != "no") {
                var nums = eval("hkcutil." + method + "()");
                if (nums != undefined && nums != null && nums.length > 0) {
                    var ods = new Array();
                    for (var i = 0; i < nums.length; i++) {
                        ods[i] = "ball-" + nums[i];
                    }
                    clearSelected();
                    showSelected(ods);
                }
            }
        });
        $("#lblcsb").on("click", function () {
            toFastChoosePage();
        });
        $("[mpid='orderBtn']").on("click", function () {
        	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            var items = $("[name='ball']:checked");
            if (items.length > 0) {
                toOrderPage();
                gn=replaceAllHtml(gn);$("#hcid").text(gn);
                var tbody = $("#tbody").empty();
                for (var i = 0; i < items.length; i++) {
                    var num = $(items[i]).attr("id");
                    num = num.substring(num.indexOf("-") + 1, num.length);
                    var rid = num;
                    if (num.length < 2) {
                        num = "0" + num;
                    }
                    var name = num;
                    if (eval(num) > 49) {
                        name = hkcutil.ballName[num];
                    }
                    var rate = $(items[i]).parent().text();
                    tbody.append("<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1' num='" + num + "'>" + replaceAllHtml(name) + "</span><span class='spannum2'>@</span><span class='spannum3'>" + rate + "</span></td><td align='right' class='tdselect' style='border:none;'><span><input id='a_" + rid + "' type='number' name='amt' class='numb_px' data-role='none'><input type='button' aid='a_" + rid + "' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'><input type='button' value='删' aid='" + rid + "' rel='d' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'></span></td></tr>");
                }
                tbody.append("<tr class='trhight' style='border:none;'><td align='center' colspan='2'></td></tr><tr class='trhight' style='border:none;'><td align='center' colspan='2'></td></tr>");
            }else{
                alert("请至少选择一个号码!");
            }
        });
        $("form").on("click", "[rel='d']", function (e) {
            $(this).parent().parent().parent().remove();
            $("#ball-" + $(this).attr("aid")).prop("checked", false).checkboxradio("refresh");
            if ($("[rel='d']").size() < 1) {
                toChoosePage();
            }
        });
        $("form").on("click", "[rel='w']", function (e) {
            var val = $("#" + $(this).attr("aid")).val();
            if (val === "") {
                val = 2;
            }
            $("input[name='amt']").each(function (i) {
                $(this).val(val);
            });
        });
        $("#cancelBtn").on("click", function () {
            toChoosePage();
        });
        $("#submitBtn").on("click", function () {
            var betBall = "";
            var rateAll = "";
            var noteCount = 0;
            var betAmount = "";
            var amount = 0;

            $("#tbody > tr").each(function () {
                var td = $(this).children("[align!=]");
                var ball = td.children(".spannum1").attr("num");
                var rate = td.children(".spannum3").text();
                if (ball != undefined && ball != null && ball != "") {
                    betBall = betBall + ball + ",";
                    rateAll = rateAll + rate + ",";
                    noteCount++;
                }
            });
            betBall = betBall.substring(0, betBall.length - 1);
            rateAll = rateAll.substring(0, rateAll.length - 1);
            $("[name='amt']").each(function (i, v) {
                var vv = $(v).val();
                if (vv != undefined && vv != null && vv != "") {
                    betAmount = betAmount + vv + ",";
                    amount += eval(vv);
                }
            });
            betAmount = betAmount.substring(0, betAmount.length - 1);
            $("#p_gameCode").val(gid);
            $("#p_pgameCode").val(10);
            $("#p_noteCount").val(noteCount);
            $("#p_betBall").val(betBall);
            $("#p_rateAll").val(rateAll);
            $("#p_rate").val(rateAll);
			if(!/^[1-9]+[0-9]*]*$/.test(amount)){
				var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
				return;
			}            
            $("#p_amount").val(amount);
            $("#p_betAmount").val(betAmount);
            $("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
            showSubmit("注单提交中,请稍后...");
            $.post("${ctx}/hkc/addOrder", $("form").serialize(), function (o) {
            	hideLoader();
                o = $.parseJSON(o);
                if (o.r == 0) {
                    if (o.data.code == "1") {
                        $("[id^='ball-']").each(function () {
                            $(this).prop("checked", false).checkboxradio("refresh");
                        });
                        var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                        toChoosePage();
                    } else if (o.data.code == "2") {
                    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                        var r = confirm(o.data.description.replace(/\\n/gm, '\n'));
                        if (r == true) {
                            $("#p_isChange").val("1");
                            $("#submitBtn").click();
                        }
                    } else {
                    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                        alert(o.data.description);
                    }
                }
            });
        });
        showOrderCount();
        initGameInfo();
        initNumbers();
        getRate();
        showOb();
        countdown();
    });
	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>