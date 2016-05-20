Fengs.add('kehuda/api/tbrank', function(S, $, req, ui, lang){
	var queue = new ui.queue();
	var wrapId = 'kehuda_result'
	var exresult = function(inArr){
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
			if(rank <= 48){
				return 1;
			};
			return Math.ceil(rank / settings.size);
		}
		, settings = {
			timer: 0					//计数器
			, len: 0 					//总请求次数
			, reqsize: 2				//每次查询条数
			, size: 44					//
			, back: 0 				//查询返回条数
			, count: 24 				//总数量
			, onereq: 5 				//
			, conreq: 5 				//首次查询条数
			, subOut: 2000		//设置搜索间隔
			, reqOut: 1000			//每次请求数据的间隔
		};
	var Rank = function(query){
		var uri = new S.parseUri('?'+ query);
		this.key = decodeURIComponent(ui.filterSpecChr(uri.key));
		this.wang = decodeURIComponent(ui.filterSpecChr(uri.id));
		
		//请求队列初始化
		queue.init();
		//获取当前请求队列ID
		this.curCount = (function(){
				return queue.count;
			})();
		this.reqing = settings.conreq;	//已发送的请求
		settings.back = 0;			//初始化返回总数为0
		/*$wrap.removeClass("search_bg");
		$wangDrop.val(wang);
		$keyDrop.val(keyword);
		$wrap.html("");*/
		this.exe(0);
		return this;
	};
	Rank.prototype = {
		wrap: null
		, more: null
		, exe: function(i, xf){
			var _this = this
				, reqing = _this.reqing
				, self = arguments.callee
				, $wrap = $('#'+ wrapId)
				, $more;
			var yeshu = parseInt(i*settings.reqsize+1) +"-"+ (i == settings.len - 1 ? settings.len * settings.reqsize : ((i + 1) * settings.reqsize));
			var $ele = $("<div class='kehuda_result_ul kehuda_result_wait'><div class='kehuda_result_em'></div><div class='kehuda_result_span'>"+ yeshu +"页&nbsp;"+lang.log(13)+"</div></div>")
				, callback = function(){
					settings.back++;
					if(settings.back == settings.conreq && settings.len > settings.conreq){
						$more =  $("<div class='kehuda_result_ul kehuda_result_more'><div class='kehuda_result_em'></div><span>更多</div><div class='kehuda_result_em'></div></div>");
						$more.click(function(){
							if(settings.back < reqing - 3){
								return;
							}
							reqing = settings.len - settings.back > settings.onereq ? settings.back + settings.onereq : settings.len;
							for(var k = settings.back; k<reqing; k++){
								_this.exe(k,settings.back);
							};
							if(reqing >= settings.len){
								$more.remove();
							}else{
								$more.hide();
							};
						});
						$wrap.append($more);
					}else if(settings.back == reqing && settings.back < settings.len){
						$more.fadeIn();
					}
				}
				, suberr = function(){
					$ele.attr("class","err").html("<div class='kehuda_result_em'></div><div class='kehuda_result_span'>"+lang.log(4)+"</div><a href='javascript:void(0);' target='new'>"+lang.log(5)+"</a>").find('a').on("click",function(){
						doreq(i);
					});
					callback();
				}
				, doreq = function(){
					$ele.attr("class","kehuda_result_ul kehuda_result_wait").html("<div class='kehuda_result_em'></div><div class='kehuda_result_span'>"+ yeshu +"页&nbsp;"+lang.log(13)+"</div>");
					var keyword = _this.key;
					var doajax = req.s({
						url:"/web/taobao_rank",
						type:'jsonp',
						data:{
							filter: _this.wang
							, keyword: keyword
							, first: i * settings.reqsize * settings.size + 1
							, last: (i + 1) * settings.reqsize * settings.size 
							, count: 1
						}
						, success:function(d){
							//d = testdata;
							if(_this.curCount != queue.count){
								return;
							}
							var result
								, $table = $('<div class="kehuda_result_table"></div>')
								, html = [];
							d = d.kehuda;
							if(d.status == 1){
								d = d.data;
								$ele.attr("class","kehuda_result_err").html("<div class='kehuda_result_em'></div><span>"+ d.tips +"</span>");
								result = exresult(d.b);
								//匹配查询结果
								if(!result){
									$ele.attr("class","kehuda_result_ul kehuda_result_err").html("<div class='kehuda_result_em'></div><span>"+ yeshu +"页 没有排名</span>");
								}else{
									$ele.attr("class","kehuda_result_ul kehuda_result_plus").html("<div class='res'><div class='kehuda_result_em'></div><span>"+lang.log(7) + result + lang.log(6) +"&nbsp;</span></div><div class='th'><em class='extend'></em><span class='t'>商品名称</span><span class='r'>排名</span><span class='r'>页数</span></div>");
									html.push('<table cellpadding="0" cellspacing="0"><tbody>');
									for(var k = 0,leng = d.b.length; k<leng; k++){
										d.b[k].a = getPageRank(d.b[k].r);
										//d.b[k].l = 'http://s.taobao.com/search?q='+ encodeURIComponent(keyword) +'&js=1&stats_click=search_radio_all%253A1&initiative_id=staobaoz_20141128&tab=all&s='+ (d.b[k].a == 1 ? 0 : (d.b[k].a - 1) * 44 + 4);
										html.push('<tr '+ (k % 2 == 0 ? 'class="dual"' : '') +'>');
										html.push('<td class="m"><img src="'+ d.b[k].p +'_40x40.jpg"></td>');
										html.push('<td class="t"><a href="http://item.taobao.com/item.html?id='+ d.b[k].i +'" target="_blank">'+ d.b[k].t +'</a></td>');
										html.push('<td class="r"><b>'+ d.b[k].r +'</b></td>');
										html.push('<td class="r"><a href="http://s.taobao.com/search?q='+ encodeURIComponent(keyword)+'&s='+ ((d.b[k].a - 1 ) * settings.size) +'" target="new">'+ d.b[k].a +'</a></td>');
										html.push('</tr>')
									};
									html.push('</table>');
									$ele.after($table.html(html.join(''))).on("click",function(){
										var blk = $(".res", $ele).css("display");
										$(".res", $ele).css("display",blk == "none" ? "block" : "none").siblings(".th").css("display",blk == "none" ? "none" : "block");
										$ele.siblings(".plus").find(".res").css("display","block").siblings(".th").css("display","none");
										$table.slideToggle().siblings('.kehuda_result_table').slideUp();
									});
								};
								if(i == 0){
									//写入总数量
									settings.count = parseInt(d.c);
									//settings.count = 400;
									//写入总请求次数
									settings.len = Math.ceil(settings.count / settings.size / settings.reqsize);
									console.log(settings.len);
									for(var j=1,leng = settings.len < settings.conreq ? settings.len : settings.conreq; j<leng; j++){
										_this.exe(j,0);
									};
								};
							}else if(d.status == 5){
								suberr();
							}else{
								$ele.attr("class","kehuda_result_ul kehuda_result_err").html("<div class='kehuda_result_em'></div><div class='kehuda_result_span'>"+ d.tips +"</span>");
							};
							callback();
						},
						error:function(e){
							suberr();
						}
					});
					queue.add(doajax);
				};
			$wrap.css('background','red')
			if(!$more){
				$wrap.append($ele);
			}else{
				$more.before($ele);
			}
			setTimeout(function(){
				if(_this.curCount != queue.count){
					return;
				}
				doreq();
			}, (i - xf) * settings.reqOut);
		}
	};
	return Rank;
}, ['common/require', 'kehuda/utils', 'kehuda/language','common/utils']);