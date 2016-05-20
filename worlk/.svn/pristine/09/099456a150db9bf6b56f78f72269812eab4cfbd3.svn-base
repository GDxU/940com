
<%//总{[{6IKW}]} 2015-04-26 %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp"%>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<%@include file="hkcutil.jsp"%>
</head>
<body>
	<c:set var="title" value="{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}" />
	<div data-role="page" id="choosePage">
		<c:set var="page_type" value="1" scope="request" />
		<%@include file="page_head.jsp"%>
		<%@ include file="/WEB-INF/page/hkc/panel_left_hkc.jsp"%>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp"%>
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
				<div class="table-cotent-lottery">
					<div class="mainframe01">
						<div class="min-overflow">
							<div class="div01">
								<div class="o-number title-setting brl-1">{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}</div>
								<div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
								<div class="o-number title-setting brl-1">{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}</div>
								<div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
							</div>
							<div class="div02">
								<div class="o-number title-setting brl-1">{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}</div>
								<div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
								<div class="o-number title-setting brl-1">{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}</div>
								<div class="b-number title-setting brl-1">{[{6LWU546H}]}</div>
							</div>
						</div>
						<div class="div01">
							<div class="o-number line-color brl-1">{[{5bC+5aSn}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-151"
										data-mini="true"><label title="{[{5bC+5aSn}]}"
										for="ball-151">0.00</label>
								</fieldset>
							</div>
							<div class="o-number line-color brl-1">{[{5bC+5bCP}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-152"
										data-mini="true"><label title="{[{5bC+5bCP}]}"
										for="ball-152">0.00</label>
								</fieldset>
							</div>
						</div>
						<div class="div02">
							<div class="o-number line-color brl-1">{[{5aSn5Y2V}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-153"
										data-mini="true"><label title="{[{5aSn5Y2V}]}"
										for="ball-153">0.00</label>
								</fieldset>
							</div>
							<div class="o-number line-color brl-1">{[{5bCP5Y2V}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-154"
										data-mini="true"><label title="{[{5bCP5Y2V}]}"
										for="ball-154">0.00</label>
								</fieldset>
							</div>
						</div>
						<div class="div01">
							<div class="o-number line-color brl-1">{[{5aSn5Y+M}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-155"
										data-mini="true"><label title="{[{5aSn5Y+M}]}"
										for="ball-155">0.00</label>
								</fieldset>
							</div>
							<div class="o-number line-color brl-1">{[{5bCP5Y+M}]}</div>
							<div class="b-number brl-1">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input type="checkbox" name="ball" id="ball-156"
										data-mini="true"><label title="{[{5bCP5Y+M}]}"
										for="ball-156">0.00</label>
								</fieldset>
							</div>
						</div>
						<div class="clear" style="height: 10px;"></div>
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
    var gid = 42, gn = "{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}";
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
            	if(fd == 1){
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
                    var name = $(items[i]).prev("label").attr("title");
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
        //initGameInfo();
        getRate();
        showOb();
        countdown();
        
    });
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>