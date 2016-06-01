 Fengs.add('940/user/user_class', function(S, $){
 				
		angular.module('kebiao', [])
		.run(['$rootScope','$http','$timeout','$filter','$document','$compile',function($rootScope,$http,$timeout,$filter,$Document,$compile){
				
				$http({
					url:'/account_list?account='+window.userData.u,
					method:'GET'
				}).success(function(data,header,config,status){

					$rootScope.data = data;

					$rootScope.myclass = $rootScope.data.myclass;
					$rootScope.vip = !!$rootScope.myclass["940vip"];
	               	$rootScope.cyb = !!$rootScope.myclass["cyb"];
	               	$rootScope.jyb = !!$rootScope.myclass["hyb"];
	               	$rootScope.zcb = !!$rootScope.myclass["zcb"];

	               	$rootScope.vipHtml = $rootScope.vip?"查看学习历程":"立即咨询";
	               	$rootScope.cybHtml = $rootScope.cyb?"查看学习历程":"立即咨询";
	               	$rootScope.jybHtml = $rootScope.jyb?"查看学习历程":"立即咨询";
	               	$rootScope.zcbHtml = $rootScope.zcb?"查看学习历程":"立即咨询";

	               	$rootScope.classNum = parseInt($rootScope.myclass["940vip"]) + parseInt($rootScope.myclass["cyb"]) + parseInt($rootScope.myclass["hyb"]) + parseInt($rootScope.myclass["zcb"]);


					
					//默认显示940vip的全部
					var vipVideo = [];
					var json = $rootScope.data.classes['940vip'];
					for(var attr in json){
						Array.prototype.push.apply(vipVideo, angular.fromJson(json[attr]) )
					}
					$rootScope.school = vipVideo;
					// vipVideo.sort(function(a,b){
					// 	var reg = /（(\d+)）/;
					// 	if ( reg.exec( a.videoName ) && reg.exec( b.videoName ) ) {
					// 		return parseInt(reg.exec( a.videoName )[1]) - parseInt(reg.exec( b.videoName )[1]);
					// 	}else{
					// 		return 1;
					// 	}
					// });

					
				}).error(function(data,header,config,status){
					alert('服务器请求失败！')
				});
		}])
		.directive('keBiao', ['$timeout', function($timeout){
		 	return {
		 		replace: true,
	            restrict: 'AE',
	            // scope: {},
	            //require: 'ngModel',
	            controller: ['$scope','$filter','$http', function(scope,$filter,$http) {
	               //	http://localhost:8088/account_list?account=peiliang@sududa.com

					scope.playNum = function(vid){
						$.getJSON('/play',{v_id:vid,account:window.userData.u?window.userData.u:''},function(d){
				 	  	 	
				 	  	});
					}

					function _tabClass(name){

							$("li[data-class="+name+"]").addClass('act').siblings().removeClass('act');
							scope.school = scope.data.classes[name];
			 				
			 				if (!angular.isArray(scope.school)) {
			 					scope.school = [angular.fromJson(scope.school)]

			 					try{
			 						if (scope.school[0].videoId == undefined) {
				 						scope.school = [];
				 					};
			 					}catch(e){
			 						scope.school = [];
			 					}

			 				};
					}
					function _open(){
						window.open('http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn');
					}

					scope.mycla = {
						vip:function(off){
							if (off) {
								_tabClass('940vip');
								var vipVideo = [];
								var json = scope.data.classes['940vip'];
								for(var attr in json){
									Array.prototype.push.apply(vipVideo, angular.fromJson(json[attr]) );
								}
								scope.school = vipVideo;
							}else{
								_open()
							}
						},
						cyb:function(off){
							off?_tabClass('cyb'):_open();
						},
						jyb:function(off){
							off?_tabClass('jyb'):_open();
						},
						zcb:function(off){
							off?_tabClass('zcb'):_open();
						}
					}

					scope.chapter = {};//0基础学淘宝开店 //0基础学淘宝推广
					//scope.iden = 0;

	            }],
	            template: '<div><div class="mySchool">\
								<p class="tit_p">\
									<b>我的班级</b>\
									<span>（已入学 <i ng-bind="classNum">0</i>，未报名 <i ng-bind="4-classNum">0</i>）</span>\
								</p>\
								<ul class="course_ul">\
									<li class="c_1">\
										<div class="co_pic">\
											<span ng-class="{dss_act:vip,not_act:!vip}"></span>\
											<a ng-click="mycla.vip(vip)" href="javascript:" ng-bind="vipHtml"></a>\
										</div>\
									</li>\
									<li class="c_2">\
										<div class="co_pic">\
											<span ng-class="{dss_act:cyb,not_act:!cyb}"></span>\
											<a ng-click="mycla.cyb(cyb)" href="javascript:" ng-bind="cybHtml"></a>\
										</div>\
									</li>\
									<li class="c_3">\
										<div class="co_pic">\
											<span ng-class="{dss_act:jyb,not_act:!jyb}"></span>\
											<a ng-click="mycla.jyb(hyb)" href="javascript:" ng-bind="jybHtml"></a>\
										</div>\
									</li>\
									<li class="c_4">\
										<div class="co_pic">\
											<span ng-class="{dss_act:zcb,not_act:!zcb}"></span>\
											<a ng-click="mycla.zcb(zcb)" href="javascript:" ng-bind="zcbHtml"></a>\
										</div>\
									</li>\
								</ul>\
	           				</div>\
	            			<div class="myProgress">\
	            			<p class="tit_p">\
								<b>学习历程</b>\
							</p>\
							<ul class="pro_tabul">\
	            				<li data-class="940vip" class="act">\
	            					<span>940VIP班</span>\
	            					<b class="caret"></b>\
	            					<div class="vipClass">\
	            						<p data-class="1">0基础学淘宝开店</p>\
	            						<p data-class="2">0基础学淘宝推广</p>\
	            						<p data-class="3">0基础学淘宝美工</p>\
	            						<p data-class="4">VIP课程</p>\
	            					</div>\
	            				</li>\
								<li data-class="cyb">创业班</li>\
								<li data-class="jyb">精英班</li>\
								<li data-class="zcb">总裁班</li>\
							 </ul>\
							 <div class="wrapCurr">\
							 	<ul class="curr_ul">\
							 		<p style="font-size: 14px;" ng-if="school.length==0">没有记录！</p>\
							 		<div ng-repeat="d in school">\
							 			<li ng-if="chapter[$index]" class="dss">\
											<p class="fl">{{d.videoTime}}</p>\
											<div class="fr v_name">\
												<span class="fl title thing"><b>{{chapter[$index][0]}}</b>  {{chapter[$index][1]}}</span>\
											</div>\
										</li>\
								 		<li ng-class="{one:$first,dss:(!$first&&d.click!=0)||chapter[$index],hal:d.click==0}">\
											<p class="fl">{{d.videoTime}}</p>\
											<div class="fr v_name">\
												<span class="fl thing"><i>{{d.click==0?"未学过":"已学过"}}</i>{{d.videoName}}</span>\
												<a target="_blank" class="fr" ng-click="playNum(d.videoId)" href="/video/{{d.vid}}.html">{{d.click==0?"点此学习":"点此复习"}}<i></i></a>\
											</div> \
										</li>\
									</div>\
							 	</ul>\
							 	<!--<div class="tcdPageCode"></div>-->\
							   </div>\
							   </div></div>',
		 		link: function(scope, element, attrs, controller) {
		 			// console.log(angular)
		 			var $vipClassMenu = angular.element(element).find('.vipClass');
		 			angular.element(element).find('.pro_tabul').on('click','li',function(){
		 				$(this).addClass('act').siblings().removeClass('act');
		 				var cla = $(this).data('class');

		 				if ($(this).index()==0) {
		 					$vipClassMenu.show();
		 					return;
		 				}else{
		 					$vipClassMenu.hide();
		 				}

		 				scope.school = scope.data.classes[cla];
		 				
		 				if (!angular.isArray(scope.school)) {
		 					scope.school = [angular.fromJson(scope.school)]

		 					try{
		 						if (scope.school[0].videoId == undefined) {
			 						scope.school = [];
			 					};
		 					}catch(e){
		 						scope.school = [];
		 					}

		 				};
		 				console.log(scope.school)
		 				//console.log(scope.school[0].videoId==undefined)
		 				// console.log(angular.isArray(scope.school))
		 				 
		 				 scope.$apply();
		 			});
		 			angular.element(element).find('.vipClass').on('click','p',function(){
		 				var _dataJson = scope.data.classes['940vip'];
		 				var cla = $(this).data('class');
		 				if (cla==1) {
		 					//0基础学淘宝开店 
		 					scope.chapter = {
		 						'0':['第一章','淘宝开店流程及设置技巧'],
		 						'7':['第二章','2016淘宝搜索新认识'],
		 						'12':['第三章','生意参谋全面剖析店铺数据'],
		 						'16':['第四章','引流神器淘宝活动']
		 					}
		 				}else if(cla==2){
		 					//0基础学淘宝推广
		 					scope.chapter = {
		 						'0':['第一章','淘宝推广'],
		 						'1':['第二章','淘宝客'],
		 						'5':['第三章','直通车基础'],
		 						'9':['第四章','直通车初始设置'],
		 						'16':['第五章','直通车质量得分'],
		 						'20':['第六章','无线直通车'],
		 						'23':['第七章','钻展']
		 					}
		 				}else{
		 					scope.chapter = [];
		 				}
		 				// scope.iden = cla;
		 				scope.school = _dataJson[cla];

		 				if (!angular.isArray(scope.school)) {
		 					scope.school = angular.fromJson(scope.school)
		 				};
		 				console.log(scope.school)
		 				$vipClassMenu.hide();
		 				scope.$apply();

		 				return false;
		 			})


	      					
		 		}
		 	};
	}])
	angular.element(document).ready(function() {
		angular.bootstrap(document,['kebiao']);//初始化
	})

 		

 })