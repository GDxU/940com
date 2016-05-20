<!--------------------------------限额详情---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<script type="text/javascript">
$(window).on("orientationchange", function(event) {
	//window.location.href= "${ctx}/ssc/userDetail?gid=" + $("#gid").val();
});
$(function(){
	getUserDetail();
});
function getUserDetail() {
    showLoader();
    var gid = $("#gid").val(), page = "#" + gid + "_PAGE";
    var accHisList = $(page);
    var detailTable = $("#" + gid + "_TABLE");
    var handicap = "${sessionScope.SSC_USER_SESSION.handype}";
    $.ajax({
        url: '${ctx}/ssc/getUserDetail',
        data: {"gid" : gid,"t" : new Date().getTime()},
        dataType: 'json',
        success: function(jsonResult) {
            var result = jsonResult.r;
            if (result == 0) {
                var arr = jsonResult.list;
                //遍历数据
                if (arr != undefined && arr.length > 0) { 
                    $.each(arr,
                    function(key, value) {
                    	var ctd = $("#" + gid + "-" + value.pn).children('td');
                    	$(ctd).eq(0).css("color","#076600");
                    	$(ctd).eq(1).html(value.sl);
                    	$(ctd).eq(2).html(value.sh);
                    	$(ctd).eq(3).html(value.dh);
                    	//$(ctd).eq(4).html(value.acom + "/" +value.bcom + "/" +value.ccom + "/" +value.dcom);
                    	var hdVal = "";
                    	if(handicap.indexOf("A") >= 0){
                    		hdVal = value.acom + "";
                    	}
                    	if(handicap.indexOf("B") >= 0){
                    		hdVal += (hdVal == "" ? "" : "/") + value.bcom + "";
                    	}
                    	if(handicap.indexOf("C") >= 0){
                    		hdVal += (hdVal == "" ? "" : "/") + value.ccom + "";
                    	}
                    	if(handicap.indexOf("D") >= 0){
                    		hdVal += (hdVal == "" ? "" : "/") + value.dcom + "";
                    	}    
                    	$(ctd).eq(4).html(hdVal);                	                    	                    	
                    });
                    detailTable.table("rebuild");
					//$.mobile.changePage(page,{"changeHash":false});                   
                } else { //没有数据的情况
                    detailTable.html('<h4 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">暂无该用户的限额信息，请联系客服</h4>');
                }
            } else { //系统异常
               detailTable.html('<h4 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">系统异常，请联系管理员</h4>');
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
			if(textStatus == 'error'){
				detailTable.html('<h4 class="ui-bar ui-bar-b ui-corner-all content-info" style="text-align: center;">网络中断,请检测网络</h4>');
			}else if(textStatus == 'parsererror'){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";
			}	        
        },
        complete: function() {
		    hideLoader();  
        }
    });
}
</script>
</head>
<body>
<input type="hidden" id="gid" name="gid" value="${obj.gid}"/>
<div data-role="page" id="KLC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.KLC']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" data-mode="reflow" class="movie-list ui-responsive" id="KLC_TABLE">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="KLC-BALL_1-NO_1">
				<td>1-8单码</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-BALL_1-ZHONG">
				<td>1-8${msg["label.ssc.ball.ZHONG"]}${msg["label.ssc.ball.FA"]}${msg["label.ssc.ball.BAI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-BALL_1-BIG">
				<td>1-8两面 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-BALL_1-EAST">
				<td>1-8球方位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-TOTAL-BIG">
				<td>总和两面 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-BALL_1-DRAGON">
				<td>1-4${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-SERIAL_2-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="KLC-SERIAL_2_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2_Z"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="KLC-SERIAL_3-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="KLC-SERIAL_3_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3_Z"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="KLC-SERIAL_4-NO_1">
				<td>${msg["label.ssc.play.SERIAL_4"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="KLC-SERIAL_5-NO_1">
				<td>${msg["label.ssc.play.SERIAL_5"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																																																												
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="SSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.SSC']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="SSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="SSC-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-BALL_1-BIG">
				<td>1-5双{[{6Z2i}]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-TOTAL-BIG">
				<td>总和双{[{6Z2i}]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-TOTAL-DRAGON">
				<td>${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-TOTAL-TIE">
				<td>和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-FIRST3-BAOZI">
				<td>${msg["label.ssc.ball.BAOZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-FIRST3-SHUNZI">
				<td>${msg["label.ssc.ball.SHUNZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-FIRST3-DUIZI">
				<td>${msg["label.ssc.ball.DUIZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-FIRST3-BANSHUN">
				<td>${msg["label.ssc.ball.BANSHUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-FIRST3-ZA_6">
				<td>${msg["label.ssc.ball.ZA_6"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="SSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="SSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SSC-HS_SM-WQ_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="BJC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.BJC']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="BJC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<%--
			<tr id="BJC-BALL_1-NO_1">
				<td>冠军 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_2-NO_1">
				<td>亚军</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_3-NO_1">
				<td>第三名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="BJC-BALL_4-NO_1">
				<td>第四名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_5-NO_1">
				<td>第五名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_6-NO_1">
				<td>第六名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="BJC-BALL_7-NO_1">
				<td>第七名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_8-NO_1">
				<td>第八名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_9-NO_1">
				<td>第九名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_10-NO_1">
				<td>第十名 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			 --%>	
			<tr id="BJC-BALL_1-NO_1">
				<td>1-10${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<%--			 					
			<tr id="BJC-BALL_1-ODD">
				<td>1-10名${msg["label.ssc.ball.ODD"]}${msg["label.ssc.ball.EVEN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-BALL_1-BIG">
				<td>1-10名${msg["label.ssc.play.BIG_SMALL"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			 --%>
			<tr id="BJC-BALL_1-BIG">
				<td>1-10${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			 
			<tr id="BJC-BALL_1-DRAGON">
				<td>1-5${msg["label.ssc.play.longhu"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-GOLD_SILVER-TIE">
				<td>冠亚和值 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-GOLD_SILVER-BS">
				<td>冠、亚军和${msg["label.ssc.play.BIG_SMALL"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJC-GOLD_SILVER-OE">
				<td>冠、亚军和${msg["label.ssc.ball.ODD"]}${msg["label.ssc.ball.EVEN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="XYNC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.XYNC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="XYNC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="XYNC-BALL_1-NO_1">
				<td>1-8单码 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-BALL_1-ZHONG">
				<td>1-8${msg["label.ssc.ball.ZHONG"]}${msg["label.ssc.ball.FA"]}${msg["label.ssc.ball.BAI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-BALL_1-BIG">
				<td>1-8两面 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-BALL_1-EAST">
				<td>1-8球方位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-TOTAL-BIG">
				<td>总和两面 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-BALL_1-DRAGON">
				<td>1-4${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-ZHENGMA-NO_1">
				<td>${msg["label.ssc.play.ZHENGMA"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="XYNC-SERIAL_2-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XYNC-SERIAL_2_LZ-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2"]}连直 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>				
			<tr id="XYNC-SERIAL_2_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2_Z"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XYNC-SERIAL_3-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XYNC-SERIAL_3_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3_Z"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XYNC-SERIAL_4-NO_1">
				<td>${msg["label.ssc.play.SERIAL_4"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="XYNC-SERIAL_5-NO_1">
				<td>${msg["label.ssc.play.SERIAL_5"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																																																												
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="JSKS_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.JSKS']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="JSKS_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="JSKS-BIG_SMALL-BIG">
				<td>${msg["label.ssc.play.BIG_SMALL"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSKS-SAN_JUN-NO_1">
				<td>${msg["label.ssc.play.SAN_JUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSKS-WEI_SUAI-NO_1_1_1">
				<td>${msg["label.ssc.play.WEI_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="JSKS-QUAN_SUAI-NO_0_0_0">
				<td>${msg["label.ssc.play.QUAN_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSKS-POINT-P_4">
				<td>点数 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSKS-LONG_CARDS-NO_1_2">
				<td>${msg["label.ssc.play.LONG_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JSKS-SHORT_CARDS-NO_1_1">
				<td>${msg["label.ssc.play.SHORT_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="JXSSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.JXSSC']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="JXSSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="JXSSC-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-BALL_1-BIG">
				<td>1-5双{[{6Z2i}]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-TOTAL-BIG">
				<td>总和双{[{6Z2i}]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-TOTAL-DRAGON">
				<td>${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-TOTAL-TIE">
				<td>和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-FIRST3-BAOZI">
				<td>${msg["label.ssc.ball.BAOZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-FIRST3-SHUNZI">
				<td>${msg["label.ssc.ball.SHUNZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-FIRST3-DUIZI">
				<td>${msg["label.ssc.ball.DUIZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-FIRST3-BANSHUN">
				<td>${msg["label.ssc.ball.BANSHUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-FIRST3-ZA_6">
				<td>${msg["label.ssc.ball.ZA_6"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="JXSSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="JXSSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSSC-HS_SM-WQ_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>															
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="XJSSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.XJSSC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="XJSSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="XJSSC-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-BALL_1-BIG">
				<td>1-5双{[{6Z2i}]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-TOTAL-BIG">
				<td>总和双{[{6Z2i}]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-TOTAL-DRAGON">
				<td>${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-TOTAL-TIE">
				<td>和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-FIRST3-BAOZI">
				<td>${msg["label.ssc.ball.BAOZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-FIRST3-SHUNZI">
				<td>${msg["label.ssc.ball.SHUNZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-FIRST3-DUIZI">
				<td>${msg["label.ssc.ball.DUIZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-FIRST3-BANSHUN">
				<td>${msg["label.ssc.ball.BANSHUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-FIRST3-ZA_6">
				<td>${msg["label.ssc.ball.ZA_6"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XJSSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XJSSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="XJSSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="XJSSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="XJSSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XJSSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XJSSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="XJSSC-HS_SM-WQ_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>															
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="GDSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['title.ssc.GDSYXW']}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="GDSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="GDSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="GDSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="GDSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GDSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="TJKLC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.TJKLC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" data-mode="reflow" class="movie-list ui-responsive" id="TJKLC_TABLE">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="TJKLC-BALL_1-NO_1">
				<td>1-8${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-BALL_1-ZHONG">
				<td>1-8${msg["label.ssc.ball.ZHONG"]}${msg["label.ssc.ball.FA"]}${msg["label.ssc.ball.BAI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-BALL_1-BIG">
				<td>1-8${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-BALL_1-EAST">
				<td>1-8球方位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-BALL_1-DRAGON">
				<td>1-4${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-SERIAL_2-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJKLC-SERIAL_2_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2_Z"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJKLC-SERIAL_3-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJKLC-SERIAL_3_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3_Z"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJKLC-SERIAL_4-NO_1">
				<td>${msg["label.ssc.play.SERIAL_4"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="TJKLC-SERIAL_5-NO_1">
				<td>${msg["label.ssc.play.SERIAL_5"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																																																												
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="TJSSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.TJSSC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="TJSSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="TJSSC-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-BALL_1-BIG">
				<td>1-5双{[{6Z2i}]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-TOTAL-BIG">
				<td>总和双{[{6Z2i}]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-TOTAL-DRAGON">
				<td>${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-TOTAL-TIE">
				<td>和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-FIRST3-BAOZI">
				<td>${msg["label.ssc.ball.BAOZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-FIRST3-SHUNZI">
				<td>${msg["label.ssc.ball.SHUNZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-FIRST3-DUIZI">
				<td>${msg["label.ssc.ball.DUIZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-FIRST3-BANSHUN">
				<td>${msg["label.ssc.ball.BANSHUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-FIRST3-ZA_6">
				<td>${msg["label.ssc.ball.ZA_6"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJSSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJSSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="TJSSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="TJSSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="TJSSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJSSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJSSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="TJSSC-HS_SM-WQ_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>															
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="SHSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.SHSYXW"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="SHSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="SHSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="SHSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SHSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="SDSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>山东十一运夺金</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="SDSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="SDSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="SDSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SDSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SDSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="GXKLC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.GXKLC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="GXKLC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="GXKLC-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-BALL_1-BIG">
				<td>1-5${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="GXKLC-BALL_1-DRAGON">
				<td>1-5${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-BALL_1-RED">
				<td>1-5红蓝绿 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-BALL_1-CHUN">
				<td>1-5四季 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-BALL_1-JIN">
				<td>1-5{[{5LqU6KGM}]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKLC-ZHENGMA-NO_1">
				<td>${msg["label.ssc.play.ZHENGMA"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="HNKLC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.HNKLC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" data-mode="reflow" class="movie-list ui-responsive" id="HNKLC_TABLE">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="HNKLC-BALL_1-NO_1">
				<td>1-8${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-BALL_1-ZHONG">
				<td>1-8${msg["label.ssc.ball.ZHONG"]}${msg["label.ssc.ball.FA"]}${msg["label.ssc.ball.BAI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-BALL_1-BIG">
				<td>1-8${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-BALL_1-EAST">
				<td>1-8球方位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-BALL_1-DRAGON">
				<td>1-4${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-SERIAL_2-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="HNKLC-SERIAL_2_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_2_Z"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="HNKLC-SERIAL_3-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HNKLC-SERIAL_3_Z-NO_1">
				<td>${msg["label.ssc.play.SERIAL_3_Z"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="HNKLC-SERIAL_4-NO_1">
				<td>${msg["label.ssc.play.SERIAL_4"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="HNKLC-SERIAL_5-NO_1">
				<td>${msg["label.ssc.play.SERIAL_5"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																																																												
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="BJKLC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.BJKLC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" data-mode="reflow" class="movie-list ui-responsive" id="BJKLC_TABLE">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="BJKLC-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJKLC-QIANHE-QIAND">
				<td>前后和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="BJKLC-ODDHE-ODDD">
				<td>单双和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="BJKLC-WUXING-JIN">
				<td>{[{5LqU6KGM}]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="BJKLC-ZHENGMA-NO_1">
				<td>正码 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="YNSSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.YNSSC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="YNSSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="YNSSC-BALL_1-NO_1">
				<td>单码 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-TOTAL-DRAGON">
				<td>${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-TOTAL-TIE">
				<td>和 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-FIRST3-BAOZI">
				<td>${msg["label.ssc.ball.BAOZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-FIRST3-SHUNZI">
				<td>${msg["label.ssc.ball.SHUNZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-FIRST3-DUIZI">
				<td>${msg["label.ssc.ball.DUIZI"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-FIRST3-BANSHUN">
				<td>${msg["label.ssc.ball.BANSHUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-FIRST3-ZA_6">
				<td>${msg["label.ssc.ball.ZA_6"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="YNSSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="YNSSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="YNSSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="YNSSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="YNSSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="YNSSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="YNSSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="YNSSC-HS_SM-WQ_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>														
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="SHSSC_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.SHSSC"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="SHSSC_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="SHSSC-BALL_1-NO_1">
				<td>1-3单码 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSSC-BALL_1-BIG">
				<td>1-3${msg["label.ssc.twosides"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSSC-HS_SM-BS_ODD">
				<td>和数</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSSC-YIZI-ZI_S">
				<td>一字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SHSSC-ERZI-ZI_S">
				<td>二字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SHSSC-SANZI-ZI_S">
				<td>三字 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="SHSSC-ERZIDW-ZUHE">
				<td>二字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>			
			<tr id="SHSSC-SANZIDW-ZI_S">
				<td>三字定位 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="SHSSC-ZUXUANSAN-ZI_S">
				<td>组选三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SHSSC-ZUXUANLIU-ZI_S">
				<td>组选六</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="SHSSC-KUADU-ZI_S">
				<td>跨度</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>																
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="JXSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.JXSYXW"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="JXSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="JXSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="JXSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JXSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JXSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="LNSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.LNSYXW"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="LNSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="LNSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="LNSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="LNSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="LNSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="HBSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.HBSYXW"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="HBSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="HBSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="HBSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="HBSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="HBSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="JSSYXW_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.JSSYXW"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="JSSYXW_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="JSSYXW-BALL_1-NO_1">
				<td>1-5${msg["title.ssc.DM"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-BALL_1-BIG">
				<td>1-5球${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-TOTAL-BIG">
				<td>总和${msg["label.ssc.twosides"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="JSSYXW-TOTAL-DRAGON">
				<td>总和${msg["label.ssc.play.longhu"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_1_1-NO_1">
				<td>一中一 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_2_2-NO_1">
				<td>二中二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="JSSYXW-SERIAL_3_3-NO_1">
				<td>三中三</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_4_4-NO_1">
				<td>四中四 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_5_5-NO_1">
				<td>五中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_6_5-NO_1">
				<td>六中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_7_5-NO_1">
				<td>七中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_8_5-NO_1">
				<td>八中五 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_ZX_2-NO_1">
				<td>组选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_ZX_3-NO_1">
				<td>组选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_ZHI_2-NO_1">
				<td>直选前二 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="JSSYXW-SERIAL_ZHI_3-NO_1">
				<td>直选前三 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="AHKS_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.AHKS"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="AHKS_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="AHKS-BIG_SMALL-BIG">
				<td>${msg["label.ssc.play.BIG_SMALL"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="AHKS-SAN_JUN-NO_1">
				<td>${msg["label.ssc.play.SAN_JUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="AHKS-WEI_SUAI-NO_1_1_1">
				<td>${msg["label.ssc.play.WEI_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="AHKS-QUAN_SUAI-NO_0_0_0">
				<td>${msg["label.ssc.play.QUAN_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="AHKS-POINT-P_4">
				<td>点数 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="AHKS-LONG_CARDS-NO_1_2">
				<td>${msg["label.ssc.play.LONG_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="AHKS-SHORT_CARDS-NO_1_1">
				<td>${msg["label.ssc.play.SHORT_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>
<div data-role="page" id="GXKS_PAGE" data-title="个人资讯">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg["title.ssc.GXKS"]}</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
  <div data-role="main" class="ui-content">
	<table data-role="table" id="GXKS_TABLE" data-mode="reflow" class="movie-list ui-responsive">
		<thead>
			<tr>
				<th>玩法</th>
				<th>${msg["label.ssc.singleBetMin"]}</th>
				<th>${msg["label.ssc.singleBetMax"]}</th>
				<th>${msg["label.ssc.singleGameMax"]}</th>
				<th>[${sessionScope.SSC_USER_SESSION.handype}]${msg["label.ssc.tuishui"]}(%)</th>
			</tr>
		</thead>
		<tbody>
			<tr id="GXKS-BIG_SMALL-BIG">
				<td>${msg["label.ssc.play.BIG_SMALL"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKS-SAN_JUN-NO_1">
				<td>${msg["label.ssc.play.SAN_JUN"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKS-WEI_SUAI-NO_1_1_1">
				<td>${msg["label.ssc.play.WEI_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>		
			<tr id="GXKS-QUAN_SUAI-NO_0_0_0">
				<td>${msg["label.ssc.play.QUAN_SUAI"]}</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKS-POINT-P_4">
				<td>点数 </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
			<tr id="GXKS-LONG_CARDS-NO_1_2">
				<td>${msg["label.ssc.play.LONG_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>	
			<tr id="GXKS-SHORT_CARDS-NO_1_1">
				<td>${msg["label.ssc.play.SHORT_CARDS"]} </td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>
	</table>
</div> 
</div>


</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>