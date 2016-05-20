Fengs.add('zx/utils/pay', function(S, $, UI, REQ, TEMPLATE, formCheck){
	var html2 = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">交易密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="password" data-check=\'{"name":"交易密码","empty":false,"length":"6-16"}\' placeholder="您的交易密码">'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(orderid, html){
			new UI.dialog({
				title: '订单支付'
				, width: 450
				, 'padding': '15px 0 0 0'
				, 'content': html
				, footer: [
					{
						'label': '账户余额付款'
						, 'icon': '&#xe607;'
						, class: 'btn-info btn-balance'
					}
					, {
						'label': '支付宝付款'
						, 'icon': '&#xe674;'
						, class: 'btn-success btn-alipay'
					}
				]
			}, function(dialog){
				var $wrap = dialog.target;
				//支付宝支付
				$wrap.find('.btn-alipay').click(function(){
					var url = REQ.s({
							url:"zx/order_pay_other"
							, data:{"do": 'buy',"price": 30,"channel":1,"power":14,"orderid": orderid}
						}, true)
						, host = window.location.host
						, ex = /(^http[s]?:\/\/)/.exec(window.location.href)[0]
						, windowUrl = ex + host + url;
					window.open(windowUrl, 'newwindow','height=700,width=900,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
					UI.confirm({
						title: '支付结果确认'
						, content: '您在新打开的页面上完成支付，<br/>支付完成前请不要关闭此窗口。<br/>完成付款后请根据您的情况点击下面的按钮。'
						, ok: '支付完成'
						, cancel: '支付遇到问题'
						, success: function(d){
							REQ.s({
								'url':"zx/order_status"
								, 'type': 'jsonp'
								, 'data':{'orderid': orderid}
								, 'success':function(d){
									d = d.sududa;
									if(d.status == 1){
										UI.warn(d.tips);
										S.refreshPage();
									}else{
										UI.warn("订单状态未成功，请确认你是否成功付款", 'err');
									}
								}
							});
						}
					});
				});
				//余额支付
				$wrap.find('.btn-balance').click(function(){
					if(S.logined.b < 30){
						return UI.alert('您的余额不足30元！')
					}
					return new UI.dialog({
						title: '余额支付'
						, width: 450
						, 'padding': '15px 0 0 0'
						, 'content': TEMPLATE.compile(html2)(S.logined)
						, footer: [
							{
								'label': '取消'
								, 'icon': '&#xe693;'
								, class: 'btn-default'
							}
							, {
								'label': '确定支付'
								, 'icon': '&#xe60f;'
								, class: 'btn-success btn-ok'
							}
						]
					}, function(dialog){
						var $wrap = dialog.target;
						$wrap.on('click', '.btn-ok', function(){
							var $this = $(this);
							var checkResult = formCheck($wrap);
							if(checkResult.status == 1 && !$this.data('send')){
								REQ.m({
									url:"zx/order_pay",
									type: 'jsonp',
									data:{'orderid':orderid},
									p: REQ.pay($('#password', $wrap).val().trim()),
									success:function(d){
										d = d.sududa;
										UI.alert(d.tips);
										//更新用户订单
										REQ.p({url:"zx/order_list",data:{}});
										S.refreshPage();
									},
									error:function(e){
										UI.warn("请求失败", 'err');
									}
								});
							}
						});
					})
				});
			})
		}
	}
}, ['ui/base', 'common/require', 'plus/art-template', 'common/formcheck']);