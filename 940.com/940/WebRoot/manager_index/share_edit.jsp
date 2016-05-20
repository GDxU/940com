<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ShareDao"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.bean.Share"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%
	String dostr = "", profileUrl = "", title = "", userName = "", content = "", realName = "", time =DateUtil.getDateTime(),period="";
	int gender = 0;

	Share share = null;
	int id = SYS.RequestInt(request, "id", 0);
	dostr = SYS.RequestString(request, "do");
	if (dostr.equals("edit")) {
		int idInt = SYS.RequestInt(request, "id", 0);
		ShareDao shareDao = new ShareDao();
		share = shareDao.getShareById(idInt);
		if (share != null) {
			profileUrl = share.getProfileUrl();
			gender = share.getGender();
			content = share.getContent();
			id = share.getId();
			share.getPriority();
			realName = share.getRealName();
			share.getStatus();
			time = share.getTime();
			period = share.getPeriod();
			userName = share.getUserName();
			title = share.getTitle();
		}
	} else {
		dostr = "add";
	}
	int isEditStatus = SYS.RequestInt(request, "edit_status", -1);
%>
<body onload="alertStatus(<%=isEditStatus%>)">
	<script type="text/javascript">
		function alertStatus(editStatus) {
			if(editStatus==1){
				alert("操作成功!");	
			}else if(editStatus==0){
				alert("操作失败!");	
			}
		}
	</script>
<div class='r_content'>
			<div class='title'>
				<i class='fl'>学员分享</i>
				<div class='fr log_search'>
					<!-- <a class="fl" href="">
						添加文章
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" />
						<input class='but' type="submit" value="" />
					</div> -->
				</div>
			</div>
			<div class='center_cont edit'>
				<h3 class='edit_title'>发布文章</h3>
				<div class='index_edit'>
				<form id="share_form" action="../shareSubmit" name="share_form"		method="post">
					<input type="hidden" name="from" id="from" value="manager" />
					<input type="hidden" name="do" id="do" value="<%=dostr%>" /> 
					<input type="hidden" name="id" id="id" value="<%=id%>" /> 
					<input type="hidden" name="format" id="format" value="json" />
					<table>
						
						<tr>
							<td class="td1">帐号：</td>
							<td width="100"><input style="width:200px;" type="text" name="user_name" id="user_name" value="<%=userName%>"></td>
							<td class="td1">姓名：</td>
							<td width="200"><input type="text" name="real_name" id="real_name" value="<%=realName%>"></td>
							<td style="width:165px" class="td1">第几期学员：</td>
							<td><input style="width:120px;padding-right:0;" type="number" name="period" id="period"	value="<%=period%>"></td>
						</tr>
						<tr>
							<td class="td1">学员头像：</td>
							<td colspan="5"><input style="width:700px" name="preview" id="preview"	value="<%=profileUrl%>" type="text"><i>（比例：84x84）</i></td>
							
						</tr>
						<tr>
							<td class="td1">内容：</td>
							<td colspan="5"><textarea style="width:100%;height:300px;" name="a_content" id="a_content" ><%=content %></textarea></td>
						</tr>
						<tr>
							<td class="td1">时间：</td>
							<td  colspan="5"><input style="width:120px;" type="text" name="time" id="time" value="<%=time %>"><i>（格式：2016-01-01 00:00）</i></td>

						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" style="margin-top:30px;" class="button" value="确定提交 "></td>
						</tr>

					</table>
				</div>
			</div>
		</div>
</body>
