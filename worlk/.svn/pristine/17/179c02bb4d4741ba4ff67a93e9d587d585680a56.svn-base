<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-role="page" id="toBet" data-eventbind="N">
	<c:set var="page_type" value="3" scope="request"/>
	<%@ include file="/WEB-INF/page/hkc/com_header.jsp" %>
	<div data-role="content">
	<form action="${ctx}/hkc/addOrder" data-ajax="false">
		<input type="hidden" name="amount" id="p_amount" value=""/>
		<input type="hidden" name="betAmount" id="p_betAmount" value=""/>
		<input type="hidden" name="betBall" id="p_betBall" value=""/>
		<input type="hidden" name="betBallStr" id="p_betBallStr" value=""/>
		<input type="hidden" name="betBallTou" id="p_betBallTou" value=""/>
		<input type="hidden" name="betBallTuo" id="p_betBallTuo" value=""/>
		<input type="hidden" name="betType" id="p_betType" value=""/>
		<input type="hidden" name="gameCode" id="p_gameCode" value=""/>
		<input type="hidden" name="isChange" id="p_isChange" value="0"/>
		<input type="hidden" name="issue" id="p_issue" value="${obj.iss}"/>
		<input type="hidden" name="noteCount" id="p_noteCount" value=""/>
		<input type="hidden" name="passType" id="p_passType" value=""/>
		<input type="hidden" name="pgameCode" id="p_pgameCode" value=""/>
		<input type="hidden" name="rate" id="p_rate" value=""/>
		<input type="hidden" name="rate2" id="p_rate2" value=""/>
		<input type="hidden" name="rateAll" id="p_rateAll" value=""/>
		<input type="hidden" name="rateAll2" id="p_rateAll2" value=""/>
		<input type="hidden" name="rateStr" id="p_rateStr" value=""/>
		<input type="hidden" name="rateTou" id="p_rateTou" value=""/>
		<input type="hidden" name="rateTuo" id="p_rateTuo" value=""/>
		<input type="hidden" name="tuoType" id="p_tuoType" value=""/>
		<div class="fhold">
			<div class="divtitle">
				<span class="iconspan"></span><span class="spnmar">个人资讯</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="border:none; width:100%;">
					<tr style="border:none;">
						<td class="titled" style="border:none;">帐{[{5Y+3}]}</td>
						<td align="right" style="border:none;" class="detailsb"><span id="anid"></span></td>
					</tr>
					<tr style="border:none;">
						<td class="titled" style="border:none;">余额</td>
						<td align="right" class="detailsb" style="border:none;"><span id="acid"></span></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="fhold">
			<div class="divtitle">
				<span class="spnmar mgspan">下{[{5rOo}]}</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" id="orderTable" cellpadding="0" cellspacing="0" style="border:none; width:100%;">
					<thead>
						<tr class="trhight" style="border:none;">
							<td class="titled" colspan="2" style="border:none;font-size:12px;">
								 {[{5pyf}]}数:<span id="isid">${obj.iss}</span>
								  &nbsp; &nbsp;
								<span id="hcid"></span>
							</td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id="padRight10">共计：<span id="zdn"></span> {[{5rOo}]}</div>
				<table style="border:none; width:100%;">
					<tr class="trhight" style="border:none;">
						<td align="right" class='tdselect' style='border:none;font-size:14px;'><span><input type='number' min='1' max='50000' id='amount' class='numb_px' placeholder="每{[{5rOo}]}{[{6YeR}]}额"></span></td>
					</tr>
				</table>
				<div id="zdl"></div>
				<table style="border:none; width:100%;">
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
			<a href="#" id="cancelBtn" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">取消</a>
		 </div>
		 <div class= "ui-btn4 ui-block-b">
		 	<button href="#" id="submitBtn" data-rel="page" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">确认</button>
		 </div>
		</div>
	</div>		
</div>