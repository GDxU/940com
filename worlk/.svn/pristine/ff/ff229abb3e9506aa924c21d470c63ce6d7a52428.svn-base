<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
    <script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
    <script src="${staticFileUrl}/js/hkc/combet.js?v=${rsvn}"></script>
    <%@include file="hkcutil.jsp"%>
</head>
<body>
<c:set var="title" value="${msg['title.hkc.game35']}" />
<c:set var="page_title" value="${msg['title.hkc.game35']}" scope="request"/>
<div data-role="page" id="rateInfoPage">
	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
    <%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
    <input type="hidden" id="gamec" value="${obj.game}">
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
        <div data-role="navbar" pid="35" data-mini="true">
            <%-- <ul>
                <c:forEach var="pc" items="${obj.pcs}" varStatus="i">
                    <c:if test="${pc.isShow}">
                        <c:choose>
                    		<c:when test="${flag_li == 0}">
						    	<li><a gid="${pc.gameCode}" class='ui-btn-active' onclick="changeGame('${pc.gameCode}','1')">${pc.gameName}</a></li>
                    			<c:set var="flag_li" value="1"></c:set>
						    </c:when>
						    <c:otherwise>
					            <li><a gid="${pc.gameCode}" onclick="changeGame('${pc.gameCode}','1')">${pc.gameName}</a></li>
					       </c:otherwise>
                    	</c:choose>
                    </c:if>
                </c:forEach>
            </ul>  --%>
            <select name="selectGame" id="selectGame" onchange="changeGame(this,'1')">
            	<c:forEach var="pc" items="${obj.pcs}" varStatus="i">
            		<option value="${pc.gameCode}">${pc.gameName}</option>
		        </c:forEach>
		    </select>
		            
        </div>
        <div class="mgtop6"></div>
		<div data-role="navbar">
		    <ul>
		        <li><a href="#" id="tc_01" data-ajax="false" onclick="changeTcode('01')">{[{5aSN5byP}]}投{[{5rOo}]}</a></li>
		        <li><a href="#" id="tc_08" data-ajax="false" onclick="changeTcode('08')">多组投{[{5rOo}]}</a></li>
		    </ul>
		</div>
         <div class="table-cotent-lottery">
         <div><span id="zdlt" class="content-info-zdlt"></span></div>
        <div class="mainframe01 mgtop6">
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
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-01" data-mini="true"><label for="ball-01">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="2">02</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-02" data-mini="true"><label for="ball-02">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="3">03</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-03" data-mini="true"><label for="ball-03">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="4">04</div></div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-04" data-mini="true"><label for="ball-04">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="5">05</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-05" data-mini="true"><label for="ball-05">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="6">06</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-06" data-mini="true"><label for="ball-06">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number brl-1"><div class="ball" ball="7">07</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-07" data-mini="true"><label for="ball-07">0.00</label></fieldset></div>
                <div class="o-number brl-1"><div class="ball" ball="8">08</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-08" data-mini="true"><label for="ball-08">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number brl-1"><div class="ball" ball="9">09</div></div>
                <div class="o-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball" id="ball-09" data-mini="true"><label for="ball-09">0.00</label></fieldset></div>
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
<%@ include file="/WEB-INF/page/hkc/com_s_bet.jsp" %>
</body>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<script type="text/javascript">
	var tcode = '01';
	$("#tc_" + tcode).addClass('ui-btn-active');

    var hkcutil = new HKCUtil();
    var ob = "${obj.ob}".split(",");
    var gid, gn;
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var rateTimer;
    var s;
    var issue = "${obj.issue}";
    var gameCode = $("#selectGame option:selected").val();
    
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
        $.mobile.changePage("#rateInfoPage", {changeHash: false, transition:'none'});
        //$("[gid='" + gid + "']").addClass("ui-btn-active");
        //showOrderCount();
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
        /* var g = $("a[gid][class*='ui-btn-active']");
        gid = g.attr("gid");
        gn = g.text(); */
        gid = $("#selectGame option:selected").val()
    	gn = $("#selectGame option:selected").text()
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
    
    function changeGame(self, flag){
    	isAll = true;
    	$("#tc_" + tcode).trigger("click");
    	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    	zdn = 0;
    	dzar = [];
    	$("#zdlt").html('');
    	
        clearSelected();
        showOrderCount();        
        clearTimeout(rateTimer);
        gid = $(self).find("option:selected").val();
        
        gameCode = $("#selectGame option:selected").val();
        gn = $(self).find("option:selected").text();
        isAll = true;
        setTimeout("getRate()", 200);
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
    	gid = $("#selectGame option:selected").val()
        $.getJSON("${ctx}/hkc/rate/" + gid + "/" + (isAll ? "a" : cv), {t:new Date().getTime()} ,function (o) {
            if (o.c == 0) {
                if (isAll || (!isAll && cv != o.v)) {
                    if (o.r != undefined && o.r != null) {
                        $.each(o.r, function (k, v) {
                            if(0==v[2]){
                            	$("[for='ball-" + k + "']").text('封单');
                            	$("#ball-" + k).prev().css('color','red');
								$("#ball-" + k).checkboxradio("disable");
                            	fd = 0;
                            }else{
                            	fd = 1;
                            	$("#ball-" + k).prev().css('color','#000000');
								if(o.s==1){
									$("#ball-" + k).checkboxradio("enable");
								}
                            	$("[for='ball-" + k + "']").text(v[0]);
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
    
    function changeTcode(tc){
    	$("#tc_01").removeClass('ui-btn-active');
    	$("#tc_08").removeClass('ui-btn-active');
    	tcode = tc;
    	$("#tc_" + tcode).addClass('ui-btn-active');
    	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    	getElm("orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
    	getElm("orderCount").removeClass('spnicon').text('');
    	zdn = 0;
    	dzar = [];
    	$("#zdlt").html('');
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

    var gmmk = {
   		'3501' : 1,
   		'3502' : 2,
   		'3503' : 3,
   		'3504' : 4,
   		'3505' : 5,
   		'3506' : 6,
   		'3507' : 7,
   		'3508' : 8,
   		'3509' : 9,
   		'3510' : 10,
   		'3511' : 11,
   		'3512' : 12,
   		'3513' : 13,
   		'3514' : 14,
   		'3515' : 15,
   		'3516' : 16,
   		'3517' : 17,
   		'3518' : 18,
   		'3519' : 19,
   		'3520' : 20
   	};
    
    var zdn = 0;
    var dzar = [];
    
    $(function () {
    	$("label").addClass("ui-btn-visible");
        /* $("a[gid]").on("click", function () {
	        clearSelected();
	        showOrderCount();        
            clearTimeout(rateTimer);
            gid = $(this).attr("gid");
            $("#gamec").val(gid);
            gn = $(this).text();
            isAll = true;
            setTimeout("getRate()", 200);
        }); */
        $("[name='ball']").on("click", function (e) {
            //showOrderCount();
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
        
      //注单页面获取用户信息
        function getUserInfo(){
        	var url = ctx + '/hkc/getUserInfo?t=' + new Date().getTime();
        	$.get(url,function(jsonResult, status){
        		if(status=="success"){
        			var obj = eval('(' + jsonResult + ')');
        			if(obj.r==0){
        				$("#anid").html(obj.data.an + "[" + obj.data.htn + "]&nbsp;&nbsp;");
        				$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
        			}
        		}
        	});
        }
        
        function getComb(i,str,parr,n,rarr){
        	if(n==0){
        		rarr.push(str);
        		return;
        	}
        	if(i==parr.length){
        		return;
        	}
        	getComb(i+1,str+parr[i]+",",parr,n-1,rarr);
        	getComb(i+1,str,parr,n,rarr);
        }
        
        $("input[type='checkbox']").on("click",function(e){
        	gameCode = $("#selectGame option:selected").val();
    		if (tcode == '08') {
    			if(zdn >= 5){
    				//alert('最多选择五组组合！');
    				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    				setTimeout("alert('最多选择五组组合！');",200);
    				return;
    			}
    			if($("input:checked").length == gmmk[gameCode]){
    				var str = '';
    				$("[name='ball']").each(function(){
    	    			if($(this).prop("checked")){
    	    				str += this.id + ',';
    	    			}
    	    		});
    	    		str = str.substring(0,str.length-1);
    	    		str += '';
    	    		for(var i=0;i<dzar.length;i++){
    	    			if(str==dzar[i]){
    	    				//alert('该组合已存在！');
    	    				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    	    				setTimeout("alert('该组合已存在！');",200);
    	    				return;
    	    			}
    	    		}
    	    		dzar[zdn] = str;
    	    		zdn++;
    	    		getElm("orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
    	    		getElm("orderCount").addClass('spnicon').text(zdn);
    				$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    				$("#zdlt").html($("#zdlt").html() + '[' + str.replace(/ball-/g, "") + ']&nbsp;');
    			}
    		} else if (tcode == '01') {
    			var num = 0;
    			switch(gameCode) {
	    			case '3501':
	    			case '3502':
	    			case '3507':
	    			case '3508':
	    				num = 10;
	    			  break;
	    			case '3503':
	    			case '3504':
	    			case '3506':
	    				num = 9;
	    			  break;
	    			case '3505':
	    				num = 8;
	    			  break;
	    			case '3509':
	    			case '3510':
	    			case '3511':
	    				num = 12;
	    			  break;
	    			case '3512':
	    				num = 13;
	    			  break;
	    			case '3513':
	    				num = 14;
	    			  break;
	    			case '3514':
	    				num = 15;
	    			  break;
	    			case '3515':
	    				num = 16;
	    			  break;
	    			case '3516':
	    				num = 17;
	    			  break;
	    			case '3517':
	    				num = 18;
	    			  break;
	    			case '3518':
	    				num = 19;
	    			  break;
	    			case '3519':
	    				num = 20;
	    			  break;
	    			case '3520':
	    				num = 21;
	    			  break;
    			}
    			
    			if (num != 0) {
	    			if($("input:checked").length > num){
						$(this).prop("checked",false).checkboxradio("refresh");
						setTimeout("alert('最多只能选择" + num + "个号码！');",200);
						return;
					}
    			}
    			showOrderCount();
    		}
        });
        
        getElm("orderBtn").on("click",function(){
        $("#submitBtn").removeAttr("disabled");
        	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
        	gn=replaceAllHtml(gn);
        	$("#hcid").text(gn);
        	gameCode = $("#selectGame option:selected").val();
        	if(tcode == '01' && $("input:checked").length < gmmk[gameCode]){//{[{5aSN5byP}]}
       			alert('请至少选择' + gmmk[gameCode] + '个号码！');
       			return;
        	}
        	if(tcode == '08' && zdn < 1){//多组
        		alert('请至少选择1个组合！');
       			return;
        	}
        	
        	if(tcode == '01'){//{[{5aSN5byP}]}
        		var parr = new Array();
        		var ballArray = new Array();
        		var n = 0;
        		$("[name='ball']").each(function(){
        			if($(this).prop("checked")){
        				
        				if (this.id.length == 6) {
        					ballArray[n] = this.id.replace("ball-", "0")
        				} else {
        					ballArray[n] = this.id.replace("ball-", "")
        				}

        				parr[n++] = this.id;
        			}
        		});
        		var nra = [];
        		var nst = '';
        		var rst = '';
        		for(var i=0;i<parr.length;i++){
        			var o = $("label[for='" + parr[i] + "']");
        			nra[parr[i]] = o.text();
        			
        			if(i+1 != parr.length){
        				nst += ballArray[i] + ', ';
        				rst += o.text() + ', ';
        			}else{
        				nst += ballArray[i];
        				rst += o.text() ;
        			}
        		}
        		var ot = $("#orderTable");
    	        ot.children("tbody").remove();
    	        var tbody = $("<tbody></tbody>");
    	        var str = '';
    	        str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
    	        str += "球号：</span><span class='font-size12'>" + nst + "</span></td></tr><tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
        		str += replaceAllHtml("{[{6LWU546H}]}") + "：</span><span class='font-size12'>" + rst + "</span></td></tr>";
        		$(str).appendTo(tbody);
        		ot.append(tbody);
        		var rarr = new Array();
        		getComb(0,'',parr,gmmk[gameCode],rarr);
        		str = '<div class="mainframe01 mgtop6">';
        		for(var i=0;i<rarr.length;i++){
        			var tn = rarr[i].substring(0,rarr[i].length-1);
        			var tr = Number.MAX_VALUE;
        			var tar = tn.split(',');
        			var temtn = '';
        			for(var j=0;j<tar.length;j++){
        				tr = Math.min(tr,nra[tar[j]]);
        				if(j<tar.length-1){
        					temtn += temtn + ', '
        				}
        			}
        			tn = tn.replace(/ball-/g, "")
        			str += '<div class="border-result">' + tn + ' (' + tr + ')</div>';
        		}
        		str += '</div>';
        		$("#zdl").html(str);
        		$("#zdn").html(rarr.length);
        		
        		$("#p_gameCode").val(gameCode);
        		$("#p_betBallStr").val(nst);
        		$("#p_noteCount").val(rarr.length);
        		$("#p_pgameCode").val(gameCode.substring(0,2));
        		$("#p_rateStr").val(rst);
        		
    	    	$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
    	    	getUserInfo();
        	}
        	
        	if(tcode == '08'){//多组
        		$("#zdl").html('');
        		var ot = $("#orderTable");
    	        ot.children("tbody").remove();
    	        var tbody = $("<tbody></tbody>");
    	        var str = '';
    	        var bbs = '';//01#02#03,02#15#20
    	        var mrate = '';
    	        var ras = '';//2.1#2.2#2.2,2.2#2.1#2.2
        		for(var i=0;i<dzar.length;i++){
        			var tem = dzar[i].split(',');
        			var minr = Number.MAX_VALUE;
        			for(var j=0;j<tem.length;j++){
        				var o = $("label[for='" + tem[j] + "']");
        				minr = Math.min(minr,o.text());
        				bbs += tem[j] + '#';
        				ras += o.text() + '#';
        			}
    		        str += "<tr class='trhight' style='border:none;'>";
    		        str += "<td style='border:none;'><span class='spannum1'>{[{5rOo}]}{[{5Y2V}]}：</span><span class='font-size12'  style='word-break: break-all;'>" + dzar[i].replace(/ball-/g, "") + "(" + minr + ")" + "</span></td>";
    	    		str += "</tr>";
    	    		
    	    		bbs = bbs.substring(0, bbs.length-1);
    	    		ras = ras.substring(0, ras.length-1);
    	    		mrate += minr;
    	    		if(i != dzar.length-1){
    	    			bbs += ',';
    	    			mrate += ',';
    	    			ras += ',';
    	    		}
        		}
        		str = replaceAllHtml(str);
        		$(str).appendTo(tbody);
        		ot.append(tbody);
        		$("#zdn").html(dzar.length);
        		
        		$("#p_gameCode").val(gameCode);
        		$("#p_betBall").val(bbs.replace(/ball-/g, ""));
        		$("#p_betType").val(tcode);
        		$("#p_noteCount").val(dzar.length);
        		$("#p_pgameCode").val(gameCode.substring(0,2));
        		$("#p_rate").val(mrate);
        		$("#p_rateAll").val(ras);
        		
        		$.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
        		getUserInfo();
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
        
        $("#submitBtn").on("click",function(){
    		subch();
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