Fengs.add('kehuda/gongju/jiangquan', function(S, $, ui, req){
	var record = new ui.record({prefix:"kehuda_taojq_",key:["wang"]})
		, sort=function(inArray,attr,order){
			var sortBy = function (filed, reverse, primer) {  
				reverse = (reverse) ? -1 : 1;  
				return function(a,b){
					a = a[filed];
					b = b[filed];
					/*if (typeof (primer) != "undefined"){
						a = primer(a);
						b = primer(b);
					};*/
					if (a < b){  
						return reverse * -1;  
					}else{  
						return reverse * 1;  
					};  
				};
			};
			inArray.sort(sortBy(attr, order, parseInt));
			return inArray;
		};
	$(document).ready(function(){
		//alert(String("终恨水天"));
		var $wrap = $(".search_wrap")
			, $search_btn = $("button",$wrap)
			, $drop = ui.drop($(".drop",$wrap),record)[0]
			, timer = 0
			, $bd_result = $(".jq_result",$wrap)
			, $bd_share = $(".bd_share",$wrap)
			, $lieliuSp = $('.lieliu-sp')
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
			, doSearch = function(keyword){
				$('#ad360').show();
				$lieliuSp.show();
				$wrap.removeClass("search_bg");
				$drop.val(keyword);
				document.title = keyword +" - 淘宝降权";
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$bd_result.html('<div class="waiting"></div>');
				keyword = ui.filterSpecChr(keyword);
				// id:new Date().getTime()
				req.s({
					//host:'//www.kehuda.com:1024/',
					url:"/web/taobao_down_right",
					data:{nick:keyword},
					success:function(d){
						var html = [],sellrank,buyrank,usernick,isseller = false,istmall = false;
						d = d.kehuda;
						if(d.status == -9){
							return $bd_result.msg(d.tips);
						}else if(d.status == 1){
							d.list = sort(d.list,"r",0);
							html.push('<table class="jqtable"  cellpadding="0" cellspacing="0">');
							html.push('<tr><th colspan="2">商品名称</th><th>销量</th><th>权重</th><th>状态</th></tr>')
							for(var i=0; i<d.list.length;i++){
								html.push('<tr class="'+ (i%2==0?'':'dual') +'"><td class="m"><img src="'+ d.list[i].m+'_40x40.jpg"/></td><td class="t"><a  href="http://item.taobao.com/item.html?id='+d.list[i].d+'" target="_blank">'+ d.list[i].t +'</a></td><td class="p">'+ d.list[i].n +'</td><td class="r'+ (d.list[i].r>=0?'':' e')+'">'+ d.list[i].r +'</td><td class="s">'+ (d.list[i].r>=0?'<a title=正常></a>':"<a class='b' href='http://www.lieliu.com' target='_blank'>优化权重</a>") +'</td></tr>');
							};
							$bd_result.html(html.join(""));
							//分享和收藏
							ui.share({
								wrap:$bd_share
								,href:"http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url="+ encodeURIComponent("http://www.kehuda.com/g/j/#username="+ encodeURIComponent(keyword))+"&title="+ encodeURIComponent(keyword +" - 淘宝降权") +"&desc=&summary=%e5%ae%a2%e6%88%b7%e8%be%be+-+%e7%94%b5%e5%95%86%e5%b7%a5%e5%85%b7"
							});
						}else{
							$bd_result.html('<div class="infomation"><div class="wait">'+ d.tips +'</div></div>');
						}
					},
					error:function(e){
						$bd_result.msg('查询超时');
					}
				});
			};
		//根据参数执行查询
		var uri = new S.parseUri(window.location.href,"#");
		if(uri.username){
			doSearch(decodeURIComponent(uri.username));
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
		$search_btn.click(submitSearch);
		ui.loadUI();
	});
},["kehuda/utils","common/require","kehuda/navbar"]);
