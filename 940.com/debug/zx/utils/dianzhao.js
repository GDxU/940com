//绑定安全证书
Fengs.add('zx/utils/dianzhao', function(S, $, UI, REQ){
	var BASECSS = function(arrow){
		var arr = [];
		arr.push('.tshop-pbsm-shop-nav-ch, .tshop-pbsm-shop-nav-ch .skin-box-bd,.menu-list .menu{height:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .skin-box-bd{text-align:left;background-color:{@navbg};}');
		arr.push('.tshop-pbsm-shop-nav-ch .link .title{font-family:microsoft yahei;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list{width:830px;height:{@height}px;background-color:transparent;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .link,.tshop-pbsm-shop-nav-ch .skin-box-bd .menu-list .menu-selected .link .title{padding:0 {@navpadding}px;cursor:pointer;background-color:transparent;height:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu{ border-width:0 {@navborder}px 0 0;border-color:{@navbdcolor};background-color:transparent;height:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .title{color:{@navcolor};height:{@height}px;line-height:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover{background-color:{@navbghover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link{background-color:transparent;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .title{color:{@navcolorhover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link{padding:0 20px;cursor:pointer;width:80px;background:none;border:none;height:{@height}px;line-height:{@height}px;background-color:transparent;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .title{color:{@catecolor};height:{@height}px;line-height:{@height}px;font-family:microsoft yahei;font-style:normal;font-weight:bold;text-decoration:none;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats{background-color:{@catebg};height:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-hover{background-color:{@catebghover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-hover .link .title{color:{@catecolorhover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup{background-color:{@menubg};text-align:left;width:180px;top:{@height}px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .snd-pop-inner,.tshop-pbsm-shop-nav-ch .popup-content .cats-tree .snd-pop-inner{_background:none;background:none;padding:0;height:auto;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .fst-cat{border:0;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd .cat-name{color:{@menucolor}; width:75%;padding-left:20px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd .fst-cat,.tshop-pbsm-shop-nav-ch .popup-content .cats-tree .fst-cat{background-color:{@menubg};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd a{height:28px;line-height:28px;position:static;}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd-hover,.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd-hover .fst-cat{background-color:{@menubghover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cats-tree .cat-hd-hover .cat-name{color:{@menucolorhover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd{background-color:{@poperbg};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd a,.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd .cat-name{color:{@popercolor};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd-hover{background-color:{@poperbghover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd-hover a,.tshop-pbsm-shop-nav-ch .all-cats-popup .snd-pop .snd-cat-hd-hover a.cat-name{color:{@popercolorhover};}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-popup-cats{background-color:#b74e3b;width:160px;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-popup-cats .sub-cat-hover{background-color:#d85d47;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-popup-cats .sub-cat a{color:#ffffff;width:auto;height:auto;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-popup-cats .sub-cat-hover a{color:#ffffff;}');
		arr.push('.tshop-pbsm-shop-nav-ch .menu-popup-cats .sub-cat{height:28px;line-height:28px;width:auto;}');
		switch(arrow){
			case "1":
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .popup-icon{border-width:0; margin:11px 7px 0 0;float:right; font-size:0;width:13px;height:10px;display:block;_display:inline;overflow:hidden;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat 0 0 transparent;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .popup-icon{border-width:0;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat -30px -12px transparent;margin-left:10px;margin-top:15px;font-size:0;width:7px;height:7px;display:block;_display:inline;overflow:hidden;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .popup-icon{border-color:{@navcolorhover} {@navbghover} {@navbghover} {@navbghover};}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .has-children .fst-cat-icon{border:3px solid;border-color:{@menucolor};margin-right:5px;margin-top:11px;position:static;font-size:0;width:0;height:0;overflow:hidden;display:block;_display:inline;float:right;}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cat-hd-hover .fst-cat-icon{border-color:{@menucolorhover}}');
			break;
			case "2":
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .popup-icon{border-width:0; margin:11px 7px 0 0;float:right; font-size:0;width:13px;height:10px;display:block;_display:inline;overflow:hidden;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat -30px 0 transparent;}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-hover .link .popup-icon{background-position:-15px 0;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .popup-icon{border-width:0;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat -30px -12px transparent;margin-left:10px;margin-top:15px;font-size:0;width:7px;height:7px;display:block;_display:inline;overflow:hidden;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .popup-icon{border-color:{@navcolorhover} {@navbghover} {@navbghover} {@navbghover};}');
			break;
			case "3":
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .popup-icon{border-width:0; margin:11px 7px 0 0;float:right; font-size:0;width:12px;height:12px;display:block;_display:inline;overflow:hidden;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat -15px -12px transparent;}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-hover .link .popup-icon{background-position:0 -12px;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .popup-icon{border-width:0;background:url(http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif) no-repeat -30px -12px transparent;margin-left:10px;margin-top:15px;font-size:0;width:7px;height:7px;display:block;_display:inline;overflow:hidden;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .popup-icon{border-color:{@navcolorhover} {@navbghover} {@navbghover} {@navbghover};}');
			break;
			default:
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .popup-icon{border:5px solid;border-color: {@catecolor} {@catebg} {@catebg} {@catebg}; margin:14.5px 7px 0 0; float:right; font-size:0;width:0;height:0;display:block;_display:inline;overflow:hidden;}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-hover .link .popup-icon{border-color: {@catecolorhover} {@catebghover} {@catebghover} {@catebghover};}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .popup-icon{border:4px solid;border-color:{@navcolor} {@navbg} {@navbg} {@navbg};margin-left:10px;margin-top:15px;font-size:0;width:0;height:0;display:block;_display:inline;overflow:hidden;}');
			arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .popup-icon{border-color:{@navcolorhover} {@navbghover} {@navbghover} {@navbghover};}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .has-children .fst-cat-icon{border:3px solid;border-color:{@menubg} {@menubg} {@menubg} {@menucolor};margin-right:5px;margin-top:11px;position:static;font-size:0;width:0;height:0;overflow:hidden;display:block;_display:inline;float:right;}');
			arr.push('.tshop-pbsm-shop-nav-ch .all-cats-popup .cat-hd-hover .fst-cat-icon{border-color:{@menubghover} {@menubghover} {@menubghover} {@menucolorhover}}');
			break;
		}
		return arr.join('');
	};
	var hex = function(inStr){
		if(typeof inStr !== 'string'){
			return inStr;
		}
		var m = inStr.match(/^[0-9a-fA-F]{6}$/);
		return m == null ? inStr : '#'+ inStr;
	}
	var toHex = function(incolor){
		if(typeof incolor !== 'string' || incolor == ""  || incolor == "#" ){
			return '#ffffff';
		}
		return incolor.indexOf("#") != 0 && incolor.length == 6 ?  '#'+ incolor : incolor ;
	};
	var getBg = function(cvs, callback){
		var canvas = document.createElement("canvas")
			, con = cvs.config
			, nav = cvs.nav
			, ctx = canvas.getContext("2d")
			, hh = parseInt(con.height)
			, nh = parseInt(nav.height)
			, writeDH = function(){
				ctx.fillStyle = toHex(nav.navbg);
				ctx.fillRect(0, hh, canvas.width, canvas.height);
				ctx.fillStyle = "#ffffff";
				ctx.fillRect(490, 0, 930, canvas.height);
				callback && callback(canvas.toDataURL("image/jpg"));
			};
		canvas.width = 1920;
		canvas.height = (hh + nh);
		ctx.fillStyle = toHex(con.color);
		ctx.fillRect(0, 0, canvas.width, canvas.height);
		if(con.image != ""){
			var img = new Image()
				, start
				, width;
	        img.onload = function () {
	        	if(con.repeat == "repeat-y" || con.repeat == "no-repeat"){
	        		width = img.width;
	        		//start = parseInt((960 - img.width) / 2);
	        		start = width > 1920 ? parseInt((1920 - width) / 2) : parseInt(0 - (width - 1920) / 2);
	        	}else{
	        		width = Math.ceil(1920 / img.width) * img.width;
	        		start = parseInt(0 - (width - 1920) / 2);
	        	};
	        	console.log(start)
	            var pattern = ctx.createPattern(img, "repeat");
	            ctx.fillStyle = pattern;
	            ctx.beginPath();
	            ctx.rect(start, 0, width, canvas.height);
	            ctx.fill();
				writeDH();
	        };

			if(typeof cvs.config.image === 'string' && cvs.config.image.match(/^http:\/\//ig) !== null){
				cvs.config.image = '/img/extranet?'+ cvs.config.image;
			};
	        img.src = cvs.config.image;
		}else{
			writeDH();
		};
	};
	var getCss = function(config){
		var exp;
		var pagecss = ".tshop-pbsm-shop-nav-ch body,.tshop-pbsm-shop-nav-ch .body{ background-image:url({@pageimage});background-repeat:{@pagerepeat};background-color:{@pagecolor};background-position:center 0;background-attachment:{@attach};}\n"
			, navcss = BASECSS(config.nav.navarrow)
			, bannercss = '.tshop-pbsm-shop-banner{height: {@height}px;width:950px;margin: auto;background:url({@crumb}) no-repeat;}\n#hd {background-image:url({@hdimg});background-repeat:repeat-x ;background-position:center 0;background-color:{@color};margin-bottom:0px;}';
		for(var i in config.page){
			exp = eval('(/{@'+ i +'}/gi)');
			config.page[i] = hex(config.page[i]);
			pagecss = pagecss.replace(exp, config.page[i]);
			bannercss = bannercss.replace(exp, config.page[i]);
			//console.log(i +'='+ config.page[i]);
		};
		for(var i in config.nav){
			exp = eval('(/{@'+ i +'}/gi)');
			config.page[i] = hex(config.page[i]);
			navcss = navcss.replace(exp, config.nav[i]);
		};
		return {
			extra: pagecss
			, nav: navcss
			, banner: bannercss
		};
	}
	var $extraCss = $('#extraCss')
		, $navCss = $('#navCss')
		, $bannerCss = $('#bannerCss');
	$('li').click(function(){
		var banner = $(this).data('banner')
			, s = $.parseJSON(banner.s);
		var css = getCss({page: s.config, nav: s.nav});
		$extraCss.val(css.extra);
		$navCss.val(css.nav);
		$bannerCss.val(css.banner);
		getBg(s, function(data){
			$("#hdimg").attr('src', data);
		});
		var t = banner.s.replace('"width":"1920",','');
		t = t.replace('"height":"120",','');
		t = t.replace(/\"crumbid\":\"[\d]+\",/ig,'');
		t = t.replace('"hdimg":"",','');
		t = t.replace('"hdimg":"",','');
		t = t.replace(',"pagerepeat":"repeat-y"','');
		t = t.replace(',"repeat":"repeat-x"','');
		t = t.replace('"pageimage":"",','');
		t = t.replace('"image":"",','');
		console.log('{_id:,e:"[]'+ banner.e +'",s:"'+ t.replace(/\"/ig, '\\\"') +'",n: "'+ banner.n +'"}');
	});
	$('input').click(function(e){
		var $this = $(this)
			, checked = this.checked;
		REQ.s({
			url: '/api/dianzhao_mark'
			, data: {'username': 'ming@sdd.com', 'id': $this.data('id'), 'mark': !checked ? 0 : 1}
			, success: function(d){
				if(d.status == 1){
					$this.parent().css({'color': !checked ? '#000' : '#ccc'}).siblings('div').css('display', checked ? 'none' : 'block');
				}else{
					UI.warn('操作失败','err');
				}
			}
		});
		e.stopPropagation();
	})
}, ['ui/base', 'common/require']);