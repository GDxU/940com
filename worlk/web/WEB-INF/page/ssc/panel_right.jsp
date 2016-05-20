<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" name="balance" id="balance" value="${sessionScope.SSC_USER_SESSION.balance}"></input>
<input type="hidden" name="todayPl" id="todayPl" value="${sessionScope.SSC_USER_SESSION.todayPL}"></input>
<div data-role="panel" id="user-center"  data-position="right" data-theme="a">
	<div data-role="header" data-theme="b" class="ui-them-defut"> 
		<h2 class="ui-icon-time-qu icon-black">${msg['title.ssc']}</h2>
	</div>
	 <div data-role="content">
		<div data-role="listview" class="reset" data-theme="d" data-mini="true">
			<li style="background-color:transparent" class="li_height"><span class="ssc-accname icoc-all"></span>${sessionScope.SSC_USER_SESSION.accoutName} [${sessionScope.SSC_USER_SESSION.handype}]<span class="ui-btn ui-corner-all ui-icon-power ui-btn-icon-notext ui-btn-right" style="border: 1px solid rgba(0,0,0,0.3); margin-top: 7px; margin-right: 1.5px;" id="logout"></span></li>
			<li data-icon="refresh"><a href="javascript:refreshBalance(1);" class="li_height" style="background-color:transparent"><span class="ssc-wl icoc-all"></span>${msg['menu.ssc.todayWinLoss']}:&nbsp;<span class="user-todaypl">加载中...</span></a></li>
			<li data-icon="refresh"><a href="javascript:refreshBalance(2);" class="li_height" style="background-color:transparent"><span class="ssc-balance icoc-all"></span>${msg['menu.ssc.balance']}:&nbsp;<span class="user-balance">加载中...</span></a></li>
			<li><a href="${ctx}/ssc/betInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-betinfo icoc-all"></span>${msg['menu.ssc.betStatus']}</a></li>
			<li><a href="${ctx}/ssc/accountHistory" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-acchistory icoc-all"></span>${msg['menu.ssc.history']}</a></li>
			<li><a href="${ctx}/ssc/gameResultLatest" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-result icoc-all"></span>${msg['menu.ssc.result']}</a></li>
			<li><a href="${ctx}/ssc/userInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-userinfo icoc-all"></span>${msg['menu.ssc.personalInfo']}</a></li>
			<li><a href="${ctx}/ssc/gameRules" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-gamerules icoc-all"></span>${msg['menu.ssc.rules']}</a></li>
			<li><a href="${ctx}/ssc/afficheInfo" data-ajax="false"  class="li_height" style="background-color:transparent"><span class="ssc-affiche icoc-all"></span>${msg['menu.ssc.announcement']}</a></li>
			<!--<li><a href="${ctx}/logout" data-ajax="false" class="li_height" style="background-color:transparent"><span class="ssc-logout icoc-all"></span>退出</a></li> -->
		</div>
    </div>
</div> 
