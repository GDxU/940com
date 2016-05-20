<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
</head>
<body>
<div class="list_dingtime" data-role="page" id="rateInfoPage">
<c:set var="page_type" value="1" scope="request"/>
<c:set var="page_title" value="快填" />
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
	<input type="hidden" name="gid" id="gid" value="${obj.gid}">
      <div data-role="navbar" class="ui-toggle-uptodown-kx">
      	  <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3201')}">
          <ul class="ui-grid-a">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3201')">口XXX</a>
              </li>
              <li class="ui-block-b">
                  <a href="#"  onclick="changeGid('3202')" class="ui-btn-active">X口XX</a>
              </li>
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3203')">XX口X</a>
              </li>
              <li class="ui-block-d">
                  <a href="#" onclick="changeGid('3204')">XXX口</a>
              </li>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3301') || fn:contains(obj.gcl,'3302') || fn:contains(obj.gcl,'3303') || fn:contains(obj.gcl,'3304')}">
          <ul class="ui-grid-a">
          	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3301')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3301')">口口XX</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3302')}">
              <li class="ui-block-b">
                  <a href="#"  onclick="changeGid('3302')" class="ui-btn-active">口X口X</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3303')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3303')">口XX口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3304')}">
              <li class="ui-block-d">
                  <a href="#" onclick="changeGid('3304')">X口口X</a>
              </li>
            </c:if>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3305') || fn:contains(obj.gcl,'3306') || fn:contains(obj.gcl,'3401') || fn:contains(obj.gcl,'3402')}">
          <ul>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3305')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3305')">X口X口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3306')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('3306')">XX口口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3401')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3401')">口口口X</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3402')}">
              <li class="ui-block-d">
                  <a href="#" onclick="changeGid('3402')">口口X口</a>
              </li>
            </c:if>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3403') || fn:contains(obj.gcl,'3404') || fn:contains(obj.gcl,'3501')}">
          <ul>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3403')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3403')">口X口口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3404')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('3404')">X口口口</a>
              </li>
          	</c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3501')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3501')">口口口口</a>
              </li>
          	</c:if>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'36') || fn:contains(obj.gcl,'37') || fn:contains(obj.gcl,'38') || fn:contains(obj.gcl,'39')}">
          <ul>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'36')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('36')">一字现</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'37')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('37')">二字现</a>
              </li>
          	</c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'38')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('38')">三字现</a>
              </li>
          	</c:if>
          	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'39')}">
              <li class="ui-block-d">
                  <a href="#" onclick="changeGid('39')">四字现</a>
              </li>
          	</c:if>
          </ul>
          </c:if>
      </div>
      <!--  
          <div class="ui-mobile-more"><button data-role="button">展开</button></div>
          -->
          <div class="clear"></div>
          <div class="table-cotent-lottery ui-height-content">
          
          
          <div class="ui-table ui-table-middle-line">
                <table class="ui-table-qxstar">
                    <thead data-role="th-groups">
                        <tr>
                            <td>号码</td>
                            <td>金额</td>
                            <td>号码</td>
                            <td>金额</td>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td style="background:#E0E0E0;"><input type="text" id="n1" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m1" onblur="ckM()"></td>
                        <td style="background:#E0E0E0;"><input type="text" id="n2" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m2" onblur="ckM()"></td>
                    </tr>
                    <tr>
                        <td style="background:#E0E0E0;"><input type="text" id="n3" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m3" onblur="ckM()"></td>
                        <td style="background:#E0E0E0;"><input type="text" id="n4" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m4" onblur="ckM()"></td>
                    </tr>
                    <tr>
                        <td style="background:#E0E0E0;"><input type="text" id="n5" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m5" onblur="ckM()"></td>
                        <td style="background:#E0E0E0;"><input type="text" id="n6" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m6" onblur="ckM()"></td>
                    </tr>
                    <tr>
                        <td style="background:#E0E0E0;"><input type="text" id="n7" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m7" onblur="ckM()"></td>
                        <td style="background:#E0E0E0;"><input type="text" id="n8" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m8" onblur="ckM()"></td>
                    </tr>
                    <tr>
                        <td style="background:#E0E0E0;"><input type="text" id="n9" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m9" onblur="ckM()"></td>
                        <td style="background:#E0E0E0;"><input type="text" id="n10" name="n" onblur="getNum()"></td>
                        <td><input type="text" name="m" id="m10" onblur="ckM()"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
          
          
          </div>
          </div>
    </div>
    <%@ include file="/WEB-INF/page/qxc/com_bet_kx.jsp" %>
    <script>
    	var rateObj;
    	var snrObj;
        var gid = "3201";
        $(function(){
        $(".ui-toggle-uptodown-kx").css("height","auto");
        $("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGid('" + $("#gid").val() + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
        gid = $("#gid").val();
        getRate(gid);
            /*收缩展开
            $(".ui-mobile-more button").click(function(){
                if($(".ui-toggle-uptodown-kx").css("height")=="36px"){
                    $(".ui-toggle-uptodown-kx").css("height","auto");
                    $(".ui-mobile-more button").html("收起");
                }else{
                    $(".ui-toggle-uptodown-kx").css("height","36px");
                    $(".ui-mobile-more button").html("展开");
                }
            });
            $(".ui-toggle-uptodown-kx ul li").click(function(){
                $(".ui-toggle-uptodown-kx").css("height","36px");
                $(".ui-mobile-more button").html("展开");
            });*/
            
            <%--下*_*注页面，点击填按钮--%>
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
       				return;
       			}
		        enableSubmitBtn();
				if (checkNum()&&checkNM()){
			    	$("#issue").val($("#s_is").text());
			    	$("#isid").text($("#s_is").text());
			    	var arrZH = getZH_Rate();
			        var ot = $("#orderTable");
			        ot.children("tbody").remove();
			        var tbody = $("<tbody></tbody>");
			        for(var i=0;i<arrZH.length;i++){
			        	//array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
			        	var temazh = String(arrZH[i]).split("#");
						var str = "";
			            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
			            str += temazh[0] + "</span>";
			            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + temazh[1] + "</span>";
			            str += "<input type='hidden' name='type' value='" + temazh[2] + "'>";
			            str += "<input type='hidden' name='rate' value='" + temazh[1] + "'></td>";
			            str += "<td align='right' class='tdselect' style='border:none;'><span>"
			            str += "<input type='number' min='1' max='50000' value='"+ temazh[3] +"' name='amount' class='numb_px' data-role='none'/>";
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
						betBall +=  tobj[i].value + ",";
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
					$("#betBall").val(betBall.substring(0, betBall.length-1));
					$("#rateAll").val(rateAll.substring(0, rateAll.length-1));
					$("#betAmount").val(betAmount.substring(0, betAmount.length-1));
					$("#gameCode").val(gid);
					if(gid.indexOf("32")>-1){
						$("#gameCode").val("32");
					}
					$("#pgameCode").val(gid.substring(0, 2));
					subOrder();
				}
		    });
		    
		    
        });
        function changeGid(id){
        	gid = id;
        	$("#gid").val(id);
        	$("[name='n']").val("");
        	$("[name='m']").val("");
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
        	getRate(gid);
        }
        function getNum(){
        	var num = 0;
        	$("[name='n']").each(function (){
        		if(""!=$.trim($(this).val())){
        			var  reg = new RegExp("^[0-9]*$");
        			if(!reg.test($.trim($(this).val()))){
        				alert("号码仅能输入数字!!");
        				$(this).val('');
        			}else{
	        			num++;
	        			$(this).val($.trim($(this).val()));
        			}
        		}
        	});
        	if(num==0){
        		$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").removeClass('spnicon').text('');
        	}else{
        		$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
				$("#orderCount").addClass('spnicon').text(num);
        	}
        }
        function ckM(){
        	$("[name='m']").each(function (){
        		if(""!=$.trim($(this).val())){
        			var  reg = new RegExp("^[0-9]*$");
        			if(!reg.test($.trim($(this).val()))){
        				alert("金额仅能输入数字!!");
        				$(this).val('');
        			}else{
	        			$(this).val($.trim($(this).val()));
        			}
        		}
        	});
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
						$("#comm").val(obj.data.c);
						rateObj = eval('(' + obj.data.rate + ')');
						snrObj = eval('(' + obj.data.snr + ')');
						//alert(rateObj["01"][1]);
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

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit(replaceAllHtml("{[{5rOo}]}单提交中，请稍后..."));
	var url = ctx + '/qxc/addOrder';
	var jqxhr = $.post(url,$("form").serialize(),function(jsonResult, status){
		hideLoader();
		if(status=="success"){
			if(jsonResult.r==0){
				if(jsonResult.data.code == 1){
                    $("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
                    $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
                    $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
                    var btem = replaceAllHtml('下{[{5rOo}]}成功，请检查下{[{5rOo}]}状况和{[{6LSm}]}户历史！');alert(btem);
                    $.mobile.changePage("#rateInfoPage", {transition:'none'});
                    $("ul li .ui-btn-active").removeClass("ui-btn-active");
					var str = "changeGid('" + $("#gid").val() + "')";
					$("[onclick='" + str + "']").addClass("ui-btn-active");
					changeGid($("#gid").val());
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                		$("ul li .ui-btn-active").removeClass("ui-btn-active");
						var str = "changeGid('" + $("#gid").val() + "')";
						$("[onclick='" + str + "']").addClass("ui-btn-active");
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	alert(jsonResult.data.description);
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
               		$("ul li .ui-btn-active").removeClass("ui-btn-active");
					var str = "changeGid('" + $("#gid").val() + "')";
					$("[onclick='" + str + "']").addClass("ui-btn-active");
					changeGid($("#gid").val());
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
		$("#isChange").val("0");
		//$("#submitBtn").removeClass("ui-state-disabled");
	});	
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
function checkNum(){
	var falg = true;
	if(gid=="3201"||gid=="3202"||gid=="3203"||gid=="3204"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length!=1){
        				alert("号码["+ $(this).val() +"]不合法,请输入1位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="3301"||gid=="3302"||gid=="3303"||gid=="3304"||gid=="3305"||gid=="3306"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length!=2){
        				alert("号码["+ $(this).val() +"]不合法,请输入2位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="3401"||gid=="3402"||gid=="3403"||gid=="3404"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length!=3){
        				alert("号码["+ $(this).val() +"]不合法,请输入3位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="3501"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length!=4){
        				alert("号码["+ $(this).val() +"]不合法,请输入4位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="36"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length!=1){
        				alert("号码["+ $(this).val() +"]不合法,请输入1位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="37"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length==2){
        				var ate = $.trim($(this).val()).split("");
        				if(ate[0]>ate[1]){
        					alert("号码["+ $(this).val() +"]不合法,请输入2位数字！");
	        				$(this).focus();
	        				falg = false;
        				}
        			}else{
        				alert("号码["+ $(this).val() +"]不合法,请输入2位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="38"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length==3){
        				var ate = $.trim($(this).val()).split("");
        				if(ate[0]>ate[1] || ate[1]>ate[2] || ate[0]>ate[2]){
        					alert("号码["+ $(this).val() +"]不合法,请输入3位数字！");
	        				$(this).focus();
	        				falg = false;
        				}
        			}else{
        				alert("号码["+ $(this).val() +"]不合法,请输入3位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}else if(gid=="39"){
		$("[name='n']").each(function (){
       		if(""!=$.trim($(this).val())&&falg){
       			var reg = new RegExp("^[0-9]*$");
        		if(!reg.test($.trim($(this).val()))){
       				alert("号码仅能输入数字!!");
       				$(this).val('');
       				falg = false;
       			}else{
        			if($.trim($(this).val()).length==4){
        				var ate = $.trim($(this).val()).split("");
        				if(ate[0]>ate[1] || ate[0]>ate[2] || ate[0]>ate[3] || ate[1]>ate[2] || ate[1]>ate[3] || ate[2]>ate[3]){
        					alert("号码["+ $(this).val() +"]不合法,请输入4位数字！");
	        				$(this).focus();
	        				falg = false;
        				}
        			}else{
        				alert("号码["+ $(this).val() +"]不合法,请输入4位数字！");
        				$(this).focus();
        				falg = false;
        			}
       			}
       		}
       	});
	}
    return falg;
}
function checkNM(){
	var falg = true;
	$("[name='m']").each(function (){
		if(""!=$.trim($(this).val())&&falg){
			var reg = new RegExp("^[0-9]*$");
       		if(!reg.test($.trim($(this).val()))){
  				alert("金额仅能输入数字!!");
  				$(this).val('');
  				falg = false;
  			}
  			if(""==$("#" + (this.id).replace("m","n")).val()){
  				alert("请输入号码");
  				$("#" + (this.id).replace("m","n")).focus();
  				falg = false;
  			}
  			//alert($(this).parent().parent().prev().children().val());
		}
	});
	if(!falg){
		return falg;
	}
	var temN = "";
	$("[name='n']").each(function (){
		if(""!=$.trim($(this).val())&&falg){
  			if(""==$("#" + (this.id).replace("n","m")).val()){
  				alert("请输入金额");
  				$("#" + (this.id).replace("n","m")).focus();
  				falg = false;
  			}
  			if(temN.indexOf($.trim($(this).val()))>-1){
  				alert("号码[" + $.trim($(this).val()) +"]已经存在,请重新输入不同的号码！");
  				$(this).focus();
  				falg = false;
  			}else{
	  			temN += $.trim($(this).val()) +',';
  			}
		}
	});
	return falg;
}

function getZH_Rate(obj){
	var array = new Array();
	var temN = new Array();
	var temM = new Array();
	$("[name='n']").each(function (){
		if(""!=$.trim($(this).val())){
			temN.push($(this).val());
			temM.push($("#" + (this.id).replace("n","m")).val());
		}
	});
	if("3201"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = parseInt(temN[i]) +1;//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = temN[i] + "XXX";//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("3202"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = parseInt(temN[i]) +11;//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = "X" + temN[i] + "XX";//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("3203"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = parseInt(temN[i]) +21;//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = "XX" + temN[i] + "X";//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("3204"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = parseInt(temN[i]) +31;//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = "XXX" + temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("3301"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			qr = parseFloat(qr);
			var br = (rateObj[parseInt(sN[0])+11]+"").split(",")[1];
			br = parseFloat(br);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			console.log(qr + "#" + br + "@" + sR);
			var sFn = temN[i] + "XX";//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3302"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+21]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = sN[0] + "X" + sN[1] + "X";//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3303"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = sN[0] + "XX" + sN[1];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3304"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+11]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+21]+"").split(",")[1];
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = "X" + sN[0] + sN[1] + "X";//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3305"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+11]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = "X" + sN[0] + "X" + sN[1];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3306"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+21]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = "XX" + sN[0] + sN[1];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3401"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+11]+"").split(",")[1];
			var sr = (rateObj[parseInt(sN[2])+21]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			sr = parseFloat(sr);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(sR>sr){
				sR=sr;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = sN[0] + sN[1] + sN[2] + "X";//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3402"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+11]+"").split(",")[1];
			var sr = (rateObj[parseInt(sN[2])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			sr = parseFloat(sr);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(sR>sr){
				sR=sr;
			}
			var sFn = sN[0] + sN[1] + "X" + sN[2];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3403"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+21]+"").split(",")[1];
			var sr = (rateObj[parseInt(sN[2])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			sr = parseFloat(sr);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(sR>sr){
				sR=sr;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = sN[0] + "X" + sN[1] + sN[2];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3404"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+11]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+21]+"").split(",")[1];
			var sr = (rateObj[parseInt(sN[2])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			sr = parseFloat(sr);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(sR>sr){
				sR=sr;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = "X" + sN[0] + sN[1] + sN[2];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("3501"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i].split("");
			var qr = (rateObj[parseInt(sN[0])+1]+"").split(",")[1];
			var br = (rateObj[parseInt(sN[1])+11]+"").split(",")[1];
			var sr = (rateObj[parseInt(sN[2])+21]+"").split(",")[1];
			var gr = (rateObj[parseInt(sN[3])+31]+"").split(",")[1];
			qr = parseFloat(qr);
			br = parseFloat(br);
			sr = parseFloat(sr);
			gr = parseFloat(gr);
			var sR = qr;
			if(sR>br){
				sR=br;
			}
			if(sR>sr){
				sR=sr;
			}
			if(sR>gr){
				sR=gr;
			}
			if(undefined!=snrObj && undefined!=snrObj[temN[i]]){
				sR=snrObj[temN[i]];
			}
			var sFn = temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+temN[i]+"#"+temM[i]);
		}
	}else if("36"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i];//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("37"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i];//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("38"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i];//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}else if("39"==gid){
		for(var i=0;i<temN.length;i++){
			var sN = temN[i];//后台号码
			var sR = (rateObj[sN]+"").split(",")[1];//赔#  #率
			var sFn = temN[i];//展示号码
			array.push(sFn+"#"+sR+"#"+sN+"#"+temM[i]);
		}
	}
	return array;
}


var otime = 20;<%--开盘请求间隔时间--%>
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
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
    </script>
  </body>
</html>
