Fengs.add('zx/ui/font', function(S, $){
	return {
		font:function($ele,data){
			var fontselector = {
				target: null
				, title:null
				, drop:null
				, init:function($ele){
					this.target = $ele;
					var $wrap = $('<div class="ui_font"><div class="ui_font_title"></div><div class="ui_font_drop"></div></div>')
						, $title = $(".ui_font_title", $wrap)
						, $drop = $(".ui_font_drop", $wrap)
						, html = [];
					html.push('<div class="ui_font_sub"><a class="zh" data-id="zh">中文字体</a><a class="en" data-id="en">英文字体</a></div>');
					for(items in data){
						html.push('<div class="ui_font_list '+ items +'">');
						for(var i=0,list=data[items].list,len=list.length; i<len; i++){
							html.push('<a rel="'+ list[i].id +'"><img src="'+ list[i].curmb +'" alt="'+ list[i].title +'"/></a>');
						}
						html.push('</div>');
					}
					$drop.html(html.join('')).on("click",".ui_font_list a",function(e){
						$ele.val($(this).attr('rel')).trigger('change');
					}).on("click", ".ui_font_sub a",function(){
						$("."+ $(this).data('id'), $wrap).addClass("cur").siblings('.cur').removeClass("cur");
						return false;

					}).on("click",function(){
						return false;
					});
					$ele.after($wrap);
					this.title = $title;
					this.drop = $drop;
					$ele.on("change",$.proxy(this.change,this)).css("display","none");
					$title.click(function(e){
						$drop.css("display","block");
						return false;
					});
					$drop.on("click",".ui_font_sub",function(e){
						return false;
					})
					$(".zh", $wrap).addClass("cur");
					$(document).on("click",function(){
						$drop.css("display","none");
					});
				}
				,change:function(e){
					var val = e.target.value
						, family = val;
					for(item in data){
						for(var i=0,list=data[item].list,len=list.length; i<len; i++){
							if(family != val){
								break;
							}else if(family == list[i].id){
								family = list[i].title;
								break;
							};
						}
					}
					this.title.text(family);
				}
			};
			fontselector.init($ele);
		}
		,size:function($ele){
			var $wrap = $('<div class="ui_size"><div class="ui_size_drop"></div></div>')
				, $drop = $(".ui_size_drop", $wrap)
				, html = [];
			for(var i=8; i< 66; i++){
				html.push('<a style="font-size:'+ i +'px;">'+ i +'</a>');
			};
			$drop.html(html.join('')).on("click",".ui_size_drop a",function(e){
				$ele.val($(this).text()).trigger('change');
			});
			$ele.after($wrap).remove();
			$drop.before($ele);
			$ele.click(function(e){
				$drop.css("display","block");
				return false;
			});
			$drop.on("click",".ui_font_sub",function(e){
				return false;
			})
			$(document).on("click",function(){
				$drop.css("display","none");
			});
		}
	}
});
Fengs.add('zx/ui/base', function(S, $, COLPICK){
	var uiobj = {
		autoid:0
		, loadui:function($wrap){
			if(!$wrap){
				$wrap = $("body");
			};
			$("[ui]",$wrap).each(function(){
				var $this = $(this)
					, ui = $this.attr("ui");
				switch(ui){
					case "color":
						uiobj.color($this);
						break;
					case "radio":
						uiobj.radio($this);
						break;
					case "upload":
						uiobj.upload($this);
						break;
				}
			});
			/*$("select").each(function(){
				uiobj.select($(this));
			})*/
		}
		//颜色选择器
		, color:function($this){
			var val = $this.val();
			if(val.match(/^\#[0-9a-f]{3}$/ig) !== null){
				val = val.replace(/[0-9a-f]/ig, function(a){return a + a;})
			};
			$this.width(50).colpick({
				layout:'rgbhex',
				color: val
			}, window.document);
		}
		//SELECT控件
		, select:function($this){
			var _options = $this.find("option"),//下拉项
				_loadval = _options.filter(":selected").text(),
				_IsEditable = $this.attr("IsEditable");
			//检测是否生成过，如果生成过就删除原项目重新生成
			uiobj.addAutoID($this);
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
			var $items = $menu.find(".feng_select_list");
			$title.click(function(){
				var dropup = false;//判断是否向上弹出层
				if(($sub.height() + $wrap.height()) > $(document).height() - $wrap.offset().top - 15){
					$sub.css("top",-2 - $sub.height());
					dropup = true;
				};
				if($sub.css("display") == "block"){
					if(uiobj.ie6){
						$sub.css("display","none");
						$wrap.css({"position":"static","z-index":1});
					}else{
						$btnicon.css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});//CSS3旋转180度动画
						$sub.css("display","none");
						$wrap.css({"position":"static","z-index":1});
					}
				}else{
					uiobj.clearDrop();//清除已弹出的下拉框
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
			$wrap.append($title, $sub).insertAfter($this).css('width',width);
			$this.css("display","none");
			if($items.length > 5){
				$sub.height(119);
			};
		}
		//RADIO模拟
		, radio:function($this){
			var items = $("a", $this);
			$this = $this[0];
			$this.val = function(value){
				if(!value){
					for(var i=0,len=items.length; i<len; i++){
						if(items.eq(i).hasClass('cur')){
							return items.eq(i).attr("rel");
						};
					};
					return "";
				}else{
					items.filter("[rel='"+ value +"']").addClass('cur').siblings('.cur').removeClass('cur');
				}
			};
			items.click(function(){
				var $this = $(this);
				$this.addClass('cur').siblings('.cur').removeClass('cur');
			});
			if($this.val() == ""){
				$this.val(items.eq(0).attr("rel"));
			}
		}
		, upload:function($this){
			var uploadtype = $this.attr("ui-type") == "1" ? 1 : 0;
			S.use("zx/maker/upload",function(UPLOAD){
				var $upbtn = $('<a class="upbtn" title="上传图片"></a>')
					, $delbtn = $('<a class="delimg" title+"清除图片"></a>')
					, $upload = new UPLOAD(uploadtype);
				$this.before($upbtn).after($delbtn).on("change",function(){
					$delbtn.css("visibility", $this.val() == "" ? "collapse" : "visible");
				});
				$delbtn.click(function(){
					$this.val('').trigger('change');
				});
				$upload.init($upbtn, function(imgurl, id){
					$this.val(imgurl).trigger('change');
				});
				if($this.attr("readonly")){
					$this.click(function(){
						$upbtn.trigger("click");
					}).css("cursor","pointer");
				}
				$delbtn.css("visibility", $this.val() == "" ? "collapse" : "visible");
			});
		}
		/*, warn:function(e,n) {
			var i = $("#ui_warn");
			if(typeof e != "string"){
				return;
			}
			e = e.indexOf("！")<0 ? e + "！" : e;
			if(i.length == 0){
				i = $('<dl class="ui_mark" id="ui_warn"><dt></dt><dd><span>' + e + '</span></dd><dt></dt></dl>');
				$("body").append(i);
			}else{
				i.find("span").text(e);
			};
			setTimeout(function() {
				i.remove();
			},1000);
		}
		, loading:{
			show:function(e){
				var i = $("#ui_loading");
				e = e.indexOf("…")<0 ? e + "…" : e;
				if(i.length == 0){
					i = $('<dl class="ui_mark" id="ui_loading"><dt></dt><dd><span class="load_bg">' + e + '</span></dd><dt></dt></div></dl>');
					$("body").append(i);
				}else{
					i.find("span").text(e);
				};
			}
			,hide:function(str){
				$("#ui_loading").fadeOut(function(){
					$(this).remove();
				});
			}
		}
		, prompt:function(title, label, value, callback){
			var $ele = $('<dl class="ui_mark" id="ui_prompt"></dl>')
				,html = [];
			html.push('<dt></dt><dd><div class="prompt"><div class="title">'+ title +'</div>');
			html.push('<div class="form_groud">');
			html.push('<div class="form_item">');
			html.push('<input type="hidden" name="format" value="json"/>');
			html.push('<label>'+ label +'</label>');
			html.push('<input type="text" id="text" value="'+ value +'" placeholder="'+ label +'"/>');
			html.push('</div>');
			html.push('<div class="form_sub">');
			html.push('');
			html.push('<a class="btn blue btnok">确定</a>');
			html.push('<a class="btn btncl">取消</a>');
			html.push('</div></div>');
			html.push('</div></dd><dt></dt>');
			$ele.html(html.join(''));
			$("body").append($ele);
			$ele.find("input")[0].select();
			$ele.on("click","a.btncl",function(){
				$ele.fadeOut($ele.remove());
			}).on("click","a.btnok",function(){
				var val = $("input#text", $ele).val();
				if(val == ""){
					uiobj.warn('请输入'+ label);
				}else{
					callback && callback(val);
					$ele.fadeOut($ele.remove());
				};
			});
		}*/
		//删除旧的UI元素并重新生成
		, addAutoID:function($element){
			if($element.attr("fenguiID") == null || $element.attr("fenguiID")==""){
				$element.attr("fenguiID",uiobj.autoid);
				uiobj.autoid++;
			};
			var _oldElement = $("#"+ $element.attr("fenguiID")+"_fengcopy");
			if(_oldElement.length > 0){
				_oldElement.remove();
			};
		}
		//清除已弹出的控件
		, clearDrop:function(){
			$("div[feng='drop']").hide();
			$("div[feng='wrap']").css({"position":"static","z-index":1});
			$("div[feng='selecticon']").css({"transform":"rotate(0deg)","transition":"all 0.3s ease-in"});
		}
	};
	return uiobj;
}, ['zx/control/colpick']);
Fengs.add('zx/maker', function(S, $, UI, DESIGNER, REQ, COOKIE, LAB){
	var W = window
		, uri = S.parseUri(W.location.href,"?")
		, resize = function(){
			var w = document.body.clientWidth
				, h = document.body.clientHeight;
			$("section").css({width:w - 221,height: h -42});
			$("aside").height(h -42);
		};
	if(!W.userAgent){
		uri.username = uri.num;
	}
	$.cookie("KEHUDA_DESC_USER",uri.username,{path:"/",expire:365});
	//初始化设计器
	DESIGNER.init(uri.uid, uri.id , function(){
		LAB.loading.hide();
	});
	resize();
	$(window).resize(resize);
},["./ui/base", "./maker/base", "common/require", "jquery/cookie", "zx/lab"]);