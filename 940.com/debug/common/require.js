Fengs.add('common/require', function(S, $, COOKIE, MD5){
	//三种签名方式
	var gt = ["sign","signpass","signpayment"]
		, u = {
			url: S.remote.api[0]
			, prefix: 'ZX_KEHUDA_'//document.domain.replace(/\./ig,'_') +'_'
			, jsonpHost: S.remote.api[0],
			//是否已请求服务器时间
			b:false,
			//json转array
			emnu:function(inObj){
				var a = new Array();
				for(var i in inObj){
					a.push(i +"="+ inObj[i]);
				};
				return a;
			}
			, pay: function(key){
				return MD5(key + "#@$*)!");
			}
			, pass: function(key){
				return MD5(key + ",vs/..~");
			}
			, loadJs: function(src, fun, error){ 
				var script = document.createElement("script")
					, loaded = false;
				script.type = "text/javascript";
				script.src = src; 
				script.onload = function(){
					loaded = true; 
					document.getElementsByTagName("head")[0].removeChild(script);
				};
				if(error){
					script.onerror = error;
				};
				document.getElementsByTagName("head")[0].appendChild(script); 
			},
			replace: function(data){
				data.client = 50;
				if(!data.format){
					data.format = "json";
				}
				data.ver = "4";
				if(!data.username){
					data.username = S.logined && S.logined.u ?  S.logined.u : '';
				}
				//o.data.username = "1@1.com";
				/*else if(type == 2){
					ckey = "SUDUDA_COM_"+ o.data.username.toUpperCase();
					o.data.cert = $.cookie(ckey + "_CERT");
				};*/
				return data;
			}
			//发送请求
			, get:function(options,time,type, backstr){
				var o = $.extend({
					url:""
					, host: '/'
					, type: "POST"
					, dataType: 'JSON'
					, data: null
					, escape: true
					, success:function(){}
					, p: null
					, error:function(){
						//n.l.h();
						//openWarn("no",g(0));
					}
				},options),sign,argument,ckey;
				o.data = u.replace(o.data);
				o.data.timestamp = time;
				if(type == 1){
					o.p = !o.p ? $.cookie(u.prefix +"PASS") : o.p;
				}else if(type == 2){
					ckey = "SUDUDA_COM_"+ o.data.username.toUpperCase();
					o.data.cert = $.cookie(ckey + "_CERT");
				};
				if(!o.username){
					o.username = $.cookie(u.prefix +"USER");
				}
				var sortobj = u.sort(o.data, o.escape);
				o.url = o.url.replace(/^\//,'');
				o.data = sortobj[0];
				argument = "/"+ o.url + "?"+ u.emnu(sortobj[1]).join("&");
				sign = md5(encodeURIComponent(type != 0 ? argument + "&" + o.p : argument));
				var typestr = gt[type];
				o.data[typestr] = sign;
				if(backstr){
					return argument +'&'+ typestr +'='+ sign;
				};
				if(o.host !== '/' && $.browser.msie && $.browser.version <= '9.0'){
					return u.xhr(o.host + o.url, u.emnu(sortobj[1]).join("&") +'&'+ typestr +'='+ sign, o)
				}
				return $.ajax({
					'url': o.host + o.url
					, 'type': o.type
					, 'dataType': o.dataType[$ === window.jquery ? 'toUpperCase' : 'toLowerCase']()
					, 'data': o.data
					, 'success': function(d){
						try{
							var c = d.sududa;
							if(c.status == -9 && c.tips.indexOf('\u65f6\u95f4\u6233\u5df2\u8fc7\u671f')>=0){
								return u.syscTime(function(){
									u.send(options, type);
								});
							}
						}catch(e){};
						o.success(d);
					}
					, error: o.error
				});
			},
			//生成时间戳
			send:function(o,t,s){
				var now = parseInt(new Date().getTime() / 1000),
					self = arguments.callee;
				try{
					u.b = parseInt($.cookie(u.prefix +"TIMESTAMP"));
					u.b = !u.b ? 0 : u.b;
				}catch(e){
					u.b = 0;
				};
				return this[o.type == 'jsonp' ? 'jsonp' : 'get'](o,(now - u.b),t,s);
			},
			xhr: function(url, args, opt){
				var xmlhttp = false
					, method = opt.type.toUpperCase();
				try{
					xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); // ie msxml3.0+（IE7.0及以上）  
				}catch (e){  
					try{  
						xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //ie msxml2.6（IE5/6）  
					}catch (e2){
						xmlhttp = false;  
					};
				};
				if (!xmlhttp && typeof XMLHttpRequest != 'undefined'){// Firefox, Opera 8.0+, Safari  
					xmlhttp = new XMLHttpRequest();  
				}; 
				xmlhttp.onreadystatechange = function(){ 
					if (xmlhttp.readyState == 4){
						var s = xmlhttp.status;
						if (s >= 200 && s < 300){
							var text = xmlhttp.responseText;
							if(opt.dataType.toUpperCase() === 'JSON'){
								try{
									text = $.parseJSON(text);
								}catch(e){
									text = {};
								};
								opt.success && opt.success(text);
							}else{
								opt.success && opt.success(text);
							}
						}else{ 
							opt.error && opt.error();
						};
					};
				};
				xmlhttp.open(method, url, true);
				if(method == "POST"){
					xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				};
				xmlhttp.send(args);
				return xmlhttp;
			}
			, jsonp: function(options, time, type, backstr){
				var o = $.extend({ 
					url:"",
					data:null
					, escape: true
					, success:function(){},
					p:null,
					error:function(){
						//n.l.h();
						//openWarn("no",g(0));
					}
				},options),sign,argument,ckey;
				var cb = 'JSONP'+ new Date().getTime().toString(36);
				o.data.callback = cb;
				window[cb] = function(d){
					try{
						var c = d.sududa;
						if(c.status == -9 && c.tips.indexOf('\u65f6\u95f4\u6233\u5df2\u8fc7\u671f')>=0){
							return u.syscTime(function(){
								u.send(options, type);
							});
						}
					}catch(e){};
					o.success(d);
				};
				o.data = u.replace(o.data);
				o.data.timestamp = time;
				if(type == 1){
					o.p = !o.p ? $.cookie(u.prefix +"PASS") : o.p;
				}else if(type == 2){
					ckey = "SUDUDA_COM_"+ o.data.username.toUpperCase();
					o.data.cert = $.cookie(ckey + "_CERT");
				};
				o.url = o.url.replace(/^\//,'');
				var sortobj = u.sort(o.data, o.escape);
				o.data = sortobj[0];
				argument = "/"+ o.url + "?"+ u.emnu(sortobj[1]).join("&");
				sign = md5(encodeURIComponent(type != 0 ? argument + "&" + o.p : argument));
				var typestr = gt[type];
				o.data[typestr] = sign;
				u.loadJs(u.jsonpHost.replace(/\/$/,'') + argument +"&"+ typestr +"="+ sign, function(){}, o.error);
			},
			//signpass提交方式
			p:function(options, s){
				//if(this.n()){
					return this.send(options,1,s);
				//};
			},
			//sign提交方式
			s:function(options, s){
				return this.send(options,0,s);
			},
			//signpayment提交方式
			m:function(options, s){
				//if(this.n()){
					return this.send(options,2,s);
				//};
			},
			sort:function(inObj, escape){
				var array = new Array(),
					array2 = new Array(),
					obj = new Object(),
					obj2 = new Object(),
					str,str2;
				for(var i in inObj){
					if(escape){
						str = String(inObj[i]).replace(/\)/g, "）").replace(/\(/g, "（").replace(/\{/g, "｛").replace(/\}/g, "｝").replace(/\\/g, "＼").replace(/\</g, "＜").replace(/\>/g, "＞").replace(/\'/g, "＇").replace(/\!/g, "！").replace(/\~/g, "～").replace(/\ /g, "　");
						str2 = str.replace(/\%/g, "%25").replace(/\+/g, "%2B").replace(/\&/g, "%26");
					}else{
						str2 = str = String(inObj[i]);
						//str2 = str.replace(/\%/g, "%25").replace(/\+/g, "%2B").replace(/\&/g, "%26");
					}
					//str = String(inObj[i]).replace(/\{/g, "%7b").replace(/\}/g, "%7d").replace(/\~/g, "%7e").replace(/\ /g, "%26nbsp%3b").replace(/\+/g, "%2b").replace(/\&/g, "%26").replace(/\\/g, "%5c").replace(/\</g, "%26lt%3b").replace(/\>/g, "%26gt%3b").replace(/\'/g, "%26%2339%3b").replace(/\!/g, "%21").replace(/\%/g, "%25");
					if(inObj.sign0 !== i){
						array2.push({"name":i,"value":str});
						array.push({"name":i,"value":str2});
					}
				};
				array.sort(function(a,b){return a["name"] < b["name"] ? -1 : 1;});
				array2.sort(function(a,b){return a["name"] < b["name"] ? -1 : 1;});
				for(var i = 0; i< array.length; i++){
					obj[array[i].name] = array[i].value;
					obj2[array2[i].name] = array2[i].value;
				};
				return [obj,obj2];//obj转过的,obj2是没转的
			},
			pay:function(key){
				return md5(key + "#@$*)!");
			}
			, syscTime: function(callback){
				var now = new Date().getTime();
				u.s({
					url:"/api/sys_now"
					, type: 'jsonp'
					, data:{format:"json",rnd:now}
					, success:function(d){
						d = d.sududa;
						var _time = 0;
						if(d.status == "1"){
							_time = parseInt(now / 1000) - d.time;
						};
						$.cookie(u.prefix +"TIMESTAMP", _time, {path: '/'});
						callback();
					}
				});
			}
			, getid: function(){
				var d = new Date(),
					o = {
						"y" : String(d.getFullYear()),
						"M" : String(d.getMonth() + 1),
						"d" : String(d.getDate()),
						"h" : String(d.getHours()),
						"m" : String(d.getMinutes()),
						"s" : String(d.getSeconds())
					};
				for(var i in o){
					if(o[i].length == 1){
						o[i] = "0"+o[i];
					};
				};
				o.t = String(d.getMilliseconds());
				for(var i = 0; i < 3 - o.t.length; i++){
					o.t = "0" + o.t;
				};
				return o.y + o.M + o.d + o.h + o.m + o.s + o.t;
			}
			, covertArray: function(inArr){
				if(!inArr || inArr == ""){
					return [];
				}else if($.isArray(inArr)){
					return inArr;
				}else{
					return [inArr];
				}
			}
		};
	//u.syscTime();
	return u;
},["jquery/cookie","./md5"]);