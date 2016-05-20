<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
</head>
<c:set var="page_title" value="${msg['title.hkc']}" scope="request"/>
<body>
	<section data-role="page" id="lobby_gdsf">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		   <a href="${ctx}/index" data-role="none" class="ui-btn-left ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         	</div>
         	<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" id="showUserInfo" data-iconpos="right">个人{[{5Lit}]}心</a>
         	<div data-role="header" data-theme="c"><h1 class="ui-title-noindent">${msg['title.hkc']}{[{5aSn}]}厅</h1></div>
		</div>
		<%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div class="reset ui-listview-padding">
			<div data-role="collapsibleset">
				<div data-role="collapsible" data-iconpos="right" class="list-bk">
					<h3>${msg['title.hkc.game10']}</h3>
					<ul data-role="listview" data-theme="c">
						<c:if test="${empty obj.hkcf || obj.hkcf.tm == 0}">
							<li><a href="${ctx}/hkc/tm/"
								title="${msg['title.hkc.game10']}" data-transition="slide"
								data-ajax="false" data-theme="l">中</a></li>
						</c:if>
						<c:if test="${empty obj.hkcf || obj.hkcf.tmbz == 0}">
							<li><a href="${ctx}/hkc/tmbz/"
								title="${msg['title.hkc.game35']}" data-transition="slide"
								data-ajax="false">{[{5LiN5Lit}]}</a></li>
						</c:if>
					</ul>
				</div>

				<div data-role="collapsible" data-iconpos="right" class="list-bk">
					<h3>${msg['title.hkc.game11']}</h3>
					<ul data-role="listview">
						<c:if test="${empty obj.hkcf || obj.hkcf.zm == 0}">
							<li><a href="${ctx}/hkc/zm/"
								title="${msg['title.hkc.game11']}" data-transition="slide"
								data-ajax="false">中</a></li>
						</c:if>
						<c:if test="${empty obj.hkcf || obj.hkcf.zmbz == 0}">
							<li><a href="${ctx}/hkc/zmbz/"
								title="${msg['title.hkc.game36']}" data-transition="slide"
								data-ajax="false">{[{5LiN5Lit}]}</a></li>
						</c:if>
					</ul>
				</div>
				
				<div data-role="collapsible" data-iconpos="right" class="list-bk">
					<h3>${msg['title.hkc.game12']}</h3>
					<ul data-role="listview">
						<c:if test="${empty obj.hkcf || obj.hkcf.zmt == 0}">
							<li><a href="${ctx}/hkc/ztm/"
								title="${msg['title.hkc.game12']}" data-transition="slide"
								data-ajax="false">中</a></li>
						</c:if>
						<c:if test="${empty obj.hkcf || obj.hkcf.zmtbz == 0}">
							<li><a href="${ctx}/hkc/ztmbz/"
								title="${msg['title.hkc.game45']}" data-transition="slide"
								data-ajax="false">{[{5LiN5Lit}]}</a></li>
						</c:if>
					</ul>
				</div>
				
					<ul data-role="listview" class="reset">
				<c:if test = "${empty obj.hkcf || obj.hkcf.lm == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=lianma&pid=15" title="${msg['title.hkc.game15']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game15']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.gg == 0}">
				<li class="ui-mt-10"><a href="${ctx}/hkc/gg/" title="${msg['title.hkc.game17']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game17']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.zx == 0}">
				<li><a href="${ctx}/hkc/zx/" title="${msg['title.hkc.game34']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game34']}</a></li>
				</c:if>				
				<c:if test = "${empty obj.hkcf || obj.hkcf.tx == 0}">
				<li><a href="${ctx}/hkc/tx/" title="${msg['title.hkc.game18']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game18']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.tmtw == 0}">
				<li><a href="${ctx}/hkc/tmtw/" title="${msg['title.hkc.game19']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game19']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.wxbb == 0}">
				<li><a href="${ctx}/hkc/wxbb/" title="${msg['title.hkc.game20']}${msg['title.hkc.game21']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game20']}${msg['title.hkc.game21']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.zongxiao == 0}">
				<li><a href="${ctx}/hkc/zongxiao/" title="${msg['title.hkc.game32']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game32']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.qsb == 0}">
				<li><a href="${ctx}/hkc/qisebo/" title="${msg['title.hkc.game33']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game33']}</a></li>
				</c:if>									
				<c:if test = "${empty obj.hkcf || obj.hkcf.qm == 0}">
				<li><a href="${ctx}/hkc/qm/" title="${msg['title.hkc.game29']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game29']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.lx == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=sx&pid=16&type=lx" title="${msg['title.hkc.game16']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game16']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.yxws == 0}">
				<li><a href="${ctx}/hkc/yxws/" title="${msg['title.hkc.game13']}${msg['title.hkc.game14']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game13']}${msg['title.hkc.game14']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.sxl == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=sx&pid=23&type=sxl" title="${msg['title.hkc.game23']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game23']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.wsl == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=ws&pid=24" title="${msg['title.hkc.game24']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game24']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.bz == 0}">
				<li class="ui-mt-10"><a href="${ctx}/hkc/topage?pageName=zbz&pid=22&type=bz" title="${msg['title.hkc.game22']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game22']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.dxzy == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=zbz&pid=30&type=dxzy" title="${msg['title.hkc.game30']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game30']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.tzp == 0}">
				<li><a href="${ctx}/hkc/topage?pageName=zbz&pid=31&type=tzp" title="${msg['title.hkc.game31']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game31']}</a></li>
				</c:if>
				<c:if test = "${empty obj.hkcf || obj.hkcf.lh == 0}">
				<li><a href="${ctx}/hkc/lh/" title="${msg['title.hkc.game41']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game41']}</a></li>
				</c:if>
				
				<c:if test = "${empty obj.hkcf || obj.hkcf.zhsm == 0}">
				<li><a href="${ctx}/hkc/zhsm/" title="${msg['title.hkc.game42']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game42']}</a></li>
				</c:if>
				
				<c:if test = "${empty obj.hkcf || obj.hkcf.banbanbo == 0}">
				<li><a href="${ctx}/hkc/banbanbo/" title="${msg['title.hkc.game43']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game43']}</a></li>
				</c:if>
				
				<c:if test = "${empty obj.hkcf || obj.hkcf.sxsm == 0}">
				<li><a href="${ctx}/hkc/sxsm/" title="${msg['title.hkc.game44']}" data-transition="slide" data-ajax="false">${msg['title.hkc.game44']}</a></li>
				</c:if>
				</ul>
				</div>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>
