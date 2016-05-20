 Fengs.add('940/user/user', function(S, $){
 		return {
 			init : function(){
 				this.eventFn();
 				this.changeHash();
 				this.revise();
				this.allData = {}; //存储用户信息		
 				 var _user = $.cookie('940_COM_USER') , _pass = $.cookie('940_COM_PASS');
 				 if (_user==null||_pass==null) {
 				 	setTimeout(function(){
 				 		layer.msg('你好，请先登录！',{time:2000});
 				 		setTimeout(function(){
 				 			window.location.href = '/';
 				 		},1500)
 				 	},50)
 				 }
 			},
 			revise : function(){//修改资料
 				var $edit_ul = $('#edit_ul'),$sex_inp = $('.sex_inp'),This = this;
 				this.uesrData = {
 					 
 				};//用户信息
 				this.nameOff = false;//判断第一次姓名
 				$edit_ul.on('click','.revise_inp a',function(){
 					var $parent = $(this).parent();
 					var _html = $parent.html();
 					$parent.html("<input id='txtInp' class='xg_txt' type='text' />");
 					$('#txtInp').focus().blur(function(){
 						$parent.html(_html)
 						if (this.value!='') {
 							$parent.children('i').html(this.value);
 							$parent.children('a').html('（修改）');
 							var isInp = $parent.children('a').data('v');
 							if (isInp=='name') {
 								This.uesrData.realname = this.value;
 								This.nameOff = true;
 							}else if(isInp=='qq'){
 								This.uesrData.qq  = this.value;
 							}else if(isInp=='yy'){
 								This.uesrData.yy  = this.value;
 							}
 						};
 					})
 				});

 				$sex_inp.on('click','p',function(){
 					var $this = $(this), _index = $this.index();
 					if (_index==0) {
 						$this.find('i').addClass('icon_nan_act');
 						$this.siblings('p').find('i').removeClass('icon_nv_act');
 						This.uesrData.gender = 1;//男
 					}else{
 						$this.find('i').addClass('icon_nv_act');
 						$this.siblings('p').find('i').removeClass('icon_nan_act');
 						This.uesrData.gender = 2;//女
 					}
 					$('#sexVal').val(_index)
 				});

 				var selectHtml = '<div class="select_ui"><div class="select_arrow"></div><div class="select_text_ui" style="min-width: 2.5em;">北京</div><select class="province" required="true" name="birthday_year"></select></div><div class="select_ui"><div class="select_arrow"></div><div class="select_text_ui" style="min-width: 2.5em;">西城</div><select class="city" required="true" name="birthday_year"></select></div>';
 				var $selectList = $(".selectList");
 				$selectList.on('click','.dq',function(){
 					var $parent = $(this).parent();
 					var _html = $parent.html();
 					$parent.html(selectHtml);
 					var url = "/static/user/area.json";
		            var areaJson;
		            var temp_html;
		            var oProvince = $selectList.find(".province");
		            var oCity = $selectList.find(".city");
		            //初始化省
		            var province = function(){
		                $.each(areaJson,function(i,province){
		                    temp_html+="<option value='"+province.p+"'>"+province.p+"</option>";
		                });
		                oProvince.html(temp_html);
		                oProvince.siblings('.select_text_ui').html(oProvince.val())
		                city();
		            };
		            
		            //赋值市
		            var city = function(){
		                temp_html = ""; 
		                var n = oProvince.get(0).selectedIndex;
		                $.each(areaJson[n].c,function(i,city){
		                    temp_html+="<option value='"+city+"'>"+city+"</option>";
		                });
		                oCity.html(temp_html);
		                oCity.siblings('.select_text_ui').html(oCity.val())
		                
		            };
		          
		            //选择省改变市
		            oProvince.change(function(){
		            	oProvince.siblings('.select_text_ui').html(oProvince.val())
		                city();
		            	This.uesrData.address  = oProvince.val()+'-'+oCity.val();
		            });
		            oCity.change(function(){
		            	oCity.siblings('.select_text_ui').html(oCity.val());
		            	This.uesrData.address  = oProvince.val()+'-'+oCity.val();
		            });
		          	
		            //获取json数据
		             $.getJSON(url,function(data){
		                 areaJson = data;
		                 province();
		             });
 				});
 				this.upImg();
 				this.changeUserData();

 			},
 			upImg : function(){//头像上传
 				var This = this;
				$.fn.extend({
				    uploadPreview: function (opts) {
				        var _self = this,
				            _this = $(this);
				        opts = jQuery.extend({
				            Img: "imghead",
				            Width: 120,
				            Height: 120,
				            ImgType: ["gif", "jpeg", "jpg", "bmp", "png"]
				        }, opts || {});
				        _self.getObjectURL = function (file) {
				            var url = null;
				            if (window.createObjectURL != undefined) {
				                url = window.createObjectURL(file)
				            } else if (window.URL != undefined) {
				                url = window.URL.createObjectURL(file)
				            } else if (window.webkitURL != undefined) {
				                url = window.webkitURL.createObjectURL(file)
				            }
				            return url
				        };
				        _this.change(function () {

				            if (this.value) {
				                if (!RegExp("\.(" + opts.ImgType.join("|") + ")$", "i").test(this.value.toLowerCase())) {
				                    // layer.msg("选择文件错误,图片类型必须是" + opts.ImgType.join("，") + "中的一种",{time:2000});
				                    layer.msg("不支持该文件上传！",{time:2000});
				                    this.value = "";
				                    return false
				                }
				                if ((this.files[0].size / 1024).toFixed(2)>=150) {
				                	layer.msg("上传头像不能超过150KB！",{time:2500});
				                	return;
				                };
				                if ($.browser.msie) {
				                    try {
				                        $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
				                    } catch (e) {
				                        var src = "";
				                        var obj = $("#" + opts.Img);
				                        var up_img = obj.parent(".up_img")[0];
				                        _self.select();
				                        if (top != self) {
				                            window.parent.document.body.focus()
				                        } else {
				                            _self.blur()
				                        }
				                        src = document.selection.createRange().text;
				                        document.selection.empty();
				                        obj.hide();
				                        obj.parent(".up_img").css({
				                            'filter': 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)',
				                            'width': opts.Width + 'px',
				                            'height': opts.Height + 'px'
				                        });
				                        up_img.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = src
				                    }
				                } else {

				                     $("#" + opts.Img).attr('src', _self.getObjectURL(this.files[0]))
				                     $("#" + opts.Img).css({width:opts.Width,height:opts.Height})

				                }
				                opts.Callback()
				            }

				        })
				    }
				});
				$("#fileImg").uploadPreview({ Img: "imghead", Width: 120, Height: 120,Callback: function () {
				        		var r = /<[^>]*>/g
				        		uploadForm = $("#uploadForm").attr('action','/upload?id_good='+This.allData.id_good)
				        		,success = function(d){
				        			if (d.status==1) {
				        				This.uesrData['profile'] = d.file_url
								 		console.log(d.file_url)
								 	};
				        		}
				        		$('#uploadForm').off().submit();
								$("#iframe").off().load(function(){
									try{
										var d = $.parseJSON(this.contentWindow.document.body.innerHTML.replace(r,''));
										success(d);
									}catch(e){};
								});
				            }
				});

 			},
 			eventFn : function(){
 				var _this = this;
 				this.user_tabUl = $('.user_tabUl');
 				this.index = 0 ;
 				this.user_tabUl.on('click','li',function(){
 					var _index = $(this).index();
 					//var  _hash = window.location.hash.substring(1)||'n=0';
 					//if (/n=(\d)/.exec(_hash)[1]==_index) return;
 					window.location.hash = 'n='+_index
 					_this.changeHash();
 				});

 				//消息按钮点击
 				$('#a_dope').on('click',function(){
 					window.location.hash = 'n=0&b=0';
 					_this.changeHash();
 				});
 				//建议按钮点击
 				$('#a_advise').on('click',function(){
 					window.location.hash = 'n=0&b=1';
 					_this.changeHash();
 				});
 				$('#edit').on('click',function(){
 					window.location.hash = 'n=0';
 					_this.changeHash();
 				})
 				localStorage.removeItem("n=0");//刷新清除本地数据
				localStorage.removeItem("n=1");
				localStorage.removeItem("b");
 			},
 			changeHash : function(){
 				var uri = new S.parseUri(window.location.href,"#");
 				var h = {
 					 n : uri.n ||'0'
 					,b : uri.b
 					,id : uri.id || 1 //公告id
 				}

 				var  _hash = window.location.hash.substring(1)||'n=0';
 				var _this = this;
 				var $wrap_list = $('#wrap_list');
 				// var nArr = /n=(\d)/.exec(_hash);
 				// var bArr = /b=(\d)/.exec(_hash);
 				
 				$wrap_list.html('');
				this.user_tabUl.find('li').eq(h.n).addClass('act').siblings().removeClass('act');
				var list = {//建议和消息
					tab1 : function(){
						var qqFaceFn = function(){
							if (h.b==1) {//建议
								$('html,body').animate({scrollTop:400});
							};
							$('.emotion').qqFace({
							 	id : 'facebox', //表情盒子的ID
							 	assign:'saytext', //给那个控件赋值
							 	path:'/images/face/'	//表情存放的路径
							 });
							 $(".sub_btn").click(function(){
							 	var str = $("#saytext").val();
							 	$("#show").html(replace_em(str));
							 });
							 function replace_em(str){
							 	str = str.replace(/\</g,'&lt;');
							 	str = str.replace(/\>/g,'&gt;');
							 	str = str.replace(/\n/g,'<br/>');
							 	str = str.replace(/\[em_([0-9]*)\]/g,'<img src="/images/face/$1.gif" border="0" />');
							 	return str;
							 }
						}
						if (window.localStorage) {
							if (localStorage.getItem("b")!=null) {//获取本地页面

								$wrap_list.html(localStorage.getItem("b"));
								qqFaceFn();
								return;
							};	
						};

						$wrap_list.load('/user/news1.html?100',function(d){
							localStorage.setItem("b",d);
							qqFaceFn();

							// 计算字数
			 				 var $emTxt = $('.biaoqing').find('em'),txtNum = 2000;//分享字数
				             $('.textarea').on('input propertychange', function() {
				               		var len = $(this).val().replace(/\s+/g,'').length;
				               		if (len>txtNum) {
				               			$(this).val($(this).val().substring(0,txtNum))
				               		}else{
				               			$emTxt.html(txtNum - len)
				               		}
							 }).trigger('input').trigger('propertychange'); 
						});


					}
				}
							
				
 				switch(h.n){   
					case "0": 
						
						if (!!h.b) {//建议和消息
							list.tab1();
						}else{//个人信息
							if (window.localStorage) {
								if (localStorage.getItem("n=0")!=null) {//获取本地页面
									$wrap_list.html(localStorage.getItem("n=0"));
									_this.revise();
									return;
								};	
							};
							$wrap_list.load('/user/data_page.html?'+new Date().getTime(),function(d){
									_this.getUserData();
									_this.revise();
									
							});
						}

					    break;    
					case "1": //我的课表

						var argsFn = function(){

							var studyFn = function(){

							}()

							//课表页页码
							Fengs.use('940/user/course', function(d){
								 var args = {
								 	pageCount : 5,
								 	current : 1,
								 	backFn : function(n){}
								 };
								 d.init($('.tcdPageCode'),args);
						
	 						});
						}
						

						if (window.localStorage) {
							if (localStorage.getItem("n=1")!=null) {//获取本地页面
								$wrap_list.html(localStorage.getItem("n=1"));
								argsFn();
								return;
							};	
						};

						$wrap_list.load('/user/course1.html',function(d){
							localStorage.setItem("n=1",d);
							argsFn();
						})
					  break; 

					case "2": 
						// $wrap_list.load('/user/gonggao.html',function(d){
						// });

 						var gonggao = function(id){
 							$wrap_list.html('');
 							$.get('/noticeInfo?id='+id,function(data){
							var d = $.parseJSON(data);
							console.log(d)
							if (d.status==1) {
							var t = d.notice;//当前公告
							var l = d.last;//上一条公告
							var n = d.next;//下一条公告
							var str = '<div class="gonggao"><h1>'+t['title']+'</h1><strong>亲爱的互联支付用户：</strong><p>'+t['content']+'</p><div class="right">'+t['author']+'<br>'+t['time']+'</div><div class="left"><p>上一条：<a href="javascript:" class="last">'+(l['title']?l['title']:'没有了')+'</a></p><p>下一条：<a href="javascript:" class="next">'+(n['title']?n['title']:'没有了')+'</a></p></div></div>';
								$wrap_list.html(str);
							}else{
								$wrap_list.html('服务器请求失败，请稍后再试！');
							}
							$wrap_list.off().on('click','.next',function(){
								if (!n['title']) return;
								gonggao(n['id']);
								$('body,html').scrollTop(0);
							}).on('click','.last',function(){
								if (!l['title']) return;
								gonggao(l['id']);
								$('body,html').scrollTop(0);
							})
						  })
 						}
 						gonggao(h.id);
					 	break;    
				}

 			},
 			changeUserData : function(){

 				var _user = $.cookie('940_COM_USER') , _pass = $.cookie('940_COM_PASS');
 				// 修改密码
 				var passHtml = '';
 				$('.modify_pass').on('click','a',function(){
						layer.open({
					        type: 1,
					        title:'修改登录密码',
					        area: ['500px', '290px'],
					        shadeClose: false, //点击遮罩关闭
					        moveType: 1,
					        content: function(){
				        		if (!passHtml) {
							   	 	var $modify_pass = $('#modify_pass');
							   	 	passHtml = $modify_pass.html();
							   	 	$modify_pass.remove();
						   	 	};
						   	 	return passHtml;
					        }(),
					        success:function(){
					        	modify.modify_pass();
					        },
					        end:function(){
					        	$(document).off('keydown');
					        }
					    });						
 				});
 				// 绑定手机
 				var bindHtml = '';
 				$('.bind_phone').on('click','a',function(){
 					layer.open({
					        type: 1,
					        title:'绑定手机',
					        area: ['500px', '250px'],
					        shadeClose: false, //点击遮罩关闭
					        moveType: 1,
					        content: function(){
				        		if (!bindHtml) {
							   	 	var $bind_phone = $('#bind_phone');
							   	 	bindHtml = $bind_phone.html();
							   	 	$bind_phone.remove();
						   	 	};
						   	 	return bindHtml;
					        }(),
					        success:function(){
					        	modify.bind_phone();
					        },
					        end:function(){
					        	$(document).off('keydown');
					        }
					    });
 				});
 				// 解绑手机
 				var unHtml = '';
 				$('.un_phone').on('click','a',function(){
 					layer.open({
					        type: 1,
					        title:'解绑手机',
					        area: ['500px', '250px'],
					        shadeClose: false, //点击遮罩关闭
					        moveType: 1,
					        content: function(){
				        		if (!unHtml) {
							   	 	var $un_phone = $('#un_phone');
							   	 	unHtml = $un_phone.html();
							   	 	$un_phone.remove();
						   	 	};
						   	 	return unHtml;
					        }(),
					        success:function(){
					        	modify.un_phone();
					        },
					        end:function(){
					        	$(document).off('keydown');
					        }
					    });
 				});
 				// 修改名字
 				var nameHtml = '';
 				$('.li_name').on('click','.modify_name a',function(){
 					if (!$('.bind_phone').is(":hidden")) {
 						layer.msg('请先绑定手机号码！',{time:2000});
 						return;
 					};
 					layer.open({
					        type: 1,
					        title:'修改姓名',
					        area: ['500px', '300px'],
					        shadeClose: false, //点击遮罩关闭
					        moveType: 1,
					        content: function(){
				        		if (!nameHtml) {
							   	 	var $modify_name = $('#modify_name');
							   	 	nameHtml = $modify_name.html();
							   	 	$modify_name.remove();
						   	 	};
						   	 	return nameHtml;
					        }(),
					        success:function(){
					        	modify.modify_name();
					        },
					        end:function(){
					        	$(document).off('keydown');
					        }
					    });
 				});

 				// 保存/修改资料
 				var This = this;
 				$('#saveUserInfo').click(function(){
 					This.uesrData.user_name = _user;
 					This.uesrData.password = _pass;

 					if (This.nameOff) {
 						layer.msg('请填写姓名！',{time:2000});
 					};
 					layer.load();
					$.post('/saveUserInfo',This.uesrData,function(data){
						var d = $.parseJSON(data);
						layer.closeAll('loading');
						console.log(d.sududa)
						if (d.sududa.status==1) {
							layer.msg('资料修改成功！', {icon: 1});
							setTimeout(function(){
								window.location.reload();
							},1500);
						}
					})
					console.log(This.uesrData)
 					
 				})

 				var modify = {
 					// 修改密码
 					modify_pass : function(){
 						var $wrapPass = $('.wrapPass');
 						var oldPass = $wrapPass.find('li:eq(0)').find('input').focus();
 						var newPass = $wrapPass.find('li:eq(1)').find('input');
 						var twoPass = $wrapPass.find('li:eq(2)').find('input');
						// 修改密码提交
						var $pass_but = $('.pass_but');
						$pass_but.click(function(){
							if (oldPass.val()=='') {
								layer.msg('请输入旧密码！',{time:1500});
								oldPass.focus();
							}else if(newPass.val()==''){
								layer.msg('请输入新密码！',{time:1500});
								newPass.focus();
							}else if(twoPass.val()!=newPass.val()){
								layer.msg('两次密码不一致！',{time:1500});
								twoPass.focus();
							}else if (newPass.val().length<6||newPass.val().length>12) {
								layer.msg('新密码长度为6~12位！',{time:2000});
							}else if (oldPass.val()!=_pass) {
								layer.msg('登录密码错误！',{time:1500});
							}else{
								layer.load();
								$.post('/updatePassword',{user_name:_user,new_password:newPass.val(),password:_pass},function(data){
										var d = $.parseJSON(data);
										layer.closeAll('loading');
										if (d.status==1) {
 											layer.msg('密码修改成功！', {icon: 1});
 											$.cookie('940_COM_PASS',newPass.val(),{path: '/' });
 											setTimeout(function(){
		 										window.location.reload();
		 									},1500);
										}else{
											layer.msg('服务器出错，请稍候再试！',{time:1500});
										}
										
 								});
							}
						});
	 					$(document).keydown(function(ev){
 							if (ev.keyCode == 13){
				              $pass_but.trigger('click');
				           	}
	 					})
					   
 					},
 					un_phone : function(){
 						var $un_but = $('.un_but')
 						,$un_code = $('.un_code')
 						,time = null
 						,num = 60
 						// 发送验证码
 						$un_but.click(function(){
 							if (num!=60) return;
 							var _phone = $(this).siblings('span').data('phone');
 							layer.load();
 							$.post('/getPhoneCode',{user_name:_user,password:_pass},function(data){
 								layer.closeAll('loading');
 								var d = $.parseJSON(data);
 								if (d.status==1) {
 									$un_but.val(num+'后可重新发送');
		 							var time = setInterval(function(){
										num--;
										$un_but.val(num+'后可重新发送');
										if (num==1) {
											clearInterval(time);
											num = 60;
											$un_but.val('点此获取验证码')
										};
		 							},1000);
 								}else{
 									layer.msg('发送失败，请稍后再试！',{time:1500});
 								}
 							});
 							
 							
 						});
 						//提交
 						var $unBut = $('.unBut')
 						$unBut.click(function(){
 							if($un_code.val()==''){
 								layer.msg('请输入验证码！',{time:1500});
 								$un_code.focus();
 								return;
 							}
 							layer.load();
 							$.post('/unBindPhone',{user_name:_user,code:$un_code.val()},function(data){
 								var d = $.parseJSON(data);
 								layer.closeAll('loading');
 								if (d.status==1) {
 									layer.msg('解绑成功！', {icon: 1});
 									setTimeout(function(){
 										window.location.reload();
 									},1500);
 								}else{
 									layer.msg('验证码有误！',{time:1500});
 								}
 								
 							});

 						});
 						$(document).keydown(function(ev){
 							if (ev.keyCode == 13){
				              $unBut.trigger('click');
				           	}
	 					})
 					},
 					bind_phone : function(){
 						var $bind_but = $('.bind_but')
 						,$bind_code = $('.bind_code')
 						,time = null
 						,num = 60
 						,This = this
 						,_phone = $bind_but.siblings('span').find('input').focus()
 						,isPhone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
 						// 获取验证码
 						$bind_but.click(function(){
 							if (num!=60) return;
 							if (isPhone.test(_phone.val())) {
 								layer.load();
 								$.post('/getPhoneCode',{user_name:_user,password:_pass,phone:_phone.val()},function(data){
 									layer.closeAll('loading');
 									var d = $.parseJSON(data);
 									if (d.status==1) {
		 								$bind_but.val(num+'后可重新发送');
		 								var time = setInterval(function(){
		 									num--;
		 									$bind_but.val(num+'后可重新发送');
		 									if (num==1) {
		 										clearInterval(time);
		 										num = 60;
		 										$bind_but.val('点此获取验证码')
		 									};
		 								},1000)
	 								}else{
	 									layer.msg('发送失败，请稍后再试！',{time:1500});
	 								}
 							     });
 								
 							}else{
 								layer.msg('手机号有误！',{time:1500});
 								_phone.focus();
 							}
 						});

 						// 提交
 						var $bindBut = $('.bindBut');
 						$bindBut.click(function(){

 							if (!isPhone.test(_phone.val())) {
 								layer.msg('手机号有误！',{time:1500});
 								_phone.focus();
 								return;
 							}else if($bind_code.val()==''){
 								layer.msg('请输入验证码！',{time:1500});
 								$bind_code.focus();
 								return;
 							}
 							layer.load();
 							$.post('/bindPhone',{user_name:_user,code:$bind_code.val(),phone:_phone.val()},function(data){
 								var d = $.parseJSON(data);
 								layer.closeAll('loading');
 								if (d.status==1) {
 									layer.msg('绑定成功！', {icon: 1});
 									setTimeout(function(){
 										window.location.reload();
 									},1500);
 								}else{
 									layer.msg('验证码有误！',{time:1500});
 								}
 								
 							});
 						});
 						$(document).keydown(function(ev){
 							if (ev.keyCode == 13){
				              $bindBut.trigger('click');
				           	}
	 					})
 						
 					},
 					modify_name : function(){
 						var $mod_name = $('.mod_name').focus();
 						var $name_but = $('.name_but')
 						,$name_code = $('.name_code')
 						,time = null
 						,num = 60
 						$name_but.click(function(){
 							if (num!=60) return;
 							if ($mod_name.val().length<1) {
 								layer.msg('请输入姓名！',{time:1500});
 								$mod_name.focus();
 								return;
 							};
 							var _phone = $(this).siblings('span').data('phone');
 							layer.load();
 							$.post('/getPhoneCode',{user_name:_user,password:_pass},function(data){
 								layer.closeAll('loading');
 								var d = $.parseJSON(data);
 								if (d.status==1) {
 									$name_but.val(num+'后可重新发送');
		 							var time = setInterval(function(){
										num--;
										$name_but.val(num+'后可重新发送');
										if (num==1) {
											clearInterval(time);
											num = 60;
											$name_but.val('点此获取验证码')
										};
		 							},1000);
 								}else{
 									layer.msg('发送失败，请稍后再试！',{time:1500});
 								}
 							});
 							
 						});
 						// 修改姓名提交
 						var $nameBut = $('.nameBut');
 						$nameBut.click(function(){
 							if ($mod_name.val()=='') {
 								layer.msg('请输入姓名！',{time:1500});
 								return;
 							}else if($name_code.val()==''){
 								layer.msg('请输入验证码！',{time:1500});
 								return;
 							}
 							layer.load();
 							$.post('/updateRealName',{user_name:_user,code:$name_code.val(),new_name:$mod_name.val()},function(data){
 								var d = $.parseJSON(data);
 								layer.closeAll('loading');
 								if (d.sududa.status==1) {
 									layer.msg('修改成功！', {icon: 1});
 									setTimeout(function(){
 										window.location.reload();
 									},1500);
 								}else{
 									layer.msg('验证码有误！',{time:1500});
 								}
 								
 							});
 						});
 						$(document).keydown(function(ev){
 							if (ev.keyCode == 13){
				              $nameBut.trigger('click');
				           	}
	 					})
						
 					},

 					code : function(phone){//手机获取验证码
 						// $bind_code.blur(function(){
 						// 	var $this = $(this);
 						// 	var _val = $this.val();
 						// 	if (_val=='') {
 						// 	    $this.parent().siblings('.tips').show().addClass('error').removeClass('correct');
 						// 	}else{
 								
 						// 	}
 						// })
 					}

 				}
 			},
 			getUserData : function(){
 				// 获取用户信息
 				// this.uesrDta = {};
 				var This = this;
				var _user = $.cookie('940_COM_USER') , _pass = $.cookie('940_COM_PASS');
				var $edit_ul = $('#edit_ul')
					,$li_email = $edit_ul.find('.li_email')
					,$li_name = $edit_ul.find('.li_name')
					,$li_sex = $edit_ul.find('.li_sex')
					,$li_phone = $edit_ul.find('.li_phone')
					,$li_qq = $edit_ul.find('.li_qq')
					,$li_yy = $edit_ul.find('.li_yy')
					,$li_area = $edit_ul.find('.li_area')
					,$li_url = $edit_ul.find('.li_url')
					,$user_info = $('.user_info p')
					,$user_li = $('.user_ul li')
					,$acc_data = $('#acc_data')
					,$acc_grade = $('#acc_grade')
					,$u_name = $('#u_name')
					,$pro = $('.user_dl dt img')
					,$imghead = $('#imghead')

				$.post('/userInfo?user_name='+_user+'&password='+_pass,function(data){
			 		var d = $.parseJSON(data);
			 		var dataLod = 0;
			 		console.log(d)
				 		if (d.status==-9) {
				 			return;
				 		};
				 		This.uesrData = {
				 			 user_name:_user //账户
				 			,password:_pass //账户密码
				 			,qq:d.q //QQ
				 			,yy:d.yy //yy
				 			,gender:d.s //性别
				 			,profile:d.im //头像地址
				 			,address:d.a //地区
				 		}
				 		This.allData = {
				 			 user_name:_user //账户
				 			,password:_pass //账户密码
				 			,qq:d.q //QQ
				 			,yy:'1' //yy
				 			,gender:d.s //性别
				 			,profile:'' //头像地址
				 			,address:d.a //地区
				 			,id_good:d.o
				 		}
				 		// 头像
				 		if (d.s==2) {
				 			$pro.attr('src',!d.im?'/images/user/nv_pic.png':'/'+d.im);
				 		}else{
				 			$pro.attr('src',!d.im?'/images/user/nan_pic.png':'/'+d.im);
				 		}
				 		// 上传的头像
				 		if (d.s==2) {
				 			$imghead.attr('src',!d.im?'/images/user/up_give_nv.png':'/'+d.im);
				 		}else{
				 			$imghead.attr('src',!d.im?'/images/user/up_give_nan.png':'/'+d.im);
				 		}
				 		// $pro.attr('src','/'+d.im)
				 		// 信息完整度
				 		if (d.r) {
				 			dataLod+=14;
				 		}
				 		if(d.s==1||d.s==2){
				 			dataLod+=14;
				 		}
				 		if(d.z){
				 			dataLod+=14;
				 		}
				 		if(d.q){
				 			dataLod+=14;
				 		}
				 		if(d.yy){
				 			dataLod+=14;
				 		}
				 		if(d.a){
				 			dataLod+=14;
				 		}
				 		if(d.im){
				 			dataLod+=14;
				 		}
				 		if (dataLod>84) {
							dataLod=100;
				 		};
				 		$acc_data.find('font').html(dataLod+'%');
				 		$acc_data.find('span i').css({width:dataLod+'%'});


				 		$user_info.eq(0).html(d.u);
				 		$user_info.eq(1).html('学员：'+d.r);
				 		$user_info.eq(2).html('编号：'+d.o);
				 		$user_li.eq(0).find('span').html(phone(d.z))
				 		$user_li.eq(1).find('span').html(d.q)
				 		//账户
				 		$li_email.find('i').html(d.u);
				 		//姓名
				 		$li_name.find('i').html(function(){
				 			var $item = $(this).parents('.item');
				 			if (!d.r) {
				 				$item.addClass('revise_inp');
				 				$(this).css('color','#999').siblings('a').html('（填写）');
				 				$u_name.find('i').html('学员：'+940)
				 				return '您还未填写姓名';
				 			};
				 			$item.addClass('modify_name');
				 			$u_name.find('i').html('学员：'+d.r)
				 			return d.r;
				 		});
				 		//性别
				 		if (d.s==1) {
				 			$li_sex.find('p:eq(0) i').addClass('icon_nan_act')
				 		}else if(d.s==2){
				 			$li_sex.find('p:eq(1) i').addClass('icon_nv_act')
				 		}
				 		// 手机
				 		if (!isNaN(parseInt(d.z))) {
				 			$li_phone.find('.item').eq(0).show().find('i').html(phone(d.z)) //已绑定
				 			$('.wrapPhone .m span').html(phone(d.z)).attr('data-phone',d.z);
				 			$acc_grade.find('.a_span i').addClass('yellow');
				 			$acc_grade.find('font').html('高')
				 		}else{
				 			$li_phone.find('.item').eq(1).show().siblings('.item').hide() //未绑定
				 		}
				 		//qq
				 		$li_qq.find('i').html(function(){
				 			if (!d.q) {
				 				$(this).css('color','#999').siblings('a').html('（填写）');;
				 				return '还未填写QQ'
				 			};
				 			return d.q;

				 		});
				 		//yy
				 		$li_yy.find('i').html(function(){
				 			if (!d.yy) {
				 				$(this).css('color','#999').siblings('a').html('（填写）');;
				 				return '还未填写yy'
				 			};
				 			return d.yy;
				 		})
				 		//地区
				 		$li_area.find('i').html(function(){
				 			if (!d.a) {
				 				$(this).css('color','#999').siblings('a').html('（选择）');;
				 				return '还未选择地区'
				 			};
				 			return d.a;
				 		});
				 		// 头像
				 		// $li_url.find('img')
				 		localStorage.setItem("n=0",$('#wrap_list').html())
			 		
			 	})
				
				function phone(m){
					if (!isNaN(parseInt(m))) {
						return m.substring(0,3)+"****"+m.substring(7,11);
					};
				}
 			}

 		}
 },['940/user/qqFace','940/utils/layer','jquery/cookie'])