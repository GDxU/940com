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
<c:set var="title" value="{[{6b6Z6JmO}]}" />
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
					<table border="1" class="hdptable ui-table-qxstar">
						<thead>
							<tr class="tr-bgcolor">
								<th data-priority="1">号码</th>
								<th data-priority="2">{[{6LWU546H}]}</th>
								<th data-priority="3">号码</th>
								<th data-priority="4">{[{6LWU546H}]}</th>
								<th data-priority="5">号码</th>
								<th data-priority="6">{[{6LWU546H}]}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-1"
											id="D-0-1" data-mini="true"><label
											title="第一球[龙1VS虎2]龙1" for="D-0-1">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-2"
											id="D-0-2" data-mini="true"><label
											title="第一球[龙1VS虎3]龙1" for="D-0-2">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-3"
											id="D-0-3" data-mini="true"><label
											title="第一球[龙1VS虎4]龙1" for="D-0-3">0.00</label>
									</fieldset></td>

							</tr>

							<tr>
								<td class="td-bgcolor">虎2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-1"
											id="T-0-1" data-mini="true"><label
											title="第一球[龙1VS虎2]虎2" for="T-0-1">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-2"
											id="T-0-2" data-mini="true"><label
											title="第一球[龙1VS虎3]虎3" for="T-0-2">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-3"
											id="T-0-3" data-mini="true"><label
											title="第一球[龙1VS虎4]虎4" for="T-0-3">0.00</label>
									</fieldset></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-4"
											id="D-0-4" data-mini="true"><label
											title="第一球[龙1VS虎5]龙1" for="D-0-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-5"
											id="D-0-5" data-mini="true"><label
											title="第一球[龙1VS虎6]龙1" for="D-0-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙1</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-0-6"
											id="D-0-6" data-mini="true"><label
											title="第一球[龙1VS虎7]龙1" for="D-0-6">0.00</label>
									</fieldset></td>

							</tr>
							<tr>
								<td class="td-bgcolor">虎5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-4"
											id="T-0-4" data-mini="true"><label
											title="第一球[龙1VS虎5]虎5" for="T-0-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-5"
											id="T-0-5" data-mini="true"><label
											title="第一球[龙1VS虎6]虎6" for="T-0-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-0-6"
											id="T-0-6" data-mini="true"><label
											title="第一球[龙1VS虎7]虎7" for="T-0-6">0.00</label>
									</fieldset></td>
							</tr>

							<tr class="sepd-line">
								<td colspan="8"></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-1-2"
											id="D-1-2" data-mini="true"><label
											title="第二球[龙2VS虎3]龙2" for="D-1-2">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-1-3"
											id="D-1-3" data-mini="true"><label
											title="第二球[龙2VS虎4]龙2" for="D-1-3">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-1-4"
											id="D-1-4" data-mini="true"><label
											title="第二球[龙2VS虎5]龙2" for="D-1-4">0.00</label>
									</fieldset></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-1-2"
											id="T-1-2" data-mini="true"><label
											title="第二球[龙2VS虎3]虎3" for="T-1-2">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-1-3"
											id="T-1-3" data-mini="true"><label
											title="第二球[龙2VS虎4]虎4" for="T-1-3">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-1-4"
											id="T-1-4" data-mini="true"><label
											title="第二球[龙2VS虎5]虎5" for="T-1-4">0.00</label>
									</fieldset></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-1-5"
											id="D-1-5" data-mini="true"><label
											title="第二球[龙2VS虎6]龙2" for="D-1-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙2</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-1-6"
											id="D-1-6" data-mini="true"><label
											title="第二球[龙2VS虎7]龙2" for="D-1-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-1-5"
											id="T-1-5" data-mini="true"><label
											title="第二球[龙2VS虎6]虎6" for="T-1-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-1-6"
											id="T-1-6" data-mini="true"><label
											title="第二球[龙2VS虎7]虎7" for="T-1-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr class="sepd-line">
								<td colspan="8"></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-2-3"
											id="D-2-3" data-mini="true"><label
											title="第三球[龙3VS虎4]龙3" for="D-2-3">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-2-4"
											id="D-2-4" data-mini="true"><label
											title="第三球[龙3VS虎5]龙3" for="D-2-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-2-5"
											id="D-2-5" data-mini="true"><label
											title="第三球[龙3VS虎6]龙3" for="D-2-5">0.00</label>
									</fieldset></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-2-3"
											id="T-2-3" data-mini="true"><label
											title="第三球[龙3VS虎4]虎4" for="T-2-3">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-2-4"
											id="T-2-4" data-mini="true"><label
											title="第三球[龙3VS虎5]虎5" for="T-2-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-2-5"
											id="T-2-5" data-mini="true"><label
											title="第三球[龙3VS虎6]虎6" for="T-2-5">0.00</label>
									</fieldset></td>
							</tr>
							
							<tr>
								<td class="td-bgcolor">龙3</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-2-6"
											id="D-2-6" data-mini="true"><label
											title="第三球[龙3VS虎7]龙3" for="D-2-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-2-6"
											id="T-2-6" data-mini="true"><label
											title="第三球[龙3VS虎7]虎7" for="T-2-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr class="sepd-line">
								<td colspan="8"></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-3-4"
											id="D-3-4" data-mini="true"><label
											title="第四球[龙4VS虎5]龙4" for="D-3-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-3-5"
											id="D-3-5" data-mini="true"><label
											title="第四球[龙4VS虎6]龙4" for="D-3-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙4</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-3-6"
											id="D-3-6" data-mini="true"><label
											title="第四球[龙4VS虎7]龙4" for="D-3-6">0.00</label>
									</fieldset></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-3-4"
											id="T-3-4" data-mini="true"><label
											title="第四球[龙4VS虎5]虎5" for="T-3-4">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-3-5"
											id="T-3-5" data-mini="true"><label
											title="第四球[龙4VS虎6]虎6" for="T-3-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-3-6"
											id="T-3-6" data-mini="true"><label
											title="第四球[龙4VS虎7]虎7" for="T-3-6">0.00</label>
									</fieldset></td>
							</tr>
							<tr class="sepd-line">
								<td colspan="8"></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-4-5"
											id="D-4-5" data-mini="true"><label
											title="第五球[龙5VS虎6]龙5" for="D-4-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">龙5</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-4-6"
											id="D-4-6" data-mini="true"><label
											title="第五球[龙5VS虎7]龙5" for="D-4-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-4-5"
											id="T-4-5" data-mini="true"><label
											title="第五球[龙5VS虎6]虎6" for="T-4-5">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-4-6"
											id="T-4-6" data-mini="true"><label
											title="第五球[龙5VS虎7]虎7" for="T-4-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr class="sepd-line">
								<td colspan="8"></td>
							</tr>
							<tr>
								<td class="td-bgcolor">龙6</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="D-5-6"
											id="D-5-6" data-mini="true"><label
											title="第六球[龙6VS虎7]龙6" for="D-5-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>
							<tr>
								<td class="td-bgcolor">虎7</td>
								<td><fieldset data-role="controlgroup"
										data-type="horizontal">
										<input type="checkbox" name="T-5-6"
											id="T-5-6" data-mini="true"><label
											title="第六球[龙6VS虎6]虎7" for="T-5-6">0.00</label>
									</fieldset></td>
								<td class="td-bgcolor"></td>
								<td></td>
								<td class="td-bgcolor"></td>
								<td></td>
							</tr>

						</tbody>
					</table>
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
    var gid = 41;
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
                $("input[type='checkbox']").each(function(){
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
        $.getJSON("${ctx}/hkc/rate/41/" + (isAll ? "a" : cv), {t:new Date().getTime()}, function (o) {
            if (o.c == 0) {
                if (isAll || (!isAll && cv != o.v)) {
                    if (o.r != undefined && o.r != null) {
                        $.each(o.r, function (k, v) {
                            var ks = k.split("-");
                            if(0==v[2]){
                            	$("[for='" + ks[0] + "-" + ks[1] + "-" + ks[2] + "']").text('封单');
                            	$("#" + ks[0] + "-" + ks[1] + "-" + ks[2]).prev().css('color','red');
								$("#" + ks[0] + "-" + ks[1] + "-" + ks[2]).checkboxradio("disable");
                            	fd = 0;
                            }else{
                            	fd = 1;
                            	$("#" + ks[0] + "-" + ks[1] + "-" + ks[2]).prev().css('color','#000000');
								if(o.s==1){
									$("#" + ks[0] + "-" + ks[1] + "-" + ks[2]).checkboxradio("enable");
								}
                            	$("[for='" + ks[0] + "-" + ks[1] + "-" + ks[2] + "']").text(v[0]);
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
         	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            gameCode16 = "";
            passType = "";
            rate = 1;
            
            var items = $("input:checked");
            if (items.length > 0) {
                toOrderPage();
                $("#hcid").text(replaceAllHtml("龙{[{6JmO}]}"));
                var tbody = $("#tbody").empty();
                for (var i = 0; i < items.length; i++) {
                    var rid = $(items[i]).attr("id");
                    var num = rid;
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
            $("[type='radio']").each(function () {
                $(this).prop("checked", false).checkboxradio("refresh");
            });
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
            $("#p_gameCode").val(gid);
            $("#p_pgameCode").val(gid);
            
            var betAmount = "";
            var amount = 0;
            var noteCount = 0;
            
            var amt = $("[name='amt']").val();
			if(!/^[1-9]+[0-9]*]*$/.test(amt)){
				var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
				return;
			}        
			
			$("[name='amt']").each(function (i, v) {
                var vv = $(v).val();
                if (vv != undefined && vv != null && vv != "") {
                    betAmount = betAmount + vv + ",";
                    amount += eval(vv);
                }
            });
			
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
            betAmount = betAmount.substring(0, betAmount.length - 1);
			$("#p_betBall").val(betBall);
            $("#p_rateAll").val(rateAll);
            $("#p_rate").val(rateAll);
			$("#p_noteCount").val(noteCount);
            $("#p_amount").val(amount);
            $("#p_betAmount").val(betAmount);
            $("#p_passType").val(passType);
            $("#p_gameCode16").val(gameCode16);
            $("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
            showSubmit("注单提交中,请稍后...");
            $.post("${ctx}/hkc/addOrder", $("form").serialize(), function (o) {
            	betBall = "";
                rateAll = "";
            	hideLoader();
                o = $.parseJSON(o);
                if (o.r == 0) {
                    if (o.data.code == "1") {
                        $("[type='checkbox']").each(function () {
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