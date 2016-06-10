/**
 *
 * @authors Your Name (you@example.org)
 * @date    2016-05-18 14:33:29
 * @version $Id$
 */

/*判断用户是否登录*/
var storage = window.localStorage;
var json_data = JSON.parse(storage.getItem("member"));
// console.log(json_data);
if (json_data) {
    var listdata = $.param({
        user_name: json_data.u,
        password: json_data.password
    });
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/userInfo',
        dataType: 'jsonp',
        processData: false,
        data: listdata,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            $(".slideout-menu ul li:first-child").find("a").attr("href", "user.html").children("span").html(data.r);
            $("a.header-menu").attr("href", "user.html");
        }
    });
}

/*退出*/
function loginOut() {
    if (json_data) {
        localStorage.removeItem("member");
        alert("您成功退出登录！");
        window.location.href = "index.html";
    } else {
        alert("请先登录...");
    }

}