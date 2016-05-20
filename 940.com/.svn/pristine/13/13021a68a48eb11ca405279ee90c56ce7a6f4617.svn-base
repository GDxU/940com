//绑定安全证书
Fengs.add('zx/utils/buy', function(S, $, UI, TEMPLATE, LOGINED, formCheck, REQ){
	var html = '<ul class="buy-power">'+
		'<li title="普通版"><a href="javascript:void(0);" class="n" data-power="13"></a></li>'+
		'<li title="全集版"><a href="javascript:void(0);" class="q" data-power="14"></a></li>'+
	'</ul>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				var render = TEMPLATE.compile(html);
				return new UI.dialog({
					'title': '账号购买激活'
					, 'content': render(S.logined)
					, 'padding': '10px'
					, 'width': 500
				}, function(dialog){
					var $wrap = dialog.target;
					$wrap.on('click', '.buy-power a', function(){
						var orderid = REQ.getid() +'v'+ S.logined.o 		//生成订单号
							, _power = $(this).data('power');				//用户选择的版本
						var url = REQ.s({
								url:"zx/order_pay_other"
								, data:{"do": 'open',"price": (_power == '13' ? 30 : 90),"channel":1,"power": _power,"orderid": orderid, "from": $.cookie(REQ.prefix +'PROMOTER')}
							}, true)
							, host = 'pc.sududa.com:1024'//window.location.host
							, ex = /(^http[s]?:\/\/)/.exec(window.location.href)[0]
							, windowUrl = ex + host + url;
						window.open(windowUrl, 'newwindow','height=700,width=900,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
						console.log(S.logined)
						UI.confirm({
							title: '支付结果确认'
							, content: '您在新打开的页面上完成支付，<br/>支付完成前请不要关闭此窗口。<br/>完成付款后请根据您的情况点击下面的按钮。'
							, ok: '支付完成'
							, cancel: '支付遇到问题'
							, success: function(d){
								//获取用户登录信息
								REQ.p({
									'url': '/es/login_userinfo'
									, 'type': 'jsonp'
									, 'data': {'username': S.logined.u}
									, 'success': function(d){
										d = d.sududa;
										if(d.status == 1){
											if(d.p == _power){
												UI.alert('购买成功');
												$.cookie(REQ.prefix +'LOGINED', S.jsonToStr(d), {'path': '/', 'expires': 365});
												S.refreshPage();
											}else{
												UI.alert("订单状态未成功，请确认你是否成功付款");
											};
										}
									}
								})
								/*REQ.s({
									'url':"zx/order_status"
									, 'type': 'jsonp'
									, 'data':{'orderid': orderid}
									, 'success':function(d){
										d = d.sududa;
										if(d.status == 1){
											UI.warn(d.tips);
											dialog.hide();
											S.refreshPage();
										}else{
											UI.alert("订单状态未成功，请确认你是否成功付款");
										}
									}
								});*/
							}
						});
					});
				});
			});
		}
	};
}, ['ui/base', 'plus/art-template', 'zx/logined', 'common/formcheck', 'common/require']);