<%--------------------------------赛果查询----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<%@ include file="/WEB-INF/page/i18n.jsp" %>
<script src="${staticFileUrl}/js/sport/panel.js"></script>
<script src="${staticFileUrl}/js/dateUtil.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/datebox/jqm-datebox-1.4.4.min.css">
<link rel="stylesheet" href="${staticFileUrl}/css/sport.css">
<style>
.ui-content {
	padding: 1em !important;
}
.ui-grid-b>.ui-block-a{
    width: 35%;
    margin-top:3px !important
}
.ui-grid-b>.ui-block-b{
    width: 35%;
}
.ui-grid-b>.ui-block-c{
    width: 30%;
    margin-top:3px !important
}
</style>
</head>
<body>
<div data-role="page" id="betInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
			<a href="#quick-links" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"></a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['label.sport.results']}</h1>
	 		<a id="refreshBtn" href="javascript:getGameResult();" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a>
		 </div>
		</div>
	<%@ include file="panel_left.jsp"%>
    <%@ include file="panel_right.jsp" %>
  <div data-role="content" style="padding:0 !important">
        <fieldset class="ui-grid-b">
	  		<div class="ui-block-a">
	  			<select id="sportType" data-mini="true">
			         <option value="1">${msg['label.sport.fb.football']}</option>
			         <option value="2">${msg['label.sport.fb.basketball']}</option>
				</select>
			</div> 	        
     		<div class="ui-block-b">
     			<input name="sdate" id="sdate" type="text" data-role="datebox" data-options='{"mode":"datebox","minDays":180,"maxDays":0}' style="min-height: 1.8em;"/>
     		</div>
			<div class="ui-block-c">
			<select id="leagueList" data-native-menu="false" data-iconpos="right" data-mini="true" data-history="false">
				<%--
				<select id="leagueList" data-native-menu="false" multiple="multiple" data-iconpos="right" data-mini="true">
			        <option val="placeholder" data-placeholder="true">Days of the week</option>
			        <option value="" >Select All</option>
			         --%>
			         <option val="placeholder" data-placeholder="true">${msg['label.sport.result.selectLeague']}</option>
			</select>
			</div>
		</fieldset>  
		  <table data-role="table" data-mode="reflow" class="sport-list sport-table-breakpoint" id="matchResultTable" style="font-size:12px;">
		   <thead>
		    <tr>
		     <th>${msg['label.sport.result.datetime']}</th> 
		     <th>${msg['label.sport.result.event']}</th> 
		     <th>${msg['label.sport.result.firstHalfScore']}</th> 
		     <th>${msg['label.sport.result.fullTimeScore']}</th> 
		    </tr> 
		   </thead> 
		   <tbody>
		   <%-- <tr data-lid="33" data-lnm="中超"><td>03/11 15:00</td><td>广州恒大淘宝 VS 石家庄永昌</td><td>0 : 0</td><td>5 : 0</td></tr>--%>
		   </tbody> 
		  </table>
		  <a id="backBtn" style="display:none;" href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 300);" data-role="button" data-theme="y">${msg["button.common.backTop"]}</a></p>
  </div>
</div>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-1.4.4.core.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-1.4.4.mode.calbox.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-1.4.4.mode.datebox.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/datebox/jqm-datebox-i18n.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/plugin/dateFormat/jquery-dateFormat.min.js"></script>
<script type="text/javascript" src="${staticFileUrl}/js/hashMap.js"></script>
<script>
jQuery.extend(jQuery.mobile.datebox.prototype.options, {
    'overrideDateFormat': '%Y/%m/%d',
    'overrideHeaderFormat': '%Y/%m/%d',
    'overrideDateFieldOrder': ['y', 'm', 'd'],    
    'useLang':'${null == sessionScope.nutz_mvc_localization_key ? 'zh' : sessionScope.nutz_mvc_localization_key}',
    'useFocus':true,
    'theme':'a',
    'themeHeader':'b',
    'useNewStyle':true,
    'beforeToday':true,
    'overrideCalHeaderFormat': '%Y %B',
    'calUsePickers':true
});
var leagues = new HashMap(), leagueSelectMenu = $("#leagueList");
var ss = window.sessionStorage;
$(function(){
	var zeroTime = new Date(getToday()[0].Format("yyyy/MM/dd") + " " + "00:00:00");
	var ms = Math.floor ((getToday()[0] - zeroTime) / 1000 / 60 / 60);
	var showDate = ms > 12 ? getToday()[0].Format("yyyy-MM-dd") : getYesterday()[0].Format("yyyy-MM-dd");
	$("#sdate").val(showDate);
	var sid = "1";
	var s = JSON.parse(ss.getItem("rm_s"));
	if(s != null){
		sid = s.sid;
	}
	sid = sid == undefined ? "1" : sid;
	$("#sportType").val(sid).selectmenu("refresh");
	
	getGameResult();
    var isSelectAllOperation = false , isUnSelectAllOperation = true;
    
    /**
    $(document).on("click", "#leagueList-menu li a", function(){
        //was select all clicked (data-option-index="1")
        var idx = $(this).closest("li").data("option-index");
        if (idx == '1') {
            var isChecked = $(this).hasClass("ui-checkbox-on");
            if (isChecked){
                //select all
                isSelectAllOperation = true;
                $("#leagueList-menu li a").each(function( index ) {
                    var isHidden = $(this).closest("li").hasClass("ui-screen-hidden");
                    var notChecked = $( this ).hasClass("ui-checkbox-off");
                    if (!isHidden && notChecked){
                        $(this).click();
                    }
                });
                isSelectAllOperation = false;
            }else{
            	if(isUnSelectAllOperation){
	                $("#leagueList-menu li a").each(function( index ) {
	                    var isHidden = $(this).closest("li").hasClass("ui-screen-hidden");
	                    var notChecked = $( this ).hasClass("ui-checkbox-off");
	                    if (!isHidden && !notChecked){
	                        $(this).click();
	                    }
	                });            	
            	}
            }
        }else{
        	isUnSelectAllOperation = false;
            //uncheck the select all option
            if (!isSelectAllOperation) {
                var $selall = $('#leagueList-menu li[data-option-index="1"] a');
                if ($selall.hasClass("ui-checkbox-on")){
                    $selall.click();
                }
            }
            isUnSelectAllOperation = true;
        } 
    });
    */
    $("#leagueList").change(function(){
   		//showLoader();
   		$("#backBtn").hide();
    	var lid = $(this).val();
    	 $("#matchResultTable tbody tr").each(function (){
    	  	if(lid != "" && $(this).jqmData("lid") != lid){
    	  		$(this).hide();
    	  	}else{
    	  		$(this).show();
    	  	}
    	 });
    	 //hideLoader();
    });
    
    $("#sdate,#sportType").change(function(){
    	getGameResult();
    });
});

function getGameResult(){
	showLoader("${msg['msg.common.loading']}");
	leagues = new HashMap();
    var request = $.ajax({
        url: '${ctx}/sport/getMatchResult',
        data: {
        	sdate: $("#sdate").val(),
        	sportType: $("#sportType").val()
        },
        dataType: 'xml'
    });
    
	request.done(function(xmlResult) {
		var tbody = $("#matchResultTable > tbody");
		tbody.empty();
		leagueSelectMenu.empty();
		var root = $(xmlResult);
		var errcode = root.find("sports").attr("errcode");
		if(errcode != undefined){
			if(errcode == 1015){
				alert("${msg['msg.common.sessionExpired']}");
				window.location.href = "${ctx}/login";			
			}else if(errcode == -1){
				alert("${msg['msg.common.systemError']}");			
			}
		}		
		var match = root.find('match');
		if(match.length > 0){
			match.each(function(){ 
				var element = $(this);
				var mid = element.attr("mid");//赛事id
				var lid = element.attr("lid");//联赛id
				var lnm = element.attr("lnm");//联赛名称
				var hname = element.attr("hname");//主队名称
				var gname = element.attr("gname");//客队名称
				var hg = element.attr("hg");//主队全场得分
				var ag = element.attr("ag");//客队全场得分
				var hag = element.attr("hag");//客队半场得分
				var hhg = element.attr("hhg");//主队半场得分
				var hrs = element.attr("hrs");//半场状态
				var frs = element.attr("frs");//全场状态
				var fullScore, halfScore;
				if(frs != undefined && frs != ''){
					fullScore = frs;
				}else{
					fullScore = hg + " : " + ag;
				}
				
				if(hrs != undefined && hrs != ''){
					halfScore = hrs;
				}else{
					halfScore = hhg + " : " + hag;
				}
				if($("#sportType").val() == 2){
					if(halfScore == "0 : 0"){
						halfScore = "--";
					}
				}						
				var start = element.attr("start");//开赛时间		
				var dateStr = (start).replace("-", "/").replace("-", "/");
				var gmt0 = new Date(dateStr);
				//var gmt8 = new Date(gmt0.getTime() - gmt0.getTimezoneOffset() * 60000);
				var gmt8 = new Date(gmt0.getTime() + 8 * 3600000);
				tbody.append("<tr data-lid='" + lid + "' data-lnm='" + lnm + "'><th>" + $.format.date(gmt8, "MM-dd HH:mm") + "</th><td>" + hname + " VS "+ gname +"</td><td>" + halfScore + "</td><td>" + fullScore + "</td></tr>");
				leagues.put(lid, lnm);
			});		
			leagueSelectMenu.append('<option val="placeholder" data-placeholder="true">' + "${msg['label.sport.result.selectLeague']}" + '</option>');
			leagueSelectMenu.append('<option value="">' + '${msg["label.sport.result.allLeague"]}'+ '</option>');
			for (var lid in leagues.container) {
				var lname = leagues.get(lid.toString()).toString();
				leagueSelectMenu.append("<option value='" + lid + "'>" + lname + "</option>");
			}
				
			if(match.length > 10){
				$("#backBtn").show();
			}else{
				$("#backBtn").hide();
			}	
		}else{
			$("#backBtn").hide();
			//$("#matchResultTable").empty();
			//$("#matchResultTable").append("<thead><tr><th colspan='4' align='center'>暂无符合条件的记录</th></tr></thead>");
		}    

	});
	
	request.fail(function(jqXHR, textStatus, errorThrown) {
		if(textStatus == 'error'){
			console.log(textStatus);
		}else if(textStatus == 'parsererror'){
			alert("${msg['msg.common.sessionExpired']}");
			window.location.href = "${ctx}/login";
		} 		
	});
	
	request.always(function() {
		$("#matchResultTable").table("rebuild");
		leagueSelectMenu.selectmenu("refresh");	
		hideLoader();		
	});    
}
</script> 
</body>
</html>