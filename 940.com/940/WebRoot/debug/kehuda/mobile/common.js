Fengs.add('kehuda/mobile/common', function(S, $){
	var khd = {
		init : function(){
			var $kResultUl = $('.k-result-ul');
			$kResultUl.on('tap','.title',function(){
				var $this = $(this);
				var table = $this.siblings('.k-table');
				var aTr = table.find('tr');
				var tableHeight = table.find('table').height();
				var iTitle = $this.find('span.t i');

				if (table.height()==0) {
					this.iText = iTitle.html();
					iTitle.html('标题')
					table.addClass('y-table').height(tableHeight);
					$this.find('.t b').addClass('act');
					$this.find('.t').addClass('w');
					$this.find('.p,.y').show();
				}else{
					iTitle.html(this.iText)
					table.removeClass('y-table').height(0);
					$this.find('.t b').removeClass('act');
					$this.find('.t').removeClass('w');
					$this.find('.p,.y').hide();
				}
				
			});

			$('.k-txt-ul').on('tap','li',function(){
				 $(this).addClass('act').siblings().removeClass('act');
			});
			
			var menuOff = true,$kHeader = $('#k-header');
			$('#k-menu').click(function(){
				if (menuOff) {
					$kHeader.addClass('k-header')
				}else{
					$kHeader.removeClass('k-header')
				}
				menuOff=!menuOff;
			});
			// $('.showXz').click(function(){//点击显示排序
			// 	$(this).hide();
			// 	$('.khd-more').show();
			// });
				var curIndex = $('.khd-top-nav').find('.cur').index();
				var $body = $('body');
		        if (curIndex==1) {
						document.title = '电商工具 - 客户达';
				}else if(curIndex==2){
						document.title = '开店管家 - 客户达';
				}else if(curIndex==3){
						document.title = '装修管家 - 客户达';
				}else{
					// var _i = $('.toolMenu .cur').index();
					// switch(_i)
					// 	{
					// 	case 0:
					// 	  document.title = '关于我们 - 客户达';
					// 	  break;
					// 	case 1:
					// 	  document.title = '联系我们 - 客户达';
					// 	  break;
					// 	case 2:
					// 	  document.title = '企业资质 - 客户达';
					// 	  break;
					// 	}
				}
			
		        var $iframe = $('<iframe style="display: none;" src="/images/m/khd_logo.png"></iframe>');
		        $iframe.on('load',function() {
		            setTimeout(function() {
		                $iframe.off('load').remove();
		       		 },0);
	       		}).appendTo($body);

	       		//光碟图片随机
	       		var _ran = Math.random(),$imgLink = $('.imgLink'),$img = $imgLink.find('img'),$a = $imgLink.find('a');
	       		if (_ran<0.5) {
	       			$a.attr('href','/k');
	       			$img.attr('src','/images/m/k.png').css('opacity',1);
	       		}else{
	       			$a.attr('href','/z');
	       			$img.attr('src','/images/m/z.png').css('opacity',1);;
	       		}
		}
		, record:function(options){
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
		}
		, dropArr:new Array()
		, drop:function(element, _record){
			var _self = this
				, array = [];
			element.each(function(){
				var $ele = $(this)
					, isOpen = false,//是否展开
					btn = $ele.find("em"),//下拉按钮
					input = $ele.find("input"),//输入文本框
					menu = $ele.find(".drop_menu")//展开菜单
					, dropItem = function(text,bind){
						var $a = $("<span><i class='fl'>"+ text +"</i><em class='fr'></em></span>");
						//选中历史记录
						$a.click(function(){
							$ele.val(text);
						}).find("em").click(function(e){
							_record[bind].del(text);
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
					if(bind && bind != "" && _record[bind]){
						menu.html("");
						//try{
							_record[bind].target = $ele;
							for(var i=0,len=_record[bind].list.length; i < len; i++){
								dropItem(_record[bind].list[i],bind);
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
						$("a", menu).on('tap', function(){
							$ele.value = $(this).attr("rel");
							input.val($(this).text());
						})
						if(!input.attr("readonly") == false){
							input.css("cursor","pointer").on('tap',function(e){
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
						for(var i=0,list=_self.dropArr; i<list.length; i++){
							if(list[i] != $ele){
								list[i].close();
							};
						};
					}else{
						$ele.close();
					};
				};
				$ele.upmenu();
				$ele.val = function(value,undefined){
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
				_self.dropArr.push($ele);
			});
			return _self.dropArr;
		}
		, refreshStatistics:function(id){
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
			document.getElementById('tongjiqi').appendChild(hm);
		}
		, filterSpecChr:function(str){
			return str.replace(/\)/g, "）").replace(/\(/g, "（").replace(/\{/g, "｛").replace(/\}/g, "｝").replace(/\\/g, "＼").replace(/\</g, "＜").replace(/\>/g, "＞").replace(/\'/g, "＇").replace(/\!/g, "！").replace(/\~/g, "～").replace(/\ /g, "　");
		}
		, bindEnter:function(eles,callback){
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
		, openWarn:function(e,n) {
			alert(e);
		}
		, queue: function(){
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
	return khd;
});