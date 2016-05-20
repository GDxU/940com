Fengs.add('common/formcheck', function(S, $, UTILS){
	//var testTypes = ["decimal","int","email","mobile","areacode","phone","qq","ip","url","domain","number","letter","alphanumeric","chinese"];
	var Verify = function($form, options){
		options = $.extend({
			cb: function($el, status, tips){
				if(!status){
					var $tips = $el.parent().find('.err-tips');
					if($tips.length == 0){
						$el.parent().addClass('error').append('<div class="err-tips">'+ tips +'</div>');
					}else{
						$tips.text(tips);
					}
				}
			}
			, reset: function($el){ $el.parent().removeClass('error').find('.err-tips').remove();}
			, 'regs': {}
		}, options)
		var isArr = $form.eq ? false : true
			, cacheObj = {}
			, tips = false
			, form = isArr ? $form : $("[data-check]", $form)
			, len = form.length
			, err = 0
			, result = function($el, data){
				options.cb($el, data.s, data.t);
				$el.one('click', function(){
					options.reset($el);
				});
				return data;
			}
			, check = function(ele){
				//try{
					var rule = ele.data("check")
						, parent = ele.parents('.control-group')
						, type = ele[0].type
						, isCheck = (type == 'select-one' || type == 'checkbox')
						, val = ele.val();
					cacheObj[ele.attr('id')] = {name: rule.name,val: val};
					if(!rule.empty && (val == "" || (type == 'checkbox' && !ele[0].checked))){
						return result(ele, {s: false, t: isCheck ? '请选择'+ rule.name : rule.name +"不允许为空"});
					}
					if(!rule.length == false && val != ""){
						if(typeof rule.length == 'string' && rule.length.match(/^[\d]+\-[\d]+$/) !== null){
							rule.length == rule.length.split("-");
							if(val.length > rule.length[1] || val.length < rule.length[0]){
								return result(ele, {s: false, t: rule.name +"长度限制为"+ rule.length +"位"});
							}
						}
					};
					if(!rule.type == false && val != ""){
						if((options.regs[rule.type] && !options.regs[rule.type].test(val)) || !S.test(val, rule.type)){
							return result(ele, {s: false, t: rule.name +"格式错误"});
						};
					};
					if(!rule.same == false && cacheObj[rule.same] && cacheObj[rule.same].val != val){
						return result(ele, {s: false, t: '与'+ cacheObj[rule.same].name +"不一致"});
					}
					return result(ele, {s: true});
				/*}catch(e){
					return true;
				};*/
			};
		if(len == 0){return {'status': true, 'tips': '没有验证的表单'};};
		for(var i = 0; i<len; i++){
			var $ele = isArr ? form[i] : form.eq(i)
				//, $parent = $ele.parents('.control-group')
				, _c = check($ele);
			if(_c.s === false){
				/*$parent.addClass('error');
				$ele.one('click',function(e){
					$(this).parents('.control-group').removeClass('error').find('span.errtips').remove();
				}).parents('.controls').append('<span class="help-block errtips">'+ _c.t +'</span>')*/
				err++;
			};
		}
		return {'status': err == 0 ? true : false};
	};
	return Verify;
},['common/utils']);