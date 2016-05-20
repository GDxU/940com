$(function() {
    // 开店技巧
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=8&type=2&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    content += "<a href=\"shopDetail.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });

    // 干货分享
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=8&type=3&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold2');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    content += "<a href=\"shopDetail2.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });

    // 网络推广
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=8&type=5&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            var list = $('.shop-fold3');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                /* alert(data.list[1].preview);*/
                for (var i = 0; i < data.list.length; i++) {
                    var item = data.list[i];
                    content = "";
                    content += "<li>";
                    // content += "<a href=\"javascript:;\">";
                    content += "<a href=\"shopDetail3.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"shop-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"shop-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"shop-small\">";
                    content += "<div class=\"shop-date\">发表日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "<div class=\"shop-watch\"><i></i><span>" + item.clickNum + "</span></div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    list.append(content);
                }
            }

        }

    });


});