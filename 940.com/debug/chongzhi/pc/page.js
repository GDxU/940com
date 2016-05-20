Fengs.add('chongzhi/pc/page', function(S, $, u){
	var p = {
		url:window.location,
		//是否登录
		logined:new u.g(),
		//页面宽度
		width:function(){
			return document.documentElement.clientWidth;
		},
		//页面高度
		height:function(){
			return document.documentElement.clientHeight;
		},
		mainbody:$.find("#mainbody"),
		//容器
		container:$.find("#container"),
		storage:window.localStorage ? true : false,
		q:function(){
			openConfirm({
				ok:g(149),
				text:g(61),
				backtrue:function(){
					$.storage.deleteCookie("SUDUDA_COM_LOGINED","/");
					$.storage.deleteCookie("SUDUDA_COM_PASS","/");
					$.storage.deleteCookie("SUDUDA_COM_LOGINED","/pc");
					$.storage.deleteCookie("SUDUDA_COM_PASS","/pc");
					$.storage.deleteCookie("SUDUDA_COM_LOGINED","/pc/");
					$.storage.deleteCookie("SUDUDA_COM_PASS","/pc/");
					$.storage.deleteCookie("SUDUDA_COM_LOGINED","/phone");
					$.storage.deleteCookie("SUDUDA_COM_PASS","/phone");
					$.storage.deleteCookie("SUDUDA_COM_LOGINED","/phone/");
					$.storage.deleteCookie("SUDUDA_COM_PASS","/phone/");
					window.location = g(73);
				}
			});
		},
		z:function(){
			if(!window.XMLHttpRequest){
				return;
			}
			if(p.container.offsetHeight + 120 < p.height()){
				p.mainbody.css("height",p.height() - 120 +"px");
			}else{
				p.mainbody.css("height","auto");
			};
		},
		h:null
	};
	S.logined = p.logined.sududa;
	return p;
}, ['../utils/base']);