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

    // 绑数据
    var storage = window.localStorage;
    var json_data = JSON.parse(storage.getItem("member"));
    console.log(json_data.u);

    function formatData(r) {
        var a = new Array();
        var c = Object.prototype.toString.call(r);
        r = /String/.test(c) ? eval('(' + r + ')') : r;
        var d = Object.prototype.toString.call(r);
        // console.log(d);   // [object Object]
        a = /Array/.test(d) ? r : a[0] = r;
        return a;
    }
    var listdata = $.param({
        account: json_data.u
    });
    console.log(listdata);

    $.ajax({
        type: "POST",
        url: 'http://940.com/account_list',
        dataType: 'jsonp',
        jsonp: 'callback',
        data: listdata,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            // obj对象
            data = formatData(data);

            var list = $(".free-pane");
            list.html("");
            var pesonal = '';




// 我的班级 + 课堂
            pesonal += "<div class='study'>" +
                "<ul class='study-tab'>" +
                "<li class='switch_one'>" +
                "<div class='switch hit'>" +
                "<a>940VIP班</a>" +
                "<img class='tabmark' src='content/images/schedule/up.png'>" +
                "</div>" +
                "</li>" +
                "<li class='switch_two'>" +
                "<div class='switch'>" +
                "<a>创业班</a>" +
                "<img class='tabmark' src='content/images/schedule/up.png'>" +
                "</div>" +
                "</li>" +
                "<li class='switch_three'>" +
                "<div class='switch'>" +
                "<a>精英班</a>" +
                "<img class='tabmark' src='content/images/schedule/up.png'>" +
                "</div>" +
                "</li>" +
                "<li class='switch_four'>" +
                "<div class='switch'>" +
                "<a>总裁班</a>" +
                "<img class='tabmark' src='content/images/schedule/up.png'>" +
                "</div>" +
                "</li>" +
                "</ul>" +
                "<ul class='study-item'>" +
                "<li class='switch_one' style='display: none;'>" +
                "<ul>" +
                "<li>0基础学自然搜索</li>" +
                "<li>0基础学直通车</li>" +
                "<li>0基础学PS</li>" +
                "<li>VIP课程</li>" +
                "</ul>" +
                "</li>" +
                "<li class='switch_two' style='display: none;'></li>" +
                "<li class='switch_three' style='display: none;'></li>" +
                "<li class='switch_four' style='display: none;'></li>" +
                "</ul>" +
                "<div class='panes'>" +
                "<div class='pane' style='display: block;'>" +
                "<div class='pane-layer paner1'></div>" +
                "</div>" +
                "<div class='pane'>" +
                "<div class='pane-layer'>222222222222222222222</div>" +
                "</div>" +
                "<div class='pane'>" +
                "<div class='pane-layer'>333333333333333333333</div>" +
                "</div>" +
                "<div class='pane'>" +
                "<div class='pane-layer'>444444444444444444444</div>" +
                "</div>" +
                "</div>" +
                "</div>";
            // console.log(pesonal);
            list.append(pesonal);

            var listime=$(".paner1");
            listime.html("");

             var item = data.classes['940vip'][3];
             var dataitem = JSON.parse(item);
             console.log(dataitem.length);
             for (var i = 0; i < item.length; i++) {
                 console.log(dataitem);
                 var listtime="<div class='pane-cont'>\
                <span class='pane-icon iconClr1'>\
                <i class='pane-round roundClr1'></i>\
                </span>\
                <span class='pane-time'>6月13日</span>\
                <span class='pane-text'>" + dataitem[i].videoName + "</span>\
               <a href=\"video.html?id="+dataitem[i].vid+"\">点此复习<i class='video1'></i></a>\
                </div>";
                 listime.append(listtime);


             }









        }
    });
















});