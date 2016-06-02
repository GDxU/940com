(function () {
    // 等价于html.style.fontSize = windowWidth / 640 * 100 + 'px';
    document.addEventListener('DOMContentLoaded', function () {
        var html = document.documentElement;
        var windowWidth = html.clientWidth;
        // if (windowWidth >= 540) {
        //     windowWidth = 540;
        // }
        html.style.fontSize = windowWidth / 6.4 + 'px';
    }, false);
})();

$(function () {
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
    document.querySelector('.js-slideout-toggle').addEventListener('click', function () {
        slideout.toggle();
    });
    document.querySelector('.menu').addEventListener('click', function (eve) {
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

    $.ajax({
        type: "POST",
        url: 'http://940.com/account_list',
        dataType: 'jsonp',
        jsonp: 'callback',
        data: listdata,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (data) {
            // obj对象
            data = formatData(data);



            var list = $(".study");
            list.html("");
            var pesonal = '';
            // 我的班级 + 课堂
            pesonal += "<ul class='study-tab'>" +
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
                "<div class='pane-layer'>没有记录！</div>" +
                "</div>" +
                "<div class='pane'>" +
                "<div class='pane-layer'>没有记录！</div>" +
                "</div>" +
                "<div class='pane'>" +
                "<div class='pane-layer'>没有记录！</div>" +
                "</div>" +
                "</div>";
            var Myclass={
                    oldReader:function(){
                        if(vipVideo[i].click===0){
                            this.onReader="<span class='pane-time'>未学过</span>";
                        }else{
                            this.onReader="<span class='pane-time2'>已学过</span>";
                        }
                    }
            };
            // console.log(pesonal);
            list.append(pesonal);

            var listime = $(".paner1");
            listime.html("");
            var vipVideo = [];
            var json =data.classes['940vip'];
            for(var attr in json){
                Array.prototype.push.apply(vipVideo,JSON.parse(json[attr]));
            }
            for (var i = 0; i < vipVideo.length; i++) {
                Myclass.oldReader();
                var listhtml = "<div class='pane-cont'>\
                        <span class='pane-icon'>\
                        <i class='pane-round'></i>\
                        </span>"+Myclass.onReader+"<span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                        <a href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video1'></i></a>\
                        </div>";


                listime.append(listhtml);
            };
            // 点击背景色
            $('.switch_one li').click(function() {
                var dindex=$(this).index()+1;
                var listime = $(".paner1");
                listime.html("");
                var json =data.classes['940vip'][dindex];
                var vipVideo=JSON.parse(json);
                for (var i = 0; i < vipVideo.length; i++) {
                    Myclass.oldReader();
                    var listhtml = "<div class='pane-cont'>\
                        <span class='pane-icon'>\
                        <i class='pane-round'></i>\
                        </span>"+Myclass.onReader+"<span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                        <a href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video1'></i></a>\
                        </div>";
                    listime.append(listhtml);
                };
                $(this).addClass('checkedBg').siblings().removeClass('checkedBg').end()
                    .parents('.switch_one').hide();
                $(".tabmark").animate({
                    rotate: 0
                });
            });


        }
    });


});