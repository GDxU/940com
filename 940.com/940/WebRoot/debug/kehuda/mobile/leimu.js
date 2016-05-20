Fengs.add('kehuda/mobile/leimu', function(S, $, ui, req, Template){
	$(document).ready(function(){
		var $wrap = $("section")
			, $search_btn = $(".but-search", $wrap)
			, $input =$("input", $wrap)
			, $bd_result = $(".lm-result", $wrap)
			, $imgLink = $('.imgLink', $wrap)
			, timer = 0
			//提交查询
			, submitSearch = function(){
				var search_key = $input.val().trim();
				if(search_key == "" || search_key == $input.attr("placeholder")){
					return false;
					//return $bd_result.msg('请输入宝贝链接');
				}else if(!S.test(search_key,"url")){
					return $bd_result.msg('宝贝链接格式错误');
				}
				var uri = new S.parseUri(search_key,"?");
				if(!uri.id){
					return $bd_result.msg('宝贝链接格式错误');
				}
				if(timer > 0){
					return;
				};
				timer = 1;
				setTimeout(function(){
					timer = 0;
				},2000);
				var site = search_key.match(/(tmall|taobao)/);
				if(!uri.id || site == null){
					return $bd_result.msg('不合法的URL地址');
				}
				doSearch(uri.id, site[0]);
				//统计代码
				ui.refreshStatistics("tongjiqi");
			}
			, doSearch = function(id, site){
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$imgLink.hide();//光碟隐藏
				$bd_result.addClass('k-loding');
				req.s({
					url:"/web/taobao_category",
					type: 'jsonp',
					data:{id:id, site: site},
					success:function(d){
						$bd_result.removeClass('k-loding');
						d = d.kehuda;
						if(d.status == 1){
							$bd_result.html(Template('lmtemp', d));
						}else{
							$bd_result.msg(d.tips);
						};
					},
					error:function(e){
						suberr();
					}
				});
			};
		$input.on({
			"focus":function(e){
				this.focused=true;
				this.select();
			},
			"mouseup":function(e){
				if(this.focused){
					e.stopPropagation();
					this.focused=false;
					return false;
				};
			}
		});
		$bd_result.msg = function(text){
			$bd_result.removeClass('k-loding').html('<ul class="k-result-ul"><li class="msg">'+ text +'!</li></ul>');
		};
		//绑定回车事件
		ui.bindEnter([$input],submitSearch);
		$search_btn.on('click', submitSearch);
	});
	ui.init();
},["./common","common/require","plus/art-template"]);
