<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
function showBallLong(){
 	$.mobile.changePage("#ballLongPage", {role: "dialog"});
	//showLoader();
	var ballLongTable = $("#ballLongTable");
	var tbody = $("#ballLongTable > tbody");
	var request = $.ajax({
	    url: '${ctx}/ssc/ballLong',
	    data: {
	    	"gameId": $("#gameId").val(),
	        "t": new Date().getTime()
	    },
	    dataType: 'json'
	});
	request.done(function(jsonResult) {
	    var result = jsonResult.r;
	    if (result == 0) {
	        tbody.empty();
	        var arr = jsonResult.list;
	        if (arr != undefined && arr.length > 0) {
	            $.each(arr,
	            function(key, value) {
	               tbody.append('<tr><td>' + replaceAllHtml(value.pn) + '</td><td><font color="red">' + value.num + '</font></td></tr>');
	            });
	        } else {
	            ballLongTable.html('<h5 class="content-info" style="text-align: center;">暂无数据</h5>');
	        }
	    } else {
	        ballLongTable.html('<h5 class="content-info" style="text-align: center;">系统异常,请联系管理员</h5>');
	    }
	});
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			ballLongTable.html('<h5 class="content-info" style="text-align: center;">网络中断,请检测网络</h5>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}
	});
	request.always(function() {
	    //hideLoader();
	});	
}
</script>
<div data-role="dialog" id="ballLongPage">
	<div data-role="header" data-theme="b">
		<h1>${msg['label.ssc.twosides']}${msg['label.ssc.longdragon']}排行</h1>
	</div>
	<div data-role="content" data-theme="a">
		<table data-role="table" id="ballLongTable" data-mode="reflow" class="movie-list ball-long-breakpoint" style="font-size: 13px">
			<thead>
			<tr>
				<th>项目</th>
				<th>次数</th>
			</tr>
			</thead>
			<tbody>
<!-- 			<tr><td>第三球双</td><td><font color="red">9 期</font></td></tr> -->
			</tbody>	
		</table>
	</div>
</div>	