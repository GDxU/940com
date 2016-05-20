 Fengs.add('940/utils/gonggao', function(S, $){
 	var uri = new S.parseUri(window.location.href,"#");
 	var id = uri.id;
 	if (id) {
 		$('li[value='+id+']').css('height','auto').find('.title')[0].d = true;
 		$('li[value='+id+']').css('height','auto').find('b').css('fontWeight','600');
 		
 	};
 	var $aLi = $('.gonggao ul li');
	$aLi.find('.title').on('click',function(){
		var $this = $(this);
		var $parent = $this.parent();
		$('html,body').scrollTop(0);
		if ($parent.height()>30) {
			$this.parent().removeAttr('style');
			$this.find('b').removeAttr('style');
		}else{
			$this.parent().css({'height':'auto'}).find('b').css('fontWeight','600');
			$this.parent().siblings().removeAttr('style').find('b').removeAttr('style');
		}
		window.location.hash = 'id='+$this.parent().attr('value');
 	})

 })