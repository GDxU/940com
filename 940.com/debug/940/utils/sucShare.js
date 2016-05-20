Fengs.add('940/utils/sucShare', function(S, $){
		var _html = '';
		return {
			goShare : function(){

				var _user = $.cookie('940_COM_USER')
		         if (_user==null) {//是否登录
		         	// layer.tips('您还没登录！', '#but_shaer');
		         	layer.msg('您还没登录！',{time:2000});
		         	return;
		         };
		         layer.open({
			        type: 1,
			        title:'我要分享',
			        area: ['600px', '375px'],
			        shadeClose: false, //点击遮罩关闭
			        moveType: 1,
			        content: function(){
			        	if (!_html) {
					   	 	var $boxs = $('#boxs');
					   	 	_html = $boxs.html();
					   	 	$boxs.remove();
				   	 	};
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
		        console.log(userData)
		         $box_shaer.find('.sub_btn').click(function(){
		         	var _val = $textarea.val();
		         	
		         	if (_val===''){
		         		layer.msg('请输入分享内容！', {time: 1500});
		         		// $prompt.html('请输入分享内容！').css({marginLeft:-$prompt.outerWidth()/2}).removeClass('suc').addClass('err');timeoutFn(0);
		         	 	$textarea.focus();
		         	 }else{
		         	 	// $prompt.html('分享成功！').css({marginLeft:-$prompt.outerWidth()/2}).removeClass('err').addClass('suc');timeoutFn(1);
		         	 	layer.load();
		         	 	setTimeout(function(){
		         	 		$.get('/shareSubmit?do=add&title=1&a_content='+_val+'&user_name='+_user+'&real_name='+userData.r+'&period='+userData.o+'&gender='+userData.s,function(){
		         	 			layer.closeAll('loading');
		             	 		layer.msg('分享成功！即将跳转', {icon: 1});
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


			}
		}

});