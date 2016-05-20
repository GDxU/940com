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
<c:set var="title" value="七{[{56CB}]}" />
<div data-role="page" id="choosePage">
 	<c:set var="page_type" value="1" scope="request"/>
    <%@include file="page_head.jsp"%>
    <%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp" %>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
    <div data-role="main" class="ui-content">
        <div style="text-align: center;">
        <div class="ui-on-lottery">	
            <div alt="ob" class="ob">
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
        <div class="mgtop6"></div>
		<div data-role="navbar">
		    <ul>
		        <li><a href="#" id="gc_29" data-ajax="false" onclick="changeGcode('29', '七{[{56CB}]}')">七{[{56CB}]}</a></li>
		        <li><a href="#" id="gc_40" data-ajax="false" onclick="changeGcode('40', '七{[{56CB}]}{[{5LiN5Lit}]}')">七{[{56CB}]}{[{5LiN5Lit}]}</a></li>
		    </ul>
		</div>
        <div class="list_dingtime">
         <div class="table-cotent-lottery">
        <div class="mainframe01">
            <div class="min-overflow">
                <div class="div01">
                    <div class="o-number title-setting brl-1">七{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                    <div class="o-number title-setting brl-1">七{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                </div>
                <div class="div02">
                    <div class="o-number title-setting brl-1">七{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                    <div class="o-number title-setting brl-1">七{[{56CB}]}</div>
                    <div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
                </div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}0</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}0" id="ball-109" data-mini="true"><label for="ball-109">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}0</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}0" id="ball-117" data-mini="true"><label for="ball-117">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}0</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}0" id="ball-125" data-mini="true"><label for="ball-125">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}0</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}0" id="ball-133" data-mini="true"><label for="ball-133">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}1</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}1" id="ball-110" data-mini="true"><label for="ball-110">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}1</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}1" id="ball-118" data-mini="true"><label for="ball-118">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}1</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}1" id="ball-126" data-mini="true"><label for="ball-126">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}1</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}1" id="ball-134" data-mini="true"><label for="ball-134">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}2</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}2" id="ball-111" data-mini="true"><label for="ball-111">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}2</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}2" id="ball-119" data-mini="true"><label for="ball-119">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}2</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}2" id="ball-127" data-mini="true"><label for="ball-127">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}2</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}2" id="ball-135" data-mini="true"><label for="ball-135">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}3</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}3" id="ball-112" data-mini="true"><label for="ball-112">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}3</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}3" id="ball-120" data-mini="true"><label for="ball-120">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}3</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}3" id="ball-128" data-mini="true"><label for="ball-128">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}3</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}3" id="ball-136" data-mini="true"><label for="ball-136">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}4</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}4" id="ball-113" data-mini="true"><label for="ball-113">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}4</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}4" id="ball-121" data-mini="true"><label for="ball-121">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}4</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}4" id="ball-129" data-mini="true"><label for="ball-129">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}4</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}4" id="ball-137" data-mini="true"><label for="ball-137">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}5</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}5" id="ball-114" data-mini="true"><label for="ball-114">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}5</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}5" id="ball-122" data-mini="true"><label for="ball-122">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}5</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}5" id="ball-130" data-mini="true"><label for="ball-130">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}5</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}5" id="ball-138" data-mini="true"><label for="ball-138">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}6</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}6" id="ball-115" data-mini="true"><label for="ball-115">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}6</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}6" id="ball-123" data-mini="true"><label for="ball-123">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}6</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}6" id="ball-131" data-mini="true"><label for="ball-131">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}6</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}6" id="ball-139" data-mini="true"><label for="ball-139">0.00</label></fieldset></div>
            </div>
            <div class="div01">
                <div class="o-number line-color brl-1">{[{5Y2V}]}7</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y2V}]}7" id="ball-116" data-mini="true"><label for="ball-116">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5Y+M}]}7</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5Y+M}]}7" id="ball-124" data-mini="true"><label for="ball-124">0.00</label></fieldset></div>
            </div>
            <div class="div02">
                <div class="o-number line-color brl-1">{[{5aSn}]}7</div>
                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5aSn}]}7" id="ball-132" data-mini="true"><label for="ball-132">0.00</label></fieldset></div>
                <div class="o-number line-color brl-1">{[{5bCP}]}7</div>
                <div class="b-number brl-1 border-b01"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="{[{5bCP}]}7" id="ball-140" data-mini="true"><label for="ball-140">0.00</label></fieldset></div>
            </div>
            <div class="clear"></div>
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
    var gid = "29";
    var gn = "七{[{56CB}]}"
    var pageIdx = 0;
    var isAll = true;
    var cv;
    var s;
    var issue = "${obj.issue}";
	var rateTimer;
	
	$("#gc_29").addClass('ui-btn-active');
	
    function changeGcode(code, title) {
    	gn = title;
    	$(".min-overflow ~ .div01").hide()
    	$(".min-overflow ~ .div02").hide()
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
                            	$("[for='ball-" + eval(k) + "']").text('封单');
                            	$("[for='ball-" + eval(k) + "']").parents(".div01, .div02").show()
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
                            	$("[for='ball-" + eval(k) + "']").parents(".div01, .div02").show()
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
        $("input[type='checkbox']").on("click", function (e) {
            showOrderCount();
        });
        getElm("orderBtn").on("click", function () {
        	 $("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled"); 
        	 $("#submitBtn").removeAttr("disabled"); 
        	
            var items = $("input:checked");
            if (items.length > 0) {
                toOrderPage();
                $("#hcid").text(replaceAllHtml(gn));
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
            $("#submitBtn").attr("disabled","disabled");
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
                    $("#submitBtn").removeAttr("disabled"); 
                    	 $("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled"); 
                        var r = confirm(o.data.description.replace(/\\n/gm, '\n'));
                        if (r == true) {
                            $("#p_isChange").val("1");
                            $("#submitBtn").click();
                        }
                    } else {
                    	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                    	 $("#submitBtn").removeAttr("disabled"); 
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