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

<c:set var="title" value="{[{55Sf6IKW5Y+M6Z2i}]}" />
<div data-role="page" id="choosePage">
 	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
    <%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
    <div data-role="main" class="ui-content">
        <div class="mgtop6"></div>
		<!-- <div data-role="navbar">
		    <ul>
 		        <li><a href="#" id="gc_19" data-ajax="false" onclick="changeGcode('19', '{[{54m5}]}{[{5aS0}]}{[{5bC+}]}')">{[{54m5}]}{[{5aS0}]}{[{5bC+}]}</a></li>
		        <li><a href="#" id="gc_39" data-ajax="false" onclick="changeGcode('39', '{[{54m5}]}{[{5aS0}]}{[{5bC+}]}{[{5LiN5Lit}]}')">{[{54m5}]}{[{5aS0}]}{[{5bC+}]}{[{5LiN5Lit}]}</a></li>
		    </ul>
		</div> -->
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
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>家禽</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						马 羊 猪 狗 牛 鸡
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="169" cn="家禽" id="ball-169" data-mini="true">
					<label title="家禽" for="ball-169">0.00</label>
					</fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>野兽</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						兔 猴 龙 鼠 虎 蛇
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="170" cn="野兽" id="ball-170" data-mini="true"><label title="野兽" for="ball-170">0.00</label></fieldset>
				</div>
				
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>天{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						兔 马 猴 猪 牛 龙
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="171" cn="天{[{6IKW}]}" id="ball-171" data-mini="true">
					<label title="天{[{6IKW}]}" for="ball-171">0.00</label>
					</fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>地{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						蛇 羊 鸡 狗 鼠 虎
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="172" cn="地{[{6IKW}]}" id="ball-172" data-mini="true"><label title="地{[{6IKW}]}" for="ball-172">0.00</label></fieldset>
				</div>
				
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>男{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						鼠 牛 虎 龙 马 猴 狗
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="173" cn="男{[{6IKW}]}" id="ball-173" data-mini="true">
					<label title="男{[{6IKW}]}" for="ball-173">0.00</label>
					</fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>女{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						兔 蛇 羊 鸡 猪
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="174" cn="女{[{6IKW}]}" id="ball-174" data-mini="true"><label title="女{[{6IKW}]}" for="ball-174">0.00</label></fieldset>
				</div>
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>春</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						兔 虎 龙
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="175" cn="春" id="ball-175" data-mini="true">
					<label title="春" for="ball-175">0.00</label>
					</fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>夏</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						马 蛇 羊
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="176" cn="夏" id="ball-176" data-mini="true"><label title="夏" for="ball-176">0.00</label></fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>秋</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						鸡 猴 狗
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="177" cn="秋" id="ball-177" data-mini="true"><label title="秋" for="ball-177">0.00</label></fieldset>
				</div>
				<div class="type-hk1 brl-1">
					<div>冬</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						鼠 猪 牛
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="178" cn="冬" id="ball-178" data-mini="true"><label title="冬" for="ball-178">0.00</label></fieldset>
				</div>
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>东{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						鼠 龙 猴
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="179" cn="东{[{6IKW}]}" id="ball-179" data-mini="true">
					<label title="东{[{6IKW}]}" for="ball-179">0.00</label>
					</fieldset>
				</div>
				
				<div class="type-hk1 brl-1">
					<div>南{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						牛 蛇 鸡
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="180" cn="南{[{6IKW}]}" id="ball-180" data-mini="true"><label title="南{[{6IKW}]}" for="ball-180">0.00</label></fieldset>
				</div>
				
				<div class="type-hk1 brl-1">
					<div>西{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						虎 马 狗
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="181" cn="西{[{6IKW}]}" id="ball-181" data-mini="true"><label title="西{[{6IKW}]}" for="ball-181">0.00</label></fieldset>
				</div>
				
				<div class="type-hk1 brl-1">
					<div>北{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						兔 羊 猪
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="182" cn="北{[{6IKW}]}" id="ball-182" data-mini="true"><label title="北{[{6IKW}]}" for="ball-182">0.00</label></fieldset>
				</div>
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		<div class="table-cotent-lottery">
			<div class="mainframe01">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
				<div class="type-hk1 brl-1">
					<div>红{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div>
						马 兔 鼠 鸡
					</div>
				</div>
				<div class="value-kh1 brl-1">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="183" cn="红{[{6IKW}]}" id="ball-183" data-mini="true">
					<label title="红{[{6IKW}]}" for="ball-183">0.00</label>
					</fieldset>
				</div>
				
				<div class="type-hk1 brl-1">
					<div>蓝{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						蛇 虎 猪 猴
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="184" cn="蓝{[{6IKW}]}" id="ball-184" data-mini="true"><label title="蓝{[{6IKW}]}" for="ball-184">0.00</label></fieldset>
				</div>
				
				<div class="type-hk1 brl-1">
					<div>绿{[{6IKW}]}</div>
				</div>
				<div class="group-kh1 brl-1">
					<div >
						羊 龙 牛 狗
					</div>
				</div>
				<div class="value-kh1 brl-1 border-b01">
					<fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="185" cn="绿{[{6IKW}]}" id="ball-185" data-mini="true"><label title="绿{[{6IKW}]}" for="ball-185">0.00</label></fieldset>
				</div>
				<div class="clear" style="height:10px;"></div>
			</div>
		</div>
		
		
		
		<div class="ui-content-ballSx">
			<div class="table-cotent-lottery">
			<div class="mainframe01" id="numbers1">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
			</div>
		</div>
		</div>
		<div class="ui-content-ballSz">
		<div class="table-cotent-lottery">
			<div class="mainframe01" id="numbers2">
				<div class="min-overflow">
					<div class="type-hk1-t title-setting brl-1">{[{55Sf6IKW5Y+M6Z2i}]}</div>
					<div class="group-kh1-t title-setting brl-1">号码</div>
					<div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
				</div>
			</div>
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
    var gid = "44"
    var gn = "{[{55Sf6IKW5Y+M6Z2i}]}";
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var s;
    var issue = "${obj.issue}";
    var rateTimer;

    //$("#gc_19").addClass('ui-btn-active');
    // $(".39").hide();
    
    function initNumbers1() {
        var i = 0;
        while (i < hkcutil.sxsm1.length) {
            var method = hkcutil.sxsm1[i][0];
            var en = "ball-" + hkcutil.sxsm1[i][2];
            var cn = hkcutil.sxsm1[i][1];
            var nums = eval("hkcutil." + method + "().takeColor()");
            var html = "<div class='type-hk1 brl-1'><div>" + cn + "</div></div><div class='group-kh1 brl-1'><div>";
            for (var j = 0; j < nums.length; j++) {
                html += "<div class='ball2 " + nums[j][1] + "-ball float-l'>" + (nums[j][0]<10?"0":"") + nums[j][0] + "</div>"
            }
            html += "</div></div>";
            html += "<div class='value-kh1 brl-1 " + (i == hkcutil.sxsm1.length - 1 ? "border-b01" : "") + "'><fieldset data-role='controlgroup' data-type='horizontal'><input type='checkbox' name='" + en + "' id='" + en + "' cn='" + cn + "' data-mini='true'><label for='" + en + "' title='" + cn + "'>0.00</label></fieldset></div>";
            if (i == hkcutil.sxsm1.length - 1) {
                html += "<div class='clear'></div>";
            }
            html = replaceAllHtml(html);
            $("#numbers1").append(html);
            i++;
        }
        $.mobile.pageContainer.trigger("create");
    }
    
    function initNumbers2() {
        var i = 0;
        while (i < hkcutil.sxsm2.length) {
            var method = hkcutil.sxsm2[i][0];
            var en = "ball-" + hkcutil.sxsm2[i][2];
            var cn = hkcutil.sxsm2[i][1];
            var nums = eval("hkcutil." + method + "().takeColor()");
            var html = "<div class='type-hk1 brl-1'><div>" + cn + "</div></div><div class='group-kh1 brl-1'><div>";
            for (var j = 0; j < nums.length; j++) {
                html += "<div class='ball2 " + nums[j][1] + "-ball float-l'>" + (nums[j][0]<10?"0":"") + nums[j][0] + "</div>"
            }
            html += "</div></div>";
            html += "<div class='value-kh1 brl-1 " + (i == hkcutil.sxsm2.length - 1 ? "border-b01" : "") + "'><fieldset data-role='controlgroup' data-type='horizontal'><input type='checkbox' name='" + en + "' id='" + en + "' cn='" + cn + "' data-mini='true'><label for='" + en + "' title='" + cn + "'>0.00</label></fieldset></div>";
            if (i == hkcutil.sxsm2.length - 1) {
                html += "<div class='clear'></div>";
            }
            html = replaceAllHtml(html);
            $("#numbers2").append(html);
            i++;
        }
        $.mobile.pageContainer.trigger("create");
    }
    
    function changeGcode(code, title) {
    	gn = title;
    	if (code == "19") {
    		$(".39").hide();
    		$(".19").show();
    	} else {
    		$(".19").hide();
    		$(".39").show();
    	}
    	getElm("orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
    	getElm("orderCount").removeClass('spnicon').text('');
    	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
    	gid = code;
    	isAll = true;
    	getRate();
    }
    
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
        $("#gc_" + gid).addClass('ui-btn-active');
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
    }

    function showOrderCount() {
        var count = $("input:checked").length;
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
            });
        }
        showOrderCount();
    }

    function mc(ts) {
        if (ts != undefined && ts != null && ts >= 0 && ts != s) {
            if (ts == 0) {
                $("input[type='checkbox']").each(function(){
                    $(this).checkboxradio("disable");
                });
                clearSelected();
                $("[mpid='issue']").each(function(){
                    $(this).html("当前第&nbsp;<span class='color-red'>"+issue+"</span>&nbsp;期&nbsp;<span class='color-red'>已封盘</span>");
                });
            } else if (ts == 1) {
            	if(fd==1){
	                $("input[type='checkbox']").each(function(){
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
        $.getJSON("${ctx}/hkc/rate/" + gid + "/" + (isAll ? "a" : cv), {t:new Date().getTime()}, function (o) {
            if (o.c == 0) {
                if (isAll || (!isAll && cv != o.v)) {
                    if (o.r != undefined && o.r != null) {
                        $.each(o.r, function (k, v) {
                            if(v[2] == 0){
                            	$("[for='ball-" + eval(k) + "']").text('封单');
                            	$("#ball-" + eval(k)).prev().css('color','red');
                            	$("#ball-" + eval(k)).checkboxradio("disable").checkboxradio( "refresh" );
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
    	initNumbers1()
    	initNumbers2()
    	$("label").addClass("ui-btn-visible");
        $("input[type='checkbox']").on("click", function (e) {
            showOrderCount();
        });
        getElm("orderBtn").on("click", function () {
        	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            var items = $("input:checked");
            if (items.length > 0) {
                toOrderPage();
                gn=replaceAllHtml(gn);$("#hcid").text(gn);
                var tbody = $("#tbody").empty();
                for (var i = 0; i < items.length; i++) {
                    var rid = $(items[i]).attr("id");
                    var num = rid.split("-");
                    var code16 = num[0];
                    num = num[1];
                    if (num.length < 2) {
                        num = "0" + num;
                    }
                    var name = $(items[i]).prev("label").attr("title");
                    var rate = $(items[i]).parent().text();
                    tbody.append("<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1' code16='" + code16 + "' num='" + num + "'>" + replaceAllHtml(name) + "</span><span class='spannum2'>@</span><span class='spannum3'>" + rate + "</span></td><td align='right' class='tdselect' style='border:none;'><span><input id='a_" + rid + "' type='number' name='amt' class='numb_px' data-role='none'><input type='button' aid='a_" + rid + "' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'><input type='button' value='删' aid='" + rid + "' rel='d' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'></span></td></tr>");
                }
                tbody.append("<tr class='trhight' style='border:none;'><td align='center' colspan='2'></td></tr><tr class='trhight' style='border:none;'><td align='center' colspan='2'></td></tr>");
            }else{
                alert("请至少选择一个号码!");
            }
        });
        $("form").on("click", "[rel='d']", function (e) {
            $(this).parent().parent().parent().remove();
            $("#" + $(this).attr("aid")).prop("checked", false).checkboxradio("refresh");
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
            var gameCode16 = "";

            $("#tbody > tr").each(function () {
                var td = $(this).children("[align!=]");
                var code16 = td.children(".spannum1").attr("code16");
                var ball = td.children(".spannum1").attr("num");
                var rate = td.children(".spannum3").text();
                if (code16 != undefined && code16 != null && code16 != "") {
                    gameCode16 = gameCode16 + code16 + ",";
                    betBall = betBall + ball + ",";
                    rateAll = rateAll + rate + ",";
                    noteCount++;
                }
            });
            gameCode16 = gameCode16.substring(0, gameCode16.length - 1);
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
            $("#p_pgameCode").val(gid);
            $("#p_noteCount").val(noteCount);
            $("#p_gameCode16").val(gameCode16);
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
                        $("input[type='checkbox']").each(function () {
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
        getRate();
        showOb();
        countdown();
    });
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>