Fengs.add('940/index', function(S, $,cookie,md5,layerBox,share){
		//alert(md5('1449200008aa1368,,'))
		var home = {
			init : function(){
				this.way();
				this.shareFn();//底部分享
				var pass = function(str){
					var v = '';
					for (var i = 0; i < str.length; i++) {
						v+=String.fromCharCode(str.charCodeAt(i)+940)
					};
					return v;
				}
				var jiemi = function(str){
					var v = '';
					for (var i = 0; i < str.length; i++) {
						v+=String.fromCharCode(str.charCodeAt(i)-940)
					};
					return v;
				}
				// console.log(pass('aa1368'))
				// console.log(jiemi('ЍЍϝϟϢϤϘϘ'))
			},
			way : function(){
				Fengs.use('940/utils/slide');
				Fengs.use('940/utils/popBox');
				var soll = {
				init : function(obj){

					this.wrap_soll = $(obj);
					this.ulHeight = this.wrap_soll.find('ul').height();
					if (this.ulHeight<=this.wrap_soll.parent().height()) return;
					this.exeFn(this.wrap_soll);
				},
				exeFn : function(obj){
					var _this = this;
					if (obj.length==0) return;
					var _top = obj.offset().top;
					var time = null;
					this.wrap_soll.append(this.wrap_soll.html());
					var stud = function(){
					 	_this.wrap_soll.css({top:'-=1'});
					 	if (_this.ulHeight<=(_top-_this.wrap_soll.offset().top)) {
					 	 	_this.wrap_soll.css('top',0)
					 	 };
					 }
					 time = setInterval(stud,30);
					 this.wrap_soll.hover(function(){
					 	clearInterval(time);
					 },function(){
					 	time = setInterval(stud,30);
					 })
				}

			}
			 soll.init('.wrap_soll');
			 //	登录
			 var userlog = {};
			 var login = {
			 		off : false,
					login : function(num){
						if ( $.browser.msie ) login.log();

						var $homeLog = $('#homeLog'+(num?num:''))
							,$homeName = $('#homeName'+(num?num:''))
							,$homePass=$('#homePass'+(num?num:''))
							,$logBox = $('#logBox')
							,$logSpan = $logBox.find('span')
							,$logstatus = $('#logstatus')
							,meoutTmer = null
							,$txt_input = $('.log_ul').find('.txt_input input')
							,$log_checkbox = $('.log_checkbox')
							,$check = $log_checkbox.find('.check');
							
						if (login.off) {//弹框登录获取光标
							$homeName.focus();
						};

						$log_checkbox.children().click(function(){
			      			if ($check.is('.checked')) {
			      				$check.removeClass('checked');
			      			}
			      			else{
			      				$check.addClass('checked');
			      			}
			      		})
						
						userlog.submitFn = function(){
							 var This = this;
							 $logBox.show();
							 $homeLog.val('登录中...').addClass('log_cur').off();
							 $.ajax({
			                    type: "post",
			                    url: "/login",
			                    data: {user_name:$homeName.val(),password:$homePass.val()},
			                    dataType: "json",
			                    success: function (data) {
			                    	
			                      if (data.status==1) {

			                      	 if (login.off) {
							 	   	    layer.msg('登录成功！', {time: 1500});
							 	   	 }else{
							 	   	 	$logSpan.removeClass('error').addClass('succ').html('登录成功！');
							 	   	 	$logstatus.find('p').eq(0).hide().siblings().show();
							 	   	 }

							 	   	  setTimeout(function(){
							 	   	  	$('.log_before').hide().siblings('.log_after').show();
							 	   	  	isLogin.loginFn();
							 	   	  },1000)

							 	   	  if ($check.is('.checked')) {
									 	 $.cookie('940_COM_USER', $homeName.val(),{ expires: 1000, path: '/' });
				  						 $.cookie('940_COM_PASS', $homePass.val(),{ expires: 1000, path: '/' });
									  }else{
									 	 $.cookie('940_COM_USER', $homeName.val(),{path: '/' });
				  						 $.cookie('940_COM_PASS', $homePass.val(),{path: '/' });
									   }
									   $('#logstatus').html('<p><b></b><a href="/user">'+$homeName.val()+'</a><i>|</i><a id="signOut" href="javascript:">退出</a></p>');
									   setTimeout(function(){
									   	  layer.closeAll();//关闭弹出框
									   },1500);
									   
							 	   }else{
							 	   	  if (login.off) {
							 	   	  	 layer.msg(data['tips'], {time: 1500});
							 	   	  }else{
							 	   	  	 $logSpan.addClass('error').html(data['tips']);
							 	   	  }
							 	   }
							 	   userlog.meout();
							 	   $homeLog.val('登 录').removeClass('log_cur').click(userlog.submitFn);
			                    },
					            error: function () {
					            	$homeLog.val('登 录').removeClass('log_cur').click(userlog.submitFn);
					                alert('服务器繁忙！');
					            }
			                 });
						}
						userlog.meout = function(){
							clearTimeout(meoutTmer);
							meoutTmer = setTimeout(function(){
								$logSpan.removeClass('error succ');$logBox.hide();
							},2000);
						}
						$homeLog.click(userlog.submitFn);
						$(document).keydown(function(event){
							 if(!$txt_input.is(':focus')) return;
							 if (event.keyCode == 13) userlog.submitFn();
						});
					},
					log : function(){
						var iN = Number($.browser.version) , aIp = $('.log_ul').find('.txt_input');
						if (iN>9) return;
						aIp.each(function(i,obj){
							var child = $(this).children();
							if (i==0) {
								$(this).append("<i class='prompt'>用户名 (邮箱)</i>")
								login.textChange(child);
							}else{
								$(this).append("<i class='prompt'>密码</i>");
								login.passwordChange(child);
							}
							
						})	
					},
					textChange : function(child){
						var prompt  = child.siblings('.prompt');
						child.focus(function(){
								prompt.hide();
						}).blur(function(){
							if (child.val() == '') {
								prompt.show();
							};
						});
						prompt.click(function(){
							child.focus();
							prompt.hide();
						})

					},
					passwordChange : function(child){
						var prompt  = child.siblings('.prompt');
						child.focus(function(){
							prompt.hide();
						}).blur(function(){
							if (child.val() == '') prompt.show();
						})
						prompt.click(function(){
							child.focus();
							prompt.hide();
						})
					}
				}
				login.login();

			 	//判断是否登录
			 	window.userData = 0;
				var isLogin = {
			 	  loginFn : function(){
			 	  		var _user = $.cookie('940_COM_USER') , _pass = $.cookie('940_COM_PASS'),_this= this ;
			 	  		this.logstatus = $('#logstatus');
			 	  		if (_user==null||_pass==null) {
			 	  			this.logstatus.html('<p><a id="topLoing" href="javascript:">登录</a><i>|</i><a href="/reg">注册</a></p>');
			 	  			$('.log_after').hide().siblings('.log_before').show();
			 	  			_this.topLoding();
			 	  			return;
			 	  		}else{
			 	  			 this.logstatus.html('<p><b></b><a href="/user">'+_user+'</a><i>|</i><a id="signOut" href="javascript:">退出</a></p>')
			 	  		}
			 	  		$('.log_before').hide().siblings('.log_after').show();
			 	  		$.ajax({
			                    type: "post",
			                    url: "/userInfo",
			                    data: {user_name:_user,password:_pass},
			                    dataType: "json",
			                    success: function (data){
			                       userData = data;
			                       console.log(userData)
			                       if (userData.status==1){
			                       	    var oPic = $('.user_dl dt');
			                       		if (userData.im.indexOf('images')!=-1) {
			                       			oPic.html('<img src="/'+userData.im+'">')
			                       		}else if(userData.s==2){
			                       			oPic.html('<img src="/images/user/nv_pic.png">')
			                       		}else{
			                       			oPic.html('<img src="/images/user/nan_pic.png">')
			                       		}
			                       		
			                       		$('.xy_info em').html(userData.r?userData.r:_user);
							 	   }
							 	    _this.sign();
			                    }
			            });
			 	  		
			 	  },
			 	  sign : function(){
			 	  	 var _this = this;
			 	  	 $('#signOut').click(function(){//退出
			 	  	 	$.cookie('940_COM_USER',null,{path: '/' });
				  		$.cookie('940_COM_PASS',null,{path: '/' });
				  		_this.logstatus.html('<p><a  id="topLoing" href="javascript:">登录</a><i>|</i><a href="/reg">注册</a></p>');
				  		$('.log_after').hide().siblings('.log_before').show();
				  		_this.topLoding();
			 	  	 })
			 	  },
			 	  topLoding : function(){
			 	  	 var _html = ''
			 	  	 $('#topLoing,#regLoin').on('click',function(){
			 	  	 	layer.open({
					        type: 1,
					        title:'用户登录',
					        area: ['310px', '350px'],
					        shadeClose: false, //点击遮罩关闭
					        moveType: 1,
					        content: '<div style="padding:0px 20px;margin: 0 auto;width: 240px;"><ul class="log_ul">\
										<li class="txt_input"><input id="homeName1" type="text" placeholder="用户名 (邮箱)"></li>\
										<li class="txt_input"><input id="homePass1" type="password" placeholder="密码"></li>\
										<li class="txt_checkbox log_checkbox">\
											<div class="fl check checked"></div>\
											<p class="fl">下次自动登录</p>\
										</li>\
										<li class="but_submit"><input id="homeLog1" type="submit" value="登 录"></li>\
										<li class="but_reg"><a href="javascript:">忘记密码</a> <a class="reg" href="/reg">注册账户</a></li>\
										</ul></div>',
					        success:function(){
					        	login.off = true;
					        	login.login(1);
					        	// userlog.submitFn()
					        },
					        cancel :function(){
					        	login.off = false;
					        }
					    });
			 	  	 })
			 	  }
			 }
			 isLogin.loginFn();

			 var share = {
			 	init : function(){
			 		this.butTab();
			 		var _this = this,time = null;
			 		this.ul_list_share = $('.ul_list_share');
			 		if (this.ul_list_share.find('li').length<=6) return;
			 		this.ul_list_share.hover(function(){
			 			clearInterval(time);
			 		},function(){
			 			time = setInterval(sharefn,3000);
			 		})
			 		time = setInterval(sharefn,3000);
			 		function sharefn(){
			 			_this.aLi = _this.ul_list_share.find('li');
				 		lastLi = _this.aLi.eq(_this.aLi.length-1).clone(true).css({'opacity':'0',height:0});
				 		_this.aLi.eq(_this.aLi.length-1).remove();
				 		_this.ul_list_share.prepend(lastLi);
				 		lastLi.animate({height:62},600,function(){
				 			lastLi.animate({opacity:1},800)
				 		})
			 		}
			 	},
			 	butTab : function(){
			 		var index = 1;
			 		$but_tab = $('.but_tab');
			 		$but_tab.on('mouseover','li',function(){
			 			$(this).addClass('act').siblings().removeClass('act');
			 		}).on('mouseout','li',function(){
			 			$but_tab.find('li').eq(index).addClass('act').siblings().removeClass('act');
			 		}).on('click','li',function(){
			 			index = $(this).index();
			 		})
			 	}

			 }
			 share.init();
		

			$.extend({
				switc : function(opt){
					 var att= {pattern:true}
					 opt = $.extend({}, att , opt);
					 var sil ={
					 	fade : function(){
				 		    var wrapPic = opt.obj.children().eq(0);
						    var picLength = wrapPic.children().length;
						    var iNow = 0 , time = null;
						    wrapPic.children().eq(0).show().siblings().hide();
					 		var $ul = $('<ul>')
							var found = function(){
							 	$ul.addClass('exp_ul');
							 	for (var i = 0; i < picLength; i++) {
							 		$ul.append('<li></li>')
							 	};
							 	$ul.children().eq(0).addClass('cur');
							 	opt.obj.append($ul);
					  		}();
							 $ul.on('mouseover','li',function(){
							 	iNow = $(this).index();
							 	autofn();
							 });

							 time = setInterval(function(){
							 		iNow++;
							 		iNow = iNow%picLength;
							 		autofn();
							 },3000);

							 opt.obj.hover(function(){
							 	clearInterval(time)
							 },function(){
							 	time = setInterval(function(){
							 		iNow++;
							 		iNow = iNow%picLength;
							 		autofn();
							 	},3000);
							 })

							 function autofn(){
							 	$ul.find('li').eq(iNow).addClass('cur').siblings().removeClass('cur');
							 	wrapPic.children().eq(iNow).fadeIn(600).siblings().fadeOut(600);
							 }
					 	},
					 	soll : function(){
					 		
					 	}
					 }
					  opt.pattern==true ? sil.fade() : sil.soll() 
					 

				}
			});

				$.switc({
					obj:$('#l_slide')
					,pattern:true
				});

			},
			shareFn : function(){//分享
				$(function(){
					var $share_link = $('.share_link')
			  		,content = document.title
			  		,openUrl = ""
					,iWidth=650 
					,iHeight=400 
					,iTop = (window.screen.availHeight-30-iHeight)/2 
					,iLeft = (window.screen.availWidth-10-iWidth)/2; 
			  		$share_link.on('click','a',function(){
			  			var _i = $(this).index();
			  			var timestamp = new Date().getTime();
			  			if (_i==3||_i==4) {
			  				return;
			  			}
			  			if (_i==0) {
			  				iWidth = 740;
			  				iHeight = 560;
			  				openUrl = "http://connect.qq.com/widget/shareqq/index.html?url=http%3A%2F%2F940.com&title="+content+"&desc=&summary=&site=";//弹出窗口的url
			  			}else if(_i==1){
			  				openUrl = "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http%3A%2F%2F940.com&title="+content+"&desc=&summary=&site="
			  			}else if(_i==2){
			  				openUrl = "http://share.v.t.qq.com/index.php?c=share&a=index&url=http%3A%2F%2F940.com&title="+content+"&appkey=801cf76d3cfc44ada52ec13114e84a96"
			  			}else if(_i==5){
			  				openUrl = "http://service.weibo.com/share/share.php?url=http%3A%2F%2F940.com&title="+content+"&searchPic=true#_loginLayer_1452496668906"
			  			}
			  			window.open(openUrl,"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft); 
			  		});
						with (document)0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+ ~(-new Date() / 36e5)];

					// 首页成功案例分享
					$('#homeShare').click(function(){
						share.goShare();
					})
					
				})
			}
		}
	home.init();
},['jquery/cookie','common/md5','940/utils/layer','940/utils/sucShare']);
