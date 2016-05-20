Fengs.add('zx/control/ui', function(S, $){
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
			$.use("plus/jpicker",function(){
				$this.jPicker();
			});
		}
		//SELECT控件
		, select:function($this){
			var _options = $this.find("option"),//下拉项
				_loadval = _options.filter(":selected").text(),
				_IsEditable = $this.attr("IsEditable");
			//检测是否生成过，如果生成过就删除原项目重新生成
			uiobj.addAutoID($this);
			var $wrap = $("<div class='feng_select' id='"+ $this.attr("fenguiID")+"_fengcopy' feng='wrap'/>"),  //选择插件外套
				$title = $("<div class='feng_select_title' />"),										//选择插件显示标题
				$menu = $("<div class='feng_select_menu' />"),										  //下拉框
				$sub = $("<div class='feng_select_sub' feng='drop' />"),							 //滚动条
				$value = $("<div class='feng_select_value'><p></p></div>"),												 //菜单内容
				$input = $("<input type='text' style=' border:none;'/>"),
				$button = $("<div class='feng_select_button'></div>"),											   //按钮
				$btnicon = $("<div class='feng_select_button_icon png' feng='selecticon'></div>"),
				resetSubWidth = function(){
					var w = $wrap.outerWidth();
					$sub.width(w);
				};									   //按钮图标
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
			$.use("modules/upload",function(UPLOAD){
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
		, warn:function(e,n) {
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
		}
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
});
Fengs.add('zx/control/wangwang', function(S, $, UI, UPLOAD){
	return function(){
		return {
			wrap: null						//外容器
			, target: null
			, addbtn: null
			, list:[]
			, itemCount: 0
			, title: ['旺旺账号','旺旺昵称','头像']
			, value: ['旺旺','昵称','http://']
			, max: 8						//最大记录数
			, init:function($this){
				var t = this
					, $wrap = $('<div class="control-wrap control-picture"></div>')
					, html = []
					, val = $this.val()
					, add = function(){
						t.add({});
					}
					, del = function(){

					};
				$this.css("display","none");
				var config = $this.data('config');
				if(config){
					t.title = config.title ? config.title : t.title;
					t.value = config.value ? config.value : t.value;
				};
				for(var i =0,len = t.title.length; i<len; i++){
					if(t.title[i] !== false){
						t.itemCount++;
					}
				};
				t.max = config.max ? config.max : 8;
				html.push('<div class="grid-header">');
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'">▼'+ t.title[0] +'</div>');
				}
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'">▼'+ t.title[1] +'</div>');
				}
				if(t.title[2] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '35') +'">▼'+ t.title[2] +'</div>');
				};
				html.push('<div class="grid-column column-w15 column-last">▼操作</div>');
				html.push('</div>');
				html.push('<div class="control-grid"></div>');
				html.push('<div class="grid-footer"><a href="javascript:void(0);"><em></em><span>添加</span></a></div>');
				$wrap.html(html.join(''));
				t.wrap = $(".control-grid", $wrap);
				t.addbtn = $(".grid-footer", $wrap);
				t.target = $this;
				$this.before($wrap);
				$wrap.on("click",".grid-footer a",function(){
					add();
				});
				try{
					val = eval('('+ val +')');
					for(var i=0,len=val.length; i<len; i++){
						t.add(val[i]);
					};
				}catch(e){
					add();
				};

			}
			, add:function(obj){
				var t = this;
				obj = $.extend({
					user: t.value[0]
					, nick: t.value[1]
					, img: t.value[2]
				},obj);
				var $list = $('<div class="grid-row"></div>')
					, html = [];
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'"><input type="text" id="user" value="'+ obj.user +'" style="width:96%;"/></div>');
				};
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'"><input type="text" id="nick" value="'+ obj.nick +'" style="width:96%;"/></div>');
				};
				if(t.title[2] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '35') +'"><input type="text" id="img" value="'+ obj.img +'" style="width:96%;"/></div>');
				};
				html.push('<div class="grid-column column-w15 column-last">');
				html.push('<a href="javascript:void(0)" class="up"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="down"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="del"><em></em></a>');
				html.push('</div>');
				$list.html(html.join('')).on("blur","#user,#img,#nick", function(){
					var id = $(this).attr("id");
					obj[id] = $(this).val();
					t.update();
				}).on("click","a.del",function(){
					if(t.list.length <= 1){
						return UI.warn("最少要有一条记录");
					};
					t.list.splice($.inArray(obj, t.list),1);
					$list.remove();
					t.update();
				}).on("click", "a.up", function(){
					var $this = $(this);
					if($this.hasClass("disup")){
						return;
					};
					t.sort($list,obj,-1);
				}).on("click", "a.down", function(){
					var $this = $(this);
					if($this.hasClass("disdown")){
						return;
					};
					t.sort($list,obj,1);
				});
				t.wrap.append($list);
				t.list.push(obj);
				t.update();
				var $img = $("#img", $list)
					, $upload = new UPLOAD(1);
				$upload.init($img, function(imgurl, id){
					$img.val(imgurl).trigger('change');
				});
			}
			, sort: function(ele, obj, type){
				var t = this
					, index = $.inArray(obj, t.list)
					, target = index + type;
				t.list[index] = t.list[target];
				t.list[target] = obj;
				var $sib = $(ele[0][type == 1 ? "nextSibling" : "previousSibling"]);
				if(type == 1){
					$sib.after(ele);
				}else{
					$sib.before(ele);
				}
				t.update();
			}
			, update: function(){
				var t = this
					, arr = []
					, str;
				t.addbtn.css("display", t.list.length >= t.max && t.max>0 ? "none" : "block");
				for(var i=0,list=t.list,len=list.length; i<len; i++){
					arr.push('{"user":"'+list[i].user +'","nick":"'+ list[i].nick +'","img":"'+ list[i].img +'"}');
				};
				str = '['+ arr.join(",") +']';
				//str = str.replace(/\\/ig,"\\\\");
				//str = str.replace(/"/ig,"\\\"");
				t.target.val(str);
				$("a.disup", t.wrap).removeClass("disup");
				$("a.disdown", t.wrap).removeClass("disdown");
				$("a.up:first", t.wrap).addClass("disup");
				$("a.down:last", t.wrap).addClass("disdown");
			}
		}
	}
}, ["./ui", "./upload"]);
Fengs.add('zx/control/upload', function(S, $, UI){
	return function(uploadType){
		uploadType = uploadType ? uploadType : 0;
		return {
			target: null
			, status: 0
			, ele: null
			, init:function($target, callback){
				var $wrap = $('<div class="upload_wrap"></div>')
					, $upbtn = $('<a class="upbtn" title="上传图片">上传</a>')
					, w = $target.width();
				$wrap.width(w).insertBefore($target).append($target);
				$target.width(w - 50).after($upbtn)
				if($target.attr("readonly")){
					$target.click(function(){
						$upbtn.trigger("click");
					}).css("cursor","pointer");
				};
				$upbtn.click(function(e){
					top.photoChoser.data('config', {el: $target, val: $target.val(), cb: function(url){
						$target.val(url).trigger('blur');
					}});
					top.photoChoser.show();
				});
			}
		};
	};
}, ["./ui"]);
Fengs.add('zx/control/numberupdown', function(S, $, UI, undefined){
	return function(){
		return {
			wrap: null						//外容器
			, target: null
			, val: 0
			, min: 0
			, max: false						//最大记录数
			, jump: 1
			, test: function(instr){
				if(this.jump >= 1){
					if(/^[\d]*$/.test(instr)){
						instr = parseInt(instr);
					}else{
						instr = this.min;
					}
				}else{
					if(/^\d+(\.\d+)?$/.test(instr)){
						instr = parseFloat(instr);
					}else{
						instr = this.min;
					}
				}
				return instr;
			}
			, init:function($this){
				var t = this
					, $wrap = $('<div class="control-wrap control-number"><div class="updown"><a href="javascript:void(0);" class="up"></a><a href="javascript:void(0);" class="down"></a></div>')
					, val = parseInt($this.val())
					, interval;
				var config = $this.data('config');
				t.min = config.min == undefined ? 0 : config.min;
				t.max = config.max == undefined ? false : config.max;
				t.jump = config.jump == undefined ? 1 : config.jump;

				t.wrap = $(".control-grid", $wrap);
				t.addbtn = $(".grid-footer", $wrap);

				t.target = $this;
				$this.before($wrap);
				$this.insertBefore($('.updown',$wrap));
				$wrap.on("click","a.up",function(){
					t.up();
				}).on("click","a.down",function(){
					t.down();
				}).on("mousedown","a.up",function(){
					interval = setInterval(function(){
						t.up();
					},100);
					t.down();
				}).on("mousedown","a.down",function(){
					interval = setInterval(function(){
						t.down();
					},100);
					t.down();
				}).on("blur","input",function(){
					var val = $this.val();
					if(/^[\d]*$/.test(val)){
						t.val = parseInt(val);
					};
					t.update();
				});
				$(document).on("mouseup",function(){
					clearInterval(interval);
				});
				t.val = t.test(val);
				t.update();
			}
			, up:function(){
				var t = this;
				if(t.jump < 1){
					t.val = parseInt(t.val*10 + t.jump * 10) / 10
				}else{
					t.val += t.jump;
				}
				t.update();
			}
			, down: function(){
				var t = this;
				if(t.jump < 1){
					t.val = parseInt(t.val*10 - t.jump * 10) / 10
				}else{
					t.val -= t.jump;
				}
				t.update();
			}
			, update: function(){
				var t = this;
				t.val = t.val < t.min ? t.min : t.val;
				if(t.max !== false){
					t.val = t.val > t.max ? t.max : t.val;
				}
				t.target.val(t.val);
				t.target.trigger('change');
			}
		}
	}
}, ["./ui"]);
Fengs.add('zx/control/selector', function(S, $, UI, UPLOAD, NUMUPDOWN){
	return function(){
		return {
			wrap: null						//外容器
			, target: null
			, type: 'key'
			, category: []
			, config: {
				countTips: ''
				, countJump: 1
				, countMax: 20
				, countMin: 1
			}
			, keyword: ""
			, sort: "time_desc"
			, count: 12
			, childIds: []
			, query: function(queryType){
				var t = this;
				t.type = queryType;
				var $cura = t.tab.filter('[rel='+ queryType +']');
				t.label.text($cura.text());
				$cura.addClass("cur").siblings('a').removeClass("cur");
				t.panel.filter('.t_'+ queryType).css("display","block").siblings('.control-group').css("display","none");
				t.group.css("display", queryType == 'id' ? "none" : "block");
				t.update();
			}
			, init:function($this){
				var t = this
					, $wrap = $('<div class="control-wrap control-selector"></div>')
					, timestamp = new Date().getTime()
					, cateid = 'cate'+ timestamp
					, html = [];
				t.config = $.extend(t.config, $this.data('config'));
				t.target = $this;
				try{
					var attr = $.parseJSON($this.val());
					t.childIds = attr.childIds ? attr.childIds : t.childIds;
					t.type = attr.type ? attr.type : t.type;
					t.category = attr.category ? attr.category : t.category;
					t.keyword = attr.keyword ? attr.keyword : t.keyword;
					t.count = attr.count ? attr.count : t.count;
					t.sort = attr.sort ? attr.sort : t.sort;
					t.childIds = attr.childIds ? attr.childIds : t.childIds;
				}catch(e){}
				html.push('<div class="selector-title">');
				html.push('<a rel="id"><em></em><span>按勾选</span></a>');
				html.push('<a rel="cate"><em></em><span>按分类</span></a>');
				html.push('<a rel="key"><em></em><span>按关键字</span></a>');
				html.push('<div><span>当前为</span><b>按勾选</b><span></span></div>');
				html.push('</div><div class="selector-content">');
				html.push('<div class="control-group panel t_id"><label class="control-label" data-zx="1">分类</label><div class="control"><a href="javascript:void(0);" class="widget-btn J_itemChoseBtn">选择宝贝</a><span class="J_itemsSum"> （已 <em>'+ t.childIds.length +'</em> 个宝贝）</span><textarea class="J_itemDate" style="display: none;">'+ t.childIds.join(',') +'</textarea></div></div>');
				html.push('<div class="control-group panel t_cate"><label class="control-label" data-zx="1">分类</label><div class="control"><a href="javascript:void(0);" class="widget-btn J_categoryChoseBtn">选择类目</a><span class="J_categorySum"> （已 <em>'+ t.category.length +'</em> 个类目） </span><textarea class="J_categoryDate" style="display: none;">'+ t.category.join(',') +'</textarea></div></div>')
				html.push('<div class="control-group panel t_key"><label class="control-label">关键字</label><div class="control"><input class="input-box" type="text" autocomplete="off" id="keyword" value="'+ t.keyword +'"></div></div>');
				html.push('<div class="control-group group"><label class="control-label">宝贝数量</label><div class="control"><input class="input-box" type="text" data-config=\'{"max":'+ t.config.countMax +',"min": '+ t.config.countMin +',"jump": '+ t.config.countJump +'}\' value="'+ t.count +'" autocomplete="off" id="count"><span class="tips">'+ t.config.countTips +'</span></div></div>');
				html.push('<div class="control-group group"><label class="control-label">宝贝排序</label><div class="control"><select class="input-box" id="sort">');
				html.push('<option value="hot_desc">销量高到低 </option>');
				html.push('<option value="hot_asc">销量低到高 </option>');
				html.push('<option value="price_desc">价格高到低</option>');
				html.push('<option value="price_asc">价格低到高 </option>');
				html.push('<option value="time_desc">宝贝新到旧</option>');
				html.push('<option value="time_asc">宝贝旧到新</option>');
				html.push('</select></div></div>');
				html.push('</div></div>');
				$wrap.html(html.join('')).on("change","#keyword",function(){
					t.keyword = this.value;
					t.update();
				}).on("change", "#sort", function(){
					t.sort = $(this).val();
					t.update();
				}).on("change", "#count", function(){
					t.count = $(this).val();
					t.update();
				});
				var $J_categoryDate = $(".J_categoryDate", $wrap)
					, $J_itemDate = $(".J_itemDate", $wrap);
				$J_categoryDate[0].change = function(e){
					t.category = $J_categoryDate.val().split(',');
					t.update();
				}
				$J_itemDate[0].change = function(e){
					t.childIds = $J_itemDate.val().split(',');
					t.update();
				}
				var $number = new NUMUPDOWN(1);
				$number.init($('#count', $wrap));
				$('#sort', $wrap).val(t.sort);
				/*
				$(".J_itemChoseBtn", $wrap).attr("data-issave", 1)[0].onchange = function(e){
					alert(e);
				};*/
				t.wrap = $wrap;
				t.label = $(".selector-title b", $wrap);
				t.tab = $(".selector-title a", $wrap);
				t.panel = $(".panel", $wrap);
				t.group = $('.group', $wrap);
				t.tab.click(function(){
					t.query($(this).attr('rel'));
				});
				t.query(t.type);
				$this.before($wrap).css("display","none");
			}
			, update: function(){
				var t = this;
				var category = t.category.length == 0 ? '[]' : '["'+ t.category.join('","') +'"]';
				var childIds = t.childIds.length == 0 ? '[]' : '["'+ t.childIds.join('","') +'"]';
				var str = '{"type":"'+ t.type +'","count":'+ t.count +',"category":'+ category +',"childIds":'+ childIds +',"keyword":"'+ t.keyword +'","sort":"'+ t.sort +'"}';
				t.target.val(str);
			}
		}
	}
}, ["./ui", "./upload", "./numberupdown"]);
Fengs.add('zx/control/picture', function(S, $, UI, UPLOAD){
	return function(){
		return {
			wrap: null						//外容器
			, target: null
			, addbtn: null
			, title: ['图片地址','链接地址','标题']
			, value: ['http://','#','标题']
			, list:[]
			, itemCount: 0
			, max: 6						//最大记录数
			, init:function($this){
				var t = this
					, $wrap = $('<div class="control-wrap control-picture"></div>')
					, html = []
					, val = $this.val()
					, add = function(){
						t.add({});
					}
					, del = function(){

					};
				$this.css("display","none");
				var config = $this.data('config');
				if(config){
					t.title = config.title ? config.title : t.title;
					t.value = config.value ? config.value : t.value;
				}
				for(var i =0,len = t.title.length; i<len; i++){
					if(t.title[i] !== false){
						t.itemCount++;
					}
				};
				t.max = config.max ? config.max : 6;
				html.push('<div class="grid-header">');
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '30') +'">▼'+ t.title[0] +'</div>');
				}
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '30') +'">▼'+ t.title[1] +'</div>');
				}
				if(t.title[2] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'">▼'+ t.title[2] +'</div>');
				};
				html.push('<div class="grid-column column-w15 column-last">▼操作</div>');
				html.push('</div>');
				html.push('<div class="control-grid"></div>');
				html.push('<div class="grid-footer"><a href="javascript:void(0);"><em></em><span>添加</span></a></div>');
				$wrap.html(html.join(''));
				t.wrap = $(".control-grid", $wrap);
				t.addbtn = $(".grid-footer", $wrap);
				t.target = $this;
				$this.before($wrap);
				$wrap.on("click",".grid-footer a",function(){
					add();
				});
				try{
					val = eval('('+ val +')');
					for(var i=0,len=val.length; i<len; i++){
						t.add(val[i]);
					};
				}catch(e){
					add();
				};

			}
			, add:function(obj){
				var t = this;
				obj = $.extend({
					img: t.value[0]
					, url: t.value[1]
					, title: t.value[2]
				},obj);
				var $list = $('<div class="grid-row"></div>')
					, html = [];
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '30') +'"><input type="text" id="img" value="'+ obj.img +'" style="width:96%;"/></div>');
				};
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '30') +'"><input type="text" id="url" value="'+ obj.url +'" style="width:96%;"/></div>');
				};
				if(t.title[2] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : t.itemCount == 2 ? '40' : '25') +'"><input type="text" id="title" value="'+ obj.title +'" style="width:96%;"/></div>');
				};
				html.push('<div class="grid-column column-w15 column-last">');
				html.push('<a href="javascript:void(0)" class="up"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="down"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="del"><em></em></a>');
				html.push('</div>');
				$list.html(html.join('')).on("blur","#url,#img,#title", function(){
					var id = $(this).attr("id");
					obj[id] = $(this).val();
					t.update();
				}).on("click","a.del",function(){
					if(t.list.length <= 1){
						return UI.warn("最少要有一条记录");
					};
					t.list.splice($.inArray(obj, t.list),1);
					$list.remove();
					t.update();
				}).on("click", "a.up", function(){
					var $this = $(this);
					if($this.hasClass("disup")){
						return;
					};
					t.sort($list,obj,-1);
				}).on("click", "a.down", function(){
					var $this = $(this);
					if($this.hasClass("disdown")){
						return;
					};
					t.sort($list,obj,1);
				});
				t.wrap.append($list);
				t.list.push(obj);
				t.update();
				var $img = $("#img", $list)
					, $upload = new UPLOAD(1);
				$upload.init($img, function(imgurl, id){
					$img.val(imgurl).trigger('change');
				});
			}
			, sort: function(ele, obj, type){
				var t = this
					, index = $.inArray(obj, t.list)
					, target = index + type;
				t.list[index] = t.list[target];
				t.list[target] = obj;
				var $sib = $(ele[0][type == 1 ? "nextSibling" : "previousSibling"]);
				if(type == 1){
					$sib.after(ele);
				}else{
					$sib.before(ele);
				}
				t.update();
			}
			, update: function(){
				var t = this
					, arr = []
					, str;
				t.addbtn.css("display", t.list.length >= t.max && t.max>0 ? "none" : "block");
				for(var i=0,list=t.list,len=list.length; i<len; i++){
					arr.push('{"img":"'+list[i].img+'","url":"'+ list[i].url +'","title":"'+ list[i].title +'"}');
				};
				str = '['+ arr.join(",") +']';
				//str = str.replace(/\\/ig,"\\\\");
				//str = str.replace(/"/ig,"\\\"");
				t.target.val(str);
				$("a.disup", t.wrap).removeClass("disup");
				$("a.disdown", t.wrap).removeClass("disdown");
				$("a.up:first", t.wrap).addClass("disup");
				$("a.down:last", t.wrap).addClass("disdown");
			}
		}
	}
}, ["./ui", "./upload"]);
Fengs.add('zx/control/links', function(S, $, UI, UPLOAD){
	return function(){
		return {
			wrap: null						//外容器
			, target: null
			, addbtn: null
			, list:[]
			, itemCount: 0
			, title: ['链接','URL']
			, value: ['链接','#']
			, max: 30						//最大记录数
			, init:function($this){
				var t = this
					, $wrap = $('<div class="control-wrap control-picture"></div>')
					, html = []
					, val = $this.val()
					, add = function(){
						t.add({});
					}
					, del = function(){

					};
				$this.css("display","none");
				var config = $this.data('config');
				if(config){
					t.title = config.title ? config.title : t.title;
					t.value = config.value ? config.value : t.value;
				};
				for(var i =0,len = t.title.length; i<len; i++){
					if(t.title[i] !== false){
						t.itemCount++;
					}
				};
				t.max = config.max ? config.max : 30;
				html.push('<div class="grid-header">');
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : '40') +'">▼'+ t.title[0] +'</div>');
				};
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : '40') +'">▼'+ t.title[1] +'</div>');
				};
				html.push('<div class="grid-column column-w20 column-last">▼操作</div>');
				html.push('</div>');
				html.push('<div class="control-grid"></div>');
				html.push('<div class="grid-footer"><a href="javascript:void(0);"><em></em><span>添加</span></a></div>');
				$wrap.html(html.join(''));
				t.wrap = $(".control-grid", $wrap);
				t.addbtn = $(".grid-footer", $wrap);
				t.target = $this;
				$this.before($wrap);
				$wrap.on("click",".grid-footer a",function(){
					add();
				});
				try{
					val = eval('('+ val +')');
					for(var i=0,len=val.length; i<len; i++){
						t.add(val[i]);
					};
				}catch(e){
					add();
				};

			}
			, add:function(obj){
				var t = this;
				obj = $.extend({
					title: t.value[0]+ (t.list.length + 1)
					, url: t.value[1]
				},obj);
				var $list = $('<div class="grid-row"></div>')
					, html = [];
				if(t.title[0] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : '40') +'"><input type="text" id="title" value="'+ obj.title +'" style="width:96%;"/></div>');
				};
				if(t.title[1] !== false){
					html.push('<div class="grid-column column-w'+ (t.itemCount == 1 ? '80' : '40') +'"><input type="text" id="url" value="'+ obj.url +'" style="width:96%;"/></div>');
				};
				html.push('<div class="grid-column column-w25 column-last">');
				html.push('<a href="javascript:void(0)" class="up"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="down"><em></em></a>');
				html.push('<a href="javascript:void(0)" class="del"><em></em></a>');
				html.push('</div>');
				$list.html(html.join('')).on("blur","#url,#title", function(){
					var id = $(this).attr("id");
					obj[id] = $(this).val();
					t.update();
				}).on("click","a.del",function(){
					if(t.list.length <= 1){
						return UI.warn("最少要有一条记录");
					};
					t.list.splice($.inArray(obj, t.list),1);
					$list.remove();
					t.update();
				}).on("click", "a.up", function(){
					var $this = $(this);
					if($this.hasClass("disup")){
						return;
					};
					t.sort($list,obj,-1);
				}).on("click", "a.down", function(){
					var $this = $(this);
					if($this.hasClass("disdown")){
						return;
					};
					t.sort($list,obj,1);
				});
				t.wrap.append($list);
				t.list.push(obj);
				t.update();
			}
			, sort: function(ele, obj, type){
				var t = this
					, index = $.inArray(obj, t.list)
					, target = index + type;
				t.list[index] = t.list[target];
				t.list[target] = obj;
				var $sib = $(ele[0][type == 1 ? "nextSibling" : "previousSibling"]);
				if(type == 1){
					$sib.after(ele);
				}else{
					$sib.before(ele);
				}
				t.update();
			}
			, update: function(){
				var t = this
					, arr = []
					, str;
				t.addbtn.css("display", t.list.length >= t.max && t.max>0 ? "none" : "block");
				for(var i=0,list=t.list,len=list.length; i<len; i++){
					arr.push('{"title":"'+ list[i].title +'","url":"'+ list[i].url +'"}');
				};
				str = '['+ arr.join(",") +']';
				//str = str.replace(/\\/ig,"\\\\");
				//str = str.replace(/"/ig,"\\\"");
				t.target.val(str);
				$("a.disup", t.wrap).removeClass("disup");
				$("a.disdown", t.wrap).removeClass("disdown");
				$("a.up:first", t.wrap).addClass("disup");
				$("a.down:last", t.wrap).addClass("disdown");
			}
		}
	}
}, ["./ui", "./upload"]);
Fengs.add('zx/control/chose-item', function(S, $, REQ, LAB){
	var $ = jQuery
		, cacheData = null
		, $choser
		, $list
		, $body = $(top.document.body)
		, _bodyUser = $body.data('user')
		, _bodySid = $body.data('sid');
	_bodyUser = !_bodyUser ? 'yun@sdd.com' : _bodyUser;
	_bodySid = !_bodySid ? '104338515' : _bodySid;
	var $totalNum
		, $pagination
		, $choseNum;
	var cacheData = {
		total: 0
		, listtype: 'all'
		, list: []
		, page: 1
		, lowPrice: ''
		, higPrice: ''
		, cate: -1
		, key: ''
	}
	var self = {
		'refreshList': function(list){
			//刷新分页
			var html = []
				, pageLen = Math.ceil(cacheData.total/6)
				, page = cacheData.page;
			if(page == 1){
				html.push('<a class="pg-prev pg-prev-disabled"></a>');
			}else{
				html.push('<a class="pg-prev" title="第一页" data-page="1"></a>');
			};
			if(pageLen == 0){
				html.push('<a class="pg-current pg-item" href="javascript:void(0);" data-page="1">1</a>');
				html.push('<a class="pg-next pg-next-disabled"></a>');
			}else{
				var pagesin, pageend;
				if(page < 6){
					pagesin = 1;
					pageend = pageLen > 11 ? 11 : pageLen;
				}else if(pageLen - page > 5){
					pagesin = page - 5 > 1 ? page - 5 : 1;
					pageend = pageLen > page + 5 ? page + 5 : pageLen;
				}else{
					pagesin = pageLen - 10;
					pageend = pageLen;
				};
				pagesin = pagesin < 1 ? 1 : pagesin;
				for(var i = pagesin; i<=pageend; i++){
					html.push('<a class="'+ (i == page ? 'pg-current' : '') +' pg-item" href="javascript:void(0);" data-page="'+i+'">'+i+'</a>');
				};
				if(pageLen == page){
					html.push('<a class="pg-next pg-next-disabled"></a>');
				}else{
					html.push('<a class="pg-next" href="javascript:void(0);" title="最后页" data-page="'+ pageLen +'"></a>');
				}
			}
			$pagination.html(html.join(''));
			$list.html('');
			for(var i=0,len=list.length; i<len; i++){
				self.insertItem(list[i]);
			};
		}
		, 'insertItem': function(obj){
			var html = [];
			html.push('<li class="item-wrap">');
			html.push('<dl class="item clear-fix">');
			html.push('<dt class="pic"><img data-id="'+ obj.num_iid +'" data-attr="pic_url" alt="宝贝图片" src="'+ obj.pic_url +'_50x50.jpg"><span>点击替<br/>换主图</span></dt>');
			html.push('<dt class="pic"><img data-id="'+ obj.num_iid +'" data-attr="backpic_url" alt="背面图" src="'+ obj.backpic_url +'_50x50.jpg"><span>点击替<br/>换背图</span></dt>');
			html.push('<dd class="detail-info">');
			html.push('<div class="title"><a href="http://item.taobao.com/item.htm?id='+ obj.num_iid +'" target="_blank" title="'+ obj.title +'">'+ obj.title +'</a></div>');
			html.push('<div class="price"><a><span class="symbol">原价:</span><b class="'+( obj.price > obj.discount ? 'line' : 'value') +'">'+ obj.price +'</b><span class="symbol">元</span><input type="text" class="yuanjia" value="'+ obj.price +'"></a>');
			html.push('<a><span class="symbol">特价:</span><b class="'+( obj.price > obj.discount ? 'value' : 'line') +'">'+ obj.discount +'</b> <input type="text" class="tejia" value="'+ obj.discount +'"><span class="symbol">元</span></a>');
			html.push('<a><span class="symbol">卖出:</span> <b>'+ obj.sold_quantity +'</b><span class="symbol">笔</span> <input type="text" class="xiaoliang" value="'+ obj.sold_quantity +'"></a>');
			html.push('</div></dd>');
			html.push('<dd class="opts">');
			if($.inArray(obj.num_iid, cacheData.list)>=0){
				html.push('<a data-id="'+ obj.num_iid +'" class="rec-opt J_TRecOpt selected">取消选择</a>');
			}else{
				html.push('<a data-id="'+ obj.num_iid +'" class="rec-opt J_TRecOpt ">选择</a>');
			};
			html.push('<a href="javascript:void(0);" class="save">OK</a><a href="javascript:void(0);" class="cancel">Cancel</a> <a href="javascript:void(0);" class="qiehuan"></a></dd>');
			html.push('</dl></li>');
			var $li = $(html.join(''));
			$li.data('target', obj);
			$list.append($li);
		}
		, getItems: function(options){
			options.sid = _bodySid;
			cacheData.page = options.page;
			$list.append('<div class="wait"><span>加载中…</span></div>');
			if(LAB.test(cacheData.lowPrice, 'decimal')){
				options['lowPrice'] = cacheData.lowPrice;
			};
			if(LAB.test(cacheData.higPrice, 'decimal')){
				options['higPrice'] = cacheData.higPrice;
			};
			if(cacheData.key != ""){
				options['key'] = cacheData.key;
			};
			if(cacheData.cate != -1){
				options['cate'] = cacheData.cate;
			};
			REQ.s({
				url:"/api/shop_goods"
				, escape: false
				, data:options
				, success: function(d){
					d = d.kehuda;
					if(d.status == 0){
						LAB.warn(d.tips);
					}
					if(d.total){
						$totalNum.text(d.total);
						cacheData.total = d.total;
					}else{
						cacheData.total = cacheData.list.length;	
					}
					self.refreshList(d.list);
				}
			});
		}
		, "init": function(){
			$choser = $('<div style="left: '+ parseInt((top.document.body.clientWidth - 800) / 2) +'px; top: '+ parseInt((top.document.body.clientHeight - 560) / 2) +'px; z-index: 10000390; width: 600px; visibility: visible;" class="tb-dialog tb-overlay tb-ext-position"><div class="tb-stdmod-header">宝贝选择</div><div class="tb-stdmod-body"></div><div class="tb-stdmod-footer"></div><a tabindex="0"  role="button" class="tb-ext-close"><span class="tb-ext-close-x">关闭</span></a></div>');
			var $content = $('.tb-stdmod-body', $choser);
			var html = [];
			html.push('<div class="manual-rec-content clearfix">');
			html.push('<div class="items-count J_itemCondition">');
			html.push('<a class="selected J_TGetAllItems" href="javascript:void(0);">全部(<span class="J_TTotalCount">0</span>)</a>');
			html.push('<a class="J_TGetHasItems" href="javascript:void(0);">已选择(<span class="J_TChosedCount">0</span>)</a>');
			html.push('</div>');
			html.push('<div class="item-srch">');
			html.push('<div class="srch-conds clearfix">');
			html.push('<div class="control-group srch-cond">');
			html.push('<label class="control-label hidden" for="">宝贝分类：</label>');
			html.push('<div class="control">');
			html.push('<select name="itemCates" class="input-box J_TItemCates" style="z-index: 1;"><option value="-1">所有分类</option></select>');
			html.push('</div>');
			html.push('</div>');
			html.push('<div class="control-group srch-cond keyword">');
			html.push('<div class="control">');
			html.push('<input class="input-box keyword-input J_TKeywordInput" type="text" name="keyword" placeholder="关键字" autocomplete="off">');
			html.push('</div>');
			html.push('</div>');
			html.push('<div class="control-group srch-cond price">');
			html.push('<label class="control-label" for="">价格</label>');
			html.push('<div class="control">');
			html.push('<input class="input-box low-price-input J_TPriceInput" type="text" name="lowPrice">');
			html.push('<span>-</span>');
			html.push('<input class="input-box high-price-input J_TPriceInput" type="text" name="highPrice">');
			html.push('</div>');
			html.push('</div>');
			html.push('<div class="control-group srch-action">');
			html.push('<a class="btn J_TSrchBtn">筛选</a>');
			html.push('</div>');
			html.push('</div>');
			html.push('</div>');
			html.push('<ul class="items J_TItems"></ul>');
	   	 	//翻页 -->
			html.push('<div class="opt-footer">');
			html.push('<div class="edit-pagination">');
			html.push('<a class="pg-prev pg-prev-disabled"></a>');
			html.push('<a class="pg-current pg-item" href="javascript:void(0);" data-page="1">1</a>');
			html.push('<a class="pg-page pg-item" href="javascript:void(0);" data-page="2">2</a>');
			html.push('<a class="pg-page pg-item" href="javascript:void(0);" data-page="3">3</a>');
			html.push('<a class="pg-page pg-item" href="javascript:void(0);" data-page="4">4</a>');
			html.push('<a class="pg-page pg-item" href="javascript:void(0);" data-page="5">5</a>');
			html.push('<a class="pg-next" href="javascript:void(0);" data-page="2"></a>');
			html.push('</div>');
			html.push('<div class="fright"><a class="btn-ok J_saveItems" href="javascript:void(0);">保存</a>');
			html.push('<a class="btn J_cancelItems">取消</a></div>');
			html.push('</div>');

			//显示编辑前的价格
			var showPromo = function($ele, price, discountPrice, soldCount){
					price = parseFloat(price);
					discountPrice = parseFloat(discountPrice);
					soldCount = parseFloat(soldCount);
					//console.log(price +','+ discountPrice +','+ soldCount);
					var $b = $('b', $ele);
					if(discountPrice >= price || discountPrice == 0){
						LAB.warn('特价不能为0或者大于原价');
						discountPrice = price;
						$b.eq(0).addClass('value');
						$b.eq(1).removeClass('value');
					}else{
						$b.eq(0).removeClass('value');
						$b.eq(1).addClass('value');
					};
					$b.eq(0).text(price);
					$('.yuanjia', $ele).val(price);
					$b.eq(1).text(discountPrice);
					$('.tejia', $ele).val(discountPrice);
					$b.eq(2).text(soldCount);
					$('.xiaoliang', $ele).val(soldCount);
				}
				, saveItem = function(){
					var $parent = $(this).parents(".item-wrap");
					$parent.removeClass('item-edit');
					var obj = $parent.data('target')
						, price = parseFloat($('.yuanjia', $parent).val())
						, discountPrice = parseFloat($('.tejia', $parent).val())
						, soldCount = parseFloat($('.xiaoliang', $parent).val());
					if(discountPrice > price){
						discountPrice = price;
					};
					REQ.s({
						url:'/api/item_edit'
						, escape: false
						, data:{id:obj.num_iid, price:price, discount_price:discountPrice, sold_count:soldCount}
						, success: function(d){
							d = d.kehuda;
							if(d.status == 1){
								showPromo($parent, price, discountPrice, soldCount);
							};
						}
					});
				};
			$choser.on('click', 'a.qiehuan,b', function(e){//切换到编辑状态
				var $parent = $(this).parents(".item-wrap")
					, $b = $('b', $parent);
				$('.yuanjia', $parent).val($b.eq(0).text());
				$('.tejia', $parent).val($b.eq(1).text());
				$('.xiaoliang', $parent).val($b.eq(2).text());
				$parent.addClass('item-edit').siblings('.item-edit').removeClass('item-edit');
			}).on('change', '.tejia,.xiaoliang,.yuanjia', function(e){
				//验证规则
				var $this = $(this)
					, cls = $this.attr('class');
				if($this.val().match(cls == 'xiaoliang' ? /^\d*$/ : /^\d+(\.|\.\d{0,2})?$/g) == null){
					$this.val(parseInt($this.val()));
				};
			}).on('keydown', '.tejia,.xiaoliang,.yuanjia', function(e){
				//回车保存
				var currKey = e.keyCode || e.which || e.charCode;
				if(currKey == "13"){
					saveItem.call(this);
				};
			}).on('click', 'a.save', saveItem).on('click', '.cancel', function(){//取消价格编辑
				var $parent = $(this).parents(".item-wrap");
				$parent.removeClass('item-edit');
				var obj = data.items[$parent.index()];
				showPromo($parent, obj.price, obj.discountPrice, obj.soldCount);
			}).on('click', 'a[data-page]', function(){
				var $this = $(this)
					, page = $this.data('page')
				if(page == cacheData.page){
					return false;
				};
				$this.addClass('pg-current').siblings('.pg-current').removeClass('pg-current');
				if(cacheData.listtype == 'all'){
					self.getItems({page: parseInt(page)});
				}else{
					self.getItems({page: parseInt(page),ids: cacheData.list.join(',')});
				};
			}).on('click', '.tb-ext-close,.J_cancelItems', function(){
				var opt = $choser.data('config');
				$choser.css('display','none');
			}).on('click', '.J_TRecOpt', function(){
				var $this = $(this)
					, id = String($this.data('id'))
					, index = $.inArray(id, cacheData.list);
				if( index < 0){
					cacheData.list.push(id);
					$this.addClass('selected').text('取消选择');
				}else{
					cacheData.list.splice(index, 1);
					$this.removeClass('selected').text('选择');
				};
				$choseNum.text(cacheData.list.length);
			}).on('click','.J_saveItems', function(e){
				var opt = $choser.data('config')
				opt.cb(cacheData.list);
				$choser.hide();
			}).on('click', '.J_TGetAllItems', function(e){
				$(this).addClass('selected').siblings('.selected').removeClass('selected');
				cacheData.listtype = 'all';
				$('.item-srch', $choser).css('display','block');
				self.getItems({page: 1});
			}).on('click', '.J_TGetHasItems', function(e){
				$(this).addClass('selected').siblings('.selected').removeClass('selected');
				cacheData.listtype = 'has';
				$('.item-srch', $choser).css('display','none');
				self.getItems({page: 1, ids: cacheData.list.join(',')});
			}).on('click', '.pic', function(){
				var $img = $(this).find('img');
				top.photoChoser.data('config', {el: $img[0], val: $img[0].src, cb: function(url){
					$img[0].src = url +'_50x50.jpg';
					var postObj = {id:$img.data('id')};
					postObj[$img.data('attr')] = url;
					REQ.s({
						url:'/api/item_edit'
						, escape: false
						, data: postObj
						, success: function(d){}
					});
				}});
				top.photoChoser.show();
			}).on('click', '.J_TSrchBtn', function(){
				cacheData.cate = $('.J_TItemCates', $choser).val()
				cacheData.key = $('.J_TKeywordInput', $choser).val()
				cacheData.lowPrice = $('.low-price-input', $choser).val()
				cacheData.higPrice = $('.high-price-input', $choser).val();
				self.getItems({page: 1,});
			});
			REQ.s({
				url:"/api/shop_category"
				, escape: false
				, data:{'username': _bodyUser, 'ids': ''}
				, success: function(d){
					d = d.kehuda;
					var html = [];
					if(d.status == 1){
						html.push('<option value="-1">所有分类</option>')
						for(var i = 0, len = d.list.length; i<len; i++){
							var children = d.list[i].children
								, leng = children.length;
							if(leng > 0){
								html.push('<optgroup label="'+ d.list[i].name +'">');
								for(var j=0; j<leng; j++){
									html.push('<option value="'+ children[j].id +'">'+  children[j].name +'</option>');
								}
								html.push('</optgroup>');
							}else{
								html.push('<option value="'+ d.list[i].id +'">'+  d.list[i].name +'</option>');
							}
						};
						$('.J_TItemCates', $choser).html(html.join(''));
					}
				}
			})
			$choser.show = function(){
				self.getItems({page: 1});
				var opt = $choser.data('config');
				cacheData.list = opt.val == "" ? [] : opt.val.split(',');
				$('.J_TGetAllItems', $choser).addClass('selected').siblings('.selected').removeClass('selected');
				$('.item-srch', $choser).css('display','block');
				$choseNum.text(cacheData.list.length);
				$choser.css('display','block');
			}
			$content.html(html.join(''));
			$list = $('.J_TItems', $choser);
			$totalNum = $('.J_TTotalCount', $choser);
			$choseNum = $('.J_TChosedCount', $choser);
			$pagination = $('.edit-pagination', $choser);
			LAB.moveDrop.call($choser, '.tb-stdmod-header');
			$('body').append($choser.css('display','none'));
			window.itemChoser = $choser;
		}
	};
	return self;
}, ["common/require", 'zx/lab']);
Fengs.add('zx/control/chose-category', function(S, $, REQ, LAB){
	var $ = jQuery
		, cacheData = null
		, $choser
		, _bodyUser = $(top.document.body).data('user');
	_bodyUser = !_bodyUser ? 'yun@sdd.com' : _bodyUser;
	var self = {
		wrap: null
		, "getData": function(){
			REQ.s({
				url:"/api/shop_category"
				, escape: false
				, data:{'username': _bodyUser, 'ids': ''}
				, success: function(d){
					d = d.kehuda;
					if(d.status == 0){
						return LAB.warn(d.tips);
					}else{
						cacheData = d.list;
						self.refreshList();
					}
				}
			});
		}
		, "refreshList": function(){
			var html = ['<ul class="cat-list J_catList">'];
			var list = cacheData;
			var ids = $choser.data('config').val;
			ids = ids && ids !== '' ? ids.split(',') : [];
			for(var i = 0,len=list.length; i<len; i++){
				var children = list[i].children
					, leng = children.length;
				if(leng > 0){
					html.push('<ul class="cat-list J_catList">');
					html.push('<li class="cat fst-cat"><i class="cat-icon collapse"></i><input data-id="'+ list[i].id +'" '+ ($.inArray(list[i].id, ids) >= 0 ? 'checked' : '') +' class="J_TFstCat" type="checkbox" /><label>'+ list[i].name +'</label>');
					html.push('<ul class="fst-cat-bd">');
					for(var j = 0; j<leng; j++){
						html.push('<li class="cat snd-cat"><input data-id="'+ children[j].id +'" '+ ($.inArray(children[j].id, ids) >= 0 ? 'checked' : '') +' class="J_TSndCat" type="checkbox" /><label>'+ children[j].name +'</label></li>');
					};
					html.push('</ul>');
					html.push('</li></ul>')
				}else{
					html.push('<li class="cat fst-cat"><input data-id="'+ list[i].id +'" '+ ($.inArray(list[i].id, ids) >= 0 ? 'checked' : '') +' class="J_TSndCat" type="checkbox"><label>'+ list[i].name +'</label></li>');
				};
			};
			html.push('</ul>');
			self.wrap.html(html.join(''));
		}
		, "init": function(){
			$choser = $('<div style="left: '+ parseInt((document.body.clientWidth - 400) / 2) +'px; top: '+ parseInt((document.body.clientHeight - 500) / 2) +'px; z-index: 10000390; width: 400px; visibility: visible;" class="tb-dialog tb-overlay tb-ext-position"><div class="tb-stdmod-header">宝贝</div><div class="tb-stdmod-body"></div><div class="tb-stdmod-footer"></div><a tabindex="0"  role="button" class="tb-ext-close"><span class="tb-ext-close-x">关闭</span></a></div>');
			var $content = $('.tb-stdmod-body', $choser);
			//$content.html('<div class="J_DialogBody"><p class="nav-head desc">请要添加的类目</p><div id="tree-content"><ul class="cat-list J_catList"><li class="cat fst-cat"><i class="cat-icon collapse J_TAcrdTrigger "></i><input data-id="951963058" class="J_TFstCat" type="checkbox" /><label>胎压监测仪</label><ul class="fst-cat-bd"><li class="cat snd-cat"><input data-id="951963059" class="J_TSndCat" type="checkbox" /><label>careud凯佑</label></li><li class="cat snd-cat"><input data-id="977755086" class="J_TSndCat" type="checkbox" /><label>U901</label></li><li class="cat snd-cat"><input data-id="977755087" class="J_TSndCat" type="checkbox" /><label>U902</label></li><li class="cat snd-cat"><input data-id="977755088" class="J_TSndCat" type="checkbox" /><label>U903</label></li><li class="cat snd-cat"><input data-id="984424536" class="J_TSndCat" type="checkbox" /><label>U800</label></li><li class="cat snd-cat"><input data-id="984424537" class="J_TSndCat" type="checkbox" /><label>配件</label></li></ul></li></ul></div><div class="opt-footer"><a class="btn-ok" href="">保存</a><a class="btn-cancel">取消</a></div></div>')
			$content.html('<div class="J_DialogBody"><p class="nav-head desc">请要添加的类目</p><div id="tree-content"></div><div class="opt-footer"><a class="btn-ok">保存</a><a class="btn-cancel">取消</a></div></div>');
			LAB.moveDrop.call($choser, '.tb-stdmod-header');
			$choser.on('click', '.tb-ext-close,.btn-cancel', function(){
				$choser.css('display','none');
			}).on('click', '.btn-ok', function(e){
				var ids = []
					, opt = $choser.data('config');
				$('input', self.wrap).each(function(){
					if(this.checked){
						ids.push($(this).data('id'));
					}
				});
				opt.cb(ids);
				$choser.hide();
			}).on('click', 'i.cat-icon', function(e){
				var $this =  $(this);
				if($this.hasClass('collapse')){
					$this.removeClass('collapse').siblings('ul').stop().slideUp();
				}else{
					$this.addClass('collapse').siblings('ul').stop().slideDown();
				};
			}).on('click', '.J_TFstCat', function(){
				var $this = $(this);
				var isck = this.checked;
				$('input', $this.siblings('ul')).each(function(){
					this.checked = isck;
				});
			}).on('click', '.J_TSndCat', function(){
				var isck = 0
					, $ul = $(this).parents('.fst-cat-bd')
					, $items = $('input', $ul)
					, leng = $items.length;
				$items.each(function(){
					if(!this.checked){
						isck++;
					}
				});
				$ul.siblings('input')[0].checked = isck == 0 ? true : false;
			})
			self.wrap = $('#tree-content', $choser);
			$choser.show = function(){
				$choser.css('display','block');
				if(cacheData == null){
					self.getData();
				}else{
					self.refreshList();
				};
			}
			$('body').append($choser.css('display','none'));
			window.categoryChoser = $choser;
		}
	};
	return self;
}, ["common/require", 'zx/lab']);
Fengs.add('zx/control/chose-file', function(S, $, LAB){
	var $choser
	, _bodyUser = $(top.document.body).data('user')
	, isTry = (_bodyUser && _bodyUser.match(/^[a-z0-9]$/i) === null ? false : true);
	var self = {
		"request": function(imgData, success){
			var cateid = $choser.data('config').category_id;
			return LAB.uploadImg(0, cateid, imgData, success);
			//function(picture_id, category_id, imgdata, callback){
		}
		, "init": function(){
			$choser = $('<div style="left: '+ parseInt((document.body.clientWidth - 360) / 2) +'px; top: '+ parseInt((document.body.clientHeight - 130) / 2) +'px; z-index: 10000401; width: 420px; visibility: visible; display: none;" class="tb-dialog tb-overlay tb-ext-position"><div class="tb-stdmod-header">上传图片</div><div class="tb-stdmod-body"></div><div class="tb-stdmod-footer"></div><a tabindex="0"  role="button" class="tb-ext-close"><span class="tb-ext-close-x">关闭</span></a></div>');
			var $content = $('.tb-stdmod-body', $choser);
			var html = [];
			html.push('<div class="editPanel file_panel">');
			html.push('<div class="form"><div class="path_input"><input class="input-box" type="text" id="url" placeholder="请输入图片URL或本地图片"/></div>');
			html.push('<div class="up_btn"></div><input type="file" id="file" class="btn"/></div>');
			html.push('<div class="opt-footer">')
			html.push('<a class="btn-ok">立即上传</a>');
			html.push('</div>');

			html.push('</div>');
			$content.html(html.join(''));
			LAB.moveDrop.call($choser, '.tb-stdmod-header');
			var $url = $("#url",$choser)
				, $file = $("#file", $choser)
				, _file = $file[0];
			$file.on('change', function(){
				$url.val(_file.files[0].name);
			});
			$choser.on('click', '.tb-ext-close', function(){
				var opt = $choser.data('config');
				$choser.css('display','none');
			}).on('click', '.up_btn', function(){
				$file.trigger('click');
			}).on('click', '.btn-ok', function(){
				//上传到淘宝
				var url = $url.val()
					, filename = url.match(/^http:\/\//ig) !== null ? url : 0;
				//读取本地文件
				var success = function(url, id){
					var opt = $choser.data('config');
					opt.callback && opt.callback(url, id);
					$url.val('');
					_file["files"].length = 0;
					$choser.hide();
				};
				if(filename == 0){
					if(isTry){
						return LAB.warn('请注册登录');
					}
					if(_file["files"] && _file["files"].length > 0){
						var reader = new FileReader();
						reader.onload =function(e){
							filename = e.target.result;
							filename = filename.replace(/data:image\/(png|jpeg|gif|jpg);base64,/ig,'');
							self.request(filename, success);
						};
						reader.readAsDataURL(_file.files[0]);
						return;
					}else{
						return LAB.warn("请输入/要上传的图片");//请输入/要上传的图片
					};
				}else{
					self.request(filename, success);
				};
			});


			$('body').append($choser);
			window.fileChoser = $choser;
			//定义淘宝空间图片ID
			var picture_category_id = null;
			/*请求图片空间
			{"picture_category_get_response":{"picture_categories":{"picture_category":[{"created":"2012-03-19 08:59:54","modified":"2012-03-19 08:59:54","parent_id":0,"picture_category_id":17955117502076494,"picture_category_name":"宝贝图片","position":0,"type":"auction"},{"created":"2012-03-20 10:03:56","modified":"2012-03-20 10:03:56","parent_id":0,"picture_category_id":17955117540848035,"picture_category_name":"宝贝描述图","position":0,"type":"user-define"},{"created":"2012-03-20 10:03:43","modified":"2012-03-20 10:03:43","parent_id":0,"picture_category_id":17955116512431870,"picture_category_name":"广告展示图","position":0,"type":"user-define"},{"created":"2012-03-19 08:59:54","modified":"2012-03-19 08:59:54","parent_id":0,"picture_category_id":17955117502076492,"picture_category_name":"店铺装修","position":0,"type":"fixed"}]}}}
			*/
			
		}
	};
	return self;
}, ['zx/lab']);
Fengs.add('zx/control/chose-photo', function(S, $, LAB, COVER){
	var currentFolder = null
		, cacheData = null
		, $choser
		, _bodyUser = $(top.document.body).data('user')
		, isTry = (_bodyUser && _bodyUser.match(/^[a-z0-9]$/i) === null ? false : true);
	var self = {
		"request": LAB.request
		, "wrap": null
		, "nav": null
		, "addBtn": null
		, "refreshList": function(obj){
			self.wrap.html('');
			var folders = obj.folders;
			currentId = obj.id;
			if(folders){
				self.addBtn.css('visibility','visible');
				self.nav.html('<b>全部图片</b>');
				for(var i=0,leng = folders.length; i<leng; i++){
					self.insertItem(folders[i]);
				};
			}else{
				self.addBtn.css('visibility','collapse');
				self.nav.html('<a class="home">全部图片</a><span>&gt;</span><b>'+ obj.name +'</b>');
			}
			var list = obj.pictures
				, len = list.length;
			if(len == 0){
				self.wrap.addClass('noimg');
				//LAB.warn('此文件夹下无图片，请上传')
			}else{
				self.wrap.removeClass('noimg');
				for(var i=0; i<len; i++){
					self.insertItem(list[i]);
				};
			}
		}
		, "getPicture": function(obj){
			currentFolder = obj;
			/*{"picture_get_response":{"pictures":{"picture":[{"client_type":"client:computer","deleted":"undeleted","created":"2015-06-24 16:39:37","modified":"2015-06-24 16:39:37","md5":"","title":"9j4RQ.jpg","picture_category_id":179551105895329108,"picture_id":179550105947684639,"picture_path":"http://img03.taobaocdn.com/imgextra/i3/224607955/TB2Egu2dpXXXXX.XXXXXXXXXXXX_!!224607955.jpg","pixel":"156x252","referenced":false,"sizes":9440,"status":"normal"}]},"totalResults":12}}*/
			//{"picture_get_response":{"pictures":{},"totalResults":0}}
			if(!obj.pictures){
				self.request({
					'method':'taobao.picture.get'
					, 'picture_category_id': obj.id
				}, function(data){
					obj.pictures = data.picture_get_response.pictures.picture ? data.picture_get_response.pictures.picture : [];
					self.refreshList(obj);
				});
			}else{
				self.refreshList(obj);
			};
		}
		, "insertItem": function(obj){
			var html = [];
			var opt = $choser.data('config');
			var title
				, path
				, id;
			if(obj.title){
				title = obj.title;
				path = obj.picture_path;
				html.push('<li class="img '+ (opt && opt.val == path ? 'selected' : '') +'">');
				html.push('<div class="thumb-large thumb-img" title="'+ title +'" style="background-image: url('+ path +'_90x90.jpg);">');
				html.push('<span class="item-tag">'+ (opt && opt.val == path ? '已选择' : '点击选择图片') +'</span>')
				html.push('<a class="item-chk">&nbsp;</a>');
			}else{
				title = obj.name;
				path = '';
				html.push('<li class="dir">');
				html.push('<div class="thumb-large thumb-dir" title="'+ title +'">');
			};
			html.push('</div>');
			html.push('<div class="file-name">'+ title +'</div>');
			html.push('</li>');
			var $element = $(html.join(''));
			$element.data('target', obj);
			if(!obj.title){
				return self.wrap.prepend($element);
			};
			var child = self.wrap.find('li.img:first');
			if(child.length > 0){
				child.before($element);
			}else{
				self.wrap.append($element);
			};
		}
		, "init": function(){
			$choser = $('<div style="left: '+ parseInt((document.body.clientWidth - 700) / 2) +'px; top: '+ parseInt((document.body.clientHeight - 580) / 2) +'px; z-index: 10000390; width: 700px; visibility: visible; display: none;" class="tb-dialog tb-overlay tb-ext-position"><div class="tb-stdmod-header">图片</div><div class="tb-stdmod-body"></div><div class="tb-stdmod-footer"></div><a tabindex="0"  role="button" class="tb-ext-close"><span class="tb-ext-close-x">关闭</span></a></div>');
			var $content = $('.tb-stdmod-body', $choser);
			var html = [];
			html.push('<div class="editPanel image_panel"><div class="item-srch">');
			html.push('<div class="fleft">目录</div>');
			html.push('<div class="fright">');
			html.push('<a class="btn folder-btn">新建文件夹</a>');
			html.push('<a class="btn upload-btn">上传新图片</a>');
			html.push('</div>');
			html.push('</div>');
			html.push('<ul></ul></div>');
			$content.html(html.join(''));
			LAB.moveDrop.call($choser, '.tb-stdmod-header');
			self.wrap = $('ul', $choser);
			self.nav = $('.fleft', $choser);
			self.addBtn = $('.folder-btn', $choser);
			self.addBtn.click(function(){
				LAB.prompt('新建图片文件夹', '文件夹名', 'new folder', function(folderName){
					if(isTry){
						return LAB.warn('请下载客户端');
					};
					/*{"picture_category_add_response":{"picture_category":{"created":"2015-06-25 09:39:02","modified":"2015-06-25 09:39:02","parent_id":179551105895329108,"picture_category_id":179551106060008629,"picture_category_name":"new folder","position":1,"total":0,"type":"user-define"}}}*/
					/*{"error_response":{"code":533,"msg":"Remote service error","sub_code":"isv.pictureServiceClient-service-error:picture category add failed","request_id":"16c75rlt6psly"}}*/
					self.request({
						'method': 'taobao.picture.category.add'
						, 'picture_category_name': folderName
						, 'parent_id': cacheData.id
						, 'type': 'user-define'
					}, function(d){
						if(d.error_response){
							return LAB.warn('添加失败，请检查名称是否重复');
						};
						d = d.picture_category_add_response.picture_category;
						var obj = {
							id: d.picture_category_id
							, name: d.picture_category_name
						};
						cacheData.folders.push(obj);
						self.insertItem(obj);
					});
				});
			});
			$choser.on('click', '.tb-ext-close', function(){
				var opt = $choser.data('config');
				opt.el.innerHTML = '选中了';
				$choser.css('display','none');
			}).on('click', '.upload-btn', function(){
				if(!window.FileReader){
					return COVER.html5();
				};
				top.fileChoser.data('config', {'category_id': currentFolder.id, callback: function(obj){
					currentFolder.pictures.push(obj);
					self.insertItem(obj);
				}});
				top.fileChoser.show();
			}).on('click', '.thumb-dir', function(){
				var categoryObj = $(this).parents('li').data('target');
				var folders = cacheData.folders;
				for(var i=0,leng = folders.length; i<leng; i++){
					if(folders[i].id == categoryObj.id){
						self.getPicture(folders[i]);
					};
				};
			}).on('click', '.thumb-img', function(){
				var opt = $choser.data('config');
				var imgObj = $(this).parents('li').data('target');
				opt.cb(typeof imgObj.picture_path === 'string' ? imgObj.picture_path.replace(/\\\//g, '/') : '');
				$choser.css('display', 'none');
			}).on('click', '.item-chk', function(e){
				if(isTry){
					LAB.warn('请注册登录');
					return false;
				}
				var $this = $(this)
					, $parent = $this.parents('li')
					, obj = $parent.data('target')
					, type = $parent.attr('class');
				/*if(type == 'dir'){
					self.request({
						'method': 'taobao.picture.delete'
						, 'file_ids': String(obj.id)
					}, function(d){
						if(d.error_response){
							return false;
						}else{
							$this.text(newName);
						}
					});
				}else{*/
					self.request({
						'method': 'taobao.picture.delete'
						, 'picture_ids': String(obj.picture_id)
					}, function(d){
						if(d.error_response){
							return false;
						}else{
							$parent.remove();
							currentFolder.pictures.splice($.inArray(obj, currentFolder), 1);
						};
					});
				/*};*/
				return false;
			}).on('click', '.file-name', function(){
				var $this = $(this)
					, $parent = $this.parents('li')
					, obj = $parent.data('target')
					, type = $parent.attr('class')
					, oldName = $this.text()
					, label = type == 'dir' ? '文件夹名' : '图片名称';
				LAB.prompt('修改'+ label, label, oldName, function(newName){
					if(newName == oldName){
						return;
					};
					if(type == 'dir'){
						self.request({
							'method': 'taobao.picture.category.update'
							, 'category_id': obj.id
							, 'category_name': newName
						}, function(d){
							if(d.error_response){
								return LAB.warn('已经存在同名文件夹');
							}else{
								$this.text(newName);
							}
						});
					}else{
						self.request({
							'method': 'taobao.picture.update'
							, 'picture_id': obj.picture_id
							, 'new_name': newName
						}, function(d){
							if(d.error_response){
								return LAB.warn('已经存在同名文件夹');
							}else{
								$this.text(newName);
							};
						});
					};
				});
			}).on('click', 'a.home', function(){
				self.getPicture(cacheData);
			});
			$('body').append($choser);
			top.photoChoser = $choser;
			$choser.show = function(){
				$choser.css('display','block');
				if(cacheData == null){
					cacheData = {
						id: null
						, name: '全部图片'
						, folders: []
					};
					self.request({
						'method': 'taobao.picture.category.get'
					}, function(data){
						if(!data.picture_category_get_response){
							return LAB.warn('获取图片空间数据失败');//获取图片空间数据失败
						}
						var list = data.picture_category_get_response.picture_categories.picture_category;
						for(var i = 0, len = list.length; i<len; i++){
							if(list[i].parent_id == 0 && list[i].picture_category_name == '客户达装修图'){
								cacheData.id = list[i].picture_category_id;
								break;
							};
						};
						if(cacheData.id == null){
							/*{"picture_category_add_response":{"picture_category":{"created":"2015-06-24 11:34:59","modified":"2015-06-24 11:34:59","parent_id":0,"picture_category_id":179551105895329108,"picture_category_name":"客户达装修图","position":1,"total":0,"type":"user-define"}}}*/
							self.request({
								'method': 'taobao.picture.category.add'
								, 'picture_category_name': '客户达装修图'
								, 'type': 'user-define'//分类类型,fixed代表店铺装修分类类别，auction代表宝贝分类类别，user-define代表用户自定义分类类别
							}, function(d){
								cacheData.id = d.picture_category_add_response.picture_category.picture_category_id;
								self.getPicture(cacheData);
							});
						}else{
							for(var i = 0, len = list.length; i<len; i++){
								if(list[i].parent_id == cacheData.id){
									cacheData.folders.push({
										id: list[i].picture_category_id
										, name: list[i].picture_category_name
									});
								};
							};
							self.getPicture(cacheData);
						}
					});
				}else{
					self.getPicture(currentFolder);
				};
			}
			//定义淘宝空间图片ID
			/*请求图片空间
			{"picture_category_get_response":{"picture_categories":{"picture_category":[{"created":"2012-03-19 08:59:54","modified":"2012-03-19 08:59:54","parent_id":0,"picture_category_id":17955117502076494,"picture_category_name":"宝贝图片","position":0,"type":"auction"},{"created":"2012-03-20 10:03:56","modified":"2012-03-20 10:03:56","parent_id":0,"picture_category_id":17955117540848035,"picture_category_name":"宝贝描述图","position":0,"type":"user-define"},{"created":"2012-03-20 10:03:43","modified":"2012-03-20 10:03:43","parent_id":0,"picture_category_id":17955116512431870,"picture_category_name":"广告展示图","position":0,"type":"user-define"},{"created":"2012-03-19 08:59:54","modified":"2012-03-19 08:59:54","parent_id":0,"picture_category_id":17955117502076492,"picture_category_name":"店铺装修","position":0,"type":"fixed"}]}}}
			*/
			if(isTry){
				cacheData = {
					id: 0
					, name: '全部图片'
					, folders: [
						{
							'id': '1'
							, 'name': '轮播大图'
							, pictures: [
								{"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB11B6zHFXXXXcRXpXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1ITnBHFXXXXbOXpXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1I6deHFXXXXcxXVXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1LFpgHFXXXXalXVXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1v0FmHFXXXXbOXXXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1YYxmHFXXXXb0XXXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1eu1tHFXXXXb4XFXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1ZI1wHFXXXXXVXFXXSutbFXXX.jpg"}
								, {"title": "1920x600", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1UaCBHFXXXXcTXpXXSutbFXXX.jpg"}
								, {"title": "1920x550", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1n8etHFXXXXc9XFXXSutbFXXX.jpg"}
								, {"title": "1920x550", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1aF9FHFXXXXbkXpXXSutbFXXX.jpg"}
								, {"title": "1920x550", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1tGCCHFXXXXXNXFXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1p6L3GFXXXXXLXVXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1j8n4GFXXXXbUXFXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1NvT3GFXXXXasXVXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1prMSGXXXXXcuXpXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1cdUUGXXXXXatXpXXSutbFXXX.jpg"}
								, {"title": "1920x500", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB14dkWGXXXXXckXXXXSutbFXXX.jpg"}
								, {"title": "1920x455", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1O9n2GFXXXXarXpXXSutbFXXX.jpg"}
								, {"title": "1920x455", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1_6_5GFXXXXXJXXXXSutbFXXX.jpg"}
							]
						}
						, {
							'id': '2'
							, 'name': '产品图片'
							, pictures: [
								{"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1NOqEHFXXXXcfXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1TQeCHFXXXXcRXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1ILOJHFXXXXaPXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1mRyCHFXXXXcqXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1GDGxHFXXXXbNXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1K9aAHFXXXXayXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1WPiCHFXXXXXwXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1suaBHFXXXXXZXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1.pqDHFXXXXXlXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1qnCJHFXXXXaLXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1NOqEHFXXXXcfXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1TQeCHFXXXXcRXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1ILOJHFXXXXaPXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1mRyCHFXXXXcqXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1GDGxHFXXXXbNXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1K9aAHFXXXXayXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1WPiCHFXXXXXwXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1suaBHFXXXXXZXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1.pqDHFXXXXXlXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1qnCJHFXXXXaLXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1yg0tHFXXXXblXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1N3xxHFXXXXXHXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1MRNxHFXXXXXkXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1xx8lHFXXXXXSapXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1krBAHFXXXXXFXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1yhpuHFXXXXXYXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1qjltHFXXXXbeXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1oVpvHFXXXXXcXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1xwlxHFXXXXalXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1ooFzHFXXXXaCXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1yg0tHFXXXXblXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1N3xxHFXXXXXHXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1MRNxHFXXXXXkXpXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1xx8lHFXXXXXSapXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1krBAHFXXXXXFXXXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1yhpuHFXXXXXYXFXXSutbFXXX.jpg"}
								, {"title": "产品图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1qjltHFXXXXbeXFXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1VE9EHFXXXXaYXpXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB15FCtHFXXXXXvXVXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1CwKvHFXXXXb7XFXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB19x5wHFXXXXbFXFXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1PwusHFXXXXXGXVXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1FS1tHFXXXXc8XFXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB14SuyHFXXXXaHXFXXSutbFXXX.jpg"}
								, {"title": "休闲男装", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1T4qyHFXXXXbfXFXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1SiOTGFXXXXXpaXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1PUW3GFXXXXbPXXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1SiOTGFXXXXXpaXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1PUW3GFXXXXbPXXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1HFSTGFXXXXaOaXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1M5aVGFXXXXXMXVXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1oCmYGFXXXXXpXFXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1TeG0GFXXXXaDXpXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1Vd9ZGFXXXXb_XpXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB15AyWGFXXXXbYXFXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1EeGTGFXXXXaraXXXSutbFXXX.jpg"}
								, {"title": "电子产品", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1GqUnGFXXXXcjXpXXSutbFXXX.jpg"}
							]
						}
					]
					, pictures: [
						{"title": "热卖专区", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB159ajHFXXXXX6apXXSutbFXXX.jpg"}
						, {"title": "新品专区", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB11lSpHFXXXXbGXVXXSutbFXXX.jpg"}
						, {"title": "收藏本店", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1CGeIHFXXXXcBXXXXSutbFXXX.jpg"}
						, {"title": "头部背景", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1UBXpHFXXXXcaXXXXSutbFXXX.jpg"}
						, {"title": "广告图", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1vf67GFXXXXaUXpXXwu0bFXXX.png"}
						, {"title": "广告图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB12Ej3GFXXXXcWXFXXwu0bFXXX.png"}
						, {"title": "广告图", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1N0f7GFXXXXboXpXXwu0bFXXX.png"}
						, {"title": "广告图", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB145Y_GFXXXXXGXXXXwu0bFXXX.png"}
						, {"title": "头部背景", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1ahI0GXXXXXbcXVXXSutbFXXX.jpg"}
						, {"title": "收藏", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1xoqSGFXXXXataXXXtKXbFXXX.gif"}
						, {"title": "收藏", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1ULwUGXXXXXbYXXXXSutbFXXX.jpg"}
						, {"title": "1v8kRG", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1v8kRGXXXXXbzXpXXSutbFXXX.jpg"}
						, {"title": "1kQITG", "picture_path":"http://img01.taobaocdn.com/imgextra/i2/TB1kQITGXXXXXcTXXXXSutbFXXX.jpg"}
						, {"title": "新口上市", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB18IAWGXXXXXXUXXXXSutbFXXX.jpg"}
						, {"title": "客服", "picture_path":"http://img01.taobaocdn.com/imgextra/i3/TB1u.oxGXXXXXaGXpXXSutbFXXX.jpg"}
						, {"title": "客服", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/770458061/TB2VAnCXVXXXXa4XXXXXXXXXXXX-770458061.jpg"}
						, {"title": "客服", "picture_path":"http://img03.taobaocdn.com/imgextra/i3/770458061/TB2BtrDXVXXXXXWXXXXXXXXXXXX-770458061.jpg"}
						, {"title": "促销海报", "picture_path":"http://img01.taobaocdn.com/imgextra/i4/TB1RJL6GFXXXXaRXFXXSutbFXXX.jpg"}
						, {"title": "促销海报", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1JFr.GFXXXXXEXXXXSutbFXXX.jpg"}
						, {"title": "950x350", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1J9FkGpXXXXa2aXXXSutbFXXX.jpg"}
						, {"title": "950x350", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1pXHBGpXXXXaVaXXXSutbFXXX.jpg"}
						, {"title": "促销海报", "picture_path":"http://img01.taobaocdn.com/imgextra/i1/TB1zekIGXXXXXbuaXXXwu0bFXXX.png"}
					]
				};
				return self.getPicture(cacheData);
			};
		}
	};
	return self;
}, ['zx/lab','zx/ui/cover']);
Fengs.add('zx/control/base', function(S, $, Colpick, PICTURE, LINKS, WANG, NUMUPDOWN, SELECTOR, UPLOAD, choseFile, choseCategory, choseItem, chosePhoto){
	if(window == window.top){
		if(!top.fileChoser){
			choseFile.init();
		};
		if(!top.categoryChoser){
			choseCategory.init();
		};
		if(!top.itemChoser){
			choseItem.init();
		};
		if(!top.photoChoser){
			chosePhoto.init();
		};
	};
	return function($wrap){
		$wrap = !$wrap ? $('body') : $wrap;
		//颜色选择器
		$("input[ui-type='color']", $wrap).each(function(){
			var $this = $(this);
			var val = $this.val();
			if(val.match(/^\#[0-9a-f]{3}$/ig) !== null){
				val = val.replace(/[0-9a-f]/ig, function(a){return a + a;})
			};
			//$(this).width(80).jPicker();
			//$this.css('background-color', val);
			$this.width(80).colpick({
				layout:'rgbhex',
				color: val
			});
		});
		//数字选择
		$("input[ui-type='number']", $wrap).each(function(){
			var $this = $(this)
				, $number = new NUMUPDOWN(1);
			$number.init($this);
		});
		//图片上传组件
		$("input[ui-type='upload']", $wrap).each(function(){
			var $this = $(this)
				, $upload = new UPLOAD(1);
			$upload.init($this, function(imgurl, id){
				$this.val(imgurl).trigger('change');
			});
		});
		//图片组设置
		$("textarea[ui-type='photos']", $wrap).each(function(){
			var $this = $(this);
			var picture = new PICTURE();
			picture.init($(this));
		});
		//文字链接组
		$("textarea[ui-type='link']", $wrap).each(function(){
			var $this = $(this);
			var links = new LINKS();
			links.init($(this));
		});
		//旺旺客服组
		$("textarea[ui-type='wangwang']", $wrap).each(function(){
			var $this = $(this);
			var wang = new WANG();
			wang.init($(this));
		});
		//宝贝选择
		$("textarea[ui-type='itemForm']", $wrap).each(function(){
			var $this = $(this);
			var $selector = new SELECTOR();
			$selector.init($(this));
		});
		//宝贝展示方式
		$("[control-ui='imageBox']", $wrap).each(function(){
			var $this = $(this)
				, $wrap = $('<div class="control-showbox"></div>');
			$wrap.html($this.html());
			$this.html('').addClass("control-wrap").append($wrap);
			$("label", $wrap).each(function(){
				var $div = $('<div></div>')
					, $this = $(this);
				$div.text($this.text());
				$this.on("click", function(){
					$this.parents('.control-showbox').find(".cur").removeClass("cur");
					$this.addClass("cur");
				}).after($div).append("<em></em>").append('<img src="'+ $('input', $this).data('img') +'"/>');
			});
			$this.find("input[checked]").parent().addClass("cur");
		});
	};
}, ["./colpick", "./picture", "./links", "./wangwang", "./numberupdown", "./selector", "./upload","./chose-file", "./chose-category", "./chose-item", "./chose-photo"]);