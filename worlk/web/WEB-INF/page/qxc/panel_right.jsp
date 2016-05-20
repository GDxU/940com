<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="handTypeChange" value="${obj.pgameCode != null || obj.kuai != null}" scope="request"/>
<input type="hidden" name="balance" id="balance" value="${sessionScope.QXC_USER_SESSION.balance}"></input>
<div data-role="panel" id="user-center"  data-position="right" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2   class="ui-tittle-icon-star">七{[{5pif}]}彩</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div data-role="listview" class="reset" data-mini="true">
			<%-- <c:if test="${handTypeChange}">
	            <li data-icon="false">
	             <a class="li_height" style="background-color:transparent">
	                <select id="c_market">
		                <c:if test="${fn:contains(sessionScope.QXC_USER_SESSION.handype,'1')}">
		                    <option value="1">A盘</option>
						</c:if>       
		                <c:if test="${fn:contains(sessionScope.QXC_USER_SESSION.handype,'2')}">				        
		                    <option value="2">B盘</option>
		                </c:if>
		                <c:if test="${fn:contains(sessionScope.QXC_USER_SESSION.handype,'3')}">                    
		                    <option value="3">C盘</option>
		                </c:if>
		                <c:if test="${fn:contains(sessionScope.QXC_USER_SESSION.handype,'4')}">                    
		                    <option value="4">D盘</option>
		                </c:if>
	                </select>
	                </a>
	            </li>
            </c:if> --%>
			<li style="background-color:transparent" class="li_height"><span class="ssc-accname icoc-all"></span>${sessionScope.QXC_USER_SESSION.accoutName}<span class="ui-btn ui-corner-all ui-icon-power ui-btn-icon-notext ui-btn-right" style="border: 1px solid rgba(0,0,0,0.3); margin-top: 7px; margin-right: 1.5px;" id="logout"></span></li>
			<li data-icon="refresh"><a href="javascript:refreshBalance(2);" class="li_height" style="background-color:transparent"><span class="ssc-balance icoc-all"></span>余额:&nbsp;<span class="user-balance">加载中...</span></a></li>
			<li><a href="${ctx}/qxc/betInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-betinfo icoc-all"></span>下{[{5rOo}]}明细</a></li>
			<li><a href="${ctx}/qxc/accountHistory" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-acchistory icoc-all"></span>{[{6LSm}]}户历史</a></li>
			<li><a href="${ctx}/qxc/gameResult" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-result icoc-all"></span>{[{5byA5aWW}]}结果</a></li>
			<li><a href="${ctx}/qxc/userInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-userinfo icoc-all"></span>会员资料</a></li>
			<li><a href="${ctx}/qxc/gameRules" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-gamerules icoc-all"></span>{[{6KeE5YiZ}]}说明</a></li>
			<li><a href="${ctx}/qxc/afficheInfo" data-ajax="false" class="li_height" style="background-color:transparent"><span class="ssc-affiche icoc-all"></span>公告栏</a></li>
		</div>
    </div>
</div>
<script type="text/javascript">
	var ss = window.sessionStorage;
</script> 
<c:if test="${handTypeChange}">
	<script type="text/javascript">
	$(function() {
	    $("#c_market").on("change", function() {
	    	var pkVal = $(this).val();
	    	var pkText = $(this).find("option:selected").text();
	        ss.removeItem("pk"); ss.removeItem("pkText");
	        ss.setItem("pk", pkVal); ss.setItem("pkText", pkText);
	        $("#hcType").val(pkVal);
	        $("#nowHandType").html(pkText);
	        try {
	            changeHandType();
	        } catch(e) {}
	    });
	    
		if (ss.getItem("pk") == 'undefined') {
			var pkVal = $("#c_market").val();
			var pkText = $("#c_market").find("option:selected").text();
			ss.removeItem("pk"); ss.removeItem("pkText");
		    ss.setItem("pk", pkVal); ss.setItem("pkText", pkText);
		    $("#hcType").val(pkVal);
		    $("#nowHandType").html(pkText);
		} else {
			try {
				var pkVal = ss.getItem("pk");
				var pkText = ss.getItem("pkText");
			    $("#c_market").val(pkVal); $("#c_market").selectmenu("refresh");
			    $("#hcType").val(pkVal);
			    $("#nowHandType").html(pkText);
		     }catch(e) {}
		}   
	});
	</script>
</c:if>