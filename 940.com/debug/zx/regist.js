Fengs.add('zx/regist', function(S, $, TEMPLATE, REQ, Ripples, UI, COOKIE, formCheck, LOGINED, EASING, LAB){
	if(LOGINED.init()){
		return window.location.href = '/';
	};
	var W = window
		, $wrap = $('.log-wrap')
		, currentPanel = null
		, cookieConfig = {'path': '/', 'expires': 365}
		, fromUrl;						//来路页面
	var Storage = {
		list:new Array(),
		init:function(){
			try{
				var l = localStorage.getItem("username");
				this.list = l.split("|");
			}catch(e){};
		},
		addnew:function(n,r,p){
			for(var i = 0; i < this.list.length; i++){
				if(this.list[i].split(",")[0] == n){
					this.list.splice(i,1);
					this.list.unshift(n+","+r+","+p);
					localStorage.setItem("username",this.list.join("|"));
					return;
				};
			};
			this.list.push(n+","+r+","+p);
			localStorage.setItem("username",this.list.join("|"));
		},
		get:function(n,hand){
			for(var i = 0; i < this.list.length; i++){
				if(this.list[i].split(",")[0] == n){
					switch(hand){
						case 0:
							this.list.splice(i,1);
							localStorage.setItem("username",this.list.join("|"));
							break;
						default:
							return this.list[i].split(",");
							break;
					};
				};
			};
		}
	};
	var _fotgotUsername = ''		//找回密码的用户名
		, _sendChannel = 0;			//短信渠道
	//验证回调方法
	var checkCallback = function($el, status, tips){
		if(!status){
			var $tips = $el.parent().find('.err-tips');
			if($tips.length == 0){
				$el.parent().addClass('error').append('<div class="err-tips">'+ tips +'</div>');
			}else{
				$tips.text(tips);
			}
		}
	};
	//页面事件
	var pageForm = $('.form-box', $wrap)
		, pageRender = function($form, type){
			var content = $('#'+ type +'Temp').html();
			if(type == 'login'){
				Storage.init();
				var list = [];
				Storage.list.forEach(function(e){
					list.push(e.split(',')[0]);
				})
				var render = TEMPLATE.compile(content);
				content = render({'users': list});
			};
			$form.html(content);
			pageForm = $form;
			if(type == 'login'){
				$form.find('select').each(function(){
					this.delCallback = function(name){
						Storage.get(name, 0)
					}
				});
				$form.find('#password').keyup(function(e){
					e = e || W.event;
					var currKey = e.keyCode || e.which || e.charCode;
					if(currKey == "13"){
						$form.find('.btn-login').trigger('click');
					};
				});
			};
			$form.loadui();
		}
		, pageSwitch = function(type){
			var $form = pageForm
				, index = $.inArray(type, ['login','regist','forgot']);
			if(index < 0){
				index = 0;
				type = 'login';
			};
			if(currentPanel != index && currentPanel !== null){
				var $form2 = $('<div class="form-box" style="top: '+ (index > currentPanel ? 800 : -800) +'px;"></div>');
				$form.animate({'top': (index > currentPanel ? -800 : 800)}, 400, 'easeInOutExpo', function(){
					$form.hide();
					currentPanel = index;
				});
				$wrap.append($form2);
				$form2.animate({top: '50%'}, 600, 'easeInOutExpo',function(){
					pageRender($form2, type);
				});
			}else{
				currentPanel = index;
				pageRender($form, type);
			};
		};
	$wrap.on('click', '.btn-login', function(){
		var $this = $(this)
			, $parent = $this.parents('ul');
		var checkResult = formCheck($parent, {'cb': checkCallback});
		if(checkResult.status && !$this.data('send')){
			var username = $('#username', $parent).val()
				, password = $('#password', $parent).val()
				, isRemember = $('#remember', $parent)[0].checked;
			$this.data('send','1');
			LAB.loading.show('登录中');
			REQ.p({
				'url':"/es/login"
				, 'type': 'jsonp'
				, 'data': {'username': username}
				, 'p': REQ.pass(password)
				, 'success': function(d){
					var d = d.sududa;
					var logintrue = function(){
						$.cookie(REQ.prefix +"PASS",REQ.pass(password), cookieConfig);
						$.cookie(REQ.prefix +"LOGINED", S.jsonToStr(d) ,cookieConfig);
						$.cookie(REQ.prefix +"USER", username ,cookieConfig);
						S.logined = d;
						$.cookie(REQ.prefix +"UN", S.logined.u.replace(/@/g,"~"));
						//写入用户信息到Cookie
						if(d.status == "1"){
							//保存用户登录记录
							if(isRemember){
								Storage.addnew(username, isRemember, REQ.pass(password));
							};
							var gotoUrl;
							if(!fromUrl){
								gotoUrl = "/";
							}else{
								gotoUrl = decodeURIComponent(fromUrl);
							};
							window.location = gotoUrl;
						}else{
							LAB.warn(d.tips, 'err');
							$.cookie(REQ.prefix +"PASS","");
							$.cookie(REQ.prefix +"LOGINED","");
						};
					};
					if(d.status == "1"){
						if(d.sa != "N"){
							var code = new Array();
							for(var i = 0; i < 3; i++){
								code.push(u.a.y[parseInt(Math.random() * 10)] + u.a.x[parseInt(Math.random() * 8)]);
							};
							var _div = $.createElement("div"),
								_cover = new $.dialog.cover(),
								html = new Array();
							_div.className = "feng_login_code";
							html.push("<ul class='title'>"+ g(69) + d.sa +"</ul>");
							html.push("<ul class='content'><li>"+ code[0] +"</li><li>"+ code[1] +"</li><li>"+ code[2] +"</li></ul>");
							html.push("<ul class='content'>")
							var i = 0;
							while(i < 3){
								html.push("<li><input type='text' maxlength='2' data-check='empty:false,name:"+g(79)+",type:number'/></li>");
								i++;
							};
							html.push("</ul><ul class='foot'><li><input type='button' class='isubmit' value='"+g(81)+"'/></li>");
							html.push("<li><input type='button' class='ibutton' value='"+g(80)+"'/></li></ul>");
							_div.innerHTML = html.join("\n");
							html = null;
							var input = _div.find("input");
							input[0].onkeyup = function(){
								if(this.value.length == 2){
									input[1].focus();
								};
							}
							input[1].onkeyup = function(){
								if(this.value.length == 2){
									input[2].focus();
								};
							}
							input[4].onclick = function(){
								_cover.hide();
								document.body.removeChild(_div);
								_this.value = g(65);
								_div = null;
							};
							input[3].onclick = function(){
								if($.form.check([input[0],input[1],input[2]],p.login)){
									n.l.show();
									u.p({
										url:"es/safecard_check",
										data:{
											username:d.u,
											xy:code.join("|"),
											value:input[0].value+"|"+input[1].value+"|"+input[2].value
										},
										p:password,
										success:function(d){
											n.l.h();
											d = $.json(d).sududa;
											if(d.status == "1"){
												logintrue();
											}else{
												openWarn("no",d.tips,p.login);
											};
										}
									});
								};
							};
							_cover.show();
							document.body.appendChild(_div);
							return;
						}else{
							logintrue();
						};
					}else{
						LAB.warn(d.tips, 'err');
					};
					$this.removeData('send');
					LAB.loading.hide();
				},
				error:function(d){
					LAB.warn('接口请求失败','err');
					$.cookie(REQ.prefix +"LOGINED","");
					$.cookie(REQ.prefix +"PASS","");
					LAB.loading.hide();
				}
			});
		}
	/*}).on('change', 'select', function(){
		var $this = $(this)
			, user = $this.val()
			, cache = Storage.get(user);
		if(cache[1]){
			$this.parents('ul').find('#password').val(cache[2]);
		}*/
	}).on('click', '.btn-regist', function(){
		var $this = $(this)
			, $parent = $this.parents('ul');
		var checkResult = formCheck($parent, {'cb': checkCallback});
		if(checkResult.status && !$this.data('send')){
			LAB.loading.show('提交注册中');
			var username = $('#username', $parent).val()
				, password = $('#password', $parent).val();
			$this.data('send','1')
			REQ.s({
				type: 'jsonp'
				, url:"/es/reg"
				, data:{'username': username, 'pass': REQ.pass(password), 'from': $.cookie(REQ.prefix +'PROMOTER')}
				, success:function(d){
					d = d.sududa;
					if(d.status == "1"){
						LAB.warn('注册成功');
						//保存用户登录记录
						Storage.addnew(username,0,"");
						pageSwitch('login');
					}else{
						LAB.warn(d.tips);
					};
					$this.removeData('send');
					LAB.loading.hide();
				}
			});
		}
	}).on('click', '.btn-forgot', function(){
		var $this = $(this)
			, $parent = $(this).parents('ul');
		var checkResult = formCheck($parent, {'cb': checkCallback});
		if(checkResult.status && !$this.data('send')){
			LAB.loading.show();
			var code = $('#safecode', $parent).val()
				, password = $('#password', $parent).val()
				, repassword = $('#repassword', $parent).val();
			$this.data('send', 1);
			REQ.s({
				url:"exe/msg_code_check"
				, data:{"do":"findpass", 'username': _fotgotUsername, 'code': code, 'param': REQ.pass(password)}
				, success:function(d){
					d = d.sududa;
					if(d.status == "1"){
						LAB.warn('成功找回密码');
						pageSwitch('login');
					}else{
						LAB.warn(d.tips);
					};
					$this.removeData('send');
					LAB.loading.hide();
				}
			});
		}
	}).on('click', '.btn-code', function(){
		var $this = $(this)
			, _str = '发送验证码到手机'
			, $parent = $(this).parents('ul');
		var checkResult = formCheck($parent, {'cb': checkCallback});
		if(checkResult.status && !$this.data('send')){
			_fotgotUsername = $('#username', $parent).val();
			var jishi = function(timer){
				if(timer <= 0){
					return $this.html(_str).removeData('send');
				};
				timer--;
				$this.html(timer +'&nbsp;秒后重新发送');
				setTimeout(function(){
					jishi(timer);
				}, 1000);
			};
			$this.data('send',1);
			REQ.s({
				url:"exe/msg_code_send"
				, type: 'jsonp'
				, data:{'username': _fotgotUsername,'orderid': REQ.getid() + "v" + "0000",'channel':_sendChannel % 2 + 1}
				, success:function(d){
					d = d.sududa;
					if(d.status == "1"){
						jishi(60);
					}else{
						LAB.warn(d.tips);
						_sendChannel++;
						$this.removeData('send').html(_str);
					};
				}
				, error:function(){
					LAB.warn('验证发送失败');
					_sendChannel++;
					$this.removeData('send').html(_str);
				}
			});
		}
	});
	//水波效果
	try{
		new Ripples($wrap, {
			resolution: 600,
			dropRadius: 50,
			perturbance:0.01
		});
	}catch(e){};
	$wrap.loadui();
	$wrap.on('click', '.btn-login', function(){
		//console.log($('select', $wrap).val())
	});
	var hashChange = function(){
		var uri = S.parseUri(W.location.href, '#');
		if(!fromUrl && !!uri.from && uri.form !== '%2Flogin'){
			fromUrl = uri.from;
		}
		pageSwitch(uri['do']);
	};
	if($.browser.msie && $.browser.version < '9.0'){
		$(document).on('click', 'a[href]', function(){
			if(typeof this.href=='string' && this.href.match(/\#[\s\S]+$/) !== null){
				setTimeout(hashChange, 120);
			}
		});
	}else{
		W.onhashchange = hashChange;
	};
	hashChange();
}, ['plus/art-template', 'common/require', 'jquery/ripples', "ui/base", "jquery/cookie", "common/formcheck", './logined', 'jquery/easing', 'zx/lab']);