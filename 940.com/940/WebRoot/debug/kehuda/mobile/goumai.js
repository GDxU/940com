Fengs.add('kehuda/mobile/goumai', function(S, $, ui, req){
	var minCount = 18
		, lineCount = 3;
	$(document).ready(function(){
		req.s({
			//host:'//www.kehuda.com:1024/',
			url:"/web/khd_seller_list",
			data:{"username":"admin@sududa.com","timestamp":(new Date()).getTime()},
			success:function(d){
				d = d.kehuda;
				if(d.status == 1){
					var list=d.list.l;
					var html = new Array;
					html.push("<tr>");
					var len= Math.ceil(list.length / lineCount) * lineCount
						, level;
					for(var i=0;i<len;i++)
					{
						var obj=list[i];
						if(i>0 && i%lineCount ==0)
						{
							html.push("</tr>");
							html.push("<tr>");
						}
						html.push("<td "+ (i % lineCount == 0 ? 'class="f"' : '')+">");
						if(!obj){
							html.push('&nbsp;')
						}else{
							html.push("<a target='_blank' title='点我发消息' href='"+obj.u+"'><img border='0' src='http://amos.alicdn.com/online.aw?v=2&uid="+encodeURIComponent(obj.w)+"&site=cntaobao&s=2&charset=utf-8'/>&nbsp;"+obj.w+"</a>");
						}
						html.push("</td>");
					}
					html.push("</tr>");	
					$("#container").append(html.join("\n"));
				}
			}
		});
		ui.init();
	});
},["./common","common/require"]);
