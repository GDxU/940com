Fengs.add('zx/inc/course', function(S, $){
	var arr = [
		[
			{
				title:"如何开通软件，如何采购激活码"
				,url:"http://63.www27.babidou.com/pic/2013/4/28/sududa/ZX/1.gif"
				,down:"2_%E5%A6%82%E4%BD%95%E5%BC%80%E9%80%9A%E8%BD%AF%E4%BB%B6%EF%BC%8C%E5%A6%82%E4%BD%95%E9%87%87%E8%B4%AD%E6%BF%80%E6%B4%BB%E7%A0%81"
				,width:1190
			},
			{
				title:"如何加款，提现，转账"
				,url:"http://63.www27.babidou.com/pic/2013/4/28/sududa/ZX/2.gif"
				,down:"1_%E5%A6%82%E4%BD%95%E5%8A%A0%E6%AC%BE%EF%BC%8C%E6%8F%90%E7%8E%B0%EF%BC%8C%E8%BD%AC%E8%B4%A6"
				,width:1190
			},
			{
				title:"如何绑定店铺及设计店招"
				,url:"http://18.www27.babidou.com/pic/2013/4/28/sududa/3.gif"
				,down:"3_%E5%A6%82%E4%BD%95%E7%BB%91%E5%AE%9A%E5%BA%97%E9%93%BA%E5%8F%8A%E8%AE%BE%E8%AE%A1%E5%BA%97%E6%8B%9B"
				,width:1180
			},
			{
				title:"如何替换海报图片及上传图片"
				,url:"http://63.www27.babidou.com/pic/2013/4/28/sududa/ZX/4.gif"
				,down:"4_%E5%A6%82%E4%BD%95%E6%9B%BF%E6%8D%A2%E6%B5%B7%E6%8A%A5%E5%9B%BE%E7%89%87%E5%8F%8A%E4%B8%8A%E4%BC%A0%E5%9B%BE%E7%89%87"
				,width:1190
			},
			{
				title:"如何展示自己的宝贝"
				,url:"http://63.www27.babidou.com/pic/2013/4/28/sududa/ZX/5.gif"
				,down:"5_%E5%A6%82%E4%BD%95%E5%B1%95%E7%A4%BA%E8%87%AA%E5%B7%B1%E7%9A%84%E5%AE%9D%E8%B4%9D"
				,width:1180
			},
			{
				title:"如何替换旺旺和配置旺旺模块"
				,url:"http://63.www27.babidou.com/pic/2013/4/28/sududa/ZX/6.gif"
				,down:"6_%E5%A6%82%E4%BD%95%E6%9B%BF%E6%8D%A2%E6%97%BA%E6%97%BA%E5%92%8C%E9%85%8D%E7%BD%AE%E6%97%BA%E6%97%BA%E6%A8%A1%E5%9D%97"
				,width:1180
			}
			
		]
	];
	var $a = $("h3 a")
		, $list = $(".guide")
		, $ol
		, $li;
	for(var i=0,len=arr.length;i<len;i++){
		$ol = $("<ol></ol>");
		$list.append($ol);
		for(var j=0,leng=arr[i].length;j<leng;j++){
			$li = $("<li><em>"+ (j+1) +"</em><span>"+ arr[i][j].title +"</span><a target='_blank' class='save' href='http://video.sududa.com/ZX_Video/"+ arr[i][j].down +".exe'>点此下载</a><a class='play' href='/guide?source="+ escape(arr[i][j].url) +"&title="+ escape(arr[i][j].title) +"&w="+ arr[i][j].width +"' target='_blank'>在线播放</a></li>");
			$ol.append($li);
		}
	};
	$ol = $list.find("ol");
	var toggle = function(index){
		$a.removeClass("cur").eq(index).addClass("cur");
		$ol.css("display","none").eq(index).css("display","block");
	};
	$a.click(function(){
		toggle($(this).index());
	});
	toggle(0);
	$("#lording").remove();
});