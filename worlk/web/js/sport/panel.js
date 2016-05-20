$(function(){
	var balance = new Number($("#balance").val());
	//var pl = new Number($("#todayPl").val());
	$("span.user-balance").html(formNumber(balance,2));
	//$("span.user-todaypl").html(showColor(pl));
	
	$(".ui-icon-power").click(function(){
		if(confirm(mobile.msg.ifLogout)){
			//window.location.href = ctx + "/logout";
			logout();
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
        url: ctx + '/sport/getBalance',
        data: {
            "t": new Date().getTime()
        },
        dataType: 'xml'
    });
    request.done(function(xmlResult) {
    	if(xmlResult == null){
    		 balanceCtx.html('<font color="red">' + mobile.msg.systemErr + '</font>');
    	}else{
        	var root = $(xmlResult);
        	var balance = root.find("user").attr("money");
    		var errcode = root.find("user").attr("errcode");
    		if(errcode != undefined && errcode == 1015){
    			alert(mobile.msg.sessionExpired);
    			window.location.href = "${ctx}/login";		
    		}        	
        	balanceCtx.html(formNumber(balance,2));    		
    	}
    });
    request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			balanceCtx.html('<font color="red">网络异常</font>');
		}else if(textStatus == 'parsererror'){
			alert(mobile.msg.sessionExpired);
			window.location.href = ctx + "/login";
		}	        
    });
    request.always(function() {
    	//$('div[data-role=listview]').listview("refresh");  
        //hideLoader();
    });
}