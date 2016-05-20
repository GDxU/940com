(function(W){
	if(!W.console){W.console = {'log': function(){}}};
	var $ = !W.jQuery ? W.Zepto : jQuery;
	var O = {
			/*name: "script"				//框架名称   	
			, tag: ""			//时间戳(清理缓存)
			, path: "/"			//框架路径
			, charset: "urt8"	//脚本编码
			, debug: false		//是否调试*/
			locals: {
				name:"static"
				, path:"/"
			}
			, remote: {
				api: ['/']
				, js: ['http://static.kehuda.com:8081','http://static.sududa.com:8081']
			}
			, depend: ['prototype']
			, tag: ''
			, debug: false
		}
		, _loadFails = []
		, _cookieKey = 'FENGS_REMOTE_HOST'
		, _setCookie = function(name, value, day){
			/*if($.browser != "Opera"){
				this.deleteCookie(name,"/pc/");
				this.deleteCookie(name,"/pc");
			}*/
			if(!day){day = 30};
			if(day == "auto"){
				document.cookie = name + "="+ escape (value);
			}else{
				var exp = new Date();
				exp.setTime(exp.getTime() + day*24*60*60*1000);
				document.cookie = name + "="+ escape (value) + ";path=/;expires=" + exp.toGMTString();
			};
		}
		, _getCookie = function(name){
			var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
			if(arr=document.cookie.match(reg)) return unescape(arr[2]);
			else return null;
		}
		, currentHost = parseInt(_getCookie(_cookieKey))
		, _converName = function(name, parentName){
			if(name.indexOf("./") == 0){
				if(parentName.match(/\//g) == null){
					return name.replace(/^\.\//,'');
				};
				return parentName.replace(/(\/[a-zA-Z0-9_\-]*)$/,"/"+ name.replace("./",""));
			}else if(name.indexOf("../") == 0){
				var n, pn;
				n = name.split("../");
				pn = parentName.split("/");
				var leng = n.length - 1
					, len = pn.length - 1;
				pn.length = len;
				for(var j=0; j<leng; j++){
					pn.splice((len - j - 1),1);
				}
				return pn.join('/') + '/'+ name.replace(/(\.\.\/)/ig,'');
			};
			return name;
		}
		, _loadJs = function(src, success, error){
			var script = document.createElement("script")
				, head = document.getElementsByTagName("head")[0]
				, isload = false;
			script.type = "text/javascript";
			script.src = src;
			script.onreadystatechange = function() { 
				var r = script.readyState;
				if(!isload && (r === 'loaded' || r === 'complete')){
					isload = true;
					success && success();
					script.onreadystatechange = null;
					head.removeChild(script);
				} 
			};
			script.onload = function(){
				if(!isload){
					isload = true;
					success && success();
					head.removeChild(script);
				}
			};
			if(error){ script.onerror = error;};
			head.appendChild(script); 
		}
		, _initialized = true
		, _require = function(moduleName){
			var locals = moduleName.indexOf('/') == 0
				, path = locals ? O.locals.path + O.locals.name : O.remote.js[currentHost];
			moduleName = moduleName.replace(/^\//,'');
			var module = fengs.modules[moduleName];
			if(!module){
				fengs.modules[moduleName] = {status:0};
				_loadJs(path + '/' + moduleName +".js?"+ O.tag, function(){}, function(){
					fengs.modules[moduleName] = {fn:function(){},status:-1};
				});
				/*$.ajax({
					url:O.path + (O.debug ? "debug" : O.name) +"/"+ moduleName + (O.debug ? ".debug" : ".min") + ".js?" + O.tag
					, method:"GET"
					, success:function(d){
						d = d.replace(/fengs.add\(function/ig,"fengs.add('"+ moduleName +"',function");
						eval(d);
					}
					, error:function(){
						fengs.modules[moduleName] = {fn:function(){},status:-1};
					}
				});*/
				return false;
			}else{
				if(module.status == 0){
					return false;
				}else if(module.status == -1){
					return fengs.modules[moduleName] = {cb:function(){},status:-1};
				};
				var reqs = !module.req ? [] : module.req
					, err = 0;
				for(var i=0,len=reqs.length; i<len; i++){
					if(!_require(_converName(reqs[i],moduleName))){
						err++;
					};
				};
				return err == 0 ? true : false;
			};
		};
	currentHost = !currentHost ? 0 : currentHost;
	var fengs = {
		modules: {}
		, add: function(NAME,CB,REQ){
			if(!this.modules[NAME] || this.modules[NAME].status == 0){
				this.modules[NAME] = {cb:CB, req:REQ, status:1}
			};
		}
		, config: function(options){
			_initialized = false;
			var _this = this;
			O = $.extend(O,options);
			_this.remote = O.remote;
			for(var i=0, len=O.depend.length; i<len; i++){
				_this.use('common/'+ O.depend[i]);
			};
			_loadJs(O.remote.js[currentHost] +'/common/utils.js', function(){
				_initialized = true;
				_this.use('common/utils');
				_setCookie(_cookieKey, currentHost);
			}, function(){
				currentHost = currentHost == 0 ? 1 : 0;
				_setCookie(_cookieKey, currentHost);
				_initialized = true;
				_this.use('common/utils');
				//W.location.href = W.location.href.replace(/\#[\s\S]+$/ig,'');
			});
		}
		, use: function(NAME, CALLBACK){
			var _self = arguments.callee
				, status = _require(NAME);
			if(!_initialized){
				setTimeout(function(){
					_self(NAME, CALLBACK);
				},50);
				return;
			};
			NAME = NAME.replace(/^\//,'');
			if(!status){
				fengs.modules[NAME].timeout = setTimeout(function(){
					_self(NAME, CALLBACK);
				},50);
			}else{
				var module = fengs.modules[NAME]
					, reqs =  module.req || []
					, argus = []
					, err = 0;
				for(var i=0,len=reqs.length; i<len; i++){
					if(!_require(_converName(reqs[i],NAME))){
						err++;
					};
				};
				
				if(err == 0){
					argus.push(fengs);
					argus.push($);
					for(var i=0,len=reqs.length; i<len; i++){
						argus.push(fengs.use(_converName(reqs[i],NAME)));
					};
					if(!CALLBACK){
						return fengs.modules[NAME].cb.apply(this, argus);
					}else{
						return CALLBACK(fengs.modules[NAME].cb.apply(this, argus));
					};
				};
				fengs.modules[NAME].timeout = setTimeout(function(){
					_self(NAME, CALLBACK);
				},50);
			};
		}
	};
	W.Fengs = fengs;
})(window);