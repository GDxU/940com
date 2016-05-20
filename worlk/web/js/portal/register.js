/**
 * Created by Administrator on 2016/4/7.
 */

$(function () {
    $(".ui-checkbox-sex").on('click','.ui-ft-left',function(){
        var $this = $(this), _index = $this.index();
        if (_index==0) {
            $this.find('i').addClass('selected');
            $this.siblings('.ui-ft-left').find('i').removeClass('selected');
        }else{
            $this.find('i').addClass('selected');
            $this.siblings('.ui-ft-left').find('i').removeClass('selected');
        }
        $('#sexVal').val(_index);
    });
});
