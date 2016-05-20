<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div data-role="page" id="orderPage"  style="padding-bottom:50px;">
  <c:set var="page_type" value="2" scope="request"/>
  <%@include file="page_head.jsp"%>
  <div data-role="content">
    <form data-ajax="false">
      <input type="hidden" name="amount" id="p_amount" value=""/>
      <input type="hidden" name="betAmount" id="p_betAmount" value=""/>
      <input type="hidden" name="betBall" id="p_betBall" value=""/>
      <input type="hidden" name="betBallStr" id="p_betBallStr" value=""/>
      <input type="hidden" name="betBallTou" id="p_betBallTou" value=""/>
      <input type="hidden" name="betBallTuo" id="p_betBallTuo" value=""/>
      <input type="hidden" name="betType" id="p_betType" value=""/>
      <input type="hidden" name="gameCode" id="p_gameCode" value=""/>
      <input type="hidden" name="gameCode16" id="p_gameCode16" value=""/>
      <input type="hidden" name="isChange" id="p_isChange" value="0"/>
      <input type="hidden" name="issue" id="p_issue" value="${obj.issue}"/>
      <input type="hidden" name="noteCount" id="p_noteCount" value=""/>
      <input type="hidden" name="passType" id="p_passType" value=""/>
      <input type="hidden" name="pgameCode" id="p_pgameCode" value="${obj.pgc}"/>
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
          <span class="iconspan"></span><span class="spnmar">会员资料</span>
        </div>
        <div class="divtable">
          <table width="100%" border="0" cellpadding="0" cellspacing="0"
                 style="border:none; width:100%;">
            <tr style="border:none;">
              <td class="titled" style="border:none;">帐{[{5Y+3}]}</td>
              <td align="right" style="border:none;" class="detailsb"><span id="anid"></span></td>
            </tr>
            <tr style="border:none;">
              <td class="titled" style="border:none;">额度&nbsp;</td>
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
                <span id="isid">{[{5pyf}]}数:${obj.issue}</span> &nbsp; &nbsp;<span id="hcid"></span><span style="float: right; padding-right: 20px;" id="maxAward"></span>
              </td>
            </tr>
            </thead>
            <tbody id="tbody">
            <tr class="trhight" style="border:none;">
              <td align="center" colspan="2"></td>
            </tr>
            <tr class="trhight" style="border:none;">
              <td align="center" colspan="2"></td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </form>
  </div>
  <div data-role="footer" class="ui-footer ui-footer-fixed">
    <div class= "ui-grid-a">
      <div class= "ui-btn5 ui-block-a">
        <a href="#" id="cancelBtn" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">取消</a>
      </div>
      <div class= "ui-btn4 ui-block-b">
        <button href="#" id="submitBtn" style="background:none; border:none; box-shadow:none; width:90%; " class="ui-btn" data-ajax="false">确认</button>
      </div>
    </div>
  </div>
</div>
