(function() {
    // 等价于html.style.fontSize = windowWidth / 640 * 100 + 'px';
    document.addEventListener('DOMContentLoaded', function() {
        var html = document.documentElement;
        var windowWidth = html.clientWidth;
        /*        if (windowWidth >= 540) {
                    windowWidth = 540;
                }*/
        html.style.fontSize = windowWidth / 6.4 + 'px';
    }, false);
})();

$(function() {
    // 注册表单验证
    $(".passw-form").validate({
        rules: {
            username: {
                required: true, // 必填
                minlength: 6, // 最少6个字符
                maxlength: 12, // 最多12个字符
                /*                remote:{
                                    url:"http://kouss.com/demo/Sharelink/remote.json",  // 用户名重复检查，别跨域调用
                                    type:"post",
                                }*/
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 12,
            },
            confirm_password: {
                required: true,
                minlength: 6,
                equalTo: '.password'
            }
        },
        // 错误信息提示
        messages: {
            username: {
                required: "必须填写旧密码",
                minlength: "旧密码至少为6个字符",
                maxlength: "旧密码至多为12个字符",
                remote: "用户名已存在",
            },
            password: {
                required: "必须填写新密码",
                minlength: "密码至少为6个字符",
                maxlength: "密码至多为12个字符",
            },
            confirm_password: {
                required: "请再次输入新密码",
                minlength: "确认密码不能少于6个字符",
                equalTo: "两次输入密码不一致", // 与另一个元素相同
            }

        }
    });

    // 注册接口 http:940.com/register?user_name=ing@sududa.com&password=111111
    // var $ajaxForm = $('.passw-form');
    // $ajaxForm.bind('submit', function(event) {
    //     event.preventDefault();
    //     var param = $.param({
    //         user_name: $(".username").val(),
    //         password: $(".password").val(),
    //         captcha: $(".captcha").val()
    //     });
    //     $.ajax({
    //         async: false,
    //         type: "get",
    //         url: 'http://940.com/register',
    //         dataType: 'jsonp',
    //         data: param,
    //         jsonp: 'callback',
    //         success: function(data) {
    //             yazmbd(); //.
    //             if (data.status == 1) {
    //                 alert(data.tips); //.
    //                 // alert("注册成功！");
    //             } else if (data.status == -9) {
    //                 alert(data.tips); //.
    //                 // alert("邮箱格式不对！");
    //             } else {
    //                 alert("注册失败！");
    //             }
    //         }
    //     });
    // });

    function formatData(r) {
        var a = new Array();
        var c = Object.prototype.toString.call(r);
        r = /String/.test(c) ? eval('(' + r + ')') : r;
        var d = Object.prototype.toString.call(r);
        // console.log(d);   // [object Object]
        a = /Array/.test(d) ? r : a[0] = r;
        return a;
    }

    var storage = window.localStorage;
    var json_data = JSON.parse(storage.getItem("member"));
    console.log(json_data.u);
    // 修改密码
    var ajaxPane = $('.passw-form');
    ajaxPane.bind('submit', function(event) {
        event.preventDefault();
        var mpasword = $.param({
            user_name: json_data.u,
            new_password:$(".newPassword").val(),
            password:$(".oldpassword").val()
        });
        $.ajax({
          /*  async: false,*/
            type: "get",
            url: 'http://940.com/updatePassword',
            dataType: 'jsonp',
            jsonp: 'callback',
            data: mpasword,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(data) {
                console.log(mpasword);
                if (data.status == 1) {
                    alert(data.tips);
                } else if (data.status == -9) {
                    alert(data.tips);
                } else {
                    alert("data.tips");
                }
            }
        });

    });


});