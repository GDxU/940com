//绑定安全证书
Fengs.add('zx/utils/bindcert', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">用户名</label>'+
			'<div class="controls"><span class="control-span" id="realname">{{=u}}</span></div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">绑定的手机</label>'+
			'<div class="controls"><span class="control-span" id="realname">{{=z}}</span></div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">验证码</label>'+
			'<div class="controls">'+
				'<input type="text" id="code" data-check=\'{"name":"验证码","empty":false,"type":"number","length":"6"}\' placeholder="手机收到的验证码" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">&nbsp;</label>'+
			'<div class="controls">'+
				'<a href="javascript:void(0);" class="btn btn-default" id="sendcode">点此获取手机验证码</a>'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				var render = TEMPLATE.compile(html);
				if(!S.logined.z || S.logined.z === '*'){
					return UI.alert('请先绑定手机');
				}
				return new UI.dialog({
					'title': '绑定安全证书'
					, 'content': render(S.logined)
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
							, 'label': '立即安装证书'
							, 'icon': '&#xe605;'
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
						if(checkResult.status == 1){
							var code = $('#code', $wrap).val().trim();
							REQ.s({
								'url': "exe/msg_code_check"
								, 'type': 'jsonp'
								, 'data': {"do":"certificate", 'username':S.logined.u,'code':code}
								, 'success': function(d){
									d =d.sududa;
									if(d.status == "1"){
										UI.alert("证书安装成功");
										$.cookie("SUDUDA_COM_"+ S.logined.u.toUpperCase() + "_CERT", d.cert,{'expires': 1000, 'path': '/'});
										dialog.hide();
									}else{
										UI.warn(d.tips, 'err');
										$sendBtn.removeData('bind');
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