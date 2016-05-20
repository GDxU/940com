Fengs.add('zx/view/preview', function(S, $, LAB, COVER){
	var $page = $("#page")
		, relocation = function(element){
			setTimeout(function(){
				if(element.css("position") === "relative"){
					element.css({"margin-left":(0 - element.clientWidth / 2),"position":"static"}).parent().css({'position': 'static','left': 0});
				}else{
					element.css({"margin-left":(0 - element.clientWidth / 2),'left':"50%"}).parent().css('left', 0);
				}
			},500);
		}
		, resize = function(){
			$('#wrapper').height($(window).height() - 42);
		}
		, uri = S.parseUri(window.location.href,"?")
		, relocat = function(){
			var $ele = $("*")
				, array = [];
			$ele.each(function(){
				var $this = $(this);
				if($this.data('relocation')){
					relocation($this);
				}
			})
		};
	relocat();
	resize();
	//非详情页
	if(/(\/detail|page=detail)/.test(window.location.href)){
		$("body,#content,#bd").css("background","none");
	}else{
		var $body = $("#content")
			, $bodycopy = $("<div class='body'></div>")
			, $navch = $(".tshop-pbsm-shop-nav-ch");
		$navch.append($bodycopy);
		$body.css({
			"background-color":$bodycopy.css("background-color")
			, "background-image":$bodycopy.css("background-image")
			, "background-repeat":$bodycopy.css("background-repeat")
			, "background-position":$bodycopy.css("background-position")
			, "background-attachment":$bodycopy.css("background-attachment")
		});
		$bodycopy.remove();
	};
	$(window).resize(resize);
	if($('body').data('client') === 'web'){
		$('#navbar a.release').click(function(){
			COVER.down();
		})
	};
	if ($.browser.msie){
		if($.browser.version == '7.0' || $.browser.version == '6.0'){
			COVER.html5(true);
		}else if($.browser.version == '8.0'){
			COVER.html5();
		}
	};
}, ['zx/lab', 'zx/ui/cover']);