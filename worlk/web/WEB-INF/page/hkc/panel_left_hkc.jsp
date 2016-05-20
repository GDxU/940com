<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<ct:const className="com.vinbet.mobile.sys.AppCache" scope="request"></ct:const>
<div data-role="panel" id="quick-links" data-position="left" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2  class="ui-tittle-icon-newhk">{[{5paw6aaZ5riv5b2p}]}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
	 <div data-role="collapsible-set">
	 <ul data-role="listview" class="reset" data-theme="a">
	 	<li><a href="${ctx}/index" data-ajax="false" style="background-color:transparent">首页</a></li>
	 </ul>
	 <div data-role="collapsible"  data-iconpos="right" class="reset list-bk" data-theme="d" >
	 	<h1>{[{54m556CB}]}</h1>
	 	<ul data-role="listview">
	 		<c:if test = "${empty hkcSysConfig || hkcSysConfig.tm == 0}">
			<li><a href="${ctx}/hkc/tm/" title="{[{54m556CB}]}" data-ajax="false" style="background-color:transparent">中</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.tmbz == 0}">
			<li><a href="${ctx}/hkc/tmbz/" title="{[{54m556CB}]}{[{5LiN5Lit}]}" data-ajax="false" style="background-color:transparent">{[{5LiN5Lit}]}</a></li>
			</c:if>
	 	</ul>
	</div>
	<div data-role="collapsible" data-iconpos="right" class="reset list-bk" data-theme="d">
	<h1>{[{5q2j56CB}]}</h1>
		<ul data-role="listview" >
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zm == 0}">
			<li><a href="${ctx}/hkc/zm/" title="{[{5q2j56CB}]}" data-ajax="false" style="background-color:transparent">中</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zmbz == 0}">
			<li><a href="${ctx}/hkc/zmbz/" title="{[{5q2j56CB}]}{[{5LiN5Lit}]}" data-ajax="false" style="background-color:transparent">{[{5LiN5Lit}]}</a></li>
			</c:if>
		</ul>
	</div>
	<div data-role="collapsible" data-iconpos="right" class="reset list-bk" data-theme="d">
	<h1>{[{5q2j56CB}]}{[{54m5}]}</h1>
		<ul data-role="listview" >
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zmt == 0}">
			<li><a href="${ctx}/hkc/ztm/" title="{[{5q2j56CB}]}{[{54m5}]}" data-ajax="false" style="background-color:transparent">中</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zmtbz == 0}">
			<li><a href="${ctx}/hkc/ztmbz/" title="{[{5q2j56CB}]}{[{54m5}]}{[{5LiN5Lit}]}" data-ajax="false" style="background-color:transparent">{[{5LiN5Lit}]}</a></li>
			</c:if>
		</ul>
	</div>
		<div id="rm_menu" data-role="listview" class="reset" data-theme="d" data-mini="true">
			
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.lm == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=lianma&pid=15" title="{[{6L+e}]}{[{56CB}]}" data-ajax="false" style="background-color:transparent">{[{6L+e}]}{[{56CB}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.gg == 0}">
			<li><a href="${ctx}/hkc/gg/" title="{[{6L+H5YWz}]}" data-ajax="false" style="background-color:transparent">{[{6L+H5YWz}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zx == 0}">
			<li><a href="${ctx}/hkc/zx/" title="{[{5q2j}]}{[{6IKW}]}" data-ajax="false" style="background-color:transparent">{[{5q2j}]}{[{6IKW}]}</a></li>
			</c:if>			
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.tx == 0}">
			<li><a href="${ctx}/hkc/tx/" title="{[{54m5}]}{[{6IKW}]}" data-ajax="false" style="background-color:transparent">{[{54m5}]}{[{6IKW}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.tmtw == 0}">
			<li><a href="${ctx}/hkc/tmtw/" title="{[{54m556CB}]}{[{5aS0}]}{[{5bC+}]}" data-ajax="false" style="background-color:transparent">{[{54m556CB}]}{[{5aS0}]}{[{5bC+}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.wxbb == 0}">
			<li><a href="${ctx}/hkc/wxbb/" title="五{[{6KGM}]}半{[{5rOi}]}" data-ajax="false" style="background-color:transparent">五{[{6KGM}]}半{[{5rOi}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zongxiao == 0}">
			<li><a href="${ctx}/hkc/zongxiao/" title="总{[{6IKW}]}" data-ajax="false" style="background-color:transparent">总{[{6IKW}]}</a></li>
			</c:if>	
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.qsb == 0}">
			<li><a href="${ctx}/hkc/qisebo/" title="七色{[{5rOi}]}" data-ajax="false" style="background-color:transparent">七色{[{5rOi}]}</a></li>
			</c:if>						
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.qm == 0}">
			<li><a href="${ctx}/hkc/qm/" title="七{[{56CB}]}" data-ajax="false" style="background-color:transparent">七{[{56CB}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.lx == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=sx&pid=16&type=lx" title="六{[{6IKW}]}" data-ajax="false" style="background-color:transparent">六{[{6IKW}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.yxws == 0}">
			<li><a href="${ctx}/hkc/yxws/" title="一{[{6IKW}]}{[{5bC+}]}数" data-ajax="false" style="background-color:transparent">一{[{6IKW}]}{[{5bC+}]}数</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.sxl == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=sx&pid=23&type=sxl" title="生{[{6IKW}]}{[{6L+e}]}" data-ajax="false" style="background-color:transparent">生{[{6IKW}]}{[{6L+e}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.wsl == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=ws&pid=24" title="{[{5bC+}]}数{[{6L+e}]}" data-ajax="false" style="background-color:transparent">{[{5bC+}]}数{[{6L+e}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.bz == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=zbz&pid=22&type=bz" title="{[{5LiN}]}{[{5Lit}]}" data-ajax="false" style="background-color:transparent">{[{5LiN}]}{[{5Lit}]}</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.dxzy == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=zbz&pid=30&type=dxzy" title="多选{[{5Lit}]}一" data-ajax="false" style="background-color:transparent">多选{[{5Lit}]}一</a></li>
			</c:if>
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.tzp == 0}">
			<li><a href="${ctx}/hkc/topage?pageName=zbz&pid=31&type=tzp" title="{[{54m5}]}平{[{5Lit}]}" data-ajax="false" style="background-color:transparent">{[{54m5}]}平{[{5Lit}]}</a></li>
			</c:if>	
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.lh == 0}">
			<li><a href="${ctx}/hkc/lh/" title="{[{6b6Z6JmO}]}" data-ajax="false" style="background-color:transparent">{[{6b6Z6JmO}]}</a></li>
			</c:if>	
			
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.zhsm == 0}">
			<li><a href="${ctx}/hkc/zhsm/" title="{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}" data-ajax="false" style="background-color:transparent">{[{5oC75ZKM}]}{[{5Y+M6Z2i}]}</a></li>
			</c:if>	
			
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.banbanbo == 0}">
			<li><a href="${ctx}/hkc/banbanbo/" title="{[{5Y2K5Y2K5rOi}]}" data-ajax="false" style="background-color:transparent">{[{5Y2K5Y2K5rOi}]}</a></li>
			</c:if>	
			
			<c:if test = "${empty hkcSysConfig || hkcSysConfig.sxsm == 0}">
			<li><a href="${ctx}/hkc/sxsm/" title="{[{55Sf6IKW5Y+M6Z2i}]}" data-ajax="false" style="background-color:transparent">{[{55Sf6IKW5Y+M6Z2i}]}</a></li>
			</c:if>	
			</div>
		</div>
    </div>
</div>
