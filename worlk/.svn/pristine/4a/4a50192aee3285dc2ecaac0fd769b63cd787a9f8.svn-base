<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="handTypeChange" value="${obj.sealTime != null || obj.nsealTime != null}" scope="request"/>
<input type="hidden" name="balance" id="balance" value="${sessionScope.HKC_USER_SESSION.balance}"></input>
<div data-role="panel" id="user-center"  data-position="right" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2 class="ui-tittle-icon-newhk">${msg['title.hkc']}</h2>
	</div>
	 <div data-role="content">
		<div data-role="listview" class="reset" data-theme="d" data-mini="true">
			<c:if test="${handTypeChange}">
	            <li data-icon="false">
	             <a class="li_height" style="background-color:transparent">
	                <select id="c_market">
		                <c:if test="${fn:contains(sessionScope.HKC_USER_SESSION.handype,'1')}">
		                    <option value="1">A盘</option>
						</c:if>       
		                <c:if test="${fn:contains(sessionScope.HKC_USER_SESSION.handype,'2')}">				        
		                    <option value="2">B盘</option>
		                </c:if>
		                <c:if test="${fn:contains(sessionScope.HKC_USER_SESSION.handype,'3')}">                    
		                    <option value="3">C盘</option>
		                </c:if>
		                <c:if test="${fn:contains(sessionScope.HKC_USER_SESSION.handype,'4')}">                    
		                    <option value="4">D盘</option>
		                </c:if>
	                </select>
	                </a>
	            </li>	
	        </c:if>	
			<li style="background-color:transparent" class="li_height"><span class="ssc-accname icoc-all"></span>${sessionScope.HKC_USER_SESSION.accoutName}<span class="ui-btn ui-corner-all ui-icon-power ui-btn-icon-notext ui-btn-right" style="border: 1px solid rgba(0,0,0,0.3); margin-top: 5px; margin-right: 1.5px;" id="logout"></span></li>
			<li data-icon="refresh"><a href="javascript:refreshBalance(2);" class="li_height" style="background-color:transparent"><span class="ssc-balance icoc-all"></span>余额:&nbsp;<span class="user-balance">加载{[{5Lit}]}...</span></a></li>
			<li><a href="${ctx}/hkc/betInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-betinfo icoc-all"></span>下{[{5rOo}]}明细</a></li>
			<li><a href="${ctx}/hkc/accountHistory" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-acchistory icoc-all"></span>{[{6LSm}]}户历史</a></li>
			<li><a href="${ctx}/hkc/gameResult" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-result icoc-all"></span>{[{5byA5aWW}]}结果</a></li>
			<li><a href="${ctx}/hkc/userInfo" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-userinfo icoc-all"></span>会员资料</a></li>
			<li><a href="${ctx}/hkc/gameRules" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-gamerules icoc-all"></span>{[{6KeE5YiZ}]}说明</a></li>
			<li><a href="${ctx}/hkc/afficheInfo" data-ajax="false" class="li_height" style="background-color:transparent"><span class="ssc-affiche icoc-all"></span>公告栏</a></li>
		</div>
    </div>
</div>
<c:if test="${handTypeChange}"> 
<script type="text/javascript">
	$(function() {
	    $("#c_market").on("change", function() {
	    	var htVal = $(this).val();
	    	//var htText = $(this).find("option:selected").text();
		    var request = $.ajax({
		        url: '${ctx}/hkc/changeHandType',
		        data: {
		        	pk: htVal,
		        	t: new Date().getTime()
		        },
		        dataType: 'json'
		    }); 
		    
			request.done(function(jsonResult) {
				var result = jsonResult.r;
				if(result == 0){
					try {
						changeHandType();
					} catch(e) {}
				}else{
					alert("盘口切换失败!");			
				}
			});	   
	
			request.fail(function(jqXHR, textStatus, errorThrown) {
				if(textStatus == 'error'){
					console.log("error:" + jqXHR.responseText);
				}else if(textStatus == 'parsererror'){
					if(jqXHR.responseText.indexOf("session invalidate") > -1){
						alert("${msg['msg.common.sessionExpired']}");
						window.location.href = "${ctx}/login";					
					}else{
						console.log("parsererror:" + jqXHR.responseText);
					}
				} 		
			});
	    });
	    
	    try {
			$("#c_market").val("${sessionScope.HKC_USER_SESSION.cht}");
			$("#c_market").selectmenu("refresh");//在部分页面会抛异常    
		} catch(e) {
			$("#c_market").val("${sessionScope.HKC_USER_SESSION.cht}");
		}
	});
</script>
</c:if>