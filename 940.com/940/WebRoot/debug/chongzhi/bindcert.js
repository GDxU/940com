//绑定安全证书
Fengs.add('chongzhi/bindcert', function(S, $, UI, TEMPLATE, LOGINED, SENDCODE){
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
				'<input type="text" id="figure" data-check=\'{"name":"验证码","empty":false,"type":"number"}\' placeholder="手机收到的验证码" hidefocus="true">'+
			'</div>'+
		'</div>'+
		'<div class="control-group">'+
			'<label class="control-label">&nbsp;</label>'+
			'<div class="controls">'+
				'<a href="javascript:void(0);" class="btn btn-default">点此获取手机验证码</a>'+
			'</div>'+
		'</div>'+
	'</div>';
	return {
		'init': function(){
			LOGINED.extendInfo(function(){
				var render = TEMPLATE.compile(html);
				console.log(S.logined)
				return new UI.dialog({
					'title': '绑定安全证书'
					, 'content': render(S.logined)
					, 'padding': '20px 0 0 0'
					, 'width': 500
					, 'footer': [
						{
							'class': 'btn-default btn-close'
							, label: '取消'
						}
						, {
							'class': 'btn-success btn-ok'
							, label: '立即安装证书'
						}
					]
				}, function(dialog){
				});
			});
		}
	};
	/*return function(a,b){
		var _self = arguments.callee;
		if(p.h == null){
			setTimeout(function(){
				_self();
			},200);
			return;
		};
		n.f.s('m');
		var ele = $.createElement("dl");
		n.html("more.bindhard",function(d){
			ele.innerHTML = d;
			var ckey = "SUDUDA_COM_"+ p.logined.sududa.u.toUpperCase();
				_mobile = p.logined.sududa.z,
				input = ele.find("input"),
				_div = ele.find("div"),
				_ol = ele.find("ol"),
				notice = _ol[0].find("ul")[1],
				getbtn = input[1],
				span = ele.find("span")[0],
				msg = new u.v(getbtn),
				code = input[2],
				subbtn = input[3],
				isbind = false,
				cert = $.storage.getCookie(ckey + "_CERT");
			if(cert && cert != ""){
				isbind = true;
			};
			if(isbind){
				notice.innerHTML = g(98);
				var clearhard = $.createElement("button");
				clearhard.className = "clearhard";
				clearhard.innerHTML = g(109);
				ele.appendChild(clearhard);
				_ol[0].className = "binded";
				clearhard.on("click",function(){
					openConfirm({
						text:g(110),
						yes:g(111),
						backtrue:function(){
							openWarn("yes",g(3));
							$.storage.setCookie(ckey + "_CERT","");
							p.h = "0";
							o.m.h();
						}
					});
				});
			}else{
				//是否绑定手机号
				_div[0].css("display","block");
				if(_mobile.length < 11){
					_ol[1].innerHTML = g(97);
				}else{
					_ol[2].css("display","none");
					span.innerHTML = _mobile;
					_div[1].css("display","block");
					getbtn.onclick = function(){
						msg.sbt(p.logined.sududa.u);
					};
					u.enter = subbtn.onclick = function(){
						if($.form.check([code])){
							if(o.s(subbtn)){
								u.s({
									url:"exe/msg_code_check",
									data:{"do":"certificate",username:p.logined.sududa.u,code:code.value},
									success:function(d){
										d = $.json(d).sududa;
										if(d.status == "1"){
											openWarn("yes",g(3));
											$.storage.setCookie(ckey + "_CERT",d.cert,1000);
											_self();
										}else{
											openWarn("no",d.tips);
											subbtn.c();
										};
									}
								});
							};
						};
					};
				};
			};
			o.t(ele,g(95));
		});
	};*/
}, ['ui/base', 'plus/art-template', 'zx/logined', './sendcode']);