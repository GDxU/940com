<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%
	String dostr = "", title = "", type = "", preview = "", author = "940.com", id = "", content = "", time = DateUtil
			.getDateTime(), joinTime = DateUtil.getDate();

	System.out.println(time + "ddd" + joinTime);
	int click = 0;
	int priority = -1;
	int inCome = -1;
	int status = 1;
	CachedRowSetImpl article = null;
	String doWhat = SYS.RequestString(request, "do");
	if (doWhat.equals("edit")) {
		int idInt = SYS.RequestInt(request, "id", 0);
		ToolArticleDao articleDao = new ToolArticleDao();
		article = articleDao.getArticleRowSet(idInt);
	}

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
		priority = article.getInt("a_priority");
		status = article.getInt("a_status");
		joinTime = article.getString("a_time");
		inCome = article.getInt("a_income");
		dostr = "edit";
	} else {
		dostr = "add";
	}
%>


<script src="../tqeditor/TQEditor.js" type="text/javascript">
</script>

<script type="text/javascript">
	function changeSelected(value) {
		if(value==6){
			 document.all("income_tr").style.display='';
			 document.all("join_time_tr").style.display='';
		}else{
			 document.all("income_tr").style.display='none';
			 document.all("join_time_tr").style.display='none';
		}
	}
</script>


<body onload="changeSelected(<%=type%>)">
	<div class="form_table_wrap">
		<form id="article_form" action="../articleEditSubmit"
			name="article_form" method="post">
			<input type="hidden" name="from" id="from" value="class_i" />
			<input type="hidden" name="do" id="do" value="<%=dostr%>" /> <input
				type="hidden" name="id" id="id" value="<%=id%>" /> <input
				type="hidden" name="format" id="format" value="json" />
			<table class="form_table" cellspacing="1">
				<tr>
					<td class="td_item">分类：</td>
					<td><select id="type" name="type"
						onchange="changeSelected(this.value)">
							<option value="8" <%="8".equals(type) ? "selected" : ""%>>课程（临时）</option>
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
					<td class="td_item">优先级（数字越大优前级越高）：</td>
					<td><input type="text" name="priority" id="priority"
						value="<%=priority%>" style="width:300px;" /></td>
				</tr>


				<tr id="income_tr" name="oncome_tr">
					<td class="td_item">月收入（元）：</td>
					<td><input type="text" name="income" id="income"
						value="<%=inCome%>" style="width:300px;" /></td>
				</tr>

				<tr id="join_time_tr" name="join_time_tr">
					<td class="td_item">入学时间：</td>
					<td><input type="text" name="join_time" id="join_time"
						value="<%=joinTime%>" style="width:300px;" /></td>
				</tr>

				<tr>
					<td class="td_item">内容：</td>
					<td><textarea name="content" id="content"
							style="width:1000px;height:600px;visibility:hidden;"><%=content%></textarea></td>
				</tr>
				<tr>
					<td class="td_item">状态：</td>
					<td><select name="status" id="status">
							<option value="1"
								<%if (status == 1)
				out.print("selected");%>>显示</option>
							<option value="0"
								<%if (status == 0)
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
 %> <input type="submit" class="button" id="btnSave" value="添  加" /> <%
 	}
 %>
					</label></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	new TQEditor('content');//必须在表单域后
</script>

<%
	if (article != null) {
		article.close();
	}
%>