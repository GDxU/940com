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
<c:set var="title" value="五{[{6KGM}]}半{[{5rOi}]}" />
<c:if test="${obj.wx.isShow && !obj.bb.isShow}">
    <c:set var="title" value="五{[{6KGM}]}" />
</c:if>
<c:if test="${!obj.wx.isShow && obj.bb.isShow}">
    <c:set var="title" value="半{[{5rOi}]}" />
</c:if>
<c:if test="${obj.wx.isShow}">
<div data-role="page" id="wuxingPage">
 	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
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
        <div data-role="navbar" data-mini="true">
            <ul>
                <c:if test="${obj.wx.isShow}">
                    <li><a mpid="wx" gid="20">五{[{6KGM}]}</a></li>
                </c:if>
                <c:if test="${obj.bb.isShow}">
                    <li><a mpid="bb" gid="21">半{[{5rOi}]}</a></li>
                </c:if>
            </ul>
        </div>
     <div class="table-cotent-lottery">   
        <div style="margin-top:10px;"></div>
        <div class="mainframe01" id="wuxingNumber">
            <div class="min-overflow">
                <div class="type-hk1-t title-setting brl-1">五{[{6KGM}]}</div>
                <div class="group-kh1-t title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                <div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
            </div>
        </div>
    </div>
    </div>
    </div>
</div>
</c:if>
<c:if test="${obj.bb.isShow}">
<div data-role="page" id="banboPage">
    <%@include file="page_head.jsp"%>
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
            <div class="w100 arr-center font-bold" mpid="issue"></div>
            </div>
        </div>
        <div class="list_dingtime">
        <div data-role="navbar" data-mini="true">
            <ul>
                <c:if test="${obj.wx.isShow}">
                    <li><a mpid="wx" gid="20">五{[{6KGM}]}</a></li>
                </c:if>
                <c:if test="${obj.bb.isShow}">
                    <li><a mpid="bb" gid="21">半{[{5rOi}]}</a></li>
                </c:if>
            </ul>
        </div>
        <div style="margin-top:10px;"></div>
        <div class="table-cotent-lottery">
        <div class="mainframe01" id="banboNumber">
            <div class="min-overflow">
                <div class="type-hk1-t title-setting brl-1">{[{54m556CB}]}生{[{6IKW}]}</div>
                <div class="group-kh1-t title-setting brl-1">{[{5Y+3}]}{[{56CB}]}</div>
                <div class="value-kh1-t title-setting brl-1">{[{6LWU546H}]}</div>
            </div>
            <c:if test="${aa}">
                <div class="type-hk1 brl-1"><div>鼠</div></div>
                <div class="group-kh1 brl-1"><div class="float-c"><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div></div></div>
                <div class="value-kh1 brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball-2" id="ball-2" data-mini="true"><label for="ball-2">0.00</label></fieldset></div>
                <div class="type-hk1 brl-1"><div>鼠</div></div>
                <div class="group-kh1 brl-1"><div class="float-c"><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div><div class="ball2 red-ball float-l" ball="2">2</div></div></div>
                <div class="value-kh1 brl-1 border-b01"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="ball-2" id="ball-3" data-mini="true"><label for="ball-3">0.00</label></fieldset></div>
                <div class="clear"></div>
            </c:if>
        </div>
        </div>
        </div>
    </div>
</div>
</c:if>
<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
<%@include file="bet.jsp"%>
</body>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
<script type="text/javascript">
    var hkcutil = new HKCUtil();
    var ob = "${obj.ob}".split(",");
    var gid, gn, rPage;
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var rateTimer;
    var s;
    var issue = "${obj.issue}";
    var swx = ${obj.wx.isShow}
    var sbb = ${obj.bb.isShow}

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

    function toWuxingPage() {
        pageIdx = 0;
        $.mobile.changePage("#wuxingPage", {changeHash: false, transition:'none'});
        getElm("wx").addClass("ui-btn-active");
        if (rPage == undefined || rPage == null) {
            clearSelected();
        }
        rPage = null;
        showOrderCount();
    }
    function toBanboPage() {
        pageIdx = swx && sbb ? 1 : 0;
        $.mobile.changePage("#banboPage", {changeHash: false, transition:'none'});
        getElm("bb").addClass("ui-btn-active");
        if (rPage == undefined || rPage == null) {
            clearSelected();
        }
        rPage = null;
        showOrderCount();
    }

    function toOrderPage() {
        if(swx&sbb) {
            if (pageIdx == 0) {
                rPage = "toWuxingPage()";
            } else {
                rPage = "toBanboPage()";
            }
            pageIdx = 2;
        }else{
            if(swx){
                rPage = "toWuxingPage()";
            }else{
                rPage = "toBanboPage()";
            }
            pageIdx = 1;
        }
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

    function initWuxingNumbers() {
        var i = 0;
        while (i < hkcutil.fiveElm.length) {
            var method = hkcutil.fiveElm[i][0];
            var en = "20-" + hkcutil.fiveElm[i][2];
            var cn = hkcutil.fiveElm[i][1];
            var nums = eval("hkcutil." + method + "().takeColor()");
            var html = "<div class='type-hk1 brl-1'><div>" + cn + "</div></div><div class='group-kh1 brl-1'><div>";
            for (var j = 0; j < nums.length; j++) {
                html += "<div class='ball2 " + nums[j][1] + "-ball float-l'>" + (nums[j][0]<10?"0":"") + nums[j][0] + "</div>"
            }
            html += "</div></div>";
            html += "<div class='value-kh1 brl-1 " + (i == hkcutil.fiveElm.length - 1 ? "border-b01" : "") + "'><fieldset data-role='controlgroup' data-type='horizontal'><input type='checkbox' name='" + en + "' id='" + en + "' cn='" + cn + "' data-mini='true'><label for='" + en + "'>0.00</label></fieldset></div>";
            if (i == hkcutil.fiveElm.length - 1) {
                html += "<div class='clear'></div>";
            }
            html = replaceAllHtml(html);
            $("#wuxingNumber").append(html);
            i++;
        }
        $.mobile.pageContainer.trigger("create");
    }

    function initBanboNumbers() {
        var i = 0;
        while (i < hkcutil.banbo.length) {
            var method = hkcutil.banbo[i][0];
            var en = "21-" + hkcutil.banbo[i][2];
            var cn = hkcutil.banbo[i][1];
            var nums = eval("hkcutil." + method + "().takeColor()");
            var html = "<div class='type-hk1 brl-1'><div>" + cn + "</div></div><div class='group-kh1 brl-1'><div>";
            for (var j = 0; j < nums.length; j++) {
                html += "<div class='ball2 " + nums[j][1] + "-ball float-l'>" + (nums[j][0]<10?"0":"") + nums[j][0] + "</div>"
            }
            html += "</div></div>";
            html += "<div class='value-kh1 brl-1 " + (i == hkcutil.banbo.length - 1 ? "border-b01" : "") + "'><fieldset data-role='controlgroup' data-type='horizontal'><input type='checkbox' name='" + en + "' id='" + en + "' cn='" + cn + "' data-mini='true'><label for='" + en + "'>0.00</label></fieldset></div>";
            if (i == hkcutil.banbo.length - 1) {
                html += "<div class='clear'></div>";
            }
            html = replaceAllHtml(html);
            $("#banboNumber").append(html);
            i++;
        }
        $.mobile.pageContainer.trigger("create");
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
                        	if(0==v[2]){
                        		$("[for='" + gid + "-" + eval(k) + "']").text('封单');
                        		$("#" + gid + "-" + eval(k)).prev().css('color','red');
								$("#" + gid + "-" + eval(k)).checkboxradio("disable");
                            	fd = 0;
                        	}else{
                        		var fd = 1;
                        		$("#" + gid + "-" + eval(k)).prev().css('color','#000000');
								if(o.s==1){
									$("#" + gid + "-" + eval(k)).checkboxradio("enable");
								}
	                            $("[for='" + gid + "-" + eval(k) + "']").text(v[0]);
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
        initWuxingNumbers();
        initBanboNumbers();
        $("label").addClass("ui-btn-visible");
        var tab = $($("a[gid]").get(0));
        tab.addClass("ui-btn-active");
        gid = tab.attr("gid");
        gn = tab.text();
        $("a[gid]").on("click", function () {
            clearTimeout(rateTimer);
            gid = $(this).attr("gid");
            gn = $(this).text();
            if (gid == "20") {
                toWuxingPage();
            } else {
                toBanboPage();
            }
            isAll = true;
            setTimeout("getRate()", 200);
        });
        $("input[type='checkbox']").on("click", function (e) {
            showOrderCount();
        });
        $("[mpid='orderBtn']").on("click", function () {
        	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            var items = $("input:checked");
            if (items.length > 0) {
                toOrderPage();
                gn=replaceAllHtml(gn);$("#hcid").text(gn);
                var tbody = $("#tbody").empty();
                for (var i = 0; i < items.length; i++) {
                    var rid = $(items[i]).attr("id");
                    var num = rid.substring(rid.indexOf("-") + 1, rid.length);
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
            }else{
                alert("请至少选择一个号码!");
            }
        });
        $("form").on("click", "[rel='d']", function (e) {
            $(this).parent().parent().parent().remove();
            $("#" + $(this).attr("aid")).prop("checked", false).checkboxradio("refresh");
            if ($("[rel='d']").size() < 1) {
                eval(rPage);
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
            eval(rPage);
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
            $("#p_pgameCode").val(gid);
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
                        $("input[type='checkbox']").each(function () {
                            $(this).prop("checked", false).checkboxradio("refresh");
                        });
                        var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                        eval(rPage);
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