 Fengs.add('940/case/index', function(S, $ , Template,cookie,layerBox,share){
 		var caseJs = {
 			caseInit : function(){
 				var $user_ico_ul = $('.user_ico_ul') 
 				  , $s_center = $('.s_center')
 				  , $shaer_but = $('.shaer_but')
 				  , $but_shaer = $('#but_shaer')
 				  , contResult = function(img , name , sex , per , content , data){
 				  	var sexImg = sex==0?'/images/nv.png':'/images/nan.png';
 				  		img = img?img:sexImg;
 				  		sex = sex==0?'nv':'nan';
 				  		return '<dl><dt><img width="55" src="'+img+'"></dt><dd><span>'+name+'</span><i class="'+sex+'"></i></dd><dd>'+per+'</dd></dl><div class="share_exp">'+replace_em(content)+'</div><p class="data">分享日期：'+data+'</p>';
 				  }
 				  ,oldArr = [];
 				  var uri = new S.parseUri(window.location.href,"#");
 				  if (uri.share_id) {
 				  		$('html,body').animate({scrollTop:800});
 				  };
 				 
 				// 初始化加载数据
 				var _data = {}
 				,shareNum = 1
 				,initData = function(page){
 					$.get('/shareList?page='+page+'&line=8',function(data){
 						var d = $.parseJSON(data);
 						if (!d.list) {
 							if (page!=1) {
 								shareNum = page;
 								layer.tips('没有更多啦！', '.shaer_but');
 							};
 							return;
 						};
 						console.log(d)
 						$.each(d.list,function(i,v){
 							_data[i] = v;
 						});
 						var liHtml = '';
 						for(var i in _data){

 							var sexImg = _data[i].gender==0?'/images/nv.png':'/images/nan.png';
 							var url = _data[i].profileUrl?_data[i].profileUrl:sexImg;
 							liHtml+='<li><img src="'+url+'"></li>';
 						}
 						$user_ico_ul.html(liHtml);
 						$user_ico_ul.find('li').eq(0).trigger("click").trigger("mouseout");//显示第一条分享
 					});
 					
 				};
 				initData(shareNum);//初始化第一页

 				$user_ico_ul.on({
 					'mouseover' : function(){
 						var _index = $(this).index();
 						var d = _data[_index];
 						oldArr.push($s_center.html());
 						var contHtml =  contResult(d.profileUrl , d.realName , d.gender , d.period , d.content , d.time);
 						$s_center.html(contHtml);
 					},
 					'click' : function(){
 						var _index = $(this).index();
 						var d = _data[_index];
 						oldArr[0] = contResult(d.profileUrl , d.realName , d.gender , d.period , d.content , d.time);
 					},
 					'mouseout' : function(){
 						$s_center.html(oldArr[0])
 					}
 				},'li');
 				
 				//换一组
 				$shaer_but.click(function(){
 					shareNum++;
 					initData(shareNum)
 				});

 				//分享
 				
 				$but_shaer.on({
 					'mouseover' : function(){
 						// Fengs.use('/utils/webBox');
 					},
 					'click' : function(){

 						// Fengs.use('940/utils/layer',function(){
				        
 							share.goShare();
				             
 						// });
 					}
 				})

 				 // 表情图片转换
				 function replace_em(str){
				 	str = str.replace(/\</g,'&lt;');
				 	str = str.replace(/\>/g,'&gt;');
				 	str = str.replace(/\n/g,'<br/>');
				 	str = str.replace(/\[em_([0-9]*)\]/g,'<img src="/images/face/$1.gif" border="0" />');
				 	return str;
				 }

 				// $("#tel").html('13878185525'.substring(0,3)+"****"+'13878185525'.substring(7,11));

 			}
 		}

 		return caseJs;


},["plus/art-template",'jquery/cookie','940/utils/layer','940/utils/sucShare'])