$(function() {
    // 成功案例
    $.ajax({
        type: 'get',
        url: 'http://www.940.com/articleList?page=1&line=8&type=6&callback=?',
        dataType: 'jsonp',
        processData: false,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function(data) {

            // data = formatData(data); // 然后在ajax获取到数据后使用它
            var list = $('.successes-list');
            if (data.count && data.count > 0) {
                list.html("");
                var content = "";
                for (var i = 0; i < data.list.length; i++) {
                // for (var i = 0; i < 20; i++) {
                    var item = data.list[i];
                    /* console.log(item.preview);*/
                    content = "";
                    content += "<li>";
                    // content += "<a href=\"javascript:;\">";
                    content += "<a href=\"shopDetail4.html?id="+item.id+"\">"; //.
                    content += "<dl class=\"successes-stu\">";
                    content += "<dt><img src=\"" + item.preview + "\"></dt>";
                    content += "<dd class=\"successes-big\"><span>" + item.title + "</span></dd>";
                    content += "<dd class=\"successes-small\">";
                    content += "<div class=\"left\">开店月赚</div>";
                    content += "<div class=\"middle\">";
                    content += "<span>" + item.inCome + "</span>";
                    content += "</div>";
                    content += "<div class=\"right\">入学日期:&nbsp" + item.time.substr(0,10) + "</div>";
                    content += "</dd>";
                    content += "</dl>";
                    content += "</a>";
                    content += "</li>";

                    // console.log(item.inCome);
                    list.append(content);
                }
            }

        }

    });


});