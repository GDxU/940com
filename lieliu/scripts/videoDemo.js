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

        if (offset.top + -90 < scrollTop) {
            demo.start();
        }
    });

    // 下载猎流
    var platformht = $(".video-cont").outerHeight(true);
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

    // 获取url中"?"符后的字串
    function GetRequest() {
        var url = location.search;   // 获取url中"?"符后的字串
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }
    var Request = new Object();
    Request = GetRequest();
    var fileId = Request["videoId"];
    if ((typeof(fileId)) == null) {
        var fileId = "14651978969257574452";
    }else{
        var fileId = Request["videoId"];
    }
    console.log(fileId);
    // 老胡
    var option = {
        "auto_play": "0",
        "file_id": fileId,
        "app_id": "1251672867",
        "width": 1920,
        "height": 1080
    };
    /*调用播放器进行播放*/
    new qcVideo.Player(
        /*代码中的id_video_container将会作为播放器放置的容器使用,可自行替换*/
        "id_video_container",
        option
    );

    // 视频 videoid=？接口
    var arr = [
        {
            title: "注册帐号，完善资料，绑定手机证书",
            url: "14651978969257574452"//1
        },
        {
            title: "如何发布推广任务(PC端)",
            url: "14651978969257569568"//2
        },
        {
            title: "如何发布推广任务(手机端)",
            url: "14651978969257570292"//3
        },
        {
            title: "如何发布商品链接任务",
            url: "14651978969257572725"//4
        },
        {
            title: "如何发布店铺链接任务",
            url: "14651978969257572440"//5
        },
        {
            title: "如何查关键词排名",
            url: "14651978969257568679"//6
        },
        {
            title: "如何充值猎流积分",
            url: "14651978969257568087"//7
        },
        {
            title: "如何推广猎流系统获得佣金",
            url: "14651978969257573817"//8
        },
        {
            title: "如何查看并管理店铺营销数据",
            url: "14651978969257568422"//9
        },
        // a 链接跳转
        {
            title: "海量优质货源，智能管理店铺",
            url: "http://www.kehuda.com/k/"
        },
        {
            title: "百变装修模板，一键美化店铺",
            url: "http://www.kehuda.com/z/"
        },
        {
            title: "自动充值系统，快速提升店铺信誉",
            url: "http://www.sududa.com/"
        }
    ];
    // 判断是否是url
    var videoList = $(".video-cont");
    videoList.html("");
    var html = "";
    var add= function(i) {
        str = arr[i]['url'];
        //str = str.match(/http:\/\/.+/);
        var str = str.match(/^http:\/\/.+\..+/i);
        // a href="videoDemo.html?videoId='+ arr[i]['url'] +'"
        if (str == null) {
            html += '<dl '+ ((i)%2==0?'class="video-spacing"':'') +'>\
            <a href="javascript:" videoId='+ arr[i]['url'] +'>\
            <dt><img class="video-icon1" src="content/images/index/video-icon'+ (i+1) +'.jpg"></dt>\
            <dd class="video-topic">'+ arr[i]['title'] +'</dd>\
            <dd class="video-play">\
            <i class="play-icon1"></i>\
            <span>时长：05:30</span>\
            <span class="line">|</span>\
            <i class="play-icon2"></i>\
            <span>播放：1564</span>\
            </dd>\
            </a>\
            </dl>';

            return false;
        }else {
            html += '<dl '+ ((i)%2==0?'class="video-spacing"':'') +'>\
            <a href="'+ arr[i]['url'] +'" target="_bank" videoId="14651978969257574452">\
            <dt><img class="video-icon1" src="content/images/index/video-icon'+ (i+1) +'.jpg"></dt>\
            <dd class="video-topic">'+ arr[i]['title'] +'</dd>\
            <dd class="video-play">\
            <i class="play-icon1"></i>\
            <span>时长：05:30</span>\
            <span class="line">|</span>\
            <i class="play-icon2"></i>\
            <span>播放：1564</span>\
            </dd>\
            </a>\
            </dl>';

            return true;
        }
    };
    for (var i = 0; i < arr.length; i++) {
        add(i);
    }
    videoList.append(html);

    // 播放器
    var videoFile = $(".video-cont");
    videoFile.on('click', 'a', function() {
        var fileUrlId = $(this).attr('videoid');
        // if (!(typeof(fileUrlId))==undefined) {
        //     var fileUrlId = $(this).attr('videoid');
        // }else {
        //     var fileUrlId = "14651978969257574452";
        // }
        console.log(fileUrlId);
        // 老胡
        var option = {
            "auto_play": "0",
            // "file_id": $(this).attr('videoid'),
            "file_id": fileUrlId,
            "app_id": "1251672867",
            "width": 1920,
            "height": 1080
        };
        /*调用播放器进行播放*/
        new qcVideo.Player(
            /*代码中的id_video_container将会作为播放器放置的容器使用,可自行替换*/
            "id_video_container",
            option
        );
        // 点击更新视频，返回顶部
        $("html,body").animate({
            scrollTop: 0
        }, 200);
    });


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