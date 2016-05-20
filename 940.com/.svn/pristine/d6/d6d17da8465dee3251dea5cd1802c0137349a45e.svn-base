<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%
	String dostr = "", title = "", type = "", preview = "", author = "940.com", id = "", content = "", time = DateUtil
			.getDateTime();
	int status = 1;
	int priority = -1;
	int isIndexType=0;
	CachedRowSetImpl article = null;
	String doWhat = SYS.RequestString(request, "do");

	if (doWhat.equals("edit")) {
		int idInt = SYS.RequestInt(request, "id", 0);
		VideoDao articleDao = new VideoDao();
		article = articleDao.getVideoRowSet(idInt);
	}

	if (article != null) {
		article.next();
		type = article.getString("type");
		title = article.getString("title");
		//String content=LAB.clobToString(article.getClob("a_content"));
		content = article.getString("video_id");
		time = LAB.StringToDateToString(article.getString("time"),
				"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
		author = LAB.replaceNull(article.getString("author"));
		preview = article.getString("preview");
		id = article.getString("id");
		priority = article.getInt("a_priority");
		status = article.getInt("status");
		isIndexType = article.getInt("is_index");
		dostr = "edit";
	} else {
		dostr = "add";
	}
	String indexCheckedStr = "";
	if(isIndexType==1)
		indexCheckedStr = "checked";
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
			<i class='fl'>视频管理</i>
			<div class='fr log_search'>
				<!-- <a class="fl" href="manager_index.jsp?go=video_edit&do=add">
					添加视频 </a> -->
				<!-- <div class='fr wrapSearch'>
					<input class='text' type="text" /> <input class='but'
						type="submit" value="" />
				</div> -->
			</div>
		</div>
		<div class='center_cont edit'>
			<h3 class='edit_title'>发布文章</h3>
			<div class='index_edit'>
				<form id="article_form" action="../videoEditSubmit"
					name="article_form" method="post">
					<input type="hidden" name="do" id="do" value="<%=dostr%>" /> <input
						type="hidden" name="id" id="id" value="<%=id%>" /> <input
						type="hidden" name="format" id="format" value="json" />
					<table>

						<tr>
							<td class="td1">分类：</td>
							<td width="50"><select id="type" name="type"
								onchange="changeSelected(this.value)">
									<option value="1" <%="1".equals(type) ? "selected" : ""%>>会员</option>
									<option value="2" <%="2".equals(type) ? "selected" : ""%>>免费</option>
									<option value="3" <%="3".equals(type) ? "selected" : ""%>>热门</option>
									<option value="4" <%="4".equals(type) ? "selected" : ""%>>最新</option>
							</select></td>
							<td class="td1">标题：</td>
							<td><input type="text" id="title" name="title"
								value="<%=title%>"></td>
						</tr>
						<tr>
							<td class="td1">视频id：</td>
							<td width="200"><input type="text" id="a_content"
								name="a_content" value="<%=content%>"></td>
							<td class="td1">预览图：</td>
							<td><input type="text" id="preview" name="preview"
								value="<%=preview%>"></td>


						</tr>
						<tr>
							<td class="td1">状态：</td>
							<td><select name="status" id="status">
									<option value="1" <%if (status == 1)
				out.print("selected");%>>显示</option>
									<option value="0" <%if (status == 0)
				out.print("selected");%>>隐藏</option>
							</select></td>
							<td class="td1">是否首页：</td>
							<td width="290"><input  style="width:100px;padding-right:0;" id="isIndexType" value="1" name="isIndexType" type="checkbox" <%=indexCheckedStr %> /><i></i></td>
						</tr>
						<tr>
							<td class="td1">作者：</td>
							<td><input type="text" id="author" name="author"
								value="<%=author%>"></td>
							<td class="td1">时间：</td>
							<td><input style="width:150px;" type="text" id="time"
								name="time" value="<%=time%>"><i>（格式：2016-01-01
									00:00）</i></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td colspan="5"><input type="submit"
								style="margin-top:30px;" class="button" value="确定提交 "></td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</body>