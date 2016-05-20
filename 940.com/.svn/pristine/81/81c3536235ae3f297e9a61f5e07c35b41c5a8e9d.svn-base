Fengs.add('zx/inc/notice', function(S, $, REQ, COOKIE, URI){
	var KHDnoticeList = function(options){
		var o = $.extend({
			list:null//显示列表
			,pager:null
			,id:0//需要显示ID
			,hasid:false
			,line:6
			,page:1
			,count:1
		},options);
		var noticeList = {
			list:[],
			add:function(obj){
				var len = obj.length != null ? obj.length : 1,
					_this = this,
					addPro = function(i){
						if(i >= len){
							noticeList.list[o.hasid?o.id:0].active();
							return;
						};
						if(!o.hasid && obj[i].d == o.id){
							o.id = i;
							o.hasid = true;
						};
						var pro = new noticeItem(obj[i]);
						_this.list.push(pro);
						pro.init(function(){
							addPro(i+1);
						});
					};
				addPro(0);
			},
			clear:function(){
				o.list.html("");
			},
			request:function(){
				this.list = [];
				REQ.s({
					url:"es/announce_list",
					data:{line:o.line,page:o.page,"type":o["type"]},
					success:function(d){
						d = d.sududa;
						if(d.status == 1){
							if(o.page == 1){
								o.count = Math.ceil(d.all / o.line);
								var html = [];
								for(var i=0; i<o.count; i++){
									html.push("<a href='#' rel='"+ (i+1) +"' "+ (i == 0 ? "class='current'" : "") +"></a>");
								}
								o.pager.html(html.join(""));
							};
							noticeList.clear();
							noticeList.add(d.list.l);
						}else{
							openWarn(d.tips);
						};
					}
				});
			}
		};
		var noticeItem = function(obj){
			return $.extend({
				active:function(status){
					this.ele.addClass("current").animate({height:150},300).siblings().removeClass("current").animate({height:40},300);
				},
				init:function(callback){
					var _this = this;
					_this.ele = $("<ol><li><h2>"+ _this.t +" "+ _this.i+"</h2><p>"+ _this.c.replace(/(\[url\])(.*?)(\[\/url\])/ig,"<a href='$2' target='_blank'>点击查看</a>") +"</p></li></ol>");
					_this.ele.click(function(){
						var cla = $(this).attr("class");
						_this.active();
					});
					o.list.append(_this.ele);
					callback && callback();
				}
			},obj);
		};
		o.pager.find("a").live("click",function(){
			var $this = $(this);
			if($this.hasClass("current")){
				return false;
			};
			o.page = $this.attr("rel");
			$this.addClass("current").siblings().removeClass("current");
			noticeList.request();
		});
		return noticeList;
	};
	var list = new KHDnoticeList({
			list:$(".list")
			,id:(!URI.id?0:URI.id)
			,type:(!URI.type ? 12 : URI.type)
			,pager:$(".page")
		});
	list.request({});
},["common/require", "jquery/cookie", "./recept"]);