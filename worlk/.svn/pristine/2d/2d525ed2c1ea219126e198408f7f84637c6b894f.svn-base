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
</head>
<body>
<c:set var="title" value="${msg['label.sport.fb.football']}" />
<div data-role="page" id="choosePage">
    <%@ include file="../page_head.jsp"%>
    <%@ include file="/WEB-INF/page/sport/panel_left.jsp"%>
    <%@ include file="/WEB-INF/page/sport/panel_right.jsp"%>
    <div data-role="content" style="margin:5px 0;">
        <div id="menu_one" data-role="navbar" data-grid="b">
            <ul>
                <li><a t="1">${msg['label.sport.fb.live']}(<span id="mic"></span>)</a></li>
                <li><a t="2">${msg['label.sport.fb.today']}(<span id="mtc"></span>)</a></li>
                <li><a t="3">${msg['label.sport.fb.early']}(<span id="mec"></span>)</a></li>
            </ul>
        </div>
        <div id="menu_two" data-role="navbar" data-grid="a" style="margin-top:1px;">
            <ul>
                <li><a mu="0">${msg['label.sport.fb.hdpou']}(<span id="mhoc"></span>)</a></li>
                <li><a mu="1">${msg['label.sport.fb.parlay']}(<span id="mpc"></span>)</a></li>
            </ul>
        </div>
        <div id="menu_three" data-role="navbar" data-grid="a" style="margin-top:1px;">
            <ul>
                <li><a h="0">${msg['label.sport.allleague']}</a></li>
                <li><a h="1">${msg['label.sport.hotleague']}</a></li>
            </ul>
        </div>
        <div id="liList" data-role="listview" data-count-theme="b" class="reset" data-filter="true" data-filter-placeholder="${msg['label.sport.fb.sl']}" data-inset="true"></div>
    </div>
    <div id="toMuPage" data-role="footer" class="ui-footer-fixed" style="background-color: #054700;">
        <div data-role="navbar" data-iconpos="left">
            <ul>
                <li>
                    <a class="ui-btn-green-defult" href="${ctx}/sport/fb/order" id="t_mubet" data-ajax="false" style="height: 30px; line-height: 30px; font-size: 15px;" class="ui-btn">${msg['label.sport.fb.ggtz']}<span id="ic">0</span>&nbsp;${msg['label.sport.fb.gxx']}</a>
                </li>
            </ul>
        </div>
    </div>    
</div>
</body>
<script type="text/javascript">
    var ss = window.sessionStorage;
    var d_cd = null;
    $(function(){
        $("#returnBtn").on("click", function (e) {
            e.preventDefault();
            window.location.href = "${ctx}/sport";
        });

        $("#refreshBtn").on("click", function () {
            clearTimeout(d_cd);
            $("#r_cd").text(90);
            reqData();
            rcd();
        });

        $("a[t]").on("click", function () {
            ss.removeItem("t");
            ss.setItem("t", $(this).attr("t"));
            if ($(this).attr("t") == 1) {
                $("#menu_two").hide();
                ss.removeItem("mu");
                ss.setItem("mu", 0);
                ss.removeItem("fb_muis");
                $("a[mu='0']").click();
            } else {
                $("#menu_two").show();
                if (ss.getItem("mu") == null) {
                    $("a[mu='0']").click();
                } else {
                    $("a[mu='" + ss.getItem("mu") + "']").click();
                }
            }
        });

        $("a[mu]").on("click", function () {
            ss.removeItem("mu");
            ss.setItem("mu", $(this).attr("mu"));
            if (ss.getItem("h") == null) {
                $("a[h='0']").click();
            } else {
                $("a[h='" + ss.getItem("h") + "']").click();
            }
        });

        $("a[h]").on("click", function () {
            ss.removeItem("h");
            ss.setItem("h", $(this).attr("h"));
            clearTimeout(d_cd);
            $("#r_cd").text(90);
            reqData();
            rcd();
            showMulti();
        });

        if (ss.getItem("t") == null) {
            $("a[t='1']").click();
        } else {
            $("a[t='" + ss.getItem("t") + "']").click();
        }

        $("#liList").on("click", "a[menu]", function (e) {
            e.preventDefault();
            var l = new Object();
            l.url = $(this).attr("href");
            l.name = $(this).attr("title");
            ss.removeItem("rm_l");
            ss.setItem("rm_l", JSON.stringify(l));
            window.location = l.url;
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
        
		showMulti();
    })

	function showMulti(){
        if (ss.getItem("mu") != 1) {
            $("#toMuPage").hide();
        } else {
       	 	$("#toMuPage").show();
            if (ss.getItem("fb_muis") == null) {
                $("#ic").text(0);
            } else {
                var items = JSON.parse(ss.getItem("fb_muis"));
                $("#ic").text(items.length);
            }
        }	
	}
    function reqData(){
    	showLoader("${msg['msg.common.loading']}");
        var mu = ss.getItem("mu");
        var t = ss.getItem("t");
        var h = ss.getItem("h");
        $.getJSON("${ctx}/sport/fb/t/" + t + "/mu/" + mu + "/h/" + h, function (o) {
            if (o.c == 0) {
                var list = $("#liList");
                list.empty();
                for (var i = 0; i < o.d.length; i++) {
                    list.append($("<li><a style='white-space: normal !important;' menu href='${ctx}/sport/fb/league/" + o.d[i][0] + "' title='" + o.d[i][1] + "' data-transition='slide' data-ajax='false'>" + o.d[i][1] + "<span class='ui-li-count'>" + o.d[i][2] + "</span></a></li>"));
                }
                list.listview("refresh");
                $("#mic").text(o.mic);
                $("#mtc").text(o.mtc);
                $("#mec").text(o.mec);
                if (t == 2) {
                    $("#mhoc").text(o.mtc);
                    $("#mpc").text(o.mtmc);
                } else if (t == 3) {
                    $("#mhoc").text(o.mec);
                    $("#mpc").text(o.memc);
                }
            }else{
            	alert("系统异常，请联系客服！");
            	console.log(o.e);
            }
        }).fail(function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				console.log(errorThrown);
			}else if(textStatus == 'parsererror'){
				if(jqXHR.responseText.indexOf("session invalidate") > -1){
					alert("${msg['msg.common.sessionExpired']}");
					window.location.href = "${ctx}/login";					
				}else{
					console.log("parsererror:" + jqXHR.responseText);
				}
			}
 		}).always(function() {
    		hideLoader();
  		});
    }

    function rcd() {
        var num = $("#r_cd").text();
        num -= 1;
        if (num == 0) {
            reqData();
            $("#r_cd").text(90);
        } else {
            $("#r_cd").text(num);
        }
        d_cd = setTimeout("rcd()", 1000);
    }
    
    $("#menu_one").html(replaceAllHtml($("#menu_one").html()));
    $("#menu_two").html(replaceAllHtml($("#menu_two").html()));
    $("#toMuPage").html(replaceAllHtml($("#toMuPage").html()));
</script>
</html>