Fengs.add('zx/control/colpick', function(S, $, LAB){
	var Collorpicker, $doc;
	var colpick = function () {
		var tpl = '<div style="width: 470px; left: 265.5px; top: 245px; z-index: 10000399; visibility: visible;" class="tb-dialog tb-overlay tb-ext-position"><div class="tb-contentbox " style="display: block;"><div class="tb-stdmod-header">颜色器</div><div class="tb-stdmod-body" style="height: 260px; padding: 10px;">' + '<div class="colpick"><div class="colpick_color"><div class="colpick_color_overlay1"><div class="colpick_color_overlay2"><div class="colpick_selector_outer"><div class="colpick_selector_inner"></div></div></div></div></div><div class="colpick_hue"><div class="colpick_hue_arrs"><div class="colpick_hue_larr"></div><div class="colpick_hue_rarr"></div></div></div><div class="colpick_new_color">新颜色</div><div class="colpick_current_color">当前色</div><div class="colpick_hex_field"><div class="colpick_field_letter">#</div><input type="text" maxlength="6" size="6" /></div><div class="colpick_rgb_r colpick_field"><div class="colpick_field_letter">R</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_rgb_g colpick_field"><div class="colpick_field_letter">G</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_rgb_b colpick_field"><div class="colpick_field_letter">B</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_hsb_h colpick_field"><div class="colpick_field_letter">H</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_hsb_s colpick_field"><div class="colpick_field_letter">S</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_hsb_b colpick_field"><div class="colpick_field_letter">B</div><input type="text" maxlength="3" size="3" /><div class="colpick_field_arrs"><div class="colpick_field_uarr"></div><div class="colpick_field_darr"></div></div></div><div class="colpick_submit">确定</div><div class="colpick_cancel">取消</div></div>' + '</div><div class="tb-stdmod-footer"></div></div><a tabindex="0" role="button" class="tb-ext-close"><span class="tb-ext-close-x">关闭</span></a></div>',
			defaults = {
				showEvent: 'click',
				onShow: function () {},
				onBeforeShow: function(){},
				onHide: function () {},
				onChange: function () {},
				onSubmit: function () {},
				colorScheme: 'light',
				color: 'ffffff',
				livePreview: true,
				flat: false,
				layout: 'full',
				submit: 1,
				submitText: '确定',
				height: 240
			},
			//Fill the inputs of the plugin
			fillRGBFields = function  (hsb, cal) {
				var rgb = hsbToRgb(hsb);
				$(cal).data('colpick').fields
					.eq(1).val(rgb.r).end()
					.eq(2).val(rgb.g).end()
					.eq(3).val(rgb.b).end();
			},
			fillHSBFields = function  (hsb, cal) {
				$(cal).data('colpick').fields
					.eq(4).val(Math.round(hsb.h)).end()
					.eq(5).val(Math.round(hsb.s)).end()
					.eq(6).val(Math.round(hsb.b)).end();
			},
			fillHexFields = function (hsb, cal) {
				$(cal).data('colpick').fields.eq(0).val(hsbToHex(hsb));
			},
			//Set the round selector position
			setSelector = function (hsb, cal) {
				$(cal).data('colpick').selector.css('backgroundColor', '#' + hsbToHex({h: hsb.h, s: 100, b: 100}));
				$(cal).data('colpick').selectorIndic.css({
					left: parseInt($(cal).data('colpick').height * hsb.s/100, 10),
					top: parseInt($(cal).data('colpick').height * (100-hsb.b)/100, 10)
				});
			},
			//Set the hue selector position
			setHue = function (hsb, cal) {
				$(cal).data('colpick').hue.css('top', parseInt($(cal).data('colpick').height - $(cal).data('colpick').height * hsb.h/360, 10));
			},
			//Set current and new colors
			setCurrentColor = function (hsb, cal) {
				$(cal).data('colpick').currentColor.css('backgroundColor', '#' + hsbToHex(hsb));
			},
			setNewColor = function (hsb, cal) {
				var opt = $(cal).data('colpick');
				var hex = '#' + hsbToHex(hsb);
				opt.newColor.css('backgroundColor', hex);
				$(opt.el).val(hex).next().css('background-color', hex);
			},
			//Called when the new color is changed
			change = function (ev) {
				var cal = Collorpicker
					, col
					, opt = cal.data('colpick');
				//var cal = $(this).parent().parent(), col;
				if (this.parentNode.className.indexOf('_hex') > 0) {
					opt.color = col = hexToHsb(fixHex(this.value));
					fillRGBFields(col, cal.get(0));
					fillHSBFields(col, cal.get(0));
				} else if (this.parentNode.className.indexOf('_hsb') > 0) {
					opt.color = col = fixHSB({
						h: parseInt(opt.fields.eq(4).val(), 10),
						s: parseInt(opt.fields.eq(5).val(), 10),
						b: parseInt(opt.fields.eq(6).val(), 10)
					});
					fillRGBFields(col, cal.get(0));
					fillHexFields(col, cal.get(0));
				} else {
					opt.color = col = rgbToHsb(fixRGB({
						r: parseInt(opt.fields.eq(1).val(), 10),
						g: parseInt(opt.fields.eq(2).val(), 10),
						b: parseInt(opt.fields.eq(3).val(), 10)
					}));
					fillHexFields(col, cal.get(0));
					fillHSBFields(col, cal.get(0));
				}
				setSelector(col, cal.get(0));
				setHue(col, cal.get(0));
				setNewColor(col, cal.get(0));
				cal.data('colpick').onChange.apply(cal.parent(), [col, hsbToHex(col), hsbToRgb(col), opt.el, 0]);
				$(opt.el).trigger('change');
			},
			//Change style on blur and on focus of inputs
			blur = function (ev) {
				//$(this).parent().removeClass('colpick_focus');
			},
			focus = function () {
				var opt = Collorpicker.data('colpick');
				opt.fields.parent().removeClass('colpick_focus');
				//$(this).parent().addClass('colpick_focus');
			},
			//Increment/decrement arrows functions
			downIncrement = function (ev) {
				ev.preventDefault ? ev.preventDefault() : ev.returnValue = false;
				var field = $(this).parent().find('input').focus();
				var current = {
					el: $(this).parent().addClass('colpick_slider'),
					max: this.parentNode.className.indexOf('_hsb_h') > 0 ? 360 : (this.parentNode.className.indexOf('_hsb') > 0 ? 100 : 255),
					y: ev.pageY,
					field: field,
					val: parseInt(field.val(), 10),
					//preview: $(this).parent().parent().data('colpick').livePreview
					preview: Collorpicker.data('colpick').livePreview
				};
				$doc.mouseup(current, upIncrement);
				$doc.mousemove(current, moveIncrement);
			},
			moveIncrement = function (ev) {
				ev.data.field.val(Math.max(0, Math.min(ev.data.max, parseInt(ev.data.val - ev.pageY + ev.data.y, 10))));
				if (ev.data.preview) {
					change.apply(ev.data.field.get(0), [true]);
				}
				return false;
			},
			upIncrement = function (ev) {
				change.apply(ev.data.field.get(0), [true]);
				ev.data.el.removeClass('colpick_slider').find('input').focus();
				$doc.off('mouseup', upIncrement);
				$doc.off('mousemove', moveIncrement);
				return false;
			},
			//Hue slider functions
			downHue = function (ev) {
				ev.preventDefault ? ev.preventDefault() : ev.returnValue = false;
				var current = {
					//cal: $(this).parent(),
					cal: Collorpicker,
					y: $(this).offset().top
				};
				$doc.on('mouseup touchend',current,upHue);
				$doc.on('mousemove touchmove',current,moveHue);
				
				var pageY = ((ev.type == 'touchstart') ? ev.originalEvent.changedTouches[0].pageY : ev.pageY );
				change.apply(
					current.cal.data('colpick')
					.fields.eq(4).val(parseInt(360*(current.cal.data('colpick').height - (pageY - current.y))/current.cal.data('colpick').height, 10))
						.get(0),
					[current.cal.data('colpick').livePreview]
				);
				return false;
			},
			moveHue = function (ev) {
				var pageY = ((ev.type == 'touchmove') ? ev.originalEvent.changedTouches[0].pageY : ev.pageY );
				change.apply(
					ev.data.cal.data('colpick')
					.fields.eq(4).val(parseInt(360*(ev.data.cal.data('colpick').height - Math.max(0,Math.min(ev.data.cal.data('colpick').height,(pageY - ev.data.y))))/ev.data.cal.data('colpick').height, 10))
						.get(0),
					[ev.data.preview]
				);
				return false;
			},
			upHue = function (ev) {
				fillRGBFields(ev.data.cal.data('colpick').color, ev.data.cal.get(0));
				fillHexFields(ev.data.cal.data('colpick').color, ev.data.cal.get(0));
				$doc.off('mouseup touchend',upHue);
				$doc.off('mousemove touchmove',moveHue);
				return false;
			},
			//Color selector functions
			downSelector = function (ev) {
				ev.preventDefault ? ev.preventDefault() : ev.returnValue = false;
				var current = {
					//cal: $(this).parent(),
					cal: Collorpicker,
					pos: $(this).offset()
				};
				current.preview = current.cal.data('colpick').livePreview;
				
				$doc.on('mouseup touchend',current,upSelector);
				$doc.on('mousemove touchmove',current,moveSelector);

				var payeX,pageY;
				if(ev.type == 'touchstart') {
					pageX = ev.originalEvent.changedTouches[0].pageX,
					pageY = ev.originalEvent.changedTouches[0].pageY;
				} else {
					pageX = ev.pageX;
					pageY = ev.pageY;
				}

				change.apply(
					current.cal.data('colpick').fields
					.eq(6).val(parseInt(100*(current.cal.data('colpick').height - (pageY - current.pos.top))/current.cal.data('colpick').height, 10)).end()
					.eq(5).val(parseInt(100*(pageX - current.pos.left)/current.cal.data('colpick').height, 10))
					.get(0),
					[current.preview]
				);
				return false;
			},
			moveSelector = function (ev) {
				var payeX,pageY;
				if(ev.type == 'touchmove') {
					pageX = ev.originalEvent.changedTouches[0].pageX,
					pageY = ev.originalEvent.changedTouches[0].pageY;
				} else {
					pageX = ev.pageX;
					pageY = ev.pageY;
				}

				change.apply(
					ev.data.cal.data('colpick').fields
					.eq(6).val(parseInt(100*(ev.data.cal.data('colpick').height - Math.max(0,Math.min(ev.data.cal.data('colpick').height,(pageY - ev.data.pos.top))))/ev.data.cal.data('colpick').height, 10)).end()
					.eq(5).val(parseInt(100*(Math.max(0,Math.min(ev.data.cal.data('colpick').height,(pageX - ev.data.pos.left))))/ev.data.cal.data('colpick').height, 10))
					.get(0),
					[ev.data.preview]
				);
				return false;
			},
			upSelector = function (ev) {
				fillRGBFields(ev.data.cal.data('colpick').color, ev.data.cal.get(0));
				fillHexFields(ev.data.cal.data('colpick').color, ev.data.cal.get(0));
				$doc.off('mouseup touchend',upSelector);
				$doc.off('mousemove touchmove',moveSelector);
				return false;
			},
			clickCancel = function (ev) {
				//var cal = $(this).parent();
				Collorpicker.css('display','none');
				var cal = Collorpicker
					, opt = cal.data('colpick');
				//恢复默认颜色
				if(opt.origColor){
					var col = opt.color = opt.origColor;
					opt.origColor = col;
					setCurrentColor(col, cal.get(0));
					opt.onSubmit(col, hsbToHex(col), hsbToRgb(col), opt.el);
					$(opt.el).trigger('change');
				}else{
					$(opt.el).val('').trigger('change');
				};
			},
			//Show/hide the color picker
			/*show = function (ev) {
				// Prevent the trigger of any direct parent
				ev.stopPropagation();
				//var cal = $('#' + $(this).data('colpickId'));
				var cal = Collorpicker;
				cal.data('colpick').onBeforeShow.apply(this, [cal.get(0)]);
				var pos = $(this).offset();
				var top = pos.top + this.offsetHeight;
				var left = pos.left;
				var viewPort = getViewport();
				var calW = cal.width();
				if (left + calW > viewPort.l + viewPort.w) {
					left -= calW;
				};
				cal.css({left: left + 'px', top: top + 'px'});
				if (cal.data('colpick').onShow.apply(this, [cal.get(0)]) != false) {
					cal.show();
				}
				//Hide when user clicks outside
				$('html').mousedown({cal:cal}, hide);
				cal.mousedown(function(ev){ev.stopPropagation();})
			},
			hide = function (ev) {
				if (ev.data.cal.data('colpick').onHide.apply(this, [ev.data.cal.get(0)]) != false) {
					ev.data.cal.hide();
				}
				$('html').off('mousedown', hide);
			},*/
			getViewport = function () {
				var m = document.compatMode == 'CSS1Compat';
				return {
					l : window.pageXOffset || (m ? document.documentElement.scrollLeft : document.body.scrollLeft),
					w : window.innerWidth || (m ? document.documentElement.clientWidth : document.body.clientWidth)
				};
			},
			//Fix the values if the user enters a negative or high value
			fixHSB = function (hsb) {
				return {
					h: Math.min(360, Math.max(0, hsb.h)),
					s: Math.min(100, Math.max(0, hsb.s)),
					b: Math.min(100, Math.max(0, hsb.b))
				};
			}, 
			fixRGB = function (rgb) {
				return {
					r: Math.min(255, Math.max(0, rgb.r)),
					g: Math.min(255, Math.max(0, rgb.g)),
					b: Math.min(255, Math.max(0, rgb.b))
				};
			},
			fixHex = function (hex) {
				var len = 6 - hex.length;
				if (len > 0) {
					var o = [];
					for (var i=0; i<len; i++) {
						o.push('0');
					}
					o.push(hex);
					hex = o.join('');
				}
				return hex;
			},
			restoreOriginal = function () {
				var cal = Collorpicker;
				var col = cal.data('colpick').origColor;
				fillRGBFields(col, cal.get(0));
				fillHexFields(col, cal.get(0));
				fillHSBFields(col, cal.get(0));
				setSelector(col, cal.get(0));
				setHue(col, cal.get(0));
				setNewColor(col, cal.get(0));
			};
		return {
			init: function (opt, doc) {
				opt = $.extend({setColor: $.proxy(this.setColor, this)}, defaults, opt || {});
				$doc = $(doc != undefined ? doc : top.document);
				Collorpicker = $('#collorpicker', $doc);
				//$(top.document.getElementById('collorpicker'));
				//Set color
				if (typeof opt.color == 'string') {
					opt.color = hexToHsb(opt.color);
				} else if (opt.color.r != undefined && opt.color.g != undefined && opt.color.b != undefined) {
					opt.color = rgbToHsb(opt.color);
				} else if (opt.color.h != undefined && opt.color.s != undefined && opt.color.b != undefined) {
					opt.color = fixHSB(opt.color);
				} else {
					return this;
				}
				//For each selected DOM element
				return this.each(function () {
					//If the element does not have an ID
					//if (!$(this).data('colpickId')) {
					if(Collorpicker.length == 0){
						var options = $.extend({}, opt);
						options.origColor = opt.color;
						//Generate and assign a random ID
						//var id = 'collorpicker_' + parseInt(Math.random() * 1000);
						var id = 'collorpicker';
						$(this).data('colpickId', id);
						//Set the tpl's ID and get the HTML
						var cal = Collorpicker = $(tpl).attr('id', id);
						//Add class according to layout
						/*cal.addClass('colpick_'+options.layout+(options.submit?'':' colpick_'+options.layout+'_ns'));
						//Add class if the color scheme is not default
						if(options.colorScheme != 'light') {
							cal.addClass('colpick_'+options.colorScheme);
						}
						//Setup submit button
						cal.find('div.colpick_submit').html(options.submitText).click(clickCancel);
						//Setup input fields
						options.fields = cal.find('input').change(change).blur(blur).focus(focus);
						cal.find('div.colpick_field_arrs').mousedown(downIncrement).end().find('div.colpick_current_color').click(restoreOriginal);
						//Setup hue selector
						options.selector = cal.find('div.colpick_color').on('mousedown touchstart',downSelector);
						options.selectorIndic = options.selector.find('div.colpick_selector_outer');
						//Store parts of the plugin
						options.el = this;
						options.hue = cal.find('div.colpick_hue_arrs');
						huebar = options.hue.parent();*/
						var huebar = cal.find('div.colpick_hue_arrs').parent();
						//Paint the hue bar
						var UA = navigator.userAgent.toLowerCase();
						var isIE = navigator.appName === 'Microsoft Internet Explorer';
						var IEver = isIE ? parseFloat( UA.match( /msie ([0-9]{1,}[\.0-9]{0,})/ )[1] ) : 0;
						var ngIE = ( isIE && IEver < 10 );
						var stops = ['#ff0000','#ff0080','#ff00ff','#8000ff','#0000ff','#0080ff','#00ffff','#00ff80','#00ff00','#80ff00','#ffff00','#ff8000','#ff0000'];
						if(ngIE) {
							var i, div;
							for(i=0; i<=11; i++) {
								div = $('<div></div>').attr('style','height:8.333333%; filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='+stops[i]+', endColorstr='+stops[i+1]+'); -ms-filter: "progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='+stops[i]+', endColorstr='+stops[i+1]+')";');
								huebar.append(div);
							}
						} else {
							stopList = stops.join(',');
							huebar.attr('style','background:-webkit-linear-gradient(top,'+stopList+'); background: -o-linear-gradient(top,'+stopList+'); background: -ms-linear-gradient(top,'+stopList+'); background:-moz-linear-gradient(top,'+stopList+'); -webkit-linear-gradient(top,'+stopList+'); background:linear-gradient(to bottom,'+stopList+'); ');
						}
						/*cal.find('div.colpick_hue').on('mousedown touchstart',downHue);
						options.newColor = cal.find('div.colpick_new_color');
						options.currentColor = cal.find('div.colpick_current_color');
						//Store options and fill with default color
						cal.data('colpick', options);
						fillRGBFields(options.color, cal.get(0));
						fillHSBFields(options.color, cal.get(0));
						fillHexFields(options.color, cal.get(0));
						setHue(options.color, cal.get(0));
						setSelector(options.color, cal.get(0));
						setCurrentColor(options.color, cal.get(0));
						setNewColor(options.color, cal.get(0));*/

						//Append to body if flat=false, else show in place
						/*if (options.flat) {
							cal.appendTo(this).show();
							cal.css({
								position: 'relative',
								display: 'block'
							});
						} else {
							cal.appendTo(top.document.body);
							$(this).on(options.showEvent, show);
							cal.css({
								position:'absolute'
							});
						}*/
						Collorpicker.on('click', '.colpick_cancel,.tb-ext-close', clickCancel)
						.on('click', 'div.colpick_current_color', restoreOriginal)
						.on('click', '.colpick_submit', function(e){
							Collorpicker.css('display','none');
						}).on('mousedown', '.colpick_field_arrs', downIncrement);
						LAB.moveDrop.call(Collorpicker, '.tb-stdmod-header', $doc);
						$('body', $doc).prepend(cal.css('display','none'));
					};
					var $this = $(this)
						, $icon = $('<span class="colpick_icon" style="background-color: #'+ hsbToHex(opt.color) +';"title="点击颜色">&nbsp;</span>');
					$this.after($icon).on({
						'blur': function(e){
							var val = $this.val()
								, oldval = $this.data('oldval');
							if(typeof val != 'string' || val == ""){
								return false;
							}
							if(val.match(/^\#?([0-9a-f]{3}|[0-9a-f]{6})$/ig) == null){
								val = oldval;
							}else if(val.match(/^\#?[0-9a-f]{3}$/ig) !== null){
								val = val.replace(/[0-9a-f]/ig, function(a){return a + a;})
							};
							if(val.substring(0,1) !== '#'){
								val = '#'+ val;
							};
							opt.color = hexToHsb(val);
							$this.val(val);
							$icon.css('background-color', val);
						}
						, 'focus': function(){
							$this.data('oldval', $this.val());
						}
					});
					$icon.click(function(){
						opt.fields = Collorpicker.find('input').change(change).blur(blur).focus(focus);
						opt.el = $this[0];
						//Setup input fields
						opt.fields = Collorpicker.find('input').change(change).blur(blur).focus(focus);
						//Collorpicker.find('div.colpick_field_arrs').mousedown(downIncrement).end().find('div.colpick_current_color').click(restoreOriginal);
						//Setup hue selector
						opt.selector = Collorpicker.find('div.colpick_color').on('mousedown touchstart',downSelector);
						opt.selectorIndic = opt.selector.find('div.colpick_selector_outer');
						//Store parts of the plugin
						opt.hue = Collorpicker.find('div.colpick_hue_arrs');
						opt.origColor = opt.color;
						Collorpicker.find('div.colpick_hue').on('mousedown touchstart',downHue);
						opt.newColor = Collorpicker.find('div.colpick_new_color');
						opt.currentColor = Collorpicker.find('div.colpick_current_color');
						opt.onSubmit = function(hsb,hex,rgb,el) {
							//$this.css({'background-color': '#'+hex, 'color': (hsb == null || (hsb.s < 50 && hsb.b > 50) ? '#000000' : '#ffffff')}).val('#'+hex);
							$this.val('#'+hex);
							$icon.css({'background-color': '#'+hex});
							Collorpicker.css('display','none');
						};
						Collorpicker.data('colpick', opt).css('display','block');
						fillRGBFields(opt.color, Collorpicker.get(0));
						fillHSBFields(opt.color, Collorpicker.get(0));
						fillHexFields(opt.color, Collorpicker.get(0));
						setHue(opt.color, Collorpicker.get(0));
						setSelector(opt.color, Collorpicker.get(0));
						setCurrentColor(opt.color, Collorpicker.get(0));
						setNewColor(opt.color, Collorpicker.get(0));
					})
				});
			},
			/*
			//Shows the picker
			showPicker: function() {
				return this.each( function () {
					if ($(this).data('colpickId')) {
						show.apply(this);
					}
				});
			},
			//Hides the picker
			hidePicker: function() {
				return this.each( function () {
					if ($(this).data('colpickId')) {
						$('#' + $(this).data('colpickId')).hide();
					}
				});
			},*/
			//Sets a color as new and current (default)
			setColor: function(col, setCurrent) {
				setCurrent = (typeof setCurrent === "undefined") ? 1 : setCurrent;
				if (typeof col == 'string') {
					col = hexToHsb(col);
				} else if (col.r != undefined && col.g != undefined && col.b != undefined) {
					col = rgbToHsb(col);
				} else if (col.h != undefined && col.s != undefined && col.b != undefined) {
					col = fixHSB(col);
				} else {
					return this;
				};
				return this.each(function(){
					if ($(this).data('colpickId')) {
						var cal = $('#' + $(this).data('colpickId'));
						cal.data('colpick').color = col;
						cal.data('colpick').origColor = col;
						fillRGBFields(col, cal.get(0));
						fillHSBFields(col, cal.get(0));
						fillHexFields(col, cal.get(0));
						setHue(col, cal.get(0));
						setSelector(col, cal.get(0));
						
						setNewColor(col, cal.get(0));
						cal.data('colpick').onChange.apply(cal.parent(), [col, hsbToHex(col), hsbToRgb(col), cal.data('colpick').el, 1]);
						if(setCurrent) {
							setCurrentColor(col, cal.get(0));
						}
					}
				});
			}
		};
	}();
	//Color space convertions
	var hexToRgb = function (hex) {
		var hex = parseInt(((hex.indexOf('#') > -1) ? hex.substring(1) : hex), 16);
		return {r: hex >> 16, g: (hex & 0x00FF00) >> 8, b: (hex & 0x0000FF)};
	};
	var hexToHsb = function (hex) {
		return rgbToHsb(hexToRgb(hex));
	};
	var rgbToHsb = function (rgb) {
		var hsb = {h: 0, s: 0, b: 0};
		var min = Math.min(rgb.r, rgb.g, rgb.b);
		var max = Math.max(rgb.r, rgb.g, rgb.b);
		var delta = max - min;
		hsb.b = max;
		hsb.s = max != 0 ? 255 * delta / max : 0;
		if (hsb.s != 0) {
			if (rgb.r == max) hsb.h = (rgb.g - rgb.b) / delta;
			else if (rgb.g == max) hsb.h = 2 + (rgb.b - rgb.r) / delta;
			else hsb.h = 4 + (rgb.r - rgb.g) / delta;
		} else hsb.h = -1;
		hsb.h *= 60;
		if (hsb.h < 0) hsb.h += 360;
		hsb.s *= 100/255;
		hsb.b *= 100/255;
		return hsb;
	};
	var hsbToRgb = function (hsb) {
		var rgb = {};
		var h = hsb.h;
		var s = hsb.s*255/100;
		var v = hsb.b*255/100;
		if(s == 0) {
			rgb.r = rgb.g = rgb.b = v;
		} else {
			var t1 = v;
			var t2 = (255-s)*v/255;
			var t3 = (t1-t2)*(h%60)/60;
			if(h==360) h = 0;
			if(h<60) {rgb.r=t1;	rgb.b=t2; rgb.g=t2+t3}
			else if(h<120) {rgb.g=t1; rgb.b=t2;	rgb.r=t1-t3}
			else if(h<180) {rgb.g=t1; rgb.r=t2;	rgb.b=t2+t3}
			else if(h<240) {rgb.b=t1; rgb.r=t2;	rgb.g=t1-t3}
			else if(h<300) {rgb.b=t1; rgb.g=t2;	rgb.r=t2+t3}
			else if(h<360) {rgb.r=t1; rgb.g=t2;	rgb.b=t1-t3}
			else {rgb.r=0; rgb.g=0;	rgb.b=0}
		}
		return {r:Math.round(rgb.r), g:Math.round(rgb.g), b:Math.round(rgb.b)};
	};
	var rgbToHex = function (rgb) {
		var hex = [
			rgb.r.toString(16),
			rgb.g.toString(16),
			rgb.b.toString(16)
		];
		$.each(hex, function (nr, val) {
			if (val.length == 1) {
				hex[nr] = '0' + val;
			}
		});
		return hex.join('');
	};
	var hsbToHex = function (hsb) {
		return rgbToHex(hsbToRgb(hsb));
	};
	$.fn.extend({
		colpick: colpick.init,
		colpickHide: colpick.hidePicker,
		colpickShow: colpick.showPicker,
		colpickSetColor: colpick.setColor
	});
	/*$.extend({
		colpick:{ 
			rgbToHex: rgbToHex,
			rgbToHsb: rgbToHsb,
			hsbToHex: hsbToHex,
			hsbToRgb: hsbToRgb,
			hexToHsb: hexToHsb,
			hexToRgb: hexToRgb
		}
	});*/
}, ['zx/lab']);