<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/trip.min.css">
<script src="${staticFileUrl}/js/jquery.cookie.js"></script>
<script src="${staticFileUrl}/js/trip.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	checkIntro();
});

//是否显示操作引导信息
function checkIntro() {
   if ($.cookie('firstVistLobby') == undefined) {
        var trip = new Trip([{
            sel: $('#showUserInfo'),
            content: '会员中心查询下注交易记录等信息',
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
<!-- 彩票大厅 -->
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
         	<div data-role="header" data-theme="c"><h1>${msg['title.ssc.lobby']}</h1></div>
		</div>
 		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" >
<!-- 			<ul data-role="listview" data-inset="true" data-theme="e"> -->
			<ul data-role="listview" class="ui-alt-icon reset">
				<c:if test = "${empty obj.cf || obj.cf.klc == 1}">			
				<li>
					<a href="${ctx}/ssc/gdsfmenu" rel="external" style="padding:0.4em 0.5em 0.2em 0.5em ;"> 
						<div class="menu-klc"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.KLC']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc == 1}">			
				<li>
					<a href="${ctx}/ssc/tjsfmenu" rel="external" style="padding:0.4em 0.5em 0.2em 0.5em ;"> 
						<div class="menu-klc"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.TJKLC']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.klc == 1}">			
				<li>
					<a href="${ctx}/ssc/gxsfmenu" rel="external" style="padding:0.4em 0.5em 0.2em 0.5em ;"> 
						<div class="menu-klc"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.GXKLC']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc == 1}">
				<li>
					<a href="${ctx}/ssc/cqssmenu" rel="external" style="padding:0.2em 0.5em;"> 
						<div class="menu-ssc"></div>
						<div class="divarr"></div>
						<h2><span id="enterGame">${msg['title.ssc.SSC']}</span></h2>
						<p>每天开奖120期(白天72期，夜晚48期)</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc == 1}">
				<li>
					<a href="${ctx}/ssc/tjssmenu" rel="external" style="padding:0.2em 0.5em;"> 
						<div class="menu-ssc"></div>
						<div class="divarr"></div>
						<h2><span id="enterGame">${msg['title.ssc.TJSSC']}</span></h2>
						<p>每天开奖120期(白天72期，夜晚48期)</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.bjc == 1}">
				<li>
					<a href="${ctx}/ssc/bjsc" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-bjc"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.BJC']}</h2>
						<p>每5分钟一期，全天179期</p>
					</a>
				</li>	
				</c:if>	
				<c:if test = "${empty obj.cf || obj.cf.xync == 1}">
				<li>
					<a href="${ctx}/ssc/xync" rel="external" style="padding:0.2em 0.5em;"> 
						<div class="menu-xync"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.XYNC']}</h2>
						<p>每10分钟一期，全天97期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jsks == 1}">
				<li>
					<a href="${ctx}/ssc/jssb" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-jsks"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.JSKS']}</h2>
						<p>每10分钟一期，全天82期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jxssc == 1}">
				<li>
					<a href="${ctx}/ssc/jxssmenu" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-jxssc"></div>
						<div class="divarr"></div>
						<h2><span id="enterGame">${msg['title.ssc.JXSSC']}</span></h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.xjssc == 1}">
				<li>
					<a href="${ctx}/ssc/xjssmenu" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-xjssc"></div>
						<div class="divarr"></div>
						<h2><span id="enterGame">${msg['title.ssc.XJSSC']}</span></h2>
						<p>每10分钟一期，全天96期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">
				<li>
					<a href="${ctx}/ssc/gdsyxwmenu" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-gdsyxw"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.GDSYXW']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">
				<li>
					<a href="${ctx}/ssc/shsyxwmenu" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-gdsyxw"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.SHSYXW']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>	
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">
				<li>
					<a href="${ctx}/ssc/sdsyxwmenu" rel="external" style="padding:0.2em 0.5em;">
						<div class="menu-gdsyxw"></div>
						<div class="divarr"></div>
						<h2>${msg['title.ssc.SDSYXW']}</h2>
						<p>每10分钟一期，全天84期</p>
					</a>
				</li>	
				</c:if>
				<!-- 
				-->
			</ul>
	</div> 
</section>
</body>
</html>
