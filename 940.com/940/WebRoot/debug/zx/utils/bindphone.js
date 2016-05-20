//解绑手机号码
Fengs.add('zx/utils/bindphone', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">用户名</label>'+
			'<div class="controls"><span class="control-span" id="realname">{{=u}}</span></div>'+
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
				if(S.logined.i === 'N'){
					return UI.alert('请先完善资料');
				}
				return new UI.dialog({
					'title': '解绑手机'
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
							, 'label': '立即绑定'
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
						var $this = $(this);
						var checkResult = formCheck($wrap);
						if(checkResult.status == 1 && !$this.data('send')){
							var code = $('#code', $wrap).val().trim();
							$this.data('send', 1);
							REQ.s({
								'url': "exe/msg_code_check"
								, 'type': 'jsonp'
								, 'data': {"do":"unbindphone", 'username':S.logined.u,'code':code}
								, 'success': function(d){
									d =d.sududa;
									if(d.status == "1"){
										UI.alert("手机解绑成功");
										S.refreshPage();
									}else{
										UI.warn(d.tips, 'err');
									};
									$this.removeData('send')
								}
							});
						}
					});
				});
			});
		}
	};
}, ['ui/base', 'plus/art-template', 'zx/logined', './sendcode', 'common/formcheck', 'common/require']);