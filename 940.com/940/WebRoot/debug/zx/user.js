Fengs.add('zx/user', function(S, $, TEMPLATE, REQ, UI, COOKIE, SCROLLTO, LOGINED, LAB, formCheck, PROTOTYPE, ZeroClipboard){
	LOGINED.init();
	var $container = $('#container');
	var bindCert = function(d){
		if(d.status == "-9" && d.tips.indexOf('证书')>=0){
			//绑定数据证书
			UI.confirm({
				'title': '安装数字证书'
				, 'content': d.tips + '是否现在去安装？'
				, 'ok': '立即安装'
				, 'cancel': '下次安装'
				, 'success': function(){
					S.use('zx/utils/bindcert', function(B){
						B.init();
					});
				}
			});
		}else{
			UI.warn(d.tips, 'err');
		};
	};
	var cachePayment = null;//缓存中的交易密码
	var pageEvent = {
		home: function(){
			LAB.loading.show();
			this.shownav('home');
			//获取模板
			$.get('/html/user-home.html', function(content){
				var render = TEMPLATE.compile(content)
				var callback = function(data){
					var _certKey = "SUDUDA_COM_"+ S.logined.u.toUpperCase() +'_CERT'
						, _cert = $.cookie(_certKey);
					if(data.nick){
						data.encodeNick = encodeURIComponent(data.nick);
					};
					if(_cert !== null && _cert !== ''){
						data.hasCert = true;
					}else{
						data.hasCert = false;
					};
					data.showSpread = (new Date().getTime() - new Date(data.v).getTime() > (3600 * 1000 * 245 * 15));
					$container.html(render(data));
					var $wrap = $('.sec-group', $container);
					//绑定同步事件
					S.use('zx/ui/sync', function(SYNC){
						SYNC.init($('.btn-sync', $wrap));
					});
					$('[data-bind]', $wrap).click(function(){
						var _bind = $(this).data('bind');
						LAB.loading.show();
						switch(_bind){
							case 'bindshop':
								return S.use('zx/ui/cover', function(C){
									LAB.loading.hide();
									C.oauth(S.refreshPage, 'bind');
								});
								break;
							case 'unbindcert':
								$.cookie(_certKey,'', {path: '/'});
								S.refreshPage();
								break;
							case 'refreshinfo':
								delete S.logined.r;
								LOGINED.extendInfo(function(){
									S.refreshPage();
								});
								break;
							default:
								S.use('zx/utils/'+ _bind,function(B){
									LAB.loading.hide();
									B.init(data);
								});
						};
					});
					$('.span4', $wrap).click(function(e){
						this.select();
					});
					//复制文本
					var clip = new ZeroClipboard($('.btn-copy', $wrap)[0], {
						moviePath: "/swf/ZeroClipboard.swf"
					});
					clip.on('complete', function(client, args) {
						UI.warn('复制成功');
					});
				};
				//获取用户登录信息
				LOGINED.extendInfo(function(){
					REQ.s({
						url: 'api/user_shop'
						, data: {}
						, success: function(data){
							LAB.loading.hide();
							data = data.kehuda;
							if(data.status == 1){
								data = $.extend(S.logined, data.shop);
								callback(data);
							}else{
								callback(S.logined);
							}
						}
					});
				})
			})
		}
		, shownav: function(name){
			$('[data-bind="'+ name +'"]').addClass('on').siblings('a').removeClass('on');
		}
		, jiakuan: function(){
			this.shownav('jiakuan');
			LAB.loading.show();
			$.get('/html/user-jiakuan.html', function(content){
				var render = TEMPLATE.compile(content);
				var callback = function(data){
					$container.html(render(data));
					var $wrap = $('.sec-group', $container);
					LAB.loading.hide();
					$wrap.on('click', '.btn-success', function(){
						if(S.logined.pz === '0'){
							return UI.alert('免费用户禁止加款');
						};
						var $this = $(this);
						var checkResult = formCheck($wrap);
						if(checkResult.status && !$this.data('send')){
							var orderid = $('#orderId', $wrap).val()
							var jk = function(step){
								$this.data('send', 1);
								//调用加款接口
								REQ.p({
									'url':"exe/saving_used_2"
									, 'type': 'jsonp'
									, 'data':{'orderid':orderid,'step': step}
									, 'success':function(d){
										d = d.sududa;
										//加款成功
										if(d.status == "1" || d.status == "0"){
											UI.alert('加款成功');
										//买家旺旺未绑定到账号绑定
										}else if(d.status == "5"){
											UI.confirm({
												title: '警惕第三方诈骗'
												, content: d.tips
												, ok: '是本人'
												, cancel: '申请退款'
												, success: function(){
													jk(2);
												}
												, error: function(){
													$this.removeData('send');
												}
											});
										//加款失败
										}else{
											UI.warn(d.tips,'err');
											$this.removeData('send');
										};
									}
								});

							};
							jk(1);
						};
					});
				}
				//获得店铺地址
				REQ.p({
					url:"es/saving_item_list"
					, type: 'jsonp'
					, data:{}
					, success:function(d){
						d = d.sududa;
						if(d.status == "1"){
							d.taobao = REQ.covertArray(d.taobao.l);
							d.paipai = REQ.covertArray(d.taobao.l);
							callback(d);
						}else{
							UI.warn(d.tips,'err');
						};
					}
				});
			});
		}
		, tixian: function(){
			this.shownav('tixian');
			LAB.loading.show();
			LOGINED.extendInfo(function(){
				$.get('/html/user-tixian.html', function(content){
					$container.html(content);
					var $wrap = $('.sec-group', $container);
					$('#realname', $wrap).text(S.logined.r);
					LAB.loading.hide();
					$wrap.on('click', '.btn-success', function(){
						var $this = $(this);
						var checkResult = formCheck($wrap);
						if(checkResult.status && !$this.data('send')){
							var paytype = $('#paytype', $wrap)[0].val()
								, paytime = $('#paytime', $wrap)[0].val()
								, user = $('#user', $wrap).val()
								, figure = $('#figure', $wrap).val()
								, paypass = $('#paypass', $wrap).val();
							//验证提现账号格式，支付宝为邮箱格式，财付通为QQ号格式
							if(paytype == "6"){
								if(!S.test(user,"email") && !S.test(user,"mobile")){
									return UI.warn('请输入正确的支付宝账号','err');
								};
							}else{
								if(!S.test(user,"qq")){
									return UI.warn('请输入正确的财付通账号','err');
								};
							};
							$this.data('send',1);
							var orderid = REQ.getid() +'v'+ S.logined.o;
							REQ.m({
								'url': "exe/withdraw_cash"
								, 'type': 'jsonp'
								, 'data': {'to':user, 'amount':figure, 'channel':paytype,'type':paytime,'orderid':orderid}
								, 'p': REQ.pay(paypass)
								, 'success': function(d){
									d = d.sududa;
									if(d.status == "1"){
										S.use('zx/utils/invoice', function(B){
											B.init([
												{'name':'订单号','value': orderid}
												, {'name':'业务名称','value': '余额提现'}
												, {'name':'提现账号','value': user}
												, {'name':'提现平台','value': paytype == "6" ? '支付宝' : '财付通'}
												, {'name':'到账方式','value': paytime == "3" ? '1分钟快速提现' : '48小时到账'}
												, {'name':'提现金额','value': figure}
												, {'name':'业务状态','value': d.status}
												, {'name':'业务备注','value': d.tips}
											]);
										});
									}else{
										bindCert(d);
									};
									$this.removeData('send');
									$('#paypass', $wrap).val('');
								}
							});
						};
					});
					UI.loadui($wrap);
				});
			});
		}
		, zhuangzhang: function(){
			this.shownav('zhuangzhang');
			LAB.loading.show();
			$.get('/html/user-zhuangzhang.html', function(content){
				$container.html(content);
				var $wrap = $('.sec-group', $container);
				LAB.loading.hide();
				$wrap.on('click', '.btn-success', function(){
					var $this = $(this);
					var checkResult = formCheck($wrap);
					if(checkResult.status && !$this.data('send')){
						var touser = $('#touser', $wrap).val()
							, amount = $('#amount', $wrap).val()
							, remark = $('#remark', $wrap).val()
							, paypass = $('#paypass', $wrap).val();
						$this.data('send',1);
						var orderid = REQ.getid() +'_'+ S.logined.o;
						REQ.m({
							url:"es/transfer_accounts"
							, 'type': 'jsonp'
							, 'data': {'to':touser,'amount': amount,'remark':remark,'orderid':orderid}
							, 'p': REQ.pay(paypass)
							, 'success': function(d){
								d = d.sududa;
								if(d.status == "1"){
									S.use('zx/utils/invoice', function(B){
										B.init([
											{'name':'订单号','value': orderid}
											, {'name':'业务名称','value': '转账'}
											, {'name':'收款账号','value': touser}
											, {'name':'转账金额','value': amount}
											, {'name':'转账备注','value':remark}
											, {'name':'业务状态','value': d.status}
											, {'name':'业务备注','value': d.tips}
										]);
									});
								}else{
									bindCert(d);
								};
								$this.removeData('send');
								$('#paypass', $wrap).val('');
							}
						});
					};
				});
			});
		}
		, xiaoshou: function(){
			this.shownav('xiaoshou');
			LAB.loading.show();
			$.get('/html/user-xiaoshou.html', function(content){
				$container.html(content);
				var $wrap = $('.sec-group', $container);
				LAB.loading.hide();
				$wrap.on('click', '.btn-success', function(){
					var $this = $(this);
					var checkResult = formCheck($wrap);
					if(checkResult.status && !$this.data('send')){
						var touser = $('#touser', $wrap).val()
							, power = $('#power', $wrap)[0].val()
							, paypass = $('#paypass', $wrap).val();
						$this.data('send',1);
						REQ.m({
							'url': 'zx/agent_open'
							, 'type': 'jsonp'
							, 'p': REQ.pay(paypass)
							, 'data': {'open': touser, 'power': power}
							, 'success': function(d){
								d = d.sududa;
								if(d.status == "1"){
									S.use('zx/utils/invoice', function(B){
										B.init([
											{'name':'订单号','value': orderid}
											, {'name':'业务名称','value': '余额提现'}
											, {'name':'提现账号','value': user}
											, {'name':'提现平台','value': paytype == "6" ? '支付宝' : '财付通'}
											, {'name':'到账方式','value': paytime == "3" ? '1分钟快速提现' : '48小时到账'}
											, {'name':'提现金额','value': figure}
											, {'name':'业务状态','value': d.status}
											, {'name':'业务备注','value': d.tips}
										]);
									});
								}else{
									bindCert(d);
								};
								$this.removeData('send');
								$('#paypass', $wrap).val('');
							}

						})
					};
				});
				UI.loadui($wrap);
			});
		}
		, jihuoma: function(){
			this.shownav('jihuoma');
			LAB.loading.show();
			$.get('/html/user-jihuoma.html', function(content){
				var render = TEMPLATE.compile(content);
				$container.html(content);
				var $wrap = $('.sec-group', $container);
				LAB.loading.hide();
			});
		}
		, caiwu: function(){
			this.shownav('caiwu');
			LAB.loading.show();
			$.get('/html/user-caiwu.html', function(content){
				var render = TEMPLATE.compile(content)
					, _isSend = false							//判断是否已发送请求
					, _line = 5								//每页行数
					, dataSource = {
						'start': new Date().format('yyyy-') + '1-1'
						, 'end': new Date().format('yyyy-MM-dd')
					}
					, _tableRender = null;
				$container.html(render(dataSource));
				LAB.loading.hide();
				var $wrap = $('.sec-group', $container)
					, $viewer = $('.viewer', $wrap);
				var send = function(page){
					if(_isSend){
						return false;
					}
					_isSend = true;
					LAB.loading.show();
					$viewer.html('');
					var sendType = $('select', $wrap).val()
						, date = $('#date', $wrap).val().trim().replace(/[^0-9\-]+/ig,',').split(',')
						, params = $('#params', $wrap).val().trim()
						, startDate = date[0]
						, endDate = date[1];
					REQ.p({
						url: "es/finance_list"
						, type: 'jsonp'
						, data:{"do":"search", 'type': sendType, 'line': _line,'page': page,'date1': startDate,'date2': endDate,'param': params}
						, success:function(d){
							_isSend = false;
							d = d.sududa;
							LAB.loading.hide();
							if(d.status == 1){
								if(d.all === 0){
									return UI.alert('查询不到记录');
								};
								console.log(d);
								var data = {
									list: REQ.covertArray(d.list.l)
									, pageCount: Math.ceil(d.all / _line)
									, page: page
								}
								$viewer.html(_tableRender(data));
							}else{
								UI.warn(d.tips, 'err');
							}
						}
					});
				};
				$wrap.on('click', '.btn-submit', function(){
					if(_tableRender === null){
						$.get('/html/user-caiwu-list.html', function(html){
							_tableRender = TEMPLATE.compile(html);
							send(1);
						})
					}else{
						send(1);
					};
				}).on('click', '[data-page]', function(){
					send($(this).data('page'));
				});
				UI.loadui($wrap)
			});
		}
	}
	$('[data-bind]').click(function(){
		var $this = $(this)
			, bind = $this.data('bind');
		if(typeof bind == 'string'){
			bind = bind.replace(/(-|_)[a-z]/ig, function(a){
				return a.toUpperCase().replace(/-_/ig,'');
			});
			pageEvent[bind] && pageEvent[bind]();
		}
	});
	//刷新加载
	var uri = S.parseUri(window.location.href,'#')
		, d = uri['do'];
	if(pageEvent[d]){
		pageEvent[d]();
	}else{
		pageEvent.home();
	}
}, ['plus/art-template', 'common/require','ui/base', "jquery/cookie", 'jquery/scrollto', './logined', './lab', "common/formcheck", 'common/prototype', 'plus/zero-clipboard'])