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

        if (offset.top + -50 < scrollTop) {
            demo.start();
        }
    });

    // 下载猎流
    var platformht = $(".diagram").outerHeight(true);
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

    // 评论
    photoSlide({
        obj: $('#banner'),
        callback: function(i) {

        },
        contact: true //触点
    });
    var home = {
        detailsEffect: function() {
            this.download();
            this.liuyan();
            var $Window = $(window);
            var $wrap_details = $('.wrap-details'),
                $common = $('.common', $wrap_details),
                $ad_download = $('.ad-download'),
                topArr = [];

            $common.map(function(i, obj) {
                topArr.push($(obj).offset().top);
            });
            var time;
            var fact = true;

            function _numer() {
                var ran = parseInt(Math.random() * 1000);
                ran = ran < 100 ? ran + 100 : ran;
                var str = '1,593,';
                var num = 0;
                time = setInterval(function() {

                    if (num > ran) {
                        clearInterval(time);
                    } else {
                        $ad_download.find('h3 span').html(str + '' + num++);
                    }

                }, 2);
            }

            function _effect() {
                clearTimeout(time);
                time = setTimeout(function() {
                    var _top = $Window.scrollTop();
                    var _winH = $Window.height();
                    var _h = _top + _winH;

                    for (var i = 0; i < topArr.length; i++) {
                        if (_h > (topArr[i] + 100)) {
                            $common.eq(i).addClass('effect');
                        } else {
                            if (_h < topArr[i]) { //不在可视区就删除effect
                                $common.eq(i).removeClass('effect');
                            }
                        }
                    }
                }, 200);

            }
            $Window.scroll(_effect);
            _effect();

        },
        liuyan: function() { //用户留言
            var arr = [{
                user: '4653***82@qq.com',
                content: '预定了！人流量，排名也靠前了!尤其是手机店面的商品，谢谢猎流软件',
                time: '2016-03-14'
            }, {
                user: 'dfg***ds@163.com',
                content: '这软件也太牛了吧，我昨天发了一点流量，今天自然流量就跟着来了，都不用我刷单 自己就出单了',
                time: '2016-03-10'
            }, {
                user: 'hg***ew@163.com',
                content: '刷了几天 见效了，新店开始出单了，15个访客出一单',
                time: '2016-03-08'
            }, {
                user: 'fh***re@126.com',
                content: '第一次用猎流的软件，同样的任务发布两次！。。。我晕，现在感觉很好用了，就是有点费积分，只要安全，费就费吧，总会有回报的',
                time: '2016-03-02'
            }, {
                user: 'ewr***gh@qq.com',
                content: '软件太给力了！自从用这个软件，腰不痛腿不酸 睡觉香 吃嘛嘛香了！今天又得了11单好给力哦！！！',
                time: '2016-03-01'
            }, {
                user: 'xcv***fd@sina.com',
                content: '不错今天有两单，四百多，多亏了猎流 这么牛逼的软件太给力了',
                time: '2016-02-28'
            }, {
                user: 'ass***jk@qq.com',
                content: '那天我刷了好多流量，刷了几笔，真的有效果，自然搜索也进来了',
                time: '2016-02-26'
            }, {
                user: '9852***12@qq.com',
                content: '之前pc的可以说一个都没，肯定有效果了，流量上升排名也就上去了',
                time: '2016-02-29'
            }, {
                user: 'cbv***df@163.com',
                content: '管他什么呢，反正是能引流配合刷单，用几个月了也没有出什么问题',
                time: '2016-02-22'
            }, {
                user: 'khj***06@sina.com',
                content: '我赶紧我不用猎流，访客立马下降了好多',
                time: '2016-02-21'
            }, {
                user: '7567***32@qq.com',
                content: '我发现用猎流之后我这个成交量是越来越高了',
                time: '2016-02-20'
            }, {
                user: 'asd***52@sina.com',
                content: '我的排名高了，猎流是世界上醉好用的软件',
                time: '2016-02-19'
            }];

            var $liuyan_list = $('.liuyan-list');
            var html = '';

            function getUser(n) {
                var res = [];
                for (var i = 0; i < n; i++) {
                    var id = Math.floor(Math.random() * arr.length);
                    res.push(arr[id]);
                }
                return res;
            }

            //排序
            // var sort = function(arr){
            //  var nArr = []
            //  for (var i = 0; i < arr.length; i++) {
            //      nArr.push(arr[i])
            //  };
            //  return nArr.sort(function(a,b){
            //      return Number(b.time.replace(/-/g,'')) - Number(a.time.replace(/-/g,''))
            //  });
            // }
            // var showUser = sort(getUser(3));
            var add = function(i) {
                html += '<dl ' + ((i + 1) % 3 == 0 ? 'style=border:0;' : '') + '>\
                            <dt>\
                                <i></i>\
                                <span class="fl">' + arr[i]['user'] + '</span>\
                                <span class="fr">' + arr[i]['time'] + '</span>\
                            </dt>\
                            <dd>' + arr[i]['content'] + '</dd>\
                        </dl>';
            };
            for (var i = 0; i < arr.length; i++) {
                add(i);
                if ((i + 1) % 3 == 0) {
                    $liuyan_list.append($('<div class="list-ly">').append(html));
                    html = '';
                }
            }
            html = '';
            for (var j = arr.length % 3; j >= 1; j--) {
                add(arr.length - j);
            }
            if (arr.length % 3 != 0) {
                $liuyan_list.append($('<div class="list-ly">').append(html));
            }

            var $list_ly = $liuyan_list.children();
            var num = 0;
            $list_ly.eq(0).show().addClass('show');

            setInterval(function() {
                num++;
                num = num % $list_ly.length;
                $list_ly.eq(num).addClass('show').siblings().removeClass('show');
            }, 5000);

        },
        download: function() {

            function getId(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]);
                return null;
            }
            function getHref() {

                var href = 0;
                if (window.localStorage) {
                    if (getId('id') != 0 && getId('id') != null) {
                        localStorage.setItem("id", getId('id'));
                        href = getId('id');
                    } else {
                        if (localStorage.getItem("id")) {
                            href = localStorage.getItem("id");
                        }
                    }
                }

                // if (window.location.host.indexOf('vip')>=0) {
                //  return 'http://d.lieliu.com/ll/download?id='+(href==0?1041216:href)+'&oem=2';
                // }else{
                //  return 'http://d.lieliu.com/ll/download?id='+href;
                // }

                return 'http://pan.sohu.net/s/Nzk0ODgsaXhtdXU.htm';

                //localStorage.removeItem("id");
            }

            function Ispc() {
                var userAgentInfo = navigator.userAgent;
                var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");
                var flag = true;
                for (var v = 0; v < Agents.length; v++) {
                    if (userAgentInfo.indexOf(Agents[v]) > 0) {
                        flag = false;
                        break;
                    }
                }
                return flag;
            }

            var $hrefA = $('.areaDow');
            $hrefA.attr('href', 'javascript:');
            $hrefA.attr('target', 'new');
            $hrefA.click(function() {
                if (!Ispc()) return alert('请从电脑网页端下载！');
                $(this).attr('href', getHref());
                // if(confirm("是否要下载？")){
                //      $(this).attr('href',getHref());
                // }
            });
        }
    };

    home.detailsEffect();


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
    var downApp = $(".shop-btn a, .download, .app-btn a");
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