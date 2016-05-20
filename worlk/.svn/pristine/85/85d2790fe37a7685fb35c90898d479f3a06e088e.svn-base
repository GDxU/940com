<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<input type="hidden" name="balance" id="balance" value="${sessionScope.SPORT_USER_SESSION.balance}"></input>
<div data-role="panel" id="user-center"  data-position="right" data-theme="a">
	<div data-role="header" data-theme="b"> 
		<h2 class="ui-tittle-icon-ftball">${msg['label.sport.fb.stitle']}</h2>
	</div>
	 <div data-role="content" style="padding:0 !important">
		<div data-role="listview" class="reset" data-mini="true">
            <li data-icon="false"><a class="li_height" style="background-color:transparent">
                <select id="c_market">
                    <option value="1">${msg['label.sport.fb.mk.hk']}</option>
                    <option value="2">${msg['label.sport.fb.mk.id']}</option>
                    <option value="3">${msg['label.sport.fb.mk.my']}</option>
                    <option value="4">${msg['label.sport.fb.mk.ou']}</option>
                </select>
                </a>
            </li>
            <li><a class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-accname icoc-all"></span>${sessionScope.SPORT_USER_SESSION.accoutName}</a><span class="ui-btn ui-corner-all ui-icon-power ui-btn-icon-notext ui-btn-right" style="border: 1px solid rgba(0,0,0,0.3); margin-top: 7px; margin-right: 1.5px;" id="logout"></span></li>
			<li data-icon="refresh"><a href="javascript:refreshBalance(2);" class="li_height" style="background-color:transparent"><span class="ssc-balance icoc-all"></span>${sessionScope.SPORT_USER_SESSION.currency}: <span class="user-balance">加载中...</span></a></li>
			<li><a href="${ctx}/sport/tradingInfo/1" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-betinfo icoc-all"></span>${msg['label.sport.betinfo']}</a></li>
			<li><a href="${ctx}/sport/history" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-acchistory icoc-all"></span>${msg['label.sport.history']}</a></li>
			<li><a href="${ctx}/sport/matchResult" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-result icoc-all"></span>${msg['label.sport.results']}</a></li>
			<li><a href="${ctx}/sport/sportGameRules" class="li_height" data-ajax="false" style="background-color:transparent"><span class="ssc-gamerules icoc-all"></span>${msg['label.sport.rules']}</a></li>
			<li><a href="${ctx}/sport/message" data-ajax="false" class="li_height" style="background-color:transparent"><span class="ssc-affiche icoc-all"></span>${msg['label.sport.announcement']}</a></li>
		</div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $("#c_market").on("change", function () {
            ss.removeItem("m");
            ss.setItem("m", $(this).val());
			try {
			   reqData();
			}catch (e) {
			}            
        });

        if (ss.getItem("m") == null) {
            ss.setItem("m", $("#c_market").val());
        } else {
            $("#c_market").val(ss.getItem("m"));
            $("#c_market").selectmenu("refresh");
        }
    });
</script>
