<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<style type="text/css">
        #keypan{  margin:0px;padding:0px; line-height:20px;width:98%;}
        #keypan #main{ list-style:none; border:#999900 dashed 0px; margin:0px auto 1px auto; width:100%; padding:0px; overflow:auto;  }
        #keypan #main2{ list-style:none; border:#999900 dashed 0px; margin:0px auto 1px auto; width:100%; padding:0px; overflow:auto;}
        #keypan #main,#keypan #main2{background:#fff;}
        #main td{ text-align:center; border:#ddd solid 1px; padding:1px; margin:1px;width:18%;line-height:30px;height:30px;  cursor:pointer;font-weight: bold; font-size:16px;color:#000;}
        #main2 td{ text-align:center; border:#ddd solid 1px; padding:1px; margin:1px;width:31%; line-height:30px;height:30px; cursor:pointer;font-weight: bold; font-size:16px;color:#000;}
        #main2 td#esckeynumber,#main td#backkeynumber,#main td#enterkeynumber,#main2 td#esckeymoney,#main td#backkeymoney,#main td#enterkeymoney,#main2 td#Xkeynumber,#main2 td#Xkeymoney{ width:18%; }
        .meunpage:link { color: #0033cc;font-weight: bold;}
        .meunpage:visited { color: #0033cc;font-weight: bold;}
        .meunpage:active {color:#0033cc;font-weight: bold;}
        .meunpage:hover { color: #0033cc;font-weight: bold;}
        #keypan{margin-left:5px;margin-right:5px;}
    </style>
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>

</head>
<body>
<div class="list_dingtime" data-role="page" id="rateInfoPage">
<c:set var="page_type" value="1" scope="request"/>
<c:set var="page_title" value="快打" />
<%@ include file="/WEB-INF/page/qxc/com_header.jsp" %>
<%@ include file="/WEB-INF/page/qxc/panel_left_qxc.jsp" %>
<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
<div data-role="content" id="rateRefInfo">
	<div style="text-align: center;">
	 	<div class="ui-on-lottery">	
	        <div id="openball" alt="ob" class="ob">
	        </div>
	        <div class="w100 arr-center font-bold txt-12" id="id_iss">当前第 <span class="color-red" id="s_is"></span> 期 <span class="color-red" id="cdt"></span><span class="color-red" id="close_id"></span></div>
     	</div>
    </div>
	<input type="hidden" name="gid" id="gid" value="">
      <div data-role="navbar" class="ui-toggle-uptodown-kx">      	       
          
          <ul>
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('39')" class="ui-btn-active">四字现</a>
              </li>
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('32')">全转</a>
              </li>
          </ul>
      </div>
          <div class="clear"></div>
          <div class="table-cotent-lottery ui-height-content">
          
          
          <div class="ui-table ui-table-middle-line">
                <table class="ui-table-qxstar">
                    <thead data-role="th-groups">
                        <tr>
                            <td>号码</td>
                            <td>金额</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td ><input size="7" type="text" onpaste="return false" name="n" id="n" class="number"  maxlength="4" readonly="readonly"></td>
                        <td><input  size="7" type="text" name="m" id="m" class="number" maxlength="8" readonly="readonly"></td>
                    </tr>    
                                
                    </tbody>
                </table>    

			<div id="keypan"></div>

            <div class="ui-tip-qxc">
                <p class="ui-red">
                <strong>说明:</strong><br/>
				1、快打支持一{[{5a6a}]}位的千、百、十、个位、二{[{5a6a}]}位、三{[{5a6a}]}位、四{[{5a6a}]}位、一{[{5a2X}]}现、二{[{5a2X}]}现、三{[{5a2X}]}现、四{[{5a2X}]}现的任何号码。<br/>
				2、定位号码里的x符号，可以直接输入“+”或者是字母“x”。如：要${msg['label.qxc.bet']}1XX2,可直接输入：1++2或者是1xx2即可。<br/>
				3、在号码框里输入几位号码（1-3位），就表示几{[{5a2X}]}现，如：输入号码1,表示1{[{5a2X}]}现的1号码，输入12号，表示二{[{5a2X}]}现的12号码。四{[{5a2X}]}现和四{[{5a6a}]}位用“四{[{5a2X}]}现”勾选框区别，“四{[{5a2X}]}现”打上勾，表示${msg['label.qxc.xiazhu']}四{[{5a2X}]}现玩法。<br/>
				4、全转，在号码框里输入任意1-4位数，输入的几位号码即为几{[{5a6a}]}位，提交的{[{5rOo}]}单为这几个号码该定位的所有组合。<br/>
                </p>
            </div>
            </div>
          
          </div>
          </div>
    </div>
    <%@ include file="/WEB-INF/page/qxc/com_bet_kx.jsp" %>
    
    <script>
    	var gcl = '${obj}';
        var gid = "${obj.gid}";
        $(function(){
        $(".ui-toggle-uptodown-kx").css("height","auto");
        $("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGid('" + $("#gid").val() + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
		
		$("#isChange").val("2");
        //gid = $("#gid").val();
        getRate(gid);
            
        <%-- 下*_*注页面，点击填按钮 --%>
		    $(document).on("click","input[rel='w']",function(e){
		    	var num = 5;
				if(''!=$(this).prev().val()){
			        num = $(this).prev().val();
				}
				var o = $("[name='amount']");
				for(var j = 0; j < o.length; j++){
					o[j].value = num;
				}
		    });
		    <%--下*_*注页面点击删按钮--%>
		    $(document).on("click","input[rel='d']",function(e){
				var b = $(this).parent().parent().parent().siblings().length;
			    $(this).parent().parent().parent().remove();
			    if(b == 2){
			        $.mobile.changePage("#rateInfoPage", {transition:'none'});
			    	$("ul li .ui-btn-active").removeClass("ui-btn-active");
			    	var str = "changeGid('" + $("#gid").val() + "')";
			    	$("[onclick='" + str + "']").addClass("ui-btn-active");
			    }
		    });
		    $("#orderBtn").on("click",function(e) {
		    	if(s_io==0){
		    		alert("当前期已经封盘");
		    		return;
		    	}
		    	var stn = 0;
		    	$("[name='n']").each(function (){
       				if(""!=$.trim($(this).val())){
       					stn++;
       				}
       			});
       			if(stn==0){
       				alert("请输入号码");
       				$('[name="n"]').focus();
       				return;
       			}
		        enableSubmitBtn();
				if (checkNum()&&checkNM()){
			    	$("#issue").val($("#s_is").text());
			    	$("#isid").text($("#s_is").text());
			    	var arrZH = getZH_Rate();
			    	arrZH = checkGame(arrZH);
			    	if(arrZH.length == 0){
			    		return ;
			    	}
			    	getCtmRate(arrZH);
			        var ot = $("#orderTable");
			        ot.children("tbody").remove();
			        var tbody = $("<tbody></tbody>");
			        for(var i=0;i<arrZH.length;i++){
			        	//array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
			        	var temazh = arrZH[i];
						var str = "";
			            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
			            str += temazh[2] +'@' + temazh[1] + "</span>";
			            str += "<span class='spannum2'>@</span> <span class='spannum3' data-trate='"+ temazh[1] +"'></span>";
			            str += "<input type='hidden' name='code' data-code='"+ temazh[1] +"' value='"+ temazh[0] +"'>";
			            str += "<input type='hidden' name='type' data-type='"+ temazh[1] +"' value='"+ temazh[1] +"'>";
			            str += "<input type='hidden' name='com' data-com='"+ temazh[1] +"' value=''>";
			            str += "<input type='hidden' name='rate' data-rate='"+ temazh[1] +"' value=''></td>";
			            str += "<td align='right' class='tdselect' style='border:none;'><span>"
			            str += "<input type='number' min='1' max='50000' data-amount='"+ temazh[1] +"' value='"+ temazh[3] +"' name='amount' class='numb_px' data-role='none'/>";
			            str += "<input type='button' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'/>";
			            
			            str += "<input type='button' value='删' rel='d' s='" + temazh[2] + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
			            $(str).appendTo(tbody);
			        }
			        
			        var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
			        tst += tst;
			        $(tst).appendTo(tbody);
			        ot.append(tbody);
			        
			        $.mobile.changePage("#toBet", {changeHash:false ,transition:'none'});
			        getUserInfo();
			    }
		    });
		    <%--提交注*_*单--%>
		    $("#submitBtn").on("click",function(){
		    	var checkR = checkParam();
				if(checkR){
					var tobj = $("[name='type']");
					var betBall = "";
					for(var i=0;i<tobj.length;i++){
						betBall +=  tobj[i].value.replace(/\X/g, "") + ",";
					}
					var robj = $("[name='rate']");
					var rateAll = "";
					for(var i=0;i<robj.length;i++){
						rateAll +=  robj[i].value + ",";
					}
					var aobj = $("[name='amount']");
					var betAmount = "";
					for(var i=0;i<aobj.length;i++){
						betAmount +=  aobj[i].value + ",";
					}
					var gobj = $("[name='code']");
					var gCode = "";
					for(var i=0;i<gobj.length;i++){
						gCode +=  gobj[i].value + ",";
					}
					var cobj = $("[name='com']");
					var coms = "";
					for(var i=0;i<cobj.length;i++){
						coms +=  cobj[i].value + ",";
					}
					
					$("#betBall").val(betBall.substring(0, betBall.length-1));
					$("#rateAll").val(rateAll.substring(0, rateAll.length-1));
					$("#betAmount").val(betAmount.substring(0, betAmount.length-1));
					$("#gameCode").val(gCode.substring(0, gCode.length-1));
					$('#comm').val(coms.substring(0, coms.length-1))
					subOrder();
				}
		    });
		    
		    $('[name="n"]').focus();
		    
        });

	    function validNum(){
	    	var $n = $('[name="n"]');
	    	var v = $n.val().toUpperCase().replace(/[^0-9]/g, "X");
			$(this).val(v);
			if(v == 'XXXX'){
				alert($n.val() + ' 输入有误。');
				$n.val('XXX').focus();
				return ;
			}
			if (v.length >= 4) {
				$('[name="m"]').focus();
			}
	    }
	    
        function getNum(){
			var gnum = $('[name="n"]').val();
        	
        	if(gnum == ''){
        		$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").removeClass('spnicon').text('');
        	}else{
        		$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").addClass('spnicon').text(1);
        	}
        }
        
        function changeGid(id){
        	var g = $("#gid").val();
        	
        	if (g == id) {
        		$("[onclick='changeGid('"+ id +"')']").removeClass('ui-btn-active');
            	$("#gid").val('');
        	} else {
        		$("ul li .ui-btn-active").removeClass("ui-btn-active");
        		$("[onclick='changeGid('"+ id +"')']").addClass('ui-btn-active');
            	$("#gid").val(id);
        	}
        	
        	$("[name='n']").val("").focus();
        	$("[name='m']").val("");
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
        	//getRate(gid);
        	event.stopPropagation();
        }
        
        var s_is = '';
		var s_ob = '';
		var s_ot = '';
		var s_st = '';
		var s_io = '';<%-- 封：0，开*盘*中为：1--%>
		var s_flag = 0;
        function getRate(game,px,tj){
			var url = ctx + '/qxc/getRateInfo_kx';
			var pk = ss.getItem("pk");
			$.get(url,{game:game,px:px,tj:tj,pk:pk},function(jsonResult){
				var obj = eval('(' + jsonResult + ')');
				if(obj.r==0){
					if(obj.data.code==0){
						s_is = obj.data.issue;
						s_ob = obj.data.ob;
						s_ot = obj.data.ot;
						s_io = obj.data.io;
						s_st = obj.data.st;
						s_flag = 1;
						$("#mi").val(obj.data.mi);
						$("#mx").val(obj.data.mx);
						$("#tm").val(obj.data.tm);
					}else if(obj.data.code==2){
						var btem = replaceAllHtml('该玩法已经隐藏，不能{[{5oqV5rOo}]}!');alert(btem);
						window.location.href = ctx + "/qxc";
					}
				}else{
					var obj = eval('(' + jsonResult + ')');
					alert(obj.m);
					window.location.href = ctx + "/index";
				}
			});
		}
		function enableSubmitBtn(){
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
		}
		function getUserInfo(){
			var url = ctx + '/qxc/getUserInfo?t=' + new Date().getTime();
			$.get(url,function(jsonResult, status){
				if(status=="success"){
					var obj = eval('(' + jsonResult + ')');
					if(obj.r==0){
						$("#anid").html(obj.data.an + "&nbsp;&nbsp;");
						$("#acid").html(formNumber(obj.data.ac,3) + "&nbsp;&nbsp;");
					}
				}
			});
		}

		var dtd = $.Deferred();
		
function getCtmRate(array) {
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	var url = ctx + '/qxc/getRateInfo_kd';
	var pk = ss.getItem("pk");
	var gamecodeStr = '',ballStr = '',amountStr = $('[name="m"]').val();
	if (array.length != 0) {
		for (var i in array) {
			gamecodeStr += ',' + array[i][0];
			ballStr += ',' + array[i][1];
		}
		gamecodeStr = gamecodeStr.substring(1);
		ballStr = ballStr.substring(1);
	}
	
	$.get(url,{gamecodeStr:gamecodeStr,ballStr:ballStr,amountStr:amountStr,pk:pk},function(jsonResult){
		var obj = eval('(' + jsonResult + ')');
		if(obj.r==0){
			if(obj.list != 'undefined' && obj.list.length > 0){
				for (var i in obj.list) {
					$("[data-trate='"+obj.list[i][3]+"']").text(obj.list[i][4]);
					$("[data-rate='"+obj.list[i][3]+"']").val(obj.list[i][4]);
					$("[data-amount='"+obj.list[i][3]+"']").val(obj.list[i][5]);
					$("[data-com='"+obj.list[i][3]+"']").val(obj.list[i][6]);
					//yi定wei
					if (obj.list[i][0] == '32') {
						$("[data-type='"+obj.list[i][3]+"']").val(obj.list[i][2]);
						$("[data-code='"+obj.list[i][3]+"']").val(32);
					}
				}
				$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
			}else if(obj.data.code==2){
				var btem = replaceAllHtml('该玩法已经隐藏，不能{[{5oqV5rOo}]}!');alert(btem);
				window.location.href = ctx + "/qxc";
			}
		}else{
			var obj = eval('(' + jsonResult + ')');
			alert(obj.m);
			window.location.href = ctx + "/index";
		}
	});
}		

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit(replaceAllHtml("{[{5rOo}]}单提交中，请稍后..."));
	var url = ctx + '/qxc/complex/storage';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.code == 1){
                    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
                    var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                    $("ul li .ui-btn-active").removeClass("ui-btn-active");
					var str = "changeGid('" + $("#gid").val() + "')";
					$("[onclick='" + str + "']").addClass("ui-btn-active");
					Reset();
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                		$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
    					$("#orderCount").removeClass('spnicon').text('');
                		$("ul li .ui-btn-active").removeClass("ui-btn-active");
						var str = "changeGid('" + $("#gid").val() + "')";
						$("[onclick='" + str + "']").addClass("ui-btn-active");
						Reset();
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	alert(jsonResult.data.description);
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
               		$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
               		$("ul li .ui-btn-active").removeClass("ui-btn-active");
					var str = "changeGid('" + $("#gid").val() + "')";
					$("[onclick='" + str + "']").addClass("ui-btn-active");
					Reset();
                }
			}else{
				alert('系统错误！');
				$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                $.mobile.changePage("#rateInfoPage", {transition:'none'});
                $("ul li .ui-btn-active").removeClass("ui-btn-active");
				var str = "changeGid('" + $("#gid").val() + "')";
				$("[onclick='" + str + "']").addClass("ui-btn-active");
			}
		}else{
			alert('系统错误！');
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
            $("ul li .ui-btn-active").removeClass("ui-btn-active");
			var str = "changeGid('" + $("#gid").val() + "')";
			$("[onclick='" + str + "']").addClass("ui-btn-active");
		}
	},"json");

    jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	hideLoader();
		if(textStatus == 'error'){
			console.log("error:" + jqXHR.responseText);
		}else if(textStatus == 'parsererror'){
			if(jqXHR.responseText.indexOf("session invalidate") > -1){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";					
			}else{
				console.log("parsererror:" + jqXHR.responseText);
			}
		} 
    });
    	
    jqxhr.always(function() {
    	$("#isChange").val("2");
		//$("#submitBtn").removeClass("ui-state-disabled");
	});	
}

function Reset(){
	$('[name="n"]').val('').focus();
	$('[name="m"]').val('');
}

function checkParam(){
	var obj = $("[name='amount']");
	var te= /^[1-9]+[0-9]*]*$/;
	for(var i = 0; i < obj.length; i++){
		if(!te.test(obj[i].value)){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
			return false;
		}
		if(parseInt(obj[i].value)<parseInt($("#mi").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能低于单{[{5rOo}]}最低限额' + $("#mi").val());alert(btem);
			return;
		}
		if(parseInt(obj[i].value)>parseInt($("#mx").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ obj[i].value + '不能高于单{[{5rOo}]}最高限额' + $("#mx").val());alert(btem);
			return;
		}
	}
	if($("#issue").val()!=$("#s_is").text()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
		return false;
	}
	return true;
}

function checkGame(array) {
	var bl = false;
	var tem = [];
	var ra = [];
	if (array !== undefined && array.length > 0) {
		var gclb = gcl.indexOf('32');
		for (var i in array) {
			if (gcl.indexOf(array[i][0]) == -1 && !(gclb > -1 && (array[i][0] + '').indexOf('32') > -1) ) {
				tem.push(array[i]);
			} else {
				ra.push(array[i]);
			}
		}
		if (ra.length > 0) {
			if (tem.length > 0) {
				var gameStr = replaceAllHtml('您输入的部分{[{546p5rOV}]}：\n');
				for (var j in tem) {
					gameStr += tem[j][2] + '@' +tem[j][1] + '\n';
				}
				gameStr += replaceAllHtml('已经被隐藏，是否继续下{[{5rOo}]}？');
				var r = confirm(gameStr, '\n');
				if (r != true) {
					$('[name="n"]').focus();
					return [];
				}
			}
			return ra;
		} else {
			var gameStr = replaceAllHtml('您输入的{[{546p5rOV}]}：\n');
			for (var j in tem) {
				gameStr += tem[j][2] + '@' +tem[j][1] + '\n';
			}
			gameStr += replaceAllHtml('已经被隐藏，请重新输入。');
			
			var btem = replaceAllHtml('您输入的玩法已经被隐藏，请重新输入。');alert(gameStr);
			$('[name="n"]').focus();
			return [];
		}
	}
	return ra;
}

function checkNum(){
	var falg = true,reg = new RegExp("^[0-9]*$"),reg1 = new RegExp("^[0-9X]*$");
	var $num = $("[name='n']");
	var tgid = $('#gid').val();
	
	if(tgid == '' || tgid == 39){
		if(!( (reg.test($.trim($num.val())) && $.trim($num.val()).length < 4 && tgid == '') 
				|| (reg1.test($.trim($num.val())) && $.trim($num.val()).length == 4) )){
			alert('号码['+$num.val()+']输入有误!!');
			$num.focus();
			falg = false;
		} else {
			if($.trim($num.val()).length <= 0){
				alert("号码["+ $num.val() +"]不合法,请输入1位数字！");
				$num.focus();
				falg = false;
			}
		} 
	} else if(tgid == 32){
		if(!reg.test($.trim($num.val()))){
			alert('号码['+$num.val()+']输入有误!!');
			$num.focus();
			falg = false;
		} else {
			if($.trim($num.val()).length <= 0){
				alert("号码["+ $num.val() +"]不合法,请输入1位数字！");
				$num.focus();
				falg = false;
			}
		}
	}
	
    return falg;
}
function checkNM(){
	var falg = true;
	
	$("[name='m']").each(function (){
		var te= /^[1-9]+[0-9]*]*$/;
		
		if(""!=$.trim($(this).val())){
			var  reg = new RegExp("^[0-9]*$");
			if(!reg.test($.trim($(this).val()))){
				var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
				$(this).val('').focus();
				falg = false;
				return ;
			}else{
    			$(this).val($.trim($(this).val()));
			}
		} else {
			alert("请输入金额");
			$(this).focus();
			falg = false;
			return ;
		}
		
		if(!te.test($(this).val()) && $(this).val() != ''){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
			$(this).val('').focus();
			falg = false;
			return ;
		}
		if(parseInt($(this).val())<parseInt($("#mi").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ $(this).val() + '不能低于单{[{5rOo}]}最低限额' + $("#mi").val());alert(btem);
			$(this).val('').focus();
			falg = false;
			return ;
		}
		if(parseInt($(this).val())>parseInt($("#mx").val())){
			var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ $(this).val() + '不能高于单{[{5rOo}]}最高限额' + $("#mx").val());alert(btem);
			$(this).val('').focus();
			falg = false;
			return ;
		}
		
	});
	
	return falg;
}

var gid_code = {'口XXX':3201,'X口XX':3202,'XX口X':3203,'XXX口':3204,
				'口口XX':3301,'口X口X':3302,'口XX口':3303,'X口口X':3304,'X口X口':3305,'XX口口':3306,
				'口口口X':3401,'口口X口':3402,'口X口口':3403,'X口口口':3404};

function dwCG(num) {
	var name = ''
	switch (num) {
	case 1:
		name = replaceAllHtml('三{[{5a6a}]}位');
		break;
	case 2:
		name = replaceAllHtml('二{[{5a6a}]}位');
		break;
	case 3:
		name = replaceAllHtml('一{[{5a6a}]}位');
		break;
	case 4:
		name = replaceAllHtml('四{[{5a6a}]}位');
		break;
	default:
		name = '';
		break;
	}
	return name;
}

function zxCG(num) {
	var name = ''
	switch (num) {
	case 1:
		name = replaceAllHtml('一{[{5a2X}]}现');
		break;
	case 2:
		name = replaceAllHtml('二{[{5a2X}]}现');
		break;
	case 3:
		name = replaceAllHtml('三{[{5a2X}]}现');
		break;
	case 4:
		name = replaceAllHtml('四{[{5a2X}]}现');
		break;
	default:
		name = '';
		break;
	}
	return name;
}
				
function getZH_Rate(obj){
	var array = new Array();
	var temN = new Array();
	var inNum = $("[name='n']").val();
	var tgid = $('#gid').val();
	if (tgid == '') {
		if (inNum.length < 4) {
			//X字现
			inNum = inNum.split('').sort(function(a,b){return a>b?1:-1}).join("");
			if (inNum.length == 1) {
				temN.push(36);//yi字
				temN.push(inNum);
				temN.push(zxCG(1));
			} else if (inNum.length == 2) {
				temN.push(37);//er字
				temN.push(inNum);
				temN.push(zxCG(2));
			} else if(inNum.length == 3) {
				temN.push(38);//san字
				temN.push(inNum);
				temN.push(zxCG(3));
			}
		} else if (inNum.length == 4) {
			//X定wei
			if (inNum.indexOf('X') > -1) {
				//定wei
				var inNum_Code = inNum.replace(/\d/g, "口");
				temN.push(gid_code[inNum_Code]);
				temN.push(inNum);
				temN.push(dwCG(inNum.split('X').length -1));
			} else {
				//si定wei
				temN.push(35);
				temN.push(inNum);
				temN.push(dwCG(4));
			}
		}
	} else if (tgid == 39) {
		if (inNum.indexOf('X') > -1) {
			//X定wei
			var inNum_Code = inNum.replace(/\d/g, "口");
			temN.push(gid_code[inNum_Code]);
			temN.push(inNum);
			temN.push(dwCG(inNum.split('X').length -1));
		} else {
			//si字xian
			inNum = inNum.split('').sort(function(a,b){return a>b?1:-1}).join("");
			temN.push(39);
			temN.push(inNum);
			temN.push(zxCG(4));
		}
	} else if (tgid == 32){
		//X定wei
		var teminNum = inNum.split('');
		if (teminNum.length < 4 || inNum.indexOf('X') == -1) {
			for (var i = 4 - teminNum.length;i > 0; i--) {
				teminNum.push('X');
			}
			
			var temcode = [];
			var group = function (anum,temz) {
				temz === undefined ? temz = '' : '';
				
				if (anum.length == 1) {
					temz += anum[0];
					
					if ($.inArray(temz,temcode) == -1) {
						if ($.inArray('X',teminNum) == -1) {
							temN.push(35);
							temN.push(temz);
							temN.push(dwCG(4));
						} else {
							var temz_Code = temz.replace(/\d/g, "口");
							temN.push(gid_code[temz_Code]);
							temN.push(temz);
							temN.push(dwCG(temz.split('X').length -1));
						}
						temcode.push(temz);
						array.push(temN);
						temN = [];
					}
				} else if (anum.length > 1) {
					for (var i in anum) {
						var temz1 = temz.slice();
						var anum1 = anum.slice();
						temz1 += anum1[i];
						anum1.splice($.inArray(anum1[i],anum1),1);
						group(anum1,temz1);
					}
				}
			}
			
			group(teminNum);
		} else {
			temN.push(35);
			temN.push(inNum);
			temN.push(dwCG(4));
		} 
	}
	
	if(temN.length > 0){
		array.push(temN);
	}
	return array;
}


var otime = 20;<%--开*_*盘请求间隔时间--%>
var stime = otime;
setInterval(function(){
	stime--;
	if(stime<=0){
		stime=otime;
		getRate(gid);
	}
	if(s_flag == 1){
		setOpenBall(s_ob);
		countdown();
		$("#s_is").text(s_is);
		if(s_io==0){
			$("#close_id").html(' 已封盘');
			$('input:checkbox').each(function(){
				$(this).attr("checked", false).checkboxradio("refresh");
				$(this).checkboxradio("disable");
			});
			$("input[type='radio']").checkboxradio("disable");
		}else{
			$("#close_id").html('');
		}
	}
},1000);

function countdown(){
	$countdown = $("#cdt").countdown(s_st);
	$countdown.on('update.countdown' , function(event) {
     	var totalHours = event.offset.totalDays * 24 + event.offset.hours;
     	if(s_io==0){
     		$("#cdt").html('');
     	}else{
     		$("#cdt").html('<font color="black">&nbsp;距封盘 </font>' + event.strftime(totalHours + ':%M:%S'));
     	}
     });
     $countdown.on('finish.countdown' , function(event) {
     	//getRate();
     });
}
function setOpenBall(balls){
	var ball = balls.split(',');
	var str = '';
	for(var i=0;i<ball.length;i++){
		//<div class="ball2 red-ball float-l" ball="2">2</div>
		var tcl = '';//ball red-ball
		if(i<4){
			tcl = 'border-color-r ball-result float-l';
		}else if(i>3&&i<7){
			tcl = 'border-color-b ball-result float-l';
		}else{
			tcl = 'border-color-g ball-result float-l';
		}
		if(i==4){
			str += '<div class="b-txt">+</div>'
		}
		str += '<div class="' + tcl + '" ball="2">' + ('' == ball[i] ? '?' : ball[i]) + '</div>';
	}
	$("#openball").html(str);
}
function changeHandType(){
	getRate(gid);
}

    </script>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
(function($){
	var opts = {
			bg : '#EFECEC',		//按钮样式
			n : 'n', 	//号码
			m : 'm',	//金额
			at : 0,			//输入框项标示
			vn : $.noop,
    		vm : $.noop
	}
	$.fn.extend({
		keyboard:function (options){
			//检测用户传进来的参数是否合法
            if (!isValid(options))
                return this;
            opts = $.extend({}, opts, options); //使用jQuery.extend 覆盖插件默认参数
	        
	    	cElement(this);
            
	        intTunk();
	        
	        if (opts.n) {
	        	$('[name='+ opts.n +']').focus(function(){
	        		opts.at = 0;
	        		$('#keypan td').css('background',opts.bg);
	        	});
	        }
	        if (opts.m) {
	        	$('[name='+ opts.m +']').focus(function(){
	        		opts.at = 1;
	        		$('#keypan td').css('background','');
	        	});
	        }
		}
		
	});
	
	function cElement() {
		var _keynumberhtml = "<div>\n"
		+ "<table id=\"main\"><tr>\n"
		+ "<td class=\"key\" title='1'>1</td>"
		+ "<td class=\"key\" title='2'>2</td>"
		+ "<td class=\"key\" title='3'>3</td>"
		+ "<td class=\"key\" title='4'>4</td>"
		+ "<td class=\"key\" title='5'>5</td>"
		+ "</tr>\n"
		+ "</table>\n"       
		+ "<table id=\"main\"><tr>\n"
		+ "<td class=\"key\" title='6'>6</td>"
		+ "<td class=\"key\" title='7'>7</td>"
		+ "<td class=\"key\" title='8'>8</td>"
		+ "<td class=\"key\" title='9'>9</td>"
		+ "<td class=\"key\" title='0'>0</td>"
		+ "</tr>\n"
		+ "</table>\n"
		+ "<table id=\"main2\">"
		+ "<tr>"
		+ "<td class=\"key\" title = 'clean'>清除</td>"
		+ "<td class=\"key\" title = 'X'>X</td>"
		+ "<td class=\"key\" title = 'ok'>确定</td>"
		+ "</tr>"
		+ "</table>"
		+ "</div>\n";
		var div = document.createElement("div");
		div.innerHTML = _keynumberhtml;
		$('#keypan').append(div);
		
		$('#keypan td').css('background',opts.bg);
	}
	
	var intTunk = function(){
		$('.key').on('click',function() {
			var $this = $(this),
				$n = $('#'+opts.n),
				$m = $('#'+opts.m);
			if (opts.at == 0) {
				if ($this.attr('title') == 'ok') {
    				$m.focus();
    				return ;
    			}
				
				if ($this.attr('title') == 'clean' && $n.val().length > 0) {
					$n.val($n.val().substr(0,$n.val().length - 1)).focus();
				} else {
					if ($n.val().length >= 4) {
        				$m.focus();
        			} else if ($this.attr('title') != 'clean') {
	        			$n.val($n.val() + $this.attr('title')).focus();
        			} else {
        				$n.focus();
        			}
				}
    			opts.vn();
    		} else {
    			if ($this.attr('title') == 'ok') {
    				$("#orderBtn").click();
    				return ;
    			}
    			
    			if ($this.attr('title') == 'clean' && $m.val().length > 0) {
					$m.val($m.val().substr(0,$m.val().length - 1)).focus();
					return ;
				} else {
					if ($this.attr('title') != 'clean' && $this.attr('title') != 'X') {
        				$m.val($m.val() + $this.attr('title')).focus();
        				opts.vm();
        			} else {
        				$m.focus();
        			}
				}
    		}
		} );
	}
	//私有方法，检测参数是否合法
    function isValid(options) {
        return !options || (options && typeof options === "object") ? true : false;
    }
})(window.jQuery);

$(function(){
 $('#keypan').keyboard({
	vn:function(){getNum();validNum();},
	vm:function(){checkNM();}
	});
});
</script> 
  </body>
</html>
