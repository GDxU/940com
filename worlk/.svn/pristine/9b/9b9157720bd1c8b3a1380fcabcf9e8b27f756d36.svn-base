<!--------------------------------{[{5rOo}]}{[{5Y2V}]}组{[{5ZCI}]}明细---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/hkc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/hkc.css?v=${rsvn}">
<style>
.content_detail {
	font-family: "Tahoma";
	font-size: 12px;
}
</style>

</head>
<body>
<div data-role="page" id="accHisDayDetailPage" data-title="{[{5rOo}]}{[{5Y2V}]}组{[{5ZCI}]}明细">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/hkc/hkmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>组{[{5ZCI}]}{[{5rOo}]}{[{5Y2V}]}明细</h1>
		 </div>		
		</div>
    <%@ include file="/WEB-INF/page/hkc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
  		<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
		<h3>{[{5rOo}]}{[{5Y2V}]}信息</h3>
	  <div>
	  <div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-mini="true" data-iconpos="right"><h5>球{[{5Y+3}]}</h5><span class="content_detail">${obj.ball}</span></div>
	  <div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-mini="true" data-iconpos="right"><h5>{[{6LWU546H}]}</h5><span class="content_detail">${obj.rate}</span></div>
	  <div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-mini="true" data-iconpos="right"><h5>{[{5Y2V}]}{[{5rOo}]}</h5><span class="content_detail">${obj.perAmt}</span></div>
	  <div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-mini="true" data-iconpos="right"><h5>组{[{5ZCI}]}数</h5><span class="content_detail">${obj.count}</span></div>
	  <div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-mini="true" data-iconpos="right"><h5>总{[{6YeR}]}额</h5><span class="content_detail">${obj.totalAmt}</span></div>
	 </div>
	 </div>
	<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
	<h3>组{[{5ZCI}]}明细</h3>	 
	 <table data-role="table" id="orderGroupTable" data-mode="reflow" class="movie-list ui-responsive" style="font-size: 14px">
		<c:choose>
		    <c:when test="${obj.subs == null}">
		     <h5 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无符合条件的记录</h5>
		    </c:when>
		    <c:otherwise>
			<thead>
				<tr>
					<th>类型</th>
					<th>内容</th>
					<th>{[{6LWU546H}]}</th>
					<th>{[{6YeR}]}额</th>
					<th>{[{5L2j}]}{[{6YeR}]}</th>
					<th>${obj.tw}</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach var="t" items="${obj.subs}" varStatus="myIndex">
				<tr>
					<td>${t.pn}</td>
					<td><a style="text-decoration:none;" class="overflowHidden" href="javascript:openOrderCtxPopup('${t.ball}','${myIndex.index}')"  id="ctx${myIndex.index}">${t.ball}</a></td>
					<td>${t.rate}</td>
					<td>${t.amt}</td>
					<td>${t.com}</td>
					<c:choose>
					    <c:when test="${t.win < 0}">
					       <td style="color:#FF0000">${t.win}</td>
					    </c:when>
					    <c:otherwise>
					       <td>${t.win}</td>
					    </c:otherwise>
					</c:choose>				
				</tr>	
			  </c:forEach>
			</tbody>		    
		    </c:otherwise>
		</c:choose>				

	 </table>  
	 <div data-role="popup" id="orderCtxPopup" class="ui-content" data-theme="a" data-history="false" data-corners="true" data-arrow="true"></div>
	 </div>
	 
  </div>
</div> 
</body>
<script type="text/javascript">
function openOrderCtxPopup(ctx, orderId){
	var options = {"positionTo":"#ctx" + orderId};
	$("#orderCtxPopup").html("<p>" + ctx + "</p>").popup( "open", options);
};
function formatString(sour, length){
	if (length > 0 && sour != undefined && sour.length > length && sour.length > 3) {
		sour = sour.substring(0, length - 3) + "...";
	}
	return sour;
};
$(function(){
});
</script>
<script type="text/javascript">
	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>

</html>