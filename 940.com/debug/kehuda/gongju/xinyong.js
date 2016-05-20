Fengs.add('kehuda/gongju/xinyong', function(S, $, ui, req){
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
		var $wrap = $(".search_wrap")
			, $search_btn = $("button",$wrap)
			, $drop = ui.drop($(".drop",$wrap),record)[0]
			, timer = 0
			, $bd_result = $(".tb_result",$wrap)
			, $bd_share = $(".bd_share",$wrap)
			, $lieliuSp = $('.lieliu-sp')
			, data360 = $('#ad-360 div').text()
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
				$bd_share.html('');
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
				var html = [],sellrank,buyrank,usernick,isseller = false,istmall = false;
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
						d.l = d.ShopTime;	//注册时间
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
						//d.ae 认证时间
						//d.af 卖家主营占比
						//d.ag 旺旺活跃度
						//d.ah 认证时间
						//d.ai 买家信用图片:"//gtd.alicdn.com/newrank/b_cap_2.gif"
						//d.aj 天猫等级
					};
					//分享和收藏
					ui.share({
						wrap:$bd_share
						,href:"http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="+ encodeURIComponent("http://www.kehuda.com/g/x/#username="+ encodeURIComponent(keyword))+"&title="+ encodeURIComponent(keyword +" - 淘宝信用") +"&desc=&summary=%e5%ae%a2%e6%88%b7%e8%be%be+-+%e7%94%b5%e5%95%86%e5%b7%a5%e5%85%b7"
					});
					//usernick = d.nick;
					//console.log(d.nick);
					sellrank = userRank(d.j);
					buyrank = userRank(d.i);
					if(typeof d.k === "string" && d.k !== ""){
						if(d.k.indexOf("tmall.com")>=0){
							istmall = true;
						}
						isseller = true;
					};
					html.push('<div class="infomation">');
					html.push('<dl><dt>');
					html.push('<img src="https://wsapi.jianghu.taobao.com/wangwang/headshow.htm?_input_charset=utf-8&longId=cntaobao'+ encodeURIComponent(d.a) +'"/>');
					html.push('</dt><dd><p>');
					//html.push('<dl><dt><img src="http://wwc.taobaocdn.com/avatar/getAvatar.do?userNick='+encodeURIComponent(d.a)+'&width=80&height=80&type=sns"/></dt><dd><p>');
					
					//旺旺
					//html.push('</p><p><a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&touid='+ encodeURIComponent(d.a) +'&siteid=cntaobao&status=1&charset=utf-8"><img border="0" src="http://amos.alicdn.com/online.aw?v=2&uid='+ encodeURIComponent(d.a) +'&site=cntaobao&s=1&charset=utf-8"/></a></p>');
					html.push('</p><p><a target="_blank" title="点我发消息" href="http://www.taobao.com/webww/ww.php?ver=3&touid='+ encodeURIComponent(d.a) +'&siteid=cntaobao&status=1&charset=utf-8"><img border="0" src="http://amos.alicdn.com/online.aw?v=2&uid='+ encodeURIComponent(d.a) +'&site=cntaobao&s=2&charset=utf-8"/>&nbsp;'+ d.a +'</a>');
					if(isseller){
						html.push('&nbsp;&nbsp;&nbsp;<a href="'+ d.k +'" target="_blank" title="进入店铺"><img src="http://img.alicdn.com/imgextra/i1/TB132TYJVXXXXaGXXXXtKXbFXXX.gif"/></a>');
					};
					html.push('</dd></dl>');
					html.push('<ol>')
					html.push('<li><label>注册时间：</label><span>\n'+ convertDate(d.d) +'</span></li>');

					if(isseller){
						html.push('<li><label>')
						if(d.l){
							html.push('创店时间：</label><span>\n'+ convertDate(d.l) +'</span></li>');
						}else{
							html.push('创店时间：</label><span>\n'+ (d.ae ? convertDate(d.ae) : '－') +'</span></li>');
						}
					};
					html.push('<li><label>实名认证：</label><span>'+ d.g.replace('实名','') +' &nbsp;');
					if(d.g.indexOf('实名认证') >= 0){
						html.push('<img src="/images/people.gif"/>');
					}else if(d.g.indexOf('企业认证') >= 0){
						html.push('<img src="https://assets.alicdn.com/app/marketing/xfile/national_emblem_light.png"/>');
					}else if(d.g.indexOf('淘宝认证商户') >= 0){
						html.push('<img src="/images/shanghu.png"/>');
					}
					html.push('</span></li>');
					html.push('<li class="address"><label>所在地区：</label>');
					if(typeof d.e === 'string' && d.e.trim() === ""){
						html.push('<span>--</span>');
					}else{
						html.push('<span title="'+ d.e +'">'+ d.e +'</span>');
					};
//							html.push('</li><li><label>最近登录：</label><span>');
//							if(d.f == ""){
//								html.push('－');
//							}else{
//								html.push(d.f);
//							}
					//html.push('<li><label>活&nbsp;&nbsp;跃&nbsp;&nbsp;度：</label><span><img src="images/taobao/s_cap_5.gif"/></span></li>');
					html.push('</span></li><li><label>卖家信用：</label><a href="https://service.taobao.com/support/seller/knowledge-847753.htm" target="_blank">');
					if(!!sellrank){
						html.push(d.j +'&nbsp;<img src="/images/rank/s_'+ sellrank +'.gif"/>');
					}else{
						html.push('0');
					}
					html.push('</a></li><li><label>买家信用：</label><a href="https://service.taobao.com/support/knowledge-847752.htm" target="_blank">');

					if(!!buyrank){
						html.push(d.i +'&nbsp;<img src="/images/rank/b_'+ buyrank +'.gif" />');
					}else if(!!d.ai){
						html.push('&nbsp;<img src="'+ d.ai+'"/>');
					}else{
						html.push(d.i>0?d.i:0);
					}
					html.push('</a>');
					if($.inArray(d.j1,[0,1,2,3,4,5,6])>=0){
						html.push('&nbsp;<img src="/images/rank/v_'+ d.j1 +'.png" title="V'+ d.j1 +'会员"/>');
					};
					if(d.aj>0){
						html.push('&nbsp;<img title=T'+d.aj+'天猫会员 src="/images/t/t'+d.aj+'.png?1112"/>');
					}
					html.push('</li>');
					//旺旺活跃度
					try{
						if(!!d.ag){
							d.ag = d.ag.replace(/[\[\]]/g,'').split(' ');
							var _point = d.ag[0]
								, _class = parseInt(d.ag[1])
								, _sun = Math.floor(_class / 16)
								, _month = Math.floor((_class % 16) / 4)
								, _start = _class % 4
								, _i = 0;
							html.push('<li><label>活&nbsp;&nbsp;跃&nbsp;&nbsp;度：</label><a title="活跃度点数:'+ _point +'" href="http://www.taobao.com/go/act/wangwang/huoyuedu4.php" target="_blank">');
							while(_i < _sun){
								html.push('<img src="http://webjs.ww.taobao.com/webim/person/images/1.gif"/>');
								_i++;
							}
							_i = 0;
							while(_i < _month){
								html.push('<img src="http://webjs.ww.taobao.com/webim/person/images/2.gif"/>');
								_i++;
							}
							_i = 0;
							while(_i < _start){
								html.push('<img src="http://webjs.ww.taobao.com/webim/person/images/3.gif"/>');
								_i++;
							}
							html.push('</a></li>')
						};
					}catch(e){};
					html.push('</ol><div class="safe bad"><em class="'+(istmall ? "tmall" : isseller ? "seller" : "buyer" )+'"></em></div></div>');
					//非天猫卖家
					if(!istmall){
						//卖家
						if(isseller){
							html.push('<div class="table"><table cellspacing="0">');
							html.push('<tr><th>宝贝与描述相符</th><th>卖家的服务态度</th><th>卖家发货的速度</th></tr>');
							html.push('<tr><td>'+ (d.ak>0?d.ak:0) +' 分</td><td>'+ (d.al>0?d.al:0) +' 分</td><td>'+ (d.am>0?d.am:0) +' 分</td></tr></table></div>');

							html.push('<div class="table"><table cellspacing="0">');
							html.push('<tr><th>卖家好评率</th><th>主营业务</th><th>主营占比</th><th>保证金余额</th><th>消保</th></tr>');
							html.push('<tr><td>'+ d.h +'</td><td>'+ d.n +'</td><td>'+ (!d.af ? '--' : (Math.ceil(parseInt(d.af) / (parseInt(d.v) + parseInt(d.y)) * 1000) / 10) +'%') +'</td><td>'+ (!d.o ? "0.00" : d.o) +'</td><td>'+ (d.g.indexOf('认证')>=0?'已加入&nbsp;<img src="/images/taobao/bao.png"/>':'未加入')+ '</td></tr></table></div>');
						//买家
						}else{
							html.push('<div class="table"><table cellspacing="0">');
							html.push('<tr><th>买家好评率</th><th>给别人的好评</th><th>给别人的中评</th><th>给别人的差评</th><th>账号评级</th></tr>');
							html.push('<tr><td>'+ (!d.h ? '100%' : d.h) +'</td><td>'+ d.ab +'</td><td>'+ d.ac +'</td><td>'+ d.ad +'</td><td>');
							try{
								var today = new Date().getTime(),
									sindate = new Date(d.d.replace('日',"").replace(/[\u4E00-\u9FFF]/g,"-")).getTime();
								if(today - sindate < (1000 * 3600 * 24 * 30) || d.p > 20){
									html.push("危险&nbsp;<img src='/images/taobao/weixian.gif' title='注册未满30天或一周超出20信用点'/>");
								}else{
									html.push("安全&nbsp;<img src='/images/taobao/anquan.gif'/>");
								}
							}catch(e){}
							html.push('</td></tr></table></div>');
						}
						html.push('<div class="table"><table cellspacing="0"><tr>');
						html.push('<th>收到的评价</th><th>最近一周</th><th>最近一月</th><th>最近半年</th><th>半年以前</th></tr>');
						html.push('<tr><td><img src="/images/taobao/hao.gif"/> 好评</td><td>'+ d.p +'</td><td>'+ d.s +'</td><td>'+ d.v +'</td><td>'+ d.y +'</td></tr>');
						html.push('<tr><td><img src="/images/taobao/zhong.gif"/> 中评</td><td>'+ d.q +'</td><td>'+ d.t +'</td><td>'+ d.w +'</td><td>'+ d.z +'</td></tr>');
						html.push('<tr><td><img src="/images/taobao/cha.gif"/> 差评</td><td>'+ d.r +'</td><td>'+ d.u +'</td><td>'+ d.x +'</td><td>'+ d.aa +'</td></tr>');
						html.push('</table></div>');
						if(isseller){
							html.push('<div class="usernotice">此账号已开通淘宝店，买家信用明细无法查询！</div>');
						}else{
							html.push('<div class="usernotice">此账号未开通淘宝店，卖家信用明细无法查询！</div>');
						};
					}else{
						html.push('<div class="usernotice">此账号已开通天猫，其信用明细无法查询！</div>');
					};
					$bd_result.html(html.join(""));
				}else{
					$bd_result.msg(d.tips);
				}

				// 360广告代码
				if (data360!='') {
					$bd_result.prepend('<div id=k-360 style=margin-top:8px;>'+data360+'</div>');
				};
				
			}
			, doSearch = function(keyword){
				$('#ad360').show();
				$wrap.removeClass("search_bg");
				$drop.val(keyword);
				document.title = keyword +" - 淘宝信用";
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$bd_result.html('<div class="waiting"><div class="wait"></div></div>');
				keyword = ui.filterSpecChr(keyword);
				if(keyword === '客户达'){
					return reqSuccess(cacheData, keyword);
				};
				$lieliuSp.show();
				// console.log(keyword)
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
		}else{
			$wrap.addClass("search_bg");
		};
		$bd_result.msg = function(text){
			$wrap.addClass("search_bg");
			$bd_result.html("<div class='msg'><em></em><span>"+ text + (text.indexOf('！') >= 0 ? "" : '！')+ "</span></div>");
			return false;
		};
		//绑定回车事件
		ui.bindEnter([$drop.input],submitSearch);
		$search_btn.click(function(){
			submitSearch();
		});
		ui.loadUI();
	});
},["kehuda/utils","common/require","kehuda/navbar"]);
