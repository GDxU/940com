Fengs.add('zx/lab', function(S, $, Cover, undefined){
	var loadbg = "data:image/gif;base64,R0lGODlhGwAKANQNALrU7HWr2N3p9dLj8qPH5kiPzejx+Wmk1Yy538Xb8JfA4l6d01KW0PT4/ICy3K7N6AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJBQAQACwAAAAAGwAKAAAFVyAkjiQEBGgAlCwkDINAEkVtE+Qbi/QtDrZgYcALEgzCggFySNYOEKSwZ4Q4bRDqLYm71rJJQZh5hYqFEEQQUXTi0mtRgkBIkBRJBWleb5UACzUMK34QIQAh+QQJBQAQACwBAAAAGQAKAAAFVSAkjiQkECghlGWSNiNRzDQBDbgxDnQRiIZe79AbQAwMoQKiEDpnC4jMCQk8n4OpsHp1DgROB7PbY4gAyVkAxnsueoBdIIAgaWuQB2rFYgkQcwh8LCEAIfkECQUAEAAsAgAAABUACgAABVEgJI4kZDwE8TRlA6TEMBpMYRdMMrCQc9sCSOPw+zEagmLBASEofwinEhJ4/qRFqvWWUB4giu0SQvwlTLUnI9h4BAIOmUhQth1SvFIL8UbkISEAIfkECQUAEAAsAwAAABMACgAABUggJI6kKAyoQSpBS5BOIRdMIj6z/IhELjMNgU8maDCGBUJvSBggC4Glr/kMOIeDxlMBQfgQIu9QBQEcGYBRQ/yzld6QgfJBDgEAIfkECQUAEAAsBAABABMACQAABT8gJBxFeQjiADBl4TRQQ7bFodA0AhF43w8Bn7BECA59hNuxl2iwaAyEMACBGGY1AyRBIDwLCFg1hRqPBwNtNQQAIfkECQUAEAAsBQABABMACQAABT0g1DhFyQCDAAlHWRwqhLh0obT00Qx13xMEn7AUCA59gcTRp4AEhAhGjdEQzUzABMSAexkg4O1gEC4LUuEQACH5BAkFABAALAYAAAATAAoAAAVIIAQ1QzmIaJomS+EWQaoENCE2zPva0KMXDwjh52I0BMSCIJAsDIZEAjP5TBIUTRLVkESIED8vhKVzNFCAHAOQajwIhIRqDgkBACH5BAkFABAALAUAAAAVAAoAAAVQICRCxkMQTzOubDMkTCEXjDEKJ6o28ewfKoGv4IAghkMCxIEUIn0ByJPwhEqRBGa1oIAckAlBD1mDJIYHUeP0nR0EN0cgQFCtGog5ws5ahQAAIfkECQUAEAAsAgAAABkACgAABVMgJI6iQJyEQK6kMbwQUcw0MTZoMg50cfQ9gyjQG4gWwORMAVEAGS6lMgBREnhSINUKYWR7TEdSBeghlcYGccYAjEyERyxpGyECASPrfQ8gVHsjIQAh+QQJBQAQACwAAAAAGwAKAAAFVyAkjiQEBGgAlCwkDINAEkVtE+Qbi/QtDrZgYcALEgzCggFySNYOEKSwZ4Q4bRDqLYm71rJJQZh5hYqFEEQQUXTi0mtRgkBIkBRJBWleb5UACzUMK34QIQAh+QQJBQAQACwBAAAAGQAKAAAFUiAkjiQkECghlOWDPiRRzDRhDsMqyrVo0MACAmhLBAsJiOLILBgCxwAE2gwSqEAptjojPI6wJZe2Es8UokFzixg9AgHYiEeEJFBJFkuAgCN0LCEAIfkECQUAEAAsAgAAABYACgAABVUgJI4kZDwE8TSliabGaDBFXTDJIIjNYhcLVuPwKxIgj2LhASEoi4aAMgCRPm0E64+qvRIUSgUEfK0JZj9GDH1FiAyKQAAREwmItkMq0eo3EHIILCQhACH5BAkFABAALAMAAAATAAoAAAVMICSOJNQM6NCMQuA6wmgsRV0shknbywodNtsB4gjWHJCE0aZcFiAEZyHqhEoJgWUgKU0IGEFGDLILLkSNbCHggwiAwnGp1AAQCABfCAAh+QQJBQAQACwEAAAAEwAKAAAFRyAkjqQ4nEMzPkEbPONwFHSxGFBS1wlE7LUAZAY8GIC7AZL2WxaaSGiUuDsInIXEAwlDLBeiB4PGgIkSgaqgxBYBCASAChICACH5BAkFABAALAQAAQAUAAkAAAU4IAQRRVkQwjAIpEmIEGDO9AxADVPvJtMMvGBBJeQNGsVdY5ScvUSP2SNBICSipgdM9DtuuaqlKAQAIfkECQUAEAAsBQAAABMACgAABUQgJA7k0IhoihpH4RbLgD5BHTxi8O4ElOyuxAC4YxEPBOIrqWQ2lYUfVNACHiALJQLyIOIEutchMWO4GDgUgEAAnFSqEAAh+QQJBQAQACwGAAAAEwAKAAAFSyAENUM5NGKqpsZSvMVipEJgO4J4wPAhNi7YopHg8RIQh7HgICxfBMiz4HxGp8UnMrAMQIK8hUjA4DFygl0v9+MWAqgfgEAAxFeqEAAh+QQJBQAQACwEAAAAFgAKAAAFUyAkisZDEE8zriwkDAlTzAVjjOVJ3BBB/7ODqrH4LRoGoJIAeShNSmAAElAGfFHatCoVZGkKiEIZRnxtEIOMhoYkToffQYBTBAII3qqBuCNULSshACH5BAkFABAALAIAAAAZAAoAAAVVICSOokCchECupDAMKlHMNEE+5zPKNEL/BYOIN7MZgEiaApJAJojJXwASQAag0dm0CgwIssDlA6nz0bjIgUjxW4qehAQEW7CNHoGAjjUSIPIIKnwjIQAh+QQFBQAQACwAAAAAGwAKAAAFVyAkjiQEBGgAlCwkDINAEkVtE+Qbi/QtDrZgYcALEgzCggFySNYOEKSwZ4Q4bRDqLYm71rJJQZh5hYqFEEQQUXTi0mtRgkBIkBRJBWleb5UACzUMK34QIQA7";
	var convert = function(instr){
		try{
			instr = instr.replace(/[\\\/]/ig, function(a){ return '\\'+ a}).replace(/\n/ig,'');
			instr = instr.replace(/(\"(cid|num_iid|picture_category_id|parent_id|picture_id)\":[\d]+)/ig, function(a){ return a.replace(/:/,':"') +'"';});
			instr = instr.replace(/[\u3000\t\n\r\b]/g,'');
			return $.parseJSON(instr);
		}catch(e){
			return {'error_response': '数据无法正常解析'}; 
		}
	};
	var oauthAbnormal = function(data, callback){
		return Cover.oauth(callback);
	};
	return {
		test:function(inStr, inType){
			if(inStr == null || inStr =="" || inType == null || inType == ""){
				return false;
			};
			var reg;
			switch(inType){
				case "decimal":
					reg = /^-?\d+(\.\d+)?$/g;
					break;
				case "int":
					reg = /^[-+]?\d*$/;
					break;
				case "email":
					reg = /[A-Za-z0-9_-]+[@](\S*)([A-Za-z0-9_-])(\S*)/g;
					break;
				case "mobile":
					reg = /^1([3,5,8]\d|4[5,7])\d{8}$/g;
					break;
				case "areacode":
					reg = /^0(10|2\d|[3-9]\d{2})$/g;
					break;
				case "phone":
					reg = /^0(10\d{8}|2\d{9}|[3-9]\d{9,10})$/g;
					break;
				case "qq":
					reg = /^\d{5,10}$/;
					break;
				case "ip":
					reg = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;;
					break;
				case "url":
					reg =/(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i;
					break;
				case "number":
					reg = /^[-+]?\d*$/;
					break;
				case "letter":
					reg = /^[a-zA-Z]\w*$/;
					break;
				case "alphanumeric":
					reg = /\w/;
					break;
				//是否含有中文
				case "chinese":
					reg = /[\u4E00-\u9FFF]/;
					break;
				case "taoid":
					reg = /^\d{13,19}$/;
					break;
				default:
					return true;
					break;
			};
			if(inStr.match(reg) == null){
				return false;
			}else{
				return true;
			};
		},
		//数组对象
		array:{
			//复制另一个数组
			copyArray:function(inSrcArray, inDestArray ){
				for(var i = 0,len = inSrcArray.length; i < len; i++){
					inDestArray.push(inSrcArray[i]);
				};
				return inDestArray;
			},
			//获得值在数组中的索引序号
			findInArray:function(inArray, inValue){
				for(var i = 0,len = inArray.length; i < len; i++){
					if(inArray[i] == inValue){
						return i;
					};
				};
				return -1;
			},
			//取得数组平均值
			arrayAverage:function(inArray){
				var accumulator = 0;
				for(var i = 0,len = inArray.length; i < len; i++){
					accumulator += inArray[i];
				};
				return accumulator / inArray.length;
			},
			isRepeat:function(array){
				var l = array.length;
				if(l == 0){ return 0;};
				for(var i=0; i<l; i++){
					for(var j=i+1; j<l; j++){
						if(array[i] == array[j]){
							return j;
						};
					};
				};
				return 0;
			},
			sort:function(inArray,attr,order){
				var sortBy = function (filed, reverse, primer) {  
					reverse = (reverse) ? -1 : 1;  
					return function(a,b){
						a = a[filed];
						b = b[filed];
						/*if (typeof (primer) != "undefined"){
							a = primer(a);
							b = primer(b);
						};*/
						if (a < b){  
							return reverse * -1;  
						}else{  
							return reverse * 1;  
						};  
					};
				};
				inArray.sort(sortBy(attr, order, parseInt));
				return inArray;
			},
			randomSort:function(inArr){
				var len = inArr.length; 
				for (var i = 0; i < len; i++) {  
					inArr[i] = inArr[i];  
				}  
				inArr.sort(function(){return Math.random()>0.5?-1:1;})  
				return inArr;  
			}
		},
		'request': function(options, callback){
			var _self = arguments.callee
				, _this = this
				, $body = $(top.document.body)
				, _bodyClient = $body.data('client')
				, _bodyUser = $body.data('user');
			if(_bodyClient == 'client'){
				var timestamp = new Date().getTime().toString(32)
					, _this = this
					, cb = 'cb'+ timestamp + parseInt(Math.random() * 100000).toString(32);
				window.top[cb] = function(a, b){
					if(!a){
						return _this.warn('\u8bf7\u6c42\u56fe\u7247\u5931\u8d25');
					};
					var obj = convert(b);
					//console.log(callback);
					//console.log(b);
					//try{
						//b = b.replace(/[\d]{12,25}/ig, function(e){ return '"'+ e +'"';});
					//console.log(b);
					/*}catch(e){
						try{
							obj = $.parseJSON(b);
						}catch(e){}
					};*/
					callback(obj);
					delete window.top[cb];
				};
				var arr = [];
				for(var i in options){
					arr.push(i +'='+ options[i]);
				};
				alert('[do]request[/do][param]'+ arr.join('&') +'&callback='+ cb +'[/param]');
				// for(var i in options){
				// 	if(options[i].macth(/[\u4E00-\u9FFF]/) !== null){
				// 		options[i] = encodeURIComponent(options[i]);
				// 	}
				// }
			}else{
				$.ajax({
					'url': '/taobao/'+ _bodyUser
					, 'data': options
					, 'type': 'post'
					, 'dataType': 'json'
					, 'success': function(d){
						d = d.kehuda;
						if(d.status == 1){
							var obj = convert(d.data);
							callback(obj);
						}else if(d.status == '-1'){
							oauthAbnormal(d, function(){
								_self(options, callback);
							});
							_this.loading.hide();
							_this.warn(d.tips);
							//return callback({'error_response': {'msg': 'Invalid session'}});
						}else{
							_this.loading.hide();
							return _this.warn(d.tips)
						};
					}
				});
			}
		}
		, 'uploadImg': function(picture_id, category_id, imgdata, callback){
		//, "uploadImg": function(filename, callback){
			var _this = this
				, $body = $(top.document.body)
				, _bodyClient = $body.data('client')
				, _bodyUser = $body.data('user')
			picture_id = picture_id || 0;
			_this.loading.show('图片上传中…');
			if(_bodyClient == 'client'){
				//客户端处理
				var timestamp = (new Date().getTime().toString(36)) + Math.floor(Math.random() * 99999).toString(36)
					, cb = 'cb'+ timestamp;
				console.log(timestamp);
				window.top[cb] = function(status,tips, obj){
					_this.loading.hide();
					if(status == 1){
						callback && callback(obj.picture_upload_response.picture);
					}else{
						_this.warn(tips);
					};
				};
				alert("[do]taobaopicturereplace[/do][title]picture_id="+ picture_id +"&picture_category_id="+ category_id +"[/title][param]"+ imgdata +"[/param][url]"+ cb +"[/url]");
			}else{
				var imgName = new Date().getTime().toString(36);
				//if(picture_id == 0){
					//新上传
					$.ajax({
						'url': '/taobao/'+ _bodyUser
						, 'data': {
							'method': 'taobao.picture.upload'
							, 'image_input_title': imgName +'.jpg'
							, 'title': imgName
							, 'picture_category_id': category_id
							, 'img': imgdata
						}
						, 'type': 'post'
						, 'dataType': 'json'
						, 'success': function(d){
							d = d.kehuda;
							if(d.status == 1){
								_this.loading.hide();
								var obj = convert(d.data);
								callback && callback(obj.picture_upload_response.picture);
							}else if(d.status == '-1'){
								oauthAbnormal(d, function(){
									_self(options, callback);
								});
								_this.loading.hide();
								_this.warn(d.tips);
							}else{
								return _this.warn(d.tips);
							};
						}
					});
				/*}else{
					//替换
					$.ajax({
						'url': '/taobao/'+ _bodyUser
						, 'data': {
							'method': 'taobao.picture.replace'
							, 'picture_id': picture_id
							, 'title': imgName
							, 'image_data': imgdata
						}
						, 'type': 'post'
						, 'dataType': 'json'
						, 'success': function(d){
							d = d.kehuda;
							if(d.status == 1){
								_this.loading.hide();
								var obj = convert(d.data);
								if(obj.picture_replace_response){
									$.ajax({
										'url': '/taobao/'+ _bodyUser
										, 'data': {
											'method': 'picture_get_response'
											, 'picture_id': picture_id
										}
										, 'type': 'post'
										, 'dataType': 'json'
										, 'success': function(d){
											if(d.status == 1){
												var pic = convert(d.data);
												if(pic.pictures && pic.pictures.length > 0){
													callback && callback(pic.pictures[0]);
												}
											}
										}
									});
								}
							}else if(d.status == '-1'){
								if($box.length == 0){
									$box = $('<div class="oauth-box" style="opacity: 1;"><div class="box-container"></div><a href="/oauth?do=session&user='+ _bodyUser +'" target="new">\u53bb\u6dd8\u5b9d\u6388\u6743</a><br/><a href="#" class="success">\u6388\u6743\u6210\u529f</a><br/><a href="#" class="fail">\u6388\u6743\u5931\u8d25</a></div>');
									$('body').append($box);
								};
								$box.show().on('click', 'a.fail', function(){
									$box.fadeOut(function(){
										$box.remove();
									});
								}).on('click', 'a.success', function(){
									$box.remove();
									_self(options, callback);
								});
								_this.loading.hide();
							}else{
								return _this.warn(d.tips);
							};
						}
					});
				}*/
			};
		}
		, uriObj:function(url,cut){
			cut = cut || "?";
			var end=cut=="?"?"#":"?"
				,obj = {}
				,arr;
			cut = url.indexOf(cut);
			end = url.indexOf(end);
			if(cut >= 0){
				cut++;
				url = url.substr(cut,end>cut?end-cut:url.length);
				url = url.split("&");
				for(var i = 0,len=url.length; i < len; i++){
					try{
						arr = url[i].split("=");
						obj[arr[0]] = arr[1];
					}catch(e){};
				};
			}
			return obj;
		}
		/*, upload:function($this){
			$.use("modules/upload",function(UPLOAD){
				var $upbtn = $('<a class="upbtn" title="上传图片"></a>')
					, $delbtn = $('<a class="delimg" title+"清除图片"></a>')
					, $upload = new UPLOAD();
				$this.before($upbtn).after($delbtn).on("change",function(){
					$delbtn.css("visibility", $this.val() == "" ? "collapse" : "visible");
				});
				$delbtn.click(function(){
					$this.val('').trigger('change');
				});
				$upload.init($upbtn, function(imgurl, id){
					$this.val(imgurl).trigger('change');
				});
				$delbtn.css("visibility", $this.val() == "" ? "collapse" : "visible");
			});
		}*/
		, warn:function(e,n) {
			var i = $("#ui_warn");
			if(typeof e != "string"){
				return;
			}
			e = e.indexOf("！")<0 ? e + "！" : e;
			if(i.length == 0){
				i = $('<div class="ui_mark" id="ui_warn"><div class="ui_content"><span>' + e + '</span></div></div>');
				$("body").append(i);
			}else{
				i.find("span").text(e);
			};
			setTimeout(function() {
				i.remove();
			},1500);
		}
		, loading:{
			show:function(e){
				if(S._loadCount == undefined){
					S._loadCount = 0;
				}
				S._loadCount++;
				if(!!e && typeof e === 'string'){
					e = e.indexOf("…")<0 ? e + "…" : e;
				}else{
					e = '加载中…'
				};
				setTimeout(function(){
					if(S._loadCount > 0){
						var i = $("#ui_loading");
						if(i.length == 0){
							i = $('<div class="ui_mark" id="ui_loading" style="z-index: 10000409;"><div class="ui_content"><span style="background-image:url('+ loadbg +');">' + e + '</span></div></div>');
							$("body").append(i);
						}else{
							i.find("span").text(e);
						};
					}
				}, 300);
			}
			, hide:function(){
				S._loadCount--;
				if(S._loadCount === 0){
					$("#ui_loading").fadeOut(function(){
						$(this).remove();
					});
				};
			}
		}
		, prompt:function(title, label, value, callback){
			var $ele = $('<div class="ui_mark" id="ui_prompt"></div>')
				, _this = this
				,html = [];
			html.push('<div class="prompt"><div class="title">'+ title +'</div>');
			html.push('<div class="form_groud">');
			html.push('<div class="form_item">');
			html.push('<input type="hidden" name="format" value="json"/>');
			html.push('<label>'+ label +'</label>');
			html.push('<input type="text" id="text" value="'+ value +'" placeholder="'+ label +'"/>');
			html.push('</div>');
			html.push('<div class="form_sub">');
			html.push('');
			html.push('<a class="btn blue btnok">确定</a>');
			html.push('<a class="btn btncl">取消</a>');
			html.push('</div></div>');
			html.push('</div>');
			$ele.html(html.join(''));
			$("body").append($ele);
			$ele.find("input")[0].select();
			$ele.on("click","a.btncl",function(){
				$ele.fadeOut($ele.remove());
			}).on("click","a.btnok",function(){
				var val = $("input#text", $ele).val();
				if(val == ""){
					_this.warn('请输入'+ label);
				}else{
					callback && callback(val);
					$ele.fadeOut($ele.remove());
				};
			});
		}
		, dateFormat: function(fmt){
			var o = {
			    "M+": this.getMonth() + 1, //月份 
			    "d+": this.getDate(), //日 
			    "h+": this.getHours(), //小时 
			    "m+": this.getMinutes(), //分 
			    "s+": this.getSeconds(), //秒 
			    "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			    "S": this.getMilliseconds() //毫秒 
			};
			if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
			for (var k in o)
			if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
		}
		, moveDrop: function(target, doc){
			var $doc = doc || $(top.document)
				, $this = this;
			var startX, startY, startL, startT;
			var _x = $this.width();
			var mouseCoords = function(ev){ 
				if(ev.pageX || ev.pageY){ 
					return {x:ev.pageX, y:ev.pageY}; 
				} 
				return{ 
					x:ev.clientX + top.document.body.scrollLeft - top.document.body.clientLeft, 
					y:ev.clientY + top.document.body.scrollTop - top.document.body.clientTop 
				}; 
			};
			var move = function(e){
				e = e || event;
				var poss = mouseCoords(e);
				var _w = top.document.body.clientWidth;
				var _left = startL + poss.x - startX
					, _top =  startT + poss.y - startY;
				_top = _top > 600 ?  600 : _top;
				_top = _top < 0 ? 0 : _top;
				_left = _left > _w - _x ?  _w - _x : _left;
				_left = _left < 0 ? 0 : _left;
				$this.css({left: _left,top: _top})
				e.stopPropagation();
			};
			$doc.on('mouseup', function(e){
				$doc.off('mousemove', move);
				$this.css('opacity', 1);
			})
			$(target, $this).on('mousedown', function(e){
				e = e || event;
				var poss = mouseCoords(e);
				startX = poss.x;
				startY = poss.y;
				startL = parseInt($this.css('left'));
				startT = parseInt($this.css('top'));
				$doc.on('mousemove', move);
				$this.css('opacity', 0.8);
				return false;
			});
		}
		, jsonToStr: function(o){	
			var arr = []
				, self = arguments.callee
				, fmt = function(s) { 
					if (typeof s == "object" && s != null){
						return self(s);
					}
					return  /^(string|number)$/.test(typeof s) ? '"' + s + '"' : s; 
				}
			if(Object.prototype.toString.call(o) === '[object Array]'){
				for(var i in o){
					arr.push(fmt(o[i]));
				}
				return '[' + arr.join(',') + ']'; 
			}else{
				for(var i in o){
					arr.push('"' + i + '":' + fmt(o[i]));
				}
				return '{' + arr.join(',') + '}'; 
			}
		}
	};
}, ['zx/ui/cover']);