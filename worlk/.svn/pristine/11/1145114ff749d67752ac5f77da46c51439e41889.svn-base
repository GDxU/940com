<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/qxc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script type="text/javascript">
$(function() {
	loadAfficheInfo();
});
	
function loadAfficheInfo() {
	showLoader();
	var afficheInfoListView = $("#afficheInfoListView");
	var request = $.ajax({
	    url: '${ctx}/qxc/getAfficheInfo',
	    data: {
	        "t": new Date().getTime()
	    },
	    dataType: 'json'
	});
	request.done(function(jsonResult) {
	    var result = jsonResult.r;
	    if (result == 0) {
	        afficheInfoListView.empty();
	        var arr = jsonResult.list;
	        if (arr != undefined && arr.length > 0) {
	            $.each(arr,
	            function(key, value) {
	                afficheInfoListView.append('<li><strong>' + value.d + '</strong><p style="white-space:pre-wrap;">' + utf8to16(base64decode(value.m)) + '</p></li>');
	            });
	            afficheInfoListView.listview("refresh");
	        } else {
	            //afficheInfoListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>');
	        }
	    } else {
	        afficheInfoListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常,请联系管理员</h5>');
	    }
	});
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			afficheInfoListView.html('<h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络中断,请检测网络</h5>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}
	});
	request.always(function() {
	    hideLoader();
	});
}	
</script>
</head>
<body>
<div data-role="page" id="afficheInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/qxc/qxcmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>公告栏</h1>
	 		<a href="javascript:loadAfficheInfo()" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
  <div data-role="content">
	<ol data-role="listview" class="reset" id="afficheInfoListView">
	  <!-- 
	  <li><strong>2014-6-9 18:48:31</strong>
	  	<p style="white-space:pre-wrap;">香#港#六#合#彩2014118期于10月14号星期二中午12:00開盤，21：31封盤，21:35開獎,如有時間變動請以马会開獎時間為準！; </p>
	  </li>
	   -->
	</ol>
  </div>  
</div> 
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>