Fengs.add('kehuda/gushi/baoming', function(S, $, ui, lang, provinceSelector, Calendar, req){
	$(document).ready(function(){
		var issubmited = false
			,$subbtn = $(".subbtn")
			,$name = $("#name")
			,$brithday = $("#brithday")
			,$mobile = $("#mobile")
			,$qq = $("#qq")
			,$wechat = $("#wechat")
			,$city = new provinceSelector($("#city"))
			,$website = $("#website")
			,$company = $("#company")
			,$rensu = $("#rensu")
			,$story = $("#story")
			,$pride = $("#pride")
			,$dream = $("#dream")
			,sp = "Ψ"
			,$implants = $("select");
		$brithday.click(function(){
			return Calendar('brithday', 'y-mm-dd');
		})
		$subbtn.click(function(){
			if(issubmited){
				ui.openWarn("请勿重复提交");
				return;
			};
			if(ui.checkform()){
				var str = "姓名:"+ $name.val().trim() + sp + "生日:"+ $brithday.val().trim() +sp+"手机:"+ $mobile.val().trim() +sp+ "QQ:"+ $qq.val().trim() +sp+ "微信:"+ $wechat.val().trim() + sp+ "省市:" + $city.val()+ sp+"网站:" + $website.val().trim()+ sp+ "公司名称:" + $company.val().trim()+ sp+ "职工人数:" + $rensu.val().trim() + sp+ "创业经历:" + $story.val().trim() + sp+"最自豪的事:" + $pride.val().trim() + sp+ "梦想:" +$dream.val().trim() + sp + "品牌展示:"+$implants.val().trim() +"秒";
				if($city.val() == ""){
					ui.openWarn("请选择城市");
				}else{
					req.s({
						url:"/cd/suggest_add",
						data:{type:100,content:str,format:"json",sign0:"content"},
						success:function(d){
							d = d.kehuda;
							ui.openWarn(d.tips);
							if(d.status == "1"){
								issubmited = true;
							};
						}
					});
				};
			};
		});
		ui.loadUI();
	});
},["kehuda/utils", "kehuda/language", "kehuda/ui/provinceselector", "kehuda/ui/calendar","common/require", "kehuda/ui/base", "kehuda/navbar"]);
