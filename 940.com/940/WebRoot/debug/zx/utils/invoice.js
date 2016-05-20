//业务成功
Fengs.add('zx/utils/invoice', function(S, $, UI, TEMPLATE){
	return {
		'init': function(data){
			var html = '<div class="form-horizontal">'+
				'{{ for(var i=0,len = list.length; i<len; i++){ }}'+
				'<div class="control-group">'+
					'<label class="control-label">{{=list[i].name}}</label>'+
					'<div class="controls"><span class="control-span">{{=list[i].value}}</span></div>'+
				'</div>'+
				'{{ } }}'+
			'</div>';
			var render = TEMPLATE.compile(html)
			new UI.dialog({
				'title':'业务成功'
				, 'width': 500
				, 'padding': '15px 0 0 0'
				, 'content': render({'list': data})
				, 'footer': [
					{
						'class': 'btn-success btn-close'
						, 'label': '确定'
						, 'icon': '&#xe60f;'
					}
				]
			})
		}
	}
}, ['ui/base', 'plus/art-template']);