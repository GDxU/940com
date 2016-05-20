<%--------------------------------公告----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<%@ include file="/WEB-INF/page/i18n.jsp" %>
<script type="text/javascript" src="${staticFileUrl}/js/sport/panel.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/dateUtil.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/sport.css">
<style>
	#afficheInfoListView > .ui-li-static {
	  padding: .7em 1em;
	}
</style>
<script type="text/javascript">
var msgs = null, afficheInfoListView = null;
$(function() {
	loadAfficheInfo();
	$("#dateNavBar a").click(function(){
		showLoader();
		var range = $(this).jqmData("range");
		var today = getToday()[0].Format("yyyy-MM-dd");
		var yesterday = getYesterday()[0].Format("yyyy-MM-dd");
		afficheInfoListView.empty();
		var size = 0;
		$.each(msgs, function(key, element) {
			var dateStr = (element.attr("date")).replace(/-/g, "/");
			var gmt0 = new Date(dateStr);
			var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);			
			var dt = $.format.date(gmt8, "yyyy-MM-dd")
			var content = element.attr("content");
			if(content == undefined){
				content = "";
			}else{
				content = utf8to16(base64decode(content));
			}			
			if(range == 1){
				size++;
				afficheInfoListView.append("<li><strong>" + dt + "</strong><p style='white-space:pre-wrap;'>" + content + "</p></li>");
			}else if(range == 2){
				if(dt == today){
					size++;
					afficheInfoListView.append("<li><strong>" + dt + "</strong><p style='white-space:pre-wrap;'>" + content + "</p></li>");
				}
			}else if(range == 3){
				if(dt == yesterday){
					size++;
					afficheInfoListView.append("<li><strong>" + dt + "</strong><p style='white-space:pre-wrap;'>" + content + "</p></li>");
				}
			}else if(range == 4){
				if(dt != today && dt != yesterday){
					size++;
					afficheInfoListView.append("<li><strong>" + dt + "</strong><p style='white-space:pre-wrap;'>" + content + "</p></li>");
				}
			}
	    });
	    afficheInfoListView.listview("refresh");
		if(size > 10){
			$("#backBtn").show();
		}else{
			$("#backBtn").hide();
		}
	    hideLoader();
	});
});
	
function loadAfficheInfo() {
	showLoader("${msg['msg.common.loading']}");
	afficheInfoListView = $("#afficheInfoListView");
	var request = $.ajax({
	    url: '${ctx}/sport/getMessage',
	    data: {
	        "t": new Date().getTime()
	    },
	    dataType: 'xml'
	});
	
	request.done(function(xmlResult) {
		var root = $(xmlResult);
		afficheInfoListView.empty();
		msgs = new Array();
		var messages = root.find('message');
		messages.each(function(){
			var element = $(this);
			msgs.push(element);
			var content = element.attr("content");
			if(content == undefined){
				content = "";
			}else{
				content = utf8to16(base64decode(content));
			}
			var dateStr = (element.attr("date")).replace(/-/g, "/");
			var gmt0 = new Date(dateStr);
			var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);			
			afficheInfoListView.append("<li><strong>" + $.format.date(gmt8, "yyyy-MM-dd") + "</strong><p style='white-space:pre-wrap;'>" + content + "</p></li>");
		});
		afficheInfoListView.listview("refresh");
		if(messages.length > 10){
			$("#backBtn").show();
		}else{
			$("#backBtn").hide();
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
			<a href="#quick-links" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"></a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['label.sport.announcement']}</h1>
			<%--<a href="#" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a> --%>
		 </div>
	</div>
	<%@ include file="panel_left.jsp"%>
	<%@ include file="panel_right.jsp" %>
  <div data-role="content">
  	<div data-role="navbar" data-grid="b" id="dateNavBar">
	  	<ul>
			<li><a href="#" class="ui-btn-active" data-range="1">${msg['label.sport.announcement.all']}</a></li>
	        <li><a href="#" data-range="2">${msg['label.sport.announcement.today']}</a></li>
			<li><a href="#" data-range="3">${msg['label.sport.announcement.yesterday']}</a></li>
			<!--<li><a href="#" data-range="4">${msg['label.sport.announcement.beforeYesterday']}</a></li> -->
		</ul>
	</div>
	<ol data-role="listview" class="reset" id="afficheInfoListView" data-filter="true" data-filter-placeholder="${msg['label.sport.fb.sl']}">
		<%--<li><strong>2014-6-9 18:48:31</strong><p style="white-space:pre-wrap;">足球赛事</p></li> --%>
	</ol>
	<a id="backBtn" style="display:none;" href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="y">${msg["button.common.backTop"]}</a></p>
  </div>  
</div> 
</body>
</html>