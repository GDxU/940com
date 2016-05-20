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

    // VIP课程
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/videoList?page=1&line=9&type=1&callback=?',
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

            var list = $('.free-test2');
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
                    content += "<a href=\"javascript:;\"><img src=\"" + item.preview + "\"></a>";
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


});