//绑定安全证书
Fengs.add('zx/utils/active', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">激活账号</label>'+
			'<div class="controls"><span class="control-span" id="realname">{{=u}}</span></div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">激活码</label>'+
			'<div class="controls">'+
				'<input type="text" id="code" data-check=\'{"name":"激活码","empty":false}\' placeholder="激活码" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<div class="controls">'+
				'<span class="control-span">如果您没有激活码，到淘宝搜索关键词“客户达装修软件”即可联系代理商购买。</span>'+
				'<a href="https://s.taobao.com/search?tab=all&filter=reserve_price%5B500%2C1000%5D&fs=0&stats_click=search_radio_all%3A1&initiative_id=staobaoz_20131119&q=%E5%AE%A2%E6%88%B7%E8%BE%BE" target="new" class="btn btn-info btn-small" id="sendcode">到淘宝购买</a>'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		init: function(){
			var show = this.show;
			LOGINED.extendInfo(function(){
				new UI.dialog({
					title: '新用户激活'
					, width: 400
					, content: '<div class="alert-content">你可以选择以下两种方式激活您的账号：<br/>购买激活——直接付款购买;<br/>激活码激活——通过你拥有的软件激活码激活账号;</div>'
					, footer: [
						{
							'class': 'btn-success btn-buy'
							, 'label': '直接购买'
							, 'icon': '&#xe67c;'
						}
						, {
							'class': 'btn-info btn-jhm'
							, 'label': '激活码激活'
							, 'icon': '&#xe64d;'
						}
					]
				}, function(dialog){
					dialog.target.on('click', '.btn-jhm', function(e){
						show();
						dialog.hide();
					}).on('click', '.btn-buy', function(e){
						S.use('zx/utils/buy',function(B){
							B.init();
						});
						dialog.hide();
					})
				});
			});
		}
		, 'show': function(){
			var render = TEMPLATE.compile(html);
			return new UI.dialog({
				'title': '自助激活账号'
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
						, 'label': '立即激活'
						, 'icon': '&#xe60f;'
					}
				]
			}, function(dialog){
				var $wrap = dialog.target;
				$wrap.on('click', '.btn-ok', function(){
					var $this = $(this);
					var checkResult = formCheck($wrap);
					if(checkResult.status == 1 && $this.data('send')){
						var code = $('#code', $wrap).val().trim();
						$this.data('send', 1)
						REQ.s({
							'url': "zx/activation_agent_open"
							, 'type': 'jsonp'
							, 'data': {"code": code, 'open': S.logined.u}
							, 'success': function(d){
								d =d.sududa;
								if(d.status == "1"){
									UI.alert("激活成功");
									S.refreshPage();
									dialog.hide();
								}else{
									UI.warn(d.tips, 'err');
									$sendBtn.removeData('send');
								};
							}
						});
					}
				});
			});
		}
	};
}, ['ui/base', 'plus/art-template', 'zx/logined', './sendcode', 'common/formcheck', 'common/require']);