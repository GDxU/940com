Fengs.add('zx/maker/navcss', function(){
	return function(arrow){
	var arr = [];
	arr.push('.tshop-pbsm-shop-nav-ch .skin-box-bd,.menu-list .menu{height:{@height}px;}');
	arr.push('.tshop-pbsm-shop-nav-ch .skin-box-bd{text-align:left;background-color:{@navbg};}');
	arr.push('.tshop-pbsm-shop-nav-ch .link .title{font-family:微软雅黑;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list{width:830px;height:{@height}px;background-color:transparent;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .link,.tshop-pbsm-shop-nav-ch .skin-box-bd .menu-list .menu-selected .link .title{padding:0 {@navpadding}px;cursor:pointer;background-color:transparent;height:{@height}px;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu{ border-width:0 {@navborder}px 0 0;border-color:{@navbdcolor};background-color:transparent;height:{@height}px;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu .link .title{color:{@navcolor};height:{@height}px;line-height:{@height}px;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover{background-color:{@navbghover};}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link{background-color:transparent;}');
	arr.push('.tshop-pbsm-shop-nav-ch .menu-list .menu-hover .link .title{color:{@navcolorhover};}');
	arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link{padding:0 20px;cursor:pointer;width:80px;background:none;border:none;height:{@height}px;line-height:{@height}px;background-color:transparent;}');
	arr.push('.tshop-pbsm-shop-nav-ch .all-cats .link .title{color:{@catecolor};height:{@height}px;line-height:{@height}px;font-family:微软雅黑;font-style:normal;font-weight:bold;text-decoration:none;}');
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
	//http://img01.taobaocdn.com/imgextra/i3/TB12kcjGXXXXXXOapXXtKXbFXXX.gif
});
Fengs.add('zx/maker/img', function(){
	return [
	{
		id:"xinping",
		name:"新品",
		list:[5,19,21,37,41,46,134,135,136,137,138,192,204,211,214,226,231,234,237,248,255,258,270,302,305,326,327,329,330,333,339,341,357,372,373,374,375,384,386,387,415,416]
	},
	{
		id:"remai",
		name:"热卖",
		list:[11,18,26,38,39,45,50,162,165,167,173,174,182,183,184,188,189,198,206,220,250,264,279,280,281,283,284,285,286,287,288,309,334,340,344,353,385,396,417,418,419,466,471,475,486,489,492,499,503]
	},
	{
		id:"tejia",
		name:"特价",
		list:[12,14,15,17,20,24,28,30,35,36,42,43,44,48,116,139,164,166,171,175,180,181,187,190,193,196,197,199,202,210,212,215,216,221,222,227,230,233,235,238,241,242,243,246,254,256,259,260,265,266,290,291,292,293,294,295,296,297,298,300,301,304,310,311,331,336,342,355,362,365,368,369,371,376,381,383,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,420,459,468,473,479,481,484,493,502]
	},
	{
		id:"zhengping",
		name:"正品",
		list:[3,10,27,34,101,110,123,148,157,169,172,178,306,307,318,320,328,335,343,345,346,347,348,349,350,351,352,364,377,379,460,469,483,487,488,497,501,507,509]
	},
	{
		id:"baoyou",
		name:"包邮",
		list:[13,23,32,49,113,114,115,117,149,150,159,163,188,191,213,217,236,272,273,274,275,276,277,278,289,312,322,332,358,359,363,378,380,465,470,474,478,504]
	},
	{
		id:"yuansu",
		name:"元素",
		list:[102,103,107,111,112,121,122,125,126,127,128,129,130,131,132,133,138,145,146,147,151,152,153,154,155,158,160,194,239,249,299,303,314,321,323,337,338,390,398,421,423,428,431,435,439,442,446,451,454,455,462]
	},
	{
		id:"qita",
		name:"其它",
		list:[2,16,22,25,29,40,47,100,104,106,108,109,118,120,124,168,170,176,177,179,195,200,201,203,207,208,209,217,218,219,223,224,225,229,232,240,244,245,247,251,252,253,261,262,263,267,268,269,319,356,360,361,382,397,414,457,458,463,464,467,472,476,477,480,482,485,490,491,495,496,498,500,505,506,508]
	},
	{
		id:"user",
		name:"自定义",
		list:[]
	}]
});
Fengs.add('zx/maker/fonts', function(){
	return {
		zh:{
			name:"中文字体"
			, list:[
				{
					id:"simsun"
					, title:"宋体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1qahhGXXXXXXTapXXSutbFXXX.jpg"
				}
				, {
					id:"zmsyh"
					, title:"雅黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1uGWeGVXXXXXFXpXXSutbFXXX.jpg"
				}
				, {
					id:"zkaiti"
					, title:"清茶楷体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1dEBtGVXXXXcSXFXXSutbFXXX.jpg"
				}
				, {
					id:"zheiti"
					, title:"黑体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1c1FaGXXXXXayapXXSutbFXXX.jpg"
				}
				, {
					id:"chenjishi"
					, title:"硬笔行书"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1v1d9GXXXXXXWaXXXSutbFXXX.jpg"
				}
				, {
					id:"sszh"
					, title:"时尚中黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1M0J.GXXXXXXkapXXSutbFXXX.jpg"
				}
				, {
					id:"fzzch"
					, title:"正粗黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1qy0WGXXXXXaZaXXXSutbFXXX.jpg"
				}
				, {
					id:"fzjz"
					, title:"剪纸体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1ewBSGXXXXXbAXVXXSutbFXXX.jpg"
				}
				, {
					id:"fzcch"
					, title:"超粗黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB123F4GXXXXXaYapXXSutbFXXX.jpg"
				}
				, {
					id:"fzcq"
					, title:"粗倩"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1NPqKGXXXXXboapXXSutbFXXX.jpg"
				}
				, {
					id:"ztuzi"
					, title:"兔子馒头"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1jnR2GVXXXXXvXVXXSutbFXXX.jpg"
				}
				, {
					id:"mncgh"
					, title:"超刚黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1gS85GXXXXXcRXVXXSutbFXXX.jpg"
				}
				, {
					id:"mnjzh"
					, title:"粗活意"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1ZpV7GVXXXXa5XFXXSutbFXXX.jpg"
				}
				, {
					id:"pop"
					, title:"中文POP"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1sZLtGXXXXXaSXVXXSutbFXXX.jpg"
				}
				, {
					id:"fzcs"
					, title:"粗宋"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1XFeXGXXXXXbLaXXXSutbFXXX.jpg"
				}
				, {
					id:"fzyh"
					, title:"艺黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1SEWPGXXXXXcLXVXXSutbFXXX.jpg"
				}
				, {
					id:"zshaoer"
					, title:"少儿体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1fhAtGFXXXXcWXFXXSutbFXXX.jpg"
				}
				, {
					id:"ltth"
					, title:"特黑"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1rrJQGXXXXXcgXVXXSutbFXXX.jpg"
				}
				, {
					id:"tianranmeng"
					, title:"天然萌"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1iJvWGXXXXXcfXVXXSutbFXXX.jpg"
				}
				, {
					id:"tmhk"
					, title:"荼蘼花开"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1eHtVGXXXXXb6aXXXSutbFXXX.jpg"
				}
				, {
					id:"shct"
					, title:"尚黑长体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB160R6GXXXXXbraXXXSutbFXXX.jpg"
				}
				, {
					id:"cyls"
					, title:"蚕燕隶书"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1_DBRGXXXXXXWaXXXSutbFXXX.jpg"
				}
				, {
					id:"ylcx"
					, title:"烟绿残香"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1zXB_GXXXXXX6aXXXSutbFXXX.jpg"
				}
				, {
					id:"zxxka"
					, title:"星星可爱"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1MA1dGVXXXXXQXpXXSutbFXXX.jpg"
				}
				, {
					id:"zmnffz"
					, title:"繁方篆"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1HvpYGVXXXXafXVXXSutbFXXX.jpg"
				}
				, {
					id:"zxinkai"
					, title:"行楷"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB18busGpXXXXXYapXXSutbFXXX.jpg"
				}
				, {
					id:"zmiaowu"
					, title:"喵呜"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1xD4dGVXXXXaVXVXXSutbFXXX.jpg"
				}
				, {
					id:"zltm"
					, title:"蓝天梦"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB15rXkGVXXXXcSXFXXSutbFXXX.jpg"
				}
				, {
					id:"zfzpty"
					, title:"胖头鱼"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1e3X7GVXXXXbaXpXXSutbFXXX.jpg"
				}
				, {
					id:"zmao"
					, title:"毛泽东"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1U7N8GVXXXXc1XpXXSutbFXXX.jpg"
				}
				, {
					id:"hylx"
					, title:"隶变"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1R6OgGVXXXXa2XXXXSutbFXXX.jpg"
				}
				, {
					id:"zfzzy"
					, title:"综艺"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1qHrOGFXXXXcDXVXXSutbFXXX.jpg"
				}
				, {
					id:"zshaonu"
					, title:"少女体"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1RNNFGVXXXXclXpXXSutbFXXX.jpg"
				}
				, {
					id:"zxiaokai"
					, title:"六朝小楷"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1ss1eGVXXXXcyXXXXSutbFXXX.jpg"
				}
				, {
					id:"zkitty"
					, title:"Kitty碎花"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1UGd6GVXXXXbGXFXXSutbFXXX.jpg"
				}
				, {
					id:"zjjahc"
					, title:"卷卷红唇"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB17hF5GVXXXXbUXFXXSutbFXXX.jpg"
				}
			]
		}
		, en:{
			name:"英文字体"
			, list:[
				{
					id:"arial"
					, title:"arial"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1SWbFGXXXXXXCaXXXSutbFXXX.jpg"
				}
				, {
					id:"pixb"
					, title:"04b08"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1J.hMGXXXXXblaXXXSutbFXXX.jpg"
				}
				, {
					id:"aachen"
					, title:"aachen"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1B3SlGXXXXXc7aXXXSutbFXXX.jpg"
				}
				, {
					id:"abbey"
					, title:"abbey"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1wFBSGXXXXXaXapXXSutbFXXX.jpg"
				}
				, {
					id:"activa"
					, title:"activa"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1UwalGXXXXXbzapXXSutbFXXX.jpg"
				}
				, {
					id:"agency"
					, title:"agency"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1ojp2GXXXXXaNaXXXSutbFXXX.jpg"
				}
				, {
					id:"aldine"
					, title:"aldine"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB11O8VGXXXXXaYaXXXSutbFXXX.jpg"
				}
				, {
					id:"alternate"
					, title:"alternate"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1GkO0GXXXXXckXVXXSutbFXXX.jpg"
				}
				, {
					id:"arialblack"
					, title:"arialblack"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1.Bh3GXXXXXcpXVXXSutbFXXX.jpg"
				}
				, {
					id:"arsisdreg"
					, title:"arsisdreg"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB12.lQGXXXXXbmaXXXSutbFXXX.jpg"
				}
				, {
					id:"avantgarde"
					, title:"avantgarde"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1qbtyGXXXXXacapXXSutbFXXX.jpg"
				}
				, {
					id:"batman"
					, title:"batman"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1wTXRGXXXXXbvaXXXSutbFXXX.jpg"
				}
				, {
					id:"brock"
					, title:"brock"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1bIVQGXXXXXbKaXXXSutbFXXX.jpg"
				}
				, {
					id:"compacta"
					, title:"compacta"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1fQxmGXXXXXXFapXXSutbFXXX.jpg"
				}
				, {
					id:"earth"
					, title:"earth"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1OlScGXXXXXbBaXXXSutbFXXX.jpg"
				}
				, {
					id:"edenmills"
					, title:"edenmills"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1D1AEFVXXXXakaXXXSutbFXXX.jpg"
				}
				, {
					id:"freehand"
					, title:"freehand"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1.bSbGXXXXXaGaXXXSutbFXXX.jpg"
				}
				, {
					id:"gothikka"
					, title:"gothikka"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1s4mhGVXXXXXVXXXXSutbFXXX.jpg"
				}
				, {
					id:"impact"
					, title:"impact"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB13DhyGXXXXXbpapXXSutbFXXX.jpg"
				}
				, {
					id:"heather"
					, title:"heather"
					, curmb:"http://img01.taobaocdn.com/imgextra/i1/TB1TEXGGVXXXXX6aXXXSutbFXXX.jpg"
				}
				, {
					id:"lcd"
					, title:"led"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1RiF0GVXXXXcfXFXXSutbFXXX.jpg"
				}
				, {
					id:"mouse"
					, title:"mouse"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1vyFVGXXXXXcwaXXXSutbFXXX.jpg"
				}
				, {
					id:"prosto"
					, title:"prosto"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1RfV2GVXXXXb2XVXXSutbFXXX.jpg"
				}
				, {
					id:"regular"
					, title:"regular"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1EmOgGVXXXXaTXXXXSutbFXXX.jpg"
				}
				, {
					id:"rounded"
					, title:"rounded"
					, curmb:"http://img01.taobaocdn.com/imgextra/i2/TB1T_t5GXXXXXc2aXXXSutbFXXX.jpg"
				}
				, {
					id:"swash"
					, title:"swash"
					, curmb:"http://img01.taobaocdn.com/imgextra/i3/TB1wEKhGVXXXXXPXXXXSutbFXXX.jpg"
				}
				, {
					id:"tdembol"
					, title:"tdembol"
					, curmb:"http://img01.taobaocdn.com/imgextra/i4/TB1YrVhGXXXXXXkaFXXSutbFXXX.jpg"
				}
			]
		}
	}
});
Fengs.add('zx/maker/colors', function(){
	return [
		{
			"name":"红色",
			"curmb":"#a31201",
			"setting":{
				"navbg":"#a31201","navbghover":"#8a1305","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","navborder":"1","navbdcolor":"#8a1305","navarrow":"1","catebg":"#8a1305","catebghover":"#8a1305","catecolor":"#ffffff","catecolorhover":"#ffffff","menubg":"#8a1305","menubghover":"#a31201","menucolor":"#ffffff","menucolorhover":"#ffffff","poperbg":"#a31201","poperbghover":"#ffffff","popercolor":"#ffffff","popercolorhover":"#8a1305","menuarrow":"#000000" 
			}
		}
		,{
			"name":"玫红色",
			"curmb":"#e63760",
			"setting":{	
				"catebg":"#e63760","catebghover":"#c42046","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#454545","menubghover":"#e63760","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#555555","navborder":"0","navbg":"#e63760","navbghover":"#c42046","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#e63760","poperbghover":"#e63760","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"玫瑰色",
			"curmb":"#df1187",
			"setting":{	
				"navbg":"#df1187","navbghover":"#ca0a78","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","navborder":"1","navbdcolor":"#ca0a78","catebg":"#383838","catebghover":"#383838","catecolor":"#ffffff","catecolorhover":"#ffffff","menubg":"#383838","menubghover":"#e850a7","menucolor":"#ffffff","menucolorhover":"#ffffff","poperbg":"#e850a7","poperbghover":"#f268b7","popercolor":"#ffffff","popercolorhover":"#ffffff","menuarrow":"#000000"  
			}
		}
		,{
			"name":"粉色",
			"curmb":"#fd8b93",
			"setting":{	
				"catebg":"#abe3c9","catebghover":"#abe3c9","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#abe3c9","menubghover":"#fbabb1","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#285a9c","navborder":"0","navbg":"#fd8b93","navbghover":"#fbabb1","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#fbabb1","poperbghover":"#fbabb1","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"橙色",
			"curmb":"#fd7e37",
			"setting":{	
				"catebg":"#fe5b00","catebghover":"#fabf00","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#fabf00","menubghover":"#fd7e37","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#fe5b00","navborder":"1","navbg":"#fd7e37","navbghover":"#fe5b00","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#fd7e37","poperbghover":"#fd7e37","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"中黄色",
			"curmb":"#f6a515",
			"setting":{	
				"catebg":"#f08406","catebghover":"#f08406","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#f08406","menubghover":"#222222","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#dea027","navborder":"1","navbg":"#f6a515","navbghover":"#666666","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#222222","poperbghover":"#333333","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"浅绿色",
			"curmb":"#c7d69b",
			"setting":{	
				"navbg":"#c7d69b","navbghover":"#ffffff","navcolor":"#ffffff","navcolorhover":"#555555","navpadding":"15","navborder":"1","navbdcolor":"#a1b36d","catebg":"#a1b36d","catebghover":"#ffffff","catecolor":"#ffffff","catecolorhover":"#555555","menubg":"#c7d69b","menubghover":"#ffd27f","menucolor":"#ffffff","menucolorhover":"#ffffff","poperbg":"#ffd27f","poperbghover":"#ffffff","popercolor":"#ffffff","popercolorhover":"#555555","menuarrow":"#000000" 
			}
		}
		,{
			"name":"绿色",
			"curmb":"#6ea907",
			"setting":{	
				"catebg":"#6aa532","catebghover":"#846341","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#846341","menubghover":"#629901","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#568702","navborder":"1","navbg":"#6ea907","navbghover":"#846341","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#629901","poperbghover":"#6ea907","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"草绿色",
			"curmb":"#81d19e",
			"setting":{	
				"catebg":"#f77474","catebghover":"#f77474","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#f77474","menubghover":"#81d19e","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#5ec082","navborder":"1","navbg":"#81d19e","navbghover":"#f77474","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#81d19e","poperbghover":"#81d19e","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"天蓝色",
			"curmb":"#6acdd3",
			"setting":{	
				"catebg":"#3eb7c0","catebghover":"#3eb7c0","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#47bac2","menubghover":"#ffffff","menucolor":"#ffffff","menucolorhover":"#5c5d5d","navbdcolor":"#3eb7c0","navborder":"1","navbg":"#6acdd3","navbghover":"#3eb7c0","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#ffffff","poperbghover":"#ffffff","popercolor":"#5c5d5d","popercolorhover":"#1b9191" 
			}
		}
		,{
			"name":"蓝色",
			"curmb":"#36639e",
			"setting":{	
				"catebg":"#99cc00","catebghover":"#ffffff","catecolor":"#ffffff","catecolorhover":"#383838","menuarrow":"#000000","menubg":"#ffffff","menubghover":"#383838","menucolor":"#383838","menucolorhover":"#ffffff","navbdcolor":"#285a9c","navborder":"1","navbg":"#36639e","navbghover":"#ffffff","navcolor":"#ffffff","navcolorhover":"#383838","navpadding":"15","poperbg":"#383838","poperbghover":"#383838","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"藏青色",
			"curmb":"#243040",
			"setting":{	
				"catebg":"#000000","catebghover":"#000000","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#000000","menubghover":"#000000","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#000000","navborder":"1","navbg":"#243040","navbghover":"#000000","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#071543","poperbghover":"#ffffff","popercolor":"#ffffff","popercolorhover":"#071543" 
			}
		}
		,{
			"name":"深紫色",
			"curmb":"#540a31",
			"setting":{	
				"catebg":"#34081f","catebghover":"#34081f","catecolor":"#bd0161","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#1d0513","menubghover":"#bd0161","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#555555","navborder":"0","navbg":"#34081f","navbghover":"#34081f","navcolor":"#ffffff","navcolorhover":"#bd0161","navpadding":"15","poperbg":"#bd0161","poperbghover":"#560e33","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"黑色",
			"curmb":"#000000",
			"setting":{	
				"catebg":"#666666","catebghover":"#666666","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#666666","menubghover":"#000000","menucolor":"#ffffff","menucolorhover":"#ffffff","navbdcolor":"#555555","navborder":"1","navbg":"#000000","navbghover":"#666666","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"15","poperbg":"#000000","poperbghover":"#000000","popercolor":"#ffffff","popercolorhover":"#ffffff" 
			}
		}
		,{
			"name":"棕色",
			"curmb":"#6b4c39",
			"setting":{	
				"catebg":"#ab8167","catebghover":"#ab8167","catecolor":"#ffffff","catecolorhover":"#ffffff","menuarrow":"#000000","menubg":"#fdecd2","menubghover":"#ab8167","menucolor":"#ab8167","menucolorhover":"#ffffff","navbdcolor":"#555555","navborder":"0","navbg":"#6b4c39","navbghover":"#ab8167","navcolor":"#ffffff","navcolorhover":"#ffffff","navpadding":"25","poperbg":"#ab8167","poperbghover":"#ffffff","popercolor":"#ffffff","popercolorhover":"#ab8167" 
			}
		}
		,{
			"name":"白色",
			"curmb":"#fbf8f3",
			"setting":{	
				"navbg":"#ffffff","navbghover":"#f0f0f0","navcolor":"#333333","navcolorhover":"#333333","navpadding":"15","navborder":"1","navbdcolor":"#eeeeee","catebg":"#fbf8f3","catebghover":"#56aaff","catecolor":"#333333","catecolorhover":"#ffffff","menubg":"#56aaff","menubghover":"#fbf8f3","menucolor":"#ffffff","menucolorhover":"#333333","poperbg":"#fbf8f3","poperbghover":"#ffffff","popercolor":"#333333","popercolorhover":"#56aaff","menuarrow":"#000000" 
			}
		}
	];
});
Fengs.add('zx/maker/upload', function(S, $, UI, REQ, LAB){
	return function(){
		return {
			init: function($target, cb){
				$target.click(function(){
					try{
						top.fileChoser.data('config', {'category_id': $.cookie('sourceCateId'), callback: function(obj){
							cb(obj.picture_path, obj.picture_id);
						}});
						top.fileChoser.show();
					}catch(e){
						LAB.warn('不支持的框架内方法！');
					}
				});
			}
		};
	}
},["zx/ui/base", "common/require", 'zx/lab', "jquery/cookie"]);
Fengs.add('zx/maker/save',function(S, $){
	var toHex = function(incolor){
		if(!incolor && incolor == ""){
			return '#ffffff';
		}
		return incolor.indexOf("#") != 0 && incolor.length == 6 ?  '#'+ incolor : incolor ;
	};
	return {
		save:function(cvs, arr, callback){
			var canvas = document.createElement("canvas")
				, ctx = canvas.getContext("2d")
				, len = arr.length
				, outPaint = function(i){
					if(i >= len){
						callback && callback(canvas.toDataURL("image/jpg"));
						return false;
					};
					var obj = arr[i]
						, image
						, rotate = obj.rotate * Math.PI/180;
					if(obj.type == "image"){
						image = new Image();
						image.onload = function(){
						    var sx = obj.width / image.width
						    	,sy = obj.height / image.height
						    	,mx = obj.left + 1 + obj.width / 2
						    	,my = obj.top + 1 + obj.height / 2;
							ctx.translate( mx, my);
							ctx.rotate(rotate);
						   	ctx.scale(sx, sy);
						    ctx.drawImage(image, 0 - (obj.width / 2 / sx), 0 - (obj.height / 2 / sy));
							//恢复缩放比例
							ctx.scale(1 / sx, 1 / sy);
							ctx.rotate(0 - rotate);
							ctx.translate( 0 - mx, 0 - my);
						    i++;
						    outPaint(i);
						};
						image.error = function(){
						    i++;
							outPaint(i);
						};
						if(obj.src.match(/^http:\/\//ig) !== null){
							image.src = '/img/extranet?'+ obj.src;
						}else{
							image.src = obj.src;
						};
					}else{
						image = new Image();
						image.onload = function(){
						    var ow = image.width / 2
						    	,oh = image.height / 2
						    	,sx = 0.5
						    	,sy = 0.5
						    	,mx = obj.left + 1 + ow / 2
						    	,my = obj.top + 1 + oh / 2;
							ctx.translate( mx, my);
							ctx.rotate(rotate);
						   	ctx.scale(sx, sy);
						    ctx.drawImage(image, 0 - (ow / 2 / sx), 0 - (oh / 2 / sy));
							//恢复缩放比例
							ctx.scale(1 / sx, 1 / sy);
							ctx.rotate(0 - rotate);
							ctx.translate( 0 - mx, 0 - my);
						    i++;
						    outPaint(i);
						};
						image.error = function(){
						    i++;
							outPaint(i);
						};
						var src = "/img/draw_string?text="+ encodeURIComponent(obj.content) +"&color="+ parseInt('0x'+ obj.color.replace("#","")) +"&name="+ encodeURIComponent(obj.font) +"&size="+ (obj.size * 2) +"&style="+ obj.style;
						if(obj.shadow && obj.shadow != ""){
							src += "&color2="+ parseInt('0x'+ obj.shadow.replace("#","")) +"&x="+ (parseInt(obj.move) * 2);
						};
						image.src = src;
						/*var w = obj.ele.width() / 2
							h = obj.ele.height() / 2
							mx = obj.left + w + 1,
							my = obj.top + h + 1;
						ctx.translate( mx, my);
						ctx.font = obj.size +"px "+ obj.font;
						ctx.fillStyle = toHex(obj.color);
						if(obj.shadow != ""){
							ctx.shadowBlur = obj.radius;	// 设置模糊度
							ctx.shadowColor = toHex(obj.shadow);	// 设置阴影颜色
							ctx.shadowOffsetX = obj.move;	// 设置水平位移
							ctx.shadowOffsetY = obj.move;	// 设置垂直位移
						};
						ctx.rotate(rotate);
						ctx.fillText(obj.content, 0 - w, 0 - h + 0.85 * obj.size);
						ctx.rotate(0 - rotate);	
						ctx.translate( 0 - mx, 0 - my);
						ctx.shadowBlur = 0
						ctx.shadowColor = "rgba(0,0,0,0)";	// 设置阴影颜色
						ctx.shadowOffsetX = obj.move;	// 设置水平位移
						ctx.shadowOffsetY = obj.move;	// 设置垂直位移
						i++;
						outPaint(i);*/
					};
				};
			canvas.width = 950;
			canvas.height = parseInt(cvs.height);
			ctx.fillStyle = toHex(cvs.color);
			ctx.fillRect(0, 0, canvas.width, canvas.height);
			if(cvs.image != ""){
				var img = new Image()
	            img.onload = function () {
	            	if(cvs.repeat == "repeat-y" || cvs.repeat == "no-repeat"){
	            		width = img.width;
	            		start = parseInt((950 - img.width) / 2);
	            	}else{
	            		width = Math.ceil(950 / img.width) * img.width;
	            		start = width > 950 ? parseInt((950 - width) / 2) : parseInt(0 - (width - 950) / 2);
	            	};
	                var pattern = ctx.createPattern(img, cvs.repeat);
	                ctx.fillStyle = pattern;
	                ctx.beginPath();
	                ctx.translate( start,0);
	                ctx.rect(0, 0, width, canvas.height);
	                ctx.fill();
	                ctx.translate( 0 - start,0);
	                outPaint(0);
	            };
				if(cvs.image.match(/^http:\/\//ig) !== null){
					img.src = '/img/extranet?'+ cvs.image;
				}else{
					img.src = cvs.image;
				}
			}else{
				outPaint(0);
			}
		}
		, getBg:function(cvs, callback){
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
			//画上背景色
			ctx.fillStyle = toHex(con.color);
			ctx.fillRect(0, 0, canvas.width, canvas.height);
			//背景图
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
	                var pattern = ctx.createPattern(img, "repeat");
	                ctx.fillStyle = pattern;
	                ctx.beginPath();
	                ctx.rect(start, 0, width, canvas.height);
	                ctx.fill();
					//导航背景
					writeDH();
	            };
				if(cvs.config.image.match(/^http:\/\//ig) !== null){
					img.src = '/img/extranet?'+ cvs.config.image;
				}else{
					img.src = cvs.config.image;
				}
			}else{
				//导航背景
				writeDH();
			};
		}
	}
});
Fengs.add('zx/maker/layer', function(S, $, UI, LAB, COLORS, BASECSS,FONTS, REQ){
	var W = window
		, ua = navigator.userAgent
        , isIE = /msie/i.test(ua) && !W.opera
		, layer = {
		target: null
        , rotate: function(target, angle, undefined) {
            if (isIE) { // IE
                var cosDeg = Math.cos(angle * Math.PI / 180)
                	, sinDeg = Math.sin(angle * Math.PI / 180);
                with(target.filters.item(0)) {
                    M11 = M22 = cosDeg; M12 = -(M21 = sinDeg); 
                }
                target.style.top = (orginH - target.offsetHeight) / 2 + 'px';
                target.style.left = (orginW - target.offsetWidth) / 2 + 'px';
            } else if (target.style.MozTransform !== undefined) {  // Mozilla
                target.style.MozTransform = 'rotate(' + angle + 'deg)';
            } else if (target.style.OTransform !== undefined) {   // Opera
                target.style.OTransform = 'rotate(' + angle + 'deg)';
            } else if (target.style.webkitTransform !== undefined) { // Chrome Safari
                target.style.webkitTransform = 'rotate(' + angle + 'deg)';
            } else {
                target.style.transform = "rotate(" + angle + "deg)";
            }
        }
		, toHex: function(incolor){
			if(!incolor){
				return '';
			}
			return incolor.indexOf("#") != 0 && incolor.length == 6 ?  '#'+ incolor : incolor ;
		}
		, text:{
			target:null
			, update:function(obj){
				var ele = this.wrap;
				$("#color", ele).val(obj.color).trigger('blur');//[0].color.active.val('hex',obj.color,this);
				$("#size", ele).val(obj.size);
				$("#font", ele).val(obj.font).trigger('change');
				$("#left", ele).val(obj.left);
				$("#top", ele).val(obj.top);
				$("#shadow", ele).val(obj.shadow).trigger('blur');//[0].color.active.val('hex',(obj.shadow != "" ? obj.shadow : null),this);
				$("#move", ele).val(obj.move);
				$("#rotate", ele).val(obj.rotate);
				$("#style", ele)[0].val(obj.style);
			}
			, init:function($ele){
				var _this = this;
				_this.wrap = $ele;
				var html = [];
				html.push('<ul>');
				html.push('<li><label>文本色</label><input id="color" ui="color" type="text"/></li>');
				html.push('<li><label>字号</label><input type="text" id="size"><span class="unit">像素</span></li>');
				html.push('<li><label>字体</label><input type="text" id="font"/></li>');
				html.push('<li><label>左坐标</label><input type="text" id="left"/><span class="unit">像素</span></li>');
				html.push('<li><label>顶坐标</label><input type="text" id="top"/><span class="unit">像素</span></li>');
				html.push('<li><label>旋转</label><input type="text" id="rotate" value="0"/><span class="unit">度</span></li>');
				html.push('<li class="line"></li>');
				html.push('<li><label>阴影</label><span>阴影色</span><input id="shadow" ui="color" type="text"/></li>');
				html.push('<li><span class="la"></span><span>位移</span><input id="move" type="text"/><span class="unit">像素</span></li>');
				html.push('<li><label>效果</label><span id="style" class="radio" ui="radio"><a class="cur" rel="">正常</a><a rel="1">加粗</a><a rel="2">斜体</a></span></li>');
				html.push('</ul>');
				$ele.find("dd").html(html.join(''));
				UI.loadui($ele);
				$ele.on("change","input",function(){
					var $this = $(this)
						, id = $this.attr("id")
						, val = $this.val() , obj = _this.target;
					obj[id] = val;
					if(id == "rotate"){
						layer.rotate(obj.ele[0], val);
					}else{
						obj.ele.css(id, val);
					}
					obj.update();
				}).on("click","#style",function(){
					var val = this.val()
						, obj = _this.target;
					obj.style = val;
					obj.update();
				});
				S.use("zx/ui/font",function(F){
					F.font($("#font",$ele), FONTS);
					F.size($("#size",$ele));
				});
			}
		}
		, image:{
			target:null
			, update:function(){
				var t = this.target
					,ele = this.wrap;
				$("#width",ele).val(t.width).trigger('change');
				$("#height",ele).val(t.height).trigger('change');
				$("#left",ele).val(t.left).trigger('change');
				$("#top",ele).val(t.top).trigger('change');
				$("#rotate",ele).val(t.rotate).trigger('change');
			}
			, init:function($ele){
				var _this = this;
				_this.wrap = $ele;
				var html = [];
				html.push('<ul>');
				html.push('<li><label>高度</label><input id="width" type="text"/><span class="unit">像素</span></li>');
				html.push('<li><label>宽度</label><input id="height" type="text"/><span class="unit">像素</span></li>');
				html.push('<li><label>左坐标</label><input id="left" type="text"/><span class="unit">像素</span></li>');
				html.push('<li><label>右坐标</label><input id="top" type="text"/><span class="unit">像素</span></li>');
				html.push('<li><label>旋转</label><input id="rotate" type="text" value="0"/><span class="unit">度</span></li>');
				html.push('</ul>');
				$ele.find("dd").html(html.join('')).on("change","input",function(){
					var $this = $(this)
						, id = $this.attr("id")
						, t = _this.target
						, val = $this.val();
					t[id] = parseInt(val);
					if(id == "rotate"){
						layer.rotate(t.ele[0], val)
					}else{
						t.ele.css(id,val);
					}
				});
				UI.loadui($ele);
			}
		}
		, setting:{
			update:function(){
				var obj = layer.target.config
					, ele = this.wrap;
				//$("#width", ele).val(obj.width);
				$("#height", ele).val(obj.height).trigger('change');
				$("#image", ele).val(obj.image).trigger('change');
				$("#repeat", ele)[0].val(obj.repeat);
				layer.target.cvs.css("background-repeat", obj.repeat);
				layer.target.bg.css("background-repeat", obj.repeat);
				//$("#position", ele)[0].val(obj.position);
				$("#color", ele).val(obj.color);
				$("#pagecolor", ele).val(obj.pagecolor);
				$("#pageimage", ele).val(obj.pageimage).trigger('change');
				$("#pagerepeat", ele)[0].val(obj.pagerepeat);
				$("#attach", ele)[0].val(obj.attach);
				//$("#pageposition", ele)[0].val(obj.pagepageposition);
				layer.target.bg.css(W.applySite == "1" ? {"background":"none"} : {"margin":"auto"}).find('#nav').width(W.applySite == "1" ? 950 : "100%");
				//$("section").css({"background-repeat":obj.pagerepeat,"background-color":layer.toHex(obj.pagecolor),"background-attachment":obj.attach});
				$("section").css({"background-repeat":obj.pagerepeat,"background-color":layer.toHex(obj.pagecolor)});
				$('#color, #pagecolor', ele).each(function(){
					$(this).trigger('blur');
				});
			}
			, init:function($ele){
				var _this = this;
				_this.wrap = $ele;
				var html = [];
				html.push('<ul>');
				//html.push('<li><label>店招宽</label><span id="width" ui="radio" class="radio"><a rel="1920" class="cur">1920像素</a><a rel="950">950像素</a></span></li>');
				html.push('<li><label>店招高</label><input id="height" type="text" value="120"/></span><span class="unit">像素</span></li>');
				html.push('<li><label>背景色</label><span><input id="color" ui="color" type="text"/></span></li>');
				html.push('<li><label>背景图</label><input id="image" type="text" ui="upload" class="image" readonly/></li>');
				html.push('<li><label>背景平铺</label><span id="repeat" ui="radio" class="radio"><a rel="no-repeat">不平铺</a><a rel="repeat-x">横向</a><a rel="repeat-y">纵向</a><a rel="repeat">平铺</a></span></li>');
				html.push('<li><label>背景对齐</label><span id="disabled" class="radio disabled"><a>左对齐</a><a class="cur">居中</a><a>右对齐</a></span></li>');
				html.push('</ul>');
				html.push('<ul style="display:none;">');
				html.push('<li><label>背景色</label><span><input id="pagecolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>背景图</label><input id="pageimage" type="text" ui="upload" ui-type="1" class="image"/></li>');
				html.push('<li><label>背景平铺</label><span id="pagerepeat" ui="radio" class="radio"><a rel="no-repeat">不平铺</a><a rel="repeat-x">横向</a><a rel="repeat-y">纵向</a><a rel="repeat">平铺</a></span></li>');
				html.push('<li><label>背景对齐</label><span id="disabled" class="radio disabled"><a>左对齐</a><a class="cur">居中</a><a>右对齐</a></span></li>');
				html.push('<li><label>背景滚动</label><span id="attach" class="radio" ui="radio"><a class="cur" rel="scroll">滚动</a><a rel="fixed">固定</a></span></li>');
				html.push('</ul>');
				$ele.find("dd").html(html.join(''));
				UI.loadui($ele.show());
				/*$ele.on("click","#width",function(){
					var t = layer.target.config
						, val = this.val();
					layer.target.bg.css("background",(val == "950" ?"none": t.color)).find('#nav').width(val == "950" ? 950 : "100%");
					t.width = val;
				})*/
				$ele.on("change","input",function(){
					var val = this.value
						, id = this.id
						, t = layer.target;
					t.config[id] = val;
					switch(id){
						case "height":
							//t.bg.height(val);
							t.cvs.height(val);
							break;
						case "color":
							val = layer.toHex(val);
							if(W.applySite != "1"){
								t.bg.css("background-color",val);
							}
							t.cvs.css("background-color",val);
							break;
						case "pagecolor":
							val = layer.toHex(val);
							$("section").css("background-color",val);
							break;
						case "image":
							if(W.applySite != "1"){
								t.bg.css("background-image","url("+ val +")");
							}
							t.cvs.css("background-image","url("+ val +")");
							break;
						case "pageimage":
							$("section").css("background-image","url("+ val +")");
							break;
					}
				}).on("click","#repeat,#pagerepeat,#attach",function(){
					var val = this.val()
						, id = this.id
						, t = layer.target;
					t.config[id] = val;
					switch(id){
						case "repeat":
							t.cvs.css("background-repeat", val);
							t.bg.css("background-repeat", val);
							break;
						case "attach":
							///$("section").css("background-attachment", val);
							break;
						default:
							$("section").css("background-repeat", val);
							break;
					}
				}).on("click","h3 a",function(){
					var $this = $(this)
						, index = $this.index();
					$this.addClass("cur").siblings('.cur').removeClass("cur");
					$("ul",$ele).eq(index).css("display","block").siblings("ul").css("display","none");
				});
			}
		}
		, daohang:{
			update:function(obj){
				var $ele
					, $wrap = this.wrap;
				for(i in obj){
					$ele = $("#"+ i, $wrap);
					//同步更新颜色信息
					$ele.val(obj[i]).trigger('blur').trigger("change");
				}
				this.createcss(obj);
			}
			, createcss:function(obj,issave){
				var newcss = BASECSS(obj.navarrow)
					, arr = {};
				for(i in obj){
					arr[i] = eval('(/{@'+ i +'}/gi)');
					newcss = newcss.replace(arr[i],obj[i]);
				};
				if(issave){
					return newcss;
				}else{
					$("#customstyle").html(newcss);
				};
			}
			, init:function($ele){
				var _this = this
					, $nav = $("#nav");
				_this.wrap = $ele;
				var html = [];
				html.push('<ul>');
				html.push('<li><label>快速设置颜色</label><span></span></li>');
				html.push('<li class="colorlist">');
				for(var i=0,len=COLORS.length; i<len; i++){
					html.push('<a href="javascript:void(0);" rel="'+ i +'" style="background-color:'+ COLORS[i].curmb +'" title="'+ COLORS[i].name +'"></a>');
				};
				html.push('</li>');
				html.push('<li class="line"></li>');
				html.push('<li><label>导航高度</label><input id="height" type="text" value="30"/><span class="unit">像素</span></li>');
				html.push('<li><label>整体背景色</label><span><input id="navbg" ui="color" type="text"/></span></li>');
				html.push('<li><label>划过背景色</label><span><input id="navbghover" ui="color" type="text"/></span></li>');
				html.push('<li><label>文字左右间距</label><span><input id="navpadding" type="text"/></span><span class="unit">像素</span></li>');
				html.push('<li><label>文字左右边框</label><span><input id="navborder" type="text"/></span><span class="unit">像素</span></li>');
				html.push('<li><label>边框色</label><span><input id="navbdcolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>文字色</label><span><input id="navcolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>划过文字色</label><span><input id="navcolorhover" ui="color" type="text"/></span></li>');
				html.push('<li><label>分类箭头</label><span><select id="navarrow">');
				html.push('<option value="0">默认</option>');
				html.push('<option value="1">样式一</option>');
				html.push('<option value="2">样式二</option>');
				html.push('<option value="3">样式三</option>');
				html.push('</select></span></li>');
				html.push('<li class="line"></li>');
				html.push('<li><label>分类背景色</label><span><input id="catebg" ui="color" type="text"/></span></li>');
				html.push('<li><label>分类划过背景色</label><span><input id="catebghover" ui="color" type="text"/></span></li>');
				html.push('<li><label>分类文字色</label><span><input id="catecolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>分类划过文字色</label><span><input id="catecolorhover" ui="color" type="text"/></span></li>');
				html.push('</ul>');
				html.push('<ul style="display:none">');
				html.push('<li><label>菜单背景色</label><span><input id="menubg" ui="color" type="text"/></span></li>');
				html.push('<li><label>菜单划过背景色</label><span><input id="menubghover" ui="color" type="text"/></span></li>');
				html.push('<li><label>菜单文字色</label><span><input id="menucolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>菜单划过文字色</label><span><input id="menucolorhover" ui="color" type="text"/></span></li>');
				html.push('<li class="line"></li>');
				html.push('<li><label>子菜单背景色</label><span><input id="poperbg" ui="color" type="text"/></span></li>');
				html.push('<li><label>子菜单划过背景色</label><span><input id="poperbghover" ui="color" type="text"/></span></li>');
				html.push('<li><label>子菜单文字色</label><span><input id="popercolor" ui="color" type="text"/></span></li>');
				html.push('<li><label>子菜单划过文字色</label><span><input id="popercolorhover" ui="color" type="text"/></span></li>');
				html.push('</ul>');
				$ele.find("dd").html(html.join(''));
				var $ul = $("ul",$ele);
				$ele.on("click","dt a",function(){
					var $this = $(this)
						, index = $this.index();
					$this.addClass("cur").siblings('.cur').removeClass("cur");
					$ul.eq(index).css("display","block").siblings("ul").css("display","none");
				}).on("change","input,select",function(){
					var t = layer.target.nav
						, id = this.id
						, val = layer.toHex(this.value);
					t[id] = val;
					if(id == "navbg"){
						$("#nav").css("background-color",val);
					}else if(id == "height"){
						$("#nav").height(val);
					}
					_this.createcss(t);
				}).on("click",".colorlist a",function(e){
					var obj = COLORS[parseInt($(this).attr("rel"))].setting;
					layer.target.nav = $.extend(layer.target.nav, obj);
					_this.update(obj);
				});
				UI.loadui($ele.show());
			}
		}
		, fangan:{
			loadmine:false
			, useid:function(id){
				REQ.s({
					url: 'api/get_shop_sign'
					, data: {'id': id, 'username': S.username}
					, success: function(d){
						d = d.kehuda;
						if(d.status == 1){
							var obj = d.data;
							var cvs = layer.target;
							cvs.id = obj.i;
							cvs.title = obj.e;
							cvs.load($.parseJSON(obj.s));
						}
					}
				})

				this.wrap.find("li#"+ id).trigger('click');
			}
			, loadsys:false
			, wrap:null
			, userData: {'all': 0, 'list': []}
			, sysData: {'all': 0, 'list': []}
			, currentPage: 0
			, addItem:function(obj, $wrap){
				obj.s = obj.s.replace(/｝/g,"}").replace(/｛/g,"{");
				var cog = $.parseJSON(obj.s),$li,color;
				if(cog){
					color = cog.nav.navcolor;
					cog = cog.nav.navbg;
				}else{
					cog = "rgba(0,0,0,0.2)";
					color = '#fff';
				};
				$li = $('<li '+ (!obj.i ? 'id="'+ obj._id +'"' : '') +'><img src="'+ obj.n.replace(/！/g,"!").replace(".jpg",".jpg_200x200.jpg") +'"><h4 style="background:'+ layer.toHex(cog) +';color:'+ layer.toHex(color) +';"><span class="fl">'+ (obj.e ? obj.e : '') +'</span><span class="fr">'+ (obj.t ? obj.t : '') +'</span></h4>'+ (obj.i ? '<a class="del" title="删除方案">×</a>' : '') +'</li>');
				$wrap.append($li);
				$li.on("click",function(){
					var cvs = layer.target;
					cvs.id = obj.i;
					cvs.title = obj.e;
					cvs.load($.parseJSON(obj.s));
				}).find("a.del").on("click",function(e){
					ZXREQ.s({
						url:"api/custom_module_edit",
						data:{"do":"del",id:obj.i},
						success:function(d){
							LAB.loading.hide();
							d = d.kehuda;
							if(d.status == 1){
								$li.slideUp(function(){
									$li.remove();
								});
							}else{
								LAB.warn(d.tips);
							};
						}
					});
					e.preventDefault();
					return false;
				});
			}
			, init:function($ele){
				var _this = this;
				_this.wrap = $ele;
				var html = [];
				$ele.find("dd").html('<ul class="my" style="display:none;"></ul><ul calss="sys"></ul><div class="pager"><a href="javascript:void(0);" rel="0">上一页</a><span>1/12</span><a href="javascript:void(0);" rel="1">下一页</a></div>');
				var $ul = $("ul",$ele)
					, $pager = $('.pager', $ele);
				$ele.on("click","dt a",function(){
					var $this = $(this)
						, index = $this.index();
					$this.addClass("cur").siblings('.cur').removeClass("cur");
					$ul.eq(index).css("display","block").siblings("ul").css("display","none");
					$pager.css('display', index == 0 ? 'none' : 'block');
				}).on('click', '.pager a', function(){
					var $this = $(this)
					if($this.hasClass('disabled')){
						return false;
					}
					var rel = $this.attr('rel');
					var page = 1;
					if(rel == '0'){
						page = _this.currentPage - 1;
					}else{
						page = _this.currentPage + 1;
					};
					page = page < 1 ? 1 : page;
					_this.loadData(page, $ul.eq(1));

				});
				_this.pager = $pager;
				//加载用户方案
				_this.reload();
				//加载系统方案
				_this.loadData(1, $ul.eq(1));
				/*for(var i=0,len=TEMPS.length; i<len; i++){
					this.addItem(TEMPS[i],$ul.eq(1));
				}*/
				var reseth = function(event){
					var _height = $(window).height();
					$ul.eq(0).height(_height - 74);
					$ul.eq(1).height(_height - 113);
				}
				$(window).resize(reseth);
				reseth();
				UI.loadui($ele.show());
			}
			, loadData: function(page, $wrap){
				var _this = this
					, _add = _this.addItem
					, _line = 20;
				if(page == _this.currentPage){
					return;
				}
				$wrap.html('');
				REQ.s({
					url: 'api/get_shop_sign'
					, data: {'page': page ? page : 1, 'line': _line, 'username': S.username}
					, success: function(d){
						d = d.kehuda;
						_this.sysData = d;
						_this.currentPage = page;
						for(var i=0,list=d.list,len=list.length; i<len; i++){
							_add(list[i],$wrap);
						};
						var maxPage = Math.ceil(d.all / _line)
							, $a = _this.pager.find('a');
						_this.pager.find('span').text(page +'/'+ maxPage);
						$a.removeClass('disabled');
						if(page == 1){
							$a.eq(0).addClass('disabled');
						}
						if(page == maxPage){
							$a.filter(':last').addClass('disabled');
						}
					}
				})
			}
			, reload:function(){
				var _this = this
					, add = _this.addItem
					, $ul = $("ul:first", this.wrap);
				$ul.html('');
				REQ.s({
					url:"api/custom_module_list",
					data:{'username': S.username},
					success:function(d){
						d = d.kehuda;
						_this.userData = d;
						if(d.all > 0){
							layer.target.templist = d.list.l;
							for(var i=0,list=d.list.l,len=list.length; i<len; i++){
								add(list[i],$ul);
							}
						}
					}
				});
			}
		}
		, wrap:null
		, swiMode: function(mode, index){
			$("dl."+ mode, layer.wrap).css("display","block").siblings("dl").css("display","none");
			if(index >= 0){
				$("."+ mode, layer.wrap).find("h3 a").eq(index).addClass('cur').siblings('.cur').removeClass('cur');
				$("."+ mode, layer.wrap).find("dd ul").eq(index).css("display","block").siblings('ul').css("display","none");
			};
		}
		, save:function(){
			return this.daohang.createcss(this.target.nav,true);
		}
		, init:function($wrap){
			layer.wrap = $wrap;
			var html = [];
			html.push('<dl class="setting"><dt><h3><a class="cur">店招背景</a><a>页面背景</a></h3></dt><dd></dd></dl>');
			html.push('<dl class="daohang"><dt><h3><a class="cur">主导航配置</a><a>分类弹出层</a></h3></dt><dd></dd></dl>');
			html.push('<dl class="fangan"><dt><h3><a>我的方案</a><a class="cur">系统方案</a></h3></dt><dd></dd></dl>');
			//html.push('<dl class="layer"><dt><h3>图层</h3></dt><dd></dd></dl>');
			html.push('<dl class="text"><dt><h3><a class="cur">文本属性</a></h3></dt><dd></dd></dl>');
			html.push('<dl class="image"><dt><h3><a class="cur">图片属性</a></h3></dt><dd></dd></dl>');
			$wrap.html(html.join('')).find("dl").each(function(){
				var $this = $(this);
				layer[$this.attr("class")].init($this);
			});
			this.swiMode("fangan");
		}
		, reload:function(){
			return this.fangan.reload();
		}
	};
	return layer;
},["zx/ui/base", "zx/lab", "./colors", "./navcss", "./fonts", "common/require"]);
Fengs.add('zx/maker/imgselector', function(S, $, REQ, UI, UPLOAD, LAB, COOKIE){
	return {
		init:function($btn,canvas){
			var $panel = $(".imgpanel")		//图片选择面板
				, lock = false				//是否锁定
				, isloaduserimage = false	//是否加载用户图片
				, userImageList = [];
			if($panel.length == 0){
				LAB.loading.show("请求数据中");
				$panel = $('<div class="imgpanel"></div>');
				S.use("zx/maker/img",function(list){
					var html = [];
					html.push('<div class="title">');
					for(var i=0,len=list.length; i<len; i++){
						html.push('<a class="'+ list[i].id +'">'+ list[i].name +'</a>');
					};
					html.push('</div>');
					html.push('<div class="list">');
					for(var i=0,len=list.length; i<len; i++){
						html.push('<ul class="'+ list[i].id +'">');
						for(var j=0,length=list[i].list.length; j<length; j++){
							html.push('<li class="load_bg"><img src="/images/mater/'+ list[i].id +'/'+ list[i].list[j] +'.png"/><span>点击添加</span></li>');
						};
						html.push('</ul>');
					};
					html.push('</div>');
					$panel.html(html.join(''));
					var $a = $("a", $panel)
						, $ul = $("ul", $panel)
						, show = function(index){
							$a.eq(index).addClass("cur").siblings('.cur').removeClass("cur");
							$ul.eq(index).addClass("cur").siblings('.cur').removeClass("cur");
						};
					$a.click(function(e){
						var $this = $(this);
						show($this.index());
						if(!isloaduserimage && $this.hasClass("user")){
							//定义上传及用户自定义图片
							var $upbtn = $('<li class="upload"><span>上传图片</span></li>')
							var upload = new UPLOAD(0);
							$ul.filter(".user").append($upbtn);
							upload.init($upbtn, function(url, id){
								$upbtn.before('<li class="load_bg"><img src="'+ url +'"/><a title="删除图片" rel="'+ id +'">×</a><span>点击添加</span></li>');
							});
							//sign请求接口
							LAB.request({
								'method':'taobao.picture.get'
								, 'picture_category_id': $.cookie('sourceCateId')
							}, function(data){
								console.log(data);
								var pictures = data.picture_get_response.pictures.picture ? data.picture_get_response.pictures.picture : [];
								pictures.forEach(function(img){
									$upbtn.before('<li class="load_bg"><img src="'+ img.picture_path +'"/><a title="删除图片" rel="'+ img.picture_id +'">×</a><span>点击添加</span></li>');
								});
							});
							/*REQ.s({
								url:"zx/image_list",
								data:{},
								success:function(d){
									LAB.loading.hide();
									isloaduserimage = true;
									d = d.sududa;
									if(d.status == 1 && d.all > 0){
										userImageList = d.list.l;
									};
									for(var i=0,len=userImageList.length; i<len; i++){
										$upbtn.before('<li class="load_bg"><img src="'+ userImageList[i].p +'"/><a title="删除图片" rel="'+ userImageList[i].i +'">×</a><span>点击添加</span></li>');
									}
								}
							});*/
							if(!window.userAgent){
								isloaduserimage = true;
								return;
							}
							UI.request({
								'method':'taobao.picture.get'
								, 'picture_category_id': $.cookie('sourceCateId')
							}, function(data){
								LAB.loading.show("获取用户图片");
								LAB.loading.hide();
								if(data.picture_get_response.pictures){
									var d = data.picture_get_response.pictures.picture;
									isloaduserimage = true;
									userImageList = d ? d : [];
									for(var i=0,len=userImageList.length; i<len; i++){
										$upbtn.before('<li class="load_bg"><img src="'+ userImageList[i].picture_path +'"/><a title="删除图片" rel="'+ userImageList[i].picture_id +'">×</a><span>点击添加</span></li>');
									};
								};
							});
							//获取用户图片结束
						}
					});
					$panel.on('click', "li img", function(){
						//添加图片到场景
						canvas.add({type:"image",src:$(this).attr("src")});
						$panel.css("display","none");
					}).on("click","li a",function(){
						var $this = $(this);
						LAB.loading.show("删除图片");
						LAB.request({
							'method': 'taobao.picture.delete'
							, 'picture_ids': $this.attr("rel")
						}, function(d){
							LAB.loading.hide();
							if(d.error_response){
								LAB.warn('删除失败');
								return false;
							}else{
								$this.parent().remove();
							};
						});
						/*REQ.s({
							url:"zx/image_del",
							data:{id:$this.attr("rel")},
							success:function(d){
								LAB.loading.hide();
								d = d.sududa;
								if(d.status == 1){
									$this.parent().remove();
								}else{
									LAB.warn(d.tips);
								}
							}
						})*/
					});
					$panel.find("li img").load(function(){
						$(this).parent().removeClass("load_bg");
					});
					show(0);
					LAB.loading.hide();
				});
				$panel.on({
					"mousedown":function(e){
						lock = true;
					},
					"mouseup":function(){
						lock = false;
					}
				});
				$(document).mousedown(function(e){
					if($panel.css("display") == "block" && !lock){
						$panel.css("display","none");
					}
				});
				$btn.parent().after($panel);
			};
			$panel.css({display:($panel.css("display") == "block" ? "none" : "block"),left:$btn.offset().left});
		}
	}
},["common/require", "zx/ui/base", "./upload", 'zx/lab', 'jquery/cookie']);
Fengs.add('zx/maker/canvas',function(S, $, UI, REQ, LAB){
	var baseEle
		, getStrsize = function(inStr){
			return inStr.replace(/[^\u0000-\u00ff]/ig,"aa").length;
		}
		, canvas;
	var baseEle = function(){
		return {
			content:"双击编辑文本"	//
			, size: 18				//
			, font: "zmsyh"		//
			, color:"#666666"		//
			, src:""				//
			, width:0				//
			, height:0				//
			, left:0 				//
			, top:0 				//
			, rotate: 0 			//
			, shadow: ""			//
			, radius: 3				//
			, move: 1				//
			, style: ""				//风格0正常，1加粗，2斜体
			, ele:null				//
			, mode: 0 				//0普通状态,1选中状态,2移动状态,3缩放状态,4上下拉伸，5左右拉伸，6旋转状态, 7编辑文本状态
			, swiMode: function(mode){
				this.mode = mode;
				if(mode == 0){
					this.ele.removeClass("selected").removeClass("edit");//.css("zIndex",1);
				}else if(mode == 7){
					this.ele.addClass("edit").css("zIndex",2);
				}else{
					this.ele.addClass("selected").removeClass("edit");//.css("zIndex",2);
				};
			}
			, copy:function(){
				var _this = this;
				canvas.add({type:_this.type,content:this.content,src:_this.src,font:_this.font,size:_this.size,color:_this.color,width:_this.width,height:_this.height,left:_this.left + 5,top:_this.top + 5,rotate:_this.rotate,radius:_this.radius,move:_this.move})
			}
			, del:canvas.del
			, init:function(opt){
				var _this = this
					, $ele
					, $span;
				_this = $.extend(_this, opt);
				var type = _this.type
					, T = canvas.panel[type];
				_this.ele = $ele = $('<div class="cvsi"><div><a class="copy" title="复制"></a><a class="del" title="删除"></a><i class="tl" data-mode="6"></i></div>');
				if(type == "text"){
					$span = $('<img src="" title="双击编辑文本"/>');
					$ele.find("div").addClass("text").append($span);
					_this.update = function(){
						var src = "/img/draw_string?text="+ encodeURIComponent(_this.content) +"&color="+ parseInt('0x'+ _this.color.replace("#","")) +"&name="+ encodeURIComponent(_this.font) +"&size="+ _this.size +"&style="+ _this.style;
						if(_this.shadow && _this.shadow != ""){
							src += "&color2="+ parseInt('0x'+ _this.shadow.replace("#","")) +"&x="+ _this.move;
						};
						$span.attr("src", src);//
					}
					_this.update();
					/*$span = $("span", $ele);
					$ele.css({"font-size":_this.size,"font-family":_this.font,color:_this.color});
					if(_this.shadow != ""){
						$span.css({"text-shadow":_this.move+"px "+ _this.move+"px "+ _this.radius +"px "+ _this.shadow});
					}*/
				}else{
					_this.src = _this.src.replace(/^images/,'/images');
					$ele.find("div").addClass("img load_bg").append('<i class="tr" data-mode="4"></i><i class="br" data-mode="3"></i><i class="bl" data-mode="5"></i><img src="'+ _this.src +'" />');
					$ele.find("img").load(function(){
						$ele.css({height:this.height, width:this.width});
						if(_this.width == 0 && _this.height == 0){
							_this.height = this.height;
							_this.width = this.width;
							
						};
						$ele.css({height:_this.height, width:_this.width});
						$(this).css({height:"100%",width:"100%"}).parent().removeClass('load_bg');
					});
				};
				$ele.css("webkitTransform","rotate("+ _this.rotate +"deg)")
				//拖动元素
				var startX
					, startY
					, startLeft
					, startTop
					, startWidth
					, startHeight
					, startRotate;
				var mousemove = function(e){
					switch(_this.mode){
						//移动模式
						case 2:
							//console.log(e.pageX - startX +","+ startLeft +","+ e.pageY - startY +","+ startTop)
							var left = e.pageX - startX + startLeft
								, top = e.pageY - startY + startTop;
							_this.ele.css({left:left,top:top});
							_this.left = left;
							_this.top = top;
							T.update(_this);
							break;
						//缩放模式
						case 3:
							var width = e.pageX - startX + startWidth
								, height = e.pageY - startY + startHeight;
							_this.width = width;
							_this.height = height;
							_this.ele.css({width:width,height:height});
							break;
						//左右拉伸
						case 4:
							var width = e.pageX - startX + startWidth;
							_this.width = width;
							_this.ele.css({width:width});
							break;
						//上下拉伸
						case 5:
							var height = e.pageY - startY + startHeight;
							_this.height = height;
							_this.ele.css({height:height});
							break;
						//旋转模式
						case 6:
							var deg = startY - e.pageY;
							deg = (startRotate + deg) % 359;
							_this.rotate = deg;
							if(deg == 0){
								$("i.tr,i.br,i.bl", _this.ele).show();
							}else{
								$("i.tr,i.br,i.bl", _this.ele).hide();
							}
							canvas.panel.rotate(_this.ele[0], deg)
							break;
					};
					//更新面板中的信息
					if(_this.mode > 1){
						T.update(_this);
					};
				};
				$ele.on({
					"mousedown":function(e){
						$(document).bind("mousemove", mousemove);
						canvas.selectItem = _this;
						canvas.select(_this);
						//var offset = _this.ele.offset();
						startLeft = parseInt(_this.ele.css("left"));
						startTop = parseInt(_this.ele.css("top"));
						startWidth = parseInt(_this.ele.css("width"));
						startHeight = parseInt(_this.ele.css("height"));
						startRotate = _this.rotate
						startX = e.pageX;
						startY = e.pageY;
						//console.log(offset.left +","+ offset.top +","+ e.pageX +","+ e.pageY);
						canvas.panel.swiMode(type);//右面板切换
						T.target = _this;
						T.update(_this);
						_this.ele.addClass("move");
						e.preventDefault();
						return false;
					},
					"mousemove":function(e){
						if(e.which == 1 && _this.mode == 1){
							_this.mode = 2;
						};
					},
					"dblclick":function(e){
						if(_this.type == "text"){
							LAB.prompt("修改文本","文本",_this.content,function(str){
								_this.content = str;
								$span.text(str);
								_this.update();
							});
						}
					},
					click:function(){
						return false;
					}
				}).on("mousedown","i.tl,i.tr,i.bl,i.br",function(e){
					var $this = $(this);
					_this.mode = $this.data("mode");
					e.preventDefault();
					startLeft = parseInt($this.css("left"));
					startTop = parseInt($this.css("top"));
					startWidth = parseInt(_this.ele.css("width"));
					startHeight = parseInt(_this.ele.css("height"));
					startRotate = _this.rotate;
					startX = e.pageX;
					startY = e.pageY;
					$(document).bind("mousemove", mousemove);
					return false;
				}).on("click","a",function(e){
					//复制或删除操作
					_this[$(this).attr("class")]();
				});
				$(document).on({
					"mouseup":function(e){
						if(_this.mode >= 1 && _this.mode < 7){
							_this.swiMode(1);
						};
						_this.ele.removeClass("move");
						$(document).unbind("mousemove", mousemove);
					},
					"keyup":function(e){
						if(e.keyCode == 46){
							canvas.del();
						};
						return false;
					}
				});
				canvas.cvs.append($ele.css({left:_this.left,top:_this.top}));
			}
		}
	};
	var defaultConfig = function(inObj){
		return $.extend({
			"width": 1920				//店招宽度
			, "height":120				//店招高度
			, "crumb": ""				//店招图片
			, "crumbid": ""				//店招图片ID
			, "hdimg": ""
			, "hdimgid": ""				//页头背景图ID
			, "color":"#ffffff"	//页面背景色
			, "image":""				//背景
			, "repeat":"repeat-x"		//
			//, "position":"0 0"			//
			, "pageimage":""
			, "pageimageid": ""				//页面背景图ID
			, "pagecolor":""
			, "pagerepeat":"repeat-y"
			, "attach":"scroll"			//
			//, "pageposition":"center 0"
		},inObj);
	}
	, defaultNav = function(){
		return {
			"height":30
			, "navbg":""			//整体背景色
			, "navbghover":""		//整体滑过背景色
			, "navcolor":""			//整体文本色
			, "navcolorhover":""	//整体滑过文本色
			, "navpadding":"20"		//两边距离
			, "navborder":"1"		//分类箭头色
			, "navbdcolor":""		//分类箭头色
			, "navarrow":"0"		//箭头类型
			, "catebg":""			//分类背景色
			, "catebghover":""		//分类滑过背景色
			, "catecolor":""		//分类文本色
			, "catecolorhover":""	//分类滑过文本色
			, "menubg":""			//菜单背景色
			, "menubghover":""		//菜单滑过背景色
			, "menucolor":""		//菜单文本色
			, "menucolorhover":""	//菜单滑过文本色
			, "poperbg":""			//子菜单背景色
			, "poperbghover":""		//子菜单滑过背景色
			, "popercolor":""		//子菜单文本色
			, "popercolorhover":""	//子菜单滑过文本色
		};
	}
	, canvas = {
		id:0
		, templist:[]
		, title:""
		, cvs:$("<div></div>")
		, panel:null
		, selectItem : null
		, select: function(obj){
			for(var i=0,len=canvas.list.length; i<len; i++){
				canvas.list[i].swiMode(canvas.list[i] == obj ? 1 : 0);
			}
		}
		, list:[]
		, add:function(opt){
			var obj = new baseEle();
			obj.init(opt);
			//将元素添加到列表中
			this.list.push(obj);
			canvas.cvs.append(obj.ele);
		}
		, del:function(){
			var s = canvas.selectItem;
			if(s != null){
				var index = $.inArray(s,canvas.list);
				if(index >= 0){
					canvas.list.splice(index, 1);
					s.ele.remove();
					s = null;
					//LAB.warn("删除成功")
				}
			}
		}
		,config:defaultConfig()
		, nav:defaultNav()
		/*
		保存店招方案
		savetype: 保存方式，1=方案另存；2=应用方案
		templateid: 模块ID
		callback: 保存完成后回调
		crumbid: 方案另存时的缩略图ID
		*/
		, save:function(savetype, templateid, callback, crumbid){
			var str = [],arr=[]
				, _config = new (function(){
					return canvas.config
				})()
				, _nav = new (function(){
					return canvas.nav
				})();
			if(savetype == 1){
				_config.crumbid = crumbid;
				delete _config.pageimageid;
				delete _config.hdimgid;
			}else{
				//delete _config.hdimgid;
			}
			str.push('{"config":{')
			for(item in _config){
				if(item != "file" && item != "url" && _config[item]){
					arr.push('"'+ item +'":"'+ _config[item] +'"');
				};
			};
			str.push(arr.join(","));
			str.push('},"nav":{');
			arr = [];
			for(item in _nav){
				arr.push('"'+ item +'":"'+ _nav[item] +'"');
			};
			str.push(arr.join(","));
			str.push('},"items":[');
			for(var i=0,list=canvas.list,len=list.length; i<len; i++){
				if(i != 0){
					str.push(",");
				};
				str.push('{');
				str.push('"type":"'+ list[i].type +'",');
				if(list[i].type == "text"){
					str.push('"content":"'+ list[i].content +'",');
					str.push('"size":"'+ list[i].size +'",');
					str.push('"font":"'+ list[i].font +'",');
					str.push('"color":"'+ list[i].color +'",');
					str.push('"shadow":"'+ list[i].shadow +'",');
					str.push('"radius":"'+ list[i].radius +'",');
					str.push('"move":"'+ list[i].move +'",');
				}else{
					str.push('"src":"'+ list[i].src +'",');
					str.push('"width":"'+ list[i].width +'",');
					str.push('"height":"'+ list[i].height +'",');
				};
				str.push('"rotate":'+ list[i].rotate +',');
				str.push('"top":'+ list[i].top +',');
				str.push('"left":'+ list[i].left);
				str.push('}');
			};
			str.push(']}');
			arr = [];
			//$.cookie("testdata",str.join(''),{path:"/",expires:30});
			var data = {'type':savetype, 'title':canvas.title, 'data':str.join(''), 'crumb': canvas.config.crumb};
			if(savetype == 2){
				return callback && callback(str.join(''));
				data.templateid = templateid;
				data['do'] = 'use';
			}else{
				data.id = templateid;
				data['do'] = 'add';
			};
			data.username = S.username;
			REQ.s({
				url: "api/custom_module_edit"
				, escape: false
				, type: 'post'
				, data: data
				, success:function(d){
					LAB.loading.hide();
					d = d.kehuda;
					if(savetype == 1){
						canvas.panel.reload();
						LAB.warn(d.tips);
						canvas.panel.swiMode("fangan");
					}else{
						callback && callback();
					};
				}
			});
			//return str.join('');
		}
		/*
		加载方案
		data: 方案对象
		isInit: 是否初始方案
		*/
		, load:function(data, isInit){
			var c;
			if(!isInit){
				delete data.config.hdimgid;
				delete data.config.pageimageid;
				delete data.config.crumbid;
			};
			this.config = c = $.extend(defaultConfig(isInit ? {} : {hdimgid:this.config.hdimgid, pageimageid:this.config.pageimageid, crumbid:this.config.crumbid}) ,data.config);
			this.nav = $.extend(defaultNav(),data.nav);
			//alert(this.config.crumbid);
			if(c.width == 1920){
				canvas.bg.css({"background-color":c.color}).find("#nav").width("100%");
			}else{
				canvas.bg.find("#nav").width(950);
			};
			this.cvs.html('');
			this.list = [];
			canvas.panel.setting.update();
			canvas.panel.daohang.update(canvas.nav);
			canvas.cvs.css({"background-image":"url("+ c.image +")","background-repeat":c.repeat,"background-position":c.position,"background-color":c.color});
			for(var i=0,list=data.items,len=list.length; i<len; i++){
				canvas.add(list[i]);
			};
		}
	};
	return canvas;
},["../ui/base", "common/require", "zx/lab"]);
Fengs.add('zx/maker/base',function(S, $, LAYER, CANVAS, UI, REQ, ARTTEMPLATE, LAB){
	var _this
		, W = window
		, loading = W.top.UTILS.loading
		, basecss = function(){
			return ".tshop-pbsm-shop-nav-ch body,.tshop-pbsm-shop-nav-ch .body{ background-image:url({@pageimage});background-repeat:{@pagerepeat};background-color:{@pagecolor};background-position:center 0;background-attachment:{@attach};}"
		}
		, dzcss = function(){
			return '.tshop-um-custom-banner{height: {@height}px;width:950px;margin: auto;background:url({@dzimage}) no-repeat;}';//.tshop-um-custom-banner,.tshop-um-custom-banner a{color:#f00;text-decoration:none;}.tshop-um-custom-banner .banner{padding-top: 95px;height: 25px;z-index: 99;}.tshop-um-custom-banner .bannernotice{float:left;border:0;width:230px;height:14px;padding:5px 6px;line-height:14px;background-position:-382px 0;overflow: hidden;}.tshop-um-custom-banner .scroll-news{height:14px;line-height:14px;overflow: hidden; }.tshop-um-custom-banner .scroll-news a{display:block;height:14px;line-height:14px;overflow: hidden; }.tshop-um-custom-banner .navsearch{position:relative; left:auto;right:10px;padding:0;float: right;top:4px;width:180px;height:0;z-index:2;}.tshop-um-custom-banner .navsearch .form {float:left;width:180px;height: 21px;background:none;border:1px solid #222;background-color: #fff;}.tshop-um-custom-banner .navsearch .form .text {float:left;width:156px;height:21px;line-height:21px;border:0;color:#686868;padding-left:2px;background:none;}.tshop-um-custom-banner .navsearch .form .button {float:right;cursor:pointer;width:22px;height:21px;font-size:0;background:none;background:url(http://img01.taobaocdn.com/imgextra/i4/TB10EHsGFXXXXXhXpXXwu0bFXXX.png) no-repeat -87px -8px;border:0;margin:0;}.tshop-um-custom-banner .navkeys{float: right;line-height:25px;height:0px; }.tshop-um-custom-banner .navkeys span{color:#ccc;margin:0 4px;}.tshop-um-custom-banner .navkeys a{display: inline-block;}';
		}
		, jsonToStr = LAB.jsonToStr
		, globalcss = function(){
			return '#hd {background-image:url({@hdimg});background-repeat:repeat-x ;background-position:center 0;background-color:{@color};margin-bottom:0px;}';
		}
		, uploadImage = function(picture_id, category_id, imgdata, callback){
			return LAB.uploadImg(picture_id, category_id, imgdata, function(d){
				if(!d){
					callback && callback(0);
				}else{
					callback && callback(1, d.picture_path, d.picture_id);
				}
			});

			/*var cb = 'cb'+ new Date().getTime().toString(32) + Math.ceil(Math.random() * 10000).toString(32);
			window.top[cb] = function(status, tips, data){
				if(status == 0 || data.error_response !== undefined){
					LAB.warn(tips);
					callback && callback(0);
				}else{
					var d = data.picture_upload_response;
					if(!d.picture == false){//新增
						d = d.picture;
						callback && callback(1, d.picture_path, d.picture_id);
					}else{//替换
						UI.request({
							'method':'taobao.picture.get'
							, 'picture_id': picture_id
						}, function(data){
							var pictures = data.picture_get_response.pictures.picture ? data.picture_get_response.pictures.picture : [];
							if(pictures.length > 0){
								var d = pictures[0];
								callback && callback(1, d.picture_path, d.picture_id);
							}else{
								callback && callback(0);
							}
						})
					};
				}
				delete window.top[cb];
			};
			alert("[do]taobaopicturereplace[/do][title]picture_id="+ picture_id +"&picture_category_id="+ category_id +"[/title][param]"+ imgdata +"[/param][url]"+ cb +"[/url]");*/
		};
	W.applySite = W.top.$("[name=applySite]").val();
	//W.applySite = 1;
	var folderCateId = $.cookie("folderCateId")
		, sourceCateId = $.cookie("sourceCateId");
	return {
		mode:"select"
		, templateid:0
		, switchMode:function(mode, index){
			_this.mode = mode;
			switch(mode){
				case "save":
					if(S.istry){
						return LAB.warn("请注册登录");
					};
					var dosave = function(){
						loading.show("正在保存数据");
						var tempid = 0
							, crumbid = "";
						for(var i=0,list=CANVAS.templist,len=list.length; i<len; i++){
							if(list[i].e == CANVAS.title){
								tempid = list[i].i;
								crumbid = $.parseJSON(list[i].s.replace(/｝/g,"}").replace(/｛/g,"{")).config.crumbid;
								break;
							}
						}
						S.use("zx/maker/save",function(S){
							S.save(CANVAS.config, CANVAS.list,function(imgdata){
								imgdata = imgdata.replace("data:image/png;base64,","");
								uploadImage(crumbid, folderCateId, imgdata, function(status, url, id){
									loading.hide();
									if(status == 1){
										CANVAS.config.crumb = url;
										CANVAS.config.crumbid = id;
										CANVAS.save(1, tempid, false, id);
									}else{
										LAB.warn('保存失败');
									};
									//W[cb] = null;
								});
							});
						});
					};
					LAB.prompt('保存方案','方案名称',CANVAS.title,function(str){
						/*if(!W.userAgent){
							return LAB.warn("请下载装修助手客户端");
						};*/
						CANVAS.title = str;
						dosave();
					});
					return;
					break;
				case "text":
					_this.wrap.css("cursor","text");
					break;
				case "getcode":
					return;
				case "view":
					//生成预览图功能
					loading.show("生成预览图");
					S.use("zx/maker/save",function(F){
						F.save(CANVAS.config, CANVAS.list,function(image){
							var $preview = $('<div class="ui_mark" id="ui_loading"><div class="ui_content ui_preview"><img /></div></div>');
							$("body").append($preview.click(function(){$preview.fadeOut(function(){
								$preview.remove();
							});}));
							$("img", $preview).attr("src", image).load(function(){
								$(this).css("webkitTransform","scale(1,1)")
								loading.hide();
							});
						});
					});
					return;
					break;
				case "yinyong":
					if(S.istry){
						return LAB.warn("请注册登录");
					};
					loading.show("生成店招图");
					S.use("zx/maker/save",function(S){
						S.save(CANVAS.config, CANVAS.list,function(imgdata){
							loading.show("生成图片并上传");
							imgdata = imgdata.replace("data:image/png;base64,","")
							S.getBg(CANVAS,function(bgimg){
								//建立背景图上传队列
								var upcount = 1
									, timestamp = new Date().getTime()
									, callback = function(){
										loading.show("保存设计方案");
										CANVAS.save(2, _this.templateid, function(strData){
											loading.show("应用到当前模板");
											var gcss = globalcss()	//
												, config = CANVAS.config
												, dcss = dzcss()	//
												, bcss = basecss()	//
												, navcss = CANVAS.panel.daohang.createcss(CANVAS.nav,true)
												, arr = {};
											/*if(config.attach == "fixed"){
												config.pagerepeat = "no-repeat";
											};*/
											for(i in config){
												if(i == "color" || i == "pagecolor"){
													config[i] = LAYER.toHex(config[i]);
												};
												arr[i] = eval('(/{@'+ i +'}/gi)');
												gcss = gcss.replace(arr[i],config[i]);
												bcss = bcss.replace(arr[i],config[i]);
											};
											dcss = dcss.replace(/{@dzimage}/gi, config.crumb);
											dcss = dcss.replace(/{@height}/gi, config.height);
											//if(W.applySite == 1){
											//	gcss = bcss.replace(".tshop-pbsm-shop-nav-ch body","#content");
												navcss = bcss + navcss;
											//};
											REQ.s({
												url:"api/custom_banner_edit"
												, type: 'post'
												, escape: false
												, data: {
													"uid": _this.uid
													, 'username': S.username
													, 'data': strData
													, 'page': jsonToStr(config)
													, 'nav': jsonToStr(CANVAS.nav)
												}
												, success:function(d){
													d = d.kehuda;
													if(d.status == "1"){
														loading.show('重新加载页面中');
														setTimeout(function(){
															W.top.location.href = W.top.location.href;
														},500);
													}else{
														loading.hide();
														LAB.warn(d.tips);
													};
												}
											})
										});
									};
								if(W.applySite != 1){
									upcount++;
								};
								/*if(CANVAS.config.pageimage != ""){
									upcount++;
									//上传页面背景图
									W.top[cb2] = function(status,tips,id, url){
										if(status == 1){
											if(url != ""){
												CANVAS.config.pageimage = url +"?"+ timestamp;
											}
											CANVAS.config.pageimageid = id;
											upcount--;
											if(upcount == 0){
												callback();
											};
										}else{
											LAB.warn("3图片上传失败"+ tips);
											loading.hide();
										};
										//W[cb2] = null;
									};
									alert("[do]taobaopicturereplace[/do]"+ (CANVAS.config.pageimage != "" ? "[title]picture_id="+ CANVAS.config.pageimageid +"&picture_category_id="+ folderCateId +"[/title]" : "") +"[param]"+ CANVAS.config.pageimage +"[/param][url]"+ cb2 +"[/url]");
								};*/
								//alert(CANVAS.config.crumbid)
								uploadImage((CANVAS.config.crumb != "" ? + CANVAS.config.crumbid : "0"), folderCateId, imgdata, function(status, url, id){
									if(status == 1){
										CANVAS.config.crumb = url +"?"+ timestamp;
										CANVAS.config.crumbid = id;
										upcount--;
										if(upcount == 0){
											callback();
										};
									}else{
										LAB.warn("店招图上传失败");
										loading.hide();
									};
									//W[cb] = null;
								});
								if(W.applySite != 1){
									uploadImage((CANVAS.config.hdimg != "" ? + CANVAS.config.hdimgid : "0"), folderCateId, bgimg.replace("data:image/png;base64,",""), function(status, url, id){
											if(status == 1){
												CANVAS.config.hdimg = url +"?"+ timestamp;
												CANVAS.config.hdimgid = id;
												upcount--;
												if(upcount == 0){
													callback();
												};
											}else{
												LAB.warn("店招背景图上传失败");
												loading.hide();
											};
											//W[cb1] = null;
										});
								};
								/*alert("[do]taobaopicturereplace[/do][title]picture_id="+ (CANVAS.config.crumb != "" ? + CANVAS.config.crumbid : "0") +"&picture_category_id="+ folderCateId +"[/title][param]"+ imgdata +"[/param][url]"+ cb +"[/url]");
								alert("[do]taobaopicturereplace[/do][title]picture_id="+ (CANVAS.config.hdimg != "" ? CANVAS.config.hdimgid : "0") +"&picture_category_id="+ folderCateId +"[/title][param]"+ bgimg.replace("data:image/png;base64,","") +"[/param][url]"+ cb1 +"[/url]");*/

							})
						});
					});
				default:
					_this.wrap.css("cursor","default");
					break;
			};
			LAYER.swiMode(mode, index);
			$("a[rel="+ mode +"]",_this.toolbar).addClass('cur').siblings('.cur').removeClass("cur");
		}
		, init:function(uid, templateid, callback){
			var html = [];
			_this = this;
			_this.uid = uid;
			_this.templateid = templateid;
			var _html = ARTTEMPLATE('mainTemp', {'client': window.userAgent});
			$("body").html(_html).on("click","#nav",function(){
				_this.switchMode("daohang",0);
				return false;
			}).on("click","#hd",function(){
				_this.switchMode("setting",0);
				return false;
			}).on("click","section ",function(){
				_this.switchMode("setting",1);
			}).on("click","header a.close,header a.quit",function(){
				top.$("#ui_frame").remove();
			}).on("click", "header a[rel]", function(e){
				var $this = $(this)
					, rel = $this.attr("rel");
				if(rel == "image"){
					S.use("zx/maker/imgselector",function(F){
						F.init($this,CANVAS);
					});
					return false;
				}else{
					_this.switchMode(rel);
				};
			}).on("click", ".cats-tree", function(){
				_this.switchMode("daohang",1);
				return false;
			});
			$("section")[0].onselectstart = function(){
				return false;
			};
			_this.toolbar = $("header");
			LAYER.init($("aside"));
			CANVAS.bg = $("#hd");
			CANVAS.cvs = _this.viewer = $("#viewer");
			CANVAS.panel = LAYER;
			_this.wrap = $("section");
			(function(){
				var tartX = 0
					,startY = 0
					,tips = _this.tips()
					,moveTip = function(x,y){
						tips.css({left:x,top:y});
					}
					,cteated = false;
				_this.wrap.on({
					"mousedown":function(e){
						if(_this.mode != "select"){
							cteated = true;
							return;
						};
						var point = _this.getPoint(e);
						startX = point.x;
						startY = point.y;
					},
					"mousemove":function(e){
						switch(_this.mode){
							case "text":
								tips.text("点击添加文本");
								moveTip(e.pageX,e.pageY);
								break;
						};
					},
					"mouseleave":function(){
						tips.hide();
					},
					"mouseenter":function(){
						if(_this.mode == "text"){
							tips.show();
						};
					}
					,"mouseup":function(e){
						if(_this.mode == "text"){
							if(cteated == true){
								cteated = false;
								var point = _this.getPoint(e);
								CANVAS.add({type:"text",left:point.x,top:point.y});
							};
							_this.switchMode("select");
							tips.hide();
						};
					}
				})
			})();
			(function(arr){
				var bindhover = function(cssname){
					$(".tshop-pbsm-shop-nav-ch ."+ cssname).hover(function(){
						$(this).addClass(cssname +"-hover");
					},function(){
						$(this).removeClass(cssname +"-hover");
					});
				};
				for(var i=0,len=arr.length; i<len; i++){
					bindhover(arr[i]);
				};
			})(['menu', 'all-cats', 'cat-hd', 'snd-cat-hd','sub-cat']);

			//更新店招属性
			LAYER.target = CANVAS;
			//LAYER.setting.updata();
			//读取测试数据开始
			/*try{
				var data = $.cookie("testdata");
				CANVAS.load($.parseJSON(data));

			}catch(e){};*/
			//初始加载的模板ID
			(function(){
				var tempcb = function(){
					LAYER.fangan.useid(templateid);
				};
				if(!S.istry){
					REQ.s({
						url:"api/custom_module_applied",
						escape: false,
						data:{'id': uid, 'username': S.username},
						success:function(d){
							d = d.kehuda;
							if(d.status == 1 && d.module.i){
								d = d.module;
								d.s = d.s.replace(/｝/g,"}").replace(/｛/g,"{");
								CANVAS.id = d.i;
								CANVAS.title = d.e;
								CANVAS.load($.parseJSON(d.s),true);
							}else{
								tempcb();
							};
						},
						error:function(){
							tempcb();
						}
					})
				}else{
					tempcb();
				};
			})();
			if(folderCateId == null && sourceCateId == null){
				LAB.request({'method': 'taobao.picture.category.get'}, function(data){
					if(!data.picture_category_get_response){
						return LAB.warn('获取图片空间数据失败');
					};
					try{
						var list = data.picture_category_get_response.picture_categories.picture_category;
						for(var i = 0, len = list.length; i<len; i++){
							if(list[i].parent_id == 0 && list[i].picture_category_name == '客户达店招'){
								folderCateId = list[i].picture_category_id;
								$.cookie('folderCateId', folderCateId, {'path':'/'});
							};
							if(list[i].parent_id == 0 && list[i].picture_category_name == '客户达源图'){
								sourceCateId = list[i].picture_category_id;
								$.cookie('sourceCateId', sourceCateId, {'path':'/'});
							};
						};
					}catch(e){};
					if(folderCateId === null || !folderCateId){
						/*{"picture_category_add_response":{"picture_category":{"created":"2015-06-24 11:34:59","modified":"2015-06-24 11:34:59","parent_id":0,"picture_category_id":179551105895329108,"picture_category_name":"\u5ba2\u6237\u8fbe\u88c5\u4fee\u56fe","position":1,"total":0,"type":"user-define"}}}*/
						LAB.request({
							'method': 'taobao.picture.category.add'
							, 'picture_category_name': '客户达店招'
							, 'type': 'user-define'
						}, function(d){
							folderCateId = d.picture_category_add_response.picture_category.picture_category_id;
							$.cookie('folderCateId', folderCateId, {'path':'/'});
						});
					};
					if(sourceCateId === null || !sourceCateId){
						LAB.request({
							'method': 'taobao.picture.category.add'
							, 'picture_category_name': '客户达源图'
							, 'type': 'user-define'
						}, function(d){
							sourceCateId = d.picture_category_add_response.picture_category.picture_category_id;
							$.cookie('sourceCateId', sourceCateId, {'path':'/'});
						});
					};
				});
			}
			return callback && callback();
			/*$.use("data",function(S){
				CANVAS.load(S);
			});*/
			//读取测试数据结束
		}
		, tips:function(){
			var $tips = $(".tips");
			if($tips.length == 0){
				$tips = $('<div class="tips"></div>');
				this.wrap.append($tips);
			};
			return $tips;
		}
		, getPoint:function(e){
			var offset = _this.viewer.offset();
			return {x:e.pageX - offset.left,y:e.pageY - offset.top}
		}
	}
},["./layer", "./canvas", "zx/ui/base","common/require", "plus/art-template", "zx/lab"]);