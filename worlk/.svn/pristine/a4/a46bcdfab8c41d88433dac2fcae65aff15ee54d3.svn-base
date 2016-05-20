function initParam(){
	$("#amount").val('');
	$("#p_amount").val('');
	$("#p_betAmount").val('');
	$("#p_betBall").val('');
	$("#p_betBallStr").val('');
	$("#p_betBallTou").val('');
	$("#p_betBallTuo").val('');
	$("#p_betType").val('');
	$("#p_gameCode").val('');
	$("#p_isChange").val('0');
	$("#p_noteCount").val('');
	$("#p_passType").val('');
	$("#p_pgameCode").val('');
	$("#p_rate").val('');
	$("#p_rate2").val('');
	$("#p_rateAll").val('');
	$("#p_rateAll2").val('');
	$("#p_rateStr").val('');
	$("#p_rateTou").val('');
	$("#p_rateTuo").val('');
	$("#p_tuoType").val('');
}

//注单页面获取用户信息
function getUserInfo(){
	var url = ctx + '/hkc/getUserInfo?t=' + new Date().getTime();
	$.get(url,function(jsonResult, status){
		if(status=="success"){
			var obj = eval('(' + jsonResult + ')');
			if(obj.r==0){
				$("#anid").html(obj.data.an + "[" + obj.data.htn + "]&nbsp;&nbsp;");
				$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
			}
		}
	});
}

//下*_*注成功后清除注*_*单按钮
function obch(){
	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
	$("#tc_" + tcode).addClass('ui-btn-active');
	$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
	$("#orderCount").removeClass('spnicon').text('');
}

function subch(){
	var te= /^[1-9]+[0-9]*]*$/;
	if(!te.test($("#amount").val())){
		var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
		return;
	}
	$("#p_betAmount").val($("#amount").val());
	$("#p_amount").val($("#amount").val()*$("#p_noteCount").val());
	if(tcode=='08'){//多*——*组投*——*注  8,8,8
		var tamt = '';
		for(var i=0;i<$("#p_noteCount").val();i++){
			tamt += $("#amount").val() + ',';
		}
		$("#p_betAmount").val(tamt.substring(0, tamt.length-1));
	}
	subOrder();
}

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit("注单提交中,请稍后...");
	var url = ctx + '/hkc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.code == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
                    obch();
                    //alert('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');
                    var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                    initParam();
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                    changeGame($("#gamec").val(),0);
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#p_isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
                    	$("#tc_" + tcode).addClass('ui-btn-active');
                		initParam();
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                		changeGame($("#gamec").val(),0);
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	$("#gamec_" + $("#gamec").val()).addClass('ui-btn-active');
                	$("#tc_" + tcode).addClass('ui-btn-active');
                	alert(jsonResult.data.description);
               		initParam();
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
               		changeGame($("#gamec").val(),0);
                }
			}else{
				if(jsonResult.m!=""){
					alert(jsonResult.m);
					$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
				}else{
					alert('系统错误！');
					$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                    changeGame($("#gamec").val(),0);
				}
			}
		}else{
			alert('系统错误！');
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
            changeGame($("#gamec").val(),0);
		}
	},"json");
	
    jqxhr.always(function() {
		//$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
	});	
}

function setOpenBall(balls){
	//console.log(balls);
	var ball = balls.split(',');
	var str = '';
	for(var i=0;i<ball.length;i++){
		//<div class="ball2 red-ball float-l" ball="2">2</div>
		var tcl = '';//ball red-ball
		if(hkcutil.getRedBall().contains(ball[i])){
			tcl = 'border-color-r ball-result float-l';
		}else if(hkcutil.getBlueBall().contains(ball[i])){
			tcl = 'border-color-b ball-result float-l';
		}else if(hkcutil.getGreenBall().contains(ball[i])){
			tcl = 'border-color-g ball-result float-l';
		}else{
			tcl = 'border-color-g2 ball-result float-l';
		}
		if(i==6){
			str += '<div class="b-txt">+</div>'
		}
		str += '<div class="' + tcl + '" ball="2">' + ('' == ball[i] ? '?' : ball[i]) + '</div>';
	}
	$("#openball").html(str);
}

function countdown(){
	$countdown = $("#cdt").countdown($("#sealTime").val());
	$countdown.on('update.countdown' , function(event) {
     	var totalHours = event.offset.totalDays * 24 + event.offset.hours;
     	if(s==0){
     		$("#cdt").html('');
     	}else{
     		$("#cdt").html('<font color="black">&nbsp;距封盘 </font>' + event.strftime(totalHours + ':%M:%S'));
     	}
     });
     $countdown.on('finish.countdown' , function(event) {
     	//getRate();
     });
}