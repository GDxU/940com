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
    <style type="text/css">
        .orderTable td {
            border-top: #bbb 1px solid;
        }

        .orderTable td a {
            cursor: pointer;
        }
    </style>
</head>
<body>
<c:set var="title" value="{[{6L+H5YWz}]}" />
<div data-role="page" id="choosePage">
	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
    <%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
    <div data-role="main" class="ui-content">
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
         <div class="table-cotent-lottery">
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}一</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一{[{5Y2V}]}" id="1701-50" data-mini="true"><label for="1701-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一{[{5Y+M}]}" id="1701-51" data-mini="true"><label for="1701-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一{[{5aSn}]}" id="1701-52" data-mini="true"><label for="1701-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一{[{5bCP}]}" id="1701-53" data-mini="true"><label for="1701-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一红{[{5rOi}]}" id="1701-56" data-mini="true"><label for="1701-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一蓝{[{5rOi}]}" id="1701-57" data-mini="true"><label for="1701-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z1" cn="{[{5q2j}]}一绿{[{5rOi}]}" id="1701-58" data-mini="true"><label for="1701-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear"></div>
        </div>
        <p></p>
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}二</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二{[{5Y2V}]}" id="1702-50" data-mini="true"><label for="1702-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二{[{5Y+M}]}" id="1702-51" data-mini="true"><label for="1702-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二{[{5aSn}]}" id="1702-52" data-mini="true"><label for="1702-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二{[{5bCP}]}" id="1702-53" data-mini="true"><label for="1702-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二红{[{5rOi}]}" id="1702-56" data-mini="true"><label for="1702-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二蓝{[{5rOi}]}" id="1702-57" data-mini="true"><label for="1702-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z2" cn="{[{5q2j}]}二绿{[{5rOi}]}" id="1702-58" data-mini="true"><label for="1702-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear"></div>
        </div>
        <p></p>
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}三</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三{[{5Y2V}]}" id="1703-50" data-mini="true"><label for="1703-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三{[{5Y+M}]}" id="1703-51" data-mini="true"><label for="1703-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三{[{5aSn}]}" id="1703-52" data-mini="true"><label for="1703-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三{[{5bCP}]}" id="1703-53" data-mini="true"><label for="1703-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三红{[{5rOi}]}" id="1703-56" data-mini="true"><label for="1703-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三蓝{[{5rOi}]}" id="1703-57" data-mini="true"><label for="1703-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z3" cn="{[{5q2j}]}三绿{[{5rOi}]}" id="1703-58" data-mini="true"><label for="1703-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear"></div>
        </div>
        <p></p>
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}四</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四{[{5Y2V}]}" id="1704-50" data-mini="true"><label for="1704-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四{[{5Y+M}]}" id="1704-51" data-mini="true"><label for="1704-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四{[{5aSn}]}" id="1704-52" data-mini="true"><label for="1704-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四{[{5bCP}]}" id="1704-53" data-mini="true"><label for="1704-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四红{[{5rOi}]}" id="1704-56" data-mini="true"><label for="1704-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四蓝{[{5rOi}]}" id="1704-57" data-mini="true"><label for="1704-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z4" cn="{[{5q2j}]}四绿{[{5rOi}]}" id="1704-58" data-mini="true"><label for="1704-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear"></div>
        </div>
        <p></p>
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}五</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五{[{5Y2V}]}" id="1705-50" data-mini="true"><label for="1705-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五{[{5Y+M}]}" id="1705-51" data-mini="true"><label for="1705-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五{[{5aSn}]}" id="1705-52" data-mini="true"><label for="1705-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五{[{5bCP}]}" id="1705-53" data-mini="true"><label for="1705-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五红{[{5rOi}]}" id="1705-56" data-mini="true"><label for="1705-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五蓝{[{5rOi}]}" id="1705-57" data-mini="true"><label for="1705-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z5" cn="{[{5q2j}]}五绿{[{5rOi}]}" id="1705-58" data-mini="true"><label for="1705-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear"></div>
        </div>
        <p></p>
        <div class="mainframe01">
            <div class="divz">{[{5q2j56CB}]}六</div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六{[{5Y2V}]}" id="1706-50" data-mini="true"><label for="1706-50">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六{[{5Y+M}]}" id="1706-51" data-mini="true"><label for="1706-51">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六{[{5aSn}]}" id="1706-52" data-mini="true"><label for="1706-52">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六{[{5bCP}]}" id="1706-53" data-mini="true"><label for="1706-53">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">红{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六红{[{5rOi}]}" id="1706-56" data-mini="true"><label for="1706-56">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">蓝{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六蓝{[{5rOi}]}" id="1706-57" data-mini="true"><label for="1706-57">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">绿{[{5rOi}]}</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="radio" name="z6" cn="{[{5q2j}]}六绿{[{5rOi}]}" id="1706-58" data-mini="true"><label for="1706-58">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">&nbsp;</div>
                <div class="b-number brl-1 border-b01">&nbsp;</div>
            </div>
            <div class="clear" style="height:10px;"></div>
        </div>
        <a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="top">返回顶部</a></p>
        </div>
        </div>
    </div>
</div>
<%@ include file="bet.jsp"%>
</body>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<script type="text/javascript">
    var hkcutil = new HKCUtil();
    var ob = "${obj.ob}".split(",");
    var maxAward = ${obj.maxAward};
    var gid = 17;
    var gn = replaceAllHtml("{[{6L+H5YWz}]}");
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var s;
    var issue = "${obj.issue}";
    var ids = new Array();
    //--------------------
    var betBall = "";
    var rateAll = "";
    var gameCode16 = "";
    var passType = "";
    var rate = 1;
    var rateTimer;

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
        showOrderCount();
    }

    function toOrderPage() {
        pageIdx = 1;
        $.mobile.changePage("#orderPage", {changeHash: false, transition:'none'});
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
        $("#maxAward").text("最大派彩:"+maxAward);
    }

    function showOrderCount() {
        var count = $("input:checked").length;
        if (count > 0) {
            getElm("orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
            getElm("orderCount").addClass('spnicon').text($("input:checked").length);
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
            });
        }
        showOrderCount();
    }

    function mc(ts) {
        if (ts != undefined && ts != null && ts >= 0 && ts != s) {
            if (ts == 0) {
                $("input[type='radio']").each(function(){
                    $(this).checkboxradio("disable");
                });
                clearSelected();
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期&nbsp;<span class='color-red'>已封盘</span>");
                });
            } else if (ts == 1) {
            	if(fd==1){
            		$("input[type='radio']").each(function(){
	                    $(this).checkboxradio("enable");
	                });
            	}
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期");
                });
            }
            s = ts;
        }
    }
	
	var fd = 1;
    function getRate() {
        $.getJSON("${ctx}/hkc/rate/17/" + (isAll ? "a" : cv), {t:new Date().getTime()}, function (o) {
            if (o.c == 0) {
                if (isAll || (!isAll && cv != o.v)) {
                    if (o.r != undefined && o.r != null) {
                        $.each(o.r, function (k, v) {
                            var ks = k.split("-");
                            if(0==v[2]){
                            	$("[for='" + ks[0] + "-" + eval(ks[1]) + "']").text('封单');
                            	$("#" + ks[0] + "-" + eval(ks[1])).prev().css('color','red');
								$("#" + ks[0] + "-" + eval(ks[1])).checkboxradio("disable");
                            	fd = 0;
                            }else{
                            	fd = 1;
                            	$("#" + ks[0] + "-" + eval(ks[1])).prev().css('color','#000000');
								if(o.s==1){
									$("#" + ks[0] + "-" + eval(ks[1])).checkboxradio("enable");
								}
                            	$("[for='" + ks[0] + "-" + eval(ks[1]) + "']").text(v[0]);
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
		    var $this = $(this), $countdown = $this.countdown(${obj.sealTime});
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
        $("input[type='radio']").on("click", function (e) {
            var id = $(this).attr("id");
            var n = $(this).attr("name")
            if (ids[n] == undefined || ids[n] == null || ids[n] != id) {
                ids[n] = id;
            } else {
                $(this).prop("checked", false).checkboxradio("refresh");
                ids[n] = undefined;
            }
            showOrderCount();
        });
        getElm("orderBtn").on("click", function () {
        $("#submitBtn").removeAttr("disabled");
         	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            betBall = "";
            rateAll = "";
            gameCode16 = "";
            passType = "";
            rate = 1;

            var items = $("input:checked");
            if (items.length > 1) {
                toOrderPage();
                gn=replaceAllHtml(gn);$("#hcid").text(gn);
                var tbody = $("#tbody").empty();
                var name = "";
                var num;
                for (var i = 0; i < items.length; i++) {
                    num = $(items[i]).attr("id").split("-");
                    betBall = betBall + num[1] + "#";
                    gameCode16 = gameCode16 + num[0] + "#";
                    rateAll = rateAll + $(items[i]).parent().text() + "#";
                    rate = rate * $(items[i]).parent().text();
                    name = name + $(items[i]).attr("cn") + ",";
                }
                rate = rate.toFixed(3);
                betBall = betBall.substring(0, betBall.length - 1);
                rateAll = rateAll.substring(0, rateAll.length - 1);
                gameCode16 = gameCode16.substring(0, gameCode16.length - 1);
                passType = items.length + "-1";
                tbody.append("<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1' style='white-space: normal;width:150px;'>" + name + "</span><span class='spannum2'>@</span><span class='spannum3'>" + rate + "</span></td><td align='right' class='tdselect' style='border:none;width: 164px;'><span><input type='hidden'name='num' value='" + num + "'><input type='hidden'name='rate' value='" + rate + "'><input id='a_" + num + "' type='number' name='amt' class='numb_px' data-role='none'><input type='button' aid='a_" + num + "' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'><input type='button' value='删' aid='" + num + "' rel='d' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'></span></td></tr>");
            }else{
                alert("请至少选择两个类型!");
            }
        });
        $("form").on("click", "[rel='d']", function (e) {
            $(this).parent().parent().parent().remove();
            $("[type='radio']").each(function () {
                $(this).prop("checked", false).checkboxradio("refresh");
            });
            if ($("[rel='d']").size() < 1) {
                toChoosePage();
            }
        });
        $("form").on("click", "[rel='w']", function (e) {
            $("input[name='amt']").val(2);
        });
        $("#cancelBtn").on("click", function () {
            toChoosePage();
        });
        $("#submitBtn").on("click", function () {
            $("#p_gameCode").val(gid);
            $("#p_pgameCode").val(gid);
            $("#p_noteCount").val(1);
            $("#p_betBall").val(betBall);
            $("#p_rateAll").val(rateAll);
            $("#p_rate").val(rate);
            var amt = $("[name='amt']").val();
			if(!/^[1-9]+[0-9]*]*$/.test(amt)){
				var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
				return;
			}              
            $("#p_amount").val(amt);
            $("#p_betAmount").val(amt);
            $("#p_passType").val(passType);
            $("#p_gameCode16").val(gameCode16);
            $("#submitBtn").attr("disabled","disabled");
            $("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
            showSubmit("注单提交中,请稍后...");
            $.post("${ctx}/hkc/addOrder", $("form").serialize(), function (o) {
            	hideLoader();
                o = $.parseJSON(o);
                if (o.r == 0) {
                    if (o.data.code == "1") {
                        $("[type='radio']").each(function () {
                            $(this).prop("checked", false).checkboxradio("refresh");
                        });
                        var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                        toChoosePage();
                    } else if (o.data.code == "2") {
                   		 $("#submitBtn").removeAttr("disabled");
                    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                        var r = confirm(o.data.description.replace(/\\n/gm, '\n'));
                        if (r == true) {
                            $("#p_isChange").val("1");
                            $("#submitBtn").click();
                        }
                    } else {
                   		 $("#submitBtn").removeAttr("disabled");
                    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                        alert(o.data.description);
                    }
                }
            });
        });
        showOrderCount();
        getRate();
        showOb();
        countdown();
    });
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>