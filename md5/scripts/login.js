
$(function() {
    // 不能加高度，要不然中间区域跟随不到底部：style="padding-bottom: 1.13rem;"
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

    // login
    // 滑入效果
    $(".login-animation p").eq(0).animate({"left":"0%"}, 600);
    $(".login-animation p").eq(1).animate({"left":"0%"}, 400);

    // 登陆表单验证
    $(".login-form").validate({
        rules:{
            username:{
                required:true,  // 必填
                minlength:6,    // 最少6个字符
                maxlength:20,   // 最多20个字符
            },
            password:{
                required:true,
                minlength:6,
                maxlength:20,
            },
        },
        // 错误信息提示
        messages:{
            username:{
                required:"必须填写用户名",
                minlength:"用户名至少为6个字符",
                maxlength:"用户名至多为20个字符",
                remote: "用户名已存在",
            },
            password:{
                required:"必须填写密码",
                minlength:"密码至少为6个字符",
                maxlength:"密码至多为20个字符",
            },
        },

    });
    // 注册表单验证
    $(".register-form").validate({
        rules:{
            username:{
                required:true,  // 必填
                minlength:6,    // 最少6个字符
                maxlength:20,   // 最多20个字符
/*                remote:{
                    url:"http://kouss.com/demo/Sharelink/remote.json",  // 用户名重复检查，别跨域调用
                    type:"post",
                }*/
            },
            password:{
                required:true,
                minlength:6,
                maxlength:20,
            },
            confirm_password:{
                required:true,
                minlength:6,
                equalTo:'.password'
            },
            captcha:{
                required:true,
                minlength:5,
                maxlength:5,
            }
        },
        // 错误信息提示
        messages:{
            username:{
                required:"必须填写用户名",
                minlength:"用户名至少为6个字符",
                maxlength:"用户名至多为20个字符",
                remote: "用户名已存在",
            },
            password:{
                required:"必须填写密码",
                minlength:"密码至少为6个字符",
                maxlength:"密码至多为20个字符",
            },
            confirm_password:{
                required: "请再次输入密码",
                minlength: "确认密码不能少于6个字符",
                equalTo: "两次输入密码不一致",   // 与另一个元素相同
            },
            captcha:{
                required:"请输入图片验证码",
                minlength:"输入图片验证码为5个字符",
                maxlength:"图片验证码必须为5个字符",
            }

        }
    });

    // 打钩
    $(".btnCheck").click(function() {
        $(".login-check").toggleClass("checked");
    });

    /*验证码*/
    /*          $.getJSON('http://940.com/checkCode?', 'vcode=' + vcode, check_vcode_callback, 'text');*/
    function yazmbd() {
        var yanzm = $.param({
            code: $(".captcha").val()
        });
        $.ajax({
            async: false,
            type: "post",
            url: 'http://940.com/checkCode',
            dataType: 'jsonp',
            data: yanzm,
            jsonp: 'callback',
            success: function(data) {
                console.log(url);
                /*  console.log(yanzm);*/
                if (data.status == 0) {
                    alert(data.tips); //.
                    // alert("验证码正确");
                }
                if (data.status == 1) {
                    alert("验证码正确");
                }
                if (data.status == -1) {
                    alert("没有定义");
                }
                if (data.status == -9) {
                    alert("验证码错误");
                }
            },
            error: function() {
                alert("加载失败！");
            }
        });
    }

    // 注册接口 http:940.com/register?user_name=ing@sududa.com&password=111111
    var $ajaxForm = $('.register-form');
    $ajaxForm.bind('submit', function(event) {
        event.preventDefault();
        var param = $.param({
            user_name: $(".username").val(),
            password: $(".password").val(),
            captcha: $(".captcha").val()
        });
        $.ajax({
            async: false,
            type: "get",
            url: 'http://940.com/register',
            dataType: 'jsonp',
            data: param,
            jsonp: 'callback',
            success: function(data) {
                yazmbd(); //.
                if (data.status == 1) {
                    alert(data.tips); //.
                    // alert("注册成功！");
                    window.location.href = "login.html";
                } else if (data.status == -9) {
                    alert(data.tips); //.
                    // alert("邮箱格式不对！");
                } else {
                    alert("注册失败！");
                }
            }
        });

        // 000000000000000000000000000
/*        var $ajaxForm = $('.register-form');
        $ajaxForm.bind('submit', function(event) {
            event.preventDefault();
            $.ajax({
                async: false,
                type: "post",
                url: 'http://940.com/register?user_name=&password=&callback=?',
                dataType: 'jsonp',
                data: {
                    username: $(".username").val(),
                    password: $(".password").val(),
                    captcha: $(".captcha").val()
                },
                jsonp: 'callback',
                success: function(data) {
                    if (data.status == 1) {
                        alert("注册成功！");
                    } else if (data.status == -9) {
                        alert("用户名重复！");
                    } else {
                        alert("注册失败！");
                    }
                }
            });*/

    });

    // 登陆接口
    var ajaxForm = $('.login-form');
    ajaxForm.bind('submit', function(event) {
        event.preventDefault();
        var paramlogin = $.param({
            user_name: $(".login-user").val(),
            password: $(".login-passw").val()
        });
        // console.log(paramlogin);
        $.ajax({
            async: false,
            type: "get",
            url: 'http://www.940.com/login',
            dataType: 'jsonp',
            data: paramlogin,
            jsonp: 'callback',
            success: function(data) {
                console.log(paramlogin);
                if (data.status == 1) {
                    alert(data.tips);
                    // HTML5 LocalStorage 本地存储
                     var json = {"u":$(".login-user").val(),"password":$(".login-passw").val()};
                    // alert(JSON.stringify(json));
                    localStorage.member = JSON.stringify(json);//设置a为"3"
                    window.location.href = "user.html";
                } else if (data.status == -9) {
                    alert(data.tips);
                } else {
                    alert("data.tips");
                }
            }
        });

    });


});