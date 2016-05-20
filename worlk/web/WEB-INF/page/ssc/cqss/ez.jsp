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
	if(betOn=='ERZI_QS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EZ']} ${msg['label.ssc.play.QS']}"));
	}
	if(betOn=='ERZI_ZS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EZ']} ${msg['label.ssc.play.ZS']}"));
	}
	if(betOn=='ERZI_HS'){
		$("#play_text").val(replaceAllHtml("${msg['title.ssc.EZ']} ${msg['label.ssc.play.HS']}"));
	}
	if(flag==1){
		var str = "changeBetOn('" + betOn + "')";
		$("[onclick='" + str + "']").addClass("ui-btn-active");
	}else{
		getRateInfo($("#gameId").val(),$("#bon").val(),0);
	}
}
var uhc = "${sessionScope.SSC_USER_SESSION.handype}".split(",");
var cht = "${sessionScope.SSC_USER_SESSION.cht}";
</script>
</head>
<c:set var="page_title" value="${msg['title.ssc.SSC']}" scope="request"/>
<body>
	<%-- 广东快乐十分厅 --%>
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
			        <li><a href="#" ${obj.nav == 1 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZI_QS')">${msg['label.ssc.play.QS']}</a></li>
			        <li><a href="#" ${obj.nav == 2 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZI_ZS')">${msg['label.ssc.play.ZS']}</a></li>
			        <li><a href="#" ${obj.nav == 3 ? "class='ui-btn-active'" : ""} data-ajax="false" onclick="changeBetOn('ERZI_HS')">${msg['label.ssc.play.HS']}</a></li>
			    </ul>
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
			     <tr class="ssc">
			      <td class="td-bgcolor"><span>00</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_0" id="NO_0-NO_0" data-mini="true"><label for="NO_0-NO_0" title="00">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>01</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_1" id="NO_0-NO_1" data-mini="true"><label for="NO_0-NO_1" title="01">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>02</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_2" id="NO_0-NO_2" data-mini="true"><label for="NO_0-NO_2" title="02">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>03</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_3" id="NO_0-NO_3" data-mini="true"><label for="NO_0-NO_3" title="03">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>04</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_4" id="NO_0-NO_4" data-mini="true"><label for="NO_0-NO_4" title="04">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>05</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_5" id="NO_0-NO_5" data-mini="true"><label for="NO_0-NO_5" title="05">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>06</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_6" id="NO_0-NO_6" data-mini="true"><label for="NO_0-NO_6" title="06">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>07</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_7" id="NO_0-NO_7" data-mini="true"><label for="NO_0-NO_7" title="07">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>08</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_8" id="NO_0-NO_8" data-mini="true"><label for="NO_0-NO_8" title="08">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>09</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_0-NO_9" id="NO_0-NO_9" data-mini="true"><label for="NO_0-NO_9" title="09">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>11</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_1" id="NO_1-NO_1" data-mini="true"><label for="NO_1-NO_1" title="11">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>12</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_2" id="NO_1-NO_2" data-mini="true"><label for="NO_1-NO_2" title="12">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>13</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_3" id="NO_1-NO_3" data-mini="true"><label for="NO_1-NO_3" title="13">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>14</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_4" id="NO_1-NO_4" data-mini="true"><label for="NO_1-NO_4" title="14">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>15</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_5" id="NO_1-NO_5" data-mini="true"><label for="NO_1-NO_5" title="15">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>16</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_6" id="NO_1-NO_6" data-mini="true"><label for="NO_1-NO_6" title="16">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>17</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_7" id="NO_1-NO_7" data-mini="true"><label for="NO_1-NO_7" title="17">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>18</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_8" id="NO_1-NO_8" data-mini="true"><label for="NO_1-NO_8" title="18">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>19</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_1-NO_9" id="NO_1-NO_9" data-mini="true"><label for="NO_1-NO_9" title="19">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>22</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_2" id="NO_2-NO_2" data-mini="true"><label for="NO_2-NO_2" title="22">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>23</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_3" id="NO_2-NO_3" data-mini="true"><label for="NO_2-NO_3" title="23">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>24</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_4" id="NO_2-NO_4" data-mini="true"><label for="NO_2-NO_4" title="24">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>25</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_5" id="NO_2-NO_5" data-mini="true"><label for="NO_2-NO_5" title="25">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>26</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_6" id="NO_2-NO_6" data-mini="true"><label for="NO_2-NO_6" title="26">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>27</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_7" id="NO_2-NO_7" data-mini="true"><label for="NO_2-NO_7" title="27">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>28</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_8" id="NO_2-NO_8" data-mini="true"><label for="NO_2-NO_8" title="28">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>29</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_2-NO_9" id="NO_2-NO_9" data-mini="true"><label for="NO_2-NO_9" title="29">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>33</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_3" id="NO_3-NO_3" data-mini="true"><label for="NO_3-NO_3" title="33">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>34</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_4" id="NO_3-NO_4" data-mini="true"><label for="NO_3-NO_4" title="34">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>35</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_5" id="NO_3-NO_5" data-mini="true"><label for="NO_3-NO_5" title="35">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>36</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_6" id="NO_3-NO_6" data-mini="true"><label for="NO_3-NO_6" title="36">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>37</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_7" id="NO_3-NO_7" data-mini="true"><label for="NO_3-NO_7" title="37">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>38</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_8" id="NO_3-NO_8" data-mini="true"><label for="NO_3-NO_8" title="38">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>39</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_3-NO_9" id="NO_3-NO_9" data-mini="true"><label for="NO_3-NO_9" title="39">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>44</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_4" id="NO_4-NO_4" data-mini="true"><label for="NO_4-NO_4" title="44">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>45</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_5" id="NO_4-NO_5" data-mini="true"><label for="NO_4-NO_5" title="45">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>46</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_6" id="NO_4-NO_6" data-mini="true"><label for="NO_4-NO_6" title="46">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>47</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_7" id="NO_4-NO_7" data-mini="true"><label for="NO_4-NO_7" title="47">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>48</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_8" id="NO_4-NO_8" data-mini="true"><label for="NO_4-NO_8" title="48">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>49</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_4-NO_9" id="NO_4-NO_9" data-mini="true"><label for="NO_4-NO_9" title="49">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>55</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_5" id="NO_5-NO_5" data-mini="true"><label for="NO_5-NO_5" title="55">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>56</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_6" id="NO_5-NO_6" data-mini="true"><label for="NO_5-NO_6" title="56">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>57</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_7" id="NO_5-NO_7" data-mini="true"><label for="NO_5-NO_7" title="57">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>58</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_8" id="NO_5-NO_8" data-mini="true"><label for="NO_5-NO_8" title="58">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>59</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_5-NO_9" id="NO_5-NO_9" data-mini="true"><label for="NO_5-NO_9" title="59">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>66</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_6" id="NO_6-NO_6" data-mini="true"><label for="NO_6-NO_6" title="66">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>67</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_7" id="NO_6-NO_7" data-mini="true"><label for="NO_6-NO_7" title="67">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>68</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_8" id="NO_6-NO_8" data-mini="true"><label for="NO_6-NO_8" title="68">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>69</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_6-NO_9" id="NO_6-NO_9" data-mini="true"><label for="NO_6-NO_9" title="69">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>77</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_7" id="NO_7-NO_7" data-mini="true"><label for="NO_7-NO_7" title="77">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>78</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_8" id="NO_7-NO_8" data-mini="true"><label for="NO_7-NO_8" title="78">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>79</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_7-NO_9" id="NO_7-NO_9" data-mini="true"><label for="NO_7-NO_9" title="79">0.00</label></fieldset></td>
			    </tr>
			    <tr class="ssc">
			      <td class="td-bgcolor"><span>88</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_8" id="NO_8-NO_8" data-mini="true"><label for="NO_8-NO_8" title="88">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>89</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_8-NO_9" id="NO_8-NO_9" data-mini="true"><label for="NO_8-NO_9" title="89">0.00</label></fieldset></td>
			      <td class="td-bgcolor"><span>99</span></td>
			      <td><fieldset data-role="controlgroup" data-type="horizontal"><input type="checkbox" name="NO_9-NO_9" id="NO_9-NO_9" data-mini="true"><label for="NO_9-NO_9" title="99">0.00</label></fieldset></td>
				  <td></td><td></td>
			    </tr>
			  </tbody>
			</table>
			</div>
			</div>
			<br><br>
		</div>
		<input type="hidden" id="play_text" value="${msg['title.ssc.EZ']} ${msg['label.ssc.play.QS']}">
	</section>
	<%@ include file="/WEB-INF/page/ssc/com_bet.jsp" %>
</body>
<script type="text/javascript">
	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>