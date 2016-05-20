Fengs.add('kehuda/kaidian/zhengshu', function(S, $, ui){
	var record = new ui.record({prefix:"certificates_",key:["id","seller"]});
	$(document).ready(function(){
		var uri = new S.parseUri(window.location.href,"#")
			, $wrap = $(".licence")
			$drop = ui.drop($(".drop",$wrap),record),
			$idDrop = $drop[0],
			timer = 0,//计数器
			$sellerDrop = $drop[1],
			$search_btn = $("button", $wrap),
			$notice = $(".tc", $wrap),
			msg = function(text){
				$wrap.addClass("search_bg");
				$notice.html("<div class='msg'><em></em><span>"+ text +"!</span></div>");
				return false;
			},
			doSearch = function(id,seller,type){
				$idDrop.val(id);
				$sellerDrop.val(seller);
				$wrap.removeClass("search_bg");
				uri = new S.parseUri(window.location.href,"#");
				if(!uri.type){
					type=/[\d|a-z]{2,4}\/[a-zA-Z]\//.exec(window.location.href);
					type=type[0].replace(/[\d|a-z]{2,4}/g,"").replace(/\//ig,"");
					type = type == "k" ? 2 : 3;
				}else{
					type = uri.type;
				}
				$notice.html("<i></i><img src='/licence/image.jpg?id="+ id +"&seller="+ seller +"&type="+ type +"'/>");
			},
			//提交查询
			submitSearch = function(){
				var search_id = $idDrop.value.trim()
					, search_seller = $sellerDrop.value.trim(),
				search_seller = search_seller.toLowerCase();
				if(search_id == "" && search_seller == ""){
					return false;
				}else if( search_id == "" || search_seller == ""){
					return msg('证书类型/证书编号/旺旺名称都不能为空');
				}else if(!S.test(search_id,"number")){
					return msg('证书编号格式错误');
				};
				timer = 1;
				setTimeout(function(){
					timer = 0;
				},2000);
				//添加关键词和域名查询记录
				record["id"].add(search_id);
				record["seller"].add(search_seller);
				window.location="#id="+ search_id +"&seller="+ encodeURIComponent(search_seller)
				doSearch(search_id,search_seller);
			};
		//根据参数执行查询
		if(uri.id && uri.seller){
			doSearch(uri.id,decodeURIComponent(uri.seller));
		}else{
			$wrap.addClass("search_bg");
		};
		//绑定回车事件
		ui.bindEnter([$idDrop.input,$sellerDrop.input],submitSearch);
		$search_btn.click(submitSearch);
		ui.loadUI();
	});
},["kehuda/utils", "kehuda/navbar"]);
