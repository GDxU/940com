(function() {
    // 等价于html.style.fontSize = windowWidth / 640 * 100 + 'px';
    document.addEventListener('DOMContentLoaded', function() {
        var html = document.documentElement;
        var windowWidth = html.clientWidth;
        // if (windowWidth >= 540) {
        //     windowWidth = 540;
        // }
        html.style.fontSize = windowWidth / 6.4 + 'px';
    }, false);
})();

$(function() {
    // 不能加高度，要不然中间区域跟随不到底部：style="padding-bottom: 1.13rem;"
    if ($("footer").length > 0) {
        $("footer").prev("div").css({
            "padding-bottom": "1.13rem"
        });
    }

    // 左侧栏菜单
    var slideout = new Slideout({
        'panel': document.getElementById('main'),
        'menu': document.getElementById('menu'),
        'padding': 5,
        'tolerance': 70,
        'touch': false     //禁用触摸滑动
    });
    document.querySelector('.js-slideout-toggle').addEventListener('click', function() {
        slideout.toggle();
    });
    document.querySelector('.menu').addEventListener('click', function(eve) {
        if (eve.target.nodeName === 'A') {
            slideout.close();
        }
    });
    function aload(t) {
        "use strict";
        t = t || window.document.querySelectorAll("[data-aload]"), void 0 === t.length && (t = [t]);
        var a, e = 0,
            r = t.length;
        for (e; r > e; e += 1) a = t[e], a["LINK" !== a.tagName ? "src" : "href"] = a.getAttribute("data-aload"), a.removeAttribute("data-aload");
        return t;
    }

    // Processes-bgcolor
    var colorArry = ['rgb(152, 156, 242)','rgb(75, 191, 236)','rgb(80, 213, 154)','rgb(76, 204, 216)','rgb(75, 189, 236)','rgb(152, 156, 242)'];
    $(".processes-explain ul li").on("mousemove", function() {
        var incolor = $(this).index();
        var clr = incolor;
        $(".processes-cont").css("background", colorArry[clr]);
    });
    $('.processes-explain ul li').click(function() {
        $('.processes-explain ul li').removeClass('processes-hit');
        $(this).addClass('processes-hit');
    });
/*    var urlstr = location.href;
    //alert((urlstr + '/').indexOf($(this).attr('href')));
    var urlstatus = false;
    $(".processes-explain ul li a").each(function() {
        if ((urlstr + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '') {
            $(this).addClass('hover');
            urlstatus = true;
        } else {
            $(this).removeClass('hover');
        }
    });
    if (!urlstatus) {
        $(".processes-explain ul li a").eq(0).addClass('hover');
    }*/


});