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

    // 开店技巧
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=12&type=2&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    content += "<a href=\"shopDetail.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });

    // 干货分享
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=12&type=3&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold2');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    content += "<a href=\"shopDetail2.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });

    // 网络推广
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=12&type=5&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold3');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    // content += "<a href=\"javascript:;\">";
                    content += "<a href=\"shopDetail3.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });


});