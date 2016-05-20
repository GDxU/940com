Fengs.add("zx/maker/maker", function(S, $, COVER) {
	var uri = new S.parseUri(window.location.href,"?");
	return {
		init:function(){
			if(!window.FileReader){
				return COVER.html5();
			}
			var $mark = $('<div class="ui_mark" id="ui_frame" style="z-index: 10000400;"><iframe src="/headmaker/?uid='+ uri.id +'&id='+ $('body').data('tid') +'"></iframe></div>')
				, $frame = $("iframe",$mark);
			
			$("body").append($mark.fadeIn());
		}
	}
},['zx/ui/cover']);