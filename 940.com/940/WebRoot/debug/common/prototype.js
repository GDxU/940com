Fengs.add('common/prototype', function(S, $){
	if(S._prototype){
		return;
	};
	/*Array.prototype.forEach = function(inFnc){
		if(!inFnc || typeof inFnc != 'function'){
			return;
		}
		for(var i = 0, len = this.length; i<len; i++){
			inFnc(this[i], i);
		}
	};*/
	Date.prototype.format = function(fmt){
		var o = {
		    "M+": this.getMonth() + 1, //月份 
		    "d+": this.getDate(), //日 
		    "h+": this.getHours(), //小时 
		    "m+": this.getMinutes(), //分 
		    "s+": this.getSeconds(), //秒 
		    "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		    "S": this.getMilliseconds() //毫秒 
		};
		if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};
	/*Array.prototype.sortByAttr = function(attr,order, primer){
		var sortBy = function (filed, reverse, primer) {  
			reverse = (reverse) ? -1 : 1;
			primer = primer ? primer : function(a){return a;};
			return function(a,b){
				a = primer(a[filed]);
				b = primer(b[filed]);
				if (a < b){  
					return reverse * -1;  
				}else{  
					return reverse * 1;  
				};  
			};
		};
		this.sort(sortBy(attr, order, primer));
	};*/
	String.prototype.trim = function(){
		return this.replace(/(^[ ]+)|([ ]+$)/ig,'');
	};
	S._prototype = true;
});