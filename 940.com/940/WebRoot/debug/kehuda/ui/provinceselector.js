Fengs.add('kehuda/ui/provinceselector', function(S, $){
	var CITYS={province:["","四川","贵州","云南","西藏","河南","湖北","湖南","广东","广西","陕西","甘肃","青海","宁夏","新疆","河北","山西","内蒙古","江苏","浙江","安徽","福建","江西","山东","辽宁","吉林","黑龙江","海南"],city:[{i:1,n:"阿坝",y:"AB"},{i:10,n:"安康",y:"AK"},{i:14,n:"阿克苏",y:"AKS"},{i:4,n:"阿里",y:"AL"},{i:17,n:"阿拉善",y:"ALS"},{i:14,n:"阿勒泰",y:"ALT"},{i:0,n:"澳门",y:"AM"},{i:20,n:"安庆",y:"AQ"},{i:2,n:"安顺",y:"AS"},{i:24,n:"鞍山",y:"AS"},{i:5,n:"安阳",y:"AY"},{i:20,n:"蚌埠",y:"BB"},{i:25,n:"白城",y:"BC"},{i:15,n:"保定",y:"BD"},{i:14,n:"博尔塔拉",y:"BETL"},{i:9,n:"北海",y:"BH"},{i:2,n:"毕节",y:"BJ"},{i:10,n:"宝鸡",y:"BJ"},{i:25,n:"白山",y:"BS"},{i:3,n:"保山",y:"BS"},{i:8,n:"佛山",y:"BS"},{i:9,n:"百色",y:"BS"},{i:17,n:"包头",y:"BT"},{i:24,n:"本溪",y:"BX"},{i:14,n:"巴音郭楞",y:"BYGL"},{i:17,n:"巴彦淖尔",y:"BYNE"},{i:11,n:"白银",y:"BY"},{i:20,n:"亳州",y:"BZ"},{i:23,n:"滨州",y:"BZ"},{i:1,n:"巴中",y:"BZ"},{i:4,n:"昌都",y:"CD"},{i:15,n:"承德",y:"CD"},{i:7,n:"常德",y:"CD"},{i:17,n:"赤峰",y:"CF"},{i:20,n:"巢湖",y:"CH"},{i:14,n:"昌吉",y:"CJ"},{i:3,n:"楚雄",y:"CX"},{i:24,n:"朝阳",y:"CY"},{i:20,n:"池州",y:"CZ"},{i:20,n:"滁州",y:"CZ"},{i:18,n:"常州",y:"CZ"},{i:7,n:"郴州",y:"CZ"},{i:15,n:"沧州",y:"CZ"},{i:8,n:"潮州",y:"CZ"},{i:9,n:"崇左",y:"CZ"},{i:24,n:"丹东",y:"DD"},{i:8,n:"东莞",y:"DG"},{i:3,n:"德宏",y:"DH"},{i:3,n:"大理",y:"DL"},{i:24,n:"大连",y:"DL"},{i:3,n:"迪庆",y:"DQ"},{i:26,n:"大庆",y:"DQ"},{i:16,n:"大同",y:"DT"},{i:26,n:"大兴安岭",y:"DXAL"},{i:11,n:"定西",y:"DX"},{i:23,n:"东营",y:"DY"},{i:1,n:"德阳",y:"DY"},{i:1,n:"达州",y:"DZ"},{i:23,n:"德州",y:"DZ"},{i:17,n:"鄂尔多斯",y:"EEDS"},{i:6,n:"恩施",y:"ES"},{i:6,n:"鄂州",y:"EZ"},{i:9,n:"防城港",y:"FCG"},{i:24,n:"抚顺",y:"FS"},{i:24,n:"阜新",y:"FX"},{i:20,n:"阜阳",y:"FY"},{i:22,n:"抚州",y:"FZ"},{i:21,n:"福州",y:"FZ"},{i:1,n:"广安",y:"GA"},{i:9,n:"贵港",y:"GG"},{i:12,n:"果洛",y:"GL"},{i:9,n:"桂林",y:"GL"},{i:11,n:"甘南",y:"GN"},{i:1,n:"广元",y:"GY"},{i:2,n:"贵阳",y:"GY"},{i:13,n:"固原",y:"GY"},{i:1,n:"甘孜",y:"GZ"},{i:22,n:"赣州",y:"GZ"},{i:18,n:"淮安",y:"HA"},{i:12,n:"海北",y:"HB"},{i:20,n:"淮北",y:"HB"},{i:5,n:"鹤壁",y:"HB"},{i:9,n:"河池",y:"HC"},{i:12,n:"海东",y:"HD"},{i:15,n:"邯郸",y:"HD"},{i:26,n:"哈尔滨",y:"HEB"},{i:20,n:"合肥",y:"HF"},{i:6,n:"黄冈",y:"HG"},{i:26,n:"鹤岗",y:"HG"},{i:3,n:"红河",y:"HH"},{i:17,n:"呼和浩特",y:"HHHT"},{i:26,n:"黑河",y:"HH"},{i:7,n:"怀化",y:"HH"},{i:27,n:"海口",y:"HK"},{i:17,n:"呼伦贝尔",y:"HLBE"},{i:24,n:"葫芦岛",y:"HLD"},{i:14,n:"哈密",y:"HM"},{i:12,n:"黄南",y:"HN"},{i:12,n:"海南",y:"HN"},{i:20,n:"淮南",y:"HN"},{i:20,n:"黄山",y:"HS"},{i:6,n:"黄石",y:"HS"},{i:15,n:"衡水",y:"HS"},{i:14,n:"和田",y:"HT"},{i:12,n:"海西",y:"HX"},{i:7,n:"衡阳",y:"HY"},{i:8,n:"河源",y:"HY"},{i:10,n:"汉中",y:"HZ"},{i:9,n:"贺州",y:"HZ"},{i:23,n:"荷泽",y:"HZ"},{i:19,n:"湖州",y:"HZ"},{i:8,n:"惠州",y:"HZ"},{i:22,n:"吉安",y:"JA"},{i:16,n:"晋城",y:"JC"},{i:11,n:"金昌",y:"JC"},{i:22,n:"景德镇",y:"JDZ"},{i:19,n:"金华",y:"JH"},{i:22,n:"九江",y:"JJ"},{i:25,n:"吉林",y:"JL"},{i:6,n:"荆门",y:"JM"},{i:8,n:"江门",y:"JM"},{i:26,n:"佳木斯",y:"JMS"},{i:23,n:"济宁",y:"JN"},{i:23,n:"济南",y:"JN"},{i:11,n:"酒泉",y:"JQ"},{i:19,n:"嘉兴",y:"JX"},{i:26,n:"鸡西",y:"JX"},{i:11,n:"嘉峪关",y:"JYG"},{i:8,n:"揭阳",y:"JY"},{i:5,n:"焦作",y:"JZ"},{i:16,n:"晋中",y:"JZ"},{i:6,n:"荆州",y:"JZ"},{i:24,n:"锦州",y:"JZ"},{i:5,n:"开封",y:"KF"},{i:14,n:"克拉玛依",y:"KLMY"},{i:3,n:"昆明",y:"KM"},{i:14,n:"喀什",y:"KS"},{i:14,n:"克孜勒苏柯尔克孜",y:"KZLSKEKZ"},{i:20,n:"六安",y:"LA"},{i:9,n:"来宾",y:"LB"},{i:3,n:"临沧",y:"LC"},{i:23,n:"聊城",y:"LC"},{i:7,n:"娄底",y:"LD"},{i:16,n:"临汾",y:"LF"},{i:15,n:"廊坊",y:"LF"},{i:5,n:"漯河",y:"LH"},{i:3,n:"丽江",y:"LJ"},{i:16,n:"吕梁",y:"LL"},{i:11,n:"陇南",y:"LN"},{i:2,n:"六盘水",y:"LPS"},{i:4,n:"拉萨",y:"LS"},{i:1,n:"乐山",y:"LS"},{i:19,n:"丽水",y:"LS"},{i:1,n:"凉山",y:"LS"},{i:23,n:"莱芜",y:"LW"},{i:11,n:"临夏",y:"LX"},{i:18,n:"连云港",y:"LYG"},{i:25,n:"辽源",y:"LY"},{i:21,n:"龙岩",y:"LY"},{i:23,n:"临沂",y:"LY"},{i:5,n:"洛阳",y:"LY"},{i:24,n:"辽阳",y:"LY"},{i:4,n:"林芝",y:"LZ"},{i:11,n:"兰州",y:"LZ"},{i:1,n:"泸州",y:"LZ"},{i:9,n:"柳州",y:"LZ"},{i:20,n:"马鞍山",y:"MAS"},{i:26,n:"牡丹江",y:"MDJ"},{i:8,n:"茂名",y:"MM"},{i:1,n:"眉山",y:"MS"},{i:1,n:"绵阳",y:"MY"},{i:8,n:"梅州",y:"MZ"},{i:19,n:"宁波",y:"NB"},{i:1,n:"南充",y:"NC"},{i:22,n:"南昌",y:"NC"},{i:21,n:"宁德",y:"ND"},{i:3,n:"怒江",y:"NJ"},{i:1,n:"内江",y:"NJ"},{i:9,n:"南宁",y:"NN"},{i:21,n:"南平",y:"NP"},{i:4,n:"那曲",y:"NQ"},{i:18,n:"南通",y:"NT"},{i:5,n:"南阳",y:"NY"},{i:5,n:"平顶山",y:"PDS"},{i:24,n:"盘锦",y:"PJ"},{i:11,n:"平凉",y:"PL"},{i:21,n:"莆田",y:"PT"},{i:22,n:"萍乡",y:"PX"},{i:5,n:"濮阳",y:"PY"},{i:1,n:"攀枝花",y:"PZH"},{i:2,n:"黔东南",y:"QDN"},{i:23,n:"青岛",y:"QD"},{i:15,n:"秦皇岛",y:"QHD"},{i:3,n:"曲靖",y:"QJ"},{i:2,n:"黔南",y:"QN"},{i:26,n:"齐齐哈尔",y:"QQHE"},{i:26,n:"七台河",y:"QTH"},{i:2,n:"黔西南",y:"QXN"},{i:8,n:"清远",y:"QY"},{i:11,n:"庆阳",y:"QY"},{i:9,n:"钦州",y:"QZ"},{i:19,n:"衢州",y:"QZ"},{i:21,n:"泉州",y:"QZ"},{i:4,n:"日喀则",y:"RKZ"},{i:23,n:"日照",y:"RZ"},{i:8,n:"韶关",y:"SG"},{i:26,n:"绥化",y:"SH"},{i:15,n:"石家庄",y:"SJZ"},{i:10,n:"商洛",y:"SL"},{i:3,n:"思茅",y:"SM"},{i:21,n:"三明",y:"SM"},{i:21,n:"厦门",y:"SM"},{i:5,n:"三门峡",y:"SMX"},{i:4,n:"山南",y:"SN"},{i:1,n:"遂宁",y:"SN"},{i:25,n:"四平",y:"SP"},{i:5,n:"商丘",y:"SQ"},{i:22,n:"上饶",y:"SR"},{i:8,n:"汕头",y:"ST"},{i:8,n:"汕尾",y:"SW"},{i:19,n:"绍兴",y:"SX"},{i:25,n:"松原",y:"SY"},{i:27,n:"三亚",y:"SY"},{i:6,n:"十堰",y:"SY"},{i:7,n:"邵阳",y:"SY"},{i:26,n:"双鸭山",y:"SYS"},{i:6,n:"随州",y:"SZ"},{i:18,n:"苏州",y:"SZ"},{i:16,n:"朔州",y:"SZ"},{i:13,n:"石嘴山",y:"SZS"},{i:23,n:"泰安",y:"TA"},{i:14,n:"塔城",y:"TC"},{i:10,n:"铜川",y:"TC"},{i:25,n:"通化",y:"TH"},{i:14,n:"吐鲁番",y:"TLF"},{i:20,n:"铜陵",y:"TL"},{i:17,n:"通辽",y:"TL"},{i:24,n:"铁岭",y:"TL"},{i:2,n:"铜仁",y:"TR"},{i:11,n:"天水",y:"TS"},{i:15,n:"唐山",y:"TS"},{i:0,n:"台湾",y:"TW"},{i:16,n:"太原",y:"TY"},{i:18,n:"泰州",y:"TZ"},{i:19,n:"台州",y:"TZ"},{i:23,n:"潍坊",y:"WF"},{i:23,n:"威海",y:"WH"},{i:17,n:"乌海",y:"WH"},{i:20,n:"芜湖",y:"WH"},{i:17,n:"乌兰察布",y:"WLCB"},{i:14,n:"乌鲁木齐",y:"WLMQ"},{i:10,n:"渭南",y:"WN"},{i:3,n:"文山",y:"WS"},{i:11,n:"武威",y:"WW"},{i:18,n:"无锡",y:"WX"},{i:19,n:"温州",y:"WZ"},{i:9,n:"梧州",y:"WZ"},{i:13,n:"吴忠",y:"WZ"},{i:17,n:"兴安",y:"XA"},{i:20,n:"宣城",y:"XC"},{i:5,n:"许昌",y:"XC"},{i:6,n:"襄樊",y:"XF"},{i:0,n:"香港",y:"XG"},{i:6,n:"孝感",y:"XG"},{i:17,n:"锡林郭勒",y:"XLGL"},{i:12,n:"西宁",y:"XN"},{i:6,n:"咸宁",y:"XN"},{i:18,n:"宿迁",y:"XQ"},{i:3,n:"西双版纳",y:"XSBN"},{i:15,n:"邢台",y:"XT"},{i:7,n:"湘潭",y:"XT"},{i:5,n:"新乡",y:"XX"},{i:7,n:"湘西",y:"XX"},{i:5,n:"信阳",y:"XY"},{i:22,n:"新余",y:"XY"},{i:10,n:"咸阳",y:"XY"},{i:18,n:"徐州",y:"XZ"},{i:20,n:"宿州",y:"XZ"},{i:16,n:"忻州",y:"XZ"},{i:10,n:"延安",y:"YA"},{i:1,n:"雅安",y:"YA"},{i:25,n:"延边",y:"YB"},{i:1,n:"宜宾",y:"YB"},{i:13,n:"银川",y:"YC"},{i:6,n:"宜昌",y:"YC"},{i:18,n:"盐城",y:"YC"},{i:26,n:"伊春",y:"YC"},{i:22,n:"宜春",y:"YC"},{i:16,n:"运城",y:"YC"},{i:8,n:"云浮",y:"YF"},{i:8,n:"阳江",y:"YJ"},{i:24,n:"营口",y:"YK"},{i:14,n:"伊犁",y:"YL"},{i:9,n:"玉林",y:"YL"},{i:10,n:"榆林",y:"YL"},{i:16,n:"阳泉",y:"YQ"},{i:12,n:"玉树",y:"YS"},{i:22,n:"鹰潭",y:"YT"},{i:23,n:"烟台",y:"YT"},{i:3,n:"玉溪",y:"YX"},{i:7,n:"益阳",y:"YY"},{i:7,n:"岳阳",y:"YY"},{i:18,n:"扬州",y:"YZ"},{i:7,n:"永州",y:"YZ"},{i:23,n:"淄博",y:"ZB"},{i:25,n:"长春",y:"ZC"},{i:1,n:"自贡",y:"ZG"},{i:8,n:"珠海",y:"ZH"},{i:7,n:"张家界",y:"ZJJ"},{i:15,n:"张家口",y:"ZJK"},{i:18,n:"镇江",y:"ZJ"},{i:8,n:"湛江",y:"ZJ"},{i:5,n:"周口",y:"ZK"},{i:5,n:"驻马店",y:"ZMD"},{i:8,n:"肇庆",y:"ZQ"},{i:8,n:"中山",y:"ZS"},{i:7,n:"长沙",y:"ZS"},{i:19,n:"舟山",y:"ZS"},{i:3,n:"昭通",y:"ZT"},{i:13,n:"中卫",y:"ZW"},{i:1,n:"资阳",y:"ZY"},{i:2,n:"遵义",y:"ZY"},{i:11,n:"张掖",y:"ZY"},{i:7,n:"株洲",y:"ZZ"},{i:21,n:"漳州",y:"ZZ"},{i:16,n:"长治",y:"ZZ"},{i:23,n:"枣庄",y:"ZZ"},{i:5,n:"郑州",y:"ZZ"},{i:0,c:1,n:"北京",y:"BJ"},{i:0,c:1,n:"上海",y:"SH"},{i:0,c:1,n:"天津",y:"TJ"},{i:0,c:1,n:"重庆",y:"ZQ"},{i:8,c:1,n:"广州",y:"GZ"},{i:8,c:1,n:"深圳",y:"SZ"},{i:19,c:1,n:"杭州",y:"HZ"},{i:18,c:1,n:"南京",y:"NJ"},{i:6,c:1,n:"武汉",y:"WH"},{i:1,c:1,n:"成都",y:"CD"},{i:24,c:1,n:"沈阳",y:"SY"},{i:10,c:1,n:"西安",y:"XA"}]};
	return function($ele){
		var selector = {
			ele:$ele
			, city:{
				HOT:[]
			}
			, addCity:function(obj){
				var b = obj.y.split("")[0];
				if(!this.city[b]){
					this.city[b] = [];
				};
				this.city[b].push(obj);
				if(obj.c){
					this.city.HOT.push(obj);
				}
			}
			, val:function(){
				var t = this.title.text();
				if(t == "选择城市"){
					return "";
				};
				return t;
			}
			, init:function(){
				var _this = this
					, isExtend = false
					, html = [];
				for(var k=0,len=CITYS.city.length;k<len;k++){
					this.addCity(CITYS.city[k]);
				};
				html.push('<div class="store-title inbox">');
				html.push('<span class="store-text">选择城市</span><em class="inbox"></em></div>');
				html.push('<div class="store-drop"><div class="store-inner">');
				html.push('<div class="store-item"><b>A</b><b>B</b><b>C</b><b>D</b><b>E</b><b>F</b><b>G</b><b>H</b><b>J</b><b>K</b><b>L</b><b>M</b><b>N</b><b>P</b><b>Q</b><b>R</b><b>S</b><b>T</b><b>W</b><b>X</b><b>Y</b><b>Z</b></div>');
				for(i in this.city){
					html.push('<div class="store-value '+ i +'">');
					for(var j=0,len=this.city[i].length;j<len;j++){
						html.push('<a href="javascript:void(0);" data-province="'+ CITYS.province[this.city[i][j].i] +'">'+ this.city[i][j].n +'</a>');
					}
					html.push('</div>');
				}
				html.push('</div></div></div>');
				//console.log(html.join(""));
				_this.ele.html(html.join(""));
				_this.title = $(".store-text", _this.ele);
				var $a = $("a", _this.ele)
					,$b = $("b", _this.ele)
					,$panel = $(".store-value", _this.ele)
					,$title = $(".store-title", _this.ele)
					,$drop = $(".store-drop", _this.ele)
					,curItem = $b.eq(0)
					,curPanel = $panel.eq(1)
					,curCity;
				$a.click(function(e){
					var $this = $(this);
					if(curCity){ curCity.removeClass("hover");};
					_this.title.html($this.attr("data-province") + $this.text());
					curCity = $this;
					$this.addClass("hover");
					$drop.css("display","none");
					isExtend = false;
					e.stopPropagation();
				})
				$b.each(function(){
					var $this = $(this)
						, index = $this.index() + 1;
					$this.click(function(){
						curPanel.css("display","none");
						curItem.removeClass("cur");
						curItem = $this;
						curPanel = $panel.eq(index);
						curPanel.css("display","block");
						curItem.addClass("cur");
					});
				});
				curItem.addClass("cur");
				curPanel.css("display","block");
				$title.click(function(e){
					$drop.css("display",!isExtend?"block":"none");
					isExtend = !isExtend;
					e.stopPropagation();
				});
				$drop.click(function(e){
					e.stopPropagation();
				});
				$(document).click(function(){
					if(isExtend){$drop.css("display","none");isExtend = false;};
				});
			}
		};
		selector.init();
		return selector;
	};
});
