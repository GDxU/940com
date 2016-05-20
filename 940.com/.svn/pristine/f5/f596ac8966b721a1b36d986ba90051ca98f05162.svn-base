Fengs.add('ui/dialog', function(S, $, UTILS){
	var dialog = function(options, callback){
		var opt = $.extend({
				title: 'Model Title'
				, content: '<div class="loading-box" style="min-height: 100px;"><ul class="loading-sprite"><li class="circle-loading"></li><li class="pulse"></li><li class="pulse b"></li><li class="pulse c"></li></ul></div>'
				, width: 600
				, height: 'auto'
				, padding: false
				, showClose: true
				, allowRemove: true
				, move: true
				, bgtransparent: false
				, footer: false
			}, options)
			, _this = this;
		if(opt.id && $('.modal-'+ opt.id).length > 0){
			return;
		}
		var $ele = $('<div class="modal-mark '+ (opt.id ? 'modal-'+ opt.id : '') +'" '+ (opt.bgtransparent ? 'style="background: rgba(0,0,0,0);"' : '') +'></div>');
		_this.opt = opt;
		_this.mark = $ele;
		var html = [];
		opt.height = opt.height === '100%' ? '100%' : 'auto';
		var top = Math.ceil((window.innerHeight - parseInt(opt.width)) / 2)
			, left = opt.width == '100%' ? 0 : Math.ceil((window.innerWidth - parseInt(opt.width)) / 2);
		html.push('<div class="modal-dialog'+ (opt.move ? ' modal-move' : '') +'" style="width:'+ (typeof opt.width == 'string' ? opt.width : opt.width +'px') +'; left:'+ left +'px; height: '+ opt.height +';">');
		html.push('<div class="modal-content">');
		html.push('<div class="modal-header">');
		if(opt.showClose){
			html.push('<a class="modal-close"><i></i></a>');
		};
		html.push('<h3 class="modal-title">'+ opt.title +'</h3>');
		html.push('</div>');
		html.push('<div class="modal-body"');
		if(opt.height === '100%'){
			var _h = parseInt(window.innerHeight - 136) + 'px';
			html.push('style="height:'+ _h +'; max-height: '+ _h +';"')
		};
		html.push('>'+ (opt.padding ? '<div style="padding:'+ opt.padding +';">' : '') + opt.content)
		html.push('</div>');
		if(opt.footer){
			var footer = opt.footer;
			html.push('<div class="modal-footer">');
			for(var i =0; i<footer.length; i++){
				html.push('<a class="btn btn-large '+ footer[i]['class'] +'">'+ (footer[i].icon ? '<em class="icon">'+ footer[i].icon +'</em> ' : '') + footer[i].label +'</a>');
			};
			html.push('</div>');
		};
		html.push((opt.padding ? '</div>' : '') +'</div></div>');
		$ele.html(html.join(''));
		var $modalBody = $('.modal-body', $ele)
		$('body').append($ele.on('click', '.modal-footer .btn-close,.modal-header .modal-close', function(){
			_this.hide();
		}));
		_this.target = $('.modal-dialog', $ele);
		_this.wrap = $('.modal-body', $ele);
		callback && callback(_this);
		if(opt.move){
			S.moveDrop.call(_this.target, '.modal-header');
		}
		_this.show();
		return this;
	};
	dialog.prototype = {
		show: function(){
			var _h = window.innerHeight//this.mark.height()
				, _ch = this.target.height();
			if(!this.opt.top){
				this.opt.top = this.opt.height == '100%' ? 0 : Math.ceil((_h - _ch) / 2);
			}
			this.target.css({top: this.opt.top});
			this.mark.fadeIn();
			if(this.opt.height === '100%'){
				$('body').css('overflow','hidden');
			}
		}
		, hide: function(noMove){
			var _this = this
				, $mark = this.mark;
			$mark.fadeOut(function(){
				if(_this.opt.allowRemove){
					$mark.remove();
				};
				if(_this.opt.height === '100%'){
					$('body').css('overflow','auto');
				};
			})
		}
	};
	return dialog;
},['common/utils']);
Fengs.add('ui/radio', function(S, $){
	return {
		"init": function($this){
			var items = $("li", $this)
				, _this = $this[0]
			_this.val = function(value){
				if(!value){
					return items.filter(".active").attr("rel");
				}else{
					items.filter("[rel='"+ value +"']").addClass('active').siblings('.active').removeClass('active');
				}
			};
			items.click(function(){
				var $this = $(this);
				$this.addClass('active').siblings('.active').removeClass('active');
				_this.onchange && _this.onchange();
			});
			if(_this.val() == ""){
				_this.val(items.eq(0).attr("rel"));
			};
			$this.data('uied', true);
		}
	}
});
Fengs.add('ui/base', function(S, $, DIALOG){
	var uiobj = {
		loadui:function($wrap){
			if(!$wrap){
				$wrap = $("body");
			};
			if($.browser.msie || $.browser.version <= '8.0'){
				$('a,input,button', $wrap).attr('hidefocus','true');
			}
			$("[data-ui]",$wrap).each(function(){
				var $this = $(this)
					, ui = $this.data("ui")
					, uitype = !ui.type ? false : ui.type.toLowerCase();//
				if($this.data('uied')){
					return false;
				};
				S.use('ui/'+ uitype, function(a){
					a && a.init($this);
				});
			});
		}
		, dialog: DIALOG
		, warn:function(e,n) {
			if(typeof e != "string"){
				return;
			}
			e = e.indexOf("！")<0 ? e + "！" : e;
			var i = $('<div class="modal-mark" style="background-color: rgba(0,0,0,0);"><div class="modal-warn"><span '+ (n == 'err' ? 'class="error"' : '') +'>' + e + '</span></div></div>');
			$("body").append(i);
			setTimeout(function() {
				i.fadeOut(function(){i.remove()});
			},1500);
		}
		, wait: {
			show: function(e){
				var i = $("#ui_loading");
				e = e.indexOf("…")<0 ? e + "…" : e;
				if(i.length == 0){
					i = $('<div class="ui_mark" id="ui_loading"><span class="load_bg">' + e + '</span></div>');
					$("body").append(i);
				}else{
					i.find("span").text(e);
				};
			}
			,hide: function(str){
				$("#ui_loading").fadeOut(function(){
					$(this).remove();
				});
			}
		}
		, alert: function(label){
			new DIALOG({
				title: '消息'
				, width: 400
				, content: '<div class="alert-content">'+ label +'</div>'
				, showClose: false
				, footer: [
					{
						'class': 'btn-success btn-ok'
						, 'icon': '&#xe60f;'
						, 'label': '知道了'
					}
				]
			}, function(dialog){
				$('.btn-ok', dialog.target).click(function(){
					dialog.hide();
				});
			});
		}
		, confirm: function(options){
			var opt = $.extend({
				'title': 'Confirm Box'
				, 'content': ''
				, 'ok': '确定'
				, 'cancel': '取消'
				, 'success': function(){

				} 
				, 'error': function(){

				}
			}, options);
			new DIALOG({
				title: opt.title
				, width: 400
				, content: '<div class="alert-content">'+ opt.content +'</div>'
				, showClose: false
				, footer: [
					{
						'class': 'btn-default btn-cancel'
						, 'icon': '&#xe610;'
						, 'label': opt.cancel
					}
					, {
						'class': 'btn-success btn-ok'
						, 'icon': '&#xe60f;'
						, 'label': opt.ok
					}
				]
			}, function(dialog){
				$('.btn-ok', dialog.target).click(function(){
					opt.success();
					dialog.hide();
				});
				$('.btn-cancel', dialog.target).click(function(){
					opt.error();
					dialog.hide();
				});
			});
		}
	};
	S.ui = uiobj;
	$.fn.loadui = function(){
		return uiobj.loadui($(this));
	}
	return uiobj;
}, ['ui/dialog']);