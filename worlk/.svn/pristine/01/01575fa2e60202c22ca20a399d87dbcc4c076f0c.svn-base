$(function(){
	var balance = new Number($("#balance").val());
	//var pl = new Number($("#todayPl").val());
	$("span.user-balance").html(formNumber(balance,2));
	//$("span.user-todaypl").html(showColor(pl));
	
	$(".ui-icon-power").click(function(){
        if (confirm("您确定要退出系统吗？")) {
            //window.location.href = ctx + "/logout";
        	logout();
        }
	});
	
	$("#user-center").panel({
		open: function(event, ui) {
			refreshBalance();
		}
	});		
});
function refreshBalance(type) {
    var balanceCtx = $("span.user-balance");
    /**
    var todayPlCtx = $("span.user-todaypl");
    if(type == 1){
        todayPlCtx.html('<font color="green">加载中...</font>');   	
    }
    */
    if(type == 2){
        balanceCtx.html('<font color="green">加载中...</font>');
    }
    var request = $.ajax({
        url: ctx + '/hkc/getUserInfo',
        data: {
        	"rtype": 1,
            "t": new Date().getTime()
        },
        dataType: 'json'
    });
    request.done(function(json) {
        var result = json.r;
        if (result == 0) {
            var userType = json.data.tp; //类型
            var balc = json.data.ac;
            if (userType == 0) { //信用
                balanceCtx.html(formNumber(balc,2));
            } else { //现金
                balanceCtx.html(formNumber(balc,2));
            }
            //todayPlCtx.html(showColor(json.data.pl));
        } else {
            balanceCtx.html('<font color="red">(10):余额失败</font>');
        }
    });
    request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			balanceCtx.html('<font color="red">网络异常</font>');
		}else if(textStatus == 'parsererror'){
			var respText = jqXHR.responseText;
			if(respText.indexOf("session invalidate1") > -1){
				alert("用户会话失效或在其他终端登录被踢出，请您重新登录！");
				window.location.href = ctx + "/login";				
			}else{
				console.log(respText);
				balanceCtx.html('<font color="red">(11):余额失败</font>');
			}
		}	        
    });
    request.always(function() {
    	//$('div[data-role=listview]').listview("refresh");  
        //hideLoader();
    });
}