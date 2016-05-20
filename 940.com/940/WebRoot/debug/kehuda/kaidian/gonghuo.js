Fengs.add('kehuda/kaidian/gonghuo', function(S, $, ui, req){
	var list = [{"id":"1","name":"服装","list":{"l":[{"i":"1","n":"男装"},{"i":"22","n":"女装"},{"i":"10","n":"内衣"},{"i":"23","n":"童装"},{"i":"9","n":"情侣装"},{"i":"49","n":"家居服"}]}},{"id":"2","name":"鞋袜","list":{"l":[{"i":"25","n":"女鞋"},{"i":"24","n":"男鞋"},{"i":"26","n":"童鞋"},{"i":"43","n":"袜子"},{"i":"148","n":"皮带"},{"i":"50","n":"帽子"},{"i":"190","n":"手套"}]}},{"id":"3","name":"包包","list":{"l":[{"i":"2","n":"男包"},{"i":"27","n":"女包"}]}},{"id":"4","name":"小商品","list":{"l":[{"i":"14","n":"日用百货"},{"i":"38","n":"定制礼品"},{"i":"64","n":"小饰品"},{"i":"3","n":"手表"},{"i":"171","n":"眼镜"}]}},{"id":"5","name":"食品","list":{"l":[{"i":"45","n":"茶叶"},{"i":"4","n":"酒类"},{"i":"13","n":"熟食"},{"i":"29","n":"干果"}]}},{"id":"6","name":"化妆品","list":{"l":[{"i":"5","n":"洗面奶"},{"i":"6","n":"BB霜"},{"i":"30","n":"面膜"},{"i":"31","n":"爽肤水"},{"i":"32","n":"粉底"},{"i":"33","n":"防晒霜"}]}},{"id":"7","name":"电子产品","list":{"l":[{"i":"7","n":"手机"},{"i":"211","n":"电脑外设"},{"i":"37","n":"移动电源"},{"i":"40","n":"胎压监测仪"},{"i":"35","n":"平板电脑"},{"i":"42","n":"耳机"},{"i":"170","n":"音响"},{"i":"8","n":"配件"},{"i":"11","n":"存储卡"},{"i":"212","n":"行车记录仪"}]}},{"id":"8","name":"其他","list":{"l":[{"i":"65","n":"软件"},{"i":"39","n":"运动器材"},{"i":"41","n":"家纺"},{"i":"44","n":"小家电"},{"i":"16","n":"宠物用品"},{"i":"46","n":"液压器"}]}}];
	var cateSelecter = function(id){
			return {
				wrap:$("#"+id),
				drop:$('<div class="cl_drop"></div>'),
				count:0,
				close:function(){
					this.drop.slideUp();
				},
				open:function(){
					this.drop.slideDown();
				},
				val:function(){
					var arr=[];
					this.wrap.find("a b").each(function(){
						arr.push($(this).text());
					});
					return arr;
					
				},
				removeItem:function(e){
						var $a = $(e.target).parent()
							,_this = this;
						$a.animate({width:0},200,"linear",function(){
							$a.remove();
							_this.drop.find("#"+ $a.attr("rel")).removeClass("disabled");
							_this.count--;
						});
				},
				selectItem:function(e){
					var $this = $(e.target);
					if($this.hasClass("disabled")){return false;};
					if(this.count >= 5){
						return ui.openWarn("最多选择5个类目");
					}
					this.count++;
					$this.addClass("disabled");
					this.wrap.append("<a class='tags' rel='"+ $this.attr("id") +"'><b>"+ $this.text() +"</b><span title='删除'>×</span></a>");
					
				},
				addItem:function(){
					var val = this.drop.find("input").val();
					if(val != ""){
						if($.inArray(val,this.val()) >= 0){
							return ui.openWarn("请勿重复提交相同的类目");
						};
						var ele = this.drop.find("a:contains("+ val +")");
						if(ele.length == 0){
							if(this.count >= 5){
								return ui.openWarn("最多5个类目");
							};
							this.count++;
							this.wrap.append("<a class='tags' rel='no'><b>"+ val +"</b><span title='删除'>×</span></a>");
							this.drop.find("input").val("")
						}else{
							ele.trigger("click");
							this.drop.find("input").val("")
						};
					};
				},
				init:function(){
					var _this = this,html;
					//写入HTML
					this.wrap.append('<a class="tags plus">选择</a>').after(this.drop);
					for(var i=0;i<list.length; i++){
						html = [];
						html.push("<ul>");
						html.push("<span>"+ list[i].name +"：</span>");
						for(var j=0; j<list[i].list.l.length; j++){
							html.push("<a id='a"+ list[i].list.l[j].i +"'>"+list[i].list.l[j].n+"</a>");
						};
						html.push("</ul>");
						this.drop.append(html.join(""));
					};
					this.drop.append("<ul><span>自定义：</span><input type='text' placeholder='请输入你自定义的供货类目' size='30'/><button>确定</button><em>×</em></ul>")
						.on("click","em",$.proxy(this.close,this))
						.on("click","a",$.proxy(this.selectItem,this))
						.on("click","button",$.proxy(this.addItem,this));
					this.drop.find("input").on("keyup",function(e){
						var currKey = e.keyCode||e.which||e.charCode;
						if(currKey == "13"){
							_this.addItem();
						};
					});
					this.wrap.on("click","a.plus",$.proxy(this.open,this))
						.on("click","a span",$.proxy(this.removeItem,this))
				}
			}
		},
		radio = function(id){
			return {
				wrap:$("#"+ id),
				val:function(){
					return this.wrap.find("a.ct").attr("value");
				},
				init:function(){
					this.wrap.find("a").click(function(){
						$(this).addClass("ct").siblings().removeClass("ct");
						var val = $(this).attr("value");
						$("#cpw").css("display",val == "1" ?"block":"none")
							.find("input").attr("data-check",'{"empty":'+ (val == "1" ? false :true) +',"length":"4-25"}');
	//					$("#shw").css("display",val == "0" ?"block":"none")
	//						.find("input").attr("data-check",'{"empty":'+ (val == "0" ? false :true) +',"length":"4-25"}');
					});
				}
			};
		}
	$(window).ready(function(){
		var $cate = new cateSelecter("taglist")
			,$type = new radio("rds")
			,$subbtn = $(".subbtn");
		$(".prompt").each(function(){
			$(this).attr("rel",$(this).text());
		});
		$cate.init();
		$type.init();
		$subbtn.click(function(){
			var cate = $cate.val()
				,type = $type.val();
			if(cate.length == 0){
				return ui.openWarn("请选择供货类目！");
			};
			if(ui.checkform()){
				var company = $("#company").val().replace(/ /g,''),
					name = $("#contacts").val().replace(/ /g,''),
					address = $("#address").val().replace(/ /g,''),
					brand = $("#brand").val().replace(/ /g,''),
					taobao = $("#taobao").val().replace(/ /g,''),
					idcard = $("#idcard").val(),
					license = $("#license").val().replace(/ /g,''),
					wangwang = $("#wangwang").val().replace(/ /g,''),
					qq = $("#qq").val(),
					website = $("#website").val(),
					phone = $("#phone").val()
					, account = $('#account').val();
				req.s({
					'url':"/web/kd_supplier_add"
					, 'data':{
						'address':address//地址
						, 'brand':brand//品牌
						, 'company':type//0个人 1企业
						, 'company_name':(type == "0" ? "" :company)//企业名称
						, 'idcard':idcard
						, 'license':license
						, 'name':name//联系人
						, 'phone':phone
						, 'website':website
						, 'qq':qq//
						, 'taobao':taobao//淘宝店铺
						, "type":cate.join(",")//供货类目
						, 'wangwang':wangwang//旺旺
						, 'username': account
						, 'sign0': 'brand'
					}
					, 'success':function(d){
						d = d.kehuda;
						if(d.status == 1){
							alert("您已成功提交申请，我们会尽快处理您的申请并联系您。\n请保持您的通讯畅通。");
						}else{
							ui.openWarn(d.tips);
						};
					}
				});
			}else{
				ui.openWarn("提交失败，请检查表单");
			};
		});
		/*$("a.reloadimg").click(function(){
			$(this).html("<img src='/web/verification_code?"+ new Date().getTime() +"'/>");
		});*/
		ui.loadUI();
	});
},["kehuda/utils","common/require", "kehuda/navbar"]);
