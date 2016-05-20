Fengs.add('common/utils', function(S, $){
	if(S.jsonToStr){
		return;
	};
	S.jsonToStr = function(o){	
		var arr = []
			, self = arguments.callee
			, fmt = function(s) { 
				if (typeof s == "object" && s != null){
					return self(s);
				}
				return  /^(string|number)$/.test(typeof s) ? '"' + s + '"' : s; 
			}
		if(Object.prototype.toString.call(o) === '[object Array]'){
			for(var i in o){
				arr.push(fmt(o[i]));
			}
			return '[' + arr.join(',') + ']'; 
		}else{
			for(var i in o){
				arr.push('"' + i + '":' + fmt(o[i]));
			}
			return '{' + arr.join(',') + '}'; 
		}
	};
	S.parseUri = function(url,cut){
		cut = cut || "?";
		var end=cut=="?"?"#":"?"
			,obj = {}
			,arr;
		cut = url.indexOf(cut);
		end = url.indexOf(end);
		if(cut >= 0){
			cut++;
			url = url.substr(cut,end>cut?end-cut:url.length);
			url = url.split("&");
			for(var i = 0; i < url.length; i++){
				try{
					arr = url[i].split("=");
					obj[arr[0]] = arr[1];
				}catch(e){};
			};
		}
		return obj;
	};
	S.moveDrop = function(target, doc){
		var $doc = doc || $(top.document)
			, $this = this;
		var startX, startY, startL, startT;
		var _x = $this.width();
		var mouseCoords = function(ev){ 
			if(ev.pageX || ev.pageY){ 
				return {x:ev.pageX, y:ev.pageY}; 
			} 
			return{ 
				x:ev.clientX + top.document.body.scrollLeft - top.document.body.clientLeft, 
				y:ev.clientY + top.document.body.scrollTop - top.document.body.clientTop 
			}; 
		};
		var move = function(e){
			e = e || event;
			var poss = mouseCoords(e);
			var _w = top.document.body.clientWidth;
			var _left = startL + poss.x - startX
				, _top =  startT + poss.y - startY;
			_top = _top > 600 ?  600 : _top;
			_top = _top < 0 ? 0 : _top;
			_left = _left > _w - _x ?  _w - _x : _left;
			_left = _left < 0 ? 0 : _left;
			$this.css({left: _left,top: _top})
			e.stopPropagation();
		};
		$doc.on('mouseup', function(e){
			$doc.off('mousemove', move);
			$this.css('opacity', 1);
		})
		$(target, $this).on('mousedown', function(e){
			e = e || event;
			var poss = mouseCoords(e);
			startX = poss.x;
			startY = poss.y;
			startL = parseInt($this.css('left'));
			startT = parseInt($this.css('top'));
			$doc.on('mousemove', move);
			$this.css('opacity', 0.8);
			return false;
		});
	};
	S.test = function(inStr, inType){
		if(inStr == null || inStr =="" || inType == null || inType == ""){
			return false;
		};
		var reg;
		switch(inType){
			case "decimal":
				reg = /^-?\d+(\.\d+)?$/g;
				break;
			case "int":
				reg = /^[-+]?\d*$/;
				break;
			case "email":
				reg = /[A-Za-z0-9_-]+[@](\S*)([A-Za-z0-9_-])(\S*)/g;
				break;
			case "mobile":
				reg = /^1([3,5,8]\d|4[5,7])\d{8}$/g;
				break;
			case "areacode":
				reg = /^0(10|2\d|[3-9]\d{2})$/g;
				break;
			case "phone":
				reg = /^0(10\d{8}|2\d{9}|[3-9]\d{9,10})$/g;
				break;
			case "qq":
				reg = /^\d{5,10}$/;
				break;
			case "ip":
				reg = /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
				break;
			case "url":
				reg = /[http(s)?:\/\/]([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/; 
				break;
			case "domain":
				reg =  /^(https?:\/\/)?([a-z0-9\-]([a-z0-9\-]*[\.])+([a-z]{2,6}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/)?$/;
				break;
			case "number":
				reg = /^[-+]?\d*$/;
				break;
			case "letter":
				reg = /^[a-zA-Z]\w*$/;
				break;
			case "alphanumeric":
				reg = /\w/;
				break;
			case "username":
				reg = /^[a-z][a-zA-Z0-9\_]+$/;
				break;
			//是否含有中文
			case "chinese":
				reg = /[\u4E00-\u9FFF]/;
				break;
			//身份证
			default:
				return true;
				break;
		};
		if(inStr.match(reg) == null){
			return false;
		}else{
			return true;
		};
	};
	S.refreshPage = function(){
		window.location.href = window.location.href.replace(/\#([\s\S]+)?$/ig,'');
	}
});