Fengs.add('kehuda/gongju/leimu', function(S, $, ui, req){
	$(document).ready(function(){
		var $wrap = $(".search_wrap")
			, $search_btn = $wrap.find("button",$wrap)
			, $input =$("input",$wrap)
			, $bd_result = $(".ct_result",$wrap)
			, $lieliuSp = $('.lieliu-sp')
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
				$('#ad360').show();
				$lieliuSp.show();
				$wrap.removeClass("search_bg");
				//$bd_result.html('<div class="infomation"><div class="wait"><img src="/images/lording_16.gif"/>&nbsp;查询中…</div></div>');
				$bd_result.html('<div class="waiting"></div>');
				req.s({
					url:"/web/taobao_category",
					method:"GET",
					data:{id:id, site: site},
					success:function(d){
						d = d.kehuda;
						if(d.status == 1){
							$bd_result.html("<div class='t'>宝贝标题："+ d.title +"</div><div class='n'>所属类目："+ d.name.replace(/\,/g,"<img src='/images/arrow.gif'/>") +"</div>");
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
			$wrap.addClass("search_bg");
			$bd_result.html("<div class='msg'><em></em><span>"+ text + (text.indexOf('！') >= 0 ? "" : '！')+ "</span></div>");
			return false;
		};
		//绑定回车事件
		ui.bindEnter([$input],submitSearch);
		$search_btn.click(submitSearch);
		ui.loadUI();
	});
},["kehuda/utils","common/require","kehuda/navbar"]);
