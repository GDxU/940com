Fengs.add('zx/ui/cover', function(S, $){
	var Cover = function(options, callback){
		var opt = $.extend({
				title: 'Model Title'
				, type: 'down'
				, content: 'Body goes here...'
				, width: 600
				, height: 'auto'
				, showClose: true
				, move: true
				, bgtransparent: false
				, footer: false
			}, options)
			, _this = this;
		if(opt.id && $('.cover-'+ opt.id).length > 0){
			return;
		};
		var $ele = $('<div class="cover-wrap" onselectstart="return false"><div class="cover-inner"><div class="cover-mark"></div><div class="cover-content cover-'+ opt.type +'">'+ opt.content +'</div></div></div>');
		$ele.on('click', '.cover-close', $.proxy(_this.hide, _this));
		_this.opt = opt;
		_this.target = $ele;
		$('body').append($ele);
		_this.show();
		callback(_this);
		return _this;
	};
	Cover.prototype = {
		show: function(){
			//this.target.css({top: this.opt.height == '100%' ? 0 : Math.ceil((_h - _ch) / 2)});
			this.target.fadeIn();
		}
		, hide: function(){
			var $wrap = this.target
				, opt = this.opt;
			$('.cover-content', $wrap).fadeOut(function(){
				$wrap.remove();
			});
			opt.cb && opt.cb();
		}
	};
	return {
		down: function(content){
			content = !content ? '如果您没有安装客户端请先下载安装，<br/>发布模板功能必须通过装修助手客户端实现。' : content;
			return new Cover({
				type: 'down'
				, content: '<div class="cover-close trans"></div><div class="down-icon"></div><p>'+ content +'</p><p class="sub"><a class="cover-btn" href="http://pan.baidu.com/s/1dDdhn6T" target="new"><em>&#xe630;</em>下载装修助手</a></p>'
			}, function(dialog){
				dialog.target.find('a').click(function(){
					dialog.hide();
				});
			});
		}
		, oauth: function(callback, _type){
			_type = _type ? _type : 'auth';
			var _title = _type == 'bind' ? '你只能绑定一个淘宝店铺且不能更改' : '请您在新打开的页面中完成淘宝账号的验证';
			var _userId = (!S.logined || !S.logined.u ? $(window.top.document.body).data('user') : S.logined.u);
			return new Cover({
				type: 'oauth'
				, content: '<div class="cover-close trans"></div><div class="oauth-icon">'+ _title +'<h2></h2><p>验证完成前请不要关闭本窗口,完成后请根据您的情况点击以下按钮</p></div><p class="sub" style="display:none;"><a class="cover-btn cover-btn-ok" href="javascript:void(0);"><em>&#xe60f;</em>完成验证</a><a class="cover-btn cover-btn-cancel" href="javascript:void(0);"><em>&#xe610;</em>验证遇到问题</a></p><p class="sub"><a class="cover-btn cover-btn-go" href="/oauth?do='+ _type +'&user='+ encodeURIComponent(_userId) +'" target="_blank"><em>&#xe666;</em>'+ (_type == 'bind' ? '绑定' : '验证') +'淘宝账号</a></p>'
			}, function(dialog){
				dialog.target.on('click', '.cover-btn-cancel', $.proxy(dialog.hide, dialog))
				.on('click', '.cover-btn-ok', function(){
					dialog.hide();
					callback && callback();
				})
				.on('click', '.cover-btn-go', function(){
					var $parent = $(this).parent();
					$parent.prev().css('display','block');
					$parent.remove();
				})
			});
		}
		, html5: function(dontClose){
			return new Cover({
				type: 'html5'
				, content: '<div class="html5-icon"><h2>本站使用了HTML5技术实现<em class="ilo"></em><br/><b>您的浏览器版本过低</b>，无法使用部分功能，<br/>请升级您的浏览器。</h2><p>建议使用以下浏览器浏览本站</p><ul><li class="chrome">chrome</li><li class="firefox">firefox</li><li class="s360">360</li></ul>'+ (dontClose ? '' : '<a class="cover-btn"><em>&#xe631;</em>继续浏览</a>')
			}, function(dialog){
				if(dontClose){
					return;
				}
				dialog.target.find('.cover-btn').click($.proxy(dialog.hide, dialog));
			});
		}
	}
},['jquery/easing']);