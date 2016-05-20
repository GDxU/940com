//绑定安全证书
Fengs.add('zx/utils/editpass', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">旧的登录密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="oldpass" max-length="16" data-check=\'{"name":"旧的登录密码","empty":false,"length":"6-16"}\' placeholder="旧的登录密码" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">新的登录密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="password" data-check=\'{"name":"新的登录密码","empty":false,"le":"number","length":"6-16"}\' placeholder="新的登录密码" max-length="16" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">重复登录密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="repassword" max-length="16" data-check=\'{"name":"重复登录密码","empty":false,"same":"password"}\' placeholder="重复登录密码" hidefocus="true">'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				return new UI.dialog({
					'title': '修改登录密码'
					, 'content': html
					, 'padding': '20px 0 0 0'
					, 'width': 500
					, 'footer': [
						{
							'class': 'btn-default btn-close'
							, 'label': '取消'
							, 'icon': '&#xe627;'
						}
						, {
							'class': 'btn-success btn-ok'
							, 'label': '立即修改'
							, 'icon': '&#xe60f;'
						}
					]
				}, function(dialog){
					var $wrap = dialog.target
						, $sendBtn = $('#sendcode', $wrap);
					$sendBtn.click(function(){
						if(!$sendBtn.data('send')){
							SENDCODE.init($(this), S.logined.u);
						};
					});
					$wrap.on('click', '.btn-ok', function(){
						var checkResult = formCheck($wrap);
						var $this = $(this);
						if(checkResult.status == 1 && !$this.data('send')){
							var oldpass = $('#oldpass', $wrap).val().trim()
								, password = $('#password', $wrap).val().trim();
							if(oldpass === password){
								return UI.warn('新密码不能与旧密码相同','err');
							};
							$this.data('send', 1)
							REQ.p({
								url:"es/pass_edit"
								, type: 'jsonp'
								, data:{"new": REQ.pass(password)}
								, p: REQ.pass(oldpass)
								, success:function(d){
									d = d.sududa;
									if(d.status == "1"){
										UI.alert('密码修改成功！')
										dialog.hide();
										$.cookie(REQ.prefix +"PASS", REQ.pass(password), {'expires': 1000,'path': '/'});
									}else{
										UI.warn(d.tips, 'err');
										$this.removeData('send')
									};
								}
							});
						}
					});
				});
			});
		}
	};
}, ['ui/base', 'plus/art-template', 'zx/logined', './sendcode', 'common/formcheck', 'common/require']);