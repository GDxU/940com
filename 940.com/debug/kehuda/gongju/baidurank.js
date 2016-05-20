Fengs.add('kehuda/gongju/baidurank', function(S, $, ui, req){
	var record = new ui.record({prefix:"baidu_rank_",key:["keyword","domain"]});
	$(document).ready(function(){
		//初始化下拉控件
		var $wrap = $(".search_wrap")
			, $drop = ui.drop($(".drop",$wrap),record)
			, $keyDrop = $drop[0]
			, $domainDrop = $drop[1]
			, $search_btn = $("button",$wrap)
			, $bd_result = $(".bd_result",$wrap)
			, $bd_share = $(".bd_share",$wrap)
			, $lieliuSp = $('.lieliu-sp')
			, settings = {
				timer: 0					//计数器
				, len: 0 					//总请求次数
				, reqsize: 1				//每次查询条数
				, size: 50					//
				, back: 0 					//查询返回条数
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
					$bd_share.html("");
					return $bd_result.msg('请输入关键词和域名');
				}else if(!S.test(search_domain,"domain") && !S.test(search_domain,"url")){
					$bd_share.html("");
					return $bd_result.msg('域名格式错误');
				}else if(!S.test(search_domain,"domain") && S.test(search_domain,"url")){
					var ex = /^https?:\/\/([a-zA-Z0-9_\-.]*)/.exec(search_domain);
					try{
						search_domain = ex[1].replace(/\:[\d]*$/ig,"");
					}catch(e){
						$bd_share.html("");
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
				/*//自动为JSON的键值添加双引号
				str = str.replace(/(r|p|b|e|d|n|t|u)+:/ig, function(a){ return '\"'+ a.replace(':','')+'\":';});
				//自动替换标题内的'"/等转义
				str = str.replace(/"t":"[\S]{1,150}","u"/ig, function(str){ return '"t":"'+ str.substr(5,str.indexOf('","u"')-5).replace(/['|"|\|]/ig, function(b){ return  "\\"+ b;}) +'","u"';})
				//console.log(str);*/
				//var obj = eval('function(){return '+ str +';})()');
				//obj = eval('(function(){return '+ str +';})()');
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
				$('#ad360').show();
				$lieliuSp.show();
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
						var $ele = $("<ul class='wait'><em></em><span>"+ yeshu +"查询中…</span></ul>")
							, callback = function(){
								settings.back++;
								//console.log(settings.back +','+ settings.conreq);
								if(settings.back == settings.conreq && settings.len > settings.conreq){
									if($more){
										$more.fadeIn();
									}else{
									$more =  $("<ul class='more'><em></em><span>继续查询</span><em></em></ul>");
										$more.click(function(){
											if(settings.back < reqing - 3){
												return;
											}
											reqing = settings.len - settings.back > settings.onereq ? settings.back + settings.onereq : settings.len;
											for(var k = settings.back; k<reqing; k++){
												exeSearch(k,settings.back);
											};
											if(reqing >= settings.len){
												$more.remove();
											}else{
												$more.hide();
											};
										});
										$bd_result.append($more);
									}
								}else if(settings.back == reqing && settings.back < settings.len && $more){
									$more.fadeIn();
								}
							}
							, suberr = function(){
								$ele.attr("class","err").html("<em></em><span>查询超时</span><a href='javascript:void(0);'>重试</a>").find('a').on("click",function(){
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
								$ele.attr("class","wait").html("<em></em><span>"+ yeshu +"查询中…</span>");
								var doajax = req.s({
									//host:'//www.kehuda.com:1024/',
									url:"/web/baidu_rank"
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
										var result = exresult(i, d)
											, $table = $('<div class="tbrk"></div>')
											, html = [];
										if(result !== false){
											d = d.data;
											$ele.attr("class","err").html("<em></em><span>"+ yeshu +"查询中</span>");
											//result = exresult(i, d);
											//匹配查询结果
											if(result.d.length == 0){
												$ele.attr("class","err").html("<em></em><span>"+ yeshu +"没有排名</span>");
											}else{
												//$ele.attr("class","yes").html("<em></em><span>排在第&nbsp;"+ result.tips +"</span><a href='http://www.baidu.com/s?wd="+ encodeURIComponent(keyword) +"&pn="+ i * settings.size +"&rn=50&ie=utf-8' target='new'>查看</a>");
												$ele.attr("class","plus").html("<div class='res'><em></em><span>排在第&nbsp;"+ result.tips +"&nbsp;</span></div><div class='th'><em class='extend'></em><span class='t t_1'>标题</span><span class='r r_1'>排名</span><span class='r r_1'>页数</span></div>");
												html.push('<table cellpadding="0" cellspacing="0"><tbody>');
												var arr = result.d;
												for(var k = 0,leng = arr.length; k<leng; k++){
													arr[k].a = getPageRank(arr[k].n);
													html.push('<tr '+ (k % 2 == 0 ? 'class="dual"' : '') +'>');
													html.push('<td class="b"><a href="https://www.baidu.com/link?url='+ arr[k].u +'&wd='+ encodeURIComponent(keyword) +'&issp=1&f=8&ie=utf-8&tn=baiduhome_pg&inputT='+ settings.maxCount +'" target="_blank">'+ arr[k].t +'</a></td>');
													html.push('<td class="r"><b>'+ arr[k].n +'</b></td>');
													html.push('<td class="r"><a href="http://www.baidu.com/s?wd='+ encodeURIComponent(keyword) +'&pn='+ ((arr[k].a - 1) * 10) +'&ie=utf-8" target="new">'+ arr[k].a +'</a></td>');
													html.push('</tr>')
												};
												html.push('</table>');
												$ele.after($table.html(html.join(''))).on("click",function(){
													var blk = $(".res", $ele).css("display");
													$(".res", $ele).css("display",blk == "none" ? "block" : "none").siblings(".th").css("display",blk == "none" ? "none" : "block");
													//$ele.siblings(".plus").find(".res").css("display","block").siblings(".th").css("display","none");
													$table.slideToggle();//.siblings('.tbrk').slideUp();
												});
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
						if(!$more){
							$bd_result.append($ele);
						}else{
							$more.before($ele);
						}
						setTimeout(function(){
							if(curCount != queue.count){
								return;
							}
							doreq();
						}, (i - xf) * settings.reqOut);
					};
				ui.share({
					'wrap':$bd_share
					, 'href':"http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="+ encodeURIComponent("http://www.kehuda.com/g/b/#domain="+ domain +"&keyword="+ encodeURIComponent(keyword))+"&title="+ encodeURIComponent(domain +" "+ keyword +" - 百度排名") +"&desc=&summary=%e5%ae%a2%e6%88%b7%e8%be%be+-+%e7%94%b5%e5%95%86%e5%b7%a5%e5%85%b7"
					, 'type': 'baidu'
				});
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
			$wrap.addClass("search_bg");
			$bd_result.html("<div class='msg'><em></em><span>"+ text +"!</span></div>");
			return false;
		};
		//绑定回车事件
		ui.bindEnter([$keyDrop.input,$domainDrop.input],submitSearch);
		$search_btn.click(function(){
			submitSearch();
		});
		ui.loadUI();
	});
},["kehuda/utils", "common/require","kehuda/navbar"]);