Fengs.add('ui/combobox', function(S, $){
	/*var ComboBox = function($el){
		this.el = $el;
		var _this = $el[0];
		//设置常量及变量
		var _options = $("option", $el)			//下拉项
			, config = $el.data('ui')
			, _loadval = ""						//当前控件选中值
			, _IsEditable = config.editable
			, _IsDelitem = config.delitem
			, _IsCloseDrop = true
			, html = new Array();				//是否允许用户编辑值
		if(_this.options.selectedIndex >= 0){
			_loadval = _options[_this.options.selectedIndex].innerHTML;
		};
		//_wrapwidth = _wrapwidth < 45 ? 45 :_wrapwidth;
		//_wrapwidth = _wrapwidth > _maxWidth ? _maxWidth : _wrapwidth;
		_IsEditable = _IsEditable != null ? true : false;
		var $wrap = $('<div class="feng_select '+ (_IsEditable ? 'IsEditable' : '') +'"></div>');
		//写入自定义控件的HTML格式
		html.push("<div class='feng_select_title'>");
		html.push("<div class='feng_select_value'><input type='text' placeholder='"+ $el.attr("placeholder") +"'/><span></span></div>");
		html.push("<div class='feng_select_button'>");
		html.push("<div class='feng_select_button_icon png'></div>");
		html.push("</div></div>");
		html.push("<div class='feng_select_sub' feng='drop'><div class='feng_select_sub_close'>");
		html.push("<img src='/images/pc/skin/close.gif'/></div>");
		html.push("<div class='feng_select_menu_wrap'><div class='feng_select_menu' >");
		html.push("</div></div></div>");
		$wrap.html(html.join(""));
		var _title = $wrap.find(".feng_select_title"),
			_menu = $wrap.find(".feng_select_menu"),
			_sub = $wrap.find(".feng_select_sub"),
			_value = $wrap.find("span"),						//菜单内容
			_input = $wrap.find("input"),
			_close = $wrap.find(".feng_select_sub_close"),
			_button = $wrap.find(".feng_select_button");		//按钮
		_title.id = $el.attr("data-class");
		if(_IsEditable){
			//_input.css({display:"block",width:_wrapwidth - 50});
			_value.css('display',"none");
			_input.val(_loadval);
		}else{
			_input.css("display","none");
			_value.text(_loadval);
		};
		//收缩
		$wrap.dropUp = function(){
			$wrap.css("position","static");
			_sub.css({"display":"none",top:33});
		};
		//展开
		$wrap.dropDown = function(){
			$wrap.css("position","relative");
			_sub.css("display","block");
			var y = $.dom.offsetTop(_sub),
				h = _sub.offsetHeight,
				d = document.documentElement.offsetHeight;
			if(d < (h + y + 60)){
				_sub.css({top:0 - h - 5});
			}else{
				_sub.css({top:33});
			};
		};
		//添加select子项
		for (var i=0; i<_options.length;i++){
			var option = _options.eq(i)
				, opchild = $('<div class="feng_select_list" id="'+ option.attr('value') +'"></div>')
				, text = option.text();
			if(_IsDelitem && _options[i].value != ""){
				opchild.text("<img src='/images/pc/quan.gif'/>" + text);
				opchild.on('mousedown', 'img', function(){
					if(this.alt == _this.value){
						_this.selectedIndex = -1;
						_input.val('');
						_value.text('');
					};
					e.preventDefault();
					return false;
				});
			}else{
				opchild.text(text);
			};
			opchild.alt = text;
			opchild.proto = _options[i];
			_menu.append(opchild);
			if(_this.options.selectedIndex == i){
				opchild.addClass("feng_select_list_selected");
			};
			opchild.onclick = function(e){
				var ops = _menu.find("div");
				for(var j=0; j < ops.length; j++){
					ops[j].className = "feng_select_list";
				};
				this.proto.selected = true;
				this.addClass("feng_select_list_selected");
				if(_IsEditable){
					_input.value = this.alt;
				}else{
					_value.innerHTML = this.alt;
				};
				if(_this.onchange){
					_this.onchange();
				};
				//清除冒泡
				$wrap.dropUp();
				$.stopPropagation(e);
				return false;
			};
		};
		var listenChange = function(){
			_value.innerHTML = _options[_this.options.selectedIndex].innerHTML;
		};
		if(!window.XMLHttpRequest && _options.length > 6 ){
			_sub.css("height","245px");
		};
		//添加事件监听
		_sub.css("display","none");
		$el.on({
			"change":listenChange,
			"focus":function(){$wrap.show();}
		});
		_title.on("click",function(e){
			if(_this.disabled){return;};
			if(_sub.style.display != "none"){
				$wrap.dropUp();
			}else{
				$wrap.dropDown();
			};
			//清除弹出所有弹出的选择框
			var selectWrap = $.find(".feng_select");
			if(selectWrap.length == 0) return;
			for(var i = 0; i < selectWrap.length; i++){
				if(selectWrap[i] != $wrap && selectWrap[i].dropUp){
					selectWrap[i].dropUp();
				};
			};
			//除除冒泡
			$.stopPropagation(e);
			return false;
		});
		_close.on("click",function(){
			$wrap.dropUp();
		});
		//可编辑文本框选中状态并清除冒泡
		_input.on({
			"focus":function(e){
				this.select();
				$wrap.dropUp();
				e.preventDefault();
			},
			"click":function(e){
				e.preventDefault();
				return false;
			},
			"blur":function(){
				var $el = $(this)
					, _val = $el.val()
					, _index = -1;
				//为空时返回
				if(_val == null || _val == "" || _val == "undefined"){
					return;
				}else{
					if(_val == $el.attr("placeholder")){
						$el.css("color","#AAA");
						return;
					}else{
						$el.css("color","");
					}
				};
				//循环读取当前值
				_option = $el.find("option");
				var length = _option.length;
				if(length > 0){
					for(var i = 0; i < length; i++){
						if(_option[i].value ==  _val){
							_option[i].selected = true;
							_index = i;
						};
					};
				};
				//当前没有值则添加新的值
				if(_index < 0){
					$el.append('<option value="'+ _val +'" selected>'+ _val +'</option>');
					//_this.options.selectedIndex = _option.length;
				};
			},
			"keyup":function(){
				if(_this.keyup){
					_this.keyup();
				};
			}
		});
		$(document).on({
			"click":function(){
				$wrap.dropUp();
			},
			"touchstart":function(){
				if(_IsCloseDrop){$wrap.dropUp();};
			}
		});
		$wrap.on({
			"touchstart":function(){
				_IsCloseDrop = false;
			},
			"touchend":function(e){
				_IsCloseDrop = true;
			}
		});
		//插入自定义的select控件
		$el.before($wrap).css("display","none");
		$el.data('target', $wrap);
	};*/
	var ComboBox = function($el){
		this.el = $el;
		var _config = $el.data('ui');

		var _options = $el.find("option")//下拉项
			, _loadval = _options.filter(":selected").text()
			, _IsEditable =_config.editable
			, _delItem = _config.delitem;
		var $wrap = $("<div class='feng_select' id='"+ $el.attr("fenguiid")+"_fengcopy' feng='wrap'/>"),  //选择插件外套
			$title = $("<div class='feng_select_title' />"),                                        //选择插件显示标题
			$menu = $("<div class='feng_select_menu' />"),                                          //下拉框
			$sub = $("<div class='feng_select_sub' feng='drop' />"),                             //滚动条
			$value = $("<div class='feng_select_value'><p></p></div>"),                                                 //菜单内容
			$input = $("<input type='text' style=' border:none;'/>"),
			$button = $("<div class='feng_select_button'></div>"),                                               //按钮
			$btnicon = $("<div class='feng_select_button_icon png' feng='selecticon'></div>"),
			resetSubWidth = function(){
				var w = $el.data('width');
				$sub.width(w ? w : $wrap.outerWidth());
			};                                       //按钮图标
		for (var i=0,len=_options.length; i<len;i++){
			$menu.append("<div class='feng_select_list' id='"+ _options.eq(i).val() +"' title='"+ _options.eq(i).text() +"'>"+ (_delItem ? '<em class="del"></em>' : '') + _options.eq(i).text() +"</div>");
		};
		$(window).resize(function(){
			resetSubWidth();
		});
		//FengUI.isTooltip($el, $button);
		var $items = $menu.find("div.feng_select_list");
		$title.click(function(){
			var dropup = false;//判断是否向上弹出层
			if(($sub.height() + $wrap.height()) > $(document).height() - $wrap.offset().top - 15){
				$sub.css("top",-2 - $sub.height());
				dropup = true;
			};
			if($sub.css("display") == "block"){
				/*if(FengUI.ie6){
					$sub.css("display","none");
					$wrap.css({"position":"static","z-index":1});
				}else{*/
					$btnicon.css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});//CSS3旋转180度动画
					$sub.css("display","none");
					$wrap.css({"position":"static","z-index":1});
				//}
			}else{
				$wrap.css({"position":"relative","z-index":9});
				$btnicon.css({"transform":"rotate(-180deg)","transition":"all 0.3s ease-in"});//CSS3旋转180度动画
				resetSubWidth();
				if(dropup){
					$sub.css({"top":(-2 - $sub.height()),"z-index":10,"display":"block"});
				}else{
					$sub.css({"z-index":10,"display":"block"});
				};
				if($.browser.opera){
					$("input, button, textarea").mouseover(function(){
						return false;
					});
				};
			};
			return false;
		});
		$input.on({
			"click":function(){
				$value.select();
				return false;
			},
			"blur":function(){
				var $options = $el.find("option"),
					_value = $input.val(),
					_index = -1;
				for(var i=0, len=$options.length; i<len; i++){
					if($options.eq(i).val() == _value){
						_index = i;
					};
				};
				if(_index >= 0){
					$el.val(_value);
					$items.removeClass("feng_select_list_selected");
					$items.eq(_index).addClass("feng_select_list_selected")
				}else{
					var $newoption = $("<option selected='selected'>"+ _value +"</option>");
					$el.prepend($newoption);
					$newoption.siblings('option').attr('selected',false);
					//$el.fengUI();
				};
			}
		});
		$(document).click(function(e){
			if($sub.css("display") == "block"){
				$btnicon.css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});//CSS3旋转180度动画
				$sub.css("display","none");
				$wrap.css({"position":"static","z-index":1});
			};
		});
		$items.on({
			"click":function(e){
				var $item = $(this)
					,text = $item.text();
				$items.removeClass("feng_select_list_selected");
				$item.addClass("feng_select_list_selected");
				$value.text(text).attr("title",text);
				$input.val(text);
				$el.val($item.attr("id"));
				$el.trigger("change");
				e.preventDefault();
			},
			"mouseover":function(e){
				var $item = $(this);
				$items.removeClass("feng_select_list_hover");
				$item.addClass("feng_select_list_hover");
				e.preventDefault();
			}
		});
		//写入初始选定值
		if(_IsEditable){
			$title.append($input, $button);
			$input.attr('placeholder', $el.attr('placeholder'));
		}else{
			$title.append($value, $button);
			$value = $value.find("p");
		};
		if(_delItem){
			$sub.on('click', 'em.del', function(e){
				var $item = $(this).parent();
				$item.remove();
				$el[0].delCallback && $el[0].delCallback($item.text());
				e.preventDefault();
			});
		}
		$value.text( _loadval).attr("title",_loadval);
		$input.val(_loadval);
		$menu.find("li:contains('"+ _loadval +"')").addClass("feng_select_list_selected");
		$button.append($btnicon);
		$sub.append($menu);
		var width = $el[0].style.width;
		if(width == "" || width == "undefined " || width==null){
			width = $el.css("width");
		}
		$wrap.append($title, $sub).insertAfter($el).css('width',width);
		$el.css("display","none");
		var _len = $items.length
			, _height = $el.data('height');
		if(_len > 5){
			$sub.height(119);
		};
		if(_height){
			if(_height > _len * 24){
			$sub.height('auto');
			}else{
				$sub.height($el.data('height'));
			}
		};
	};
	return {'init': function($ele){
		return new ComboBox($ele);
	}}
});