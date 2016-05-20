<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/qxc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
</head>
<c:set var="page_title" value="七{[{5pif}]}彩" scope="request"/>
<body>
	<section data-role="page" id="lobby_gdsf">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		   <a href="${ctx}/index" data-role="none" class="ui-btn-left ui-btn2 ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         	</div>
         	<a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" id="showUserInfo" data-iconpos="right">个人中心</a>
         	<div data-role="header" data-theme="c"><h1 class="ui-title-noindent">七星大厅</h1></div>
		</div>
		<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
		<div data-role="content" class="ui-mt-10">
			<div data-role="listview" class="reset">
				<li><a href="${ctx}/qxc/kx" title="快选" data-transition="slide" data-ajax="false">快选</a></li>
				<li><a href="${ctx}/qxc/kt" title="快填" data-transition="slide" data-ajax="false">快填</a></li>
				<li><a href="${ctx}/qxc/kd" title="快打" data-transition="slide" data-ajax="false">快打</a></li>
				<c:if test = "${empty obj.cf || obj.cf.gc_32 == 32}">
					<li><a class="ui-mt-10" href="${ctx}/qxc/topage?pageName=ydw&pgameCode=32&gameCode=32" title="一{[{5a6a}]}位" data-transition="slide" data-ajax="false">一{[{5a6a}]}位</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_33 == 33}">
					<li><a href="${ctx}/qxc/topage?pageName=edw&pgameCode=33&gameCode=gc" title="二{[{5a6a}]}位" data-transition="slide" data-ajax="false">二{[{5a6a}]}位</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_34 == 34}">
					<li><a href="${ctx}/qxc/topage?pageName=sdw&pgameCode=34&gameCode=gc" title="三{[{5a6a}]}位" data-transition="slide" data-ajax="false">三{[{5a6a}]}位</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_35 == 35}">
					<li><a href="${ctx}/qxc/topage?pageName=sidw&pgameCode=35&gameCode=gc" title="四{[{5a6a}]}位" data-transition="slide" data-ajax="false">四{[{5a6a}]}位</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_36 == 36}">
					<li class="ui-mt-10"><a href="${ctx}/qxc/topage?pageName=yzx&pgameCode=36&gameCode=36" title="一{[{5a2X}]}现" data-transition="slide" data-ajax="false">一{[{5a2X}]}现</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_37 == 37}">
					<li><a href="${ctx}/qxc/topage?pageName=ezx&pgameCode=37&gameCode=37" title="二{[{5a2X}]}现" data-transition="slide" data-ajax="false">二{[{5a2X}]}现</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_38 == 38}">
					<li><a href="${ctx}/qxc/topage?pageName=szx&pgameCode=38&gameCode=38" title="三{[{5a2X}]}现" data-transition="slide" data-ajax="false">三{[{5a2X}]}现</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_39 == 39}">
					<li><a href="${ctx}/qxc/topage?pageName=sizx&pgameCode=39&gameCode=39" title="四{[{5a2X}]}现" data-transition="slide" data-ajax="false">四{[{5a2X}]}现</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_40 == 40}">
					<li class="ui-mt-10"><a href="${ctx}/qxc/topage?pageName=sm&pgameCode=40&gameCode=40" title="{[{5Y+M}]}面" data-transition="slide" data-ajax="false">{[{5Y+M}]}面</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_41 == 41}">
					<li><a href="${ctx}/qxc/topage?pageName=wlqdw&pgameCode=41&gameCode=41" title="五六七{[{5a6a}]}位" data-transition="slide" data-ajax="false">五六七{[{5a6a}]}位</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_44 == 44}">
					<li><a href="${ctx}/qxc/topage?pageName=lh&pgameCode=44&gameCode=44" title="{[{6b6Z6JmO}]}" data-transition="slide" data-ajax="false">{[{6b6Z6JmO}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_45 == 45}">
					<li><a href="${ctx}/qxc/topage?pageName=gg&pgameCode=45&gameCode=45" title="{[{6L+H5YWz}]}" data-transition="slide" data-ajax="false">{[{6L+H5YWz}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_46 == 46}">
					<li><a href="${ctx}/qxc/topage?pageName=kdu&pgameCode=46&gameCode=gc" title="{[{6Leo5bqm}]}" data-transition="slide" data-ajax="false">{[{6Leo5bqm}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_47 == 47}">
					<li><a href="${ctx}/qxc/topage?pageName=hs&pgameCode=47&gameCode=gc" title="{[{5ZKM5pWw}]}" data-transition="slide" data-ajax="false">{[{5ZKM5pWw}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_48 == 48}">
					<li><a href="${ctx}/qxc/topage?pageName=dxzy&pgameCode=48&gameCode=gc" title="多{[{6YCJ5Lit5LiA}]}" data-transition="slide" data-ajax="false">多{[{6YCJ5Lit5LiA}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_49 == 49}">
					<li><a href="${ctx}/qxc/topage?pageName=bz&pgameCode=49&gameCode=gc" title="不{[{5Lit}]}" data-transition="slide" data-ajax="false">不{[{5Lit}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_50 == 50}">
					<li><a href="${ctx}/qxc/topage?pageName=zxl&pgameCode=50&gameCode=gc" title="组{[{6YCJ}]}六" data-transition="slide" data-ajax="false">组{[{6YCJ}]}六</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_51 == 51}">
					<li><a href="${ctx}/qxc/topage?pageName=zfb&pgameCode=51&gameCode=51" title="中{[{5Y+R55m9}]}" data-transition="slide" data-ajax="false">中{[{5Y+R55m9}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_52 == 52}">
					<li><a href="${ctx}/qxc/topage?pageName=gc&pgameCode=52&gameCode=52" title="七{[{56CB}]}" data-transition="slide" data-ajax="false">七{[{56CB}]}</a></li>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gc_53 == 53}">
					<li><a href="${ctx}/qxc/topage?pageName=wx&pgameCode=53&gameCode=53" title="{[{5LqU}]}行" data-transition="slide" data-ajax="false">{[{5LqU}]}行</a></li>
				</c:if>
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>