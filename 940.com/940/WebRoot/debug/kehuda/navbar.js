Fengs.add('kehuda/navbar', function(S, $){
	(function(){
		var $nav = $("#nav")
			, $panel = $(".sc",$nav)
			, $input = $("input",$nav)
			, $btn = $("button",$nav)
			, hide = function(ele){
				if(ele.val() != "" || document.activeElement == ele[0]){
					return;
				};
				ele.stop().animate({width:20},200,null,function(){
					ele.removeClass("h");
					$btn.removeClass("foc");
				});
			};
		$panel.on({
			"mouseenter":function(e){
				$btn.addClass("foc");
				$input.addClass("h").stop().animate({width:120},200);
			},
			"mouseleave":function(e){
				hide($input);
			},
			"click":function(e){
				e.stopPropagation();
			}
		});
		$(window).click(function(){
			hide($input);
		});
		$btn.click(function(){

		});
	})();
	(function(){
		var $wrap = $("#submenu")
			,$list = $wrap.find("li")
			,index = -1
			,w = 132
			,$line = $('<div class="subline"><em></em></div>')
			,scrollFuc = function(){
				var top = document.body.scrollTop + document.documentElement.scrollTop;
				if(top > 90){
					$wrap.css({position:"fixed",top:0,zIndex:100});
				}else{
					$wrap.css({position:"static",top:0});
				};
			};
		$list.last().after($line);
		$list.each(function(){
			var $this = $(this)
				,i = $this.index();
			if($this.hasClass("cur")){
				index = i;
				$line.css({left:w * index,display:'block'});
			}
			$this.on({
				"mouseenter":function(e){
					$line.stop().animate({left:i * w},800,"easeOutBack");
				},
				"mouseleave":function(e){
					$line.stop().animate({left:index * w},1000,"easeInOutCirc");
				}
			});
		});
		$(window).on("scroll",scrollFuc);
		scrollFuc();
	})();
	//下拉菜单
	(function(){
		$('ul.fr').on({
			"mouseenter":function(e){
				$(this).addClass('hover');
			}, 
			'mouseleave': function(){
				$(this).removeClass('hover');
			}
		})
	})();
	/*写入统计器代码
	(function(){
		var $script = document.createElement('script');
		$script.charset = 'gb2312';
		$script.src = 'http://count8.51yes.com/click.aspx?id=80293971&logo=12';
		document.getElementById('tongjiqi').appendChild($script);
	})();*/
},["jquery/easing"]);
