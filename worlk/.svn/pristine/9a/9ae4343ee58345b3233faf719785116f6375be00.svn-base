//显示加载器  
function showLoader(text) {
	if(text == undefined){
		text = '数据载入中,请稍后...';
	}	
    $.mobile.loading('show', {
        text: text,//加载器中显示的文字  
        textVisible: true, //是否显示文字  
        theme: 'b',//加载器主题样式a-e  
        textonly: false,//是否只显示文字  
        html: "<div class='loading-logo'></div><span class='ui-icon-loading'></span><h4 style='text-align:center;'>" + text + "</h4>" //要显示的html内容，如图片等  
    });
}
function showSubmit(text) {
	if(text == undefined){
		text = '数据提交中,请稍后...';
	}
    $.mobile.loading('show', {
        text: text,//加载器中显示的文字  
        textVisible: true, //是否显示文字  
        theme: 'b',//加载器主题样式a-e  
        textonly: false,//是否只显示文字  
        html: "<div class='loading-logo'></div><span class='ui-icon-loading'></span><h4 style='text-align:center;'>" + text + "</h4>" //要显示的html内容，如图片等  
    });
}
//隐藏加载器
function hideLoader() {
    $.mobile.loading('hide');
}
var fillNum = "0000000000" ;
/**
  * 格式化金额
  * @param str 需要格式化的数字，不是数字类型不进行格式化
  * @param num 小数点保留多少位，不是数字或不传为默认保留两位
  * @returns
  */
function formNumber(str, num) {
    if (!isNaN(str) && $.trim(str) !== "" ) {
        var html = str.toString(),
        digits = num,
        prefix = str < 0 ? "-" : "" ;
        if (! (/^[\d]+$/ .test(digits))) {
            digits = 2;
        }
        var precision = html.split(".")[1];
        if(precision == undefined){
        	digits = 2;
        }else if(precision.length < digits){
        	digits = precision.length;
        	if(digits < 2){
        		digits = 2;
        	}
        }        
        var pow10 = Math.pow(10, digits);
        html = (Math.round(Math.abs(parseFloat(html)) * pow10) / pow10).toString();
        var index = html.indexOf("." ),
        sDigits = "" ,
        length = html.length;
        if (index === -1) {
            index = length++;
            sDigits = "." ;
        }
        if (digits > 0) {
            var inum = digits - (length - index - 1);
            if (inum > 0) {
                sDigits += fillNum.substr(0, inum); //不足保留小数位补0 ,“fillNum”要与定义的变量相同
                html += sDigits;
            }
        }
        if (index === 0) {
            html = "0" + html;
        } else if (index > 3) {
            var inum = Math.ceil(index / 3) - 1,
            text = html.substr(index - 3),
            tmpText = html.substring(0, index - 3);
            for (var i = 1; i < inum; i++) {
                var tmpLength = tmpText.length;
                text = tmpText.substr(tmpLength - 3) + "," + text;
                tmpText = tmpText.substring(0, tmpLength - 3);
            }
            html = tmpText + "," + text;
        }
        return prefix + html;
    }
    return str;
}

function showColor(num) {
    if (num < 0) {
        return "<font color='red'>" + formNumber(num, 3) + "</font>";
    } else {
        return "<font color='green'>" + formNumber(num, 3) + "</font>";
    }
}

function showColor2(num) {
    if (num < 0) {
        return "<font color='red'>" + formNumber(num, 2) + "</font>";
    } else {
        return "<font color='green'>" + formNumber(num, 2) + "</font>";
    }
}

function showColor1(num) {
    if (num < 0) {
        return "<font color='red'>" + num + "</font>";
    } else {
        return "<font color='green'>" + num + "</font>";
    }
}

function formatString(sour, length){
	if (length > 0 && sour != undefined && sour.length > length && sour.length > 3) {
		sour = sour.substring(0, length - 3) + "...";
	}
	return sour;
}

/**
 * RSA加密
 * @param modulus
 * @param encryptionExponent
 * @param input
 * @returns
 */
function doRSAEncrypt(modulus, encryptionExponent, input) {
	var rsa = new RSAKey();
	rsa.setPublic(modulus, encryptionExponent);
	var res = rsa.encrypt(input);
	if (res == null) {
		console.log("RSA encrypt error...");
		return input;
	} else {
		return res;
	}
}

/**
 * 字符串替换占位符{0} {1} {2},"js实现用自符串替换占位符{0} {1} {2}".format("I", "LOVE", "YOU")
 */
String.prototype.format=function()  
{  
  if(arguments.length==0) return this;  
  for(var s=this, i=0; i<arguments.length; i++)  
    s=s.replace(new RegExp("\\{"+i+"\\}","g"), arguments[i]);  
  return s;  
};  
/**
 * 去字符串空格,默认去首尾空格
 * @param isAll isAll为true去字符串中所有空格（包括中间的空格）
 */
String.prototype.trim=function(isAll){
	if(isAll != undefined){
		return this.replace(/\s/g,"");
	}else{
		return this.replace(/(^\s+)|(\s+$)/g,"");
	}
}

/**
 * 获得当前时间的UTC时间戳
 * @return {int} unix timestamp
 */
Date.prototype.getTimeUTC = function() {
	return this.getTime() + this.getTimezoneOffset() * 60 * 1000;
}
/**
 * 将当前操作的时间变更时区(主要用于转换一个其他时区的时间)
 * 
 * @param {int} tzo 原时区 -12~13
 * @param {int} tzo 目标时区 -12~13 默认为当前时区
 */
Date.prototype.changeTimezone = function(tzo,tzn) {
	tzo = tzo * 60;
	tzn = tzn ? tzn * 60 : -this.getTimezoneOffset();
	this.setTime(this.getTime() - (tzo - tzn) * 60 * 1000);
}
/**
 * 调用客户端退出
 */
function logout() {
    try {
        mobileJS.logout();//android
    } catch(e) {//h5&ios调用
        try {
            window.location.href = ctx + "/logout";
        } catch(e) {}
    }
}