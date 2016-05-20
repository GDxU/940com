Fengs.add('kehuda/mobile/baidurank', function(S, $, ui, req, Template){
	var record = new ui.record({prefix:"baidu_rank_",key:["keyword","domain"]});
	$(document).ready(function(){
		//初始化下拉控件
		var $wrap = $("section")
			, $drop = ui.drop($(".drop",$wrap),record)
			, $keyDrop = $drop[0]
			, $domainDrop = $drop[1]
			, $search_btn = $(".but-search",$wrap)
			, $bd_result = $(".k-result-ul",$wrap)
			, $imgLink = $('.imgLink', $wrap)
			, settings = {
				timer: 0					//计数器
				, len: 0 					//总请求次数
				, reqsize: 1				//每次查询条数
				, size: 50					//
				, back: 0 				//查询返回条数
				, count: 0 					//总数量
				, onereq: 8 				//
				, conreq: 8 				//首次查询次数
				, maxCount: 760				//最大查询条数
				, subOut: 2000				//设置搜索间隔
				, reqOut: 2000				//每次请求数据的间隔
			}
			, queue = new ui.queue()		//建立请求队列
			//提交查询
			, submitSearch = function(){
				var search_key = $keyDrop.value.trim(),
					search_domain = $domainDrop.value.trim();
				search_domain = search_domain.toLowerCase();
				if(search_key == "" && search_domain == ""){
					return false;
				}else if(search_key == "" || search_domain == ""){
					return $bd_result.msg('请输入关键词和域名');
				}else if(!S.test(search_domain,"domain") && !S.test(search_domain,"url")){
					return $bd_result.msg('域名格式错误');
				}else if(!S.test(search_domain,"domain") && S.test(search_domain,"url")){
					var ex = /^https?:\/\/([a-zA-Z0-9_\-.]*)/.exec(search_domain);
					try{
						search_domain = ex[1].replace(/\:[\d]*$/ig,"");
					}catch(e){
						return $bd_result.msg('域名格式错误');
					}
				};
				if(settings.timer > 0){
					return;
				};
				search_domain = search_domain.replace(/^(https?:\/\/)|(\/)/g,"").toLowerCase();
				settings.timer = 1;
				setTimeout(function(){
					settings.timer = 0;
				},2000);
				//添加关键词和域名查询记录
				record["keyword"].add(search_key);
				record["domain"].add(search_domain);
				window.location="#domain="+ search_domain +"&keyword="+ encodeURIComponent(search_key);
				doSearch(search_domain,search_key);
				//统计代码
				ui.refreshStatistics("tongjiqi");
			},
			//解析搜索结果
			exresult = function(k, r){
				//r = '{r:1,p:15580,b:1,e:50,d:[{n:1,t:"银行卡号归属地查询_手机号码归属地查询_IP地址查询_银行账号归属...",u:"OfQBG3atbDhh6bm44uBH5GVyEWqc7g098H7r7mHgU6C"}]}';
				/*var $div = $('<div style="display:none;"></div>');
				$div.html(r);
				$('body').append($div);
				var str = $div.text()
					, obj
					, arr = [];
				$div.remove();*/
				var str = r, obj, arr=[];
				if(str.match(/\]\}$/) == null){
					str += ']}';
				};
				try{
					obj = eval('(function(){return '+ str +';})()');
					//obj =  $.parseJSON(str);
					//如果返回P为-1时表示查询失败
					if(obj.p == -1){
						obj = false;
					}else{
						obj.tips = '';
						//将所有排名连接为字符串
						for(var i=0,len = obj.d.length; i<len; i++){
							if(i > 10){
								obj.tips = '…';
								break;
							}else{
								arr.push(obj.d[i].n);
							};
						};
						obj.tips = arr.join(',') + obj.tips + '&nbsp;位';
					};
				}catch(e){
					obj = false;
				}
				return obj;
			},
			//解析排名页数
			getPageRank = function(rank){
				rank = parseInt(rank);
				return Math.ceil(rank / 10);
			}
			//执行搜索
			doSearch = function(domain,keyword){
				//请求队列初始化
				$imgLink.hide();//光碟隐藏
				$("p.more").hide();
				queue.init();
				//获取当前请求队列ID
				var curCount = (function(){
						return queue.count;
					})()
					, $more	= false			//加载更多按钮
					, reqing = settings.conreq;	//已发送的请求
				settings.back = 0;			//初始化返回总数为0
				$wrap.removeClass("search_bg");
				if($domainDrop.val().toLowerCase() != domain){
					$domainDrop.val(domain);
				};
				$keyDrop.val(keyword);
				$bd_result.html("");
				document.title = domain +" "+ keyword +" - 百度排名";
				keyword = ui.filterSpecChr(keyword);
				var exeSearch = function(i,xf){
					var page1 =  parseInt(i * settings.size / 10 + 1)//parseInt(i * settings.size + 1)
						, page2 = page1 + settings.size / 10 - 1;
					page2 = page2 > 76 ? 76 : page2;//(i == 15 ? settings.maxCount : (i + 1) *settings.size);
						var yeshu = '第&nbsp;'+ (page1 == page2 ? page1 : page1 +"-"+ page2) +'&nbsp;页&nbsp;'
						var $ele = $("<li class='wait'>"+ yeshu +"查询中…</li>")
							, callback = function(){
								settings.back++;
								if(settings.back == settings.conreq && settings.len > settings.conreq){
									if($more){
										$more.show();
									}else{
										$more =  $("p.more");
										$more.click(function(){
											if(settings.back < reqing - 3){
												return;
											}
											reqing = settings.len - settings.back > settings.onereq ? settings.back + settings.onereq : settings.len;
											for(var k = settings.back; k<reqing; k++){
												exeSearch(k,settings.back);
											};
											if(reqing >= settings.len){
												$more.hide();
											}else{
												$more.hide();
											};
										});
										$more.show();
									}
								}else if(settings.back == reqing && settings.back < settings.len && $more){
									$more.show();
								}
							}
							, suberr = function(){
								$ele.attr("class","err").html("查询超时<a href='javascript:void(0);' class='fr'>重试</a>").find('a').on("click",function(){
									settings.back--;
									doreq(i);
								});
								//第一次超时时追加一次请求
								if(!$ele.data('try')){
									$ele.data('try',true).find('a').trigger('click');
								}
								callback();
							}
							, doreq = function(){
								$ele.attr("class","wait").html(yeshu +"查询中…");
								var doajax = req.s({
									//host:'//www.kehuda.com:1024/',
									url:"/web/baidu_rank"
									// , type: 'jsonp'
									, dataType: 'text'
									, data:{
										domain:domain
										, keyword:keyword
										, page: i + 1
									}
									, success:function(d){
										//d = testdata;
										if(curCount != queue.count){
											return;
										};
										var result = exresult(i, d);
										if(result !== false){
											d = d.data;
											$ele.attr("class","err").html( yeshu +"查询中");
											//result = exresult(i, d);
											//匹配查询结果
											if(result.d.length == 0){
												$ele.attr("class","err").html( yeshu +"没有排名");
											}else{
												result.key = encodeURIComponent(keyword);
												result.count = settings.maxCount;
												Template.helper('getPageRank',getPageRank);
												$ele.attr("class","suc").html(Template('bdtemp', result));
											}
											if(i == 0){
												if(uri.page){
													settings.maxCount = parseInt(uri.page) * 10;
												};
												//如果是每一次请求记录下总页面
												settings.count = parseInt(result.p) * settings.size > settings.maxCount ? settings.maxCount : parseInt(result.p) * settings.size;
												//写入总请求次数
												settings.len = Math.floor(settings.count / settings.size / settings.reqsize) + (settings.count % settings.size == 0 ? 0 : 1);
												if(uri.page){
													settings.conreq = settings.len;
												};
												for(var j=1,leng = settings.len < settings.conreq ? settings.len : settings.conreq; j<leng; j++){
													exeSearch(j,0);
												};
											};
											callback();
										}else{
											suberr();
											//$ele.attr("class","err").html("<em></em><span>查询失败</span>");
										};
									},
									error:function(e){
										suberr();
									}
								});
								queue.add(doajax);
							};
						$bd_result.append($ele);
						setTimeout(function(){
							if(curCount != queue.count){
								return;
							}
							doreq();
						}, (i - xf) * settings.reqOut);
					};
				exeSearch(0);
			};
		//根据参数执行查询
		var uri = new S.parseUri(window.location.href,"#");
		if(uri.domain && uri.keyword){
			doSearch(uri.domain,decodeURIComponent(uri.keyword));
		}else{
			$wrap.addClass("search_bg");
		};
		$bd_result.msg = function(text){
			$bd_result.removeClass('k-loding').html('<li class="msg">'+ text +'!</li>');
		};
		//绑定回车事件
		ui.bindEnter([$keyDrop.input,$domainDrop.input],submitSearch);
		$search_btn.on('click', function(){
			submitSearch();
		});
		ui.init();
	});
},["./common", "common/require","plus/art-template"]);