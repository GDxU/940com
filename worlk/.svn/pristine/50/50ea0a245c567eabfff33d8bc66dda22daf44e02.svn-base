<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-role="page" id="toBet" data-eventbind="N">
	<c:set var="page_type" value="3" scope="request"/>
	<%@ include file="/WEB-INF/page/qxc/com_header.jsp" %>
	<div data-role="content">
	<form action="${ctx}/qxc/addOrder" data-ajax="false">
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
		<input type="hidden" id="betAmount" name="betAmount" value=""/>
		<input type="hidden" id="betBall" name="betBall" value=""/>
		<input type="hidden" id="gameCode" name="gameCode" value="${obj.gameCode}"/>
		<input type="hidden" id="isChange" name="isChange" value="0"/>
		<input type="hidden" id="issue" name="issue" value=""/>
		<input type="hidden" id="pgameCode" name="pgameCode" value="${obj.pgameCode}"/>
		<input type="hidden" id="rateAll" name="rateAll" value=""/>
		<input type="hidden" id="hcType" name="hcType" value=""/>
		<input type="hidden" id="betType" name="betType" value=""/>
		<input type="hidden" id="comm" name="comm" value="" />
		<input type="hidden" id="zh" value="0"/>
		<input type="hidden" id="mi" value=""/>
		<input type="hidden" id="mx" value=""/>
		<input type="hidden" id="tm" value=""/>
		<div class="fhold">
			<div class="divtitle">
				<span class="spnmar mgspan">{[{5LiL}]}注</span>
			</div>
			<div class="divtable">
				<table width="100%" border="0" id="orderTable" cellpadding="0" cellspacing="0" style="border:none; width:100%;">
					<thead>
						<tr class="trhight" style="border:none;">
							<td class="titled" colspan="2" style="border:none;font-size:12px;"> 期数:<span id="isid">${obj.iss}</span><%-- &nbsp;&nbsp;盘口: <span id="nowHandType"></span> --%></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div>共计：<span id="zdn"></span> 注</div>
				<table style="border:none; width:100%;">
					<tr class="trhight" style="border:none;">
						<td align="right" class='tdselect' style='border:none;font-size:14px;'><span><input type='number' min='1' max='50000' id='amount' class='numb_px' placeholder="每注金额"></span></td>
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