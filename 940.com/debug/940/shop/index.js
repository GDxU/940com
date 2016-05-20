Fengs.add('940/shop/index', function(S, $){
	return {
		shopInit : function(){
			var bgColor = ['#4CCCD8','#4BBFEC','#50D59A','#4CCCD8','#4BBDEC','#989CF2'],$wrapLink = $('.wrapLink'),_index;
			$wrapLink.find('a').hover(function(){
				var $this = $(this),_i = $this.index();
				if (!_index) {
					_index = $wrapLink.find('a.cur').index();
				};
				$this.siblings('a').removeClass('cur');
				$this.parent().css('background',bgColor[_i]);
			},function(){
				if (_index>=0) {
				 $wrapLink.find('a').eq(_index).addClass('cur').parent().css('background',bgColor[_index]);
				};
			})


		}
	}
})