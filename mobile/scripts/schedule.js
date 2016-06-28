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





/*function videoload(e){
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: 'http://www.940.com/play',
        dataType: 'jsonp',
        jsonp: 'callback',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            console.log(data);
        }
    });

    var  playurl=$(this).attr('href');
    window.location.href = "playurl";

}*/
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
    // console.log(json_data.u);

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
    // console.log(listdata);

    $.ajax({
        type: "POST",
        url: 'http://www.940.com/account_list',
        dataType: 'jsonp',
        jsonp: 'callback',
        data: listdata,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            // obj对象
            data = formatData(data);

            // 我的班级,四个相加,=4就是四个已经报名,=2就是两个报名两个没有报名
            var classnum = parseInt(data.myclass['940vip']) + parseInt(data.myclass['cyb']) + parseInt(data.myclass['jyb']) + parseInt(data.myclass['zcb']);
            // console.log(typeof(data.myclass['jyb']));   // number

            // 未报名 + 已入学
            for (var i = 0; i < 4; i++) {
                var listam = $(".users");
                    listam.html("");

                if (data.myclass['940vip'] == 1) {
                    var str = "<span ng-class='{dss_act:vip,not_act:!vip}' class='dss_act'></span>";
                } else {
                    var str = "<span ng-class='{dss_act:cyb,not_act:!cyb}' class='not_act'></span>";
                }

                if (data.myclass['cyb'] == 1) {
                    var str2 = "<span ng-class='{dss_act:vip,not_act:!vip}' class='dss_act'></span>";
                } else {
                    var str2 = "<span ng-class='{dss_act:cyb,not_act:!cyb}' class='not_act'></span>";
                }

                if (data.myclass['jyb'] == 1) {
                    var str3 = "<span ng-class='{dss_act:vip,not_act:!vip}' class='dss_act'></span>";
                } else {
                    var str3 = "<span ng-class='{dss_act:cyb,not_act:!cyb}' class='not_act'></span>";
                }

                if (data.myclass['zcb'] == 1) {
                    var str4 = "<span ng-class='{dss_act:vip,not_act:!vip}' class='dss_act'></span>";
                } else {
                    var str4 = "<span ng-class='{dss_act:cyb,not_act:!cyb}' class='not_act'></span>";
                }

                var entry = '';
                    entry += "<div class='school'>" +
                        "<div class='school-title'>" +
                        "<span class='school-font1'>我的班级</span>" +
                        "<span class='school-font2'>（已入学 <i ng-bind='classNum' class='ng-binding'>" + classnum + "</i>，未报名 <i ng-bind='4-classNum' class='ng-binding'>" + (4 - classnum) + "</i>）</span>" +
                        "</div>" +
                        "<div class='course_ul'>" +
                        "<a class='c_1'>" +
                        "<div class='c_cont'>" +
                        "<div class='co_pic'>" +
                        str +
                        "<i ng-click='mycla.vip(vip)' href='javascript:' ng-bind='vipHtml' class='ng-binding'>查看学习历程</i>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "<a class='c_2' href='http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn'>" +
                        "<div class='c_cont'>" +
                        "<div class='co_pic'>" +
                        str2 +
                        "<i ng-click='mycla.cyb(cyb)' href='javascript:' ng-bind='cybHtml' class='ng-binding'>立即咨询</i>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "<a class='c_3' href='http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn'>" +
                        "<div class='c_cont'>" +
                        "<div class='co_pic'>" +
                        str3 +
                        "<i ng-click='mycla.jyb(hyb)' href='javascript:' ng-bind='jybHtml' class='ng-binding'>立即咨询</i>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "<a class='c_4' href='http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn'>" +
                        "<div class='c_cont'>" +
                        "<div class='co_pic'>" +
                        str4 +
                        "<i ng-click='mycla.zcb(zcb)' href='javascript:' ng-bind='zcbHtml' class='ng-binding'>立即咨询</i>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "</div>" +
                        "</div>";

                // console.log(entry);
                listam.append(entry);

                // 我的班级 + 课堂
                var list = $(".study");
                    list.html("");

                if (data.myclass['940vip'] == 1) {
                    var whole = "<div class='pane-layer paner1'></div>";
                } else {
                    var whole = "<div class='pane-layer'>没有记录！</div>";
                }

                if (data.myclass['cyb'] == 1) {
                    var whole2 = "<div class='pane-layer paner2'></div>";
                } else {
                    var whole2 = "<div class='pane-layer'>没有记录！</div>";
                }

                if (data.myclass['jyb'] == 1) {
                    var whole3 = "<div class='pane-layer paner3'></div>";
                } else {
                    var whole3 = "<div class='pane-layer'>没有记录！</div>";
                }

                if (data.myclass['zcb'] == 1) {
                    var whole4 = "<div class='pane-layer paner4'></div>";
                } else {
                    var whole4 = "<div class='pane-layer'>没有记录！</div>";
                }

                var pesonal = '';
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
                        whole +
                        "</div>" +
                        "<div class='pane'>" +
                        whole2 +
                        "</div>" +
                        "<div class='pane'>" +
                        whole3 +
                        "</div>" +
                        "<div class='pane'>" +
                        whole4 +
                        "</div>" +
                        "</div>";

                // console.log(pesonal);
                list.append(pesonal);
            }

            // 940vip
            var listime = $(".paner1");
                listime.html("");

            var vipVideo = [];
            var jsonItem = data.classes['940vip'];
            for (var attr in jsonItem) {
                Array.prototype.push.apply(vipVideo, JSON.parse(jsonItem[attr]));
            }
            for (var i = 0; i < vipVideo.length; i++) {
                if (vipVideo[i].click === 0) {
                    var listhtml = "<div class='pane-cont'>\
                            <div class='pane-icon1'>\
                            <i class='pane-round'></i>\
                            </div>\
                            <div class='pane-line'>\
                            <span class='pane-time'>未学过</span>\
                            <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                            <a data-play="+vipVideo[i].videoId+"  href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                            </div>\
                            </div>";
                } else {
                    var listhtml = "<div class='pane-cont pane-clr1'>\
                            <div class='pane-icon2'>\
                            <i class='pane-round'></i>\
                            </div>\
                            <div class='pane-line'>\
                            <span class='pane-time'>已学过</span>\
                            <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                            <a  data-play="+vipVideo[i].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                            </div>\
                            </div>";
                }

                listime.append(listhtml);
            }

            // cyb
            var listime = $(".paner2");
                listime.html("");

            var vipVideo = [];
            var vipVideo = data.classes['cyb'];
            // console.log(jsonItem);
            // var jsonItem = data.classes['cyb'][0];
            // console.log(jsonItem.videoId);

            for (var f = 0; f < vipVideo.length; f++) {
                if (vipVideo[f].click === 0) {
                    var listhtml = "<div class='pane-cont'>\
                            <div class='pane-icon1'>\
                            <i class='pane-round'></i>\
                            </div>\
                            <div class='pane-line'>\
                            <span class='pane-time'>未学过</span>\
                            <span class='pane-text'>" + vipVideo[f].videoName + "</span>\
                            <a  data-play="+vipVideo[f].videoId+" href=\"videonew.html?id=" + vipVideo[f].vid + "\">点此学习<i class='video1'></i></a>\
                            </div>\
                            </div>";
                } else {
                    var listhtml = "<div class='pane-cont pane-clr1'>\
                            <div class='pane-icon2'>\
                            <i class='pane-round'></i>\
                            </div>\
                            <div class='pane-line'>\
                            <span class='pane-time'>已学过</span>\
                            <span class='pane-text'>" + vipVideo[f].videoName + "</span>\
                            <a data-play="+vipVideo[f].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[f].vid + "\">点此复习<i class='video2'></i></a>\
                            </div>\
                            </div>";
                }

                console.log(listhtml);
                listime.append(listhtml);
            }

            // index索引，章节数组
            // $(".pane-layer .pane-cont").click(function() {
            //     alert($(this).index());
            // });

            // var paneinde = $(".pane-layer .pane-cont").index();
            // alert(paneinde);
            // console.log(paneinde);

            // var paneinde = $(".study ul.study-tab li").index() + 1;
            // alert(paneinde);
            // console.log(paneinde);

            // 下拉菜单
            var chapterOne = {
                '0': ['第一章', '淘宝开店流程及设置技巧'],
                '7': ['第二章', '2016淘宝搜索新认识'],
                '12': ['第三章', '生意参谋全面剖析店铺数据'],
                '16': ['第四章', '引流神器淘宝活动']
            };
            var chapterTwo = {
                '0': ['第一章', '淘宝推广'],
                '1': ['第二章', '淘宝客'],
                '5': ['第三章', '直通车基础'],
                '9': ['第四章', '直通车初始设置'],
                '16': ['第五章', '直通车质量得分'],
                '20': ['第六章', '无线直通车'],
                '23': ['第七章', '钻展'],
            };

            $('.switch_one li').click(function() {
                var dindex = $(this).index() + 1;
                console.log(dindex);
                var listime = $(".paner1");
                    listime.html("");

                var jsonItem = data.classes['940vip'][dindex];
                var vipVideo = JSON.parse(jsonItem);

                for (var i = 0; i < vipVideo.length; i++) {
                    // alert(i);
                    if (dindex == 1) {
                        if (chapterOne[i]) {
                            if (vipVideo[i].click === 0) {
                                var listhtml = "<div class='pane-chapter'>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>" + chapterOne[i][0] + "</span>\
                                        <span class='pane-text'>" + chapterOne[i][1] + "</span>\
                                        </div>\
                                        </div>\
                                        <div class='pane-cont'>\
                                        <div class='pane-icon1'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>未学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+"  href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                        </div>\
                                        </div>\
                                        </div>";
                            } else {
                                var listhtml = "<div class='pane-chapter'>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>" + chapterOne[i][0] + "</span>\
                                        <span class='pane-text'>" + chapterOne[i][1] + "</span>\
                                        </div>\
                                        </div>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>已学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                        </div>\
                                        </div>\
                                        </div>";
                            }

                        } else {
                            if (vipVideo[i].click === 0) {
                                var listhtml = "<div class='pane-cont'>\
                                        <div class='pane-icon1'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>未学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a  data-play="+vipVideo[i].videoId+" href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                        </div>\
                                        </div>";
                            } else {
                                var listhtml = "<div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>已学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                        </div>\
                                        </div>";
                            }
                        }

                    } else if (dindex == 2) {
                        // alert(2);
                        if (chapterTwo[i]) {
                            if (vipVideo[i].click === 0) {
                                var listhtml = "<div class='pane-chapter'>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>" + chapterTwo[i][0] + "</span>\
                                        <span class='pane-text'>" + chapterTwo[i][1] + "</span>\
                                        </div>\
                                        </div>\
                                        <div class='pane-cont'>\
                                        <div class='pane-icon1'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>未学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+"  href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                        </div>\
                                        </div>\
                                        </div>";
                            } else {
                                var listhtml = "<div class='pane-chapter'>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>" + chapterTwo[i][0] + "</span>\
                                        <span class='pane-text'>" + chapterTwo[i][1] + "</span>\
                                        </div>\
                                        </div>\
                                        <div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>已学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a  data-play="+vipVideo[i].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                        </div>\
                                        </div>\
                                        </div>";
                            }

                        } else {
                            if (vipVideo[i].click === 0) {
                                var listhtml = "<div class='pane-cont'>\
                                        <div class='pane-icon1'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>未学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+"  href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                        </div>\
                                        </div>";
                            } else {
                                var listhtml = "<div class='pane-cont pane-clr1'>\
                                        <div class='pane-icon2'>\
                                        <i class='pane-round'></i>\
                                        </div>\
                                        <div class='pane-line'>\
                                        <span class='pane-time'>已学过</span>\
                                        <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                        <a data-play="+vipVideo[i].videoId+"  class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                        </div>\
                                        </div>";
                            }
                        }

                    } else if (dindex == 3) {
                        // alert(2);
                        if (vipVideo[i].click === 0) {
                            var listhtml = "<div class='pane-cont'>\
                                    <div class='pane-icon1'>\
                                    <i class='pane-round'></i>\
                                    </div>\
                                    <div class='pane-line'>\
                                    <span class='pane-time'>未学过</span>\
                                    <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                    <a data-play="+vipVideo[i].videoId+"  href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                    </div>\
                                    </div>";
                        } else {
                            var listhtml = "<div class='pane-cont pane-clr1'>\
                                    <div class='pane-icon2'>\
                                    <i class='pane-round'></i>\
                                    </div>\
                                    <div class='pane-line'>\
                                    <span class='pane-time'>已学过</span>\
                                    <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                    <a  data-play="+vipVideo[i].videoId+" class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                    </div>\
                                    </div>";
                        }

                    } else if (dindex == 4) {
                        // alert(2);
                        if (vipVideo[i].click === 0) {
                            var listhtml = "<div class='pane-cont'>\
                                    <div class='pane-icon1'>\
                                    <i class='pane-round'></i>\
                                    </div>\
                                    <div class='pane-line'>\
                                    <span class='pane-time'>未学过</span>\
                                    <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                    <a data-play="+vipVideo[i].videoId+" href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此学习<i class='video1'></i></a>\
                                    </div>\
                                    </div>";
                        } else {
                            var listhtml = "<div class='pane-cont pane-clr1'>\
                                    <div class='pane-icon2'>\
                                    <i class='pane-round'></i>\
                                    </div>\
                                    <div class='pane-line'>\
                                    <span class='pane-time'>已学过</span>\
                                    <span class='pane-text'>" + vipVideo[i].videoName + "</span>\
                                    <a data-play="+vipVideo[i].videoId+"  class='pane-a' href=\"videonew.html?id=" + vipVideo[i].vid + "\">点此复习<i class='video2'></i></a>\
                                    </div>\
                                    </div>";
                        }

                    }


                    listime.append(listhtml);
                }

                // 章节数组
/*                var listindex = $(".pane-layer .pane-cont").index() + 1;
                console.log(listindex);
                var chapter = {
                    '0': ['第一章', '淘宝开店流程及设置技巧'],
                    '7': ['第二章', '2016淘宝搜索新认识'],
                    '13': ['第三章', '生意参谋全面剖析店铺数据'],
                };
                // console.log(chapter["0"]);
                // console.log(chapter[0][1]);
                // console.log(chapter[7][0]);
                // console.log(listindex = 1);
                // console.log(listindex = 7);

                if (index = 1) {
                    if (listindex = 1) {
                        alert("1");
                        var cterhtml = "<div class='pane-cont pane-clr1'>\
                                <div class='pane-icon2'>\
                                <i class='pane-round'></i>\
                                </div>\
                                <div class='pane-line'>\
                                <span class='pane-time'>" + chapter[0][0] + "</span>\
                                <span class='pane-text'>" + chapter[0][1] + "</span>\
                                </div>\
                                </div>";
                    } else if (listindex = 7) {
                        alert("2");
                        var cterhtml = "<div class='pane-cont pane-clr1'>\
                                <div class='pane-icon2'>\
                                <i class='pane-round'></i>\
                                </div>\
                                <div class='pane-line'>\
                                <span class='pane-time'>" + chapter[7][0] + "</span>\
                                <span class='pane-text'>" + chapter[7][1] + "</span>\
                                </div>\
                                </div>";
                    }
                }
                // else if (index = 2) {

                // } else if (index = 3) {

                // } else if (index = 4) {

                // }
                listime.append(cterhtml);*/

                // 点击背景色
                $(this).addClass('checkedBg').siblings().removeClass('checkedBg').end()
                       .parents('.switch_one').hide();
                $(".tabmark").animate({
                    rotate: 0
                });
            });


        }
    });



});