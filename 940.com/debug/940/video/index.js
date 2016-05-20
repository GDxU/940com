 Fengs.add('940/video/index', function(S, $){

 	return {
 		init : function(){
 			var $tab_ul = $('.tab_ul'),$cur = $tab_ul.find('.cur');
 			this.listUl = $('.wrap_vlist').find('.v_list_ul');
 			var _this = this;
 			$tab_ul.on('mouseover','li',function(){
 				var _i = $(this).index();
 				$cur.animate({left:$(this).position().left+17},200);
 				$(this).addClass('act').siblings('li').removeClass('act');
 				_this.listUl.eq(_i).show().siblings('ul').hide();
 			})
 			this.getVideo();
 		},
 		getVideo : function(){
 				
 				var _this = this;
 				var $wrap_video = $('.wrap_video'),$freePage = $('.videoPage');
 				var vipoff = 0,freeoff = 0;
 				var videoList = {
 					videos : function(j,type){//热门视频
 						$.getJSON('/videoList?type='+type+'&page=1&line=10',function(d){
			 				var list = d.list;
			 				var len = list.length>10?10:list.length;
			 				var aHtml = '',act;
			 				for (var i = 0; i < len; i++) {
			 					act = i<3 ? 'act' : '';
			 					aHtml+='<li><i class="fl '+act+'">'+(i+1)+'</i><a class="fl" href="javascript:">'+list[i]['title']+'</a><span class="fr" title="播放次数">'+list[i]['click_num']+'</span></li>'
			 				};

			 				_this.listUl.eq(j).html(aHtml);
			 				var aLi = _this.listUl.eq(j).find('li');
			 				for (var i = 0; i < len; i++) {
			 					aLi.eq(i).find('a')[0].vData = list[i]['videoId']
			 				};

		 				})
		 				
 					},
 					vipFreeVideo : function(j,type,page,off){
 						 var _this = this; 

 						 $.getJSON('/videoList',{type:type,page:page,line:12},function(d){
	 						
			 				var list = d.list;
			 				var aHtml = '',aPage;
			 				if (d['status']!=1) {alert('服务器繁忙，请稍后在试！'); return; };
			 				for (var i = 0; i < list.length; i++) {
			 					aHtml+='<li><a href="javascript:"><img width=175 height=120 data-src="'+list[i]['preview']+'" width=175 height=120 src="../images/loding.gif"><em class="v_bg"></em><i></i></a><p><em class="'+(type==1?'vip':'')+'">'+(type==1?'VIP':'免费')+'</em><i>|</i><span>'+list[i]['title']+'</span></p></li>';
			 				};
			 				$wrap_video.eq(j).html(aHtml);
			 				$wrap_video.eq(j).find('img').each(function(){
			 				    var $this = $(this)
			 				 	loadImage($this.attr('data-src'), function(){
								 	$this.attr('src',this.src);
								 	$this.removeAttr('data-src');
								});
			 				});
			 				function loadImage(url, callback) { 
								var img = new Image(); 
								img.src = url; 
								if (img.complete) { 
									callback.call(img); 
									return; 
								} 
								img.onload = function (){
									callback.call(img);
								}; 
							};

			 				var aLi = $wrap_video.eq(j).find('li');
			 				for (var i = 0; i < list.length; i++) {
			 					 aLi.eq(i).find('a')[0].vData = list[i]['videoId'];
			 				};
			 				
			 				if (!off) return;
			 				_this.page(d.count,j,type);

		 				 })

 					},
 					page : function(count,j,type){
 						
 						var _page = Math.ceil(count/12);
 						var pageHtml = '';
 						for (var i = 0; i < _page; i++) {
 							pageHtml+='<em '+(i==0?'class="act"':'')+'>'+(i+1)+'</em>';
 						};
 						$freePage.eq(j).html(pageHtml);
 						$freePage.eq(j).attr('type',type);
 					}
 				}
 				videoList.videos(0,3);//热门 1 会员  2,免费  3，热门  4，最新
 				videoList.videos(1,4);//最新
 				videoList.videos(2,1);//会员

 				videoList.vipFreeVideo(0,2,1,true);//0为第一个容器,2为免费,1为默认第一页
 				videoList.vipFreeVideo(1,1,1,true);//1为第二个容器,1为vip,1为默认第一页

 				var option ={"app_id":"1251672867","width":810,"height":460,'remember':'1',"VMode":'opaque',"stretch_patch":true}; 

 				_this.listUl.on('click','a',play);
		 		$wrap_video.on('click','a',play);

		 		var goObj = $('html,body'),vTitle = $('.wrap_video_ul').find('h3');
		 		function play(){
		 			var _title = '';
		 			if ($(this).siblings('p').length>0) {
		 				_title = $(this).siblings('p').find('span').text()
		 				goObj.animate({scrollTop:80},600);
		 			}else{
		 				_title = this.innerHTML;
		 			}
		 			vTitle.html('正在播放：'+_title);
	 				document.title = _title;
			 	 	 var _numSpan = $(this).siblings('span');
			 	 	 $.getJSON('/play',{v_id:this.vData},function(d){
			 	 	 	_numSpan.text(Number(_numSpan.text())+1);
			 	 	 })
			 	 	 option.file_id = this.vData;
			 	 	 option.auto_play = '1';
			 	 	 new qcVideo.Player( "id_video_container", option );
			 	 	
		 		}

		 		$freePage.on('click','em',function(){
		 			var index = $(this).index();
		 			var type = $(this).parent().attr('type');
		 			if (type==1) {
		 				if (vipoff==index) return;
		 				vipoff = index; 
		 			}else{
		 				if (freeoff==index) return;
		 				freeoff = index;
		 			}
		 			
		 			$(this).addClass('act').siblings('em').removeClass('act');
		 			var _i = index+1;
		 			
		 			videoList.vipFreeVideo(type==1?1:0,type,_i,false);
		 		})

 				
 		}
 	}

 },['jquery/cookie'])