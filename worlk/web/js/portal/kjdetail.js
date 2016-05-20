/**
 * Created by Administrator on 2016/4/7.
 */
/*tabs切换*/
$(".ui-nav-bar a").click(function () {
    var index=$(this).index();
    $(".ui-tabs-content .tabs-item").eq(index).show().siblings().hide();
});
/*筛选弹出*/
$(".ui-filter").click(function () {
        $(".ui-alert-page").show();
});
$(".ui-delete-icon,.ui-filter-exit").click(function () {
    $(".ui-alert-page").hide();
});
$(".ui-filter-item li").click(function () {
    $(this).toggleClass("active");
});

/*信息滑动删除*/
$(function() {

    function prevent_default(e) {
        e.preventDefault();
    }

    function disable_scroll() {
        $(document).on('touchmove', prevent_default);
    }

    function enable_scroll() {
        $(document).unbind('touchmove', prevent_default)
    }

    var x;
    $('.swipe-delete li > a')
        .on('touchstart', function(e) {
            console.log(e.originalEvent.pageX)
            $('.swipe-delete li > a').css('left', '0px') // close em all
            $(e.currentTarget).addClass('open')
            x = e.originalEvent.targetTouches[0].pageX // anchor point
        })
        .on('touchmove', function(e) {
            var change = e.originalEvent.targetTouches[0].pageX - x
            change = Math.min(Math.max(-100, change), 0) // restrict to -100px left, 0px right
            e.currentTarget.style.left = change + 'px'
            if (change < -10) disable_scroll() // disable scroll once we hit 10px horizontal slide
        })
        .on('touchend', function(e) {
            var left = parseInt(e.currentTarget.style.left)
            var new_left;
            if (left < -35) {
                new_left = '-100px'
            } else if (left > 35) {
                new_left = '100px'
            } else {
                new_left = '0px'
            }
            // e.currentTarget.style.left = new_left
            $(e.currentTarget).animate({left: new_left}, 200)
            enable_scroll()
        });

    $('li .delete-btn').on('touchend', function(e) {
        e.preventDefault()
        $(this).parents('li').slideUp('fast', function() {
            $(this).remove()
        })
    })

});
