<%@ page language="java" pageEncoding="utf-8"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.dao.TeacherDao"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.bean.Teacher"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%
	String dostr = "", profileUrl="", title="", name="", introduction="",profileThumbUrl ="";
	Teacher teacher = null;
	int id = SYS.RequestInt(request, "id", 0);

	 dostr = SYS.RequestString(request, "do");
	 int priority=-1,level=0;
	if (dostr.equals("edit")) {
		int idInt = SYS.RequestInt(request, "id", 0);
		TeacherDao teacherDao = new TeacherDao();
		teacher = teacherDao.getTeacherById(idInt);
		System.out.println(teacher);
		if (teacher != null) {
			profileUrl = teacher.getProfileUrl();
			title = teacher.getTitle();
			name = teacher.getName();
			introduction = teacher.getIntroduction();
			profileThumbUrl = teacher.getProfileThumbUrl();
			priority = teacher.getPriority();
			level = teacher.getLevel();
		}
	} else {
		dostr = "add";
	}
%>


	
</script>

<div class='r_content'>
			<div class='title'>
				<i class='fl'>讲师管理</i>
				<!-- <div class='fr log_search'>
					<a class="fl" href="manager_index.jsp?go=teacher_edit&do=add">
						添加文章
					</a>
					<div class='fr wrapSearch'>
						<input class='text' type="text" />
						<input class='but' type="submit" value="" />
					</div>
				</div> -->
			</div>
			<div class='center_cont edit'>
				<h3 class='edit_title'>发布文章</h3>
				<div class='index_edit'>
				<form id="teacher_form" action="../teacherEditSubmit"
					name="teacher_form" method="post">
				<input type="hidden" name="do" id="do" value="<%=dostr%>" />
				<input type="hidden" name="id" id="id" value="<%=id%>" /> 
				<input type="hidden" name="format" id="format" value="json" />
					<table>
						<tr>
							<td class="td1">首页头像：</td>
							<td><input style="width:250px;" name="preview" id="preview"	value="<%=profileUrl%>"type="text"><i>（比例：227x290）</i></td>
							<td class="td1">分页头像：</td>
							<td><input style="width:250px;" type="text" name="preview_thumb" id="preview_thumb"	value="<%=profileThumbUrl%>"><i>（比例：180x180）</i></td>
						</tr>
						<tr>
							<td class="td1">讲师姓名：</td>
							<td><input style="width:250px;" type="text"  name="name" id="name"	value="<%=name%>"></td>
							<td class="td1">头衔：</td>
							<td><input style="width:250px;" type="text" name="title" id="title"	value="<%=title%>" ></td>
						</tr>
						<tr>
							<td class="td1">简介：</td>
							<td colspan="3"><textarea style="width:96%;height:100px;" name="introduction" id="introduction"	><%=introduction%></textarea></td>
						</tr>
						<tr>
							<td class="td1">等级：</td>
							<td colspan="3"><input style="width:100px;padding-right:0;"name="level" id="level" value="<%=level %>"	 type="number" /><i>（0：普通讲师  1：金牌讲师）</i></td>
						<tr>
						
						<tr>
							<td class="td1">优先级：</td>
							<td colspan="3"><input style="width:100px;padding-right:0;" type="number" name="priority" id="priority"	value="<%=priority %>" /><i>（数字越大优先级越高）</i></td>
						<tr>
						</tr>
						
							<td>&nbsp;</td>
							<td><input type="submit" style="margin-top:30px;" class="button" value="确定提交 "></td>
						</tr>

					</table>
					</form>
				</div>
			</div>
		</div>
