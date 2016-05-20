Fengs.add('kehuda/ui/base', function (S, $){
	var FengUI = function(){
		return {
			ie6:!-[1,] && !window.XMLHttpRequest,
			config:{
				autoid:0                       //自动ID
			},
			loadFengUI:function(options){
				var $this = $(this);
				FengUI.config = $.extend(FengUI.config,options);
				if($this.is("select")){
					FengUI.select($this);
				}else{
					if ($.browser.msie && $.browser.version <= "9.0") { 
						$this.find("input[type='text'],textarea").each(function(){
							FengUI.placeholder($(this),false);
						});
						$this.find("input[type='password']").each(function(){
							FengUI.placeholder($(this),true);
						});
					};
					$this.find("select").each(function(){
						FengUI.select($(this));
					});
				}
			},
			/********************************
			// 选择框 select
			********************************/
			select:function($this){
				var _options = $this.find("option"),//下拉项
					_loadval = _options.filter(":selected").text(),
					_IsEditable = $this.attr("IsEditable");
				//检测是否生成过，如果生成过就删除原项目重新生成
				FengUI.addAutoID($this);
				var $wrap = $("<div class='feng_select' id='"+ $this.attr("fenguiID")+"_fengcopy' feng='wrap'/>"),  //选择插件外套
					$title = $("<div class='feng_select_title' />"),                                        //选择插件显示标题
					$menu = $("<div class='feng_select_menu' />"),                                          //下拉框
					$sub = $("<div class='feng_select_sub' feng='drop' />"),                             //滚动条
					$value = $("<div class='feng_select_value'><p></p></div>"),                                                 //菜单内容
					$input = $("<input type='text' style=' border:none;'/>"),
					$button = $("<div class='feng_select_button'></div>"),                                               //按钮
					$btnicon = $("<div class='feng_select_button_icon png' feng='selecticon'></div>"),
					resetSubWidth = function(){
						var w = $wrap.outerWidth();
						$sub.width(w);
					};                                       //按钮图标
				for (var i=0,len=_options.length; i<len;i++){
					$menu.append("<div class='feng_select_list' id='"+ _options.eq(i).val() +"' title='"+ _options.eq(i).text() +"'>"+ _options.eq(i).text() +"</div>");
				};
				$(window).resize(function(){
					resetSubWidth();
				});
				//FengUI.isTooltip($this, $button);
				var $items = $menu.find("div.feng_select_list");
				$title.click(function(){
					var dropup = false;//判断是否向上弹出层
					if(($sub.height() + $wrap.height()) > $(document).height() - $wrap.offset().top - 15){
						$sub.css("top",-2 - $sub.height());
						dropup = true;
					};
					if($sub.css("display") == "block"){
						if(FengUI.ie6){
							$sub.css("display","none");
							$wrap.css({"position":"static","z-index":1});
						}else{
							$btnicon.css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});//CSS3旋转180度动画
							$sub.css("display","none");
							$wrap.css({"position":"static","z-index":1});
						}
					}else{
						FengUI.clearDrop();//清除已弹出的下拉框
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
				$input.bind({
					"click":function(){
						$value.select();
						return false;
					},
					"blur":function(){
						var $options = $this.find("option"),
							_value = $input.val(),
							_index = -1;
						for(var i=0,len=$options.length; i<len; i++){
							if($options.eq(i).val() == _value){
								_index = i;
							};
						};
						if(_index >= 0){
							$this.val($value.val());
							$items.removeClass("feng_select_list_selected");
							$items.eq(_index).addClass("feng_select_list_selected")
						}else{
							var $newoption = $("<option selected='selected'>"+ _value +"</option>");
							$this.prepend($newoption);
							//$this.fengUI();
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
				$items.bind({
					"click":function(e){
						var $item = $(this)
							,text = $item.text();
						$items.removeClass("feng_select_list_selected");
						$item.addClass("feng_select_list_selected");
						$value.text(text).attr("title",text);
						$input.val(text);
						$this.val($item.attr("id"));
						$this.trigger("change");
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
				if(_IsEditable == "true"){
					$title.append($input, $button);
				}else{
					$title.append($value, $button);
					$value = $value.find("p");
				};
				$value.text( _loadval).attr("title",_loadval);
				$input.val(_loadval);
				$menu.find("li:contains('"+ _loadval +"')").addClass("feng_select_list_selected");
				$button.append($btnicon);
				$sub.append($menu);
				var width = $this[0].style.width;
				if(width == "" || width == "undefined " || width==null){
					width = $this.css("width");
				}
				$wrap.append($title, $sub).insertAfter($this).css('width',width);
				$this.css("display","none");
				if($items.length > 6){
					$sub.height(167);
				};
			},
			//自定义提示文本
			placeholder:function($this,ispass){
				if($this.holded == true){return;};
				var holder = $this.attr("placeholder");
				if(holder == null || holder == ""){return;}
				var oldcolor = "#484848";
					newcolor = "#AAAAAA";
				if(ispass){
					//密码框
					var _span = $.createElement("span");
					_span.className = "placeholder";
					_span.innerHTML = holder;
					$this.parentNode.insertBefore(_span,$this);
					if($this.value != ""){
						_span.css("display","none");
					}
					$this.bind({
						"focus":function(){
							_span.css("display","none");
						},
						"blur":function(){
							if($.string.trim($this.value) == ""){
								_span.css("display","block");
							};
						}
					});
					_span.onclick = function(){
						$this.focus();
					};
				}else{
					//文本框
					if($this.val() == "" || $this.val()==holder){
						$this.val(holder);
						$this.css("color",newcolor);
					}
					$this.bind({
						"focus":function(e){
							if($this.val() == holder){
								$this.val("");
							};
							$this.css("color",oldcolor);
						},
						"blur":function(e){
							if($this.val() == "" || $this.val() == holder){
								$this.val(holder);
								$this.css("color",newcolor);
							};
						}
					});
				};
				$this.holded = true;
			},
			copybtn:function($this){
				if($this.attr("ui-load") == 1){
					return;
				};
				var txt = $("<i>"+ $this.text() +"</i>")
					,btn = $("<i class='copybtn' title='复制'></i>");
				$this.html("").append(txt,btn);
				$this.attr("ui-load",1);
				btn.click(function(){
					var el = txt[0];
					if(window.getSelection){
						var s=window.getSelection()
						s.selectAllChildren(el)
					}else{
						var s= document.body.createTextRange();
						s.moveToElementText (el);
						s.select();   
					}
					document.execCommand("Copy");
					openWarn($this.attr("ui-title") +"已复制到剪贴板");
				});
			},
			//删除旧的UI元素并重新生成
			addAutoID:function($element){
				if($element.attr("fenguiID") == null || $element.attr("fenguiID")==""){
					$element.attr("fenguiID",FengUI.config.autoid);
					FengUI.config.autoid++;
				};
				var _oldElement = $("#"+ $element.attr("fenguiID")+"_fengcopy");
				if(_oldElement.length > 0){
					_oldElement.remove();
				};
			},
			//清除已弹出的控件
			clearDrop:function(){
				$("div[feng='drop']").hide();
				$("div[feng='wrap']").css({"position":"static","z-index":1});
				$("div[feng='selecticon']").css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});
			}
			//插件结束
		};
	}();
	$.fn.extend({
		loadUI:FengUI.loadFengUI,
		tooltip:FengUI.fengTooltip
	});
	$.ui = FengUI;
	$(document).ready(function(){
		$("body").loadUI();
	});
});