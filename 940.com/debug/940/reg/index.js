 Fengs.add('940/reg/index', function(S, $){

 		 return {
		    regFn: function() {
		    	this.aInpt = $('#name,#password,#passwords,#validCode');
		    	this.aInpt.val('');
		    	if ( $.browser.msie && Number($.browser.version)<=9 ) this.pointtxt();
		    	
		      	var submit = false,codeOff = false;
		     	this.aInpt.blur(function() {
		      
		        switch (this.id) {
		        case "name":
		          vali.name($(this));
		          break;
		        case "password":
		          vali.password($(this));
		          break;
		        case "passwords":
		          vali.passwords($(this));
		          break;
		        case "validCode":
		          vali.validCode($(this));
		          break;
		        }
		      }).focus(function(){

		        	 if (this.id != 'password') return;
		      		 $(this).keyup(function(){
		      		 		var $this = $(this);
							var _r = checkPassword($this);
							var $stren = $this.siblings('.stren').show();
							$this.siblings('.cue').hide();
							if (_r == 1) {
								$stren.removeClass('st2 st3').addClass('st1');
							} else if (_r == 2) {
								$stren.removeClass('st1 st3').addClass('st2');
							} else if (_r == 3) {
								$stren.removeClass('st1 st2').addClass('st3');
							}
					});

					function checkPassword(pwdinput) {
						var off1, off2, off3, num, str = $(pwdinput).val(),len = str.length;
						if (len == 0) return 1;
						if (len > 12) { $(pwdinput).val(str.match(/.{12}/g)[0]); }

						off1 = /\d/.test(str);
						off2 = /[a-z]/.test(str);
						off3 = /\W|[A-Z]/.test(str);
						num = off1 + off2 + off3; 

						if (len < 6) { return 1; }
						if(len >= 6 && len <= 7){
							if (num == 1) return 1;
							if (num >= 2) return 2;
						}
						if (len > 7 && len <= 12) {
						 	if (num == 1) return 1;
						 	if (num == 2) return 2;
						 	if (num == 3) return 3;
						}
					}

		      })
 			  var $reg_checkbox = $('.reg_checkbox'), $check = $reg_checkbox.find('.check');
		      var vali = {
		      	name : function(obj){
		      		var val = obj.val() , sibl = obj.siblings('.cue');
		      		if (reg.Email.test(val)) {
		      			sibl.removeClass('error').addClass('correct');submit = true;
		      		}else{
		      			sibl.removeClass('correct').addClass('error');submit = false;
		      		}
		      	},
		      	password : function(obj){
		      		 var val = obj.val() , sibl = obj.siblings('.cue') ;
		      		 if (val.length<6||val.length>12) {
		      		 	obj.siblings('.stren').hide();
		      		 	sibl.show().removeClass('correct').addClass('error');
		      		 	submit = false;
		      		 	return false;
		      		 }
		      		 submit = true;
		      		 return true;
		      	},
		      	passwords : function(obj){
		      		var val1 = obj.val() , val2 = $('#password').val() ,sibl = obj.siblings('.cue');
		      		if (val1==val2&&this.password($('#password'))){
		      			sibl.removeClass('error').addClass('correct');submit = true;
		      		}
		      		else{
		      			sibl.removeClass('correct').addClass('error');submit = false;
		      		}
		      	},
		      	validCode : function(obj){
		      		var val = obj.val() , sibl = obj.siblings('.cue');
		      		if (!submit){ return;}
		      		$.getJSON('/checkCode?code='+val+'',function(data){
		      			if (data.status==1) {
		      				sibl.removeClass('error').addClass('correct');codeOff=true;
		      			}else{
		      				sibl.removeClass('correct').addClass('error');codeOff=false;
		      				$('.change_reg').siblings('img').attr('src','/code.jpeg?'+new Date().getTime())
		      			}
		      			
		      		})
		      	},
		      	Protocol : function(){
		      		$reg_checkbox.children().click(function(){
		      			if ($check.is('.checked')) {
		      				$check.removeClass('checked');
		      			}
		      			else{
		      				$check.addClass('checked');
		      			}
		      		})
		      	}()
		      	, Code : function(){
		      		$('.change_reg').click(function(){
		      			
		      			$(this).siblings('img').attr('src','/code.jpeg?'+new Date().getTime())
		      			codeOff = false;
		      		})
		      	}()
		           
		      }
		      // vali.Code()
		      // vali.Protocol()
		      var reg = {
		      		Email : /^[^\W|0]\w+@\w+(\.[a-z]{2,3}){1,2}$/
		      }

		      var regBox = $('#regBox span'),meoutTmer = null;
		      $('#submit').click(function(){
		      		$('#name,#password,#passwords,#validCode').blur();
		      		
		      		if (submit&&codeOff) {
		      			if (!$check.is('.checked')) {
		      			     meout().html('请勾选 版权声明 和 隐私保护 条款');
		      			}else{
		      			     submitSucc();
		      			}
		      		}

		      		
		      })

		      function submitSucc(){
		      			var _name = $('#name').val() ,_pass = $('#password').val();

		      			$.ajax({
		                    type: "post",
		                    url: "/register",
		                    data: {user_name:_name,password:_pass},
		                    dataType: "json",
		                    success: function (data) {
		                        if (data.status=='1') {
			      					regBox.removeClass('error').addClass('succ').html('注册成功，即将跳转到首页！');
			      					$.cookie('940_COM_USER', _name,{path: '/' });
				  					$.cookie('940_COM_PASS', _pass,{path: '/' });
			      					setTimeout(function(){
			      						window.location.href='/';
			      					},2000)
			      				}else{
			      					meout().html(data['tips']);
			      				}
			                }
		                });
		      		}
	      		function meout(){
					clearTimeout(meoutTmer);
					meoutTmer = setTimeout(function(){
						regBox.removeClass('error succ');
					},2000);
					return regBox.addClass('error');
				}

		 
		  },
		  pointtxt : function(){
		  		var aLi = $('.reg_ul').find('.li_input');
		  		var poinArr = ['用户名 (邮箱)','设置密码 (6-12位)','确认密码','请输入图片中的验证码'];

		  		for (var i = 0; i < aLi.length; i++) {
		  			aLi.eq(i).append("<font class='point'>"+poinArr[i]+"</font>");
		  		};
		  		aLi.find('.point').click(function(){
		  			$(this).siblings('input').focus();
		  		})
		  		this.aInpt.focus(function(){
		  			var v = $(this).val();
		  			if (v=='') {
		  				$(this).siblings('.point').hide();
		  			}
		  		}).blur(function(){
		  			var v = $(this).val();
		  			if (v=='') {
		  				$(this).siblings('.point').show();
		  			}
		  		})
		  } 

		  
		}  
},['jquery/cookie'])