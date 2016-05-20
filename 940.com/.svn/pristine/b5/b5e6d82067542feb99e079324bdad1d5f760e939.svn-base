//绑定安全证书
Fengs.add('zx/utils/upgrade', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">升级账号</label>'+
			'<div class="controls"><span class="control-span" id="realname">{{=u}}</span></div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">升级类型</label>'+
			'<div class="controls"><span class="control-span" id="realname">全集版 / 升级费用60元</span></div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">交易密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="paypass" data-check=\'{"name":"交易密码","empty":false,"length":"6-16"}\' placeholder="创盾交易密码" hidefocus="true">'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				var render = TEMPLATE.compile(html);
				return new UI.dialog({
					'title': '升级账号权限'
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
							, 'label': '立即升级'
							, 'icon': '&#xe60f;'
						}
					]
				}, function(dialog){
					var $wrap = dialog.target;
					$wrap.on('click', '.btn-ok', function(){
						var $this = $(this);
						var checkResult = formCheck($wrap);
						if(checkResult.status == 1 && !$this.data('send')){
							var paypass = $('#paypass', $wrap).val().trim();
							var orderid = REQ.getid() +'v'+ S.logined.o;
							$this.data('send', 1);
							REQ.m({
								'url': "exe/agent_upgrade"
								, 'type': 'jsonp'
								, 'p': REQ.pay(paypass)
								, 'data': {"to":S.logined.u, 'power':'14','orderid':orderid}
								, 'success': function(d){
									d =d.sududa;
									if(d.status == "1"){
										UI.alert("升级成功");
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