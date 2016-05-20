/**
 *
 * @authors Your Name (you@example.org)
 * @date    2016-05-18 14:33:29
 * @version $Id$
 */

/*判断用户是否登录*/
var storage = window.localStorage;
var json_data = JSON.parse(storage.getItem("member"));
console.log(json_data.u);
if (json_data.u) {
    // statement
    var listdata = $.param({
        user_name: json_data.u,
        password: json_data.password
    });
    $.ajax({
        type: 'get',
        url: 'http://940.com/userInfo',
        dataType: 'jsonp',
        processData: false,
        data: listdata,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {
            $(".slideout-menu ul li:first-child").find("a").attr("href", "user.html").children("span").html(data.r);
            $("a.header-menu").attr("href", "user.html");
        }
    });
} else {
    window.location.href = "login.html";
}