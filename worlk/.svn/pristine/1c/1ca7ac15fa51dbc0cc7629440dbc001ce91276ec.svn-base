<!--------------------------------个人资讯---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/qxc/panel.js?v=${rsvn}"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script type="text/javascript">
$(function(){
	getUserInfo();
});
function getUserInfo(){
    showLoader();
    var userBaseInfo = $("#userBaseInfo");
    var limitTbody = $("#limit_table > tbody");
    var request = $.ajax({
        url: '${ctx}/qxc/getUserInfo',
        data: {
        	"rtype": 0,
        	"t": new Date().getTime()
        },
        dataType: 'json'
    });   
    request.done(function(json) {
    	var result = json.r;
    	if(result == 0){
    		userBaseInfo.empty();
    		var userType = json.data.tp;//类型
    		var status = json.data.sts;//状态
    		if(status == 1){
    			status = "正常";
    		}else if(status == 2){
    			status = "锁定";
    		}else if(status == 3){
    			status = "禁用";
    		}else if(status == 4){
    			status = "冻结";
    		}
    		//1、用户基本信息
    		if(userType == 0){//信用
    			userBaseInfo.append('<li>代号<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>姓名<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>信用额度<span class="ui-li-count">' + formNumber(json.data.sc,2) + '</span></li>');
    			userBaseInfo.append('<li>信用余额<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>账号状态<span class="ui-li-count">' + status + '</span></li>');
//     			userBaseInfo.append('<li>经销类别<span class="ui-li-count">' + json.data.htn + '</span></li>');
    		}else{//现金
    			userBaseInfo.append('<li>代号<span class="ui-li-count">' + json.data.an + '</span></li>');
//     			userBaseInfo.append('<li>姓名<span class="ui-li-count">' + json.data.nm + '</span></li>');
    			userBaseInfo.append('<li>RMB<span class="ui-li-count">' + formNumber(json.data.ac,2) + '</span></li>');
    			userBaseInfo.append('<li>账号状态<span class="ui-li-count">' + status + '</span></li>');
//     			userBaseInfo.append('<li>经销类别<span class="ui-li-count">' + json.data.htn + '</span></li>');    		
    		}
    		userBaseInfo.listview("refresh");
    		//2、用户限额信息
    		$.each(json.list, function(key, value){
    			var cs = '<select data-comm="" data-gc="'+ value.gc +'">',rs = '<select data-gc="'+ value.gc * -1 +'">',tems = '';
    			
    			$.each(value.cs,function(s,v){
    				var temh = ''
    				if (v == value.c) {
    					tems = s;
    					temh = 'selected="selected"';
    				}
    				cs += '<option value="'+ s +'"'+ temh +' >'+ v +'</option>';
    			});
    			$.each(value.rs,function(s,v){
    				rs += '<option value="'+ s +'"'+ (tems == s?' selected="selected"':'') +'>'+ v +'</option>';
    			});
    			cs += '</select>';rs += '</select>';
    			
    			limitTbody.append("<tr><th style='color:#076600'>" + replaceAllHtml(value.gn) + "</th><td>" 
    					+ value.smi + "</td><td>" + value.smx + "</td><td>" + value.stm+ "</td><td>" + value.rmx+ "</td><td>" 
    					+ cs+ "</td><td>" + rs + "</td></tr>");
    			
    		});
    		$("#limit_table").table("rebuild");
    		
    		$('select').change(function(){
    			var $t = $(this);
    			$('[data-gc="'+ $t.attr('data-gc') * -1 +'"]').val($t.val());
    		});
    	} else {
	        userBaseInfo.html('<h4 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">获取用户基本信息失败,请联系管理员</h4>');
	    }
    }); 
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			userBaseInfo.html('<h4 class="ui-bar ui-bar-b ui-corner-all" style="color:#FFF;text-align: center;">网络中断,请检测网络</h4>');
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		}	    
	});
	request.always(function() {
	    hideLoader();
	}); 	
}

function setcomm(){
	$("#submitBtn").attr("disabled","disabled").addClass("ui-state-disabled");
	showSubmit(replaceAllHtml("数据已提交，请稍后..."));
	var url = ctx + '/qxc/setcomm';
	var pm = function() {
		var o = {param:''};
		$('[data-comm=""]').each( function(i,v){
			var $s = $(this);
			o.param += '#' + $s.attr('data-gc') + '_' +$s.find("option:selected").text();
		} );
		o.param = o.param.substring(1);
		return o;
	}
	var jqxhr = $.post(url,pm(),function(j, status){
		hideLoader();
		var obj = eval('(' + j + ')');
    	if (obj.r == 0) {
    		if (obj.data.code == 1) {
    			alert(replaceAllHtml('交易{[{5Zue5rC0}]}设置成功！'));
    		} else {
    			alert(obj.data.description);
    		}
    	} else {
    		alert('系统错误！');
    		window.location.href = ctx + "/index";
    	}
	});
	jqxhr.fail(function(jqXHR, textStatus, errorThrown){
    	hideLoader();
		if(textStatus == 'error'){
			console.log("error:" + jqXHR.responseText);
		}else if(textStatus == 'parsererror'){
			if(jqXHR.responseText.indexOf("session invalidate") > -1){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";					
			}else{
				console.log("parsererror:" + jqXHR.responseText);
			}
		} 
    });
	jqxhr.always(function() {
		$("#submitBtn").removeAttr("disabled").removeClass("ui-state-disabled");
	});
}
</script>
</head>
<body>
<div data-role="page" id="userInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/qxc/qxcmenu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>会员资料</h1>
		 </div>
	</div>
  	<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
	<div data-role="main"  class="ui-content" >
		<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
		<h3>基本信息</h3>
		<div data-role="listview" id="userBaseInfo">
			<li style="text-align :center;"><font color="red">正在加载用户基本信息...</font></li>
			<%-- 
			<li id="accnum">账号<span class="ui-li-count">testaaa</span></li>
			<li id="accname">会员名称<span class="ui-li-count">testaaa</span></li>
			<li id="cash_balance">RMB<span class="ui-li-count">1000</span></li>
			<li id="credit_default">信#用#额度<span class="ui-li-count">1000</span></li>
			<li id="credit_balance">信#用#余额<span class="ui-li-count">2000</span></li>
			<li id="acc_status">账号状态<span class="ui-li-count">正常 </span></li>
			<li id="handType">所属盘#口<span class="ui-li-count">A,B,C,D</span></li>
			 --%>
		</div>		
		</div>

		<div data-role="collapsible" data-content-theme="false" data-collapsed="false" data-iconpos="right" data-theme="m" data-expanded-icon="carat-u" data-collapsed-icon="carat-d">
		<h3>交易{[{5Zue5rC0}]}</h3>
		<a href="#" onclick="setcomm()" class="ui-btn-top ui-link ui-btn ui-shadow ui-corner-all" data-role="button" role="button" id="submitBtn">保存{[{5Zue5rC0}]}设置</a>
		<table data-role="table" id="limit_table" data-mode="reflow" class="qxc-list qxc-table-breakpoint ui-qxc-table-user">
			<thead>
				<tr>
					<th>玩法</th>
					<th>${msg["label.qxc.singleBetMin"]}</th>
					<th>${msg["label.qxc.singleBetMax"]}</th>
					<th>${msg["label.qxc.singleGameMax"]}</th>
					<th>${msg["label.qxc.radio"]}上限</th>
					<th>交易{[{5Zue5rC0}]}</th>
					<th>${msg["label.qxc.radio"]}</th>
					
				</tr>
			</thead>
			<tbody>
			<%-- 
				<tr>
					<td>特A</td>
					<td>1</td>
					<td>5000</td>
					<td>10000</td>
					<td>D: 0.1200</td>
				</tr>
			 --%>				
			</tbody>
		</table>	
		<a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 500);" class="ui-btn-top" data-role="button">返回顶部</a></p><!-- 回到顶部 -->
		</div>
	</div> 
</div>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>