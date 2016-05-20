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
<c:set var="page_title" value="快选" />
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
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3301') || fn:contains(obj.gcl,'3302') || fn:contains(obj.gcl,'3303')}">
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
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3304') || fn:contains(obj.gcl,'3305') || fn:contains(obj.gcl,'3306')}">
          <ul>
          	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3304')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3304')">X口口X</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3305')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('3305')">X口X口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3306')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3306')">XX口口</a>
              </li>
            </c:if>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3401') || fn:contains(obj.gcl,'3402') || fn:contains(obj.gcl,'3403')}">
          <ul>
          	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3401')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3401')">口口口X</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3402')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('3402')">口口X口</a>
              </li>
            </c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3403')}">
              <li class="ui-block-c">
                  <a href="#" onclick="changeGid('3403')">口X口口</a>
              </li>
            </c:if>
          </ul>
          </c:if>
          <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3404') || fn:contains(obj.gcl,'3501')}">
          <ul>
          	<c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3404')}">
              <li class="ui-block-a">
                  <a href="#" onclick="changeGid('3404')">X口口口</a>
              </li>
          	</c:if>
            <c:if test = "${empty obj.gcl || fn:contains(obj.gcl,'3501')}">
              <li class="ui-block-b">
                  <a href="#" onclick="changeGid('3501')">口口口口</a>
              </li>
          	</c:if>
              <li class="ui-block-c">
                  &nbsp;&nbsp;
              </li>
          </ul>
          </c:if>
      </div>
      <!--  
          <div class="ui-mobile-more"><button data-role="button">展开</button></div>
          -->
          <div class="clear"></div>
          <div class="table-cotent-lottery ui-height-content">
          <div class="ui-table">
              <table class="ui-table-qxstar">
                  <thead data-role="th-groups">
                      <tr>
                          <td>千</td>
                          <td>百</td>
                          <td>十</td>
                          <td>个</td>
                      </tr>
                  </thead>
                  <tbody>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_0" data-mini="true"><label for="q_0">0</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_0" data-mini="true"><label for="b_0">0</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_0" data-mini="true"><label for="s_0">0</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_0" data-mini="true"><label for="g_0">0</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_1" data-mini="true"><label for="q_1">1</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_1" data-mini="true"><label for="b_1">1</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_1" data-mini="true"><label for="s_1">1</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_1" data-mini="true"><label for="g_1">1</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_2" data-mini="true"><label for="q_2">2</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_2" data-mini="true"><label for="b_2">2</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_2" data-mini="true"><label for="s_2">2</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_2" data-mini="true"><label for="g_2">2</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_3" data-mini="true"><label for="q_3">3</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_3" data-mini="true"><label for="b_3">3</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_3" data-mini="true"><label for="s_3">3</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_3" data-mini="true"><label for="g_3">3</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_4" data-mini="true"><label for="q_4">4</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_4" data-mini="true"><label for="b_4">4</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_4" data-mini="true"><label for="s_4">4</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_4" data-mini="true"><label for="g_4">4</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_5" data-mini="true"><label for="q_5">5</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_5" data-mini="true"><label for="b_5">5</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_5" data-mini="true"><label for="s_5">5</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_5" data-mini="true"><label for="g_5">5</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_6" data-mini="true"><label for="q_6">6</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_6" data-mini="true"><label for="b_6">6</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_6" data-mini="true"><label for="s_6">6</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_6" data-mini="true"><label for="g_6">6</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_7" data-mini="true"><label for="q_7">7</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_7" data-mini="true"><label for="b_7">7</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_7" data-mini="true"><label for="s_7">7</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_7" data-mini="true"><label for="g_7">7</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_8" data-mini="true"><label for="q_8">8</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_8" data-mini="true"><label for="b_8">8</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_8" data-mini="true"><label for="s_8">8</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_8" data-mini="true"><label for="g_8">8</label></fieldset></td>
                      </tr>
                      <tr>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="q" id="q_9" data-mini="true"><label for="q_9">9</label></fieldset></td>
                          <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b" id="b_9" data-mini="true"><label for="b_9">9</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="s" id="s_9" data-mini="true"><label for="s_9">9</label></fieldset></td>
                      	  <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="g" id="g_9" data-mini="true"><label for="g_9">9</label></fieldset></td>
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
    	var gid_wz = {"3301":"q,b","3302":"q,s","3303":"q,g","3304":"b,s","3305":"b,g","3306":"s,g","3401":"q,b,s","3402":"q,b,g","3403":"q,s,g","3404":"b,s,g","3501":"q,b,s,g"}
        var gid = "3301";
        $(function(){
        $(".ui-toggle-uptodown-kx").css("height","auto");
        $("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGid('" + $("#gid").val() + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
        gid = $("#gid").val();
        getRate(gid);
        c_wzb();
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
            $("input[type='checkbox']").on("click",function(e){
		        if($("input:checked").length>0){
		        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").addClass('spnicon').text($("input:checked").length);
				}else{
					$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
					$("#orderCount").removeClass('spnicon').text('');
				}
		    });
		    
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
		        enableSubmitBtn();
				if (!checkNum()) {
			    } else {
			    	$("#issue").val($("#s_is").text());
			    	$("#isid").text($("#s_is").text());
			    	var arr = gid_wz[gid].split(",");
			    	var strQBSG = {"q":"","b":"","s":"","g":""}
			    	for(var i=0;i<arr.length;i++){
			    		var tem = "[name='" + arr[i] + "']:checked";
			    		var tems = "";
			    		$(tem).each(function(){
			    			tems += this.id + ",";
			    		});
			    		strQBSG[arr[i]]=tems.substring(0,tems.length-1);
			    	}
			    	var arrZH = getZH_Rate(strQBSG);
			    	
			        var ot = $("#orderTable");
			        ot.children("tbody").remove();
			        var tbody = $("<tbody></tbody>");
			        for(var i=0;i<arrZH.length;i++){
			        	var temazh = String(arrZH[i]).split("#");
						var str = "";
			            str += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
			            str += temazh[0] + "</span>";
			            str += "<span class='spannum2'>@</span> <span class='spannum3'>"  + temazh[1] + "</span>";
			            str += "<input type='hidden' name='type' value='" + temazh[0].replace(/X/g,'') + "'>";
			            str += "<input type='hidden' name='rate' value='" + temazh[1] + "'></td>";
			            str += "<td align='right' class='tdselect' style='border:none;'><span>"
			            str += "<input type='number' min='1' max='50000' name='amount' class='numb_px' data-role='none'/>";
			            str += "<input type='button' value='填' rel='w' class='btnfill btn-width-6 btnmgr-l-r btnxy' data-role='none'/>";
			            str += "<input type='button' value='删' rel='d' s='" + temazh[0].replace(/X/g,'') + "' class='btncancel btn-width-6 btnmgr-l-r btnxy' data-role='none'/></span></td></tr>";
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
					$("#pgameCode").val(gid.substring(0, 2));
					subOrder();
				}
		    });
		    
		    
        });
        function changeGid(id){
        	gid = id;
        	$("#gid").val(id);
        	c_wzb();
        	$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
        	getRate(gid);
        }
        function c_wzb(){
        	$("[name='q']").checkboxradio("disable");
        	$("[name='b']").checkboxradio("disable");
        	$("[name='s']").checkboxradio("disable");
        	$("[name='g']").checkboxradio("disable");
        	var arr = gid_wz[gid].split(",");
        	for(var i=0;i<arr.length;i++){
        		var tem = "[name='" + arr[i] + "']";
        		$(tem).checkboxradio("enable");
        	}
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
	var tobj = {'q':'千','b':'百','s':'十','g':'个'}
	var arr = gid_wz[gid].split(",");
    for(var i=0;i<arr.length;i++){
    	var tem = "[name='" + arr[i] + "']:checked";
    	if($(tem).length==0){
    		alert('请选择' + tobj[arr[i]] + '位号码！');
    		return false;
    	}
    }
    return true;
}

function getZH_Rate(obj){
	var array = new Array();
	if(gid=="3301"){
		var qt = obj["q"].split(",");
		var bt = obj["b"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = qn + bn + "XX";
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+11]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3302"){
		var qt = obj["q"].split(",");
		var bt = obj["s"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = qn + "X" + bn + "X";
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+21]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3303"){
		var qt = obj["q"].split(",");
		var bt = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = qn + "XX" + bn;
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+31]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3304"){
		var qt = obj["b"].split(",");
		var bt = obj["s"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = "X" + qn + bn + "X";
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+11]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+21]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3305"){
		var qt = obj["b"].split(",");
		var bt = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = "X" + qn + "X" + bn;
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+11]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+31]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3306"){
		var qt = obj["s"].split(",");
		var bt = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				var qn = qt[i].substring(qt[i].length-1,qt[i].length);
				var bn = bt[j].substring(bt[j].length-1,bt[j].length);
				var tem = "XX" + qn + bn;
				if(undefined!=snrObj && undefined!=snrObj[qn+bn]){
					tem += "#" + snrObj[qn+bn];
				}else{
					var qr = (rateObj[parseInt(qn)+21]+"").split(",")[1];
					var br = (rateObj[parseInt(bn)+31]+"").split(",")[1];
					qr = parseFloat(qr);
					br = parseFloat(br);
					if(qr<br){
						tem += "#" + qr;
					}else{
						tem += "#" + br;
					}
				}
				array.push(tem);
			}
		}
	}
	if(gid=="3401"){
		var qt = obj["q"].split(",");
		var bt = obj["b"].split(",");
		var st = obj["s"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				for(var k=0;k<st.length;k++){
					var qn = qt[i].substring(qt[i].length-1,qt[i].length);
					var bn = bt[j].substring(bt[j].length-1,bt[j].length);
					var sn = st[k].substring(st[k].length-1,st[k].length);
					var tem = qn + bn + sn + "X";
					if(undefined!=snrObj && undefined!=snrObj[qn+bn+sn]){
						tem += "#" + snrObj[qn+bn+sn];
					}else{
						var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
						var br = (rateObj[parseInt(bn)+11]+"").split(",")[1];
						var sr = (rateObj[parseInt(sn)+21]+"").split(",")[1];
						qr = parseFloat(qr);
						br = parseFloat(br);
						sr = parseFloat(sr);
						var temra = qr;
						if(temra>br){
							temra = br;
						}
						if(temra>sr){
							temra = sr;
						}
						tem += "#" + temra;
					}
					array.push(tem);
				}
			}
		}
	}
	if(gid=="3402"){
		var qt = obj["q"].split(",");
		var bt = obj["b"].split(",");
		var st = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				for(var k=0;k<st.length;k++){
					var qn = qt[i].substring(qt[i].length-1,qt[i].length);
					var bn = bt[j].substring(bt[j].length-1,bt[j].length);
					var sn = st[k].substring(st[k].length-1,st[k].length);
					var tem = qn + bn + "X" + sn;
					if(undefined!=snrObj && undefined!=snrObj[qn+bn+sn]){
						tem += "#" + snrObj[qn+bn+sn];
					}else{
						var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
						var br = (rateObj[parseInt(bn)+11]+"").split(",")[1];
						var sr = (rateObj[parseInt(sn)+31]+"").split(",")[1];
						qr = parseFloat(qr);
						br = parseFloat(br);
						sr = parseFloat(sr);
						var temra = qr;
						if(temra>br){
							temra = br;
						}
						if(temra>sr){
							temra = sr;
						}
						tem += "#" + temra;
					}
					array.push(tem);
				}
			}
		}
	}
	if(gid=="3403"){
		var qt = obj["q"].split(",");
		var bt = obj["s"].split(",");
		var st = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				for(var k=0;k<st.length;k++){
					var qn = qt[i].substring(qt[i].length-1,qt[i].length);
					var bn = bt[j].substring(bt[j].length-1,bt[j].length);
					var sn = st[k].substring(st[k].length-1,st[k].length);
					var tem = qn + "X" + bn + sn;
					if(undefined!=snrObj && undefined!=snrObj[qn+bn+sn]){
						tem += "#" + snrObj[qn+bn+sn];
					}else{
						var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
						var br = (rateObj[parseInt(bn)+21]+"").split(",")[1];
						var sr = (rateObj[parseInt(sn)+31]+"").split(",")[1];
						qr = parseFloat(qr);
						br = parseFloat(br);
						sr = parseFloat(sr);
						var temra = qr;
						if(temra>br){
							temra = br;
						}
						if(temra>sr){
							temra = sr;
						}
						tem += "#" + temra;
					}
					array.push(tem);
				}
			}
		}
	}
	if(gid=="3404"){
		var qt = obj["b"].split(",");
		var bt = obj["s"].split(",");
		var st = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				for(var k=0;k<st.length;k++){
					var qn = qt[i].substring(qt[i].length-1,qt[i].length);
					var bn = bt[j].substring(bt[j].length-1,bt[j].length);
					var sn = st[k].substring(st[k].length-1,st[k].length);
					var tem = "X" + qn + bn + sn;
					if(undefined!=snrObj && undefined!=snrObj[qn+bn+sn]){
						tem += "#" + snrObj[qn+bn+sn];
					}else{
						var qr = (rateObj[parseInt(qn)+11]+"").split(",")[1];
						var br = (rateObj[parseInt(bn)+21]+"").split(",")[1];
						var sr = (rateObj[parseInt(sn)+31]+"").split(",")[1];
						qr = parseFloat(qr);
						br = parseFloat(br);
						sr = parseFloat(sr);
						var temra = qr;
						if(temra>br){
							temra = br;
						}
						if(temra>sr){
							temra = sr;
						}
						tem += "#" + temra;
					}
					array.push(tem);
				}
			}
		}
	}
	if(gid=="3501"){
		var qt = obj["q"].split(",");
		var bt = obj["b"].split(",");
		var st = obj["s"].split(",");
		var gt = obj["g"].split(",");
		for(var i=0;i<qt.length;i++){
			for(var j=0;j<bt.length;j++){
				for(var k=0;k<st.length;k++){
					for(var m=0;m<gt.length;m++){
						var qn = qt[i].substring(qt[i].length-1,qt[i].length);
						var bn = bt[j].substring(bt[j].length-1,bt[j].length);
						var sn = st[k].substring(st[k].length-1,st[k].length);
						var gn = gt[m].substring(gt[m].length-1,gt[m].length);
						var tem = qn + bn + sn + gn;
						if(undefined!=snrObj && undefined!=snrObj[qn+bn+sn+gn]){
							tem += "#" + snrObj[qn+bn+sn+gn];
						}else{
							var qr = (rateObj[parseInt(qn)+1]+"").split(",")[1];
							var br = (rateObj[parseInt(bn)+11]+"").split(",")[1];
							var sr = (rateObj[parseInt(sn)+21]+"").split(",")[1];
							var gr = (rateObj[parseInt(gn)+31]+"").split(",")[1];
							qr = parseFloat(qr);
							br = parseFloat(br);
							sr = parseFloat(sr);
							gr = parseFloat(gr);
							var temra = qr;
							if(temra>br){
								temra = br;
							}
							if(temra>sr){
								temra = sr;
							}
							if(temra>gr){
								temra = gr;
							}
							tem += "#" + temra;
						}
						array.push(tem);
					}
				}
			}
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
			c_wzb()
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
