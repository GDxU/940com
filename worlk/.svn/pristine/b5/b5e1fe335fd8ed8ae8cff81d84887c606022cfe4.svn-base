<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type= "text/javascript">
function toRateInfoPage(){
	$.mobile.changePage("#rateInfoPage", "slideup");
}
</script>
<div data-role="page" id="toBet" data-eventbind="N">
	<c:set var="page_type" value="3" scope="request"/>
	<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
	<div data-role="content">
	<form action="${ctx}/ssc/addOrder" data-ajax="false">
		<div class="fhold">
			<div class="divtitle">
				<span class="iconspan"></span><span class="spnmar">个人资讯</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="border:none; width:100%;">
					<tr style="border:none;">
						<td class="titled" style="border:none;">帐号</td>
						<td align="right" style="border:none;" class="detailsb"><span id="anid"></span></td>
					</tr>
					<tr style="border:none;">
						<td class="titled" style="border:none;">余额</td>
						<td align="right" class="detailsb" style="border:none;"><span id="acid"></span></td>
					</tr>
				</table>
			</div>
		</div>
		<input type="hidden" id="gameId" name="gameId" value="${obj.gameId}" /> 
		<input type="hidden" id="hcType" name="hcType" value="A"/> 
		<input type="hidden" id="bon" name="bon" value="${obj.betOn}" /> 
		<input type="hidden" id="issue" name="issue" /> 
		<input type="hidden" name="isChange" value="0">
		<input type="hidden" name="mawh" id="mawh">
		<div class="fhold">
			<div class="divtitle">
				<span class="spnmar mgspan">${msg['label.ssc.xiazhu']}</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" id="orderTable" cellpadding="0" cellspacing="0" style="border:none; width:100%;">
					<thead>
						<tr class="trhight" style="border:none;">
							<td class="titled" colspan="2" style="border:none;font-size:12px;"> 期数:<span id="isid"></span> &nbsp; &nbsp;盘口:<span id="hcid"></span><span style="float:right;"><font color="red">*</font>最高派{[{5b2p}]}为:<font color="red"><span id="maxws"></span></font>&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<table style="border:none; width:100%;">
					<tr class="trhight" style="border:none;">
						<td align="right" class='tdselect' style='border:none;font-size:14px;'><span><input type='number' min='1' max='50000' id='serial_money' class='numb_px' placeholder="每注金额"></span></td>
					</tr>
					<tr class="trhight" style="border:none;"><td align="center"></td></tr>
					<tr class="trhight" style="border:none;"><td align="center"></td></tr>
				</table>
			</div>
		</div>
	</form>
	</div>
	<div data-role="footer" class="ui-footer ui-footer-fixed">
		<div class= "ui-grid-a">
		 <div class= "ui-btn5 ui-block-a">
			<a href="#" id="cancelOrderBtn" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">取消</a>
		 </div>
		 <div class= "ui-btn4 ui-block-b ui-btn-yes">
		 	<a href="#" id="submitOrderBtn" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">确认</a>
		 </div>
		</div>
	</div>		
</div>
<div data-role="page" id="showOrder" data-eventbind="N">
	<c:set var="page_type" value="3" scope="request"/>
	<%@ include file="/WEB-INF/page/ssc/com_header.jsp" %>
	<div data-role="content">
		<div class="fhold">
			<div class="divtitle">
				<span class="spnmar mgspan">${msg['label.ssc.confirmbet']}</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" id="showOrderTable" cellpadding="0" cellspacing="0" style="border:none; width:100%;">
					<thead>
						<tr class="trhight" style="border:none;">
							<td class="titled" colspan="2" style="border:none;font-size:12px;"><span id="totalOrders"></span></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div data-role="footer" class="ui-footer ui-footer-fixed">
		<div class= "ui-grid-a">
		 <div class= "ui-btn5 ui-block-a">
			<a href="#" id="cancelBtn" onclick="toRateInfoPage()" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">取消</a>
		 </div>
		 <div class= "ui-btn4 ui-block-b ui-btn-yes">
		 	<button href="#" id="submitBtn" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">确认</button>
		 </div>
		</div>
	</div>	
</div>