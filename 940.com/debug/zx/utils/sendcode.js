Fengs.add('zx/utils/sendcode', function(S, $, REQ){
	var _sendChannel = 0
		, _str = '点此获取手机验证码';
	return {
		init: function($btn, username){
			var jishi = function(timer){
				if(timer <= 0){
					return $btn.html(_str).removeData('send');
				};
				timer--;
				$btn.html(timer +'&nbsp;秒后重新发送');
				setTimeout(function(){
					jishi(timer);
				}, 1000);
			};
			$btn.data('send',1);
			REQ.s({
				url:"exe/msg_code_send"
				, type: 'jsonp'
				, data:{'username': username,'orderid': REQ.getid() + "v" + "0000",'channel':_sendChannel % 2 + 1}
				, success:function(d){
					d = d.sududa;
					if(d.status == "1"){
						jishi(60);
					}else{
						LAB.warn(d.tips);
						_sendChannel++;
						$btn.removeData('send').html(_str);
					};
				}
				, error:function(){
					LAB.warn('验证发送失败');
					_sendChannel++;
					$btn.removeData('send').html(_str);
				}
			});
		}
	}
}, ['common/require']);