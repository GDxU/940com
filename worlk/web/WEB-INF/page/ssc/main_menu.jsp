<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/ssc/sscmenu.css">
<link rel="stylesheet" href="${staticFileUrl}/css/trip.min.css">
<script src="${staticFileUrl}/js/jquery.cookie.js"></script>
<script src="${staticFileUrl}/js/trip.min.js"></script>
<style>
.ui-panel-wrapper {
  background-color: rgba(247, 245, 245, 0.87) !important;
}</style>
<script type="text/javascript">
$(document).ready(function() {
	checkIntro();
});

//是否显示操作引导信息
function checkIntro() {
   if ($.cookie('firstVistLobby') == undefined) {
        var trip = new Trip([{
            sel: $('#showUserInfo'),
            content: utf8to16(base64decode('5Lya5ZGY5Lit5b+D5p+l6K+i5LiL5rOo5Lqk5piT6K6w5b2V562J5L+h5oGv')),
            position: "w",
            delay: 3000,
            animation: 'fadeInLeft'
        },
        {
            sel: $('#enterGame'),
            content: '点击进入游戏',            
            position: "e",
            delay: 3000,
            animation: 'fadeInLeft'
        }], {
            "tripTheme": "white"
        });
        
        trip.start();
        
        $.cookie('firstVistLobby', false, {
            expires: 365
        });
    }
}
</script>
</head>
<body>
<section data-role="page" id="lobby">
	
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		   <a href="${ctx}/index" data-role="none" class="ui-btn-left ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
<!-- 	              <a href="#user-center" data-rel="popup" data-ajax="false" data-transition="pop"  data-role="none" class="circle-gradient language-img zh-cn"> -->
<!-- 	               		<span class="lang-img"></span> -->
<!-- 	              </a>              -->
         	</div>
         	<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" id="showUserInfo" data-iconpos="right">个人中心</a>
         	<div data-role="header" data-theme="c"><h1 class="ui-icon-time-qu">${msg['title.ssc.lobby']}</h1></div>
		</div>
 		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" >
		<c:if test = "${empty obj.cf || obj.cf.z_klc == 1}">	
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">{[{5b+r5LmQ5Y2B5YiG}]}</span>
		    </div>
		    <c:if test = "${empty obj.cf || obj.cf.klc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/gdsfmenu'">
			    	<span class="icons ico07"></span>
			        <span class="ico_title">${msg['title.ssc.KLC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.gxklc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/gxsfmenu'">
			    	<span class="icons ico11"></span>
			        <span class="ico_title">${msg['title.ssc.GXKLC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.tjklc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/tjsfmenu'">
			    	<span class="icons ico12"></span>
			        <span class="ico_title">${msg['title.ssc.TJKLC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.hnklc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/hnsfmenu'">
			    	<span class="icons hnkl10"></span>
			        <span class="ico_title">${msg['title.ssc.HNKLC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.bjklc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/bjsfmenu'">
			    	<span class="icons bjkl8"></span>
			        <span class="ico_title">${msg['title.ssc.BJKLC']}</span>
			    </div>
			</c:if>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		<c:if test = "${empty obj.cf || obj.cf.z_ssc == 1}">
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">{[{5pe25pe25b2p}]}</span>
		    </div>
		    <c:if test = "${empty obj.cf || obj.cf.ssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/cqssmenu'">
			    	<span class="icons ico01"></span>
			        <span class="ico_title">${msg['title.ssc.SSC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jxssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/jxssmenu'">
			    	<span class="icons ico05"></span>
			        <span class="ico_title">${msg['title.ssc.JXSSC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.xjssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/xjssmenu'">
			    	<span class="icons ico06"></span>
			        <span class="ico_title">${msg['title.ssc.XJSSC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.tjssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/tjssmenu'">
			    	<span class="icons ico13"></span>
			        <span class="ico_title">${msg['title.ssc.TJSSC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.ynssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/ynssmenu'">
			    	<span class="icons ynssc"></span>
			        <span class="ico_title">${msg['title.ssc.YNSSC']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.shssc == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/shssmenu'">
			    	<span class="icons shssc"></span>
			        <span class="ico_title">${msg['title.ssc.SHSSC']}</span>
			    </div>
			</c:if>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		<c:if test = "${empty obj.cf || obj.cf.z_syxw == 1}">
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">{[{5Y2B5LiA6YCJ5LqU}]}</span>
		    </div>
		    <c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/gdsyxwmenu'">
			    	<span class="icons ico08"></span>
			        <span class="ico_title">${msg['title.ssc.GDSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.shsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/shsyxwmenu'">
			    	<span class="icons ico09"></span>
			        <span class="ico_title">${msg['title.ssc.SHSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.sdsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/sdsyxwmenu'">
			    	<span class="icons ico10"></span>
			        <span class="ico_title">${msg['title.ssc.SDSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jxsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/jxsyxwmenu'">
			    	<span class="icons jx11x5"></span>
			        <span class="ico_title">${msg['title.ssc.JXSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.lnsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/lnsyxwmenu'">
			    	<span class="icons ln11x5"></span>
			        <span class="ico_title">${msg['title.ssc.LNSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.hbsyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/hbsyxwmenu'">
			    	<span class="icons hb11x5"></span>
			        <span class="ico_title">${msg['title.ssc.HBSYXW']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.jssyxw == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/jssyxwmenu'">
			    	<span class="icons js11x5"></span>
			        <span class="ico_title">${msg['title.ssc.JSSYXW']}</span>
			    </div>
			</c:if>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		<c:if test = "${empty obj.cf || obj.cf.bjc == 1}">			
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">{[{5YyX5Lqs6LWb6L2m}]}</span>
		    </div>
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/bjsc/liangmian'">
			    	<span class="icons ico02"></span>
			        <span class="ico_title">${msg['title.ssc.BJC']}</span>
			    </div>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		<c:if test = "${empty obj.cf || obj.cf.z_ks == 1}">
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">{[{5b+r5LiJ}]}</span>
		    </div>
		    <c:if test = "${empty obj.cf || obj.cf.jsks == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/jssb/dxsb'">
			    	<span class="icons ico04"></span>
			        <span class="ico_title">${msg['title.ssc.JSKS']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.ahks == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/ahsb/dxsb'">
			    	<span class="icons awk3"></span>
			        <span class="ico_title">${msg['title.ssc.AHKS']}</span>
			    </div>
			</c:if>
			<c:if test = "${empty obj.cf || obj.cf.gxks == 1}">			
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/gxsb/dxsb'">
			    	<span class="icons gxk3"></span>
			        <span class="ico_title">${msg['title.ssc.GXKS']}</span>
			    </div>
			</c:if>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		<c:if test = "${empty obj.cf || obj.cf.xync == 1}">			
		<div class="ico_frm">
			<div class="setting_title">
				<span class="iftitle">其他彩种</span>
		    </div>
			    <div class="ico_group" onclick="location.href='${ctx}/ssc/xync'">
			    	<span class="icons ico03"></span>
			        <span class="ico_title">${msg['title.ssc.XYNC']}</span>
			    </div>
		    <!---------------------------------------------------------------------->
		    <div style="clear:both; height:1px; width:99%;"></div><!-- 清楚漂浮定位 -->
		</div>
		</c:if>
		
	</div> 
</section>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>
