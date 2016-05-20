Fengs.add('chongzhi/pc/index',function(S, $, u, p, g){
	var userquit = p.q;
	//判断是否登录
	u.n();
	//
	p.z();
	$.trigger(window,"resize",p.z);
	(function(){
		var return_top = $.find("#return_top");
		window.on("scroll",function(){
			var top = document.body.scrollTop + document.documentElement.scrollTop;
			if(top > 300){
				return_top.css("display","block");
			}else{
				return_top.css("display","none");
			};
			if($.browser != "IE 6.0" && p.height() > 600){
				var leftnav = document.find("#side_left");
				if(top > 60 &&  document.body.offsetHeight > p.height() + 80){
					leftnav.css({position:"fixed",top:0,zIndex:1});
				}else{
					leftnav.css({position:"static",top:0});
				};
			};
		});
		return_top.on("click",function(){
			var speed = 500, //动画持续时间
				tween = $.tween.circular.easeInOut,//动画缓动
				l = 15,//时间间隔
				d = parseInt(speed/l),
				start = document.body.scrollTop || document.documentElement.scrollTop,
				current = start,
				end = 0,
				timeout;
			var fadeTo = function(i){
				if(i == d){
					document.body.scrollTop = 0;
					document.documentElement.scrollTop = 0;
					return;
				};
				//t：当前时间
				//b：初始值
				//c：变化量
				//d：持续时间
				var b = start,
					c = end - b,
					f = c;
				f = Math.ceil(tween(i,b,c,d));
				document.body.scrollTop = f;
				document.documentElement.scrollTop = f;
				i++;
				timeout = setTimeout(function(){
					fadeTo(i);
				},l);
			};
			fadeTo(0);
			//document.body.scrollTop = 0;
			//document.documentElement.scrollTop = 0;
		});
	}());
	var t = {
		/***********************
		*订单财务查询列表
		************************/
		"o":function(){
			element = p.container;
			if(element == null){return;};
			n.html("panel.order",function(d){
				element.innerHTML = "<div class='panel_order'>"+ d +"</div>";
				var list = element.find(".list")[0],             //订单搜索列表容器
					searchWrap = element.find(".search")[0],
					searchText = searchWrap.find(".val")[0],//查询类型文本
					input = searchWrap.find("input"),
					searchType = input[0],//查询类型文本值
					searchKey = input[1],//查询关键值
					searchSubmit = element.find("button")[0],//查询提交按钮
					searchDrop = searchWrap.find(".type_drop")[0],//下拉菜单
					searchDropList = searchDrop.find("span"),//下拉菜单项
					pageRecord = 0,       //底部记录数
					pageCount = 0,        //底部总页数
					pageCurrent = 0,      //底部当前页
					isloaduserdata = false,//是否加载下一页面
					bottomLoad = element.find(".reload")[0],       //底部加载更多元素
					loadBtn = bottomLoad.find("button")[0];
				//选择搜索类型 充值或财务记录
				searchText.onclick = function(e){
					if(searchDrop.css("display") == "none"){
						searchDrop.css("display","block");
					}else{
						searchDrop.css("display","none");
					};
					$.stopPropagation(e);
				};
				var now = new Date();
				input[3].value = $.datetime.format(now,"date");
				//now.setMonth(now.getMonth() - 12);
				input[2].value = $.datetime.format(now,"date");
				for(var k in searchDropList){
					searchDropList[k].on("click",function(){
						searchText.innerHTML = this.innerHTML;
						searchType.value = this.id;
						searchDrop.css("display","none");
					});
				};
				//提交查询
				searchSubmit.on("click",function(){
					list.innerHTML = "";
					pageCurrent = 0;
					n.l.s();
					searchOrder();
					return;
				});
				var searchOrder = function(){
					if(searchKey.value == searchKey.attr("placeholder")){
						searchKey.value = "";
					};
					u.p({
						url:"es/"+ searchType.value +"_list",
						data:{"do":"search",line:20,page:pageCurrent + 1,date1:input[2].value,date2:input[3].value,param:searchKey.value},
						success:function(d){
							d = $.json(d).sududa;
							if(d.status == "1"){
								if(d.list != ""){
									for(var i = 0; i< d.list.l.length; i++){
										var li,
											html = new Array();
										if(searchType.value == "recharge"){
											li = $.createElement("a");
											html.push("<dd><span class='title'>"+ d.list.l[i].b +"</span>");
											html.push("<span class='money'>"+ d.list.l[i].p +"</span></dd>");
											html.push("<dd><span class='date'>"+ d.list.l[i].t +"</span>");
											html.push("<span class='balance'>"+ d.list.l[i].s_text +"</span></dd>");
										}else{
											li = $.createElement("li");
											html.push("<dd><span class='title'>"+ d.list.l[i].r +"</span>");
											if(d.list.l[i].i >= 0){
												html.push("<span class='balance'>"+ d.list.l[i].i +"</span></dd>");
											}else{
												html.push("<span class='red'>"+ d.list.l[i].i +"</span></dd>");
											}
											html.push("<dd><span class='date'>"+ d.list.l[i].t +"</span>");
											html.push("<span class='money'>"+ d.list.l[i].b +"</span></dd>");
											li.innerHTML = "";
										};
										li.innerHTML = html.join("\n");
										li.obj = d.list.l[i];
										if(searchType.value == "recharge"){
											li.onclick = function(){
												var obj = this.obj;
												o.v(
													obj.y,
													obj.o,
													{
														tradeamount:obj.b,
														pro:obj.e,
														datetime:obj.t,
														channel:obj.c,
														face:obj.f,
														money:obj.p
													},
													obj.s_text,
													(function(){
														if(obj.s_text.indexOf(g(159)) == 0){
															return 1;
														}else if(obj.s_text.indexOf(g(160)) >= 0){
															return 2;
														}else{
															return 0;
														}
													})()
												);
											};
										};
										list.appendChild(li);
									};
									p.z();
									pageRecord = d.all;//底部记录数
									pageCount = Number(d.pagecount),        //底部总页数
									pageCurrent ++;      //底部当前页
									var span = bottomLoad.find("b");
									if(pageCurrent < pageCount){
										bottomLoad.css("display","block");
										span[0].innerHTML = pageRecord;
										span[1].innerHTML = pageCurrent * 20;
									}else{
										bottomLoad.css("display","none");
									};
									n.l.h();
								}else{
									n.l.h();
									openWarn("no",g(56));
									bottomLoad.css("display","none");
									
								};
							}else{
								n.l.h();
								openWarn("no",d.tips);
							}
						}
					});
				};
				loadBtn.on("click",function(){
					searchOrder();
				});
				document.on("click",function(){
					searchDrop.css("display","none");
				});
				document.loadUI();
				n.l.h();
			});
		},
		
		/***********************
		*业务中心初始化列表
		************************/
		"a":function(){
			var _self = arguments.callee;
			if(!p.h){
				o.h(_self);
				return;
			};
			element = p.container;
			if(element == null){return;};
			n.html("panel.app",function(d){
				element.innerHTML = d;
				var appItem = element.find("li"),
					a = element.find("a"),
					s = p.logined.sududa;
				for(var k=0; k < appItem.length; k++){
					appItem[k].onclick = function(){
						gotourl("a",this.id);
					};
					if(!window.XMLHttpRequest){
						appItem[k].on({
							"mouseover":function(e){
								this.addClass("hover");
							},
							"mouseout":function(e){
								this.removeClass("hover");
							}
						});
					};
				};
				//淘宝托管数量
				if(s.k > "0"){
					a[0].innerHTML = s.k;
					a[0].css("display","block");
				}else{
					a[0].css("display","none");
				};
				//拍拍托管数量
				if(s.l > "0"){
					a[1].innerHTML = s.l;
					a[1].css("display","block");
				}else{
					a[1].css("display","none");
				};
				/*if(s.p < u.r.t){
					upBtn.css("display","block");
				}else{
					upBtn.css("display","none");
				};*/
				//n.o();
				n.l.h();
				p.z();
			});
		}
	};

	/***********************
	*通用页面常量
	f:激活码
	b:主菜单滚动
	c:当前显示功能区面
	d:动画隐藏子区
	e:标题
	g:功能区切换
	h:更改标题样式
	i:定义当前是否显示页
	l：载入等待
	m:更新用户余额
	n:主菜单
	o:更新价格表
	p:功能区面板
	s:动画显示子区
	u:更新用户信息
	f:
	v：子显示
	w：主显示区
	z:自适应屏幕
	************************/
	var n = {
		f:new function(){
			return {
				s:function(){},
				h:function(){},
				g:function(){}
			};
		}(),
		l:new u.l(),
		h:function(title){
			document.title = title +" - "+ g(204);
		},
		v:p.container,
		j:function(type,id,opt,tips,status){
			var _cover = new $.dialog.cover(),
				_div = $.createElement("div"),
				html = new Array(),
				exopt = function(){
					var array = new Array();
					for(var i in opt){
						if(i != "money" && i != "face" && i != "channel" && i != "remark"){
							array.push(u.t(i) +"：<span class='"+ i +"'>"+ opt[i]+"</span></br>");
						};
					};
					return array.join("");
				};
			_div.className = "order_success";
			html.push("<ul class='title'><h1>"+ type +"</h1><div>"+ g(87)+ id +"</div></ul>");
			html.push("<ul class='content'>");
			for(var i in opt){
				if(i != "face"){
					html.push(u.t(i) +"：<span class='"+ i +"'>"+ opt[i]+"</span></br>");
				};
			};
			html.push("<div class='status"+ status +"'></div>");
			html.push("<span>"+ g(89) + tips +"</span></ul>");
			html.push("<ul class='bottom'><li class='fleft'><input type='button' class='isubmit' value='"+ g(163) +"'/></li><li class='fright'><input type='button' class='ibutton' value='"+ g(164) +"'/></li></ul>");
			_div.innerHTML = html.join("\n");
			html = null;
			var input = _div.find("input");
			input[0].onclick = function(){
				var param = type +"|&|"+ id +"|&|"+ opt.face + "|&|"+ exopt();
				window.open("print.jsp#"+ $.su.encode(param));
			};
			input[1].onclick = function(){
				_cover.css("display","none");
				document.body.removeChild(_div);
				//window.location.hash = "#p=a";
				n.l.h();
				_div = null;
			};
			document.body.appendChild(_div);
			_cover.show();
		},
		//更新用户信息
		u:function(read){
			var panel = $.find(".side_left")[0],
				s = p.logined.sududa;
			if(window.location.href.indexOf("#login") >= 0){
				read = true;
				window.location.href = "#";
			}else{
				var today = $.datetime.format(new Date(),"date"),
					coday = $.storage.getCookie("SUDUDA_COM_LOGIN_DATE");
				if(today != coday){
					read = true;
					$.storage.setCookie("SUDUDA_COM_LOGIN_DATE",today);
				}else{
					read = false;
				};
			};
			if(s != null){
				$.find("#user_username").innerHTML = s.u;
				$.find("#user_lastcity").innerHTML = s.lc;
				$.find("#user_lasttime").innerHTML = s.lt;
				u.p({
					url:"es/login_userinfo",
					data:{"do": read ? "edit" : "read"},
					success:function(d){
						d = $.json(d);
						$.extend(s,d.sududa);
						//写入用户信息到Cookie
						if(String(d.sududa.status) == "1"){
							var lockwrap = $.find("#user_lockwrap"),
								lockmoney = $.find("#user_lockmoney");
							$.find("#user_money").innerHTML = s.b;//余额
							if(s.g == "0.0"){
								lockwrap.css("display","none");
							}else{
								lockwrap.css("display","block");
								lockmoney.innerHTML = s.g;//不可用余额
								lockwrap.attr("title",g(185).replace("#",s.g));
								if($.ui.tooltip)$.ui.tooltip(lockwrap);
							}
							var real = $.find("#user_realname");
							if(s.n == "Y"){
								real.innerHTML = s.r;
							}else{
								real.innerHTML ="<a href='#p=u&c=d'>"+ g(55) +"</a>";
							};
							var phonenumber = panel.find("#user_phonenumber"),
								bindphone = panel.find("[id=user_phonebind]")[0];
							if(s.z.length == 11){
								phonenumber.innerHTML = "<a href='javascript:void(0)'>"+s.z+"</a>";
								phonenumber.attr("title",g(13))
							}else{
								phonenumber.innerHTML = g(14);
								phonenumber.attr("title",g(14))
							};
							if($.ui.tooltip){
								$.ui.tooltip(phonenumber);
							}
							bindphone.innerHTML = "";
							if(s.p >= u.r.t){
								bindphone.css("display","none");
							};
							var grade = panel.find("#user_grade")
							grade.innerHTML = s.x;//用户类型
							grade.className = "p"+s.p;
							panel.find("#user_sexhead").className = "sex"+ s.s;
							p.h = "1";
							n.l.h();
						};
						//是否需要绑定手机
						
					}
				});
			};
		},
		//更新价格表
		o:function(tbig,callback){
			return u.o(tbig,callback);
		},
		html:function(url,callback){
			this.o("12",function(obj){
				url = url.replace(/[.]/g,"_");
				callback(obj[url]);
			});
		},
		//更新用户余额
		m:function(){
			var s = p.logined.sududa,
				m1 = $.find("#user_money"),
				m2 = $.find("#user_lockmoney"),
				m3 = $.find("#user_lockwrap");
			u.p({
				url:"es/login_userinfo",
				data:{"do":"read"},
				success:function(d){
					d = $.json(d);
					$.extend(p.logined.sududa,d.sududa);
					//写入用户信息到Cookie
					if(String(d.sududa.status) == "1"){
						m1.innerHTML = p.logined.sududa.b;//余额
						m2.innerHTML = p.logined.sududa.g;//不可用余额
						if(s.g == "0.0"){
							m3.css("display","none");
						}else{
							m3.css("display","block");
							m2.innerHTML = p.logined.sududa.g;//不可用余额
						};
					};
				}
			});
		}
	};
	/******************
	初始化
	******************/
	(function(){
		n.u();
		var touchthis = false,
			menu = function(_this){
				_this.drop = _this.find(".drop")[0];
				var hiddenMenu = function(){
						_this.drop.css("display","none");
						_this.removeClass("hover");
					},
					showMenu = function(){
						_this.drop.css("display","block");
						_this.addClass("hover");
					};
				_this.on({
					"mouseover":function(e){
						if(!touchthis){
							showMenu();
							$.stopPropagation(e);
						};
					},
					"mouseout":function(e){
						hiddenMenu();
					},
					"touchstart":function(e){
						if(!touchthis){
							showMenu();
							$.stopPropagation(e);
							touchthis = true;
						};
					}
				});
				document.on({
					"touchstart":function(e){
						if(!touchthis){
							hiddenMenu();
						};
						touchthis = false;
					},
					"click":function(){
						if(!touchthis){
							hiddenMenu();
						};
						touchthis = false;
					}
				});
				_this.drop.on("click",function(){
					hiddenMenu();
				});
				return _this;
			},
			headmenu = new menu($.find("#headsubmenu"));
	})();
	/******************
	解析URL锚点事件
	******************/
	function hashchange(url){
		u.enter = function(){};
		u.n();
		p.container.innerHTML = "";
		url = url.substring(1,url.length);
		var _arr = url.split("&");
		url = new Object();
		for(var i = 0; i < _arr.length; i++){
			var _a = _arr[i].split("=");
			url[_a[0]] = _a[1];
		};
		var nav = $.find("#leftmenu").find("li");
		if(url.p == "o"){
			nav[0].className = "";
			nav[1].className = "current";
			nav[2].className = "";
		}else if(url.p == "k"){
			nav[0].className = "";
			nav[1].className = "";
			nav[2].className = "current";
		}else{
			nav[0].className = "current";
			nav[1].className = "";
			nav[2].className = "";
		};
		if(url.c != null){
			if(o[url.p][url.c] != null){
				//n.l.s();
				o[url.p][url.c]("pc");
			}else{
				window.location.hash = "";
				return;
			};
		}else if(url.p == "o"){
			n.f.s('p');
			t["o"]();;
			n.h(g(125));
		}else{
			n.f.h();
			t["a"]();
			n.h(g(210));
		};
		p.z();
		//清除弹出所有弹出的选择框
		var selectWrap = $.find(".feng_select");
		if(selectWrap.length == 0) return;
		for(var i = 0; i < selectWrap.length; i++){
			if(selectWrap[i].dropUp != null){
				selectWrap[i].dropUp();
			};
		};
	};
	var gotourl = function(p,c){
		var url = "#p="+p;
		if(c){ url += "&c="+c; };
		window.location.hash = url;
		if($.browser.indexOf("IE") < 0){
			return;
		};
		hashchange(url);
	};
	window.onhashchange = function(){
		var url = window.location.hash,_arr;
		hashchange(url);
	};
	window.onhashchange();
	n.l.h();
}, ['../utils/base', './page', '../utils/lang']);