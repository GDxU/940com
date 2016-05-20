<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2 class="ui-tittle-icon-star">七{[{5pif}]}彩</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
			<li><a href="${ctx}/qxc/kx" title="快选" data-transition="slide" data-ajax="false">快选</a></li>
			<li><a href="${ctx}/qxc/kt" title="快填" data-transition="slide" data-ajax="false">快填</a></li>
			<li><a href="${ctx}/qxc/kd" title="快打" data-transition="slide" data-ajax="false">快打</a></li>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_32 == 32}">
				<li><a href="${ctx}/qxc/topage?pageName=ydw&pgameCode=32&gameCode=32" title="一{[{5a6a}]}位" data-ajax="false" style="background-color:transparent">一{[{5a6a}]}位</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_33 == 33}">
				<li><a href="${ctx}/qxc/topage?pageName=edw&pgameCode=33&gameCode=gc" title="二{[{5a6a}]}位" data-ajax="false" style="background-color:transparent">二{[{5a6a}]}位</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_34 == 34}">
				<li><a href="${ctx}/qxc/topage?pageName=sdw&pgameCode=34&gameCode=gc" title="三{[{5a6a}]}位" data-ajax="false" style="background-color:transparent">三{[{5a6a}]}位</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_35 == 35}">
				<li><a href="${ctx}/qxc/topage?pageName=sidw&pgameCode=35&gameCode=gc" title="四{[{5a6a}]}位" data-ajax="false" style="background-color:transparent">四{[{5a6a}]}位</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_36 == 36}">
				<li><a href="${ctx}/qxc/topage?pageName=yzx&pgameCode=36&gameCode=36" title="一{[{5a2X}]}现" data-ajax="false" style="background-color:transparent">一{[{5a2X}]}现</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_37 == 37}">
				<li><a href="${ctx}/qxc/topage?pageName=ezx&pgameCode=37&gameCode=37" title="二{[{5a2X}]}现" data-ajax="false" style="background-color:transparent">二{[{5a2X}]}现</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_38 == 38}">
				<li><a href="${ctx}/qxc/topage?pageName=szx&pgameCode=38&gameCode=38" title="三{[{5a2X}]}现" data-ajax="false" style="background-color:transparent">三{[{5a2X}]}现</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_39 == 39}">
				<li><a href="${ctx}/qxc/topage?pageName=sizx&pgameCode=39&gameCode=39" title="四{[{5a2X}]}现" data-ajax="false" style="background-color:transparent">四{[{5a2X}]}现</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_40 == 40}">
				<li><a href="${ctx}/qxc/topage?pageName=sm&pgameCode=40&gameCode=40" title="{[{5Y+M}]}面" data-ajax="false" style="background-color:transparent">{[{5Y+M}]}面</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_41 == 41}">
				<li><a href="${ctx}/qxc/topage?pageName=wlqdw&pgameCode=41&gameCode=41" title="五六七{[{5a6a}]}位" data-ajax="false" style="background-color:transparent">五六七{[{5a6a}]}位</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_44 == 44}">
				<li><a href="${ctx}/qxc/topage?pageName=lh&pgameCode=44&gameCode=44" title="{[{6b6Z6JmO}]}" data-ajax="false" style="background-color:transparent">{[{6b6Z6JmO}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_45 == 45}">
				<li><a href="${ctx}/qxc/topage?pageName=gg&pgameCode=45&gameCode=45" title="{[{6L+H5YWz}]}" data-ajax="false" style="background-color:transparent">{[{6L+H5YWz}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_46 == 46}">
				<li><a href="${ctx}/qxc/topage?pageName=kdu&pgameCode=46&gameCode=gc" title="{[{6Leo5bqm}]}" data-ajax="false" style="background-color:transparent">{[{6Leo5bqm}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_47 == 47}">
				<li><a href="${ctx}/qxc/topage?pageName=hs&pgameCode=47&gameCode=gc" title="{[{5ZKM5pWw}]}" data-ajax="false" style="background-color:transparent">{[{5ZKM5pWw}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_48 == 48}">
				<li><a href="${ctx}/qxc/topage?pageName=dxzy&pgameCode=48&gameCode=gc" title="多{[{6YCJ5Lit5LiA}]}" data-ajax="false" style="background-color:transparent">多{[{6YCJ5Lit5LiA}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_49 == 49}">
				<li><a href="${ctx}/qxc/topage?pageName=bz&pgameCode=49&gameCode=gc" title="不{[{5Lit}]}" data-ajax="false" style="background-color:transparent">不{[{5Lit}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_50 == 50}">
				<li><a href="${ctx}/qxc/topage?pageName=zxl&pgameCode=50&gameCode=gc" title="组{[{6YCJ}]}六" data-ajax="false" style="background-color:transparent">组{[{6YCJ}]}六</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_51 == 51}">
				<li><a href="${ctx}/qxc/topage?pageName=zfb&pgameCode=51&gameCode=51" title="中{[{5Y+R55m9}]}" data-ajax="false" style="background-color:transparent">中{[{5Y+R55m9}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_52 == 52}">
				<li><a href="${ctx}/qxc/topage?pageName=gc&pgameCode=52&gameCode=52" title="七{[{56CB}]}" data-ajax="false" style="background-color:transparent">七{[{56CB}]}</a></li>
			</c:if>
			<c:if test = "${empty qxcSysConfig || qxcSysConfig.gc_53 == 53}">
				<li><a href="${ctx}/qxc/topage?pageName=wx&pgameCode=53&gameCode=53" title="{[{5LqU}]}行" data-ajax="false" style="background-color:transparent">{[{5LqU}]}行</a></li>
			</c:if>
		</div>
    </div>
</div>
