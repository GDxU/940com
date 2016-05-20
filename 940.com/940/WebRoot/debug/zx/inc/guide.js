Fengs.add('zx/inc/guide', function(S, $){
	var uriObj = function(url,cut){
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
		, uri = new uriObj(window.location.href,'?')
		, _w = 1180
		, _h = 823
		, title;
	try{
		title = unescape(uri.title);
		if(uri.w){
			_w = uri.w;
		}
		document.title = "客户达－"+ title;
		document.body.innerHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='"+_w+"px' height='"+_h+"px' codebase='http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab'> <param name='movie' value='"+ unescape(uri.source) +"' /><param name='quality' value='high' /><param name='allowScriptAccess' value='sameDomain' /><embed height='"+_h+"px' width='"+_w+"px' type='application/x-shockwave-flash' src='"+ unescape(uri.source) +"' quality='high' /></object>";
	}catch(e){}
});