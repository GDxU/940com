Fengs.add('zx/user-record', function(S, $, TEMPLATE, REQ, UI, COOKIE, SCROLLTO, LOGINED){
	if(!LOGINED.init()){
		return UI.alert('请先登录!');
	};
	//渲染模板列表
	var render = TEMPLATE.compile($('#tempProList').html());
	var tempList = {
			style:0,			//当前筛选风格
			color:0,			//当前筛选颜色
			industry:0,			//当前筛选行业
			site:0,				//当前筛选店铺版本
			power:13,			//当前用户版本
			mine:[],			//我已经购买的模板
			key:false,			//当前搜索关键词
			first:true,			
			timer:null,			
			status:true,			
			page:{
				total:0,			//记录总数
				current:1,			//当前页
				count: 14			//每页数量
			},
			list:[],//所有模板数组
			showList:[],//当前筛选过的模板
			createEle:function(obj,index,wrap,val){//建立一个模板对象
				obj.user = S.logined.u;
				obj.wangpu = $.inArray(2, obj.site) >= 0 ? '2' : '1';
				wrap.append(render(obj));
			},
			nofind: function(){
				$('.no-result', $views).show();
			}
			, check:function(){
				var _this = this;
				if(_this.status == false){
					return false;
				};
				_this.status = false;
				tempList.timer = setTimeout(function(){
					_this.status = true;
				},800);
				return true;
			}
			, 'by': 'time'
			, 'desc': true
			, order: function(_by, _desc){
				this.by = _by;
				this.desc = _desc;
				this.filter(this.industry, this.color, this.style, this.site, '')
			}
			/*筛选模板
			//industry:行业
			//color:颜色
			//style:风格
			//site:店铺类型
			//text:关键词
			//ani:是否执行动画*/
			, filter:function(industry,color,style,site,text,ani){
				$('.no-result', $views).hide();
				$preloader.show();
				var _this = this
					, wrap = $views
					, list = _this.list
					, showList = _this.showList
					, id = false
					, page = _this.page;
				_this.key = false;
				//wrap.html("");
				if(text && text.match(/^[\d]+$/) !== null){
					id = text;
				}
				showList.length = 0;
				for(var i =0; i< list.length;i++){
					if(id){
						_this.key = id;
						if(list[i].id == id){
							showList.push(list[i]);
						};
					}else if(text){
						_this.key = text;
						text = text.toUpperCase();
						if(list[i].name.toUpperCase().indexOf(text)>=0){
							showList.push(list[i]);
						};
					}else{
						_this.key = "";
						if((industry == 0 || $.inArray(industry,list[i].industry)>=0) && (color == 0 || $.inArray(color,list[i].color)>=0) && (style == 0 || $.inArray(style,list[i].style)>=0) && (site == 0 || $.inArray(site,list[i].site)>=0 )){
							showList.push(list[i]);
						};
					};
				};
				showList.sort(function(a, b){
					/*if(a.price === 0){
						return -1;
					}*/
					return  a[_this.by] > b[_this.by] ? (_this.desc ? -1 : 0) : (_this.desc ? 0 : -1);
				});
				page.total = showList.length;
				page.current = 1;
				//page.count = page.total / 24
				for(var i =0; i< showList.length;i++){
					if((i+1) > page.count * (page.current - 1) && (i+1) <= page.count * page.current){
						this.createEle(showList[i],i,wrap);
					};
				};
				_this.pager(1,ani);
				//分页
				//_this.page = 1;
				//resize();
				_this.fenye();
			},
			fenye: function(index){
				$preloader.hide();
				//分页
				var _this = this
					, page = _this.page
					, pageCurrent = index || 1;
				var yeshu = Math.ceil(page.total / page.count)
					, html = [];
				yeshu = yeshu == 0 ? 1 : yeshu;
				$pagination.html("");
				var cheateBtn = function(index){
					index += 1;
					if(index == pageCurrent){
						$pagination.append('<span class="woo-cur">'+ index +'</span>');
					}else{
						$pagination.append('<a href="javascript:void(0);" data-page="'+ index +'">'+ index +'</a>');
					}
					
				}
				for(var i=0; i<yeshu;i++){
					if(yeshu < 11){
						cheateBtn(i);
					}else if(pageCurrent < 6){
						if(i < 9 || i+1 == yeshu){
							cheateBtn(i)
						}else if(i == 9){
							$pagination.append('...');
						}
					}else if(pageCurrent > yeshu-5){
						if(i + 9 > yeshu || i == 0){
							cheateBtn(i)
						}else if(i == 1){
							$pagination.append('...');
						}
					}else{
						if(i == 0 || i+1== yeshu || i+1==pageCurrent || (i<pageCurrent && i+5>pageCurrent) || (i-pageCurrent>-1 && i-pageCurrent<3)){
							cheateBtn(i);
						}else if(i == 1 || i+2 == yeshu){
							$pagination.append('...');
						}
					}
				};
			},
			//模板分页显示
			pager:function(index,ani){
				var _this = this,
					wrap = $views,
					showList = _this.showList,
					page = _this.page;
				wrap.find('.tpl-item').remove();
				page.current = index;
				for(var i =0; i< showList.length;i++){
					if((i+1) > page.count * (page.current - 1) && (i+1) <= page.count * page.current){
						_this.createEle(showList[i],i,wrap);
					};
				};
				resize();
				if(showList.length == 0){
					_this.nofind();
				}
				_this.fenye(index);
			}
		}
		, $slide = $(".cats")//左边
		, $views = $(".bd-views")//主显示区
		, $items = $slide.find("[click-data]")
		, $search_btn = $(".search-bar .btn")
		, $search_txt = $(".search-bar input")
		, $pagination = $('.pagination')
		, $preloader = $('.preloader', $views)
		, liw = 242
		, lih = 420
		, resize = function(){
			var $li = $('li.tpl-item', $views)
			var w = document.body.clientWidth,
				h = document.body.clientHeight,
				x = Math.floor(w / liw),
				y;
			x = x < 4 ? 4 : x;
			y = Math.ceil($li.length / x);
			$('.main').css({'width': x * liw - 15});
			$views.css('height', y * lih < 818 ? 818 : y * lih);
			$li.each(function(){
				var $this = $(this)
					, index = $li.index($this)
					, a = (index) % x
					, b = Math.floor(index / x);
				$this.css({left:parseInt(a * liw), top:b * lih});
			});
		};
	$('.nodata a').live('click', function(){
		tempList.filter(0,0,0,0,null,false);
		resetSearchStatus();
	});
	$pagination.on('click', 'a', function(){
		var page = $(this).data('page');
		if(page){
			$('body').scrollTo(150, 600);
			tempList.pager(page);
		}
	});
	$('.order-option a').click(function(){
		var $this = $(this)
			, _desc = $this.hasClass('down');
		if(!$this.hasClass('on')){
			$this.addClass('on').siblings('a').removeClass('on');
		}else{
			_desc = !_desc;
			$this.toggleClass('down');
		}
		tempList.order($(this).data('value'), _desc);
	});
	//获取模板数据
	REQ.s({
		//url:"/zx/data.json",//?"+ new Date().getTime(),
		url:"api/decorate_history_list",
		data:{'username': S.logined.u},
		success:function(d){
			d = d.kehuda;
			if(d.status == "1"){
				tempList.list = d.list.l;
				tempList.filter(0,0,0,0,null,true);
			}else{
				UI.warn("获取数据失败", 'err');
			};
		}
	});
	$(window).resize(resize).trigger('resize');
	//滚动公告
    //$("#scrollDiv").Scroll({line:1,speed:500,timer:2000});
	//模板筛选
	function resetSearchStatus($this){
		$(".current",$slide).removeClass('current');
		$(".list",$slide).find("a:first,span:last").addClass("current");
		if(!$this == false){
			$this.addClass("current").parent().siblings().find(".current").removeClass("current");
			$this.siblings(".current").removeClass("current");
		}
	}
	$items.each(function(){
		var $this = $(this);
		function attchClass($this){
			$this.addClass("current").parent().siblings().find(".current").removeClass("current");
			$this.siblings(".current").removeClass("current");
		};
		$this.click(function(){
			$('body').scrollTo(150, 600);
			if(tempList.check()){
				var data = eval("("+ $this.attr("click-data") +")");
				attchClass($this);
				tempList[data.t]=data.v;
				switch(data.t){
					case "industry":
						tempList.color = 0;
						tempList.style = 0;
						tempList.site = 0;
						break;
					case "color":
						tempList.industry = 0;
						tempList.style = 0;
						tempList.site = 0;
						break;
					case "style":
						tempList.industry = 0;
						tempList.color = 0;
						tempList.site = 0;
						break;
					case "site":
						tempList.industry = 0;
						tempList.color = 0;
						tempList.style = 0;
						break;
				}
				//console.log(tempList.industry+","+tempList.color+","+tempList.style+","+tempList.site);
				resetSearchStatus($this);//重置筛选按钮
				tempList.filter(tempList.industry,tempList.color,tempList.style,tempList.site,null,true);
			};
		});
	});
}, ['plus/art-template', 'common/require','ui/base', "jquery/cookie", 'jquery/scrollto', './logined'])