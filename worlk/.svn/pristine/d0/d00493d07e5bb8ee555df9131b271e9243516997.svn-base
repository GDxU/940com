<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<link rel="stylesheet" href="${staticFileUrl}/css/qxc.css?v=${rsvn}">
<script src="${staticFileUrl}/js/plugin/jquery.countdown.min.js"></script>
</head>
<body>
<div class="list_dingtime" data-role="page" >
<c:set var="page_type" value="1" scope="request"/>
<c:set var="page_title" value="快填" />
<%@ include file="/WEB-INF/page/qxc/com_header.jsp" %>
<%@ include file="/WEB-INF/page/qxc/panel_left_qxc.jsp" %>
<%@ include file="/WEB-INF/page/qxc/panel_right.jsp" %>
<div data-role="content" id="rateRefInfo">
     <form>
        <label for="text-1">收获总额：</label>
        <input  type="text" id="text-1">
        <label for="text-2">收获赔率：</label>
        <input  type="text" id="text-2">
        <label for="text-3">本网赔率：</label>
        <input  type="text" id="text-3">
        <label for="text-4">{[{5LiL}]}注金额：</label>
        <input  type="text" id="text-4">
       <div class="ui-grid-a">
           <div class="ui-block-a"><input type="reset" value="重置"></div>
           <div  class="ui-block-b ui-yellow-bg"><input type="submit" style="background:#ffd992;"  value="计算"></div>
       </div>
    </form>
            <div class="ui-tip">
                <p>
                    收货总额：请输入什么玩法，什么号码预计出货到本系统的总货量。<br>
                    收货赔率：请输入该玩法收货时的赔率。<br>
                    本网赔率：请输入该玩法的号码在本系统里的赔率.<br>
                    注意：{[{5LiL}]}注組合的總赔率，取該組合號碼的最低赔率為總赔率。<br>
                    以上输入完成后，请点击"计算"，在"{[{5LiL}]}注金额"处会得出在本系统里该号码应该{[{5LiL}]}注的金额。<br>
                    {[{5LiL}]}注金额的计算方法为：收货总额乘以收货赔率除以本网赔率。
                </p>
                <p class="ui-red">
                    例如：自己手里收了一定位（千位）0XXX号1000元的货量，收货时给出的赔率是：9.5，本系统里一定位（千位）0XXX号的赔率为：9.89，如果将手里一定位（千位）0XXX号1000元的货量都想出货到本系统里，则在本系统里{[{5LiL}]}注金额的计算方法为：1000*9.5/9.89=961(下注金额取四舍五入后的整数)
                </p>
            </div>
          </div>
    </div>
    <script>
    document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
    </script>
  </body>
</html>
