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
    // if ($("header").length > 0) {
    //     $("header").prev("div").css({
    //         "padding-top": "1.08rem"
    //     });
    // }

    // 返回top顶部
    // $('#scroll').click(function() {
    //     $("html,body").animate({
    //         scrollTop: 0
    //     }, 200);
    // });

    // 数字
    var CountUpOptions = {
        useEasing: false,
        useGrouping: true,
        separator: ',',
        prefixdecimal: '.',
        prefix: '',
        suffix: ''
    };
    $("html, body").scrollTop(0);
    var demo = new CountUp("myTargetElement", 0, 758360, 0, 2.5, CountUpOptions);

    var rollSet = $('#myTargetElement');
    var offset = rollSet.offset();
    $(window).scroll(function() {
        var scrollTop = $(window).scrollTop();
        var scrollWindow = $(window).height();
        var rollLen = rollSet.find(".sectiondemo");
        // css3性能卡，导致苹果手机Safari显示数字0不变（有时变，有时不变）
        if (offset.top + -350 < scrollTop) {
            demo.start();
        }
    });

    // 下载猎流
    var platformht = $(".shop").outerHeight(true);
    $(".download").hide();
    $(document).scroll(function(){
        var scrTop = $(document).scrollTop();
        console.log(platformht);
        if (scrTop >= platformht) {
            $(".download").fadeIn();
        }else{
            $(".download").fadeOut();
        }
    });

    // 右侧栏
    $('.slide-menu').on('click', function() {
        var test = $('.wrapperhove' + 'rtree').height();
        $('.slide-mask').css('height', test).show();
        $('.slide-wrapper').css('height', test).addClass('moved');
    });
    $('.slide-mask').on('click', function() {
        $('.slide-mask').hide();
        $('.slide-wrapper').removeClass('moved');
    });

    // tab切换
    $('.study ul .switch').click(function() {
        $('.study ul .switch').removeClass('hit');
        $(this).addClass('hit');
    });

    // 常见问题
    var wenti = {
        init: function() {
            // var uri = new S.parseUri(window.location.href,"#");
            var $wt_list = $('.wt-list');
            $wt_list.on('click', 'i', function() {
                var isShow = $(this).siblings().is(":hidden");
                if (isShow) {
                    $(this).addClass('act').siblings().show();
                } else {
                    $(this).removeClass('act').siblings().hide();
                }
            });
            // if (uri.id>=0&&uri.id<$wt_list.children().length) {
            //  var objLi = $wt_list.find('li').eq(uri.id);
            //  var _wt = $(window).scrollTop();
            //  var _wh = $(window).height();
            //  var _ot = objLi.offset().top;
            //  objLi.find('i').trigger("click");

            //  if (_wh+_wt<_ot) {
            //    $(window).scrollTop(_ot-_wt-100);
            //  };
            // };
        }
    };
    wenti.init();


});

// 下载软件，判断是安卓手机还是苹果手机
function isWeiXin() {
    var ua = window.navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == 'micromessenger') {
        return true;
    } else {
        return false;
    }
}
window.onload = function() {
    var system = {
        win: false,
        mac: false,
        xll: false,
        ipad: false
    };
    //检测平台
    var p = navigator.platform;
    system.win = p.indexOf("Win") == 0;
    system.mac = p.indexOf("Mac") == 0;
    system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
    system.ipad = (navigator.userAgent.match(/iPad/i) != null) ? true : false;

    var browser = {
        versions: function() {
            var u = navigator.userAgent,
                app = navigator.appVersion;
            return { //移动终端浏览器版本信息
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    };
    // var down = document.getElementById('down');
    var downApp = $(".shop-btn a, .download");
    if (system.win || system.mac || system.xll || system.ipad) { //pc
        // console.log(downApp);
        downApp.click(function() {
            alert('必须使用苹果或安卓手机下载');
        });
    } else {

        if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
            if (!isWeiXin()) {
                downApp.attr('href', 'https://itunes.apple.com/cn/app/id1044567499?mt=8');
            } else { //微信
                downApp.attr('href', 'http://www.lieliu.com/app/ios.html');
            }
        } else if (browser.versions.android) {
            if (!isWeiXin()) {
                downApp.attr('href', 'http://www.kehuda.com/m/down?client=79');
            } else { //微信
                downApp.attr('href', 'http://www.lieliu.com/app/android.html');
            }
        }
    }

};


// 手机输入 www.940.com 跳转 手机网页：m.940.com
// function isPhone() {
//     for (var a = navigator.userAgent, b = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"], c = !0, d = 0; d < b.length; d++)
//         if (a.indexOf(b[d]) > 0) {
//             c = !1;
//             break;
//         }
//     return c;
// }
// isPhone() || (window.location.href = "http://m.940.com/");