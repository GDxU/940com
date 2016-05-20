$(function() {

    // tab切换
    $('.study ul .switch').click(function() {
        $('.study ul .switch').removeClass('hit');
        $(this).addClass('hit');
        $('.panes>div:eq(' + $(this).index() + ')').show().siblings().hide();
    });

});