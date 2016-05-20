<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
<link rel="stylesheet" href="${staticFileUrl}/css/result_skin.css">
<script src="${staticFileUrl}/js/combet.js"></script>
<script src="${staticFileUrl}/js/data.js"></script>
<script type="text/javascript">
$(function(){
	$("ul li .ui-btn-active").removeClass("ui-btn-active");
	var str = "changeBetOn('" + $("#bon").val() + "')";
	$("[onclick='" + str + "']").addClass("ui-btn-active");
	//initTable();
	$("label").addClass("ui-btn-z"); 
	$("input[type='checkbox']").on("click",function(e){
        if($("input:checked").length>0){
        	obcs();
		}else{
			obch();
		}
    });
    $(document).on("click","input[rel='d']",function(e){
        cdb(this,2);
    });
    $(document).on("click","input[rel='w']",function(e){
    	cwb(this);
    });
	$("#orderBtn").on("click",function(e) {
        obc();
    });
    $("#submitBtn").on("click",function(){
    	sbc();
    });
    $("#cancelBtn").on("click",function(){
    	$.mobile.changePage("#rateInfoPage", "slideup");
        changeBetOn($("#bon").val(),1);
    });
    //checkIntro();
    $("#hcth").on("click",function(){
    	if(hca == 1){
	    	$.mobile.changePage("#hctm", "slideup");
    	}
    });
    showhc();
});

function changeBetOn(betOn,flag){
	$("#bon").val(betOn);
	if(betOn=='ERZIDW_WQ'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.WQ']}"));
	}
	if(betOn=='ERZIDW_WB'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.WB']}"));
	}
	if(betOn=='ERZIDW_WS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.WS']}"));
	}
	if(betOn=='ERZIDW_WG'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.WG']}"));
	}
	if(betOn=='ERZIDW_QB'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.QB']}"));
	}
	if(betOn=='ERZIDW_QS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.QSH']}"));
	}
	if(betOn=='ERZIDW_QG'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.QG']}"));
	}
	if(betOn=='ERZIDW_BS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.BS']}"));
	}
	if(betOn=='ERZIDW_BG'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.BG']}"));
	}
	if(betOn=='ERZIDW_SG'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EDW']} ${msg['label.ssc.play.SG']}"));
	}
	if(flag==1){
		var str = "changeBetOn('" + betOn + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
	}else{
		getRateInfo($("#gameId").val(),$("#bon").val(),0);
	}
}

function initTable(){
	var ot = $("#brstable");
    ot.children("tbody").remove();
    var tbody = $("<tbody></tbody>");
    str='';
    var n = 0;
	for ( var s = 0; s < 10; s++) {
		for ( var g = 0; g < 10; g++) {
			var tem = 'NO_' + s + '-NO_' + g;
			var temn = '' + s + g;
			if(n%4==0){
				str += '<tr class="ssc">';
			}
			str += '<td class="td-bgcolor"><span>' + temn + '</span></td>';
			str += '<td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="' + tem + '" id="' + tem;
			str += '" data-mini="true"><label for="' + tem + '" title="' + temn + '">0.00</label></fieldset></td>';
			if(n%4==3 || 'NO_9-NO_9' == tem){
				str += '</tr>';
			}
			n++;
			//str += tem + ' ; ';
			//$(str).appendTo(tbody);
		}
	}
	console.log(str);
	console.log(n);
	//ot.append(tbody);
}

var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.TJSSC']}" scope="request"/>
<body>
	<section  data-role="page" id="rateInfoPage">
		<c:set var="page_type" value="2" scope="request"/>
		<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_left_ssc.jsp" %>
		<%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
		<div data-role="content" id="rateRefInfo">
		<div class="ui-on-lottery">	
			<table border="1" class="rslttable" id="oit">
				<thead>
				    <tr class="On-Number">
				      <th class="wNumber"><span id="oiss"></span>期开奖号码</th>
				    </tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>
			</div>	
			<div class="clear"></div>
			<div class="list_dingtime">		
		    <div class="handicap-info">
		       	 <span id="issueNow"><font color='red'>加载中...</font></span>&nbsp;<span id="closeCountdown"></span>&nbsp;<span id="optm"></span>
		       	 <div style="float:right;" id="ykMoneyDiv">${msg['title.ssc.todayWinLoss']}:<span id="ykmoney">0.00</span></div>
		    </div> 
  			<div data-role="navbar">
			    <ul>
			        <li><a href="#" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_WQ')">${msg['label.ssc.play.WQ']}</a></li>
			        <li><a href="#" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_WB')">${msg['label.ssc.play.WB']}</a></li>
			        <li><a href="#" ${obj.nav == 3 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_WS')">${msg['label.ssc.play.WS']}</a></li>
			        <li><a href="#" ${obj.nav == 4 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_WG')">${msg['label.ssc.play.WG']}</a></li>
			        <li><a href="#" ${obj.nav == 5 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_QB')">${msg['label.ssc.play.QB']}</a></li>
			    </ul>
			    <ul>
			        <li><a href="#" ${obj.nav == 6 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_QS')">${msg['label.ssc.play.QSH']}</a></li>
			        <li><a href="#" ${obj.nav == 7 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_QG')">${msg['label.ssc.play.QG']}</a></li>
			        <li><a href="#" ${obj.nav == 8 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_BS')">${msg['label.ssc.play.BS']}</a></li>
			        <li><a href="#" ${obj.nav == 9 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_BG')">${msg['label.ssc.play.BG']}</a></li>
			        <li><a href="#" ${obj.nav == 10 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZIDW_SG')">${msg['label.ssc.play.SG']}</a></li>
			    </ul>
			</div>
			<div class="table-cotent-lottery">
			<table border="1" class="hdptable" id="brstable">
				<thead>
			    <tr class="tr-bgcolor">
			      <th data-priority="1">号码</th>
			      <th data-priority="2">${msg['title.ssc.radio']}</th>
			      <th data-priority="3">号码</th>
			      <th data-priority="4">${msg['title.ssc.radio']}</th>
			      <th data-priority="5">号码</th>
			      <th data-priority="6">${msg['title.ssc.radio']}</th>
			      <th data-priority="7">号码</th>
			      <th data-priority="8">${msg['title.ssc.radio']}</th>
			    </tr>
			  </thead>
			  <tbody>

<tr class="ssc"><td class="td-bgcolor"><span>00</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_0" id="NO_0-NO_0" data-mini="true"><label for="NO_0-NO_0" title="00">0.00</label></fieldset></td><td class="td-bgcolor"><span>01</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_1" id="NO_0-NO_1" data-mini="true"><label for="NO_0-NO_1" title="01">0.00</label></fieldset></td><td class="td-bgcolor"><span>02</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_2" id="NO_0-NO_2" data-mini="true"><label for="NO_0-NO_2" title="02">0.00</label></fieldset></td><td class="td-bgcolor"><span>03</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_3" id="NO_0-NO_3" data-mini="true"><label for="NO_0-NO_3" title="03">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>04</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_4" id="NO_0-NO_4" data-mini="true"><label for="NO_0-NO_4" title="04">0.00</label></fieldset></td><td class="td-bgcolor"><span>05</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_5" id="NO_0-NO_5" data-mini="true"><label for="NO_0-NO_5" title="05">0.00</label></fieldset></td><td class="td-bgcolor"><span>06</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_6" id="NO_0-NO_6" data-mini="true"><label for="NO_0-NO_6" title="06">0.00</label></fieldset></td><td class="td-bgcolor"><span>07</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_7" id="NO_0-NO_7" data-mini="true"><label for="NO_0-NO_7" title="07">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>08</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_8" id="NO_0-NO_8" data-mini="true"><label for="NO_0-NO_8" title="08">0.00</label></fieldset></td><td class="td-bgcolor"><span>09</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_9" id="NO_0-NO_9" data-mini="true"><label for="NO_0-NO_9" title="09">0.00</label></fieldset></td><td class="td-bgcolor"><span>10</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_0" id="NO_1-NO_0" data-mini="true"><label for="NO_1-NO_0" title="10">0.00</label></fieldset></td><td class="td-bgcolor"><span>11</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_1" id="NO_1-NO_1" data-mini="true"><label for="NO_1-NO_1" title="11">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>12</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_2" id="NO_1-NO_2" data-mini="true"><label for="NO_1-NO_2" title="12">0.00</label></fieldset></td><td class="td-bgcolor"><span>13</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_3" id="NO_1-NO_3" data-mini="true"><label for="NO_1-NO_3" title="13">0.00</label></fieldset></td><td class="td-bgcolor"><span>14</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_4" id="NO_1-NO_4" data-mini="true"><label for="NO_1-NO_4" title="14">0.00</label></fieldset></td><td class="td-bgcolor"><span>15</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_5" id="NO_1-NO_5" data-mini="true"><label for="NO_1-NO_5" title="15">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>16</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_6" id="NO_1-NO_6" data-mini="true"><label for="NO_1-NO_6" title="16">0.00</label></fieldset></td><td class="td-bgcolor"><span>17</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_7" id="NO_1-NO_7" data-mini="true"><label for="NO_1-NO_7" title="17">0.00</label></fieldset></td><td class="td-bgcolor"><span>18</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_8" id="NO_1-NO_8" data-mini="true"><label for="NO_1-NO_8" title="18">0.00</label></fieldset></td><td class="td-bgcolor"><span>19</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_9" id="NO_1-NO_9" data-mini="true"><label for="NO_1-NO_9" title="19">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>20</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_0" id="NO_2-NO_0" data-mini="true"><label for="NO_2-NO_0" title="20">0.00</label></fieldset></td><td class="td-bgcolor"><span>21</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_1" id="NO_2-NO_1" data-mini="true"><label for="NO_2-NO_1" title="21">0.00</label></fieldset></td><td class="td-bgcolor"><span>22</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_2" id="NO_2-NO_2" data-mini="true"><label for="NO_2-NO_2" title="22">0.00</label></fieldset></td><td class="td-bgcolor"><span>23</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_3" id="NO_2-NO_3" data-mini="true"><label for="NO_2-NO_3" title="23">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>24</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_4" id="NO_2-NO_4" data-mini="true"><label for="NO_2-NO_4" title="24">0.00</label></fieldset></td><td class="td-bgcolor"><span>25</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_5" id="NO_2-NO_5" data-mini="true"><label for="NO_2-NO_5" title="25">0.00</label></fieldset></td><td class="td-bgcolor"><span>26</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_6" id="NO_2-NO_6" data-mini="true"><label for="NO_2-NO_6" title="26">0.00</label></fieldset></td><td class="td-bgcolor"><span>27</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_7" id="NO_2-NO_7" data-mini="true"><label for="NO_2-NO_7" title="27">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>28</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_8" id="NO_2-NO_8" data-mini="true"><label for="NO_2-NO_8" title="28">0.00</label></fieldset></td><td class="td-bgcolor"><span>29</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_9" id="NO_2-NO_9" data-mini="true"><label for="NO_2-NO_9" title="29">0.00</label></fieldset></td><td class="td-bgcolor"><span>30</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_0" id="NO_3-NO_0" data-mini="true"><label for="NO_3-NO_0" title="30">0.00</label></fieldset></td><td class="td-bgcolor"><span>31</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_1" id="NO_3-NO_1" data-mini="true"><label for="NO_3-NO_1" title="31">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>32</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_2" id="NO_3-NO_2" data-mini="true"><label for="NO_3-NO_2" title="32">0.00</label></fieldset></td><td class="td-bgcolor"><span>33</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_3" id="NO_3-NO_3" data-mini="true"><label for="NO_3-NO_3" title="33">0.00</label></fieldset></td><td class="td-bgcolor"><span>34</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_4" id="NO_3-NO_4" data-mini="true"><label for="NO_3-NO_4" title="34">0.00</label></fieldset></td><td class="td-bgcolor"><span>35</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_5" id="NO_3-NO_5" data-mini="true"><label for="NO_3-NO_5" title="35">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>36</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_6" id="NO_3-NO_6" data-mini="true"><label for="NO_3-NO_6" title="36">0.00</label></fieldset></td><td class="td-bgcolor"><span>37</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_7" id="NO_3-NO_7" data-mini="true"><label for="NO_3-NO_7" title="37">0.00</label></fieldset></td><td class="td-bgcolor"><span>38</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_8" id="NO_3-NO_8" data-mini="true"><label for="NO_3-NO_8" title="38">0.00</label></fieldset></td><td class="td-bgcolor"><span>39</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_9" id="NO_3-NO_9" data-mini="true"><label for="NO_3-NO_9" title="39">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>40</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_0" id="NO_4-NO_0" data-mini="true"><label for="NO_4-NO_0" title="40">0.00</label></fieldset></td><td class="td-bgcolor"><span>41</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_1" id="NO_4-NO_1" data-mini="true"><label for="NO_4-NO_1" title="41">0.00</label></fieldset></td><td class="td-bgcolor"><span>42</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_2" id="NO_4-NO_2" data-mini="true"><label for="NO_4-NO_2" title="42">0.00</label></fieldset></td><td class="td-bgcolor"><span>43</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_3" id="NO_4-NO_3" data-mini="true"><label for="NO_4-NO_3" title="43">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>44</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_4" id="NO_4-NO_4" data-mini="true"><label for="NO_4-NO_4" title="44">0.00</label></fieldset></td><td class="td-bgcolor"><span>45</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_5" id="NO_4-NO_5" data-mini="true"><label for="NO_4-NO_5" title="45">0.00</label></fieldset></td><td class="td-bgcolor"><span>46</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_6" id="NO_4-NO_6" data-mini="true"><label for="NO_4-NO_6" title="46">0.00</label></fieldset></td><td class="td-bgcolor"><span>47</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_7" id="NO_4-NO_7" data-mini="true"><label for="NO_4-NO_7" title="47">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>48</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_8" id="NO_4-NO_8" data-mini="true"><label for="NO_4-NO_8" title="48">0.00</label></fieldset></td><td class="td-bgcolor"><span>49</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_9" id="NO_4-NO_9" data-mini="true"><label for="NO_4-NO_9" title="49">0.00</label></fieldset></td><td class="td-bgcolor"><span>50</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_0" id="NO_5-NO_0" data-mini="true"><label for="NO_5-NO_0" title="50">0.00</label></fieldset></td><td class="td-bgcolor"><span>51</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_1" id="NO_5-NO_1" data-mini="true"><label for="NO_5-NO_1" title="51">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>52</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_2" id="NO_5-NO_2" data-mini="true"><label for="NO_5-NO_2" title="52">0.00</label></fieldset></td><td class="td-bgcolor"><span>53</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_3" id="NO_5-NO_3" data-mini="true"><label for="NO_5-NO_3" title="53">0.00</label></fieldset></td><td class="td-bgcolor"><span>54</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_4" id="NO_5-NO_4" data-mini="true"><label for="NO_5-NO_4" title="54">0.00</label></fieldset></td><td class="td-bgcolor"><span>55</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_5" id="NO_5-NO_5" data-mini="true"><label for="NO_5-NO_5" title="55">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>56</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_6" id="NO_5-NO_6" data-mini="true"><label for="NO_5-NO_6" title="56">0.00</label></fieldset></td><td class="td-bgcolor"><span>57</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_7" id="NO_5-NO_7" data-mini="true"><label for="NO_5-NO_7" title="57">0.00</label></fieldset></td><td class="td-bgcolor"><span>58</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_8" id="NO_5-NO_8" data-mini="true"><label for="NO_5-NO_8" title="58">0.00</label></fieldset></td><td class="td-bgcolor"><span>59</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_9" id="NO_5-NO_9" data-mini="true"><label for="NO_5-NO_9" title="59">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>60</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_0" id="NO_6-NO_0" data-mini="true"><label for="NO_6-NO_0" title="60">0.00</label></fieldset></td><td class="td-bgcolor"><span>61</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_1" id="NO_6-NO_1" data-mini="true"><label for="NO_6-NO_1" title="61">0.00</label></fieldset></td><td class="td-bgcolor"><span>62</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_2" id="NO_6-NO_2" data-mini="true"><label for="NO_6-NO_2" title="62">0.00</label></fieldset></td><td class="td-bgcolor"><span>63</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_3" id="NO_6-NO_3" data-mini="true"><label for="NO_6-NO_3" title="63">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>64</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_4" id="NO_6-NO_4" data-mini="true"><label for="NO_6-NO_4" title="64">0.00</label></fieldset></td><td class="td-bgcolor"><span>65</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_5" id="NO_6-NO_5" data-mini="true"><label for="NO_6-NO_5" title="65">0.00</label></fieldset></td><td class="td-bgcolor"><span>66</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_6" id="NO_6-NO_6" data-mini="true"><label for="NO_6-NO_6" title="66">0.00</label></fieldset></td><td class="td-bgcolor"><span>67</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_7" id="NO_6-NO_7" data-mini="true"><label for="NO_6-NO_7" title="67">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>68</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_8" id="NO_6-NO_8" data-mini="true"><label for="NO_6-NO_8" title="68">0.00</label></fieldset></td><td class="td-bgcolor"><span>69</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_9" id="NO_6-NO_9" data-mini="true"><label for="NO_6-NO_9" title="69">0.00</label></fieldset></td><td class="td-bgcolor"><span>70</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_0" id="NO_7-NO_0" data-mini="true"><label for="NO_7-NO_0" title="70">0.00</label></fieldset></td><td class="td-bgcolor"><span>71</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_1" id="NO_7-NO_1" data-mini="true"><label for="NO_7-NO_1" title="71">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>72</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_2" id="NO_7-NO_2" data-mini="true"><label for="NO_7-NO_2" title="72">0.00</label></fieldset></td><td class="td-bgcolor"><span>73</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_3" id="NO_7-NO_3" data-mini="true"><label for="NO_7-NO_3" title="73">0.00</label></fieldset></td><td class="td-bgcolor"><span>74</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_4" id="NO_7-NO_4" data-mini="true"><label for="NO_7-NO_4" title="74">0.00</label></fieldset></td><td class="td-bgcolor"><span>75</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_5" id="NO_7-NO_5" data-mini="true"><label for="NO_7-NO_5" title="75">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>76</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_6" id="NO_7-NO_6" data-mini="true"><label for="NO_7-NO_6" title="76">0.00</label></fieldset></td><td class="td-bgcolor"><span>77</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_7" id="NO_7-NO_7" data-mini="true"><label for="NO_7-NO_7" title="77">0.00</label></fieldset></td><td class="td-bgcolor"><span>78</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_8" id="NO_7-NO_8" data-mini="true"><label for="NO_7-NO_8" title="78">0.00</label></fieldset></td><td class="td-bgcolor"><span>79</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_9" id="NO_7-NO_9" data-mini="true"><label for="NO_7-NO_9" title="79">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>80</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_0" id="NO_8-NO_0" data-mini="true"><label for="NO_8-NO_0" title="80">0.00</label></fieldset></td><td class="td-bgcolor"><span>81</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_1" id="NO_8-NO_1" data-mini="true"><label for="NO_8-NO_1" title="81">0.00</label></fieldset></td><td class="td-bgcolor"><span>82</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_2" id="NO_8-NO_2" data-mini="true"><label for="NO_8-NO_2" title="82">0.00</label></fieldset></td><td class="td-bgcolor"><span>83</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_3" id="NO_8-NO_3" data-mini="true"><label for="NO_8-NO_3" title="83">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>84</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_4" id="NO_8-NO_4" data-mini="true"><label for="NO_8-NO_4" title="84">0.00</label></fieldset></td><td class="td-bgcolor"><span>85</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_5" id="NO_8-NO_5" data-mini="true"><label for="NO_8-NO_5" title="85">0.00</label></fieldset></td><td class="td-bgcolor"><span>86</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_6" id="NO_8-NO_6" data-mini="true"><label for="NO_8-NO_6" title="86">0.00</label></fieldset></td><td class="td-bgcolor"><span>87</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_7" id="NO_8-NO_7" data-mini="true"><label for="NO_8-NO_7" title="87">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>88</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_8" id="NO_8-NO_8" data-mini="true"><label for="NO_8-NO_8" title="88">0.00</label></fieldset></td><td class="td-bgcolor"><span>89</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_9" id="NO_8-NO_9" data-mini="true"><label for="NO_8-NO_9" title="89">0.00</label></fieldset></td><td class="td-bgcolor"><span>90</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_0" id="NO_9-NO_0" data-mini="true"><label for="NO_9-NO_0" title="90">0.00</label></fieldset></td><td class="td-bgcolor"><span>91</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_1" id="NO_9-NO_1" data-mini="true"><label for="NO_9-NO_1" title="91">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>92</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_2" id="NO_9-NO_2" data-mini="true"><label for="NO_9-NO_2" title="92">0.00</label></fieldset></td><td class="td-bgcolor"><span>93</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_3" id="NO_9-NO_3" data-mini="true"><label for="NO_9-NO_3" title="93">0.00</label></fieldset></td><td class="td-bgcolor"><span>94</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_4" id="NO_9-NO_4" data-mini="true"><label for="NO_9-NO_4" title="94">0.00</label></fieldset></td><td class="td-bgcolor"><span>95</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_5" id="NO_9-NO_5" data-mini="true"><label for="NO_9-NO_5" title="95">0.00</label></fieldset></td></tr><tr class="ssc"><td class="td-bgcolor"><span>96</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_6" id="NO_9-NO_6" data-mini="true"><label for="NO_9-NO_6" title="96">0.00</label></fieldset></td><td class="td-bgcolor"><span>97</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_7" id="NO_9-NO_7" data-mini="true"><label for="NO_9-NO_7" title="97">0.00</label></fieldset></td><td class="td-bgcolor"><span>98</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_8" id="NO_9-NO_8" data-mini="true"><label for="NO_9-NO_8" title="98">0.00</label></fieldset></td><td class="td-bgcolor"><span>99</span></td><td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_9" id="NO_9-NO_9" data-mini="true"><label for="NO_9-NO_9" title="99">0.00</label></fieldset></td></tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br><br>
		</div>
		<input type="hidden" id="play_text" value="${msg['title.ssc.EDW']} ${msg['label.ssc.play.WQ']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
</body>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>