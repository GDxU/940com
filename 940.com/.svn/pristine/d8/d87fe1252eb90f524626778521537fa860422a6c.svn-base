Fengs.add('kehuda/utils', function(S, $){
	var ui = {
		record:function(options){
			var o = $.extend({
				prefix:"kehuda_",
				key:[]
			},options);
			var obj = new Object(),_c;
			for(var i=0,list=o.key; i < list.length; i++){
				obj[list[i]] = {
					key:list[i],
					list:new Array(),//历史记录列表
					target:null,//关连下拉控件
					del:function(str){//删除一个记录
						this.list.splice($.inArray(str,this.list),1);
						this.update();
					},
					add:function(str){//添加一个记录
						//如果不存在于记录中
						var i = $.inArray(str,this.list);
						if(i >= 0){
							this.list.splice(i,1);
						};
						this.list.unshift(str);
						this.update();
					},
					update:function(){
						if(this.list.length > 10){
							this.list.length = 10;
						};
						$.cookie(o.prefix + this.key,this.list.join(","),{path:"/",expires:365});
						//更新控件显示
						if(this.target != null){
							this.target.upmenu();
						}
					}
				};
				_c = $.cookie(o.prefix + o.key[i]);
				if(_c != null && _c != ""){
					obj[o.key[i]].list = _c.split(",");
				};
			};
			return obj;
		},
		dropArr:new Array(),
		drop:function(element,record){
			var array = [];
			element.each(function(){
				var $ele = $(this)
					, isOpen = false,//是否展开
					btn = $ele.find("em"),//下拉按钮
					input = $ele.find("input"),//输入文本框
					menu = $ele.find(".drop_menu")//展开菜单
					, dropItem = function(text,bind){
						var $a = $("<a href='javascript:void(0);'><span>"+ text +"</span><b title='删除'></b></a>");
						//选中历史记录
						$a.click(function(){
							$ele.val(text);
						}).find("b").click(function(e){
							record[bind].del(text);
							e.stopPropagation();
						});
						menu.append($a);

					};
				$ele.open = function(){
					menu.css({display:"block"});
					isOpen = true;
				};
				$ele.close = function(){
					menu.css({display:"none"});
					isOpen = false;
				};
				$ele.input = input;
				$ele.value = input.val() != input.attr("placeholder") ? input.val() : "";
				//历史记录列表
				$ele.upmenu = function(){
					var bind = $ele.attr("bind");
					if(bind && bind != "" && record[bind]){
						menu.html("");
						//try{
							record[bind].target = $ele;
							for(var i=0,len=record[bind].list.length; i < len; i++){
								dropItem(record[bind].list[i],bind);
							};
						//}catch(e){};
					}else{
						/*var a = menu.find("a");
						for(var i=0,len = a.length;i<len;i++){
							a[i].on("click",function(){
								$ele.value = this.attr("rel");
								input.value = this.innerText;
							});
						};*/
						$("a", menu).click(function(){
							$ele.value = $(this).attr("rel");
							input.val($(this).text());
						})
						if(!input.attr("readonly") == false){
							input.css("cursor","pointer").click(function(e){
								$ele.toggle();
								//$.stopPropagation(e);
								e.stopPropagation();
							});
						};
					};
				};
				$ele.toggle = function(){
					if(isOpen == false){
						$ele.open();
						for(var i=0,list=ui.dropArr; i<list.length; i++){
							if(list[i] != $ele){
								list[i].close();
							};
						};
					}else{
						$ele.close();
					};
				};
				$ele.upmenu();
				$ele.val = function(value, undefined){
				
					if(value === undefined){
						return $ele.value;
					}
					$ele.value = value;
					input.val(value);
				};
				btn.on("click",function(e){
					$ele.toggle();
					e.stopPropagation();
				});
				$(document).click(function(){
					$ele.close();
				});
				var mouseUp = function(e){
						return false;
					}
					, eventBlur = function(){
						$ele.value = input.val() != input.attr("placeholder") ? input.val() : "";
						$(this).bind({'focus': eventFocus}).unbind({'blur': eventBlur});
					}
					, eventFocus = function(e){
						this.focused=true;
						this.select();
						$(this).bind({'blur': eventBlur}).unbind({'focus': eventFocus}).one('mouseup', mouseUp);
					};
				input.bind({
					"change":function(){
						$ele.value = input.val() != input.attr("placeholder") ? input.val() : "";
					}
					, "focus": eventFocus
					, "keyup":function(){
						$ele.value = input.val() != input.attr("placeholder") ? input.val() : "";
					}
				});
				ui.dropArr.push($ele);
			});
			return ui.dropArr;
		}
		,filterSpecChr:function(str){
			return str.replace(/\)/g, "）").replace(/\(/g, "（").replace(/\{/g, "｛").replace(/\}/g, "｝").replace(/\\/g, "＼").replace(/\</g, "＜").replace(/\>/g, "＞").replace(/\'/g, "＇").replace(/\!/g, "！").replace(/\~/g, "～").replace(/\ /g, "　");
		}
		/*o = {
			wrap:
			, href:
			, type: 'baidu|taobao'
		}*/
		,share:function(o){
			//分享和收藏
			var agent = navigator.userAgent.toLowerCase();
			if(agent.indexOf("android")>-1||agent.indexOf("iphone")>-1||agent.indexOf("iemobile")>-1){
				o.wrap.html('<p><a class="share" href="javascript:void(0);" target="_new">分享</a></p>')
			}else{
				o.wrap.html('<p><a class="share" href="javascript:void(0);" target="_new" title="分享到QQ空间">分享</a><a class="collect" href="javascript:void(0);" title="添加到收藏夹">收藏</a><a class="piliang" href="http://d.sududa.com/kehuda/piliang.rar" target="_new" title="批量查询">批量</a></p>');
				var tm;
				$(".collect",o.wrap).click(function(){
					var sURL = window.location.href,
						sTitle = document.title;
					try {
						window.sidebar.addPanel(sTitle, sURL, ""); 
					}catch (e){ 
						try{ 
							window.external.addFavorite(sURL, sTitle); 
						}catch (e){
							var span = $("span",o.wrap);
							if(span.length == 0){
								span = $("<span>请按 Ctrl+D 键</span>");
								o.wrap.find("p").append(span);
							};
							span.stop().fadeIn(function(){
								clearTimeout(tm);
								tm = setTimeout(function(){
									$("span",o.wrap).stop().fadeOut();
								},1000);
							});
						};
					} 
				});
			};
			$(".share",o.wrap).attr("href",o.href);
		}
		,refreshStatistics:function(id){
			/* 统计代码 */
			/*try{
				var yesdata='&refe='+escape(document.referrer)+'&location='+escape(document.location)+'&color='+screen.colorDepth+'x&resolution='+screen.width+'x'+screen.height+'&returning='+cc_k()+'&language='+navigator.systemLanguage+'&ua='+escape(navigator.userAgent);
				$("#"+ id).html('<iframe src=http://count8.51yes.com/sa.htm?id=80293971'+yesdata+' height=0 width=0></iframe>');
			}catch(e){};*/
			/*百度代码*/
			/*var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?0fc821182b0e728ea005b79090c6b320";
			$('#'+ id +'script').remove();
			document.getElementById(id).appendChild(hm);*/
			//站长统计
			$('#tongjiqi script').remove();
			var hm = document.createElement("script");
			hm.src = "http://s19.cnzz.com/z_stat.php?id=1252952997";
			tongjiqi.innerHTML = '';
			document.getElementById('tongjiqi').appendChild(hm);
		}
		,bindEnter:function(eles,callback){
			for(var i=0;i<eles.length;i++){
				eles[i].bind("keydown",function(e){
					var currKey = e.keyCode || e.which || e.charCode;
					if(currKey == "13"){
						callback && callback();
					};
				});
			}
		}
		//文本提示
		,openWarn:function(e,n) {
			var i = $("#feng_warn_element");
			if(i.length == 0){
				i = $("<div id='feng_warn_element' class='warn_pass_wrap'><div class='warn_pass'><span class='text'>" + e + "</span></div></div>");
				$("body").append(i);
			}else{
				i.text(e);
			};
			setTimeout(function() {
				i.remove();
			}, 1500);
		}
		,checkform:function(){
			var form = $("[data-check]")
				,len = form.length
				,err = 0
				,showErr = function(ele,text){
					ele.addClass("err").siblings("span").addClass("errmsg").text(text);
					return false;
				}
				, errStrs = function(t){
					switch(t){
						case "tel":
							return "不是正确的电话号码格式";
						case "chinese":
							return "格式错误,必须全部为中文";
						case "qq":
							return "QQ格式为5-10位数字";
						case "url":
							return "网站地址格式错误";
						case "idcard":
							return "身份证格式错误";
						case "mobile":
							return "手机格式错误";
						case "email":
							return "必须为标准的邮箱格式";
						default:
							return "格式错误";
					};
				}
				,removeErr = function(){
					$(this).removeClass("err").siblings("span").removeClass("errmsg").text('');
				}
				,check = function(ele){
					try{
						var rule = $.parseJSON(ele.attr("data-check"))
							,val = ele.val();
						ele.on("change",removeErr);
						if(!rule.empty && val == ""){
							return showErr(ele,"不允许为空");
						}
						if(!rule.length == false && val != ""){
							rule.length == rule.length.split("-");
							if(val.length > rule.length[1] || val.length < rule.length[0]){
								return showErr(ele,"长度限制为"+ rule.length +"位");
							}
						};
						if(!rule.type == false && val != ""){
							switch(rule.type){
								case "tel":
									if(!ui.test(val,"phone") && !ui.test(val,"mobile")){
										return showErr(ele,errStrs(rule.type));
									};
									break;
								case "idcard":
									if(val.match(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/) == null){
										return showErr(ele,u.errStrs(rule.type));
									};
									break;
								default:
									if(!ui.test(val,rule.type)){
										return showErr(ele,errStrs(rule.type));
									};
							};
						};
						removeErr.call(ele);
						return true;
					}catch(e){
						removeErr.call(ele);
						return true;
					};
				};
			if(len == 0){return false;};
			form.each(function(){
				if(!check($(this))){
					err++;
				}
			});
			return err > 0 ? false : true;
		},
		//自定义提示文本
		placeholder:function($this,ispass){
			if($this[0].holded == true){return;};
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
			$this[0].holded = true;
		},
		loadUI:function(options){
			var $this = $(document);
			if ($.browser.msie && $.browser.version <= "9.0") { 
				$this.find("input[type='text'],textarea").each(function(){
					ui.placeholder($(this),false);
				});
				$this.find("input[type='password']").each(function(){
					ui.placeholder($(this),true);
				});
			}
		}
		,queue: function(){
			return {
				list:[]
				, count: -1
				, init: function(){
					this.count++;
					if(this.count > 0){
						this.clear();
					};
					this.list[this.count] = [];
				}
				, add: function(ajax){
					this.list[this.count].push(ajax);
				}
				, clear:function(){
					var index = this.count - 1;
					try{
						this.list[index].forEach(function(b){
							b.abort();
						});
					}catch(e){};
				}
			}	
		}
	}
	return ui;
},["jquery/cookie"]);
