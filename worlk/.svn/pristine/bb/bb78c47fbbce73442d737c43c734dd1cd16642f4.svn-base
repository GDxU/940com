<!--------------------------------个人资讯---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<script type="text/javascript">
$(function(){
	getUserInfo();
});
function getUserInfo(){
    showLoader();
    var userBaseInfo = $("#userBaseInfo");
    var request = $.ajax({
        url: '${ctx}/ssc/getUserInfo',
        data: {
        	"t": new Date().getTime()
        },
        dataType: 'json'
    });   
    request.done(function(json) {
    	var result = json.r;
    	if(result == 0){
    		userBaseInfo.empty();
    		var userType = json.data.tp;//类型
    		var status = json.data.sts;//状态
    		if(status == 1){
    			status = "正常";
    		}else if(status == 2){
    			status = "锁定";
    		}else if(status == 3){
    			status = "禁用";
    		}else if(status == 4){
    			status = "停押";
    		}
    		if(userType == 0){//信用
    			userBaseInfo.append('<li>账号<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>会员名称<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>{[{5L+h55So6aKd5bqm}]}<span class="ui-li-count">' + formNumber(json.data.sc,2) + '</span></li>');
    			userBaseInfo.append('<li>{[{5L+h55So5L2Z6aKd}]}<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>账号状态<span class="ui-li-count">' + status + '</span></li>');
    			userBaseInfo.append('<li>所属{[{55uY5Y+j}]}<span class="ui-li-count">' + json.data.ht + '</span></li>');
    		}else{//现金
    			userBaseInfo.append('<li>账号<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>会员名称<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>RMB<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>账号状态<span class="ui-li-count">' + status + '</span></li>');
    			userBaseInfo.append('<li>{[{55uY5Y+j}]}<span class="ui-li-count">' + json.data.ht + '</span></li>');    		
    		}
    		userBaseInfo.listview("refresh");   
    	} else {
	        userBaseInfo.html('<h4 class="ui-bar ui-bar-c ui-corner-all" style="text-align: center;">获取用户基本信息失败,请联系管理员</h4>');
	    }
    }); 
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			userBaseInfo.html('<h4 class="ui-bar ui-bar-b ui-corner-all" style="color:#FFF;text-align: center;">网络中断,请检测网络</h4>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}	    
	});
	request.always(function() {
		userBaseInfo.html(replaceAllHtml(userBaseInfo.html()));
	    hideLoader();
	}); 	
}
</script>
</head>
<body>
<div data-role="page" id="userInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>个人资讯</h1>
		 </div>
	</div>
  	<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
	<div data-role="main"  class="ui-content" >
	  <div class="ui-bar ui-bar-b ui-corner-all" >
	    <h3>基本信息</h3>
	  </div>
		<div data-role="listview" class="reset" id="userBaseInfo" data-mini="true">
			<li>正在加载用户基本信息...</li>
			<!-- 
			<li id="accnum">账号<span class="ui-li-count"></span></li>
			<li id="accname">会员名称<span class="ui-li-count">testaaa</span></li>
			<li id="cash_balance">RMB<span class="ui-li-count"></span></li>
			<li id="credit_default">信用额度<span class="ui-li-count"></span></li>
			<li id="credit_balance">信用余额<span class="ui-li-count"></span></li>
			<li id="acc_status">账号状态<span class="ui-li-count">正常 </span></li>
			<li id="handType">所属{[{55uY5Y+j}]}<span class="ui-li-count">A,B,C,D</span></li>
			 -->
		</div>
	  <div class="ui-bar ui-bar-b ui-corner-all" >
	    <h3>限额信息</h3>
	  </div>
		<div data-role="listview" class="reset ui-alt-icon">
			<li data-role="list-divider">快乐十分</li>
			<c:if test = "${empty obj.cf || obj.cf.klc == 1}">	
			<li><a href="${ctx}/ssc/userDetail?gid=KLC#KLC_PAGE" data-ajax="false">${msg['title.ssc.KLC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.gxklc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=GXKLC#GXKLC_PAGE" data-ajax="false">${msg['title.ssc.GXKLC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.tjklc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=TJKLC#TJKLC_PAGE" data-ajax="false">${msg['title.ssc.TJKLC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.hnklc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=HNKLC#HNKLC_PAGE" data-ajax="false">${msg['title.ssc.HNKLC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.bjklc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=BJKLC#BJKLC_PAGE" data-ajax="false">${msg['title.ssc.BJKLC']}</a></li>
			</c:if>
			<li data-role="list-divider">时时彩</li>
			<c:if test = "${empty obj.cf || obj.cf.ssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=SSC#SSC_PAGE" data-ajax="false">${msg['title.ssc.SSC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jxssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=JXSSC#JXSSC_PAGE" data-ajax="false">${msg['title.ssc.JXSSC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.xjssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=XJSSC#XJSSC_PAGE" data-ajax="false">${msg['title.ssc.XJSSC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.tjssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=TJSSC#TJSSC_PAGE" data-ajax="false">${msg['title.ssc.TJSSC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.ynssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=YNSSC#YNSSC_PAGE" data-ajax="false">${msg['title.ssc.YNSSC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.shssc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=SHSSC#SHSSC_PAGE" data-ajax="false">${msg['title.ssc.SHSSC']}</a></li>
			</c:if>
			<li data-role="list-divider">快三</li>
			<c:if test = "${empty obj.cf || obj.cf.jsks == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=JSKS#JSKS_PAGE" data-ajax="false">${msg['title.ssc.JSKS']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.ahks == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=AHKS#AHKS_PAGE" data-ajax="false">${msg['title.ssc.AHKS']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.gxks == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=GXKS#GXKS_PAGE" data-ajax="false">${msg['title.ssc.GXKS']}</a></li>
			</c:if>
			<li data-role="list-divider">十一选五</li>
			<c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=GDSYXW#GDSYXW_PAGE" data-ajax="false">${msg['title.ssc.GDSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.shsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=SHSYXW#SHSYXW_PAGE" data-ajax="false">${msg['title.ssc.SHSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.sdsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=SDSYXW#SDSYXW_PAGE" data-ajax="false">${msg['title.ssc.SDSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jxsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=JXSYXW#JXSYXW_PAGE" data-ajax="false">${msg['title.ssc.JXSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.lnsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=LNSYXW#LNSYXW_PAGE" data-ajax="false">${msg['title.ssc.LNSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.hbsyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=HBSYXW#HBSYXW_PAGE" data-ajax="false">${msg['title.ssc.HBSYXW']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jssyxw == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=JSSYXW#JSSYXW_PAGE" data-ajax="false">${msg['title.ssc.JSSYXW']}</a></li>
			</c:if>
			<li data-role="list-divider">其他</li>
			<c:if test = "${empty obj.cf || obj.cf.bjc == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=BJC#BJC_PAGE" data-ajax="false">${msg['title.ssc.BJC']}</a></li>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.xync == 1}">
			<li><a href="${ctx}/ssc/userDetail?gid=XYNC#XYNC_PAGE" data-ajax="false">${msg['title.ssc.XYNC']}</a></li>
			</c:if>
		</div>
	</div> 
</div>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>