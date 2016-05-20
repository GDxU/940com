<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri= "/WEB-INF/tld/const.tld" prefix="ct" %>
<ct:const className="com.vinbet.mobile.util.Constants" scope="request" var="rsvn"></ct:const>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<script src="${ctx}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
<script src="${ctx}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${ctx}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
<link rel="shortcut icon" href="${ctx}/images/vinbet.ico"></link>
</head>
<body>
<div data-role="page">
	<div data-role="header" data-theme="b">
		<a href="${ctx}/sys/main" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		<h2>手机端静态资源URL设置</h2>
	</div>
	<div data-role="content" data-theme="a">
		<ul data-role="listview" >
		<li class="ui-field-contain">
		    <fieldset data-role="controlgroup" data-type="horizontal">
		        <legend><strong>静态文件位置:</strong></legend>
		        <input name="source" id="source1" value="1" <c:if test="${true == obj.source}">checked="checked"</c:if> type="radio">
		        <label for="source1">CDN服务器</label>
		        <input name="source" id="source2" value="2" <c:if test="${false == obj.source}">checked="checked"</c:if> type="radio">
		        <label for="source2">本地服务器</label>
		    </fieldset>
		</li>		
        <li class="ui-field-contain">
        	<label for="url"><strong>CDN服务器地址：</strong></label>
        	<input type="text" name="url" id="url" value="${obj.url}" maxlength="50" required="required"/>
        </li>	
        <li class="ui-field-contain">
        	<intput type="button" class="ui-btn ui-shadow" id="modfiy">修改</button>
        </li>	
      	</ul>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("input[name='source']").change(function(){
		var source = $(this).val();
		if(source == 2){
			$('#url').addClass('ui-disabled');
		}else{
			$("#url").removeClass('ui-disabled');
		}
	});

	$("#modfiy").click(function(){
		var source = $("input[name='source']:checked").val();
		var url = $("#url").val();
		if(source == 1 && url == ''){
			alert("CDN服务器地址不能为空!");
			return;
		}
	    $.ajax({
	        url: '${ctx}/sys/setStaticUrl',
	        data: {"t" : new Date().getTime(), "source": source, "url": url},
	        dataType: 'json',
	        success: function(jsonResult) {
	        	alert("修改成功!");
	        },
	        error: function(jqXHR, textStatus, errorThrown) {
	        },
	        complete: function() {
	        }
	    });		
	});

});
</script>
</body>
</html>
