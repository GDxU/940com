Fengs.add('940/utils/popBox', function(S, $){
   var popBox = {
				init : function(){
					this.footer = $('#footer');
					this.found();
					this.j_touch = $('#j_touch');//左侧联系
					this.j_sign = $('#j_sign');//右侧报名
					this.sign_box = $('#sign_box');//弹出层
					this.close_sign = $('#close_sign');//关闭层
					this.gotop();
					this.roll();
					this.winBox();
					this.submitInfo();
				},
				found : function(){
					// 创建头部导航
					var $body = $('body');
					var $header = $('#header').find('.wrap_nav');
					var $headBox = $('<div id="headBox" class="minHead">').append($header.clone())
					$headBox.find('.logo940').attr('src','/images/min_logo.png')
					$body.prepend($headBox)
					
					var html = "<div id='j_touch'><a class='qq' href=''><span><i></i></span></a><a class='wx' href=''><span><i></i></span></a><a class='dh' href=''><span><i></i></span></a><a class='kf' href=''><span><i></i></span></a><a class='ew' href=''><span></span></a></div><div id='j_sign'></div><div id='sign_box'><div class='alert_box'><ul class='wrap_input'><li class='txt_title'><h1>开启电商成功之门</h1><p>拥有你的专业电商导师！</p></li><li class='sign_input'><div class='fl l_name'><i class='ico_name'>&#xe603;</i><span>姓名：</span></div><div class='fl r_input'><input type='text'></div></li><li class='sign_input'><div class='fl l_name'><i class='ico_phone'>&#xe604;</i><span>电话：</span></div><div class='fl r_input'><input type='text'></div></li><li class='sign_input'><div class='fl l_name'><i class='ico_qq'>&#xe6cb;</i><span>Q Q：</span></div><div class='fl r_input'><input type='text'></div></li><li class='but_enroll'><input type='button' value='立即报名'><p><span>免费入学，领取超值神秘大礼!</span><i></i></p></li><li class='but_sign'><span class='fl cancel'>稍后报名</span><a class='fr' href=''>在线咨询</a></li></ul><div id='hintBox'><span></span></div><div id='close_sign'>&#xe680;</div></div></div>";

						this.footer.after(html);
						
						$('script[src]').remove();

				},    
				submitInfo : function(){//报名提交验证
					var reg = {
						 name : /^[\u4e00-\u9fa5a-zA-Z]{2,15}$/
						,tel : /(^0\d{2,3}-?\d{7,8}$)|(^1\d{10}$)/
						,qq : /^[1-9]{4,12}$/
					}
					var _this = this;
					var $but_enroll = $('.but_enroll input'),$sign_input = $('.sign_input') , $hintBox = $('#hintBox span'),meoutTmer = null;
					var submitFn = function(){
						var vName = $sign_input.eq(0).find('input').val();
						var vTel = $sign_input.eq(1).find('input').val();
						var vQQ = $sign_input.eq(2).find('input').val();
						var $error = meout();
						// console.log(vName+'-'+vTel+'-'+vQQ)
						if (!reg.name.test(vName)) {
							$error.html('姓名格式有误');
						}else if(!reg.tel.test(vTel)){
							$error.html('电话号码格式不正确');
						}else if(!reg.qq.test(vQQ)){
							$error.html('QQ号码格式不正确');
						}else{
							$but_enroll.val('正在加载中...');
							$.getJSON('/enroll?user_name='+vName+'&phone_number='+vTel+'&qq='+vQQ,function(data){
								try{
									if (data['status']==1) {
									 	 $hintBox.removeClass('error').addClass('succ').html(data['tips']);
										 setTimeout(function(){
										 	_this.sign_box.fadeOut(300);
										 	_this.sign_box.find('.alert_box').animate({
												marginTop:'0px',
												height:'0px'
											},200,'easeOutSine');
										 	$hintBox.removeClass('error succ');
										 	$sign_input.find('input').val('');
										 },1500)
									 }else{
									 	 $error.html('服务器繁忙，请稍后再试！');
									 }
								}catch(e){$error.html('服务器繁忙，请稍后再试！');}
								 
								 $but_enroll.val('立即报名');
							})
							
						}
					}
					$but_enroll.click(submitFn);
					$(document).keydown(function(event){
						 if(!$sign_input.find('input').is(':focus')) return;
						 if (event.keyCode == 13) submitFn();
					});


					function meout(){
						clearTimeout(meoutTmer);
						meoutTmer = setTimeout(function(){
							$hintBox.removeClass('error succ');
						},2000);
						return $hintBox.addClass('error');
					}

				},
				roll : function(){
					var _this = this;
					var _window = $(window);
					var _header = $('#header'), _wrap_head = _header.find('.wrap_head');
					var slooOff = true;
					var $advert = $('#advert');
					var $headBox = $('#headBox');
					_window.on('scroll',function(){
						comSoll();
					});
					comSoll();
					function comSoll(){
						var _top =  $(document).scrollTop();
						_top>800 ? _this.goTop.fadeIn(600) : _this.goTop.fadeOut(400);
						_this.j_touch.stop().animate({top:(_window.height()-_this.j_touch.height())/2+_top});
						_this.j_sign.stop().animate({top:(_window.height()-_this.j_touch.height())/2+_top});
					
						//minTop
						
						if (!-[1,]) {
							$headBox.addClass('ie8');
						};
						if (_top>=300) {
							if (navigator.userAgent.indexOf("MSIE 9.0")>0||!-[1,]) {
								$headBox.stop(true).animate({top:0},200);
							}else{
								$headBox.css({top:0});
							}
						}else{
							if (navigator.userAgent.indexOf("MSIE 9.0")>0||!-[1,]) {
								$headBox.stop(true).animate({top:-65},200);
							}else{
								$headBox.stop(true).removeAttr('style');
							}
						}
					}
				},
				winBox : function(){
					var _this = this,$sign_input = $('.sign_input');
					$('#j_sign,.enroll,.v_st').on('click',function(){
						_this.sign_box.fadeIn();
						setTimeout(function(){
							//_this.sign_box.find('.alert_box').css({opacity:'1',transform:'scale(1)'})
							_this.sign_box.find('.alert_box').animate({
								marginTop:'-265px',
								height:'530px'
							},'easeOutSine');
							$sign_input.eq(0).find('input').focus();
						},100);
					});
					$('#close_sign,.cancel').on('click',function(){
						_this.sign_box.fadeOut();
						_this.sign_box.find('.alert_box').animate({
								marginTop:'0px',
								height:'0px'
							},300,'easeOutSine')
						//_this.sign_box.find('.alert_box').css({opacity:'0',transform:'scale(0.5)'});
					});
					this.exe();
				},
				exe : function(){
					this.sign_box.find('.r_input input').focus(function(){
			             	 $(this).parents('li').addClass('act')
			             });
			        this.sign_box.find('.r_input input').blur(function(){
			             	 $(this).parents('li').removeClass('act')
			             });

			      
			        this.j_touch.on('mouseenter','a',function(){
			        	var _i = $(this).index();
			        	var width =_i == 2 ? 170 : 150;
			        	var _span = $(this).find('span') ,_aI = _span.find('i');
			        	
			        	if (_i<4) {
			        		_span.stop().animate({width:width,opacity:1},300);
			        		
			        	}else{
			        		_span.css({'width':'127px'}).stop().animate({'marginTop':'-75px',opacity:1});
			        	}
			        	_aI.stop().animate({marginLeft:0},300);
			        	
			        }).on('mouseleave','a',function(){
			        	var _i = $(this).index();
			        	var _span = $(this).find('span') ,_aI = _span.find('i');
			        	if (_i<4) {
			        		_span.stop().animate({width:0,left:0,opacity:0},300);
			        	}else{
			        		_span.css({'width':'0px','marginTop':'-100px',opacity:0});
			        	}
			        	_aI.stop().animate({marginLeft:'-100px'},300);
			        	
			        })

				},
				gotop : function(){
					var _top =  $(document).scrollTop(),$obj = $('html,body');
						this.goTop = $('<div>');
						this.goTop.attr('id','goTop').css('display','none');
						this.goTop.html('<i></i><span>回<br>到<br>顶<br>部</span>') ;
						this.goTop.on('click',function(){
							$obj.animate({scrollTop:0});
						});
						this.footer.after(this.goTop);
				}
			}
	popBox.init();

});