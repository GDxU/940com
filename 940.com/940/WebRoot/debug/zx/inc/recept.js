Fengs.add('zx/inc/recept', function(S, $, REQ, Cookie){
	$(document).on("selectstart",function(e){
		return false;
	});
	var uri = new S.parseUri(window.location.href,"?")
		, updateTaonick = function(nick,id){
			if(nick != ""){
				$("#nick").html(nick).attr({"href":"http://shop"+ id +".taobao.com/","target":"_blank","title":"点击查看店铺"}).unbind('click');
			}else{
				$("#nick").html("未绑定").attr({"href":"#","target":null}).click(function(e){
					alert("[do]bind[/do]");
					e.stopPropagation();
				});
			};
		};
	//接收用户名和密码并写入到cookie
	if(uri.username && uri.password){
		uri.username = decodeURIComponent(uri.username);
		uri.taonick = decodeURIComponent(uri.taonick);
		uri.shopid = decodeURIComponent(uri.shopid);
		$.cookie(REQ.prefix +"USER",uri.username,{path:"/"});
		$.cookie(REQ.prefix +"PASS",uri.password,{path:"/"});
		$.cookie(REQ.prefix +"NICK",uri.taonick,{path:"/"});
		$.cookie(REQ.prefix +"SHOP",uri.shopid,{path:"/"});
	}else{
		uri.username = $.cookie(REQ.prefix +"USER");
		uri.taonick = $.cookie(REQ.prefix +"NICK");
		uri.shopid = $.cookie(REQ.prefix +"SHOP");
	};
	//updateTaonick(uri.taonick, uri.shopid);
	//$("#user").html(uri.username);
	$(".navbar .fl").css("display","block");
	uri.updateTaonick = updateTaonick;
	return uri;
},["common/require", "jquery/cookie"]);