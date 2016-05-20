Fengs.add('kehuda/mobile/jiangquan', function(S, $, ui, req, Template){
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
		var $wrap = $("section")
			, $search_btn = $(".but-search", $wrap)
			, $drop = ui.drop($(".drop", $wrap), record)[0]
			, timer = 0
			, $bd_result = $(".jq-result", $wrap)
			, $loding = $('.khd-result')
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
			, doSearch = function(keyword){
				$imgLink.hide();//光碟隐藏
				$loding.addClass('k-loding');
				$drop.val(keyword);
				document.title = keyword +" - 淘宝降权";
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$bd_result.html('<div class="waiting"></div>');
				keyword = ui.filterSpecChr(keyword);
				req.s({
					//host:'//www.kehuda.com:1024/',
					url:"/web/taobao_down_right",
					data:{'nick':keyword},
					success:function(d){
						d = d.kehuda;
						$loding.removeClass('k-loding');
						if(d.status == -9){
							return $bd_result.msg(d.tips);
						}else if(d.status == 1){
							d.list = sort(d.list,"r",0);
							console.log($bd_result)
							$bd_result.html(Template('jqtemp', d));
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
		};
		$bd_result.msg = function(text){
			$bd_result.removeClass('k-loding').html('<ul class="k-result-ul"><li class="msg">'+ text +'!</li></ul>');
		};
		//绑定回车事件
		ui.bindEnter([$drop.input],submitSearch);
		$search_btn.on('click', submitSearch);
		ui.init();
	});
},["./common","common/require", 'plus/art-template']);
