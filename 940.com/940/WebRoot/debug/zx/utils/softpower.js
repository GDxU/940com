//绑定安全证书
Fengs.add('zx/utils/softpower', function(S, $, UI){
	var html = '<div><table class="table table-bordered">'+
		'<tbody">'+
			'<tr">'+
				'<th>&nbsp;</th>'+
				'<th>普通版</th>'+
				'<th>全集版</th>'+
			'</tr>'+
			'<tr">'+
				'<td>淘宝自动装修</td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
			'</tr>'+
			'<tr">'+
				'<td>终身使用</td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
			'</tr>'+
			'<tr">'+
				'<td>模块DIY</td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
			'</tr>'+
			'<tr">'+
				'<td>全方位效果预览</td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
				'<td><em class="icon">&#xe60f;</em></td>'+
			'</tr>'+
			'<tr">'+
				'<td>模板数</td>'+
				'<td>1 套</td>'+
				'<td>全部</td>'+
			'</tr>'+
			'<tr">'+
				'<td>统一市场售价</td>'+
				'<td>30 元</td>'+
				'<td>90 元</td>'+
			'</tr>'+
		'</tboty>'+
	'</table></div>';
	return {
		'init': function(){
			return new UI.dialog({
				'title': '装修软件版本区别'
				, 'content': html
				, 'padding': '20px 20px 0 20px'
				, 'width': 500
				, 'footer': [
					{
						'class': 'btn-success btn-close'
						, 'label': '知道了'
						, 'icon': '&#xe60f;'
					}
				]
			});
		}
	};
}, ['ui/base']);