Fengs.add('zx/logined', function(S, $, REQ, COOKIE){
	$('.vertical-full').each(function(){
		var _height = document.documentElement.clientHeight - 233;
		$(this).height(_height < 500 ? 500 : _height);
	});
	return {
		'init': function(){
			var logined = $.cookie(REQ.prefix +'LOGINED');
			try{
				logined = $.parseJSON(logined);
				S.logined = logined;
			}catch(e){
				delete S.logined;
				return false;
			};
			$('.toper').on('click', '.download-client-btn', function(){
				S.use('zx/ui/cover', function(C){
					C.down('欢迎使用客户达装修助手，<br/>请点击下方连接下载装修助手客户端。');
				})
			}).on('click', 'a.logout', function(){
				REQ.s({
					url: '/api/quit_login'
					, data: {}
					, success: function(d){
						if(d.kehuda){
							if(window.location.pathname.match(/\/user\//i) !== null){
								return window.location.href = '/';
							};
							S.refreshPage();
						}
					}
				})
			});
			if(!logined){
				return false;
			};
			return true;
		}
		, 'extendInfo': function(callback){
			if(S.logined && !S.logined.r){
				//获取用户登录信息
				REQ.p({
					'url': '/es/login_userinfo'
					, 'type': 'jsonp'
					, 'data': {'username': S.logined.u}
					, 'success': function(d){
						d = d.sududa;
						if(d.status == 1){
							S.logined = $.extend(S.logined, d);
							callback();
						}
					}
				})
			}else{
				callback();
			}
		}
	}
}, ['common/require', "jquery/cookie"]);