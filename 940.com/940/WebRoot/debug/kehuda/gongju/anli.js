Fengs.add('kehuda/gongju/anli', function(S, $, ui, req){
	var minCount = 18
		, lineCount = 3;
	$(document).ready(function(){
		// req.s({
		// 	//host:'//www.kehuda.com:1024/',
		// 	url:"/web/khd_seller_list",
		// 	data:{"username":"admin@sududa.com","timestamp":(new Date()).getTime()},
		// 	success:function(d){
		// 		d = d.kehuda;
		// 		if(d.status == 1){
					
		// 		}
		// 	}
		// });

					var list=[
						 {l:12,w:'百花香气',u:'https://shop112796391.taobao.com/'}
						,{l:12,w:'一诺言言',u:'https://lieliu.taobao.com/'}
						,{l:11,w:'明鹏电子商务',u:'https://shop118358288.taobao.com/'}
						,{l:8,w:'俏姿阁',u:'https://shop137587236.taobao.com/'}
						,{l:12,w:'晟气凌人',u:'https://shop58169230.taobao.com/'}
						,{l:11,w:'田小姐美丽日记',u:'https://shop121781364.taobao.com/'}
						,{l:6,w:'西柚生活馆',u:'https://shop140494463.taobao.com/'}
						,{l:11,w:'选平1987',u:'https://shop100628500.taobao.com/'}
						,{l:11,w:'海马时代',u:'https://shop35499516.taobao.com/'}
						,{l:12,w:'淘淘乐20110221',u:'https://dashanwl.taobao.com/'}
						,{l:11,w:'简溢123',u:'https://shop125300480.taobao.com/'}
						,{l:6,w:'梦梦黛儿',u:'https://shop140493740.taobao.com/'}
					]
					var liHtml = '',imgSrc;
					$.each(list,function(i,obj){
						// console.log(obj.u);
						var _l = obj.l;
						if (_l<=5) {
							 imgSrc = 's_red_' + _l;
						}else if(_l>5&&_l<=10){
							imgSrc = 's_blue_' + (_l-5);
						}else if(_l>10&&_l<=15){
							imgSrc = 's_cap_' + (_l-10);
						}else if(_l>15&&_l<=20){
							imgSrc = 'b_cap_' + (_l-15);
						}
						liHtml += '<li><div class="kd_info"><p class="p_credit"><img src="/images/rank/'+imgSrc+'.gif"></p><p class="p_name">掌柜：'+obj.w+'</p></div><a target="_blank" class="a_link" href="'+obj.u+'">点击查看</a></li>'
					});
					$('.kd_list_ul').html(liHtml);
	});
},["kehuda/utils","common/require", "kehuda/navbar"]);
