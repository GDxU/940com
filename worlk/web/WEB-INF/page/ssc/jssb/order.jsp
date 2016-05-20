<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/tld/base64.tld" prefix="myfn" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <%@ include file="/WEB-INF/page/global.jsp" %>
    <script src="${staticFileUrl}/js/ssc/panel.js"></script>
    <link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
    <style type="text/css">
        .orderTable td {
            border-top: #bbb 1px solid;
        }

        .orderTable td a {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div data-role="page">
    <div data-role="header" data-position="fixed" data-tap-toggle="false">
        <a href="${ctx}/ssc/menu" data-ajax="false" data-role="none" 
           class="ui-btn2 ui-shadow ui-corner-all ui-icon-home ui-btn-icon-notext"> </a>

        <div class="header-bg">
            <div class="logo inline-block">
                <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
            </div>
        </div>
        <a href="#user-center" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext" data-ajax="false" data-role="none"> </a>

        <div data-role="header" data-theme="c">
            <a id="goback" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>

            <h1>${msg['title.ssc.JSKS']}</h1>
        </div>
    </div>
	<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>    
    <div data-role="content">
        <form action="${ctx}/ssc/jssb/submit" data-ajax="false">
            <input type="hidden" name="bon" value="${obj.bon}">
            <input type="hidden" name="gameId" value="${obj.gameId}">
            <input type="hidden" name="issue" value="${obj.issue}">
            <input type="hidden" name="isChange" value="0">
            <input type="hidden" name="hc" value="${obj.hc}">

            <div class="fhold">
                <div class="divtitle">
                    <span class="iconspan"></span><span class="spnmar">会员资料</span>
                </div>
                <div class="divtable">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0"
                           style="border:none; width:100%;">
                        <tr style="border:none;">
                            <td class="titled" style="border:none;">帐号</td>
                            <td align="right" style="border:none;" class="detailsb"><span id="anid"></span></td>
                        </tr>
                        <tr style="border:none;">
                            <td class="titled" style="border:none;">额度&nbsp;</td>
                            <td align="right" class="detailsb" style="border:none;"><span id="acid"></span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="fhold">
                <div class="divtitle">
                    <span class="spnmar mgspan">${msg['label.ssc.xiazhu']}</span>
                </div>
                <div class="divtable">
                    <table width="100%" border="0" id="orderTable" cellpadding="0" cellspacing="0" style="border:none; width:100%;">
                        <thead>
                            <tr class="trhight" style="border:none;">
                                <td class="titled" colspan="2" style="border:none;font-size:12px;">
                                  	  <span id="isid">期数:${obj.issue}</span> &nbsp; &nbsp;盘口:<span id="hcid">${obj.hc}</span>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="t" varStatus="s" items="${obj.titles}">
                        <tr class="trhight" style="border:none;">
                            <td style="border:none;">
                                <span class="spannum1">${myfn:decode(t)}</span>
                                <span class="spannum2">@</span>
                                <span class="spannum3">${obj.rates[s.index]}</span>
                            </td>
                            <td align="right" class="tdselect" style="border:none;">
                                <span>
                                    <input type='hidden'name='type' value="${obj.types[s.index]}">
                                    <input type='hidden'name='rate' value="${obj.rates[s.index]}">
                                    <input id="a_${s.index}" type='number' name='amount' class="numb_px" data-role="none">
                                    <input type="button" aid="a_${s.index}" value="填" rel="w" class="btnfill btn-width-6 btnmgr-l-r btnxy" data-role="none">
                                    <input type="button" value="删" rel="d" class="btncancel btn-width-6 btnmgr-l-r btnxy" data-role="none">
                                </span>
                            </td>
                        </tr>
                        </c:forEach>
                        <tr class="trhight" style="border:none;">
                            <td align="center" colspan="2"></td>
                        </tr>
                        <tr class="trhight" style="border:none;">
                            <td align="center" colspan="2"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
    </div>
	<div data-role="footer" class="ui-footer ui-footer-fixed">
		<div class= "ui-grid-a">
		 <div class= "ui-btn5 ui-block-a">
			<a href="#" id="cancelBtn" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">取消</a>
		 </div>
		 <div class= "ui-btn4 ui-block-b">
		 	<a href="#" id="submitBtn" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">确认</a>
		 </div>
		</div>
	</div>	    
</div>
</body>
<script type="text/javascript">
    function showResultSucceed() {
        alert(utf8to16(base64decode('5LiL5rOo5oiQ5Yqf77yM6K+35qOA5p+l5LiL5rOo54q25Ya15ZKM6LSm5oi35Y6G5Y+y77yB')));
        goBack();
    }

    function showResultFailure(info) {
        //alert(utf8to16(base64decode('5oqV5rOo5aSx6LSlIQ==')) + info);
        alert(info);
    }

    function showRateCheck(info) {
        var r = confirm(info);
        if (r == true) {
            $("input[name='isChange']").val("1");
            $("#submitBtn").click();
        }
    }

    function goBack() {
        window.location.replace("${ctx}/ssc/jssb/dxsb");
    }

    $(function () {
        getUserInfo();
        if ($("input[name='issue']").val() === "") {
            goBack();
        }
        $(document).on("click", "[rel='d']", function (e) {
            $(this).parent().parent().parent().remove();
            if($("[rel='d']").size()<1){
                goBack();
            }
        });
        $(document).on("click", "[rel='w']", function (e) {
            var val = $("#"+$(this).attr("aid")).val();
            if(val === ""){
            	val = 2;
            }
            $("input[name='amount']").each(function(i){
                $(this).val(val);
            });
        });
        $("#cancelBtn").on("click", function () {
            goBack();
        });
        $("#goback").on("click", function () {
            goBack();
        });
        $("form").on("submit",function(e){
            e.preventDefault();
            $("#submitBtn").click();
        });
        $("#submitBtn").on("click", function (e) {
        	if(isMoney()){
        		$(this).attr("disabled","disabled").addClass("ui-state-disabled");
        		showSubmit();
           		var jqxhr = $.post("${ctx}/ssc/jssb/submit", $("form").serialize(), function (o) {
           			hideLoader();
	                if (o.success == 1) {
	                    showResultSucceed();
	                } else if (o.success == 0) {
	                    showResultFailure(o.promptName);
	                } else if (o.success == 2) {
	                    showRateCheck(o.promptName);
	                } else {
	                	showResultFailure(o.promptName);
	                }
	            }, "json");
	             
	            jqxhr.always(function() {
  					//setTimeout(function(){$(this).removeClass("ui-state-disabled")}, 10);
  					$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
				});
        	}
        });
    });
    
	function isMoney(){
		var obj = $("[name='amount']");
		var te= /^[1-9]+[0-9]*]*$/;
		for(var i = 0; i < obj.length; i++){
			if(!te.test(obj[i].value)){
				alert(utf8to16(base64decode('5LiL5rOo6YeR6aKd6L6T5YWl6ZSZ6K+v77yM6K+36L6T5YWl5aSn5LqOMOeahOato+aVtOaVsO+8gQ==')));
				return false;
			}
		}
		return true;
	}
	
    //{[{5rOo}]}单页面获取用户信息
    function getUserInfo(){
        var url = '${ctx}/ssc/getUserInfo?t=' + new Date().getTime();
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
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>