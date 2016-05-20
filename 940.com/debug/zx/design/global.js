Fengs.add("zx/design/global", function(S, $, REQ, LAB, CONTROL) {
	var $body = $(window.top.document.body)
		, _bodyUser = $body.data('user')
		, _bodyTid = $body.data('tid');
	return {
		init:function(D){
		var W = window
			, $ = jQuery
			, curIndex = 0
			, $wrap = $(".tb-stdmod-body", D.elem)
			, $a
			, cssurl =  $("link#tempGlobalCss").attr("href")
			, $panel
			, trim = function(str){
				if(typeof str != "string"){
					return "";
				}
				return str.replace(/(^[\s]*|[\s]*$)/ig,"");
			}
			, trimKG = function(str){
				str = str.replace(/  /g," ");
				if(str.indexOf("  ")>=0){
					return arguments.callee(str);
				}else{
					return str;
				};
			}
			, uri = LAB.uriObj(W.location.href,"?")
			, CSS = {
				inputs: []
				, add:function(str){
					str = trim(str);
					if(str == ""){
						return;
					};
					str = str.split("{");
					var obj = this.getObj(str[0])
						, _a = str[1].split(";");
					for(var i=0,len=_a.length;i<len;i++){
						this.pushAttr(obj,_a[i]);
					}
				}
				, getObj:function(id){
					id = trim(id);
					for(var i=0,l=this.list,len = l.length;i<len;i++){
						if(l[i].name == id){
							return l[i];
						}
					};
					var obj = {
						"name":id,
						"get":function(attr){
							return !this.attr[attr] ? "" : this.attr[attr];
						},
						"attr":{}
					}
					this.list.push(obj);
					return obj;
				}
				, pushAttr:function(obj,attr){
					attr = trim(attr);
					if(attr == ""){
						return;
					}
					var index = attr.indexOf(":");
					
					//console.log(attr.substr(0,index));
					//console.log(attr.substr(index+1,attr.length - index));
					obj.attr[attr.substr(0,index)] = attr.substr(index+1,attr.length - index);
					
				}
				, getAttr:function(id,attr){
					var obj = this.getObj(id);
					return !obj.attr[attr] ? "" : obj.attr[attr];
				}
				, setAttr:function(id,attr,val){
					this.getObj(id).attr[attr] = val;
				}
				, list:[]
			}
			, formList = [
				{l:"风格主色",t:"color",p:"风格的常用色彩",b:"main"}
				,{l:"风格副色",t:"color",p:"与风格主色搭配的色彩",b:"sub"}
				,{l:"价格颜色",t:"color",p:"用于价格的色彩",b:"price"}
				,{l:"边框颜色",t:"color",p:"用于模块边框的色彩",b:"border"}
				,{l:"文字颜色",t:"color",p:"用于文字的色彩",b:"text"}
				,{l:"链接颜色",t:"color",p:"用于链接的色彩",b:"link"}
				,{l:"模块背景",t:"color",p:"仅支持部分特定模块的背景色更改",b:"bg"}
			],
			upCss = function(){
				var l = $("link#tempGlobalCss")
					,href = l.attr("href");
				href = href.replace(/\?([\S]*)/g,"");
				l.attr("href",href +"?"+ new Date().getTime());
			},
			loadCSS = function(){
				var html = [];
				$wrap.html("");
				html.push('<div class="editPanel" style="margin-top:0; height:400px; padding:10px 0;"><div class="tab form-default">');
				html.push('<div class="panel" rel="box"><form><div class="set-inner"></div></form></div>');
				html.push('<div class="opt-footer"><a class="btn-ok J_TSubmit">保存</a><a href="javascript:void(0);" class="btn rebtn J_TCancel">恢复默认设置</a></div>');
				html.push('</div>');
				html.push('</div>');
				$wrap.html(html.join(""));
				$a = $("li",$wrap);
				$panel = $(".panel",$wrap);
				CSS.global = window.top.ds_config.global;
				var crateEle = function(obj){
					var $ele = $('<div class="control-group"><label class="control-label" for="">'+ obj.l +'</label><div class="control" control-ui="color"><input class="input-box" ui-type="color" type="text" autocomplete="off" name="'+ obj.b +'" value="'+ CSS.global[obj.b]+'"/><span class="tips">'+ obj.p +'</span></div></div>');
					$panel.append($ele);
				};
				for(var i = 0,len=formList.length; i<len; i++){
					crateEle(formList[i]);
				};
				$("a.btn-ok",$wrap).click(function(){
					if(!uri.id){
						return LAB.warn("请注册登录");
					};
					LAB.loading.show('正在保存全局配置…');
					var obj = {};
					$('input', $panel).each(function(){
						obj[this.name] = this.value;
					});
					REQ.s({
						url:"/api/template_config"
						, escape: false
						, data:{"do":"save", id:uri.id ,data: JSON.stringify(obj)}
						, success:function(d){
							d = d.kehuda;
							LAB.loading.hide();
							if(d.status == 1){
								window.location.href = window.location.href.replace(/\#[\s\S]+$/,'');
							}else{
								LAB.warn(d.tips);
							};
						}
					});
				});
				$("a.rebtn",$wrap).click(function(){
					LAB.loading.show('重置中…');
					REQ.s({
						url:"/api/template_config"
						, escape: false
						, data:{"do":"reset",id:uri.id, "username": _bodyUser,'templateId': _bodyTid}
						, success:function(d){
							d = d.kehuda;
							LAB.loading.hide();
							if(d.status == 1){
								window.location.href = window.location.href.replace(/\#[\s\S]+$/,'');
							}else{
								LAB.warn(d.tips);
							};
						}
					});
				});
				CONTROL($panel);
				//Control($panel);
			};
		loadCSS();
	}};
}, ['common/require', 'zx/lab', 'zx/control/base']);