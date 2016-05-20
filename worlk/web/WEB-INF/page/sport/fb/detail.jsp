<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes" />
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <%@ include file="/WEB-INF/page/i18n.jsp" %>    
    <link rel="stylesheet" href="${staticFileUrl}/css/sport.css?v=${rsvn}">
    <script src="${staticFileUrl}/js/sport/panel.js?v=${rsvn}"></script>
    <style type="text/css">
        .ui-listview>.ui-li-divider {
            padding: .5em 1.143em !important;
            font-size: 14px;
            font-weight: bold;
            cursor: default;
            outline: 0; /* Dividers in custom selectmenus have tabindex */
        }
        .ui-collapsible-inset.ui-collapsible-themed-content .ui-collapsible-content {
          border-left-width: 1px;
          border-right-width: 1px;
        }
        .ui-collapsible-content {
            margin: 0;
            padding: 0;
        }
        .ui-title {
            /* margin: 0 5% 0 5% !important */;
        }
        .lh55{line-height: 55px !important;}
        .xz{background-color: #99cccc;}
        .pop_width {
            width: 350px;
        }
        @media (max-width: 40em) {
            .pop_width {
                width: 300px;
            }
        }
    </style>
</head>
<body>
<c:set var="title" value="${msg['label.sport.fb.football']}" />
<div data-role="page" id="choosePage">
    <%@ include file="../page_head.jsp"%>
    <%@ include file="/WEB-INF/page/sport/panel_left.jsp"%>
    <%@ include file="/WEB-INF/page/sport/panel_right.jsp"%>
    <div data-role="content" style="margin:5px 0;" data-css="games">
        <div id="menu_one" data-role="navbar" data-grid="b">
            <ul>
                <li><a t="1">${msg['label.sport.fb.live']}(<span id="mic"></span>)</a></li>
                <li><a t="2">${msg['label.sport.fb.today']}(<span id="mtc"></span>)</a></li>
                <li><a t="3">${msg['label.sport.fb.early']}(<span id="mec"></span>)</a></li>
            </ul>
        </div>
        <div data-role="header">
            <h1 class="ui-title-noindent" ></h1>
        </div>
        <div class="bg_c_fb">
	        <div class="div_w100 hi30 b_color_04fb">
	            <div class="bcontain_fb">
	                <div id="m_score" class="f_left01 fnt14b lh30"></div>
	                <div id="m_time" class="f_right01 fnt14b lh30"></div>
	            </div>
	        </div>
	        <div class="title_divfb"><!--按钮外框-->
	            <div class="bcontain02fb">
	                <span id="m_name" class="txt_vs"></span>
	            </div>
	        </div>
        </div>
        <ul id="g_list" data-role="listview" data-inset="true" data-shadow="false"></ul>
    </div>
    <div data-role="popup" id="popupDialog" data-overlay-theme="a" data-theme="a" data-dismissible="false" class="pop_width" data-history="false">
        <div role="main" class="ui-content" style="border:#66C1BB 2px solid;">
            <div data-role="header" data-mini="true" style=" background-color: #66C1BB;">
                <a id="closeBet" data-ajax="false" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-delete ui-btn-icon-notext ui-btn-right"></a>
                <h1 style="color: #000000; text-shadow: none; font-weight: bold;">${msg['label.sport.fb.betslip']}</h1>
            </div>
            <div style="margin: 10px 0px 10px 10px; font-size:14px;">
                <div class="t_item">
                    <div><span id="t_sn"></span>&nbsp;&nbsp;<span id="t_gn"></span></div>
                    <div id="t_ln"></div>
                    <div><span id="t_mn"></span></div>
                    <div><span id="t_tn" class="red-bold-text1"></span>&nbsp;@&nbsp;<span class="red-bold-text1" id="t_rt"></span>&nbsp;<span style="color: red; display: none;" id="t_tips">${msg['label.sport.fb.rtc']}</span></div>
                </div>
            </div>
            <div style="background-color: #e9e9e9; color: #000000; padding: 10px 10px 10px 10px; text-shadow:none !important; font-size:14px;">
                <div style="">${msg['label.sport.fb.balances']}<span id="t_money">0</span></div>
                <div><input id="t_amt" type="tel" maxlength="9" placeholder="${msg['label.sport.fb.betamt']}" tabindex="1"></div>
                <div>${msg['label.sport.fb.maxpayout']}<span id="t_maxwin">0</span></div>
                <div>${msg['label.sport.fb.minbet']}<span id="t_minbet">0</span></div>
                <div>${msg['label.sport.fb.maxbet']}<span id="t_maxbet">0</span></div>
            </div>
            <input id="t_order_btn" disabled type="button" value="${msg['label.sport.fb.qrtz']}" data-theme="order" tabindex="2"/>
        </div>
    </div>
    <div id="toMuPage" data-role="footer" class="ui-footer-fixed" style="background-color: #054700;">
        <div data-role="navbar" data-iconpos="left">
            <ul>
                <li>
                    <a href="${ctx}/sport/fb/order" class="ui-btn-green-defult" id="t_mubet" data-ajax="false" style="height: 30px; line-height: 30px; font-size: 15px;" class="ui-btn">${msg['label.sport.fb.ggtz']}<span id="ic">0</span>&nbsp;${msg['label.sport.fb.gxx']}</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var ss = window.sessionStorage;
    var cds = {"cd1": ${obj.cd1}, "cd2": ${obj.cd2}, "cd3": ${obj.cd3}};
    var tid = null;
    var pid = null;
    var d_cd = null;
    var nan_rt = "--";
    $(function () {
	    //enter
		var $ipt = $('input').not(":hidden");
		$ipt.bind('keydown', function(e) {
		    var key = e.which;
		    if (key == 13) {
		        e.preventDefault();
		        var nxtIdx = $ipt.index(this) + 1;
		        $ipt.eq(nxtIdx).focus().trigger("click");
		        if(nxtIdx == 2){
		        	$("#t_order_btn").click();
		        }
		    }
		}); 
		    
        $("#r_cd").text(cds["cd" + ss.getItem("t")]);
        $("#returnBtn").on("click", function (e) {
            e.preventDefault();
            ss.removeItem("rm_m");
            window.location.href = JSON.parse(ss.getItem("rm_l")).url;
        });
        $("a[t]").on("click", function () {
            if ($(this).attr("t") != ss.getItem("t")) {
                ss.removeItem("t");
                ss.setItem("t", $(this).attr("t"));
                if ($(this).attr("t") == 1) {
                    ss.removeItem("mu");
                    ss.setItem("mu", 0);
                    ss.removeItem("fb_muis");
                }
                window.location.href = "${ctx}/sport/fb";
            }
        });
        if (ss.getItem("t") == null) {
            $("a[t='1']").click();
        } else {
            $("a[t='" + ss.getItem("t") + "']").click();
        }
        $("#closeBet").on("click", function () {
            $("#t_amt").val("");
            $("#t_maxwin").text(0);
            $("#t_minbet").text(0);
            $("#t_maxbet").text(0);
            $("#t_order_btn").val(replaceAllHtml("${msg['label.sport.fb.qrtz']}"));
            $("#t_order_btn").button("refresh");
            $("#t_order_btn").button("disable");
            $("#popupDialog").popup("close");
        });
        $("#t_mubet").on("click", function (e) {
            e.preventDefault();
            var items = JSON.parse(ss.getItem("fb_muis"));
            if (items.length > 1) {
                ss.setItem("mu_bet_ref", window.location.href);
                window.location.href = $(this).attr("href");
            } else {
                alert("${msg['label.sport.fb.tip.ggzs']}");
                $("#t_mubet").removeClass("ui-btn-active");
            }
        });
        
        $("#t_amt").on("keyup", function () {
			this.value = this.value.replace(/[^0-9]/g,'');
            var mt;
            if (",2,3,4,".indexOf(pid) != -1) {
                mt = ss.getItem("m");
            } else {
                mt = 4;
            }
            var mw = risk(mt, pid, $(this).val(), $("#t_rt").text());
            mw = mw + "";
            if (mw.indexOf(".") != -1) {
                var pos = mw.indexOf(".") + 4;
                $("#t_maxwin").text(mw.substring(0, pos > mw.length ? mw.length : pos));
            } else {
                $("#t_maxwin").text(mw);
            }
        }).focus(function(){
	        $(this).blur(function(){ this.value = (/[^0-9]/g.test(this.value)) ? '' : this.value; });
	    });
	    
        $("#t_order_btn").on("click", function () {
            var param = new Object();
            param.tids = tid + ":" + $("#t_rt").text();
            param.amt = $("#t_amt").val();
            if ($("#t_amt").val() == "") {
                alert("${msg['label.sport.fb.tip.qsrje']}");
                return;
            } else if(Number($("#t_amt").val()) < Number($("#t_minbet").text())){
            	alert("${msg['label.sport.fb.lowerMinbet']}");
            	$("#t_order_btn").button("enable");
            	return;
            } else if(Number($("#t_amt").val()) > Number($("#t_maxbet").text())){
				alert("${msg['label.sport.fb.exceedMaxbet']}");
				$("#t_order_btn").button("enable");
				return;     
            }
            param.pid = pid;
            param.roll = ss.getItem("t") == 1 ? 1 : 0;
            if (",2,3,4,".indexOf(pid) != -1) {
                param.m = ss.getItem("m");
            } else {
                param.m = 4;
            }
            $("#t_order_btn").button("disable");
            $.post("${ctx}/sport/fb/func/bet", param, function (o) {
                //o = JSON.parse(o);
                if(o.c == 0){
                    if(o.d.bst == 1){
                        alert(replaceAllHtml("${msg['label.sport.fb.tip.bs']}"));
                        $("#t_amt").val("");
                        $("#t_maxwin").text(0);
                        $("#t_tips").hide();
                        $("#popupDialog").popup("close");
                    }else{
                        if (o.d.errcode == 1001) {
                            $.getJSON(ss.getItem("ci_url"), function (o) {
                                if (o.c == 0) {
                                    $("#t_minbet").text(o.d.minbet);
                                    $("#t_maxbet").text(o.d.maxbet);
                                    $("#t_rt").text(undefined == o.d.rto ? 0 : o.d.rto);
                                    $("#t_money").text(o.d.money);
                                    $("#t_tips").show();
                                    if (o.d.st == 0) {
                                        $("#t_order_btn").val("${msg['label.sport.fb.bkjy']}");
                                        $("#t_order_btn").button("refresh");
                                        $("#t_order_btn").button("disable");
                                    } else {
                                        $("#t_order_btn").val(replaceAllHtml("${msg['label.sport.fb.qrtz']}"));
                                        $("#t_order_btn").button("refresh");
                                        $("#t_order_btn").button("enable");
                                    }
                                    var mw = risk(param.m, pid, $("#t_amt").val(), $("#t_rt").text());
                                    mw = mw + "";
                                    if (mw.indexOf(".") != -1) {
                                        var pos = mw.indexOf(".") + 4;
                                        $("#t_maxwin").text(mw.substring(0, pos > mw.length ? mw.length : pos));
                                    } else {
                                        $("#t_maxwin").text(mw);
                                    }
                                }
                            });
                        } else if (o.d.errcode == 1015) {
                            alert("${msg['msg.common.sessionExpired']}");
                            window.location.href = "${ctx}/login";
                        } else if (o.d.errcode == 1014) {
                            alert(replaceAllHtml("${msg['label.sport.fb.tip.repeatOrder']}"));
                            $("#popupDialog").popup("close");
                        } else {
                            alert(replaceAllHtml("${msg['label.sport.fb.tip.bf']}") + "\r\n${msg['label.sport.fb.tip.cause']}" + o.d.err);
                            $("#t_order_btn").button("enable");
                        }
                    }
                }else{
                    alert(replaceAllHtml("${msg['label.sport.fb.tip.bf']}") + "\r\n${msg['label.sport.fb.tip.cause']}" + o.e);
                    $("#t_order_btn").button("enable");
                }
            },"json").fail(function(jqXHR, textStatus, errorThrown){
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
        });
        $("#g_list").on("click", "div[tid]", function () {
            var ts = JSON.parse(ss.getItem("rm_s"));
            var tl = JSON.parse(ss.getItem("rm_l"));
            var tm = JSON.parse(ss.getItem("rm_m"));
            var item = new Object();
            item.id = $(this).attr("tid");
            item.pid = $(this).attr("pid");
            item.sn = ts.name;
            item.ln = tl.name;
            item.mn = tm.name;
            item.gn = $(this).parent().parent().prevAll("h2:eq(0)").text();
            item.tn = $(this).contents().eq(0).text();
            item.rt = $(this).contents().eq(1).text();
            item.mid = ${obj.mid};
            if (item.rt == nan_rt) {
                return;
            }
            if (ss.getItem("mu") == 0) {
                $("#t_sn").text(item.sn);
                $("#t_ln").text(item.ln);
                $("#t_mn").text(item.mn);
                $("#t_gn").text(item.gn);
                $("#t_tn").text(item.tn);
                $("#t_rt").text(item.rt);
                tid = item.id;
                pid = item.pid;
                var roll = ss.getItem("t") == 1 ? 1 : 0;
                var m;
                if (",2,3,4,".indexOf(item.pid) != -1) {
                    m = ss.getItem("m");
                } else {
                    m = 4;
                }
                
                var digits = 2;
                if(item.pid == "2" || item.pid == "3" || item.pid == "4"){
                	digits = 3;
                }  
                              
                var ci_url = "${ctx}/sport/fb/func/ci/" + tid + "/" + m + "/" + roll + "/0";
                ss.setItem("ci_url", ci_url);
                $.getJSON(ci_url, function (o) {
                    if (o.c == 0) {
                        if (o.d.errcode == 1015) {
                            alert("${msg['msg.common.sessionExpired']}");
                            window.location.href = "${ctx}/login";
                        }
                        $("#t_minbet").text(o.d.minbet);
                        $("#t_maxbet").text(o.d.maxbet);
                        $("#t_rt").text(Number(undefined == o.d.rto ? 0 : o.d.rto).toFixed(digits));
                        $("#t_money").text(o.d.money);
                        if (o.d.st == 0) {
                            $("#t_order_btn").val("${msg['label.sport.fb.bkjy']}");
                            $("#t_order_btn").button("refresh");
                            $("#t_order_btn").button("disable");
                        } else {
                            $("#t_order_btn").val(replaceAllHtml("${msg['label.sport.fb.qrtz']}"));
                            $("#t_order_btn").button("refresh");
                            $("#t_order_btn").button("enable");
                        }
                    }
                }).always(function() {
		            $("#t_order_btn").val(replaceAllHtml($("#t_order_btn").val()));
		            $("#t_order_btn").button("refresh");
		            $("#t_order_btn").button("enable");
  				});
                
				$("#popupDialog").popup("open", {
				    positionTo: "window",
				    transition: "pop"
				}).popup({
				    afteropen: function(event, ui) {
				        setTimeout(function(){$("#t_amt").focus();}, 1000);
				    }
				});
            } else {
                var items = null;
                var isExist = false;
                if (ss.getItem("fb_muis") == null) {
                    items = new Array();
                } else {
                    items = JSON.parse(ss.getItem("fb_muis"));
                }
                for (var i = 0; i < items.length; i++) {
                    if (items[i].mid == item.mid) {
                        isExist = true;
                        if(items[i].id == item.id){
                            items.splice(i, 1);
                        }else {
                            items.splice(i, 1, item);
                        }
                    }
                }
                if (!isExist) {
                    if (items.length < 10) {
                        items.push(item);
                    } else {
                        alert("${msg['label.sport.fb.tip.zdsc']}")
                    }
                }
                var count = items.length;
                ss.removeItem("fb_muis");
                ss.setItem("fb_muis", JSON.stringify(items));
                $("#ic").text(count);
                xz();
            }
        });
        if (ss.getItem("mu") != 1) {
            $("#toMuPage").hide();
        } else {
            if (ss.getItem("fb_muis") == null) {
                $("#ic").text(0);
            } else {
                var items = JSON.parse(ss.getItem("fb_muis"));
                $("#ic").text(items.length);
            }
        }
        $("#refreshBtn").on("click", function () {
            clearTimeout(d_cd);
            $("#r_cd").text(cds["cd" + ss.getItem("t")]);
            reqData();
            rcd();
        });
        reqData();
        rcd();
    });

    function reqData() {
        var t = ss.getItem("t");
        var mu = ss.getItem("mu");
        var m = ss.getItem("m");
        var mid = ${obj.mid};
        $.getJSON("${ctx}/sport/fb/match/" + t + "/" + mu + "/" + m + "/" + mid, function (o) {
            if (o.c == 0) {
                $("#m_score").text(replaceAllHtml(o.d[4]));
                $("#m_time").text(o.d[3]);
                $("#m_name").html(o.d[2]);
                var list = $("#g_list");
                list.empty();
                var html = "";
                $.each(o.d[5], function (i, v) {
                    //html = html+"<li data-role='list-divider' style='width: 100% !important;'>"+v[3]+"</li>";
                    html = html + "<li data-role='collapsible' data-collapsed='false' " + (i == 0 ? "style='margin-top:81px !important;'" : "") + " data-iconpos='left' data-expanded-icon='carat-u' data-collapsed-icon='carat-d'>";
                    html = html + "<h2>" + replaceAllHtml(v[3]) + "</h2>";
                    var grid = "";
                    if (v[0] == "3") {
                        grid = "w50";
                    } else if (v[0] == "8") {
                        grid = "w33";
                    } else {
                        grid = "w100";
                    }
                    
                    var digits = 2;
                    if(v[0] == "2" || v[0] == "3" || v[0] == "4"){
                    	digits = 3;
                    }
                    
                    $.each(v[4], function (ii, vv) {
                        html = html + "<div class='div_" + grid + " hi55'>";
                        html = html + "<div class='bcontain2' pid='" + v[0] + "' tid='" + vv[0] + "'>";
                        html = html + "<div class='f_left01 fnt14b lh55 itypt'>" + vv[1] + "</div>";
                        html = html + "<div class='f_right01 fnt14red lh55 " + (vv[3] < 0 ? "rt_n" : "rt") + "'>" + (vv[3] == 0 ? nan_rt : Number(vv[3]).toFixed(digits)) + "</div>";
                        html = html + "</div></div>";
                    });
                    html = html + "</li>";
                    if (i == o.d[5].length - 1) {
                        html = html+"<div>&nbsp;</div><div>&nbsp;</div>";
                    }
                });
                list.append(html);
                $("li[data-role='collapsible']").collapsible();
                $("#g_list").listview("refresh");
                $(".ui-collapsible-heading-status").remove();
                $("#mic").text(o.mic);
                $("#mtc").text(o.mtc);
                $("#mec").text(o.mec);
                xz();
            }else{
                alert("${msg['label.sport.fb.tip.nogame']}");
                $("#returnBtn").click();
            }
        }).always(function() {
  		});
        $("h1").eq(1).text(JSON.parse(ss.getItem("rm_l")).name);
    }

    function rcd() {
        var num = $("#r_cd").text();
        num -= 1;
        if (num == 0) {
            reqData();
            $("#r_cd").text(cds["cd" + ss.getItem("t")]);
        } else {
            $("#r_cd").text(num);
        }
        d_cd = setTimeout("rcd()", 1000);
    }

    function risk(mt, pid, bet, rt) {
        var profit = 0, risk = 0;
        var ratio = rt;
        if (!/^[234]$/.test(pid) || mt == 4) {
            ratio -= 1;
        }
        if (ratio < 0) {
            profit = bet;
            profit = Number(profit).toFixed(2)
            risk = Math.round(ratio * bet * 100) / 100;
        } else {
            profit = Math.round(ratio * bet * 100) / 100;
            profit = profit.toFixed(2)
            risk = bet * -1;
        }
        return profit;
    }

    function xz() {
        if (ss.getItem("fb_muis") != null && ss.getItem("mu") == 1) {
            var items = JSON.parse(ss.getItem("fb_muis"));
            var ids = ",";
            for (var i = 0; i < items.length; i++) {
                ids += items[i].id + ",";
            }
            $("[tid]").each(function () {
                var tid = "," + $(this).attr("tid") + ",";
                if (ids.indexOf(tid) == -1) {
                    $(this).removeClass("xz");
                } else {
                    $(this).addClass("xz");
                }
            });
        }
    }
    $("#menu_one").html(replaceAllHtml($("#menu_one").html()));
    $("#t_mubet").html(replaceAllHtml($("#t_mubet").html()));
</script>
</html>