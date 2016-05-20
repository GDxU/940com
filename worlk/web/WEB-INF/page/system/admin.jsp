<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${ctx}/css/login.css?v=${rsvn}">
<script type="text/javascript" src="${ctx}/js/plugin/rsa/rsa.min.js"></script>
<script type="text/javascript">
$(function() {
    //enter
	var $ipt = $('input').not(":hidden");
	$ipt.bind('keydown', function(e) {
	    var key = e.which;
	    if (key == 13) {
	        e.preventDefault();
	        var nxtIdx = $ipt.index(this) + 1;
	        console.log(nxtIdx);
	        $ipt.eq(nxtIdx).focus().trigger("click");
	        if(nxtIdx == 2){
	        	login();
	        }
	    }
	});  
	
    //账号只能是字母数字,不能包含空格
    $('#username').keyup(function(){
        this.value = this.value.replace(/[^a-zA-Z0-9]/g,'');
    }).focus(function(){
        $(this).blur(function(){ this.value = (/[^a-zA-Z0-9]/g.test(this.value)) ? '' : this.value; });
    });

    //密码只能数字或字母
    /**
    $('input[name=password]').keyup(function(){
        this.value = this.value.replace(/[^a-zA-Z0-9]/g,'');
    });
    */    	
});
function login(){
	var username = $("#username").val().trim(), password = $("#password").val().trim(), vcode = $("#vcode").val(), pm = $("#pm").val();
	if(username == ""){
		alert("${msg['msg.portal.plsInputUserName']}");
		$("#username").focus();
		return;
	}
	if(password == ""){
		alert("${msg['msg.portal.plsInputPwd']}");
		$("#password").focus();
		return;
	}	
	password = doRSAEncrypt($("#pm").val(), $("#pe").val(), password);
	
    $.mobile.loading('show', {
        text: '${msg["msg.portal.plsWait"]}',
        textVisible: true, 
        theme: 'b',
        textonly: false,
        html: "<div class='loading-logo'></div><span class='ui-icon-loading'></span><h4 style='text-align:center;'>" + "${msg["msg.portal.plsWait"]}" + "</h4>" //要显示的html内容，如图片等
    });	 
    
	$("#loginBtn").addClass("ui-state-disabled");    
    var jqxhr = $.post("${ctx}/sys/login", {username: username, password: password, vcode: vcode, pm: pm}, function (o) {
    	hideLoader();
		var result = o.r;
	    if (result == 0) {
	    	window.location.href= "${ctx}/sys/main";
	    } else {
	    	setTimeout(alert(o.m),100);
	    } 
    }, "json");  
     
    jqxhr.always(function() {
    	$("#loginBtn").removeClass("ui-state-disabled");
    });	
}
</script>
<c:if test="${!empty sessionScope.ADMIN_USER_SESSION}">
	<script type="text/javascript">
		window.location.href= "${ctx}/sys/main";
	</script>	
</c:if> 
</head>
<body style="background-color: #113203;">
   <section data-role="page" id="login" class="login" data-title="${msg['title.portal.platform']}" style="overflow: visible;">
   		<div data-role="header">
   		<a href="${ctx}/index" data-role="none" class="ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"></a>
   		   <div class="header-bg">
                <div class="logo inline-block">
                    <img src="${ctx}/images/logo_vinbet.png" height="40">
                </div>
            </div>
   		</div>
   		<div data-role="content" class="login-content">	
          <div class="swipe-wrap swipe-login">
                <div class="swipe-list">
                    <ul class="swipe-ul">
                        <li><img src="${ctx}/images/ad2-2.jpg" alt="" height="170"></li>                    
                    </ul>
                </div>
            </div>   	
               <div class="login">
                     <form action="${ctx}/dologin" method="post" data-ajax="false" class="formspc">
                     	<input type="hidden" id="pm" value="${obj.pm}"/>
                     	<input type="hidden" id="pe" value="${obj.pe}"/>
                        <div class="login-unit">
                            <input name="username" id="username" type="text" maxlength="15" class="username" value="" placeholder="${msg['label.portal.username']}" tabindex="1" required="required"/>
                        </div>
                        <div class="login-unit">
                            <input name="password" id="password" type="password" maxlength="15" class="password" value="" placeholder="${msg['label.portal.pwd']}" tabindex="2" required="required" autocomplete="off"/>
                        </div>
                        <div class="login-btn-wrap login-unit">
                            <a href="javascript:login();" tabindex="3" data-ajax="false" id="loginBtn" name="loginBtn">${msg['label.portal.login']}</a>
                        </div>
				</form>
             </div>            	
   		</div>
   </section>
  </body>
  <script type="text/javascript">
  $(function(){
    //账号不能有空格
    $('#userName').keyup(function(){
        this.value = this.value.replace(/[^a-zA-Z0-9]/g,'');
    }).focus(function(){
        $(this).blur(function(){ this.value = (/[^a-zA-Z0-9]/g.test(this.value)) ? '' : this.value; });
    });    
  });
  </script>
</html>
