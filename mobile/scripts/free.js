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

    // tab切换
    $('.free-tabPanel ul.free-ul li').click(function() {
        $('.free-tabPanel ul.free-ul li').removeClass('free-hit');
        $(this).addClass('free-hit');
        $('.free-panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
    });

    // 免费课程
    /**
    * var o = '{"a":"1","b":"2","c":"3"}';
    * var a = '[{"a":"1","b":"2","c":"3"},{"d":"4","e":"5","f":"6"},{"g":"7","h":"8","i":"9"},{"j":"10","k":"11","l":"12"}]';

    * function parse(json) {
    *     var data = JSON.parse(json);
    *     if (data instanceof Array) {
    *         console.log(data[0].a);
    *     } else if (data instanceof Object) {
    *         console.log(data.a);
    *     }
    * }
    * parse(o);
    * parse(a);
    */

    /**
    * [formatData description]
    * @param  {[type]} r [description]
    * @return {[type]}   [description]
    */
    var o = '{"a":"1","b":"2","c":"3"}';
    var a = '[{"a":"1","b":"2","c":"3"},{"d":"4","e":"5","f":"6"},{"g":"7","h":"8","i":"9"},{"j":"10","k":"11","l":"12"}]';

    function formatData(r) {
        var a = new Array();
        var c = Object.prototype.toString.call(r);
        r = /String/.test(c) ? eval('(' + r +')') : r;
        var d = Object.prototype.toString.call(r);
        // console.log(d);   // [object Object]
        a = /Array/.test(d) ? r : a[0]=r;
        return a;
    }
    // VIP会员价钱 .0
    function toDecimal2(x) {
        var f = parseFloat(x);
        if (isNaN(f)) {
            return false;
        }
        var f = Math.round(x*100)/100;
        var s = f.toString();
        var rs = s.indexOf('.');
        if (rs < 0) {
            rs = s.length;
            s += '.';
        }
        while (s.length <= rs + 1) {
            s += '0';
        }
        return s;
    }

    $.ajax({
        type: 'get',
        url: 'http://www.940.com/videoList?page=1&line=10&type=2&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            data = formatData(data); // 然后在ajax获取到数据后使用它
/*            if(!(data instanceof Array))
            {
              //line等于1的情况
              //处理成和line>1的情况一样的结构
              data.list=[data.list];
            }*/

            var list = $('.free-test1');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    // alert( );
                    content = "";
                    if (i % 2 == 0) {
                        content += "<dl class=\"free-dl free-cont1\">";
                    } else {
                        content += "<dl class=\"free-dl free-cont2\">";
                    }

                    content += "<dt class=\"free-dt1\">";
                    content += "<a href=\"video.html?id="+item.id+"\"><img src=\"" + item.preview + "\"><i></i></a>"; //.
                    content += "</dt>";
                    content += "<dd class=\"free-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"free-small\">";
                    content += "<div class=\"free-date\">发布:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"free-watch\"><i></i><span>" + item.click_num + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";

                    list.append(content);
                }
            }

        }

    });

    // user
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
        user_name: json_data.u,
        password: json_data.password
    });

    // 用户权限控制
    var vipViedo = {
        init : function() {
            this.viphtml();
        },
        viphtml : function() {
            $.ajax({
                async : false,
                type: 'get',
                url: 'http://www.940.com/userInfo',
                dataType: 'jsonp',
                processData: false,
                data: listdata,
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function(data) {
                    var data = formatData(data);

                    if (data.su == 0) {
                        alert("会员视频请联系客服购买！");
                        var json = {"su" : data.su};
                        localStorage.suvVip = JSON.stringify(json);
                    } else if (data.su == 1) {
                        var json = {"su" : data.su};
                        localStorage.suvVip = JSON.stringify(json);
                    }

                }

            });
        }

    };
    vipViedo.init();

    // VIP课程
    $.ajax({
        async : false,
        type: 'get',
        url: 'http://www.940.com/videoList?page=1&line=14&type=1&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            data = formatData(data); // 然后在ajax获取到数据后使用它
            // if(!(data instanceof Array))
            // {
            //   //line等于1的情况
            //   //处理成和line>1的情况一样的结构
            //   data.list=[data.list];
            // }

            var list = $('.free-test2');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    // 会员和非会员 su==1 ，su==0
                    var suvipname = window.localStorage;
                    var sui = JSON.parse(suvipname.getItem("suvVip"));
                    if (sui.su == 0) {
                        var vipHtml = "<a href=\"javascript:;\"><img src=\"" + item.preview + "\"><i></i></a>";
                    } else if (sui.su == 1) {
                        var vipHtml = "<a href=\"video4.html?id=" + item.id + "\"><img src=\"" + item.preview + "\"><i></i></a>";
                    }

                    // alert( );
                    content = "";
                    if (i % 2 == 0) {
                        content += "<dl class=\"free-dl free-cont1\">";
                    } else {
                        content += "<dl class=\"free-dl free-cont2\">";
                    }

                    // content += "<dt class=\"free-dt1\">";
                    // content += "<a href=\"video4.html?id="+item.id+"\"><img src=\"" + item.preview + "\"><i></i></a>";
                    // content += "</dt>";
                    content += "<dt class=\"free-dt1\">" +vipHtml+ "</dt>";
                    content += "<dd class=\"free-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"free-small\">";
                    content += "<div class=\"free-date2\"><i>￥&nbsp</i><span>" + toDecimal2(item.price) + "</span></div>";
                    content += "<div class=\"free-watch\"><i></i><span>" + item.click_num + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";

                    list.append(content);
                }
            }

        }

    });


});