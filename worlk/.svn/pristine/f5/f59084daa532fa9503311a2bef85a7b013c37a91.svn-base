<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri= "/WEB-INF/tld/const.tld" prefix="ct" %>
<%@taglib uri="/WEB-INF/tld/dict.tld" prefix="dict" %>
<c:set var="serverScheme" value='${pageContext.request.scheme}' scope="request" />
<c:set var="serverName" value='${pageContext.request.serverName}' scope="request" />
<c:set var="serverPort" value='${pageContext.request.serverPort}' scope="request" />
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<c:set var="servletPath" value="${pageContext.request.servletPath}" scope="request"/>
<c:set var="SLD_st" value='${fn:substring(serverName, fn:indexOf(serverName, ".") + 1, fn:length(serverName))}' scope="request" />
<ct:const className="com.vinbet.mobile.util.Constants" scope="request"></ct:const>
<c:choose>
	<c:when test="${static_dynamic_enabled == true}">
		<c:set var="staticFileUrl" value="${static_url}" scope="request"/>
		<%--<c:set var="staticFileUrl" value='http://static.${fn:substring( serverName, fn:indexOf(serverName,".")+1, fn:length(serverName))}/img/mobile' scope="request" />--%>
	</c:when>
	<c:otherwise>
		<c:set var="staticFileUrl" value="${ctx}" scope="request"/>
	</c:otherwise>
</c:choose>
<link rel="stylesheet" href="${staticFileUrl}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
<link rel="stylesheet" href="${staticFileUrl}/css/common.css?v=${rsvn}">
<link rel="stylesheet" href="${staticFileUrl}/css/default.css?v=${rsvn}">
<script src="${staticFileUrl}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/base64.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/plugin/jquery.base64.js?v=${rsvn}"></script>
<script src="${staticFileUrl}/js/common.js?v=${rsvn}"></script>
<link rel="shortcut icon" href="${staticFileUrl}/images/vinbet.ico"></link>
<script type="text/javascript">var ctx = "${ctx}",serverType='${server_type}';</script>
<!-- Google Analytics -->
<script>
setTimeout(function () {
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
	if(serverType==1){
		ga('create', 'UA-55489373-3', 'auto');
	}else{
		ga('create', 'UA-55489373-1', 'auto');
	}
	ga('send', 'pageview');
}, 100);


setInterval(function(){
	setTimeout(sso_get(),200);
},600000);

function sso_get(){
	var sso_url = "${serverScheme}://${serverName}:${sso_port}/${sso_secondary_domain}";
	var url = sso_url + "/login?service=" + "${serverScheme}://${serverName}:${serverPort}${ctx}" + "/index&serviceid=${SERVICE_ID}";
	$.ajax({
	    url: url,
	    data: "get-lt=true",
	    async: false,
	    type: "get",
	    dataType: "jsonp",
	    jsonpCallback: "callback",
	    success: function(data, status) {
	    	console.log(data);
	    }
	});
}	
</script>
<!-- End Google Analytics -->