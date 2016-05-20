<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940-课程简介</title>
	<link rel="stylesheet" type="text/css" href="/style/style.css">
	<link rel="stylesheet" type="text/css" href="/style/jianjie.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='jj_content'>
		<div id="wrapJianjie">
			<ul class='j_tab_ul'>
				<li>新手开店班</li>
				<li>淘宝美工班</li>
				<li>高级运营班</li>
				<li>电商总裁班</li>
			</ul>

			<div class='wrapTable' id="wrapTable">
				
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>

	
	<script type="text/javascript">
			$(function(){
				$('.j_tab_ul').on('click','li',function(){
					var _index = $(this).index();
					window.location.hash = _index;
					jianjieHash();
				});
				jianjieHash();
			})	

			function jianjieHash(){
				var _hash = window.location.hash.substring(1) || '0';
				$('.j_tab_ul li').eq(_hash).addClass('act').siblings().removeClass('act');
				$('#wrapTable').load(/jianjie/+_hash+'.jsp',function(){
					$('#wrapTable table tbody').find('tr:odd').addClass('bgColor');
					$(this).removeClass().addClass('wrapTable  jianjie'+_hash)
				})
			}
			
	</script>
</body>
</html>