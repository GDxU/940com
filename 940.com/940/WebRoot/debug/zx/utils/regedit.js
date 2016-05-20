//完善用户资料
Fengs.add('zx/utils/regedit', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE, formCheck, REQ){
	var html = '<div class="form-horizontal">'+
		'<div class="control-group">'+
			'<label class="control-label">真实姓名</label>'+
			'<div class="controls">'+
				'<input type="text" id="realname" data-check=\'{"name":"真实姓名","empty":false,"length":"2-16"}\' max-length="16" placeholder="您的真实姓名" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">身份证号</label>'+
			'<div class="controls">'+
				'<input type="text" id="idcard" data-check=\'{"name":"身份证号","empty":false,"type":"identification","length":"18"}\' placeholder="您的18位身份证号" max-length="18" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">QQ</label>'+
			'<div class="controls">'+
				'<input type="text" id="qq" data-check=\'{"name":"QQ号","empty":false,"type":"qq","length":"5-15"}\' placeholder="QQ号" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">旺旺</label>'+
			'<div class="controls">'+
				'<input type="text" id="wangwang" data-check=\'{"name":"旺旺","empty":false}\' placeholder="旺旺" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">创盾交易密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="paypass" data-check=\'{"name":"交易密码","empty":false,"length":"6-16"}\' placeholder="创盾交易密码" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">重复交易密码</label>'+
			'<div class="controls">'+
				'<input type="password" id="code" data-check=\'{"name":"重复交易密码","empty":true,"same":"paypass","length":"6-16"}\' placeholder="重复交易密码" hidefocus="true">'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				var render = TEMPLATE.compile(html);
				console.log(S.logined)
				return new UI.dialog({
					'title': '完善用户资料'
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
							, 'label': '保存'
							, 'icon': '&#xe60f;'
						}
					]
				}, function(dialog){
					var $wrap = dialog.target;
					$wrap.on('click', '.btn-ok', function(){
						var $this = $(this);
						var checkResult = formCheck($wrap);
						if(checkResult.status == 1 && !$this.data('send')){
							var realname = $('#realname', $wrap).val().trim()
								, idcard = $('#idcard', $wrap).val().trim()
								, qq = $('#qq', $wrap).val().trim()
								, paypass = $('#paypass', $wrap).val().trim()
								, sex = (function(id){
									var len = id.length,year,month,day,date;
									if(len == "18"){
										if(id.match(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/) == null){
											return false;
										};
										var square = function(x, y) {
												var i = 1;
												for (j = 1; j <= y; j++) i *= x;
												return i;
											},
											IDCard = function(Num) {
												if (Num.length != 18) return !1;
												var x = 0, y = "";
												for (i = 18; i >= 2; i--) x += square(2, i - 1) % 11 * parseInt(Num.charAt(19 - i - 1));
												return x %= 11, y = 12 - x, x == 0 && (y = "1"), x == 1 && (y = "0"), x == 2 && (y = "X"), y;
											};
										if(id.substring(len-1,len) != IDCard(id)){
											return false;
										};
										year =  id.substring(6,10);  
										month = id.substring(10,12);  
										day = id.substring(12,14);  
										date = new Date(year,parseFloat(month)-1,parseFloat(day));  
										// 这里用getFullYear()获取年份，避免千年虫问题  
										if(date.getFullYear() != parseFloat(year) || date.getMonth() != parseFloat(month)-1 || date.getDate() != parseFloat(day)){  
												return false;  
										}else{
											if(id.substring(14,17)%2==0){  
												return 2;//男  
											}else{  
												return 1;
											}
										}
									}else{
										if(id.match(/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/) == null){
											return false;
										};
										year =  id.substring(6,8);  
										month = id.substring(8,10);  
										day = id.substring(10,12);  
										date = new Date(year,parseFloat(month)-1,parseFloat(day)); 
										if(date.getYear() != parseFloat(year) || date.getMonth() != parseFloat(month)-1  || date.getDate() != parseFloat(day)){
											return false;  
										}else{  
											if(id.substring(14,15)%2==0){  
												return 2;  
											}else{  
												return 1;  
											} 
										}  
									};
								})(idcard);
							paypass = REQ.pay(paypass);
							$this.data('send', 1)
							REQ.p({
								'url': "es/reg_edit"
								, 'type': 'jsonp'
								, 'data': {"do":"edit1",'realname': realname,'idcard': idcard,'qq':qq,'wangwang': idcard,'sex':sex,'payment': paypass,'payment2':"N"}
								, 'success': function(d){
									d =d.sududa;
									if(d.status == "1"){
										UI.alert("资料修改成功");
										S.refreshPage();
										dialog.hide();
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