function checkParam(){
	var obj = $("[name='amount']");
	var te= /^[1-9]+[0-9]*]*$/;
	for(var i = 0; i < obj.length; i++){
		if(!te.test(obj[i].value)){
			alert(utf8to16(base64decode('5LiL5rOo6YeR6aKd6L6T5YWl6ZSZ6K+v77yM6K+36L6T5YWl5aSn5LqOMOeahOato+aVtOaVsO+8gQ==')));
			return false;
		}
	}
	if($("#issue").val()!=$("#isid").html()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
		return false;
	}
	return true;
}

function scbox(obj){
	if($("input:checked").length>10){
		//alert('最多只能选择10个号码！');
		$(obj).prop("checked",false).checkboxradio("refresh");
		setTimeout("alert('最多只能选择10个号码！');",200);
	}else{
		if($("input:checked").length>0){
			obcs();
		}else{
			obch();
		}
	}
}

function sobc(){
	enableSubmitBtn();
	var n = bonNum[$("#bon").val()];
	if ($("input:checked").length < n) {
        alert("请至少选择 " + n + utf8to16(base64decode('IOS4quWPt+eggei/m+ihjOS4i+azqCE=')));
        return false;
    }
	return true;
}

function isMoney(str){
	var te= /^[1-9]+[0-9]*]*$/;
	if(!te.test(str)){
		alert(utf8to16(base64decode('5LiL5rOo6YeR6aKd6L6T5YWl6ZSZ6K+v77yM6K+36L6T5YWl5aSn5LqOMOeahOato+aVtOaVsO+8gQ==')));
		return false;
	}
	return true;
}

//注单页点击删除按钮
function cdb(obj,n){
	$("#"+$(obj).attr("s")).prop("checked",false).checkboxradio("refresh");
	var b = $(obj).parent().parent().parent().siblings().length;
    $(obj).parent().parent().parent().remove();
    if($("input:checked").length>0){
    	obcs();
	}else{
		obch();
	}
    if(b == n){
        $.mobile.changePage("#rateInfoPage", {transition:'none'});
    	$("ul li .ui-btn-active").removeClass("ui-btn-active");
    	var str = "changeBetOn('" + $("#bon").val() + "')";
    	$("[onclick='" + str + "']").addClass("ui-btn-active");
    }
}

//注单页面点击填按钮
function cwb(obj){
	var num = 2;
	if(''!=$(obj).prev().val()){
        num = $(obj).prev().val();
	}
	var o = $("[name='amount']");
	for(var j = 0; j < o.length; j++){
		o[j].value = num;
	}
}

//赔率页面点击注单按钮
function obc(){
	enableSubmitBtn();
	if ($("input:checked").length == 0) {
        alert("请先选择号码!");
    } else {
    	$("#isid").html($("#issue").val());
    	$("#hcid").html($("#hcType").val());
        var ot = $("#orderTable");
        ot.children("tbody").remove();
        var tbody = $("<tbody></tbody>");
        $("input:checked").each(function (i) {
            var o = $("label[for='" + $(this).attr("id") + "']");
            var str = "";
            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
            if('LIANGMIAN'==$("#bon").val()||'ZHHE'==$("#bon").val()){
            	str += o.attr("title") + "</span>";
            }else{
            	str += $("#play_text").val() + o.attr("title") + "</span>";
            }
            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + o.text() + "</span>";
            str += "<input type='hidden' name='type' value='" + $(this).attr("id") + "'>";
            str += "<input type='hidden' name='rate' value='" + o.text() + "'></td>";
            str += "<td align='right' class='tdselect' style='border:none;'><span>"
            str += "<input type='number' min='1' max='50000' name='amount' class='numb_px' data-role='none'/>";
            str += "<input type='button' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'/>";
            str += "<input type='button' value='删' rel='d' s='" + o.attr("for") + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
            $(str).appendTo(tbody);
        });
        var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
        tst += tst;
        $(tst).appendTo(tbody);
        ot.append(tbody);
        $.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
        getUserInfo();
    }
}

//注单页面获取用户信息
function getUserInfo(){
	var url = ctx + '/ssc/getUserInfo?t=' + new Date().getTime();
	$.get(url,function(jsonResult, status){
		if(status=="success"){
			var obj = eval('(' + jsonResult + ')');
			if(obj.r==0){
				$("#anid").html(obj.data.an + "[" + obj.data.ht + "]&nbsp;&nbsp;");
				$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
			}
		}
	});
}

var firstFlag = 0;
var gameClass = {"KLC":"klc","SSC":"ssc","BJC":"bjc","JSKS":"jsks","XYNC":"xync","JXSSC":"jxssc","XJSSC":"xjssc","GDSYXW":"gdsyxw","GXKLC":"gxklc","TJKLC":"tjklc","TJSSC":"tjssc","SHSYXW":"shsyxw","SDSYXW":"sdsyxw",
		"JXSYXW":"sdsyxw","LNSYXW":"sdsyxw","HBSYXW":"sdsyxw","JSSYXW":"sdsyxw","SHSSC":"shssc","YNSSC":"ynssc","HNKLC":"hnklc"};
//获取赔率信息
function getRateInfo(gameId,betOn,isRefulsh){
	if(0==firstFlag){
		showLoader();
	}
	var dd = new Date().getTime();
	var url = ctx + '/ssc/getRateInfo';
	var handType = $("#hcType").val();
	$.get(url,{gameId:gameId,betOn:betOn,handType:handType,isRefulsh:isRefulsh,dd:dd},function(jsonResult, status){
		if(status=="success"){
			firstFlag = 1;
			var obj = jsonResult;
			if(obj.r==0){
				var issue = obj.data.issue;
				closeCountdown = obj.data.closeCountdown;
				optm = obj.data.optm;
				stopBet = obj.data.stopBetFlag;
				if(stopBet!=1){
					$("#optm").html('');
				}
				if($("#mawh").length>0){
					$("#mawh").val(obj.data.maxw);
				}
				var tem_is = issue.substring(8,issue.length);
				if(gameId == 'KLC' || gameId == 'GDSYXW' 
					|| gameId == 'TJKLC' || gameId == 'GXKLC'
					|| gameId == 'SDSYXW' || gameId == 'SHSYXW'	
					|| gameId == 'JXSYXW' || gameId == 'LNSYXW'
					|| gameId == 'HBSYXW' || gameId == 'JSSYXW'){
					tem_is = "0" + tem_is;
				}
				if(gameId=="BJKLC"){
					tem_is = issue;
				}
				$("#issueNow").html('<font color="green">' + tem_is + '期</font>&nbsp;<font color="#00F">' + $("#play_text").val()+'</font>');
				
				if(''==obj.data.oiss||null==obj.data.oiss){
					$("#oit").hide();
				}else{
					$("#oit").show();
					$("#oiss").html(obj.data.oiss);
					var ot = $("#oit");
					ot.children("tbody").remove();
					var tbody = $("<tbody></tbody>");
					var balls = obj.data.ball.split(",");
					var bstr = '';
					if(gameId=="BJKLC"){
						bstr = '<tr><td>';
						for ( var i=0;i<balls.length;i++) {
							bstr += '<span class="bjklc">' + balls[i] + '</span>';
							if(i==9){
								bstr += '<br>';
							}
						}
					}else{
						bstr = '<tr><td class="' + gameClass[gameId] + '">';
						for ( var i=0;i<balls.length;i++) {
							bstr += '<span class="number num' + balls[i] + '"></span>';
						}
						bstr += '</td></tr>';
					}
					$(bstr).appendTo(tbody);
					ot.append(tbody);
				}
				getCloseTime();
				$("#issue").val(issue);
				$("#ykmoney").html(showColor1(0 == obj.data.yk ? "0.00" : obj.data.yk));
				var arr = obj.list;
				var ids = new Array();
				var k = 0;
				for(var i=0;i<arr.length;i++){
					var id = arr[i].mKey;
					var value = arr[i].mValue;
					if($("#"+id).length>0 && $("#"+id).prev().html() != '0.00' && $("#"+id).prev().html()!=value){
						ids[k++] = id;
					}
					var obj = $('[for="'+ id +'"]');
					obj.attr("rateInfo",value);
					if((value + "").split(".").length == 1){
						value = value + ".00";
					}
					obj.text(value);
					if(isRefulsh==0){
						$("#"+id).prop("checked",false).checkboxradio("refresh");
					}
				}
				if(ids.length>0){
					if(!($("#bon").val().indexOf('SANZI') >= 0 || $("#bon").val().indexOf('ZUXUANLIU') >= 0)){
						blink(ids);
					}
				}
			}else{
				alert(jsonResult.m);
				window.location.href = ctx + "/index";
			}
		}else{
			alert("系统错误...");
			window.location.href = ctx + "/ssc/menu";
		}
		var orderCount = $('input:checkbox:checked').length;
		if(orderCount>0){
			obcs();
		}else{
			obch();
		}
		hideLoader();
	},"json").fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'parsererror'){
			alert("用户会话失效或在其他终端登录被踢出，请您重新登录！");
			window.location.href = ctx + "/login";
		}     		
	});
};

var timer = null;
function blink(ids){
	for(var i=0;i<ids.length;i++){
		$("#"+ids[i]).prev().addClass('myBlink');
	}
	timer = setTimeout(function(){stopBlink(ids);},2000);
}

function stopBlink(ids){
	for(var i=0;i<ids.length;i++){
		$("#"+ids[i]).prev().removeClass('myBlink');
	}
	clearTimeout(timer);
}

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit();
	var url = ctx + '/ssc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.success == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    obch();
                    alert(utf8to16(base64decode('5LiL5rOo5oiQ5Yqf77yM6K+35qOA5p+l5LiL5rOo54q25Ya15ZKM6LSm5oi35Y6G5Y+y77yB')));
                    $("input[name='isChange']").val("0");
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                    if($("#bon").val().indexOf('SERIAL')>=0&&$("#bon").val()!='SERIAL_2_LZ'){
                	    changeBetOn($("#bon").val(),1);
                	}else if($("#bon").val().indexOf('SERIAL_2_LZ')>=0){
                		qno = 0;
                		hno = 0;
                	}
                    if ($("#bon").val().indexOf('YIZI') >= 0
						|| $("#bon").val().indexOf('ERZI') >= 0
						|| $("#bon").val().indexOf('SANZI') >= 0
						|| $("#bon").val().indexOf('ZUXUANSAN') >= 0
						|| $("#bon").val().indexOf('ZUXUANLIU') >= 0
						|| $("#bon").val().indexOf('KUADU') >= 0) {
                    	if($("#bon").val().indexOf('SANZIDW') >= 0){
                    		bkflag=1;
                    	}
						changeBetOn($("#bon").val(), 1);
					}
                }else if(jsonResult.data.success == 0){
                	enableSubmitBtn();
                	alert(jsonResult.data.promptName);
                }else if(jsonResult.data.success == 2){
                	enableSubmitBtn();
                	var r = confirm(jsonResult.data.promptName);
                	if(r==true){
                		$("input[name='isChange']").val("1");
                		$("#submitBtn").click();
                	}else{
                		if($("#bon").val()=='SERIAL_2_LZ'){
                			getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
                		}else{
                			getRateInfo($("#gameId").val(),$("#bon").val(),0);
                		}
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                		if($("#bon").val().indexOf('SERIAL')>=0&&$("#bon").val()!='SERIAL_2_LZ'){
                		    changeBetOn($("#bon").val(),1);
                		}
                		if ($("#bon").val().indexOf('YIZI') >= 0
    						|| $("#bon").val().indexOf('ERZI') >= 0
    						|| $("#bon").val().indexOf('SANZI') >= 0
    						|| $("#bon").val().indexOf('ZUXUANSAN') >= 0
    						|| $("#bon").val().indexOf('ZUXUANLIU') >= 0
    						|| $("#bon").val().indexOf('KUADU') >= 0) {
                			if($("#bon").val().indexOf('SANZIDW') >= 0){
                	    		bkflag=1;
                	    	}
    						changeBetOn($("#bon").val(), 1);
    					}
                	}
                }
			}else{
				if(jsonResult.m!=""){
					enableSubmitBtn();
					alert(jsonResult.m);
				}else{
					alert('系统错误！');
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
				}
			}
		}else{
			alert('系统错误！');
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
		}
	},"json");
	
    jqxhr.always(function() {
    	//setTimeout(enableSubmitBtn, 100);
	});	
}
function enableSubmitBtn(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
}
//两面以及单个球中注单提交
function sbc(){
	var checkR = checkParam();
	if(checkR){
		subOrder();
	}
}

//连码注单提交
function ssbc(){
	if($("#issue").val()!=$("#isid").html()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
    	changeBetOn($("#bon").val(),1);
	}else{
		var obj = $("[name='amount']");
		var amount = $("#serial_money").val();
		for(var j = 0; j < obj.length; j++){
			obj[j].value = amount;
		}
		subOrder();
	}
}

var rtime=20;//刷新时间间隔
var stime=5;//封盘后间隔请求时间
var stopBet=0;
var closeCountdown=0;
var optm=0;

var c=rtime;
var s=stime;	
setInterval(function(){
	if(firstFlag==1){
		if(stopBet!=1){
			//$("#ykMoneyDiv").show();
			c--;
			closeCountdown--;
			getCloseTime();
			if(c<=0){
				c=rtime;
				if($("#bon").val()=='SERIAL_2_LZ'||$("#bon").val()=='SERIAL_ZHI_2'||$("#bon").val()=='SERIAL_ZHI_3'){
        			getRateInfo_2lz($("#gameId").val(),$("#bon").val(),1);
        		}else{
        			getRateInfo($("#gameId").val(),$("#bon").val(),1);
        		}
			}
			$("input[type='checkbox']").checkboxradio("enable");
		}else{
			//$("#ykMoneyDiv").hide();
			$("#closeCountdown").html('<font color="red">已封盘</font>');
			if(optm>0){
				if(optm > 20 * 60){
					$("#optm").html('');
				}else{
					$("#optm").html('距开奖:<font color="red">' + stm(optm) + '</font>');
					optm--;
				}
			}else{
				if(optm<0){
					$("#optm").html('');
				}else{
					$("#optm").html('正在开奖...');
				}
			}
			$("label").each(function(){
				$(this).text("0.00");
			});
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			orderCount = 0;
			obch();
			s--;
			if(s<=0){
				s=stime;
				stopBet=0;
				if($("#bon").val()=='SERIAL_2_LZ'||$("#bon").val()=='SERIAL_ZHI_2'||$("#bon").val()=='SERIAL_ZHI_3'){
        			getRateInfo_2lz($("#gameId").val(),$("#bon").val(),0);
        		}else{
        			getRateInfo($("#gameId").val(),$("#bon").val(),0);
        		}
			}
		}
	}
},1000);

function getCloseTime(){
	if(closeCountdown>0){
		if(closeCountdown<rtime){
			c=closeCountdown;
		}
		$("#closeCountdown").html('距封盘:<font color="red">' + stm(closeCountdown) + '</font>');
	}else{
		stopBet=1;
	}
}

function stm(time){
	var strTime = '';
	var min = Math.floor(time/60);
	var sec = time-60*min;
	if(min<10){
		strTime += '0' + min + ':'; 
	}else{
		strTime += min + ':';
	}
	if(sec<10){
		strTime += '0' + sec; 
	}else{
		strTime += sec;
	}
	return strTime;
}

//连码展示注单
function creShowOrder(){
	var obj = $("[name='typeTitle']");
	var parr = new Array();
	for(var i=0;i<obj.length;i++){
		parr[i] = obj[i].value;
	}
	var i = 0;
	var str = '';
	var bon = $("#bon").val();
	var n = bonNum[bon];
	var rarr = new Array();
	getComb(i,str,parr,n,rarr);
	if(rarr.length<1){
		return false;
	}else{
		var ot = $("#showOrderTable");
		ot.children("tbody").remove();
		var tbody = $("<tbody></tbody>");
		for(var i=0;i<rarr.length;i++){
			var nos = rarr[i].substring(0,rarr[i].length-1).split(",");
			var temRate = 99999;
			for(var k=0;k<nos.length;k++){
				var tno = nos[k];
				if(tno.substring(0,1)==0){
					tno = tno.substring(1, tno.length);
				}
				var mr = $("#r_NO_" + tno).val();
				if(mr<temRate){
					temRate = mr;
				}
			}
			var str = "";
			str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
			str += $("#play_text").val() + rarr[i].substring(0,rarr[i].length-1) + "</span>";
			str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + temRate + "</span></td>";
			str += "<td align='right' class='tdselect' style='border:none;font-size:12px;'><span>" + formNumber($("#serial_money").val(),2) + " &nbsp; </span></td></tr>";
			$(str).appendTo(tbody);
		}
		var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
		tst += tst;
		$(tst).appendTo(tbody);
		ot.append(tbody);
		ot.trigger( "create" );
		$("#totalOrders").text(utf8to16(base64decode('5oC75rOo5pWw77ya')) + rarr.length + utf8to16(base64decode('77yM5oC75LiL5rOo6YeR6aKd77ya')) + formNumber((rarr.length*$("#serial_money").val()),2));
		return true;
	}
}

function getComb(i,str,parr,n,rarr){
	if(n==0){
		rarr.push(str);
		return;
	}
	if(i==parr.length){
		return;
	}
	getComb(i+1,str+parr[i]+",",parr,n-1,rarr);
	getComb(i+1,str,parr,n,rarr);
}

function obch(){
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
}

function obcs(){
	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").addClass('spnicon').text($("input:checked").length);
}

var hca = 0;
function showhc(){
	if(null!=cht&&''!=cht){
		$("#hcts").attr('class', "btt-" + cht);
		$("#hcType").val(cht);
	}else{
		hca = 1;
		$("#hcts").attr('class', "btt-" + uhc[0]);
		$("#hcType").val(uhc[0]);
	}
	getRateInfo($("#gameId").val(),$("#bon").val(),0);
}
function changeHC(v){
	$("#hdcpPopup").popup("close");
	$("#hcts").attr('class', "btt-" + v);
	$("#hcType").val(v);
	getRateInfo($("#gameId").val(),$("#bon").val(),0);
}

document.onkeydown = function(event) {
	var target, code, tag;
	if (!event) {
		event = window.event; //针对ie浏览器  
		target = event.srcElement;
		code = event.keyCode;
		if (code == 13) {
			tag = target.tagName;
			if (tag == "TEXTAREA") {
				return true;
			} else {
				return false;
			}
		}
	} else {
		target = event.target; //针对遵循w3c标准的浏览器，如Firefox  
		code = event.keyCode;
		if (code == 13) {
			tag = target.tagName;
			if (tag == "INPUT") {
				return false;
			} else {
				return true;
			}
		}
	}
};