<%@page import="com.vinbet.mobile.sys.AppCache"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>

<!DOCTYPE html>
<html>
  <head>
	<script src="${ctx}/js/jquery-1.9.1.min.js?v=${rsvn}"></script>
	<script src="${ctx}/js/jquery.mobile-1.4.3.min.js?v=${rsvn}"></script>
	<script src="${ctx}/js/plugin/wow.min.js"></script>
	<link rel="stylesheet" href="${ctx}/css/jquery.mobile-1.4.3.min.css?v=${rsvn}">
	<link rel="shortcut icon" href="${ctx}/images/vinbet.ico"></link>
	<style type="text/css">
	.wordwrap{
		word-wrap: break-word;
		font-size: 8px;
	}
	</style>
  </head>
  <body>
	<div data-role="page">
		<div data-role="header">
		<a href="${ctx}/sys/main" data-icon="arrow-l" data-iconpos="notext" data-ajax="false" class="ui-btn-left ui-btn ui-icon-home ui-btn-icon-notext ui-shadow ui-corner-all"></a>
			<h1>内存数据查看</h1>
		</div>
		<div role="main" class="ui-content">
			<div data-role="collapsibleset" data-theme="b" data-content-theme="a">
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>系统参数 [systemParmMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getSystemParmMap())%></p>
				</div>		
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>数据字典 [dictMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getDictMap())%></p>
				</div>		
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>国际化数据 [internationMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getInternationMap())%></p>
				</div>		
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>币种数据 [currencyMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getCurrencyMap())%></p>
				</div>			
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>钱包类别 [walletCategoryMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getWalletCategoryMap())%></p>
				</div>
				<div data-role="collapsible" data-theme="a" data-iconpos="right" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
					<h4>导航菜单 [navigationAppList]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getNavigationAppList())%></p>
				</div>	
				<div data-role="collapsible" data-theme="a" data-iconpos="right"  data-expanded-icon="carat-u" data-collapsed-icon="carat-d" data-collapsed="true">
					<h4>本地银行 [localBankMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getLocalBankMap())%></p>
				</div>	
				<div data-role="collapsible" data-theme="a" data-iconpos="right"  data-expanded-icon="carat-u" data-collapsed-icon="carat-d" data-collapsed="true">
					<h4>第三方支付平台 [paymentPlatMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getPaymentPlatMap())%></p>
				</div>	
				<div data-role="collapsible" data-theme="a" data-iconpos="right"  data-expanded-icon="carat-u" data-collapsed-icon="carat-d" data-collapsed="true">
					<h4>第三方支付平台账号 [paymentPlatformAccMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.paymentPlatformAccMap)%></p>
				</div>
				<div data-role="collapsible" data-theme="a" data-iconpos="right"  data-expanded-icon="carat-u" data-collapsed-icon="carat-d" data-collapsed="true">
					<h4>支付宝机构信息 [aliPayMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getAliPayMap())%></p>
				</div>
				<div data-role="collapsible" data-theme="a" data-iconpos="right"  data-expanded-icon="carat-u" data-collapsed-icon="carat-d" data-collapsed="true">
					<h4>微信账号信息 [wechatAccMap]</h4>
					<p class="wordwrap"><%=JSON.toJSONString(AppCache.getWechatAccMap())%></p>
				</div>														
			</div>												
		</div>
	</div>
  </body>
</html>
