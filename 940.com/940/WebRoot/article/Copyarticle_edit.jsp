<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>

<%
	CachedRowSetImpl article = (CachedRowSetImpl) request
			.getAttribute("rowset");
	String dostr= "", title= "", type= "", preview= "", author= "", id= "", content= "", time = "";
	int click =0;
	int status=1;
	if (article != null) {
		article.next();
		type = article.getString("a_type");
		title = article.getString("a_title");
		//String content=LAB.clobToString(article.getClob("a_content"));
		content = article.getString("a_content");
		 click = article.getInt("a_click");
		time = LAB.StringToDateToString(article.getString("A_TIME"),
				"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss");

		author = LAB.replaceNull(article.getString("a_author"));
		preview = article.getString("a_preview");
		id = article.getString("a_id");
		status = article.getInt("a_status");
		dostr = "edit";
	}else{
		dostr = "add";
	}
	
%>

<script src="../tqeditor/TQEditor.js" type="text/javascript"></script>
<div class="form_table_wrap">
	<form action="/940/articleEditSubmit" id="article_form"
		name="article_form" method="post" onsubmit="return ajaxSubmitForm()">
		<input type="hidden" name="do" id="do" value="<%=dostr%>" /> <input
			type="hidden" name="id" id="id" value="<%=id%>" /> <input
			type="hidden" name="format" id="format" value="json" />
		<table class="form_table" cellspacing="1">
			<tr>
				<td class="td_item">分类：</td>
				<td><select id="type" name="type">
						<option value="0" <%="0".equals(type) ? "selected" : ""%>>全部</option>
						<option value="1" <%="1".equals(type) ? "selected" : ""%>>开店流程</option>
						<option value="2" <%="2".equals(type) ? "selected" : ""%>>开店技巧</option>
						<option value="3" <%="3".equals(type) ? "selected" : ""%>>干货分享</option>
						<option value="4" <%="4".equals(type) ? "selected" : ""%>>常见问题</option>
						<option value="5" <%="5".equals(type) ? "selected" : ""%>>网店推广</option>
						<option value="6" <%="6".equals(type) ? "selected" : ""%>>成功案例</option>
						<option value="7" <%="7".equals(type) ? "selected" : ""%>>视频教程</option>
				</select></td>
			</tr>
			<tr>
				<td class="td_item">标题：</td>
				<td><input type="text" name="title" id="title"
					value="<%=title%>" style="width:300px;" /></td>
			</tr>
			<tr>
				<td class="td_item">预览图：</td>
				<td><input type="text" name="preview" id="preview"
					value="<%=preview%>" style="width:300px;" /></td>
			</tr>
			<tr>
				<td class="td_item">内容：</td>
				<td><textarea name="content" id="content"
						style="width:700px;height:200px;visibility:hidden;"><%=content%></textarea></td>
			</tr>
			<tr>
				<td class="td_item">状态：</td>
				<td><select name="status" id="status">
						<option value="1" <%if (status == 1)
				out.print("selected");%>>显示</option>
						<option value="0" <%if (status == 0)
				out.print("selected");%>>隐藏</option>
				</select></td>
			</tr>
			<tr>
				<td class="td_item">作者：</td>
				<td><input type="text" name="author" id="author"
					value="<%=author%>" /></td>
			</tr>
			<tr>
			<tr>
				<td class="td_item">点击量：</td>
				<td><input type="text" name="click" id="click"
					value="<%=click%>" class="w80" /></td>
			</tr>
			<tr>
				<td class="td_item">时间：</td>
				<td><input type="text" name="time" id="time" value="<%=time%>"
					style="width:115px;" /></td>
			</tr>
			<tr>
				<td></td>
				<td><label class="submit_wrap"> <%
 	if ("edit".equals(dostr)) {
 %> <input type="submit" class="button" id="btnSave" value="修  改 " /> <%
 	} else {
 %> <input type="submit" class="button" id="btnSave" value="添  加" />
						<%
							}
						%>
				</label></td>
			</tr>
			<%
	article.close();
%>
		</table>

	</form>
	<script type="text/javascript">
	new TQEditor('content');//必须在表单域后
</script>
	
</div>


