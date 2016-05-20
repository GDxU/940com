Fengs.add('zx/history', function(S, $, REQ, COOKIE, URI){
	var $views = $("#views")//主显示区
		, $nextBtn = $(".next",$views)
		, liw = 190
		, lih = 337
		, timer
		, O = {
			page:0
			, line:Math.floor((document.body.clientWidth - 20) / liw) * 2 - 1
			, all:0
		}
		, tempList = {
			list:[],//所有模板数组
			createEle:function(obj,index,wrap,val){//建立一个模板对象
				var $li = $("<li><dl><dd title='"+ obj.title +"'>"+ (obj.publish ? "<em class='fabu'></em>" : "") +"<img src='"+ obj.image +"'/></dd><dt><p style='padding-right: 10px;'>"+ obj.title +"</p><div><a href='javascript:void(0);' class='show'>预览</a><a href='javascript:return false;' class='by desc'>装修</a></</div></dt></dl><div class='time'><em></em><span>"+ obj.time +"</span></div></li>")
					, id = /_([\d]*)$/.exec(obj.template)
					, $buy = $li.find(".by")
					, $show = $li.find(".show")
					, $div = $li.find("div");
				if(id === null){
					id = 0;
				}else{
					id = id[1];
				}
				$li.css("height",lih).on("mouseenter",function(){
					$show.stop().css({"left":-80,opacity:0}).animate({"left":7,opacity:1});
					$buy.stop().css({"left":258,opacity:0}).animate({"left":91,opacity:1});
				}).on("mouseleave",function(){
					$show.stop().css({"left":-80,opacity:0});
					$buy.stop().css({"left":258,opacity:0});
				});
				$buy.on("click",function(e){
					alert('[do]design[/do][url]'+ hostUrl +'/design?id='+ obj.tid +'&page=index&client=1[/url]');
				});
				$show.click(function(){
					alert('[do]preview[/do][url]'+ hostUrl +'/views?id='+ obj.tid +'&page=index&client=1[/url]');
				});
				obj.ele = $li;
				this.list.push($li);
				$nextBtn.before($li);
				resize();
			},
			check:function(){
				var _this = this;
				if(_this.status == false){
					return false;
				};
				_this.status = false;
				tempList.timer = setTimeout(function(){
					_this.status = true;
				},800);
				return true;
			},
			add:function(arr){
				var startIndex = this.list.length;
				if($.isArray(arr)){
					for(var i=0,len=arr.length; i<len; i++){
						this.createEle(arr[i],startIndex + i,$views);
					}
				}
				return false;
			}
		}
		, resize = function(){
			var $li = $("li", $views),
				w = document.body.clientWidth - 20,
				h = document.body.clientHeight - 42,
				x = Math.floor(w / liw),
				y = Math.ceil($li.length / x);
			if($li.length == 0){
				$views.addClass("notemp");
			}else{
				$li.each(function(){
					var $this = $(this),
						index = $li.index($this),
						a = index % x,
						b = Math.floor(index / x),
						n = Math.floor(w / x);
					setTimeout(function(){
						$this.stop().animate({width:n,left:a * n,top:b * lih});
					},index * 5);
				});
				$views.scrollTop(0);
			};
		}
		, winResize = function(){
			$views.css("height",document.body.clientHeight - 42);
			resize();
		}
		//获取模板数据
		, request = function(){
			isLoading = true;
			REQ.s({
				//url:"/zx/data.json",//?"+ new Date().getTime(),
				url:"api/decorate_history_list",
				dataType:"json",
				data:{'username': URI.username ,'line':O.line,'page':O.page + 1},
				success:function(d){
					d = d.kehuda;
					isLoading = false;
					if(d.status == "1"){
						O.page++;
						O.all = d.all;
						if(O.page == 1 && d.all == 0){
							$views.addClass("notemp").html("");
							return false;
						}
						if(Math.ceil(d.all / O.line) <= O.page){
							$nextBtn.css("display","none");
						}
						tempList.add(d.list.l);
					}else{
						openWarn("获取数据失败");
					};
				}
			});
		};
	$nextBtn.click(function(){
		if(Math.ceil(O.all / O.line) > O.page){
			request();
		}
	})
	request();
	$(window).resize(winResize);
	winResize();
},["common/require", "jquery/cookie", "./inc/recept"]);