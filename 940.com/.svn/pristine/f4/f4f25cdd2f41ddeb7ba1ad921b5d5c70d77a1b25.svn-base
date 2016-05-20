Fengs.add('zx/ui/sync', function(S, $, REQ, LAB){
	var isSync = false;
	return {
		init: function($synBtn){
			$synBtn.click(function(){
				var date = $.cookie("sdk_sync_timestamp")
					, newDate = new Date().getTime()
					, shopData = {}
					, cateData
					, nick = $synBtn.data('nick');
				if(isSync){return;};
				if($synBtn.data('istry') == '1'){ return LAB.warn('请注册登录')}//请注册登录
				if(date != null && date != ""){
					newDate = newDate - parseInt(date);
					/*if(newDate	< 600000){
						return LAB.warn("同步过于频繁，请过"+ (10 - Math.floor(newDate / 60000)) +"分钟后再试！")
					};*/
				}
				isSync = true;
				$.cookie("sdk_sync_timestamp",new Date().getTime(),{path:"/"});
				LAB.loading.show("同步店铺信息");
				/*window.getOnsaleItemsFinished = function(status,tips){
					//console.log(status);
					switch(status){
						case 1:
							LAB.warn("同步成功！");
							//刷新页面
							W.location.href = W.location.href;
							break;
						case 2:
							break;
						default:
							LAB.warn(tips);
							break;
					}
					sSync = false;
					$synBtn.html("<em></em>");
					LAB.loading.hide();
				}
				alert("[do]getonsaleitems[/do][param]"+ uri.username +"_"+ uri.id +"[/param]");*/
				var reqsize = 200
					, finish = function(){
						LAB.loading.show('同步成功，正在刷新页面');
						window.location.href = window.location.href.replace(/\#([\s\S]+)?$/ig,'');
						isSync = false;
					}
					, syncError = function(tips){
						LAB.loading.hide();
						isSync = false;
						return LAB.warn(tips);
					}
					, syncShop = function(){
						/*{"user_seller_get_response": {"user": {}}}

						buyer_credit: 买家信用
						seller_credit: 卖家信用
						user_id: 用户数字ID
						sex: 性别。可选值:m(男),f(女)
						type: 用户类型。可选值:B(B商家),C(C商家)
						promoted_type: 有无实名认证。可选值:authentication(实名认证),not authentication(没有认证)
						status: 状态。可选值:normal(正常),inactive(未激活),delete(删除),reeze(冻结),supervise(监管)
						consumer_protection: 是否参加消保
						location: 户当前居住地公开信息
						*/
						LAB.request({
							'method':'taobao.user.seller.get'
							, 'fields': 'buyer_credit,seller_credit,promoted_type,user_id,sex,type,status,consumer_protection,location'
						}, function(d){
							if(d.error_response){
								return syncError('同步卖家信息失败，错误代码['+ d.error_response.msg +']');
							}
							if(d.user_seller_get_response){
								shopData = d.user_seller_get_response.user;
							}
							/*
							{"shop_get_response":{"shop":{"cid":14,"created":"2012-03-18 09:28:16","modified":"2015-03-31 12:48:02","nick":"终恨水天","pic_path":"/fb/48/TB1bQXSGVXXXXaoXpXXwu0bFXXX.png","shop_score":{"delivery_score":"5.0","item_score":"5.0","service_score":"5.0"},"sid":71013450,"title":"风软"}}}

							sid: 店铺编号。shop+sid.taobao.com即店铺地址，如shop123456.taobao.com
							cid: 店铺所属的类目编号
							nick: 卖家昵称
							title: 店铺标题
							desc: 店铺描述
							pic_path: 店标地址。返回相对路径，可以用"http://logo.taobao.com/shop-logo"来拼接成绝对路径
							created: 开店时间。格式：yyyy-MM-dd HH:mm:ss
							modified: 最后修改时间。格式：yyyy-MM-dd HH:mm:ss
							shop_score: 店铺动态评分信息

							*/
							LAB.request({
								'method':'taobao.shop.get'
								, 'fields': 'sid,cid,title,nick,pic_path,created,modified,shop_score'
								,"nick": nick
							}, function(d){
								if(d.error_response){
									return syncError('同步店铺信息失败，错误代码['+ d.error_response.msg +']');
								}
								if(d.shop_get_response && d.shop_get_response.shop){
									shopData = $.extend(d.shop_get_response.shop, shopData);
								}
								LAB.loading.show("同步宝贝类目");//同步宝贝类目
								/*
								{"sellercats_list_get_response":{"seller_cats":{"seller_cat":[{"cid":807855133,"name":"云服务器","parent_cid":0,"pic_url":"http://img01.taobaocdn.com/bao/uploaded/i4/224607955/TB2R87pXVXXXXbuXXXXXXXXXXXX_!!224607955.jpg","sort_order":1,"type":"manual_type"},{"cid":1092507261,"name":"云计算","parent_cid":0,"pic_url":"","sort_order":2,"type":"tree_type"}]}}}
								cid: 类目编号
								parent_id: 父类目编号，注：此类目指前台类目，值等于0：表示此类目为一级类目，值不等于0：表示此类目有父类目
								name: 类目名称
								is_parent: 该类目是否为父类目。即：该类目是否还有子类目
								*/
								LAB.request({
									'method': 'taobao.sellercats.list.get'
									,"nick": nick
								}, function(d){
									if(d.error_response){
										return syncError('同步店铺类目失败，错误代码['+ d.error_response.msg +']');
									}
									if(d.sellercats_list_get_response && d.sellercats_list_get_response.seller_cats){
										cateData = LAB.jsonToStr(d.sellercats_list_get_response.seller_cats.seller_cat);
									}else{
										cateData = '[]';
									};
									REQ.s({
										url:"/api/sync_shop"
										, data:{'shop': LAB.jsonToStr(shopData), 'cate': cateData, 'username': $synBtn.data('user')}
										, escape: false
										, success: function(d){
											LAB.loading.show("同步宝贝");
											var page = 1
												, reqcount = 1
												, itemData  = []
												, callback = function(d){
													if(d.error_response){
														return syncError('同步宝贝失败，错误代码['+ d.error_response.msg +']');
													};
													var response = d.items_onsale_get_response
														, total = response.total_results
														, list = response.items ? response.items.item : [];
													for(var i=0, len = list.length; i<len; i++){
														itemData.push(list[i]);
													};
													LAB.loading.show("同步宝贝 "+ (page*reqsize) +"/"+ total);
													if(total == 0){
														finish();
													//}else if(page*reqsize >= total || page*reqsize >= 2000){
													}else if(page*reqsize >= total){
														postItems(reqcount, itemData, finish);
													}else if(page % 5 == 0){
														postItems(reqcount, itemData, function(){
															itemData.length = 0;
															page++;
															reqcount++;
															syncItems(page, callback);
														});
													}else{
														page++;
														syncItems(page, callback);
													};
												}
											syncItems(page, callback);
										}
									});
								})
							})
						})
					}
					, postItems = function(index, data, callback){
						console.log(data.length);
						REQ.s({
							url:"/api/sync_items"
							, data:{'page': index, 'data': LAB.jsonToStr(data), 'id': shopData.sid}
							, escape: false
							, success: function(d){
								callback && callback();
							}
						});
					}
					, syncItems = function(page, callback){
						/*
						{"items_onsale_get_response":{"items":{"item":[{"approve_status":"onsale","cid":50016177,"list_time":"2015-06-26 13:14:24","modified":"2014-12-19 13:16:29","num":597,"num_iid":43077833315,"outer_id":"","pic_url":"http://img04.taobaocdn.com/bao/uploaded/i4/TB1omcdGVXXXXbBXVXXXXXXXXXX_!!0-item_pic.jpg","price":"1999.00","props":"22144:29400;22144:30500;33668:27432;33667:121067;33674:121087;33675:121090;33671:21483;33666:121023;21586:43211;4068337:41623440","seller_cids":"807855133,","sold_quantity":0,"title":"云服务器512M内存+40G硬盘+1M独享多线带宽","type":"fixed"}]},"total_results":26}}

						num_iid: 商品数字id
						title: 商品标题,不能超过60字节
						type: 商品类型(fixed:一口价;auction:拍卖)注：取消团购
						cid: 商品所属的叶子类目 id
						seller_cids: 商品所属的店铺内卖家自定义类目列表
						pic_url: 商品主图片地址
						num: 商品数量
						list_time: 上架时间（格式：yyyy-MM-dd HH:mm:ss）
						modified: 商品修改时间（格式：yyyy-MM-dd HH:mm:ss）
						outer_id: 商家外部编码(可与商家外部系统对接)。需要授权才能获取
						sold_quantity: 商品销量
						approve_status: 商品上传后的状态。onsale出售中，instock库中
						price: 品价格，格式：5.00；单位：元；精确到：分
						*/
						LAB.request({
							'method': 'taobao.items.onsale.get'
							, 'fields': 'num_iid,title,type,cid,seller_cids,pic_url,num,list_time,modified,outer_id,sold_quantity,has_discount,approve_status,price'
							, 'page_no': page
							, 'page_size': reqsize
						}, callback);
					};
				syncShop();
			});
			if($synBtn.data('sync') == "1" && !$synBtn.data('nick') == false){
				$synBtn.trigger('click');
			};
		}
	}
},['common/require', 'zx/lab']);