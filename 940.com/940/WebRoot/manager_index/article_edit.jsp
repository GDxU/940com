<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
	<script src="../tqeditor/TQEditor.js" type="text/javascript">
</script>
<%
	String dostr = "", title = "", type = "", preview = "", author = "940.com", id = "",keywords="",desc="", content = "", time = DateUtil
			.getDateTime(), joinTime = DateUtil.getDate();
	String doTitle;
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
		joinTime = article.getString("a_join_time");
		inCome = article.getInt("a_income");
		keywords=article.getString("a_keywords");
		desc=article.getString("a_desc");
		dostr = "edit";
		doTitle = "编辑文章"; 
				
	} else {
		dostr = "add";
		doTitle = "添加文章";
	}
	
	int isEditStatus = SYS.RequestInt(request, "edit_status", -1);
	
	System.out.println(time + "ddd" + joinTime);
%>
<body onload="changeSelected(<%=type%>,<%=isEditStatus%>)">

<div class='r_content'>
			<div class='title'>
				<i class='fl'>图文管理</i>
				<div class='fr log_search'>
					<!-- <a class="fl" href="manager_index.jsp?go=article_edit&do=add">
						添加文章
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" />
						<input class='but' type="submit" value="" />
					</div> -->
				</div>
			</div>
			<div class='center_cont edit'>
				<h3 class='edit_title'><%=doTitle %></h3>
				<div class='index_edit'>
				<form id="article_form" action="../articleEditSubmit"
				name="article_form" method="post">

			<input type="hidden" name="do" id="do" value="<%=dostr%>" /> <input
				type="hidden" name="id" id="id" value="<%=id%>" /> <input
				type="hidden" name="format" id="format" value="json" />
					<table>
						<tr>
							<td class="td1">标题：</td>
							<td colspan="5"><input type="text"  name="title" id="title" value="<%=title %>"></td>
						</tr>
						<tr>
							<td class="td1">预览图（140 x 105）：</td>
							<td colspan="5"><input type="text" name="preview" id="preview" value="<%=preview %>"></td>
						</tr>
						<tr>
							<td class="td1">meta关键字：</td>
							<td colspan="5"><input type="text" name="keywords" id="keywords" value="<%=keywords%>"></td>
						</tr>
							<tr>
							<td class="td1">meta描述：</td>
							<td colspan="5"><input type="text" name="desc" id="desc" value="<%=desc %>"></td>
						</tr>
						<tr>
							<td class="td1">分类：</td>
							<td width="50"><select id="type" name="type"
						onchange="changeSelected(this.value)">
						<%-- 	<option value="0" <%="0".equals(type) ? "selected" : ""%>>全部</option> --%>
							<option value="2" <%="2".equals(type) ? "selected" : ""%>>开店技巧</option>
							<option value="3" <%="3".equals(type) ? "selected" : ""%>>干货分享</option>
							<option value="4" <%="4".equals(type) ? "selected" : ""%>>常见问题</option>
							<option value="5" <%="5".equals(type) ? "selected" : ""%>>网店推广</option>
							<option value="6" <%="6".equals(type) ? "selected" : ""%>>成功案例</option>
							<option value="8" <%="8".equals(type) ? "selected" : ""%>>课程（临时）</option>
					</select> </td>
							<td class="td1">优先级：</td>
							<td width="270;"><input style="width:100px;padding-right:0;" type="number" name="priority" id="priority" value="<%=priority%>"><i>（数字越大优先级越高;0：今日推荐）</i></td>
							<td class="td1">状态：</td>
							<td><select name="status" id="status">
							<option value="1"
								<%if (status == 1)
				out.print("selected");%>>显示</option>
							<option value="0"
								<%if (status == 0)
				out.print("selected");%>>隐藏</option>
					</select>
							</td>
							
						</tr>
						<tr>
							<td class="td1"  >作者：</td>
							<td width="100"><input type="text" name="author" id="author" value="<%=author%>" ></td>
							<td class="td1">点击量：</td>
							<td width="100"><input style="width:120px;" type="text" name="click" id="click"	value="<%=click%>"> </td>
							<td class="td1">时间：</td>
							<td><input style="width:110px;" type="text" name="time" id="time" value="<%=time%>"><i>（格式：2016-01-01 00:00）</i></td>
						</tr>
						<tr id="income" style="display:none;">
							<td style="text-align: right;"  class="td1" width="120" value="<%=inCome%>" >月收入（元）：</td>
							<td><input type="text"  name="income" id="income" ></td>
							<td style="text-align: right;" width="120"  >入学时间：</td>
							<td colspan="3"><input style="width:120px;" type="text" name="join_time" id="join_time" value="<%=joinTime%>" ><i>（格式：2016-01-01 00:00）</td>
						</tr>
						<tr>
							<td class="td1">内容：</td>
							<td colspan="7"><textarea  name="a_content" id="a_content" style="width:100%;height:500px;"><%=content%></textarea></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td colspan="5"><input type="submit" class="button" value="确定提交 "></td>
						</tr>
					</table>
					</form>
					<script type="text/javascript">
						new TQEditor('a_content');
						var income = document.getElementById('income');
						function changeSelected(value,editStatus) {
							
							if(value==6){
								 income.style.display='';
							}else{
								 income.style.display='none';
							}
							if(editStatus==1){
								alert("操作成功!");	
							}else if(editStatus==0){
								alert("操作失败!");	
							}
						}
					</script>
				</div>
			</div>
			
		</div>
		</body>
		<%
	if (article != null) {
		article.close();
	}
%>