Fengs.add('zx/market', function(S, $, REQ, COOKIE, URI, LAB){
	var checkBind = function(){
			/*if(!URI.taonick || URI.taonick == ""){
				alert("[do]bind[/do]");
				return false;
			};*/
			return true;
		}
		, currentID = 0
		, hasTemplateCount = 0 			//可以免费使用的模板数量
		, buyTemp = function(obj, isup, callback){
			var $cover = $('<div id="buycover"></div>')
				, $layer = $('<div id="buylayer"><div class="paenl_title"><em></em><span>购买模板</span><a title="关闭"></a></div><div class="panel_wrap"></div></div>')
				, html = [];
			html.push('<div class="panel buy">');
			html.push('<dl><dt><img src="'+ obj.pictrue+'"/></dt><dd>');
			html.push('<h2>'+ obj.name +'</h2>');
			html.push('<ul><li><label>模板编号：</label><span>'+ obj.id +'</span></li>');
			html.push('<li><label>旺铺版本：</label><span>'+ ($.inArray(1, obj.site)>=0 ? '基础版' : $.inArray(3, obj.site)>=0  ? '天猫版' : '专业版') +'</span></li>');
			html.push('<li><label>模板价格：</label><span class="orange">yen<b>30.00</b></span></li></ul>');
			if(buyer.p == 13){
				html.push('<p>您可以免费领取'+ (hasTemplateCount > 0 ? 0 : 1) +'个模板</p>');
				html.push('<p><a class="getbtn '+ (hasTemplateCount > 0 ? "tobuy" : "toget") +'"></a></p>');
				html.push('<p><a class="upPower">点此获得全部模板</a></p>');
			}else{
				html.push('<p>全集版可以免费使用所有模板</p>');
				html.push('<p><a class="getbtn toget"></a></p><p>');
				html.push('<p>&nbsp;</p>');
			}
			html.push('</dd></dl></div>');
			html.push('<div class="panel update" style="height: 322px;">');
			html.push('<dl id="normal" style="height: 322px;"><dt></dt><dd></dd></dl>');
			html.push('<dl id="up" style="height: 322px;"><dt></dt><dd></dd></dl>');
			html.push('</div><div class="panel pay"></div>');
			html.push('</div><div class="panel back"><ul><h2>请您在新打开的页面上<br/>完成支付</h2>');
			html.push('<p>支付完成前请不要关闭此窗口。<br/>完成付款后请根据您的情况点击下面的按钮。</p></ul>');
			html.push('<p class="tc"><button class="paytrue">我已完成支付</button><button class="payerr">付款遇到问题</button></p></div>');
			$layer.find(".panel_wrap").html(html.join("\n"));
			html = null;
			var $close = $layer.find("a:first")
				, $panelBuy = $layer.find(".buy")
				, $panelUp = $layer.find(".update")
				, $panelPay = $layer.find(".pay")
				, $panelBack = $layer.find(".back")
				, $buybtn = $layer.find("a.getbtn")
				, $backbtn = $panelBack.find("button")
				, buySuccess = function(){
					$cover.fadeOut();
					$layer.fadeOut(function(){
						$layer.remove();
						$cover.remove();
					});
					//将ID添加到用户模板级
					tempList.mine.push(obj.id);
					//设置模板为已拥有
					obj.isHave = 1;
					if(obj.price != 0){
						obj.ele.find("dd").html("<em></em><img src='"+ obj.pictrue +"'/>");
					};
					obj.ele.find(".by").text("装修").addClass("desc");
					obj.ele.find(".show").text("预览");
					//如果是普通版本则将模板插到最前面
					if(buyer.p < 14){
						tempList.list.splice($.inArray(obj,tempList.list),1);
						tempList.list.unshift($.extend({},obj));
						//hasTemplateCount += parseInt(obj.price);
					};
					if(!callback){
						LAB.warn("模板获取成功！");
					}else{
						callback();
					};
				}
				, orderid = REQ.getid() +"v"+ buyer.o
				, orderPay = function(ptype,balance){
					balance = balance || 0;
					//通知客户修改余额
					//alert("[do]balance[/do][param]"+ balance +"[/param]");
					var money = ptype == "up" ? 60 : 30,
						cpaytype = balance >= money || ptype == "up" ? 0 : 1;//默认支付方式
					html = [];
					html.push('<li><label>付款方式：</label><span class="tab"><a class="current">账户余额付款<em></em></a><a>支付宝付款<em></em></a></span></li>');
					html.push('<li><label>订单编号：</label><span>'+ orderid +'</span></li>');
					html.push('<dl class="alipay">');
					html.push('<dd><li><label>账户余额：</label><span><b>'+balance+'</b><span>元</span> <a href="javascript:void(0);" onclick="alter(\'[do]addmoney[/do]\')"><img src="images/torecharge.gif"/></a></span></li>');
					html.push('<li><label>支付金额：</label><span><b>'+ money +'</b><span>元</span></span></li>');
					html.push('<li><label>支付密码：</label><span><input type="password" maxlength="16"/></span></li></dd>');
					html.push('<dt><li><label></label><span><button class="yue"></button></span></li></dt></dl>');
					html.push('<dl class="balance"><dd><li><label>支付金额：</label><span><b>'+ money +'</b><span>元</span></span></li>');
					html.push('<li><label>&nbsp;</label><span><img src="images/alipay.png"/></span></li></dd>');
					html.push('<dt><li><label>&nbsp;</label><span><button class="ali"></button></span></li></dt></dl>');
					$panelPay.html(html.join("\n")).slideDown().siblings().slideUp();
					var $tab = $panelPay.find(".tab a")
						, $con = $panelPay.find("dl");
					$tab.each(function(){
						var $this = $(this);
						$this.click(function(){
							//if($this.index() == 1 && ptype == "up"){ return false;};
							$this.addClass("current").siblings().removeClass("current");
							$con.eq($this.index()).css("display","block").siblings("dl").css("display","none");
						});
					});
					$tab.eq(cpaytype).trigger("click");
					//if(ptype == "up"){$tab.eq(1).css("display","none");};
					//余额支付
					$panelPay.find("button:first").click(function(){
						var password = $("input[type='password']").val();
						if(password == ""){
							return LAB.warn("请输入支付密码");
						};
						password = REQ.pay(password);
						//升级权限
						if(ptype == "up"){
							REQ.m({
								url:"zx/agent_upgrade",
								data:{'to':URI.username,'power':14,'orderid':orderid},
								p:password,
								success:function(d){
									d = d.sududa;
									LAB.warn(d.tips);
									if(d.status == 1){
										$layer.remove();
										$cover.remove();
										alert("[do]userinfochanged[/do]");
										window.toQuanji();
										//buySuccess();
									};
								},
								error:function(e){
									LAB.warn("请求失败");
								}
							});
						}else{
							REQ.m({
								url:"zx/order_pay",
								data:{'username': URI.username, 'orderid': orderid},
								p:password,
								success:function(d){
									d = d.sududa;
									LAB.warn(d.tips);
									if(d.status == 1){
										buySuccess();
										//更新用户订单
										REQ.p({url:"zx/order_list",data:{'username': URI.username}});
									};
								},
								error:function(e){
									LAB.warn("请求失败");
								}
							});
						};
					});
					//第三方支付
					$panelPay.find("button:last").click(function(){
						var url = REQ.s({
								url:"zx/order_pay_other",
								data:{"do":(ptype == "up" ? "upgrade" : "buy"),"price":money,"channel":1,"power":14,"orderid":orderid, 'username': URI.username}
							},true)
							, host = window.location.host
							, ex = /(^http[s]?:\/\/)/.exec(window.location.href)[0]
							, windowUrl = ex + host + url;
						//console.log(windowUrl)
						alert("[do]openWindow[/do][url]"+ windowUrl +"[/url]");
						//window.open(,'newwindow','height=700,width=900,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no')  
						$panelPay.slideUp();
						$panelBack.slideDown();
					});
					//支付回调
					$backbtn.each(function(){
						var $this = $(this),
							t = $this.attr("class");
						$this.click(function(){
							//完成付款去验证订单
							if(t == "paytrue"){
								REQ.s({
									'url':"zx/order_status",
									'data':{'username': URI.username, 'orderid':orderid},
									'success':function(d){
										d = d.sududa;
										if(d.status == 1){
											LAB.warn(d.tips);
											alert("[do]userinfochanged[/do]");
											if(ptype == "up"){
												$layer.remove();
												$cover.remove();
												window.toQuanji();
											}else{
												buySuccess();
												REQ.p({url:"zx/order_list",data:{'username': URI.username}});
											};
										}else{
											LAB.warn("订单状态未成功，请确认你是否成功付款");
										}
									}
								});
							//付款遇到问题
							}else{
								$panelPay.slideDown();
								$panelBack.slideUp();
							};
						});
					});
					//LAB.warn(d.sududa.tips);
				};
			if(buyer.p >= 14 || obj.price == 0){
				//购买模板
				REQ.p({
					url:"zx/order_add",
					data:{'username': URI.username, 'orderid':orderid, 'productid':obj.id},
					success:function(d){
						d = d.sududa;
						//购买成功
						if(d.status == "1"){
							buySuccess();//购买成功
						}else{
							LAB.warn(d.tips);
						};
					}
				});
				return;
			};
			$("body").append($cover.fadeIn(),$layer.fadeIn());
			$panelBuy.find("a.upPower").click(function(){
				$panelBuy.slideUp();
				$panelPay.slideDown();
				orderPay("up",buyer.b);
				return;
			});
			$close.click(function(e){
				$cover.fadeOut();
				$layer.fadeOut(function(){
					$layer.remove();
					$cover.remove();
				})
				e.preventDefault();
			});
			//
			if(isup){
				$panelPay.slideDown();
				orderPay("up",buyer.b);
				return;
			};
			$panelBuy.slideDown();
			$buybtn.click(function(){
				if(hasTemplateCount == 0){
					//购买模板
					REQ.p({
						url:"zx/order_add",
						data:{'username': URI.username, 'orderid':orderid,'productid':obj.id},
						success:function(d){
							d = d.sududa;
							//购买成功
							if(d.status == "1"){
								buySuccess();//购买成功
							};
						}
					});
				};
				$panelUp.slideDown();
				$panelBuy.slideUp();
				//购买
				var $dl = $layer.find("#normal,#up");
				$dl.each(function(){
					var $this = $(this);
					$this.click(function(){
						var rel = $this.attr("id");
						orderid = REQ.getid() +"v"+ buyer.o;
						switch(rel){
							//升级
							case "up":
								//升级权限
								/*updateActiveStatus(function(){
									orderPay(rel,buyer.b);
								});*/
								orderPay(rel,buyer.b);
								break;
							default:
								//购买模板
								REQ.p({
									//url:"/zx/data.json",//?"+ new Date().getTime(),
									url:"zx/order_add",
									data:{'username': URI.username, 'orderid':orderid ,'productid':obj.id},
									success:function(d){
										d = d.sududa;
										//购买成功
										if(d.status == "1"){
											buySuccess();//购买成功
										//去付款
										}else if(d.status == "0"){
											orderPay(rel,d.balance);
										}else{
											LAB.warn(d.tips);
										};
									}
								});
								break;
						};
					});
				});
				
			});
		},
		buyer = {},
		updateActiveStatus = function(callback){
			REQ.p({
				url:"es/login_userinfo"
				, data:{"username": URI.username}
				, p: URI.password
				, success:function(d){
					buyer = d.sududa;
					if(buyer.status == 1){
						//alert("[do]balance[/do][param]"+ buyer.b +"[/param]");
						$.cookie(REQ.prefix +"LOGINED", S.jsonToStr(buyer), {'expires': 30,'path':'/'});
						callback && callback();
					}else{
						buyer = {};
					}
				}
			});
		},
		tempList = {
			style:0,//当前筛选风格
			color:0,//当前筛选颜色
			industry:0,//当前筛选行业
			site:0,//当前筛选店铺版本
			power:13,//当前用户版本
			mine:[],//我已经购买的模板
			key:false,//当前搜索关键词
			first:true,
			timer:null,
			status:true,
			page:{
				total:0,//记录总数
				current:1,//当前页
				count:Math.floor((document.body.clientWidth - 20) / 190) * 3//每页数量
			},
			list:[],//所有模板数组
			showList:[],//当前筛选过的模板
			createEle:function(obj,index,wrap,val){//建立一个模板对象
				var $li = $("<li></li>"),$buy,$show,$div;
				//obj.isHave = $.inArray(obj.id,this.mine);
				$li.html("<dl><dd title='"+ obj.name +"'>"+ (obj.price == 0 ? "<em class='free'></em>" : obj.isHave >= 0 || buyer.p >= 14 ? "<em></em>" :  "") +"<img src='"+ obj.pictrue +"'/></dd><dt><p>"+(this.key ? obj.name.toUpperCase().replace(this.key.toUpperCase(),"<b>"+ this.key +"</b>") : obj.name)+"<i class='site"+ obj.site[0] +"'></i></p><div><a href='javascript:void(0);' class='show'>"+(obj.isHave >= 0 || buyer.p >= 14 || obj.price == 0 ? "预览" : "试用")+"</a><a href='javascript:void(0);' class='by "+(obj.isHave >= 0 || buyer.p >= 14? "desc" : "buy")+"'>"+(obj.isHave >= 0  || buyer.p >= 14 || obj.price == 0 ? "装修" : "购买")+"</a></</div></dt></dl>");
				$buy = $li.find(".by");
				$show = $li.find(".show");
				$div = $li.find("div");
				$li.on("mouseenter",function(){
					/*$show.stop().css({"left":-80,opacity:0}).animate({"left":7,opacity:1});
					$buy.stop().css({"left":258,opacity:0}).animate({"left":91,opacity:1});*/
					$show.stop().css({"left":7,opacity:1});
					$buy.stop().css({"left":91,opacity:1});
				}).on("mouseleave",function(){
					$show.stop().css({"left":-80,opacity:0});
					$buy.stop().css({"left":258,opacity:0});
				});
				//$show.attr("href",obj.file);
				$buy.on("click",function(e){
					//window.location.href = '/create/'+ URI.username +'/'+ obj.id +'/design';
					currentID = obj.id;
					if(checkBind()){
						if(buyer.p === "0" && obj.price != 0){
							return alert("[do]active[/do]");
						}
						var msg = function(){
							//alert("[do]design[/do][url]"+ hostUrl +"/zx/design?username="+ encodeURIComponent(URI.username) +"&id="+ obj.id +"&nick="+ encodeURIComponent(URI.taonick) +"&shopid="+ URI.shopid +"&sign="+ URI.password +"[/url]");
							alert('[do]design[/do][url]'+ hostUrl +'/create/'+ URI.username +'/'+ obj.id +'/design?client=1[/url]');
						}
						if(obj.isHave >= 0 || buyer.p >= 14){
							msg();
						}else if(obj.price == 0){
							return buyTemp(obj,false,function(){
								msg();
							});
						}else{
							buyTemp(obj)
						};
					}
				});
				$show.click(function(){
					//window.location.href = '/create/yun@sdd.com/'+ obj.id +'/view';
					currentID = obj.id;
					if(checkBind()){
						var msg = function(ishave){
							//alert("[do]"+(ishave ? "preview" : "design")+"[/do][url]"+ hostUrl +"/zx/"+(ishave ? "view" : "tryout")+"?username="+ $.cookie("KEHUDA_DESC_USER") +"&id="+ obj.id +"&nick="+ encodeURIComponent(URI.taonick) +"&shopid="+ URI.shopid +"&sign="+ URI.password +"[/url]");
							if(ishave){
								alert('[do]preview[/do][url]'+ hostUrl +'/create/'+ URI.username +'/'+ obj.id +'/views?client=1[/url]');
							}else{
								alert('[do]design[/do][url]'+ hostUrl +'/create/'+ URI.username +'/'+ obj.id +'/design?client=1[/url]');
							}
							
						}
						if(obj.isHave >= 0 || buyer.p >= 14){
							msg(true);
						}else if(obj.price == 0){
							return buyTemp(obj,false,function(){
								msg(true);
							});
						}else{
							msg(false);
						}
					};
				});
				obj.ele = $li;
				wrap.append($li);
			},
			check:function(){
				var _this = this;
				if(_this.status == false){
					return false;
				};
				_this.status = false;
				tempList.timer = setTimeout(function(){
					_this.status = true;
				},800);
				return true;
			},
			/*筛选模板
			//industry:行业
			//color:颜色
			//style:风格
			//site:店铺类型
			//text:关键词
			//ani:是否执行动画*/
			filter:function(industry,color,style,site,text,ani){
				var _this = this
					, wrap = $("#views")
					, list = _this.list
					, showList = _this.showList
					, id = false
					, page = _this.page;
				_this.key = false;
				//wrap.html("");
				if(text && text.match(/^[\d]+$/) !== null){
					id = text;
				}
				showList.length = 0;
				for(var i =0; i< list.length;i++){
					if(id){
						_this.key = id;
						if(list[i].id == id){
							showList.push(list[i]);
						};
					}else if(text){
						_this.key = text;
						text = text.toUpperCase();
						if(list[i].name.toUpperCase().indexOf(text)>=0){
							showList.push(list[i]);
						};
					}else{
						_this.key = "";
						if((industry == 0 || $.inArray(industry,list[i].industry)>=0) && (color == 0 || $.inArray(color,list[i].color)>=0) && (style == 0 || $.inArray(style,list[i].style)>=0) && (site == 0 || $.inArray(site,list[i].site)>=0 )){
							showList.push(list[i]);
						};

					}
				};
				page.total = showList.length;
				page.current = 1;
				//page.count = page.total / 24
				for(var i =0; i< showList.length;i++){
					if((i+1) > page.count * (page.current - 1) && (i+1) <= page.count * page.current){
						this.createEle(showList[i],i,wrap);
					};
				};
				_this.pager(1,ani);
				//分页
				//_this.page = 1;
				//resize();
				_this.fenye();
			},
			fenye: function(index){
				//分页
				var _this = this
					, page = _this.page
					, pageCurrent = index || 1;
				var $page = $("#page .fr")
					, yeshu = Math.ceil(page.total / page.count)
					, html = [];
				yeshu = yeshu == 0 ? 1 : yeshu;
				$page.html("<span>共&nbsp;"+ yeshu +"&nbsp;页</span>");
				var cheateBtn = function(index){
					index += 1;
					var $a = $("<a>"+ index +"</a>");
					$a.click(function(){
						if($(this).hasClass('current')){
							return;
						}else if(tempList.check()){
							$(this).attr("class","current").siblings(".current").attr("class","");
							_this.pager(index, true);
						};
					});
					if(index == pageCurrent){
						$a.attr("class","current");
					}
					$page.append($a);
				}
				for(var i=0; i<yeshu;i++){
					if(yeshu < 11){
						cheateBtn(i);
					}else if(pageCurrent < 6){
						if(i < 9 || i+1 == yeshu){
							cheateBtn(i)
						}else if(i == 9){
							$page.append('...');
						}
					}else if(pageCurrent > yeshu-5){
						if(i + 9 > yeshu || i == 0){
							cheateBtn(i)
						}else if(i == 1){
							$page.append('...');
						}
					}else{
						if(i == 0 || i+1== yeshu || i+1==pageCurrent || (i<pageCurrent && i+5>pageCurrent) || (i-pageCurrent>-1 && i-pageCurrent<3)){
							cheateBtn(i);
						}else if(i == 1 || i+2 == yeshu){
							$page.append('...');
						}
					}
				};
			},
			//模板分页显示
			pager:function(index,ani){
				var _this = this,
					wrap = $("#views"),
					showList = _this.showList,
					page = _this.page,
					doit = function(){
						wrap.html("");
						page.current = index;
						for(var i =0; i< showList.length;i++){
							if((i+1) > page.count * (page.current - 1) && (i+1) <= page.count * page.current){
								_this.createEle(showList[i],i,wrap);
							};
						};
						resize();
						_this.fenye(index);
					};
					var $li = $views.find("li"),
						_len = $li.length;
					/*if(ani && $li.length > 0){
						$li.each(function(){
							var $this = $(this),
								index = $li.index($this);
							setTimeout(function(){
								$this.stop().animate({left:"90%",top:-350},"normal","linear",function(){
									_len--;
									if(_len <= 0){
										doit();
									};
								});
							},index * 5);
						});
					}else{
						doit();
					}*/
					doit();
			}
		}
		, $slide = $("#slide")//左边
		, $views = $("#views")//主显示区
		, $items = $slide.find("a,span")
		, $search_btn = $("button")
		, $search_txt = $("#search_txt")
		, liw = 190
		, lih = 317
		, statusCover = function(){
			var t = tempList
				, str = '';
			if(t.key != ''){
				str += '关键词:'+ t.key;
			}else if(t.industry != 0){
				str += '行业:';
				switch(t.industry){
					case 1:
						str += '服装配件';
						break;
					case 2:
						str += '精品鞋包';
						break;
					case 3:
						str += '化妆美容';
						break;
					case 4:
						str += '饰品珠宝';
						break;
					case 5:
						str += '运动户外';
						break;
					case 6:
						str += '装修家居';
						break;
					case 7:
						str += '数码家电';
						break;
					case 8:
						str += '母婴用品';
						break;
					case 9:
						str += '食品保健';
						break;
					case 10:
						str += '生活兴趣';
						break;
					case 11:
						str += '免费';
						break;
				};
			}else if(t.color != 0){
				str += '颜色:';
				switch(t.color){
					case 1:
						str += '红色';
						break;
					case 2:
						str += '橙色';
						break;
					case 3:
						str += '黄色';
						break;
					case 4:
						str += '绿色';
						break;
					case 5:
						str += '蓝色';
						break;
					case 6:
						str += '紫色';
						break;
					case 7:
						str += '棕色';
						break;
					case 8:
						str += '黑色';
						break;
					case 9:
						str += '白色';
						break;
				};

			}else if(t.style != 0){
				str += '风格:';
				switch(t.style){
					case 1:
						str += '时尚';
						break;
					case 2:
						str += '简约';
						break;
					case 3:
						str += '古典';
						break;
					case 4:
						str += '可爱';
						break;
					case 5:
						str += '酷炫';
						break;
					case 6:
						str += '非主流';
						break;
					case 7:
						str += '节日';
						break;
					case 8:
						str += '商务';
						break;
				};
				
			}else if(t.site != 0){
				str += '版本:';
				switch(t.site){
					case 1:
						str += '基础版';
						break;
					case 2:
						str += '专业版';
						break;
					case 3:
						str += '天猫版';
						break;
				};
				
			};
			return str != '' ? '&ldquo;<b>'+ str +'</b>&rdquo;' : '';
		}
		, resize = function(){
			var $li = $("li", $views),
				w = document.body.clientWidth - 20,
				h = document.body.clientHeight - 186,
				x = Math.floor(w / liw),
				y = Math.ceil($li.length / x);
			if($li.length == 0){
				var $pic = $('<div class="nodata"><img src="images/notemplate.jpg"/><br/><span>'+ statusCover() +'未找到相关模板，</span><a>全部模板</a></div>');
				$("#views").append($pic.fadeIn());
			}else{
				$li.each(function(){
					var $this = $(this),
						index = $li.index($this),
						a = index % x,
						b = Math.floor(index / x),
						n = Math.floor(w / x);
					/*setTimeout(function(){
						$this.stop().animate({width:n,left:a * n,top:b * lih});
					},index * 5);*/
					$this.css({width:n,left:a * n,top:b * lih});
				});
				$views.scrollTop(0);
			};
		}
		, timer
		, winResize = function(){
			var _height = $(window).height();
			$views.height(_height - 186);
			$(".wrap").height(_height - 42);
			clearTimeout(timer);
				timer = setTimeout(function(){
					tempList.page.count = Math.floor((document.body.clientWidth - 20) / liw) * 3;
					if(!tempList.first){
						tempList.filter(tempList.industry,tempList.color,tempList.style,tempList.site,null,false);
					}else{
						tempList.first = false;
					};
				},200);
		};
	$('.nodata a').live('click', function(){
		tempList.filter(0,0,0,0,null,false);
		resetSearchStatus();
	});
	//获取模板数据
	REQ.s({
		//url:"/zx/data.json",//?"+ new Date().getTime(),
		url:"api/product_list",
		data:{},
		success:function(d){
			d = d.kehuda;
			if(d.status == "1"){
				tempList.list = d.list.l;
				updateActiveStatus(function(){
					REQ.p({
						url:"zx/order_list",
						data:{'username': URI.username},
						p: URI.password,
						success:function(d){
							d = d.sududa;
							if(d.status == 1){
								//已购模板不为空
								if(d.list != ""){
									var array = []
										, arr = []
										, obj
										, leng = d.list.l.length;
									/*if(leng > 0){
										hasTemplateCount = 0;
									}else{
										hasTemplateCount = 1;
									};*/
									for(var i = 0; i < leng; i++){
										array.push(d.list.l[i].p);
									};
									for(var i = 0,len = tempList.list.length; i<len; i++){
										tempList.list[i].isHave = $.inArray(tempList.list[i].id, array);
										//普通版用户将已购模板插到前面
										if(buyer.p < 14){
											if(tempList.list[i].isHave >= 0){
												arr.unshift(tempList.list[i]);
												//已拥有的模板数量，免费的不算
												hasTemplateCount += parseInt(tempList.list[i].price)
											}else{
												arr.push(tempList.list[i]);
											};
										}
									};
									if(buyer.p < 14){
										tempList.list = arr;
									}
									tempList.mine = array;
								}else{
									hasTemplateCount = 0;
								};
								for(var i=0,len=tempList.list.length; i<len; i++){
									if($.inArray(tempList.list[i].id, ['101','125','169','170']) >= 0){
										obj = tempList.list[i];
										tempList.list.splice(i,1);
										tempList.list.unshift(obj);
									}
								};
								$('#page .fl b').text(tempList.list.length + 80);
								tempList.filter(0,0,0,0,null,true);
							}else{

								LAB.warn(d.tips);
							};
						}
					});
				});
			}else{
				LAB.warn("获取数据失败");
			};
		}
	});
	////测试
	window.userUpdate = function(){
		buyTemp({},true);
	};
	////userUpdate();
	////
	$(window).resize(winResize);
	winResize();
	//滚动公告
    //$("#scrollDiv").Scroll({line:1,speed:500,timer:2000});
	//模板筛选
	function resetSearchStatus($this){
		$(".current",$slide).removeClass('current');
		$("ol span:last",$slide).addClass("current");
		$("ul",$slide).find("a:first").addClass("current");
		if(!$this == false){
			$this.addClass("current").parent().siblings().find(".current").removeClass("current");
			$this.siblings(".current").removeClass("current");
		}
	}
	$items.each(function(){
		var $this = $(this);
		function attchClass($this){
			$this.addClass("current").parent().siblings().find(".current").removeClass("current");
			$this.siblings(".current").removeClass("current");
		};
		$this.click(function(){
			if(tempList.check()){
				var data = eval("("+ $this.attr("click-data") +")");
				attchClass($this);
				tempList[data.t]=data.v;
				switch(data.t){
					case "industry":
						tempList.color = 0;
						tempList.style = 0;
						tempList.site = 0;
						break;
					case "color":
						tempList.industry = 0;
						tempList.style = 0;
						tempList.site = 0;
						break;
					case "style":
						tempList.industry = 0;
						tempList.color = 0;
						tempList.site = 0;
						break;
					case "site":
						tempList.industry = 0;
						tempList.color = 0;
						tempList.style = 0;
						break;
				}
				//console.log(tempList.industry+","+tempList.color+","+tempList.style+","+tempList.site);
				resetSearchStatus($this);//重置筛选按钮
				tempList.filter(tempList.industry,tempList.color,tempList.style,tempList.site,null,true);
			};
		});
	});
	//模板搜索
	$search_btn.click(function(){
		var val = $search_txt.val();
		if(val == $search_txt.attr("placeholder") || val == ""){
			return;
		};
		tempList.style = 0;
		tempList.color = 0;
		tempList.industry = 0;
		tempList.site = 0;
		tempList.filter(0,0,0,0,val,true);
		resetSearchStatus();		//重置筛选按钮
	});
	$search_txt.keydown(function(e){
		var keyCode = e.keyCode || e.which || e.charCode;
		if(keyCode == "13"){
			$search_btn.trigger("click")
		};
	})
	$.cookie("KEHUDA_DESC_USER",URI.username,{path:"/"});
	window.updateBindStatus = function(nick,shopid){
		nick = decodeURIComponent(nick);
		shopid = decodeURIComponent(shopid);
		URI.updateTaonick(nick, shopid);
		/* 绑定淘宝店铺 */
		REQ.s({ url:"api/bind_taonick", data:{'username': URI.username, 'taonick': nick, 'shopid': shopid}})
	};
	window.buyTemplate = function(id){
		var list = tempList.list
			, len = list.length;
		for(var i=0; i<len; i++){
			if(list[i].id == currentID){
				return buyTemp(list[i])
			}
		}
	};
	window.toQuanji = function(){
		buyer.p = "14";
		var $view = $("#views");
		$('li img',$view).before('<em></em>');
		$('a.show',$view).text('预览');
		$('a.by',$view).attr('class','by desc').text('装修');
		return true;
	};
	window.toJihuo = function(){
		return updateActiveStatus();
	}
	window.updateActiveStatus = updateActiveStatus;
},["common/require", "jquery/cookie", "./inc/recept", "./lab"]);