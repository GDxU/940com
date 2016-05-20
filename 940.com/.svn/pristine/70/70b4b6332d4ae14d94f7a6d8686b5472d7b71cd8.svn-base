Fengs.add('chongzhi/utils/common', function(S, $){
	var o = o={
		//更新标题
		t:function(element,title,parent,menu){
			n.h(title);
			if(!parent){
				parent = n.v;
			};
			if(element){
				parent.innerHTML = "";
				parent.appendChild(element);
			};
			document.loadUI();
			n.l.h();
			if(p.z != null && p.z != "undefined"){p.z()};
			var headmenu = $.find("#headmenu");
			if(headmenu != null){
				headmenu.innerHTML = "";
				if(menu != null){
					headmenu.appendChild(menu);
				};
			};
		},
		//错误信息
		e:function(txt,type){
			var ele = $.createElement("dl");
			ele.innerHTML = "<ol class='text_center'>"+ txt +"</ol>";
			n.v.appendChild(ele);
			if(type == 0){
				var ol = $.createElement("ol"),
					btn = $.createElement("input");
				btn.type = "button";
				btn.className = "ibutton";
				btn.value = g(150);
				ol.appendChild(btn);
				ele.appendChild(ol);
				btn.on("click",function(){gotourl("u","d");});
			};
			n.l.h();
			document.loadUI();
		},
		//检测是否登录
		h:function(callback){
			var _self = arguments.callee;
			if(p.h == null){
				setTimeout(function(){
					_self(callback);
				},200);
				return;
			}else{
				callback();
			};
			/*if(p.h == "0"){
				gotourl("m","h");
			}else{
				callback();
			};*/
		},
		//自动生成订单ID
		i:function(){
			return $.getid() + Math.floor(Math.random()*1000) + "v" + p.logined.sududa.o;
		},
		//业务成功
		v:function(type,id,opt,tips,status){
			return n.j(type,id,opt,tips,status);
		},
		//检测重复提交
		s:function(b){
			if(!b.c){
				b.oldvalue = b.value;
				b.className = "isubing";
				b.value = g(115);
				b.c = function(){
					b.clicked = false;
					this.className = "isubmit";
					this.value = b.oldvalue;
				};
			};
			if(b.clicked){
				openWarn("no",g(68));
				return false;
			}else{
				b.clicked = true;
				return true;
			};
		},
		//充值
		r:function(type,opt,pay,product,subbtn,callback,errorback){
			n.l.s();
			var statusConvert = function(instr,tips){
				var str;
				tips = "("+tips+")";
				switch(instr){
					case "-9":
						str = g(5)+tips;
						break;
					case "-1":
						str = g(6);
						break;
					case "0":
						str = g(7);
						break;
					case "1":
						str = g(8);
						break;
					case "5":
						str = g(9);
						break;
					case "9":
						str = g(10)+tips;
						break;
					case "10":
						str = g(11)+tips;
						break;	
				};
				return str;
			}
			var obj = $.extend({
				orderid:o.i(),
				productid:0,
				to:"",
				area:0,
				shop:"3",
				count:1,
				p:""
			},opt);
			u.m({
				url:"api/recharge",
				data:obj,
				p:pay,
				success:function(d){
					d = $.json(d).sududa;
					n.m();
					if(d.status == "-9"){
						if(d.tips.indexOf(g(139))>=0 && !errorback){
							openConfirm({
								yes:g(140),
								no:g(141),
								text:d.tips + g(142),
								backtrue:function(){
									gotourl('m','h');	
								}
							});
						}else{
							//手机批量充值回调方法
							if(errorback){
								errorback(statusConvert(d.status,d.tips));
							}else{
								openWarn("no",statusConvert(d.status,d.tips));
							};
						};
						subbtn.c();
					}else{
						if(!errorback){
							o.v(type,obj.orderid,{
								tradeamount:obj.to,
								pro:product.b,
								money:$.number.toMoney(product[u.w()])+ g(90) +"×"+ obj.count+ g(91)+ "=" +$.number.toMoney(Number(product[u.w()]) * parseInt(obj.count)) + g(90),
								face:product.f + product.u +"×"+ obj.count+ g(91)+ "=" +$.number.toMoney(Number(product.f) * parseInt(obj.count)) + product.u
							},
							statusConvert(d.status,d.tips),
							d.status);
							subbtn.c();
							callback();
						}else{
							d.tips = statusConvert(d.status,d.tips);
							subbtn.c();
							callback(d,type,obj);
						};
					};
					n.l.h();
				},
				error:function(){
					//手机批量充值回调方法
					if(errorback){
						errorback(g(0));
					}else{
						openWarn("no",g(0));
						subbtn.c();
						n.l.h();
					}
				}
			});
		}
	};
	return o;
});