Fengs.add('940/utils/sucShare', function(S, $){
		
		return {
			goShare : function(n){
				var _html = '<div class="sug_cont" id="box_shaer">\
							<textarea placeholder="请输入内容..." id="saytext" class="textarea"></textarea>\
							<div class="biaoqing">\
								<span class="fl emotion">添加表情</span>\
								<i class="fr">还可以输入 <em>2000</em> 个字</i>\
							</div>\
							<div class="sub_div">\
								<input type="button" class="sub_btn" value="'+(n==1?'提交分享':'提交反馈')+'">\
							</div>\
							<div class="prompt"></div>\
						</div>';
				var _user = $.cookie('940_COM_USER');
				 if (n==1) {//分享需要登录
			         if (_user==null) {//是否登录
			         	// layer.tips('您还没登录！', '#but_shaer');
			         	layer.msg('您还没登录！',{time:2000});
			         	return;
			         };
		         };
		         $('#boxs').remove();
		         layer.open({
			        type: 1,
			        title:n==1?'我要分享':'我要反馈',
			        area: ['600px', '375px'],
			        shadeClose: false, //点击遮罩关闭
			        moveType: 1,
			        content: function(){
			       //  	if (!_html) {
					   	 // 	var $boxs = $('#boxs');
					   	 // 	_html = $boxs.html();
					   	 // 	$boxs.remove();
				   	 	// };
				   	 	return _html;
			        }(),
			        success:function(){
			        	
			        }
			    });

		         var $box_shaer = $('#box_shaer')
		         	,$textarea = $("#saytext").focus()
		         	,$prompt = $box_shaer.find('.prompt')
		         	,$emTxt = $box_shaer.find('em')
		         	,txtNum = 2000 //分享字数
		         	,timeoutFn = function(state){
		         		setTimeout(function(){
		         			// $prompt.removeClass('err suc');
		         			state && window.location.reload();
		         		},1500);
		         	}
		        
		         $box_shaer.find('.sub_btn').click(function(){
		         	var _val = $textarea.val();
		         	
		         	if (_val===''){
		         		layer.msg('请输入内容！', {time: 1500});
		         		// $prompt.html('请输入分享内容！').css({marginLeft:-$prompt.outerWidth()/2}).removeClass('suc').addClass('err');timeoutFn(0);
		         	 	$textarea.focus();
		         	 }else{
		         	 	// $prompt.html('分享成功！').css({marginLeft:-$prompt.outerWidth()/2}).removeClass('err').addClass('suc');timeoutFn(1);
		         	 	layer.load();
		         	 	 var url = n == 1 ? '/shareSubmit?do=add&title=1&a_content='+_val+'&user_name='+_user+'&real_name='+userData.r+'&period='+userData.o+'&gender='+userData.s : '/feedback?content='+_val;
		         	 	 console.log(url)
		         	 	setTimeout(function(){
		         	 		$.get(url,function(){
		         	 			layer.closeAll('loading');
		             	 		layer.msg((n == 1 ? '分享成功':'反馈成功')+'！即将跳转', {icon: 1});
		             	 		timeoutFn(1);
		             	 	})
		         	 	},1000)
		         	 }
					 //alert(replace_em(_val)) 
		         });

		         // 计算字数
		         $textarea.on('input propertychange', function() {
		           		var len = $(this).val().replace(/\s+/g,'').length;
		           		if (len>txtNum) {
		           			$(this).val($(this).val().substring(0,txtNum))
		           		}else{
		           			$emTxt.html(txtNum - len)
		           		}
				 }).trigger('input').trigger('propertychange'); 

				 // 表情
				 Fengs.use('940/user/qqFace',function(){
				 	var qqFaceFn = function(){
						$('.emotion').qqFace({
						 	id : 'facebox', //表情盒子的ID
						 	assign:'saytext', //给那个控件赋值
						 	path:'/images/face/' //表情存放的路径
						 });
				  	}();
				 });

			},
			feedback:function(){//问题反馈
				alert(11)
			}
		}

});