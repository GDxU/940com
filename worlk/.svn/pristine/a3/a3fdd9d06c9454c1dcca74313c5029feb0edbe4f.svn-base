<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <%@ include file="/WEB-INF/page/i18n.jsp" %>
    <script src="${staticFileUrl}/js/sport/panel.js?v=${rsvn}"></script>
    <link rel="stylesheet" href="${staticFileUrl}/css/sport.css?v=${rsvn}">
</head>
<body>
<section data-role="page" id="lobby_gdsf">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <a href="${ctx}/index" data-role="none"
           class="ui-btn-left ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"></a>
        <div class="header-bg">
            <div class="logo inline-block">
                <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
            </div>
        </div>
        <a href="#user-center" data-role="none"
           class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false"
           id="showUserInfo" data-iconpos="right">${msg['label.sport.fb.uc']}</a>
        <div data-role="header" data-theme="c"><h1 class="ui-title-noindent">${msg['label.sport.fb.stitle']}</h1></div>
    </div>
    <%@ include file="/WEB-INF/page/sport/panel_right.jsp" %>
    <div data-role="content">
        <div data-role="navbar" data-grid="b">
            <ul>
                <li><a t="1" class="ui-btn-active">${msg['label.sport.fb.live']}</a></li>
                <li><a t="2">${msg['label.sport.fb.today']}</a></li>
                <li><a t="3">${msg['label.sport.fb.early']}</a></li>
            </ul>
        </div>
        <div data-role="listview" class="reset">
            <li><a menu href="${ctx}/sport/fb" title="${msg['label.sport.fb.football']}" sid="1" data-transition="slide"
                   data-ajax="false"><span class="icoc-sport sport-football"></span>${msg['label.sport.fb.football']}
            </a></li>
            <li><a menu href="${ctx}/sport/bb" title="${msg['label.sport.fb.basketball']}" sid="2"
                   data-transition="slide" data-ajax="false"><span
                    class="icoc-sport sport-basketball"></span>${msg['label.sport.fb.basketball']}</a></li>
            <li data-icon="false"><a title="${msg['label.sport.fb.other']}" data-transition="slide"
                                     data-ajax="false"><span
                    class="icoc-sport sport-other"></span>${msg['label.sport.fb.other']}<span
                    class="ui-li-count">${msg['msg.portal.coming']}</span></a></li>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    var ss = window.sessionStorage;
    $(function () {
        $("a[t]").on("click", function () {
            ss.removeItem("t");
            var _t = $(this).attr("t");
            ss.setItem("t", _t);
            <%
//                        if (_t == "1") {
//                $("a[sid='2']").hide();
//            }else{
//                $("a[sid='2']").show();
//            }
            %>

        });

        if (ss.getItem("t") == null) {
            $("a[t='1']").click();
        } else {
            $("a[t='" + ss.getItem("t") + "']").click();
        }

        $("a[menu]").on("click", function (e) {
            e.preventDefault();
            var s = new Object();
            s.url = $(this).attr("href");
            s.name = $(this).attr("title");
            s.sid = $(this).attr("sid");
            ss.removeItem("rm_s");
            ss.setItem("rm_s", JSON.stringify(s));
            window.location = s.url;
        });


    });
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>