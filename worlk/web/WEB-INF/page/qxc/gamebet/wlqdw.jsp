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
	<div data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="1" scope="request"/>
		<c:set var="page_title" value="五六七{[{5a6a}]}位" />
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
	        <div class="list_dingtime">
	        <div data-role="navbar" data-mini="true" id="h_div">
			    <ul>
			    	<li><a href="#" ${obj.gameCode == 41 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('41')">五{[{5a6a}]}位</a></li>
			    	<li><a href="#" ${obj.gameCode == 42 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('42')">六{[{5a6a}]}位</a></li>
			    	<li><a href="#" ${obj.gameCode == 43 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeGame('43')">七{[{5a6a}]}位</a></li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">  
			<div style="margin:2px; 0;"></div>
	        <div class="mainframe01">
	            <div class="divz">第一位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="10" data-mini="true"><label for="10">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="11" data-mini="true"><label for="11">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="12" data-mini="true"><label for="12">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="13" data-mini="true"><label for="13">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="14" data-mini="true"><label for="14">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="15" data-mini="true"><label for="15">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="16" data-mini="true"><label for="16">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="17" data-mini="true"><label for="17">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="18" data-mini="true"><label for="18">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_1" id="19" data-mini="true"><label for="19">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第二位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="20" data-mini="true"><label for="20">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="21" data-mini="true"><label for="21">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="22" data-mini="true"><label for="22">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="23" data-mini="true"><label for="23">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="24" data-mini="true"><label for="24">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="25" data-mini="true"><label for="25">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="26" data-mini="true"><label for="26">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="27" data-mini="true"><label for="27">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="28" data-mini="true"><label for="28">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_2" id="29" data-mini="true"><label for="29">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第三位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="30" data-mini="true"><label for="30">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="31" data-mini="true"><label for="31">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="32" data-mini="true"><label for="32">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="33" data-mini="true"><label for="33">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="34" data-mini="true"><label for="34">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="35" data-mini="true"><label for="35">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="36" data-mini="true"><label for="36">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="37" data-mini="true"><label for="37">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="38" data-mini="true"><label for="38">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_3" id="39" data-mini="true"><label for="39">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第四位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="40" data-mini="true"><label for="40">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="41" data-mini="true"><label for="41">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="42" data-mini="true"><label for="42">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="43" data-mini="true"><label for="43">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="44" data-mini="true"><label for="44">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="45" data-mini="true"><label for="45">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="46" data-mini="true"><label for="46">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="47" data-mini="true"><label for="47">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="48" data-mini="true"><label for="48">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_4" id="49" data-mini="true"><label for="49">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第五位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="50" data-mini="true"><label for="50">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="51" data-mini="true"><label for="51">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="52" data-mini="true"><label for="52">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="53" data-mini="true"><label for="53">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="54" data-mini="true"><label for="54">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="55" data-mini="true"><label for="55">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="56" data-mini="true"><label for="56">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="57" data-mini="true"><label for="57">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="58" data-mini="true"><label for="58">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_5" id="59" data-mini="true"><label for="59">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第六位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="60" data-mini="true"><label for="60">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="61" data-mini="true"><label for="61">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="62" data-mini="true"><label for="62">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="63" data-mini="true"><label for="63">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="64" data-mini="true"><label for="64">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="65" data-mini="true"><label for="65">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="66" data-mini="true"><label for="66">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="67" data-mini="true"><label for="67">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="68" data-mini="true"><label for="68">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_6" id="69" data-mini="true"><label for="69">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	        </div>
	        <div class="mainframe01">
	            <div class="divz">第七位</div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="70" data-mini="true"><label for="70">0</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="71" data-mini="true"><label for="71">1</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="72" data-mini="true"><label for="72">2</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="73" data-mini="true"><label for="73">3</label></fieldset></div>
	            </div>
	            <div class="div02">
	            	<div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="74" data-mini="true"><label for="74">4</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="75" data-mini="true"><label for="75">5</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="76" data-mini="true"><label for="76">6</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="77" data-mini="true"><label for="77">7</label></fieldset></div>
	            </div>
	            <div class="div01">
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="78" data-mini="true"><label for="78">8</label></fieldset></div>
	                <div class="b-number brl-1"><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="b_7" id="79" data-mini="true"><label for="79">9</label></fieldset></div>
	            </div>
	            <div class="clear"></div>
	            </div>
	            </div>
	        </div>
	        <p></p>
	        
		</div>
	</div>
	<%@ include file="/WEB-INF/page/qxc/com_s_bet.jsp" %>
</body>
<script type="text/javascript">
<%--切换盘口，重新加载赔率--%>
function changeHandType(){
	getRate($("#gameCode").val());
}
$(function(){
	getRate($("#gameCode").val());
	<%--选择号码下注--%>
	$("input[type='checkbox']").on("click",function(e){
		var n = 0;
		for(var i=1;i<8;i++){
			if($("[name='b_" + i + "']:checked").length>0){
				n++;
			}
		}
		if($("#gameCode").val()=='41'){
        	if(n>5){
	        	var btem = replaceAllHtml('五{[{5a6a}]}位只能选择5位');alert(btem);
	        	$(this).attr("checked",false);
	        	return;
        	}
        }
        if($("#gameCode").val()=='42'){
        	if(n>6){
	        	var btem = replaceAllHtml('六{[{5a6a}]}位只能选择6位');alert(btem);
	        	$(this).attr("checked",false);
	        	return;
        	}
        }
        if($("#gameCode").val()=='43'){
        	if(n>7){
	        	var btem = replaceAllHtml('七{[{5a6a}]}位只能选择7位');alert(btem);
	        	$(this).attr("checked",false);
	        	return;
        	}
        }
        if($("input:checked").length>0){
        	$("#orderBtn").addClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").addClass('spnicon').text(n);
		}else{
			$("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
			$("#orderCount").removeClass('spnicon').text('');
		}
    });
    //点击注单按钮，展示注单
    $("#orderBtn").on("click",function(e) {
        enableSubmitBtn();
        var n = 0;
        var str = "";
        var zh = 1;
        for(var i=1;i<8;i++){
        	if($("[name='b_" + i + "']:checked").length>0){
        		n++;
        		var tem = "";
        		var k = 0;
        		$("[name='b_" + i + "']:checked").each(function(j){
        			tem += ($(this).attr("id"))%10 + ".";
        			k++;
        		});
        		str += tem.substring(0, tem.length-1);
        		zh = zh*k;
        	}else{
        		str += "X";
        	}
        	str += "|";
        }
        str = str.substring(0, str.length-1);
        $("#betBall").val(str);
        $("#zh").val(zh);
        var sta = "";
        if($("#gameCode").val()=='41'){
        	if(n!=5){
	        	var btem = replaceAllHtml('五{[{5a6a}]}位只能选择5位');alert(btem);
	        	return;
        	}
        	sta = "五{[{5a6a}]}位";
        }
        if($("#gameCode").val()=='42'){
        	if(n!=6){
	        	var btem = replaceAllHtml('六{[{5a6a}]}位只能选择6位');alert(btem);
	        	return;
        	}
        	sta = "六{[{5a6a}]}位";
        }
        if($("#gameCode").val()=='43'){
        	if(n!=7){
	        	var btem = replaceAllHtml('七{[{5a6a}]}位只能选择7位');alert(btem);
	        	return;
        	}
        	sta = "七{[{5a6a}]}位";
        }
    	$("#issue").val($("#s_is").text());
    	$("#isid").text($("#s_is").text());
        var ot = $("#orderTable");
        ot.children("tbody").remove();
        var tbody = $("<tbody></tbody>");
        var sstr = "";
        sstr += "<tr class='trhight' style='border:none;'><td style='border:none;'><span class='spannum1'>";
        sstr += sta + "@" + $("#rateAll").val() + "</span></td>";
        sstr += "<td align='right' class='tdselect' style='border:none;'><span>"  + str + " </span></td></tr>"
        sstr = replaceAllHtml(sstr);
        $(sstr).appendTo(tbody);
        var tst = '<tr class="trhight" style="border:none;"><td align="center" colspan="2"></td></tr>';
        tst += tst;
        tst = replaceAllHtml(tst);
        $(tst).appendTo(tbody);
        ot.append(tbody);
        $("#zdn").text(zh);
        $.mobile.changePage("#toBet", {changeHash:false, transition:'none'});
        getUserInfo();
    });
    //提交注单
    $("#submitBtn").on("click",function(){
    	var checkR = checkParam();
		if(checkR){
			$("#betAmount").val($("#zh").val()*$("#amount").val());
			subOrder();
		}
    });
});

function subOrder(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit("注单提交中，请稍后...");
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
                }else if(jsonResult.data.code == 2){
                	var r = confirm(jsonResult.data.description.replace(/\\n/gm, '\n'));
                	if(r==true){
                		$("#isChange").val("1");
                		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                		$("#submitBtn").click();
                	}else{
                		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                	}
                }else if(jsonResult.data.code != 1 || jsonResult.data.code != 2){
                	alert(jsonResult.data.description);
               		$.mobile.changePage("#rateInfoPage", {transition:'none'});
                }
			}else{
				alert('系统错误！');
				$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
                $.mobile.changePage("#rateInfoPage", {transition:'none'});
			}
		}else{
			alert('系统错误！');
			$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
            $.mobile.changePage("#rateInfoPage", {transition:'none'});
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

function enableSubmitBtn(){
	$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
}

function checkParam(){
	var amount = $("#amount").val();
	var te= /^[1-9]+[0-9]*]*$/;
	if(!te.test(amount)){
		var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额输入错误，请输入{[{5aSn}]}于0的{[{5q2j}]}整数！');alert(btem);
		return false;
	}
	if(parseInt(amount)<parseInt($("#mi").val())){
		var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ amount + '不能低于单{[{5rOo}]}最低限额' + $("#mi").val());alert(btem);
		return;
	}
	if(parseInt(amount)>parseInt($("#mx").val())){
		var btem = replaceAllHtml('下{[{5rOo}]}{[{6YeR}]}额'+ amount + '不能高于单{[{5rOo}]}最高限额' + $("#mx").val());alert(btem);
		return;
	}
	if($("#issue").val()!=$("#s_is").text()){
		alert('期号不一致！');
		$.mobile.changePage("#rateInfoPage", {transition:'none'});
		return false;
	}
	return true;
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

var s_is = '';
var s_ob = '';
var s_ot = '';
var s_st = '';
var s_io = '';// 封：0，开*盘*中为：1
var s_flag = 0;
function getRate(game,px,tj){
	var url = ctx + '/qxc/getRateInfo';
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
				var rateObj = eval('(' + obj.data.rate + ')');
				for(o in rateObj){
					var value = rateObj[o][1];
					if((value + "").split(".").length == 1){
						value = value + ".00";
					}
					$("#rateAll").val(rateObj[o][1]);
					break;
				}
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
var otime = 20;//开盘请求间隔时间
var stime = otime;
setInterval(function(){
	stime--;
	if(stime<=0){
		stime=otime;
		getRate($("#gameCode").val());
	}
	if(s_flag == 1){
		countdown();
		setOpenBall(s_ob);
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
			$("input[type='checkbox']").checkboxradio("enable");
			$("input[type='radio']").checkboxradio("enable");
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
			tcl = 'border-color-g2 ball-result float-l';
		}
		if(i==4){
			str += '<div class="b-txt">+</div>'
		}
		str += '<div class="' + tcl + '" ball="2">' + ('' == ball[i] ? '?' : ball[i]) + '</div>';
	}
	$("#openball").html(str);
}
function changeGame(game){
	if(game != $("#gameCode").val()){
		$("ul li .ui-btn-active").removeClass("ui-btn-active");
		var str = "changeGame('" + game + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
		$("#gameCode").val(game);
		$("#pgameCode").val(game);
		$("input[type='checkbox']").prop("checked",false).checkboxradio("refresh");
        $("input[type='radio']").prop("checked",false).checkboxradio("refresh");
        $("#orderBtn").removeClass('ui-icon-check-b ui-btn-icon-right-b');
		$("#orderCount").removeClass('spnicon').text('');
		getRate($("#gameCode").val());
	}
}
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>
