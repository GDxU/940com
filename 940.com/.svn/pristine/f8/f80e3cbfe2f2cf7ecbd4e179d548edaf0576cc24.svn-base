Fengs.add('kehuda/mobile/xinyong', function(S, $, ui, req, Template){
	var cacheData = {"kehuda":{"data":{"_i":"101|21|9|163","a":"客户达","b":1,"c":"UMGQyvCNbvmx4","d":"2011年08月06日","e":"广东 深圳","f":"","nick":"%BF%CD%BB%A7%B4%EF","g":"支付宝企业认证","h":"99.52%","i":0,"j":57734,"k":"https://kehuda.taobao.com/shop/view_shop.htm?user_id=d6029cb0f712d3e69b99f552ed0b6b25","l":"2014-05-22","n":" 游戏/话费","o":"5,000.00","p":0,"q":0,"r":0,"s":8,"t":0,"u":0,"v":90,"w":3,"x":3,"y":57800,"z":119,"aa":153,"ab":103,"ac":0,"ad":0,"ae":"","j1":-1,"af":15556,"ag":"0 [1]"},"tips":"获取成功！","status":"1"}};
	var UnicodeToUTF8 = function(strInUni){
		if(null==strInUni){
			returnnull;
		}
		var strUni=String(strInUni);
		var strUTF8=String();
		for(var i=0;i<strUni.length;i++){
			var wchr=strUni.charCodeAt(i);
			if(wchr<0x80){
				strUTF8+=strUni.charAt(i);
			}else if(wchr<0x800){
				var chr1=wchr&0xff;
				var chr2=(wchr>>8)&0xff;
				strUTF8+=String.fromCharCode(0xC0|(chr2<<2)|((chr1>>6)&0x3));
				strUTF8+=String.fromCharCode(0x80|(chr1&0x3F));
			}else{
				var chr1=wchr&0xff;
				var chr2=(wchr>>8)&0xff;
				strUTF8+=String.fromCharCode(0xE0|(chr2>>4));
				strUTF8+=String.fromCharCode(0x80|((chr2<<2)&0x3C)|((chr1>>6)&0x3));
				strUTF8+=String.fromCharCode(0x80|(chr1&0x3F));
			}
		}
		return strUTF8;
	};
	var convertDate = function(inDate){
		if(typeof inDate !== 'string'){
			return '';
		}
		return inDate.replace(/[\u4E00-\u9FA5]/g, function(a){
			return a =='年' || a == '月' ? '-' : '';
		})
	}
	var record = new ui.record({prefix:"kehuda_taoxy_",key:["wang"]})
		//信用等级
		,userRank = function(n){
			if(!n || n < 4 || n === 0){
				return false;
			}else if(n >= 4 && n < 11){
				return "red_1";
			}else if(n >= 11 && n < 41){
				return "red_2";
			}else if(n >= 41 && n < 91){
				return "red_3";
			}else if(n >= 91 && n < 151){
				return "red_4";
			}else if(n >= 151 && n < 251){
				return "red_5";
			}else if(n >= 251 && n < 501){
				return "blue_1";
			}else if(n >= 501 && n < 1001){
				return "blue_2";
			}else if(n >= 1001 && n < 2001){
				return "blue_3";
			}else if(n >= 2001 && n < 5001){
				return "blue_4";
			}else if(n >= 5001 && n < 10001){
				return "blue_5";
			}else if(n >= 10001 && n < 20001){
				return "cap_1";
			}else if(n >= 20001 && n < 50001){
				return "cap_2";
			}else if(n >= 50001 && n < 100001){
				return "cap_3";
			}else if(n >= 100001 && n < 200001){
				return "cap_4";
			}else if(n >= 200001 && n < 500001){
				return "cap_5";
			}else if(n >= 500001 && n < 1000001){
				return "crown_1";
			}else if(n >= 1000001 && n < 2000001){
				return "crown_2";
			}else if(n >= 2000001 && n < 5000001){
				return "crown_3";
			}else if(n >= 5000001 && n < 10000001){
				return "crown_4";
			}else if(n >= 10000001){
				return "crown_5";
			};
		};
	$(document).ready(function(){
		//alert(String("终恨水天"));
		var $wrap = $("section")
			, $search_btn = $(".but-search",$wrap)
			, $drop = ui.drop($(".drop",$wrap),record)[0]
			, timer = 0
			, $bd_result = $(".khd-result",$wrap)
			, $imgLink = $('.imgLink', $wrap)
			//提交查询
			, submitSearch = function(){
				var search_key = $drop.value.trim();
				if(search_key == "" || search_key == $drop.input.attr("placeholder")){
					return false;
					//return $bd_result.msg('请输入旺旺名称');
				};
				if(timer > 0){
					return;
				};
				//添加旺旺名查询记录
				record["wang"].add(search_key);
				timer = 1;
				setTimeout(function(){
					timer = 0;
				},2000);
				window.location="#username="+ encodeURIComponent(search_key);
				doSearch(search_key);
				//统计代码
				ui.refreshStatistics("tongjiqi");
			}
			, reqSuccess = function(d, keyword){
				$bd_result.removeClass('k-loding');
				var html = []
					, sellrank
					, buyrank
					, usernick
					, isseller = false
					, istmall = false;
				d = d.kehuda;
				if(d.status == -9){
					return $bd_result.msg(d.tips);
				}else if(d.status == 1){
					d = d.data;
					if(d.b === 0){
						if(decodeURIComponent(d.m).indexOf('盘点') > 0){
							return $bd_result.msg('用户不存在');
						}else if(d.m.indexOf('exception:') > 0){
							timer = 0;
							return $bd_result.msg('查询失败，请重试！');
						}
						return $bd_result.msg(!d.m ? '查询失败' : decodeURIComponent(d.m));
					};
					//判断是新老版本
					if(!d.a && !d.b){
						d.a = d.username;		//用户名
						d.b = d.result;
						d.c = d.userid;
						d.d = d.SignupTime;
						d.e = d.location;
						d.f = d.LatesetLoginTime;
						d.g = d.authentication;
						d.h = d.GoodRateRatio;
						d.i = d.BuyerReputation;
						d.j = d.SellerReputation;
						d.k = d.ShopUrl;
						d.l = d.ShopTime;
						d.m = d.errmsg;
						d.n = d.catname;
						d.o = d.CautionMoney;
						d.p = d.WeekGoodRate;
						d.q = d.WeekNormalRate;
						d.r = d.WeekBadRate;
						d.s = d.MonthGoodRate;
						d.t = d.MonthNormalRate;
						d.u = d.MonthBadRate;
						d.v = d.HalfYearGoodRate;
						d.w = d.HalfYearNormalRate;
						d.x = d.HalfYearBadRate;
						d.y = d.HalfYearAgoGoodRate;
						d.z = d.HalfYearAgoNormalRate;
						d.aa = d.HalfYearAgoBadRate;
						d.ab = d.GoodRateGiven;
						d.ac = d.NormalRateGiven;
						d.ad = d.BadRateGiven;
					};
					d.isseller = false
					d.istmall = false;
					d.usernick = encodeURIComponent(d.a);
					d.sellrank = userRank(d.j);
					d.buyrank = userRank(d.i);
					if(typeof d.k === "string" && d.k !== ""){
						if(d.k.indexOf("tmall.com")>=0){
							d.istmall = true;
						}
						d.isseller = true;
					};
					//旺旺活跃度
					try{
						d.hot = '';
						if(!!d.ag){
							d.ag = d.ag.replace(/[\[\]]/g,'').split(' ');
							var _point = d.ag[0]
								, _class = parseInt(d.ag[1])
								, _sun = Math.floor(_class / 16)
								, _month = Math.floor((_class % 16) / 4)
								, _start = _class % 4
								, _i = 0;
							while(_i < _sun){
								d.hot += '<img width="12" src="http://webjs.ww.taobao.com/webim/person/images/1.gif"/>';
								_i++;
							}
							_i = 0;
							while(_i < _month){
								d.hot += '<img width="12" src="http://webjs.ww.taobao.com/webim/person/images/2.gif"/>';
								_i++;
							}
							_i = 0;
							while(_i < _start){
								d.hot += '<img width="12" src="http://webjs.ww.taobao.com/webim/person/images/3.gif"/>';
								_i++;
							}
						};
					}catch(e){
						d.hot = '--';
					};

					Template.helper('formatDate', convertDate);
					Template.helper('parseInt', parseInt);
					d.af = !d.af ? '--' : (Math.ceil(d.af / (parseInt(d.v) + parseInt(d.y)) * 1000) / 10) +'%';
					$bd_result.html(Template('xytemp', d));
				}else{
					$bd_result.msg(d.tips);
				}
			}
			, doSearch = function(keyword){
				$imgLink.hide();//光碟隐藏
				$bd_result.addClass('k-loding');
				$drop.val(keyword);
				document.title = keyword +" - 淘宝信用";
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$bd_result.html('<div class="waiting"><div class="wait"></div></div>');
				keyword = ui.filterSpecChr(keyword);
				if(keyword === '客户达'){
					return reqSuccess(cacheData, keyword);
				};
				console.log(keyword)
				req.s({
					//host:'//www.kehuda.com:1024/',
					url:"/web/taobao_credit",
					type: 'jsonp',
					data:{'username':keyword},
					success: function(d){

						reqSuccess(d, keyword);
					},
					error:function(e){
						$bd_result.msg('查询超时');
					}
				});
			};
		//根据参数执行查询
		var uri = new S.parseUri(window.location.href,"#");
		if(uri.username){
			uri.username = decodeURIComponent(uri.username);
			doSearch(uri.username);
		};
		$bd_result.msg = function(text){
			$bd_result.removeClass('k-loding').html('<ul class="k-result-ul"><li class="msg">'+ text +'!</li></ul>');
		};
		//绑定回车事件
		ui.bindEnter([$drop.input],submitSearch);
		$search_btn.on({'click': submitSearch});
	});
	ui.init();
},["./common","common/require","plus/art-template"]);
