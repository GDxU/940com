<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <%@ include file="/WEB-INF/page/i18n.jsp" %>        
    <link rel="stylesheet" href="${staticFileUrl}/css/sport.css?v=${rsvn}">
    <script src="${staticFileUrl}/js/sport/panel.js?v=${rsvn}"></script>
    <style type="text/css">
        .aaa > .ui-input-text {
            margin: 10px !important;
        }

        .t_item {
            width: 100%;
            height: auto;
            border-bottom: #DDDDDD 1px solid;
        }

        .t_content {
            float: left;
            width: 60%;
            height: auto;
            font-size:14px;
        }

        .t_del_btn {
            float: right;
            width: 46px;
            height: 100%;
        }
    </style>
</head>
<body>
<c:set var="title" value="${msg['label.sport.fb.parlay']} ${msg['label.sport.fb.betslip']}"/>
<div data-role="page" id="choosePage">
    <%@ include file="../page_head.jsp" %>
    <%@ include file="/WEB-INF/page/sport/panel_left.jsp" %>
    <%@ include file="/WEB-INF/page/sport/panel_right.jsp" %>
    <div data-role="content">
        <div id="t_list" style="margin: 0; float:left; width:100%;">
            <div class="t_item">
                <div class="t_content">
                    <div style="margin: 10px;">
                        <div><span id="t_sn"></span>&nbsp;&nbsp;<span id="t_gn"></span></div>
                        <div id="t_ln"></div>
                        <div><span id="t_mn"></span></div>
                        <div><span id="t_tn"></span>&nbsp;&nbsp;@&nbsp;&nbsp;<span style="color: darkred;" id="t_rt"></span></div>
                    </div>
                </div>
                <div class="t_del_btn">
                    <div class="ui-input-btn ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all">
                        <input type="button" data-enhanced="true" style="top:50%; position: absolute;">
                    </div>
                </div>
                <div style="clear: both; height: 1px;"></div>
            </div>
        </div>
        <div style="background-color: #c6ecbd; color: #000000; padding-top:10px;  text-shadow:none !important; font-size:14px; float: left; width:100%;">
        	<div style="text-indent:12px;">${msg['label.sport.fb.balances']}<span id="t_money">0</span></div>
            <div class="aaa" style=" float: left; width: 100%;">
				<input id="t_amt" type="tel" maxlength="9" placeholder="${msg['label.sport.fb.betamt']}">
            </div>
            <div style="margin: 0 10px 10px 10px; float: left; width: 100%;">
                <div>${msg['label.sport.fb.maxpayout']}<span id="t_maxwin">0</span></div>
                <div>${msg['label.sport.fb.minbet']}<span id="t_minbet">0</span></div>
                <div>${msg['label.sport.fb.maxbet']}<span id="t_maxbet">0</span></div>
                <div>${msg['label.sport.fb.tip.maxPayout']}: RMB 1,000,000</div>
            </div>
        </div>
        <div class="ui-field-contain" style="margin:0 !important; padding:0 !important;">
        	<div class="ui-grid-a">
        		<div class="ui-block-a">
        		<input id="t_clear_btn" type="button" value="${msg['label.sport.fb.clear']}" data-theme="clear"/>
        		</div>
        		<div class="ui-block-b">
        		<input id="t_order_btn" disabled type="button" value="${msg['label.sport.fb.qrtz']}" data-theme="order"/>
        		</div>
        	</div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var ss = window.sessionStorage;
    var items = null;
    $(function () {
        $("#returnBtn").on("click", function (e) {
            e.preventDefault();
            window.location.href = ss.getItem("mu_bet_ref");
        });

        $("#refreshBtn").hide();

        $("#t_list").on("click", ".t_del_btn", function () {
            var tid = $(this).attr("tid");
            for (var i = 0; i < items.length; i++) {
                if (items[i].id == tid) {
                    items.splice(i, 1);
                    $(".t_item[tid='" + tid + "']").remove();
                }
            }
            ss.setItem("fb_muis", JSON.stringify(items));
        });

        $("#t_amt").on("keyup", function (e) {
			this.value = this.value.replace(/[^0-9]/g,'');
            var mw = 1;
            $(".t_rt").each(function (i, v) {
                mw = mw * $(v).text();
            });
            mw = mw * $(this).val() - $(this).val();
            mw = mw.toFixed(2);
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
            if (items.length < 2) {
                alert("${msg['label.sport.fb.tip.ggzs']}");
                return;
            }
            var param = new Object();
            var tids = "";
            for (var i = 0; i < items.length; i++) {
                tids += items[i].id + ":" + $(".t_rt[tid='" + items[i].id + "']").text() + ",";
            }
            tids = tids.substring(0, tids.length - 1);
            param.tids = tids;
            if ($("#t_amt").val() == "") {
                alert("${msg['label.sport.fb.tip.qsrje']}");
                return;
            }else if(Number($("#t_amt").val()) < Number($("#t_minbet").text())){
            	alert("${msg['label.sport.fb.lowerMinbet']}");
            	$("#t_order_btn").button("enable");
            	return;
            }else if(Number($("#t_amt").val()) > Number($("#t_maxbet").text())){
				alert("${msg['label.sport.fb.exceedMaxbet']}");
				$("#t_order_btn").button("enable");
				return;     
            }
            param.amt = $("#t_amt").val();
            param.roll = 0;
            param.pid = -1;
            $("#t_order_btn").button("disable");
            $.post("${ctx}/sport/fb/func/bet", param, function (o) {
                //o = JSON.parse(o);
                if(o.c == 0){
                    if (o.d.bst == 1) {
                        alert(replaceAllHtml("${msg['label.sport.fb.tip.bs']}"));
                        back();
                    } else {
                        if (o.d.errcode == 1015) {
                            alert("${msg['msg.common.sessionExpired']}");
                            window.location.href = "${ctx}/login";
                        } else if (o.d.errcode == 1014) {
                            //alert(replaceAllHtml("${msg['label.sport.fb.tip.repeatOrder']}"));
	                        alert(replaceAllHtml("${msg['label.sport.fb.tip.repeatOrder']}"));
	                        back();
                        } else {
                            alert(replaceAllHtml("${msg['label.sport.fb.tip.bf']}") + "\r\n${msg['label.sport.fb.tip.cause']}" + o.d.err);
                            if (o.d.errcode != 1004) {
                                back();
                            }
                        }
                    }
                    $("#t_order_btn").button("enable");
                }else{
                    alert(replaceAllHtml("${msg['label.sport.fb.tip.bf']}") + "\r\n${msg['label.sport.fb.tip.cause']}" + o.e);
                    //$("#t_order_btn").button("enable");
                    back();                  
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

        $("#t_clear_btn").on("click", function () {
            ss.removeItem("fb_muis")
            window.location.href = ss.getItem("mu_bet_ref");
        });

        loadData();
    })
    
    function back(){
	    $("#t_amt").val("");
	    ss.removeItem("fb_muis");
	    $("#t_list").empty();
	    window.location.href = ss.getItem("mu_bet_ref");      
    } 

    function loadData() {
        if (ss.getItem("fb_muis") != null) {
            items = JSON.parse(ss.getItem("fb_muis"));
        }
        if (items != null) {
            var list = $("#t_list");
            list.empty();
            var tids = "";
            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                tids = tids + item.id + ",";
                var html = "<div class='t_item' tid='" + item.id + "'>";
                html = html + "<div class='t_content'>";
                html = html + "<div style='margin: 10px;'>";
                html = html + "<div><span id='t_sn'>" + item.sn + "</span>&nbsp;<span id='t_gn'>" + item.gn + "</span></div>";
                html = html + "<div id='t_ln'>" + item.ln + "</div>";
                html = html + "<div><span id='t_mn'>" + item.mn + "</span></div>";
                html = html + "<div><span id='t_tn' class='red-bold-text1'>" + item.tn + "</span>&nbsp;@&nbsp;<span class='t_rt' tid='" + item.id + "'>" + item.rt + "</span></div>";
                html = html + "</div>";
                html = html + "</div>";
                html = html + "<div class='t_del_btn' tid='" + item.id + "'>";
                html = html + "<div class='ui-input-btn ui-btn ui-icon-delete ui-btn-icon-notext ui-corner-all'>";
                html = html + "<input type='button' data-enhanced='true' style='top:50%; position: absolute;'>";
                html = html + "</div>";
                html = html + "</div>";
                html = html + "<div style='clear: both; height: 1px;'></div>";
                html = html + "</div>";
                list.append(html);
            }
            $.getJSON("${ctx}/sport/fb/func/ci/" + tids + "/4/0/1", function (o) {
                if (o.c == 0) {
                    if (o.d.errcode == 1015) {
                        alert("${msg['msg.common.sessionExpired']}");
                        window.location.href = "${ctx}/login";
                    }
                    var ok = true;
                    $("#t_minbet").text(undefined == o.d.minbet ? 0 : o.d.minbet);
                    $("#t_maxbet").text(undefined == o.d.maxbet ? 0 : o.d.maxbet);
                    $("#t_money").text(o.d.money);
                    if(undefined == o.d.rto){
                    	ok = true;
                    }else{
	                    for (var i = 0; i < o.d.rto.length; i++) {
	                        $(".t_rt[tid='" + o.d.tid[i] + "']").text(o.d.rto[i]);
	                        if (o.d.st[i] == 0) {
	                            ok = false;
	                        }
	                    }
                    }
                    if (ok) {
                        $("#t_order_btn").val(replaceAllHtml("${msg['label.sport.fb.qrtz']}"));
                        $("#t_order_btn").button("enable");
                        $("#t_order_btn").button("refresh");
                    } else {
                        $("#t_order_btn").val("${msg['label.sport.fb.bkjy']}");
                        $("#t_order_btn").button("disable");
                        $("#t_order_btn").button("refresh");
                    }
                }
            }).always(function() {
	            $("#t_order_btn").val(replaceAllHtml($("#t_order_btn").val()));
	            $("#t_order_btn").button("refresh");
	            $("#t_order_btn").button("enable");
  			});
        }
    }
    
</script>
</html>