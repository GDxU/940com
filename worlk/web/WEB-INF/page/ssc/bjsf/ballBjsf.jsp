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
	$("label").addClass("ui-btn-z");//pei率按钮缩小
	$("label").css({"font-size":"10px"});
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
    $("#hcth").on("click",function(){
    	if(hca == 1){
	    	$.mobile.changePage("#hctm", "slideup");
    	}
    });
    showhc();                  
});
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.BJKLC']}" scope="request"/>
<body>
	<div  data-role="page" id="rateInfoPage">
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
		    <div class="table-cotent-lottery">
			<table border="1" class="hdptable">
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
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">01</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1" id="NO_1" data-mini="true"><label title="${msg['label.ssc.ball.NO_1']}" for="NO_1">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">02</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2" id="NO_2" data-mini="true"><label title="${msg['label.ssc.ball.NO_2']}" for="NO_2">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">03</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3" id="NO_3" data-mini="true"><label title="${msg['label.ssc.ball.NO_3']}" for="NO_3">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">04</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4" id="NO_4" data-mini="true"><label title="${msg['label.ssc.ball.NO_4']}" for="NO_4">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">05</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5" id="NO_5" data-mini="true"><label title="${msg['label.ssc.ball.NO_5']}" for="NO_5">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">06</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6" id="NO_6" data-mini="true"><label title="${msg['label.ssc.ball.NO_6']}" for="NO_6">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">07</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7" id="NO_7" data-mini="true"><label title="${msg['label.ssc.ball.NO_7']}" for="NO_7">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">08</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8" id="NO_8" data-mini="true"><label title="${msg['label.ssc.ball.NO_8']}" for="NO_8">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">09</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9" id="NO_9" data-mini="true"><label title="${msg['label.ssc.ball.NO_9']}" for="NO_9">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">10</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_10" id="NO_10" data-mini="true"><label title="${msg['label.ssc.ball.NO_10']}" for="NO_10">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">11</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_11" id="NO_11" data-mini="true"><label title="${msg['label.ssc.ball.NO_11']}" for="NO_11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">12</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_12" id="NO_12" data-mini="true"><label title="${msg['label.ssc.ball.NO_12']}" for="NO_12">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">13</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_13" id="NO_13" data-mini="true"><label title="${msg['label.ssc.ball.NO_13']}" for="NO_13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">14</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_14" id="NO_14" data-mini="true"><label title="${msg['label.ssc.ball.NO_14']}" for="NO_14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">15</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_15" id="NO_15" data-mini="true"><label title="${msg['label.ssc.ball.NO_15']}" for="NO_15">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">16</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_16" id="NO_16" data-mini="true"><label title="${msg['label.ssc.ball.NO_16']}" for="NO_16">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">17</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_17" id="NO_17" data-mini="true"><label title="${msg['label.ssc.ball.NO_17']}" for="NO_17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">18</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_18" id="NO_18" data-mini="true"><label title="${msg['label.ssc.ball.NO_18']}" for="NO_18">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">19</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_19" id="NO_19" data-mini="true"><label title="${msg['label.ssc.ball.NO_19']}" for="NO_19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">20</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_20" id="NO_20" data-mini="true"><label title="${msg['label.ssc.ball.NO_20']}" for="NO_20">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">21</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_21" id="NO_21" data-mini="true"><label title="${msg['label.ssc.ball.NO_21']}" for="NO_21">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">22</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_22" id="NO_22" data-mini="true"><label title="${msg['label.ssc.ball.NO_22']}" for="NO_22">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">23</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_23" id="NO_23" data-mini="true"><label title="${msg['label.ssc.ball.NO_23']}" for="NO_23">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">24</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_24" id="NO_24" data-mini="true"><label title="${msg['label.ssc.ball.NO_24']}" for="NO_24">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">25</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_25" id="NO_25" data-mini="true"><label title="${msg['label.ssc.ball.NO_25']}" for="NO_25">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">26</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_26" id="NO_26" data-mini="true"><label title="${msg['label.ssc.ball.NO_26']}" for="NO_26">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">27</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_27" id="NO_27" data-mini="true"><label title="${msg['label.ssc.ball.NO_27']}" for="NO_27">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">28</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_28" id="NO_28" data-mini="true"><label title="${msg['label.ssc.ball.NO_28']}" for="NO_28">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">29</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_29" id="NO_29" data-mini="true"><label title="${msg['label.ssc.ball.NO_29']}" for="NO_29">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">30</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_30" id="NO_30" data-mini="true"><label title="${msg['label.ssc.ball.NO_30']}" for="NO_30">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">31</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_31" id="NO_31" data-mini="true"><label title="${msg['label.ssc.ball.NO_31']}" for="NO_31">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">32</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_32" id="NO_32" data-mini="true"><label title="${msg['label.ssc.ball.NO_32']}" for="NO_32">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">33</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_33" id="NO_33" data-mini="true"><label title="${msg['label.ssc.ball.NO_33']}" for="NO_33">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">34</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_34" id="NO_34" data-mini="true"><label title="${msg['label.ssc.ball.NO_34']}" for="NO_34">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">35</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_35" id="NO_35" data-mini="true"><label title="${msg['label.ssc.ball.NO_35']}" for="NO_35">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">36</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_36" id="NO_36" data-mini="true"><label title="${msg['label.ssc.ball.NO_36']}" for="NO_36">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">37</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_37" id="NO_37" data-mini="true"><label title="${msg['label.ssc.ball.NO_37']}" for="NO_37">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">38</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_38" id="NO_38" data-mini="true"><label title="${msg['label.ssc.ball.NO_38']}" for="NO_38">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">39</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_39" id="NO_39" data-mini="true"><label title="${msg['label.ssc.ball.NO_39']}" for="NO_39">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">40</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_40" id="NO_40" data-mini="true"><label title="${msg['label.ssc.ball.NO_40']}" for="NO_40">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">41</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_41" id="NO_41" data-mini="true"><label title="${msg['label.ssc.ball.NO_41']}" for="NO_41">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">42</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_42" id="NO_42" data-mini="true"><label title="${msg['label.ssc.ball.NO_42']}" for="NO_42">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">43</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_43" id="NO_43" data-mini="true"><label title="${msg['label.ssc.ball.NO_43']}" for="NO_43">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">44</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_44" id="NO_44" data-mini="true"><label title="${msg['label.ssc.ball.NO_44']}" for="NO_44">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">45</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_45" id="NO_45" data-mini="true"><label title="${msg['label.ssc.ball.NO_45']}" for="NO_45">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">46</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_46" id="NO_46" data-mini="true"><label title="${msg['label.ssc.ball.NO_46']}" for="NO_46">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">47</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_47" id="NO_47" data-mini="true"><label title="${msg['label.ssc.ball.NO_47']}" for="NO_47">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">48</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_48" id="NO_48" data-mini="true"><label title="${msg['label.ssc.ball.NO_48']}" for="NO_48">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">49</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_49" id="NO_49" data-mini="true"><label title="${msg['label.ssc.ball.NO_49']}" for="NO_49">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">50</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_50" id="NO_50" data-mini="true"><label title="${msg['label.ssc.ball.NO_50']}" for="NO_50">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">51</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_51" id="NO_51" data-mini="true"><label title="${msg['label.ssc.ball.NO_51']}" for="NO_51">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">52</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_52" id="NO_52" data-mini="true"><label title="${msg['label.ssc.ball.NO_52']}" for="NO_52">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">53</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_53" id="NO_53" data-mini="true"><label title="${msg['label.ssc.ball.NO_53']}" for="NO_53">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">54</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_54" id="NO_54" data-mini="true"><label title="${msg['label.ssc.ball.NO_54']}" for="NO_54">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">55</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_55" id="NO_55" data-mini="true"><label title="${msg['label.ssc.ball.NO_55']}" for="NO_55">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">56</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_56" id="NO_56" data-mini="true"><label title="${msg['label.ssc.ball.NO_56']}" for="NO_56">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">57</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_57" id="NO_57" data-mini="true"><label title="${msg['label.ssc.ball.NO_57']}" for="NO_57">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">58</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_58" id="NO_58" data-mini="true"><label title="${msg['label.ssc.ball.NO_58']}" for="NO_58">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">59</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_59" id="NO_59" data-mini="true"><label title="${msg['label.ssc.ball.NO_59']}" for="NO_59">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">60</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_60" id="NO_60" data-mini="true"><label title="${msg['label.ssc.ball.NO_60']}" for="NO_60">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">61</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_61" id="NO_61" data-mini="true"><label title="${msg['label.ssc.ball.NO_61']}" for="NO_61">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">62</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_62" id="NO_62" data-mini="true"><label title="${msg['label.ssc.ball.NO_62']}" for="NO_62">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">63</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_63" id="NO_63" data-mini="true"><label title="${msg['label.ssc.ball.NO_63']}" for="NO_63">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">64</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_64" id="NO_64" data-mini="true"><label title="${msg['label.ssc.ball.NO_64']}" for="NO_64">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">65</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_65" id="NO_65" data-mini="true"><label title="${msg['label.ssc.ball.NO_65']}" for="NO_65">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">66</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_66" id="NO_66" data-mini="true"><label title="${msg['label.ssc.ball.NO_66']}" for="NO_66">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">67</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_67" id="NO_67" data-mini="true"><label title="${msg['label.ssc.ball.NO_67']}" for="NO_67">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">68</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_68" id="NO_68" data-mini="true"><label title="${msg['label.ssc.ball.NO_68']}" for="NO_68">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">69</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_69" id="NO_69" data-mini="true"><label title="${msg['label.ssc.ball.NO_69']}" for="NO_69">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">70</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_70" id="NO_70" data-mini="true"><label title="${msg['label.ssc.ball.NO_70']}" for="NO_70">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">71</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_71" id="NO_71" data-mini="true"><label title="${msg['label.ssc.ball.NO_71']}" for="NO_71">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">72</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_72" id="NO_72" data-mini="true"><label title="${msg['label.ssc.ball.NO_72']}" for="NO_72">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">73</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_73" id="NO_73" data-mini="true"><label title="${msg['label.ssc.ball.NO_73']}" for="NO_73">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">74</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_74" id="NO_74" data-mini="true"><label title="${msg['label.ssc.ball.NO_74']}" for="NO_74">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">75</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_75" id="NO_75" data-mini="true"><label title="${msg['label.ssc.ball.NO_75']}" for="NO_75">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">76</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_76" id="NO_76" data-mini="true"><label title="${msg['label.ssc.ball.NO_76']}" for="NO_76">0.00</label></fieldset></td>
			    </tr>
			    <tr class="klc">
			      <td class="td-bgcolor"><span class="bjklc">77</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_77" id="NO_77" data-mini="true"><label title="${msg['label.ssc.ball.NO_77']}" for="NO_77">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">78</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_78" id="NO_78" data-mini="true"><label title="${msg['label.ssc.ball.NO_78']}" for="NO_78">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">79</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_79" id="NO_79" data-mini="true"><label title="${msg['label.ssc.ball.NO_79']}" for="NO_79">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span class="bjklc">80</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_80" id="NO_80" data-mini="true"><label title="${msg['label.ssc.ball.NO_80']}" for="NO_80">0.00</label></fieldset></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br>
		</div>
		<%@ include file="/WEB-INF/page/ssc/com_footer.jsp" %>
		<input type="hidden" id="play_text" value="${msg['label.ssc.play.ZHENGMA']}">
	</div>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
	<%@ include file="/WEB-INF/page/ssc/ballLong.jsp" %>
</body>
<script type="text/javascript">
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>