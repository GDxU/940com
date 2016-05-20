<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.NoticeDao"%>
<%@page import="com.chuangdun.jsl.bean.Notice"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%
	String dostr = "", title = "", author = "940.com", content = "", time = DateUtil
			.getDateTime();
	Notice notice = null;
	int id=0;
	String searchStr = SYS.RequestString(request, "search");
	String doWhat = SYS.RequestString(request, "do");
	if (doWhat.equals("edit")) {
		 id = SYS.RequestInt(request, "id", 0);
		NoticeDao noticeDao = new NoticeDao();
		notice = noticeDao.getNoticeById(id);
	}

	if (notice != null) {
		title = notice.getTitle();
		content = notice.getContent();
		//time = LAB.StringToDateToString(notice.getString("A_TIME"),
		//		"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
		time = notice.getTime();
		author = LAB.replaceNull(notice.getAuthor());
		id = notice.getId();
		dostr = "edit";
	} else {
		dostr = "add";
	}
	int isEditStatus = SYS.RequestInt(request, "edit_status", -1);
%>

<script type="text/javascript">
	function search(){
		var searchStr = document.getElementById('search').value;
		
		var url;
		if(searchStr!=null){
			 url = "manager_index.jsp?go=notice_manager_list&search="+searchStr+"&page=1";
		}else{
			 url = "manager_index.jsp?go=notice_manager_list&search=<%=searchStr%>" +"&page=1";
		}
		window.location.href = url;
	}
</script>
<script src="../tqeditor/TQEditor.js" type="text/javascript">
</script>



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
				<i class='fl'>公告管理</i>
				<div class='fr log_search'>
					<!-- <a class="fl" href="">
						添加公告
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" id="search" name="search"  />
						<input class='but' type="submit" value="" onclick="search()" />
					</div> -->
				</div>
			</div>
			<div class='center_cont edit'>
				<h3 class='edit_title'>发布文章</h3>
				<div class='index_edit'>
				<form id="notice_form" action="../noticeEditSubmit"	name="notice_form" method="post">
					<input type="hidden" name="do" id="do" value="<%=dostr%>" /> 
					<input type="hidden" name="id" id="id" value="<%=id%>" />
				    <input	type="hidden" name="format" id="format" value="json" />
					<table>
						
						<tr>
							<td class="td1">标题：</td>
							<td colspan="3"><input type="text" type="text" name="title" id="title"	value="<%=title%>"></td>
						</tr>
						<tr>
							<td class="td1">内容：</td>
							<td colspan="3"><textarea id="a_content" name="a_content" style="width:100%;height:300px;"><%=content%></textarea></td>
						</tr>
						<tr>
							<td class="td1">作者：</td>
							<td><input type="text"  name="author" id="author"	value="<%=author%>" ></td>
							<td class="td1">时间：</td>
							<td><input style="width:150px;" name="time" id="time" value="<%=time%>" type="text"><i>（格式：2016-01-01 00:00）</i></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><input type="submit" style="margin-top:30px;" class="button" value="确定提交 "></td>
						</tr>

					</table>
					</form>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
	new TQEditor('a_content');//必须在表单域后
</script>

			