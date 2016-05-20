Fengs.add('chongzhi/utils/base', function(S, $, g){
	var u = {
		htmlver:"20150817",//PHONE版HTML内容版本号
		htmlpcver:"20150817",//PC版HTML内容版本号
		//是否已请求服务器时间
		b:false,
		//服务器地址
		url:g(75),
		//安全码数组
		a:{
			x:["1","2","3","4","5","6","7","8"],
			y:["A","B","C","D","E","F","G","H","I","J"]
		},
		//程序显示方向　0竖向显示　1横向显示
		r:0,
		//生成时间戳
		send:function(o,t){
			var now = parseInt(new Date().getTime() / 1000),
				self = arguments.callee;
			if(!u.b){
				u.b = $.storage.getCookie("SUDUDA_COM_TIMESTAMP");
				if(u.b == null){
					u.b = 0;
				};
				return $.get(o,now - u.b,t);
			}else{
				return $.get(o,now - u.b,t);
			};
		},
		//signpass提交方式
		p:function(options){
			if(this.n()){
				return this.send(options,1);
			};
		},
		//sign提交方式
		s:function(options){
			return this.send(options,0);
		},
		j:function(){
			var pass = $.storage.getCookie("SUDUDA_COM_PASS"),//判断用户密码
				logined = decodeURIComponent($.storage.getCookie("SUDUDA_COM_LOGINED")),//判断用户登录信息
				un = $.storage.getCookie("SUDUDA_COM_UN");//判断推广
			if(logined != "" && logined != "null" && logined != null && pass != "" && pass != null && un != "" && un != null && logined != "undefined" && pass != "undefined" && un != "undefined"){
				if(logined.indexOf("last_city") > -1){
					$.storage.setCookie("SUDUDA_COM_LOGINED","");
					return false;
				};
				return true;
			}else{
				return false;
			};
		},
		k:null,
		//signpayment提交方式
		m:function(options){
			if(this.n()){
				return this.send(options,2);
			};
		},
		n:function(){
			var pass = u.j();
			if((pass && pass != "") || u.k){
				return true;
			}else{
				$.storage.setCookie("SUDUDA_COM_LOGINED","");
				openWarn("no",g(41));
				$.storage.setCookie("SUDUDA_COM_LOGINSOURCE",window.location.href);
				setTimeout(function(){
					window.location = g(73);
				},800);
				return false;
				
			};
		},
		//手机归属地映射表
		c:function(){
			return {
				key:["0","11","12","13","14","15","15","21","22","23","31","32","33","34","35","36","37","41","42","43","44","45","46","50","51","52","53","54","61","62","63","64","65","71","81","82"],
				value:["全国","北京","天津","河北","山西","内蒙古","内蒙","辽宁","吉林","黑龙江","上海","江苏","浙江","安徽","福建","江西","山东","河南","湖北","湖南","广东","广西","海南","重庆","四川","贵州","云南","西藏","陕西","甘肃","青海","宁夏","新疆","台湾","香港","澳门"],
				parse:function(val){
					return this.key[$.array.findInArray(this.value,val)];
				}
			};
		},
		//固话区号映射表
		d:function(){
			return {"010":"北京","022":"天津","021":"上海","023":"重庆","0311":"河北 石家庄","0312":"河北 保定","0313":"河北 张家口","0314":"河北 承德","0315":"河北 唐山","0316":"河北 廊坊","0317":"河北 沧州","0318":"河北 衡水","0319":"河北 邢台","0310":"河北 邯郸","0335":"河北 秦皇岛","0349":"山西 朔州","0351":"山西 太原","0352":"山西 大同","0353":"山西 阳泉","0354":"山西 晋中","0355":"山西 长治","0356":"山西 晋城","0357":"山西 临汾","0358":"山西 吕梁","0359":"山西 运城","0350":"山西 忻州","0471":"内蒙古 呼和浩特","0472":"内蒙古 包头","0473":"内蒙古 乌海","0474":"内蒙古 乌兰察布","0475":"内蒙古 通辽","0476":"内蒙古 赤峰","0477":"内蒙古 鄂尔多斯","0478":"内蒙古 巴彦淖尔","0479":"内蒙古 锡林郭勒盟","0470":"内蒙古 呼伦贝尔","0482":"内蒙古 兴安盟","0483":"内蒙古 阿拉善盟","024":"辽宁 沈阳","0411":"辽宁 大连","0412":"辽宁 鞍山","0413":"辽宁 抚顺","0414":"辽宁 本溪","0415":"辽宁 丹东","0416":"辽宁 锦州","0417":"辽宁 营口","0418":"辽宁 阜新","0419":"辽宁 辽阳","0410":"辽宁 铁岭","0421":"辽宁 朝阳","0427":"辽宁 盘锦","0429":"辽宁 葫芦岛","0431":"吉林 长春","0432":"吉林 吉林","0433":"吉林 延边","0434":"吉林 四平","0435":"吉林 通化","0436":"吉林 白城","0437":"吉林 辽源","0438":"吉林 松原","0439":"吉林 白山","0440":"吉林 珲春","0448":"吉林 通化/梅河口","0571":"浙江 杭州","0572":"浙江 湖州","0573":"浙江 嘉兴","0574":"浙江 宁波","0575":"浙江 绍兴","0576":"浙江 台州","0577":"浙江 温州","0578":"浙江 丽水","0579":"浙江 金华","0570":"浙江 衢州","0580":"浙江 舟山","0451":"黑龙江 哈尔滨","0452":"黑龙江 齐齐哈尔","0453":"黑龙江 牡丹江","0454":"黑龙江 佳木斯","0455":"黑龙江 绥化","0456":"黑龙江 黑河","0457":"黑龙江 大兴安岭","0458":"黑龙江 伊春","0459":"黑龙江 大庆","0464":"黑龙江 七台河","0467":"黑龙江 鸡西","0468":"黑龙江 鹤岗","0469":"黑龙江 双鸭山","025":"江苏 南京","0511":"江苏 镇江","0512":"江苏 苏州","0513":"江苏 南通","0514":"江苏 扬州","0515":"江苏 盐城","0516":"江苏 徐州","0517":"江苏 淮安","0518":"江苏 连云港","0519":"江苏 常州","0510":"江苏 无锡","0523":"江苏 泰州","0527":"江苏 宿迁","0551":"安徽 合肥","0552":"安徽 蚌埠","0553":"安徽 芜湖","0554":"安徽 淮南","0555":"安徽 马鞍山","0556":"安徽 安庆","0557":"安徽 宿州","0558":"安徽 阜阳/亳州","0559":"安徽 黄山","0550":"安徽 滁州","0561":"安徽 淮北","0562":"安徽 铜陵","0563":"安徽 宣城","0564":"安徽 六安","0565":"安徽 巢湖","0566":"安徽 池州","0591":"福建 福州","0592":"福建 厦门","0593":"福建 宁德","0594":"福建 莆田","0595":"福建 泉州","0596":"福建 漳州","0597":"福建 龙岩","0598":"福建 三明","0599":"福建 南平","0791":"江西 南昌","0792":"江西 九江","0793":"江西 上饶","0794":"江西 抚州","0795":"江西 宜春","0796":"江西 吉安","0797":"江西 赣州","0798":"江西 景德镇","0799":"江西 萍乡","0790":"江西 新余","0701":"江西 鹰潭","0531":"山东 济南","0532":"山东 青岛","0533":"山东 淄博","0534":"山东 德州","0535":"山东 烟台","0536":"山东 潍坊","0537":"山东 济宁","0538":"山东 泰安","0539":"山东 临沂","0530":"山东 菏泽","0543":"山东 滨州","0546":"山东 东营","0631":"山东 威海","0632":"山东 枣庄","0633":"山东 日照","0634":"山东 莱芜","0635":"山东 聊城","0371":"河南 郑州","0372":"河南 安阳","0373":"河南 新乡","0374":"河南 许昌","0375":"河南 平顶山","0376":"河南 信阳","0377":"河南 南阳","0378":"河南 开封","0379":"河南 洛阳","0370":"河南 商丘","0391":"河南 焦作/济源","0392":"河南 鹤壁","0393":"河南 濮阳","0394":"河南 周口","0395":"河南 漯河","0396":"河南 驻马店","0398":"河南 三门峡","027":"湖北 武汉","0711":"湖北 鄂州","0712":"湖北 孝感","0713":"湖北 黄冈","0714":"湖北 黄石","0715":"湖北 咸宁","0716":"湖北 荆州","0717":"湖北 宜昌","0718":"湖北 恩施","0719":"湖北 十堰","0710":"湖北 襄樊","0722":"湖北 随州","0724":"湖北 荆门","0728":"湖北 江汉/仙桃/天门/潜江","0731":"湖南 长沙/株洲/湘潭","0732":"湖南 株洲","0733":"湖南 湘潭","0734":"湖南 衡阳","0735":"湖南 郴州","0736":"湖南 常德","0737":"湖南 益阳","0738":"湖南 娄底","0739":"湖南 邵阳","0730":"湖南 岳阳","0743":"湖南 湘西","0744":"湖南 张家界","0745":"湖南 怀化","0746":"湖南 永州","020":"广东 广州","0750":"广东 江门","0751":"广东 韶关","0752":"广东 惠州","0753":"广东 梅州","0754":"广东 汕头","0755":"广东 深圳","0756":"广东 珠海","0757":"广东 佛山","0758":"广东 肇庆","0759":"广东 湛江","0760":"广东 中山","0762":"广东 河源","0763":"广东 清远","0766":"广东 云浮","0768":"广东 潮州","0769":"广东 东莞","0660":"广东 汕尾","0662":"广东 阳江","0663":"广东 揭阳","0668":"广东 茂名","0771":"广西 南宁/崇左","0772":"广西 柳州/来宾","0773":"广西 桂林","0774":"广西 梧州/贺州","0775":"广西 贵港/玉林","0776":"广西 百色","0777":"广西 钦州","0778":"广西 河池","0779":"广西 北海","0770":"广西 防城港","028":"四川 成都","0812":"四川 攀枝花","0813":"四川 自贡","0816":"四川 绵阳","0817":"四川 南充","0818":"四川 达州","0825":"四川 遂宁","0826":"四川 广安","0827":"四川 巴中","0831":"四川 宜宾","0832":"四川 内江/资阳","0833":"四川 乐山/眉山","0834":"四川 凉山","0835":"四川 雅安","0836":"四川 甘孜州","0837":"四川 阿坝州","0838":"四川 德阳","0839":"四川 广元","0830":"四川 泸州","0898":"海南","0851":"贵州 贵阳","0852":"贵州 遵义","0853":"贵州 安顺","0854":"贵州 黔南布依族苗族自治州","0855":"贵州 黔东南苗族侗族自治州","0856":"贵州 铜仁地区","0857":"贵州 毕节地区","0858":"贵州 六盘水","0859":"贵州 黔西南布依族苗族自治州","0871":"云南 昆明","0872":"云南 大理白族自治州","0873":"云南 红河哈尼族彝族自治州","0874":"云南 曲靖","0875":"云南 保山","0876":"云南 文山壮族苗族自治州","0877":"云南 玉溪","0878":"云南 楚雄彝族自治州","0879":"云南 思茅","0870":"云南 昭通","0883":"云南 临沧","0886":"云南 怒江傈僳族自治州","0887":"云南 迪庆藏族自治州","0888":"云南 丽江","0691":"云南 西双版纳傣族自治州","0692":"云南 德宏傣族景颇族自治州","0891":"西藏 拉萨","0892":"西藏 日喀则地区","0893":"西藏 山南地区","0894":"西藏 林芝地区","0895":"西藏 昌都地区","0896":"西藏 那曲地区","0897":"西藏 阿里地区","029":"陕西 西安","0911":"陕西 延安","0912":"陕西 榆林","0913":"陕西 渭南","0914":"陕西 商洛","0915":"陕西 安康","0916":"陕西 汉中","0917":"陕西 宝鸡","0919":"陕西 铜川","0931":"甘肃 兰州","0932":"甘肃 定西","0933":"甘肃 平凉","0934":"甘肃 庆阳","0935":"甘肃 武威/金昌","0936":"甘肃 张掖","0937":"甘肃 酒泉/嘉峪关","0938":"甘肃 天水","0939":"甘肃 陇南","0930":"甘肃 临夏回族自治州","0941":"甘肃 甘南藏族自治州","0943":"甘肃 白银","0971":"青海 西宁","0972":"青海 海东地区","0973":"青海 黄南藏族自治州","0974":"青海 海南藏族自治州","0975":"青海 果洛藏族自治州","0976":"青海 玉树藏族自治州","0977":"青海 海西蒙","0979":"青海 海西蒙","0970":"青海 海北藏族自治州","0951":"宁夏 银川","0952":"宁夏 石嘴山","0953":"宁夏 吴忠","0954":"宁夏 固原","0955":"宁夏 中卫","0991":"新疆 乌鲁木齐","0992":"新疆 伊犁哈萨克自治州","0993":"新疆 石河子","0994":"新疆 昌吉回族自治州","0995":"新疆 吐鲁番地区","0996":"新疆 巴音郭楞蒙古自治州","0997":"新疆 阿克苏地区","0998":"新疆 喀什地区","0999":"新疆 伊犁哈萨克自治州","0990":"新疆 克拉玛依","0901":"新疆 塔城地区","0902":"新疆 哈密地区","0903":"新疆 和田地区","0906":"新疆 阿勒泰地区","0908":"新疆 克孜勒苏柯尔克孜自治州","0909":"新疆 博尔塔拉蒙古自治州"};
		},
		//记住用户名和密码
		f:{
			list:new Array(),
			init:function(){
				try{
					var l = $.storage.getCookie("SUDUDA_COM_USERNAME");
					//alert(l);
					this.list = l.split("|");
				}catch(e){};
			},
			addnew:function(n,r,p){
				for(var i = 0; i < this.list.length; i++){
					if(this.list[i].split(",")[0] == n){
						this.list.splice(i,1);
						this.list.unshift(n+","+r+","+p);
						$.storage.setCookie("SUDUDA_COM_USERNAME",this.list.join("|"),60);
						return;
					};
				};
				this.list.unshift(n+","+r+","+p);
				$.storage.setCookie("SUDUDA_COM_USERNAME",this.list.join("|"),60);
			},
			get:function(n,hand){
				for(var i = 0; i < this.list.length; i++){
					if(this.list[i].split(",")[0] == n){
						switch(hand){
							case 0:
								this.list.splice(i,1);
								$.storage.setCookie("SUDUDA_COM_USERNAME",this.list.join("|"),60);
								break;
							default:
								return this.list[i].split(",");
								break;
						};
					};
				};
			}
		},
		//用户登录
		g:function(){
			try{
				return $.json($.storage.getCookie("SUDUDA_COM_LOGINED"));
			}catch(e){
				return false;
			};
		},
		h:function(){
			var username = p.login.find("[name=username]")[0],
				password = p.login.find("[name=password]")[0],
				remember = p.login.find("[name=remember]")[0],
				firstvalue = null,
				length;
			p.username.init();
			length = p.username.list.length;
			username.options.length = 0;
			for(var i=0;i < length;i++){
				var obj = p.username.list[i].split(",");
				username.options[i] = new Option(obj[0],obj[0]);
				if(i == 0){ firstvalue = obj[0];};
			};
			if(length > 0){
				username.disabled = false;
			};
			username.loadUI();
			var change = function(value){
				if(value == null){return;};
				var obj = p.username.get(value);
				if(obj[1] == "1"){
					remember.checked = true;
					password.value = "remember";
					password.attr("pass",obj[2]);
				}else{
					remember.checked = false;
					password.value = "";
					password.attr("pass","");
					
				}; 
			};
			password.onkeydown = function(){
				this.attr("pass","0");
			};
			//改变选中值
			username.onchange = function(){
				change(this.value);
			};
			username.keyup = function(e){
				remember.checked = false;
				password.value = "";
				password.attr("pass","");
			};
			//删除下拉项
			username.deleteItem = function(v){
				p.username.get(v,0);
			};
			change(firstvalue);
		},
		//加载等待
		l:function(){
			var element = $.createElement("div"),text;
			element.className = "loading";
			element.innerHTML = "<img src='/images/indicator_big.gif'/><span>"+g(67)+"</span>";
			document.body.appendChild(element);
			element.stop = false;
			element.timeout = null;
			element.s = function(txt){
				this.stop = false;
				clearTimeout(this.timeout);
				this.timeout = setTimeout(function(){
					if(!element.stop){
						element.css({display:"block"});
					};
				},400);
				
			};
			element.h = function(){
				element.stop = true;
				element.css({display:"none"});
			};
			return element;
		},
		//获取手机验证码
		timeout:0,
		channel:0,
		v:function(btn,type){
			var _this = this,
				timer = null,
				url = null,
				data = null;
			if(btn){
				_this.btn = btn;
			}
			var	jishi = function(){
				if(u.timeout == 0){
					_this.btn.value = g(33);
					return;
				};
				_this.btn.value = u.timeout + g(34);
				u.timeout--;
				clearTimeout(timer);
				timer = setTimeout(function(){
					jishi();
				},1000);
			};
			//u.timeout = 0,
			//u.channel = 0,//发送渠道
			_this.sbt = function(instr,pass){
				if(u.timeout > 0){
					return;
				}else{
					_this.btn.value = g(115);
					u.timeout = 1;
				};
				var orderid = $.getid() + "v" + (p.logined.sududa ? p.logined.sududa.o : "0000"),
					success = function(d){
						d = $.json(d).sududa;
						if(d.status == "1"){
							u.timeout = 59;
							jishi();
						}else{
							openWarn("no",d.tips);
							u.timeout = 0;
							_this.btn.value = g(33);
						};
					},
					error = function(){
						openWarn("no",g(0));
						u.timeout = 0;
						_this.btn.value = g(33);
					};
				if(type){
					u.m({
						url:"exe/msg_code_send_first",
						data:{phone:instr,orderid:orderid,channel:u.channel % 2 + 1},
						p:pass,
						success:success,
						error:error
					});
				}else{
					u.s({
						url:"exe/msg_code_send",
						data:{username:instr,orderid:orderid,channel:u.channel % 2 + 1},
						success:success,
						error:error
					});
				};
				u.channel++;
			};
			jishi();
			return _this;
		},
		//生成随机GUID
		i:function(){
			var guid = "";
			for (var i = 1; i <= 32; i++){
			  var n = Math.floor(Math.random()*16.0).toString(16);
			  guid +=   n;
			  //if((i==8)||(i==12)||(i==16)||(i==20))
				//guid += "-";
			}
			return guid; 
		},
		//更新产品价格表
		o:function(tbig,callback){
			//如果未请求到用户登录信息则返回
			var _self = arguments.callee,
				_obj = new Object();
			if(tbig != "11" && tbig != "12"){
				var _version = tbig != "11" && p.logined ? p.logined.sududa.y : "";
				if(_version == null){
					setTimeout(function(){
						_self(tbig,callback);
					},150);
					return;
				};
			};
			//获取价格表
			var get = function(local){
				u.s({
					url:"api/product",
					data:{power:"13,15,16,17",type:tbig},
					success:function(d){
						var obj = $.json(d),
							apiurl = tbig == "1" ||  tbig == "4" ? "api/product_channel" : "api/product_area";
						_obj.price = new proList(obj.sududa.list);
						u.s({
							url:apiurl,
							data:{power:"13,15,16,17"},
							success:function(f){
								var obj = $.json(f);
								_obj.channel = new channelList(obj.sududa.list);
								if(local){
									switch(tbig){
										case "1":
											localStorage.setItem(_a[1],f);
											localStorage.setItem(_a[3],d);
											break;
										case "2":
											localStorage.setItem(_a[2],f);
											localStorage.setItem(_a[4],d);
											break;
										case "3":
											localStorage.setItem(_a[2],f);
											localStorage.setItem(_a[5],d);
											break;
										case "4":
											localStorage.setItem(_a[1],f);
											localStorage.setItem(_a[7],d);
											break;
									};
								};
								callback(_obj);
							}
						});
					}
				});
			};
			if(!window.localStorage && tbig != "11" && tbig != "12"){
				get(false);
			}else{
				var _a = ["PRODUCT_PRICE_VER","PRODUCT_CHANNEL","PRODUCT_AREA","PRODUCT_PHONE_PRICE","PRODUCT_QQ_PRICE","PRODUCT_GAME_PRICE","APPLICATION_HTML","PRODUCT_FLOW"],
					getStorage = function(product,channel){
						var obj = $.json(localStorage.getItem(product));
						if(obj.sududa.ver != _version){
							get(true);
							return;
						};
						_obj.price = new proList(obj.sududa.list);
						obj = $.json(localStorage.getItem(channel));
						_obj.channel = new channelList(obj.sududa.list);
						callback(_obj);
					};
				switch(tbig){
					//更新电话价格表
					case "1":
						if(localStorage.getItem(_a[3]) == null || localStorage.getItem(_a[1]) == null){
							get(true);
						}else{
							getStorage(_a[3],_a[1]);
						};
						break;
					//更新QQ价格表
					case "2":
						if(localStorage.getItem(_a[4]) == null || localStorage.getItem(_a[2]) == null){
							get(true);
						}else{
							getStorage(_a[4],_a[2]);
						};
						break;
					//更新游戏价格表
					case "3":
						if(localStorage.getItem(_a[5]) == null || localStorage.getItem(_a[2]) == null){
							get(true);
						}else{
							getStorage(_a[5],_a[2]);
						};
						break;
					//更新流量价格表
					case "4":
						if(localStorage.getItem(_a[7]) == null || localStorage.getItem(_a[1]) == null){
							get(true);
						}else{
							getStorage(_a[7],_a[1]);
						};
						break;
					//phone版更新HTML页面
					case "11":
						var getHtml = function(){
							n.l.s();
							$.ajax({
								url:"../json/html.phone.json",
								success:function(d){
									localStorage.setItem(_a[6],d)
									var obj = $.json(d);
									n.l.h();
									callback(obj.text);
								}
							});
						};
						if(localStorage.getItem(_a[6]) == null){
							getHtml();
						}else{
							try{
								var obj = $.json(localStorage.getItem(_a[6]));
								if(obj.ver != u.htmlver){
									getHtml();
								}else{
									callback(obj.text);
								};
							}catch(e){
								getHtml();
							};
						};
						break;
					//PC版更新HTML页面
					case "12":
						//从服务器获取JSON
						var getJson = function(cback){
								n.l.s();
								$.ajax({
									url:"../json/html.pc.json",
									success:function(d){
										n.l.h();
										cback(d);
									}
								});
							};
						//断定浏览器是否支持本地存储，如果不支持则实时请求并存储到一个全局变量中
						if(!window.localStorage){
							if(!window.pcHtmlJson){
								getJson(function(d){
									window.pcHtmlJson = $.json(d);
									callback(window.pcHtmlJson.text);
								});
							}else{
								callback(window.pcHtmlJson.text);
							};
						}else{
							//获取本地存储的数据
							var _a = "APPLICATION_HTML_PC",
								getData = function(){
									getJson(function(d){
										localStorage.setItem(_a,d);
										var obj = $.json(d);
										callback(obj.text);
									});
								};
							//本地无数据则从服务器获取
							if(localStorage.getItem(_a) == null){
								getData();
							//本地数据较老从服务器获取最新数据
							}else{
								try{
									var obj = $.json(localStorage.getItem(_a));
									if(obj.ver != u.htmlpcver){
										getData();
									}else{
										callback(obj.text);
									};
								}catch(e){
									getData();
								}
							};
						};
						break;
				};
			};
		},
		//返回用户价格版本
		w:function(){
			var i = p.logined.sududa.p,
				pArr = ["13","15","16","17"];
			if($.array.findInArray(pArr,i) >=0){
				return "p"+i;
			}else{
				return i < "16" ? "p13" : "p16";
			}
		},
		//程序参数
		r:{
			t:17,//当前发行的最高版本号16：豪华版，17：旗舰版
			//用户版本及价格
			p:function(){
				var sududa = p.logined.sududa;
				return [
					{id:13,type:g(36),price:sududa.p13.split("|"),show:true},//普及版
					{id:15,type:g(37),price:sududa.p15.split("|"),show:true},//专业版
					{id:16,type:g(38),price:sududa.p16.split("|"),show:true},//豪华版
					{id:17,type:g(180),price:sududa.p17.split("|"),show:(sududa.sc == "1" ? true :false)}//旗舰版
				];
			},
			d:0.7,//旗舰版用户折扣
			api:"/inc/sududa.api.doc",//API文档下载地址
			url:function(){
				var href = window.location.href,
					href = href.substring(href.indexOf("#") + 1,href.length);
				var _arr = href.split("&");
				href = new Object();
				for(var i = 0; i < _arr.length; i++){
					var _a = _arr[i].split("=");
					href[_a[0]] = _a[1];
				};
				return href;
			}//当前URL参数对象
		},
		//客户
		kefu:["小堂","小卿","小红","小达","小河","小思","小西","小荣","小辉","小鹏","小杰","小新","小丹","小明","小伟","小玲","小莹","小君","小风","小鱼","小云","小雨","小南","小东","小亮","小华","小斌","小天"],
		//
		t:function(instr){
			switch(instr){
				case "price":
					return "单价";
				case "count":
					return "数量";
				case "pro":
					return "业务名称";
				case "money":
					return "金额";
				case "to":
					return "对方账号";
				case "amount":
					return "转账金额";
				case "remark":
					return "备注";
				case "drawtype":
					return "账号类型";
				case "drawtime":
					return "提现方式";
				case "username":
					return "操作用户";
				case "payid":
					return "加款订单号";
				case "power":
					return "版本";
				case "activekey":
					return "激活码";
				case "activeuser":
					return "激活账号";
				case "activepower":
					return "激活版本";
				case "datetime":
					return "创建时间";
				case "tradeamount":
					return "交易账号";
				case "channel":
					return "渠道";
				case "seller":
					return "卖家";
				case "buyer":
					return "买家";
				default:
					return "";
			}
		},
		tao:function(){},
		enter:function(){
			
		}
	};
	window.on({
		"keydown":function(e){
			var currKey = 0,
				e = e||event,
				currKey = e.keyCode||e.which||e.charCode;
			if(currKey == "13"){
				u.enter();
			};
		}
	});
	return u;
},['./lang']);