Fengs.add('kehuda/gongju/taobaorank', function(S, $, ui, req){
	var record = new ui.record({prefix:"kehuda_taork_",key:["key","wang"]});
	var uri = new S.parseUri(window.location.href,"#");
	var addspm = false;//是否追加SPM参数
	var custom = {
			sort: uri.sort//sort=人气：renqi-desc,销量：sale-desc，信用：credit-desc，价格price-asc
			, shebei: uri.shebei ? decodeURIComponent(uri.shebei) : 'm'
			, price: uri.price ? decodeURIComponent(uri.price).split(',') : null
			, page: uri.page ? decodeURIComponent(uri.page) : null
			, loc: uri.loc ? decodeURIComponent(uri.loc) : null
			, key: uri.keyword ?  decodeURIComponent(uri.keyword) : null
			, wang: uri.username ? decodeURIComponent(uri.username) : null
			, getUrl: function(){

				var str = "#username="+ encodeURIComponent(this.wang) +"&keyword="+ encodeURIComponent(this.key)+'&shebei='+this.shebei;
				if(custom.price && custom.price !== null){
					try{
						str += '&price='+ encodeURIComponent(this.price.join(','));
					}catch(e){}
				}
				if(custom.sort){
					if (custom.shebei == 'm') {
						if (sortMap(custom.sort)!='') {//如果手机人气等于空
							str += '&sort='+ (sortMap(custom.sort)?sortMap(custom.sort):custom.sort);
						};
					}else{
						// str += '&sort='+ custom.sort;
						str += '&sort='+ (m_sortMap(custom.sort)?m_sortMap(custom.sort):custom.sort);
					}
				}
				if(custom.loc){
					str += '&loc='+ encodeURIComponent(this.loc)
				}
				/*if(custom.page){
					str += '&page='+ encodeURIComponent(this.page);
				};*/
				return str;
			}
		}
		/*, convertPage = function(inStr){
			if(typeof inStr !== 'string'){
				return [1,50];
			}else if(inStr.match(/^[\d]+\,[\d]+$/) == null){
				return [1,50];
			}
			return inStr.split(',');
		}*/
		, convertLoc = function(inStr){
			switch(inStr){
				case '海外':
					return "美国,英国,法国,瑞士,澳大利亚,新西兰,加拿大,奥地利,韩国,日本,德国,意大利,西班牙,俄罗斯,泰国,印度,荷兰,新加坡,其它国家";
					break;
				case '江浙沪':
					return "江苏,浙江,上海";
					break;
				case '珠三角':
					return "广州,深圳,中山,珠海,佛山,东莞,惠州";
					break;
				case '京津冀':
					return "北京,天津,河北";
					break;
				case '东三省':
					return "黑龙江,吉林,辽宁";
					break;
				case '港澳台':
					return "香港,澳门,台湾";
					break;
				case '江浙沪皖':
					return "江苏,浙江,上海,安徽";
					break;
				default:
					return inStr;
			}
		}
		, postUrl = function(){
			var str = 'https://s.taobao.com/search?ajax=true&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&tab=all&_input_charset=UTF-8&q='+ encodeURIComponent(custom.key);
			//是否追加SPM参数
			if(addspm){
				str += '&spm=a21bo.'+ Math.floor(Math.random() * 99999999) +'.'+ Math.floor(Math.random() * 9999) +'-taobao-item.2';
			};
			if(custom.price){
				var price = custom.price;
				str += '&filter=reserve_price'+ '['+ price[0] +','+ price[1] +']';
			};
			if(custom.sort){
				str += '&sort='+ encodeURIComponent(custom.sort);
			}
			if(custom.loc){
				str += '&loc='+ encodeURIComponent(convertLoc(custom.loc));
			}
			return encodeURIComponent(str);


		}
		, sortMap = function(inkey){
			
				return {
					  "sale-desc" : "_sale" //销量
					, "renqi-desc" : '' //人气
					, "credit-desc": "_ratesum" //信用
					, "price-asc": "_bid" //价格高
					, "price-desc": "bid" //价格低

				}[inkey];
			

		},
		m_sortMap = function(inkey){
			return {
					  "_sale" : "sale-desc" //销量
					//, "renqi-desc" : '' //人气
					, "_ratesum": "credit-desc" //信用
					, "_bid": "price-asc" //价格高
					, "bid": "price-desc" //价格低

				}[inkey];
		}
		, m_postUrl = function(){
			
			var str = '&keyword='+encodeURIComponent(custom.key);
			if(custom.sort){
				str += '&sort='+ encodeURIComponent(sortMap(custom.sort));
			}
			if(custom.price){
				var price = custom.price;
				str += '&start_price=' + price[0] + '&end_price='+price[1];
			};

			if(custom.loc){
				str += '&loc='+ encodeURIComponent(convertLoc(custom.loc));
			}
			return str;
		}
	$(document).ready(function(){
		//是否弹出更多筛选条件
		var $filtitle = $('#filtitle')
			, $fildrop = $('#fildrop').click(function(){return false;});
		$filtitle.click(function(){
			$fildrop.toggle();
			if($filtitle.hasClass('on')){
				clearConditions();
			}
			// $(this).hide();
			//$(this).toggleClass('on');
		})

		var clearConditions = function(){
			delete custom.sort;
			delete custom.price;
			delete custom.loc;
			$citys.removeClass('current').eq(0).addClass('current').parents('.form-loc').find('b').text('发货地');
			$fildrop.find('input').val('');
		};
		//初始化下拉控件
		var $wrap = $(".search_wrap")
			, $drop = ui.drop($(".drop",$wrap),record)
			, $keyDrop = $drop[0]
			, $wangDrop = $drop[1]
			, $search_btn = $("button",$wrap)
			, $bd_result = $(".bd_result",$wrap)
			, $bd_share = $(".bd_share",$wrap)
			, $lieliuSp = $('.lieliu-sp')
			, settings = {
				timer: 0									//计数器
				, len: 0 									//总请求次数
				, reqsize: 5								//每次查询条数
				, size: 44									//电脑每页44条数据
				, m_size: 22								//手机每页22条数据
				, back: 0 									//查询返回条数
				, count: 24 								//总数量
				, onereq: 10 								//
				, conreq: 10 								//首次查询条数
				, subOut: 2000								//设置搜索间隔
				, reqOut: 2000								//每次请求数据的间隔
			}
			, queue = new ui.queue()						//建立请求队列
			//提交查询
			, submitSearch = function(){
				if(settings.timer > 0){
					return;
				};
				settings.timer = 1;
				setTimeout(function(){
					settings.timer = 0;
				}, settings.subOut);
				var search_key = $keyDrop.value.trim(),
					search_wang = $wangDrop.value.trim();
				search_wang = search_wang//.toLowerCase();
				if(search_key == "" && search_wang == ""){
					return false;
				}else if(search_key == "" || search_wang == ""){
					$bd_share.innerHTML = "";
					return $bd_result.msg('请输入关键词和旺旺');
				};
				try{
					if(search_wang.match(/^(https?:\/\/)|(\/)/g) != null){
						var uri = S.parseUri(search_wang);
						if(uri.id){
							search_wang = uri.id;
						}
						search_wang = uri.id
					}
				}catch(e){};
				//添加关键词和域名查询记录
				record["key"].add(search_key);
				record["wang"].add(search_wang);
				if(!$filtitle.hasClass('on')){
					$filtitle.trigger('click');
				};
				//window.location="#username="+ encodeURIComponent(search_wang) +"&keyword="+ encodeURIComponent(search_key);
				custom.wang = search_wang;
				custom.key = search_key;
				window.location = custom.getUrl();
				doSearch(search_wang,search_key);
				//统计代码
				ui.refreshStatistics("tongjiqi");
			},
			//解析搜索结果
			exresult = function(inArr){
				var len = inArr.length
					, array = [];
				if(len == 0){
					return false;
				}else{
					for(var i=0; i<len; i++){
						array.push(inArr[i].r);
					};
				};
				return array.join(",");
			},
			//解析排名页数
			getPageRank = function(rank){
				rank = parseInt(rank);
				if (custom.shebei=='p') {
					if(rank <= 48){
						return 1;
					};
					return Math.ceil(rank / settings.size);
				}else{
					return Math.ceil(rank / settings.m_size);
				}
			}
			//执行搜索
			doSearch = function(wang,keyword){
				//请求队列初始化
				$fildrop.show();
				queue.init();
				//获取当前请求队列ID
				var curCount = (function(){
						return queue.count;
					})()
					, jgOff = false
					, $more				//加载更多按钮
					, reqing = settings.conreq;	//已发送的请求
				var pageJump = 1;//跳页
				if(!custom.page){
					pageJump = 1;
				}else{
					try{
						pageJump = parseInt(custom.page.match(/^[\d]+/)[0]);
					}catch(e){
						pageJump = 1;
					}
				};
				document.w
				$lieliuSp.show();
				settings.back = 0;			//初始化返回总数为0
				$wrap.removeClass("search_bg");
				$wangDrop.val(wang);
				$keyDrop.val(keyword);
				$bd_result.html("");
				
				

				document.title = wang +" "+ keyword +" - 淘宝排名";
				keyword = ui.filterSpecChr(keyword);
				var exeSearch = function(i,xf){
						
						var page1,page2,yeshu;
						if(custom.shebei=='p'){
							page1 = parseInt(i + pageJump);
							yeshu = '第&nbsp;'+ page1 +'&nbsp;页&nbsp;';
						}else{
							page1 = parseInt(i*settings.reqsize + pageJump);
							page2 = (i == settings.len - 1 ? (settings.len) * settings.reqsize  + pageJump - 1: ((i + 1) * settings.reqsize));
							if (i!=0) {
								page2 = page2>=Math.ceil(settings.count/settings.m_size)?Math.ceil(settings.count/settings.m_size):page2;
							};
							yeshu = '第&nbsp;'+ (page1 == page2 ? page1 : page1 +"-"+ page2) +'&nbsp;页&nbsp;';



						}
						
						var $ele = $("<ul class='wait'><em></em><span>查询中…</span></ul>")
							, callback = function(){
								//大于等于100不再显示更多

								if (page2>=100) return;
								settings.back++;
								//console.log(settings.len +','+ settings.conreq)
								if(settings.back == settings.conreq && settings.len > settings.conreq){
									$more =  $("<ul class='more'><em></em><span>继续查询</span><em></em>"+ (jgOff ? '' : '<a style="color:#F17474;float: none;" href=http://www.lieliu.com target=_blank>未找到商品，点此优化商品排名</a>') +"</ul>");
									$more.find('em,span').click(function(){
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
								}else if(settings.back == reqing && settings.back < settings.len){

									$more.fadeIn();
								}
							}
							, suberr = function(isfail){
								//查询失败后
								//if(isfail){
									addspm = !addspm;
								//};
								$ele.attr("class","err").html("<em></em><span>"+ (isfail ? '查询失败' : '查询超时') +"</span><a href='javascript:void(0);'>重试</a>").find('a').on("click",function(){
									doreq(i);
								});
								//第一次超时时追加一次请求
								if(!$ele.data('try')){
									return $ele.data('try',true).find('a').trigger('click');
								}
								callback();
							}
							, doreq = function(){
								$ele.attr("class","wait").html("<em></em><span>"+ yeshu +" 查询中…</span>");
								var url = custom.shebei === 'p' ? postUrl():  m_postUrl();
								var postData;
								if(custom.shebei === 'p'){
									postData = {
										'param': "id=" + new Date().getTime().toString(36) + new Date().getTime().toString(36) + "&type=TaobaoItemRank&url=" + url + "&filter=" + encodeURIComponent(wang) + "&first=" + ((page1 - 1) * settings.size + 1) + "&last=" + (page1 * settings.size)
									};
								}else{

									postData = {
										'param': "id=" + new Date().getTime().toString(36) + new Date().getTime().toString(36) + "&type=TaobaoAndroidItemRank" + url + "&filter=" + encodeURIComponent(wang) + "&first=" + ((page1 - 1) * settings.m_size + 1) + "&last=" + (page2 * settings.m_size)
									};

								}
								
								var doajax = req.s({
									//host:'//www.kehuda.com:1024/',
									url:"/web/taobao_rank",
									escape: false,
									data: postData

										/*'filter':wang
										, 'url': url
										, keyword:keyword
										, first: i * settings.reqsize * settings.size + 1
										, last: (i + 1) * settings.reqsize * settings.size 
										, count: 1*/
									
									, success:function(data){
										//d = testdata;
										if(curCount != queue.count){
											return;
										};
										if(data == '查询超时，请重试！'){
											suberr();
										}
										var result
											, $table = $('<div class="tbrk"></div>')
											, html = [];
										var d = data.kehuda;
										if(d.status == 1){
											try{
												d = $.parseJSON(d.data);
											}catch(e){
												d = {"a":1,"c":61519,"b":[]};
											};
											if(d.a === 9){
												return $ele.attr("class","err").html("<em></em><span>该关键词不支持查排名</span>");
											}
											//$ele.attr("class","err").html("<em></em><span>"+ d.tips +"</span>");
											if(d.c == -1){
												return suberr(true);
											}else if(d.c == 0){
												//JSONPieksu29b({"kehuda":{"data":"{\"a\":1,\"c\":0,\"f\":\"37517154065\",\"b\":[],\"p\":[{\"tc\":0,\"ps\":0,\"pn\":0,\"ru\":\"https://sec.taobao.com/query.htm?smApp=searchapp&smPolicy=searchapp-search_ajax-anti_Spider-checklogin&smCharset=UTF-8&smTag=MTE1LjU2LjM5LjIzLCw3MTg4MzI3NzM4NmQ0MGQyOTlmYTZlMDE2MDU1ODU4NA%3D%3D&smReturn=https%3A%2F%2Fs.taobao.com%2Fsearch%3Fajax%3Dtrue%26commend%3Dall%26ssid%3Ds5-e%26search_type%3Ditem%26sourceId%3Dtb.index%26tab%3Dall%26q%3D%25E9%25A9%25AC%25E5%258D%25A1%25E9%25BE%2599%26data-key%3Ds%26data-value%3D-1%26_ksTS%3D1442287630101_541%26initiative_id%3Dstaobaoz_20150915%26callback%3D%26s%3D0&smSign=nOpYr4FlaDggX8Kvrf%2FLVg%3D%3D\",\"ki\":0,\"kt\":\"\",\"kt\":\"\",\"ec\":\"\"}]}","tips":"获取成功！","status":"1"}});
												try{
													if(d.p[0].ru.indexOf('taobao.com') > 0){
														return suberr(true);
													}
												}catch(e){};
											}
											result = exresult(d.b);
											//匹配查询结果
											if(!result){
												$ele.attr("class","err").html("<em></em><span>"+ yeshu +"没有排名</span>");
											}else{
												jgOff = true;

												$ele.attr("class","plus").html("<div class='res'><em></em><span>排在第&nbsp;"+ result +"&nbsp;位&nbsp;</span></div><div class='th'><em class='extend'></em><span class='t'>标题</span><span class='r'>排名</span><span class='r'>页数</span><span class='r'>优化排名</span></div>");
												html.push('<table cellpadding="0" cellspacing="0"><tbody>');
												for(var k = 0,leng = d.b.length; k<leng; k++){
													d.b[k].a = getPageRank(d.b[k].r);
													//d.b[k].l = 'http://s.taobao.com/search?q='+ encodeURIComponent(keyword) +'&js=1&stats_click=search_radio_all%253A1&initiative_id=staobaoz_20141128&tab=all&s='+ (d.b[k].a == 1 ? 0 : (d.b[k].a - 1) * 44 + 4);
													html.push('<tr '+ (k % 2 == 0 ? 'class="dual"' : '') +'>');
													html.push('<td class="m"><img width=40 src="'+ d.b[k].p +'"></td>');
													html.push('<td class="t"><a href="http://item.taobao.com/item.html?id='+ d.b[k].i +'" target="_blank">'+ d.b[k].t +'</a></td>');
													//html.push('<td class="r tb"><b>'+ d.b[k].r +'</b></td>');付款或收货
													html.push('<td class="r"><b>'+ d.b[k].r +'</b></td>');
													html.push('<td class="r"><a href="'+ decodeURIComponent(url).replace('ajax=true&','') +'&s='+ ((d.b[k].a - 1 ) * (custom.shebei=='p'?settings.size:settings.m_size)) +'" target="new">'+ d.b[k].a +'</a></td>');
													html.push('<td class="r"><a href="http://www.lieliu.com" target="_blank">点此优化</a></td>');
													html.push('</tr>')
												};
												html.push('</table>');
												$ele.after($table.html(html.join(''))).on("click",function(){
													var blk = $(".res", $ele).css("display");
													$(".res", $ele).css("display",blk == "none" ? "block" : "none").siblings(".th").css("display",blk == "none" ? "none" : "block");
													//$ele.siblings(".plus").find(".res").css("display","block").siblings(".th").css("display","none");
													$table.slideToggle();//.siblings('.tbrk').slideUp();
												});
											};
											if(i == 0){
												if(result && wang.match(/^[\d]+$/) !== null){
													return false;
												}
												//写入总数量
												//settings.count = d.c == 0 ? 4400 : parseInt(d.c);
												settings.count = !d.c ? 0 : parseInt(d.c);
												//settings.count = 400;
												//写入总请求次数

												settings.len = Math.ceil(settings.count / (custom.shebei=='p'?settings.size:settings.m_size) / (custom.shebei=='p' ? 1 :settings.reqsize));

												if(custom.page){
													try{

														var pageEnd = Math.ceil((parseInt(custom.page.match(/\,([\d]+)$/)[1]) - pageJump + 1)/ (custom.shebei=='p' ? settings.reqsize : 1));
														settings.len = settings.len > pageEnd ? pageEnd : settings.len;
													}catch(e){}
												}
												for(var j=1,leng = settings.len < settings.conreq ? settings.len : settings.conreq; j<leng; j++){
													exeSearch(j,0);
												};
											};
										}else if(d.status == 5){
											suberr();
										}else if(d.status == 9){
											$ele.attr("class","err").html("<em></em><span>您输入的关键词不支持查询排名。</span>")
										}else{
											$ele.attr("class","err").html("<em></em><span>"+ d.tips +"</span>")
										};
										callback();
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
					wrap:$bd_share
					, href:"http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="+ encodeURIComponent("http://www.kehuda.com/"+ custom.getUrl()) +"&title="+ encodeURIComponent(wang +" "+ keyword +" - "+ '淘宝排名') +"&desc=&summary=%e5%ae%a2%e6%88%b7%e8%be%be+-+%e7%94%b5%e5%95%86%e5%b7%a5%e5%85%b7"
					, type: 'taobao'
				});
				//从第一页开始查询
				exeSearch(0);

			};
		//根据参数执行查询
		if(custom.wang && custom.key){
			doSearch(custom.wang, custom.key);
		}else{
			$wrap.addClass("search_bg");
		};
		$bd_result.msg = function(text){
			$bd_result.html("<div class='msg'><em></em><span>"+ text +"!</span></div>");
			return false;
		};
		//绑定回车事件
		ui.bindEnter([$keyDrop.input,$wangDrop.input],submitSearch);
		$search_btn.click(submitSearch);
		if((custom.sort || custom.price || custom.loc) && !$filtitle.hasClass('on')){
			$filtitle.trigger('click')
		}
		//设备选择
		$('#goodsDevi a').click(function(){
			var $this = $(this);
			custom.shebei = $this.data('value');
			$this.addClass('current').siblings('a').removeClass('current');
		}).eq(custom.shebei === 'm' ? 0 : 1).trigger('click');
		//console.log(custom.shebei);
		//排序选择
		var locsort = custom.shebei == 'm'?m_sortMap(custom.sort):custom.sort;
		$('#goodsSort a').click(function(){
			var $this = $(this);
			if (custom.shebei == 'm') {
				if (sortMap($this.data('value'))) {
					custom.sort = sortMap($this.data('value'));
				}else{
					custom.sort = ''
				};
			}else{
				custom.sort = $this.data('value');
			}
			locsort = $this.data('value');
			$('.form-radio').find('label b').html($this.html())
			$this.addClass('current').siblings('a').removeClass('current');
			$(this).parents('.devi-citys').hide().parent().removeClass('form-hover');
			return false;
		});
		if(locsort){
			$('#goodsSort a[data-value="'+ locsort +'"]').trigger('click');
		};

		//选中发货地
		var $citys = $('.form-citys a').click(function(){
			var $this = $(this);
			$citys.removeClass('current');
			custom.loc = $this.addClass('current').text();
			custom.loc = custom.loc == '不限' ? false : custom.loc;
			$this.parents('.form-loc').find('b').text(!custom.loc ? '发货地' : custom.loc);
			$(this).parents('.form-citys').hide().parent().removeClass('form-hover');
			return false;

		});
		if(custom.loc){
			$('.form-citys a:contains("'+ custom.loc +'")').trigger('click');
		};
		var $renqi = $("a[data-value=renqi-desc]");
		$('.form-loc,.form-radio').hover(function(ev){
			var _this = this
				, $this = $(_this);
			_this._h = true;
			
			setTimeout(function(){
				if(_this._h){
					$this.addClass('form-hover');
					$this.find('.txtList').show();
				};
			}, 100);
			
			//判断人气参数是否显示
			if ($this.index()==1) {
				if (custom.shebei == 'm') {
					$this.addClass('form-sort');
					$renqi.hide();
				}else{
					$this.removeClass('form-sort');
					$renqi.show();
				}
			}
			
		}, function(){
			this._h = false;
			$(this).removeClass('form-hover');
			$(this).find('.txtList').hide();
		}).click(function(){
			var $this = $(this);
			$this.addClass('form-hover');
			$this.find('.txtList').show();
		})
		//价格区间
		var $priceInput = $('input.price', $fildrop);
		if(custom.price){
			try{
				$priceInput.each(function(index){
					this.value = custom.price[index];
				})
			}catch(e){}
		}
		$priceInput.on('keyup', function(){
			var $this = $(this);
			$this.val($this.val().replace(/[^\d]/ig,''));
			var arr = [];
			$priceInput.each(function(){
				arr.push($(this).val());
			});
			custom.price = arr;
		});
		//选择价格和页面区间
		/*$('[data-ui]').each(function(){
			var $this = $(this)
				, data = $this.data('slider');
			if($this.data('ui').type == 'nouislider'){
				var $slider = $this.find('.noUiSlider')
					, $min = $this.find('.'+ data.field +'_min')
					, $max = $this.find('.'+ data.field +'_max');
				if(custom[data.field]){
					var arr = custom[data.field].split(',');
					$min.text(arr[0]);
					$max.text(arr[1]);
					data.start = arr;
				};
				Slider.call($slider, {
					range: [data.min, data.max]
					, start: data.start
					, 'step': 1
					, 'handles': 2
					, 'connect': true
					, slide: function() {
						var values = $(this).val();
						$min.text(values[0]);
						$max.text(values[1]);
						custom[data.field] = values[0] +','+ values[1];
					}

				});
			}
		});*/
		$fildrop.show();
		ui.loadUI();
	});
},["kehuda/utils", "common/require","kehuda/navbar"]);
