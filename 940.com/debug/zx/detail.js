Fengs.add('zx/detail', function(S, $, UI, LOGINED, REQ, PAGENAV, LAB){
	LOGINED.init();
	LOGINED.extendInfo(function(){
		$('[data-bind]').click(function(){
			var $this = $(this)
				, _bind = $this.data('bind');
			LAB.loading.show();
			switch(_bind){
				case 'buytemp':
					var orderid = REQ.getid() +'v'+ S.logined.o;
					if(!S.logined.p){

					}
					//购买模板
					REQ.p({
						'url':"zx/order_add"
						, 'type': 'jsonp'
						, 'data':{'orderid':orderid,'productid': $this.data('id')}
						, 'success':function(d){
							d = d.sududa;
							//购买成功
							if(d.status == "1"){
								UI.alert('模板获取成功');
								S.refreshPage();
							//去付款
							}else if(d.status == "0"){
								S.use('zx/utils/pay', function(B){
									var html = '<div class="form-horizontal">'+
										'<div class="control-group">'+
											'<label class="control-label">订单编号</label>'+
											'<div class="controls"><span class="control-span">'+ orderid +'</span></div>'+
										'</div>'+
										'<div class="control-group">'+
											'<label class="control-label">支付金额</label>'+
											'<div class="controls"><span class="control-span">¥30.00元</span></div>'+
										'</div>'+
										'<div class="control-group">'+
											'<label class="control-label">备注</label>'+
											'<div class="controls"><span class="control-span">购买模板一套</span></div>'+
										'</div>'+
									'</div>';
									B.init(orderid, html);
									LAB.loading.hide();
								});
							}else{
								UI.warn(d.tips, 'err');
								LAB.loading.hide();
							};
						}
					});
					break;
				case 'login':
					var parurl = '/login#do='
						, locurl = $this.data('from');
					new UI.dialog({
						title: '提示'
						, width: 400
						, content: '<div class="alert-content">您必须登录后才能购买。（如果没有帐号请先注册）</div>'
						, footer: [
							{
								'class': 'btn-success btn-login'
								, 'label': '登录'
								, 'icon': '&#xe626;'
							}
							, {
								'class': 'btn-info btn-regist'
								, 'label': '注册新账号'
								, 'icon': '&#xe680;'
							}
						]
					}, function(dialog){
						dialog.target.on('click', '.btn-regist', function(e){
							window.location.href = parurl +'regist&from='+ locurl;
							dialog.hide();
						}).on('click', '.btn-login', function(e){
							window.location.href = parurl +'login&from='+ locurl;
							dialog.hide();
						});
						LAB.loading.hide();
					});
					break;
				default:
					S.use('zx/utils/'+ _bind,function(B){
						B.init($this);
						LAB.loading.hide();
					});
			};
		});
	});
	//滚动菜单条事件
	(function(){
		var $nav = $('.slide-nav')
			, $doc = $(document);
		PAGENAV($nav, { 'currentClass': 'current' });
		$doc.scroll(function(){
			var _top = $doc.scrollTop();
			$nav.css({position: _top > 690 ? 'fixed' : 'static'});
		});
	})();
},["ui/base", "./logined", 'common/require', 'jquery/pagenav', './lab']);