<!--------------------------------游戏规则---------------------------->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/ssc/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/ssc.css">
</head>
<body>
<div data-role="page">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
		<a href="${ctx}/ssc/menu" data-role="none" class="ui-btn-left ui-btn2 ui-icon-bars ui-btn-icon-notext ui-shadow ui-corner-all" data-ajax="false"> </a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>游戏规则</h1>
		 </div>
	</div>
  <%@ include file="/WEB-INF/page/ssc/panel_right.jsp" %>
	<div data-role="main" class="ui-content">
		  <div data-role="tabs" id="tabs">
			<select id="sgid" onchange="showRule();" data-mini="true">
				<c:if test = "${empty obj.cf || obj.cf.klc == 1}">
				<option value="KLC">${msg['title.ssc.KLC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxklc == 1}">
				<option value="GXKLC">${msg['title.ssc.GXKLC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjklc == 1}">
				<option value="TJKLC">${msg['title.ssc.TJKLC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.hnklc == 1}">
				<option value="HNKLC">${msg['title.ssc.HNKLC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.bjklc == 1}">
				<option value="BJKLC">${msg['title.ssc.BJKLC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ssc == 1}">
				<option value="SSC">${msg['title.ssc.SSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jxssc == 1}">
				<option value="JXSSC">${msg['title.ssc.JXSSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.xjssc == 1}">
				<option value="XJSSC">${msg['title.ssc.XJSSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.tjssc == 1}">
				<option value="TJSSC">${msg['title.ssc.TJSSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ynssc == 1}">
				<option value="YNSSC">${msg['title.ssc.YNSSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shssc == 1}">
				<option value="SHSSC">${msg['title.ssc.SHSSC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.bjc == 1}">
				<option value="BJC">${msg['title.ssc.BJC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.xync == 1}">
				<option value="XYNC">${msg['title.ssc.XYNC']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jsks == 1}">
				<option value="JSKS">${msg['title.ssc.JSKS']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.ahks == 1}">
				<option value="AHKS">${msg['title.ssc.AHKS']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gxks == 1}">
				<option value="GXKS">${msg['title.ssc.GXKS']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.gdsyxw == 1}">
				<option value="GDSYXW">${msg['title.ssc.GDSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.shsyxw == 1}">
				<option value="SHSYXW">${msg['title.ssc.SHSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.sdsyxw == 1}">
				<option value="SDSYXW">${msg['title.ssc.SDSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jxsyxw == 1}">
				<option value="JXSYXW">${msg['title.ssc.JXSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.lnsyxw == 1}">
				<option value="LNSYXW">${msg['title.ssc.LNSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.hbsyxw == 1}">
				<option value="HBSYXW">${msg['title.ssc.HBSYXW']}</option>
				</c:if>
				<c:if test = "${empty obj.cf || obj.cf.jssyxw == 1}">
				<option value="JSSYXW">${msg['title.ssc.JSSYXW']}</option>
				</c:if>
			</select>
			<div id="KLC" style="font-size:12px;" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.KLC']}游戏规则：</h2>
				每期${msg['title.ssc.KLC']}（开奖网）开奖球数共八粒。每粒球除了{[{5oC75ZKM}]}玩法，其它都有单独的${msg['label.ssc.bet']}页面。
				${msg['title.ssc.KLC']}每天开84期，每期间隔10分钟。${msg['label.ssc.bet']}时间为8分钟，北京时间（GMT+8）每天白天从9：00开到晚上23：00。
			<dl>
				<h3 style="color:blue">具体游戏规则如下:</h3>
				<dt style="color:red">一、第一球~第八球：</dt>
				<dd>
					指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，
						第五球开出是12，${msg['label.ssc.xiazhu']}第五球为12者视为中奖其余情形视为不中奖。
				</dd>
				<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
				<dd>
					指单、双、大、小、${msg['label.ssc.ball.TAIL_BIG']}、 ${msg['label.ssc.ball.TAIL_SMALL']}、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：
					<dl>
						<dt>1、单、双：</dt>
						<dd>
							自第一球至第八球，开出的号码 为双数叫双，如8、16，开出的号码为单数叫单，如19、5。
						</dd>
						<dt>2、大、小：</dt>
						<dd>
							自第一球至第八球，开出的号码 大于或等于11为大，开出的号码小于等于10为小。
						</dd>
						<dt>3、${msg['label.ssc.ball.TAIL_BIG']}、${msg['label.ssc.ball.TAIL_SMALL']}：</dt>
						<dd>
							自第一球至第八球，开出号码的尾数 大于等于5为${msg['label.ssc.ball.TAIL_BIG']}，开出号码的尾数小于等于4为${msg['label.ssc.ball.TAIL_SMALL']}。
						</dd>
						<dt>4、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}</dt>
						<dd>
							开出的号码的个位和十位相加，所得数
								字为单数的为合单，如05、12；所得数字为双数的为合双，如08、19。
						</dd>
						<dt>5、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
						<dd>
							所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是31、51；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值
								是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、80；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
						</dd>
						<dt>6、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
						<dd>
							所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是85到132为{[{5oC75ZKM}]}大；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是36到83为{[{5oC75ZKM}]}小；
								所有8个开奖号码的数字{[{5oC75ZKM}]}值为84打和；如开奖号码为01、20、02、08、17、09、11，数值{[{5oC75ZKM}]}是68，则{[{5oC75ZKM}]}小。假如${msg['label.ssc.bet']}组合
								符合中奖结果，视为中奖，其余情形视为不中奖，打和不计算结果。
						</dd>
						<dt>7、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
						<dd>
							所有8个开奖号码的数
								字{[{5oC75ZKM}]}值的个位数大于等于5为总${msg['label.ssc.ball.TAIL_BIG']}，小于等于4为总${msg['label.ssc.ball.TAIL_SMALL']}；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
						</dd>
					</dl>
				</dd>
				<dt style="color:red">三、中发白</dt>
				<dd>
					<p>中：开出的号码为01、02、03、04、05、06、07</p>
					<p>发：开出的号码为08、09、10、11、12、13、14</p>
					<p>白：开出的号码为15、16、17、18、19、20</p>
				</dd>
				<dd></dd>
				<dt style="color:red">四、方位</dt>
				<dd>
					<p>东：开出的号码为01、05、09、13、17</p>
					<p>南：开出的号码为02、06、10、14、18</p>
					<p>西：开出的号码为03、07、11、15、19</p>
					<p>北：开出的号码为04、08、12、16、20</p>
				</dd>
				<dt style="color:red">五、${msg['title.ssc.LIANMA']}</dt>
				<dd>
					<dl>
						<dt>1、${msg['label.ssc.play.SERIAL_2']}：</dt>
						<dd>
							指从01至20中任意选择2个号码对开奖号码中任意2个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意2个位置的号码相符，即中奖。
						</dd>
						<dt>2、${msg['label.ssc.play.SERIAL_2_Z']}：</dt>
						<dd>
							指从01至20中任意选择2个号码对开奖号码中按开奖顺序出
								现的2个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的2个连续位置的号码相符（顺序不限），即中奖。
						</dd>
						<dt>3、${msg['label.ssc.play.SERIAL_3']}：</dt>
						<dd>
							指从01至20中任意选择3个号码对开奖号码中任意3个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意3个
								位置的号码相符，即中奖。
						</dd>
						<dt>4、${msg['label.ssc.play.SERIAL_3_Z']}：</dt>
						<dd>
							指从01至20中任意选择3个号码对开奖号码中按开奖顺序出
								现的前3个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的前3个连续位置的号码相符（顺序不限），即中奖。
						</dd>
						<dt>5、${msg['label.ssc.play.SERIAL_4']}：</dt>
						<dd>
							指从01到20中任意选择4个号码，对开奖号码中任意4个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意4个位置的号码相符，即中奖。
							
						</dd>
						<dt>6、${msg['label.ssc.play.SERIAL_5']}：</dt>
						<dd>
							指从01到20中任意选择5个号码，对开奖号码中任意5个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意5个位置的号码相符，即中奖。
							
						</dd>
					</dl>
				</dd>
				<dt style="color:red">六、1~4${msg['label.ssc.play.longhu']}:</dt>
				<dd>
				<dl>
					<dt style="color:red">第一球龙/虎：</dt>
					<dd><p>“第一球”号码大于“第八球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p></dd>
					<dt style="color:red">第二球龙/虎：</dt>
					<dd><p>“第二球”号码大于“第七球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p></dd>		
					<dt style="color:red">第三球龙/虎：</dt>
					<dd><p>“第三球”号码大于“第六球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p></dd>	
					<dt style="color:red">第四球龙/虎：</dt>
					<dd><p>“第四球”号码大于“第五球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p></dd>														
				</dl>
				</dd>
				<dd></dd>
			</dl>
			</div>
			<div id="SSC" style="font-size:12px" class="ui-body ui-body-a" style="display: none">
			<h2>${msg['title.ssc.SSC']}游戏规则：</h2>
				该游戏${msg['label.ssc.bet']}时间、开奖时间和开奖号码与${msg['title.ssc.SSC']}完全同步，北京时间（GMT+8）每天白天从上午10:00开到晚上22:00，夜场从22:00到凌晨2:00，每10分钟开一次奖，夜场每5分钟开一次奖，每天开奖120期（白天72期，夜晚48期）。
			<dl>
				<h3 style="color:blue">具体游戏规则如下:</h3>

				<dt style="color:red">1. 第一球~第五球</dt>
				<dd>
					<p>
						第一球~第五球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>
						${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>
						${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
					</p>
				</dd>
				<dt style="color:red">2. {[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}</dt>
				<dd>
					<p>
						${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值大于等于23为大，小于等于22为小。<br>
						${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数值{[{5oC75ZKM}]}值是单数为{[{5oC75ZKM}]}单。
					</p>
				</dd>
				<dt style="color:red">3. ${msg['label.ssc.play.QS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
				<dd>
					<p>
						${msg['label.ssc.ball.BAOZI']}：中奖号码的第一球、第二球、第三球数字都相同。如中奖号码为000、111、999等，中奖号码的第一球、第二球、第三球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.SHUNZI']}：中奖号码的第一球、第二球、第三球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第一球、第二球、第三球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.DUIZI']}：中奖号码的第一球、第二球、第三球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.BANSHUN']}：中奖号码的第一球、第二球、第三球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
					</p>
				</dd>
				<dd></dd>
				<dt style="color:red">4. ${msg['label.ssc.play.ZS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
				<dd>
					<p>
						${msg['label.ssc.ball.BAOZI']}：中奖号码的第二球、第三球、第四球数字都相同。如中奖号码为000、111、999等，中奖号码的第二球、第三球、第四球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.SHUNZI']}：中奖号码的第二球、第三球、第四球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第二球、第三球、第四球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.DUIZI']}：中奖号码的第二球、第三球、第四球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.BANSHUN']}：中奖号码的第二球、第三球、第四球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第二球、第三球、第四球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
					</p>
				</dd>
				<dt style="color:red">5. ${msg['label.ssc.play.HS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
				<dd>
					<p>
						${msg['label.ssc.ball.BAOZI']}：中奖号码的第三球、第四球、第五球数字都相同。如中奖号码为000、111、999等，中奖号码的第三球、第四球、第五球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.SHUNZI']}：中奖号码的第三球、第四球、第五球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第三球、第四球、第五球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.DUIZI']}：中奖号码的第三球、第四球、第五球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.BANSHUN']}：中奖号码的第三球、第四球、第五球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
					</p>
					<p>
						${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第三球、第四球、第五球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
					</p>
				</dd>
				<dt style="color:red">6. ${msg['label.ssc.play.longhu']}和玩法：龙 &gt; 虎 &gt; 和（0为最小，9为最大）</dt>
				<dd>
					<p>
						龙：开出之号码第一球的中奖号码大于第五球的中奖号码，为龙。如，第一球开出4第五球开出2；第一球开出9第五球开出8;
						第一球开出5第五球开出1…中奖为龙。</p>
					<p>
						虎：开出之号码第一球的中奖号码小于第五球的中奖号码，为虎。如，第一球开出7第五球开出9；第一球开出3第五球开出5;
						第一球开出5第五球开出8…中奖为虎。</p>
					<p>
						和：开出之号码第一球的中奖号码等于第五球的中奖号码，为和；如开出结果：2***2、9***9等则${msg['label.ssc.bet']}和局者视为中奖，${msg['label.ssc.bet']}龙、虎不计算输赢。
					</p>
				</dd>
				<dt style="color:red">7. 一字组合</dt>
				<dd>
				<p>${msg['label.ssc.play.QS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位】任一数与所选的号码相同时，即为中奖。</p>
				<p>${msg['label.ssc.play.ZS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【千位、佰位、拾位】任一数与所选的号码相同时，即为中奖。</p>
				<p>${msg['label.ssc.play.HS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。</p>
				<p>${msg['label.ssc.play.QW']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。注：当选号码 无论出现几次，派{[{5b2p}]}只派一次。※例如：买一号，开奖结果为1,1,1,1,1.派{[{5b2p}]}只派一次。</p>
				</dd>	
				<dt style="color:red">8. 二字组合</dt>
				<dd>
				于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果任二数与所选的号码相同时，即为中奖。 ※举例：${msg['label.ssc.bet']}者购买后二字组合，选择2个相同号码如为11，当期开奖结果如为xx11x、xx1x1、xxx11、皆视为中奖。（x=0~9任一数） ※举例：${msg['label.ssc.bet']}者购买${msg['label.ssc.play.HS']}二字组合，选择2个不同号码如为12，当期开奖结果如为xx12x、xx1x2、xx21x、xx2x1、xxx12、xxx21皆视为中奖。（x=0~9任一数）
				</dd>	
				<p></p>
				<dt style="color:red">9. 三字组合</dt>	
				<dd>
				于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选的号码相同时（顺序不限），即为中奖。 ※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。 ※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。 ※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。
				</dd>
				<p></p>
				<dt style="color:red">10. 二字定位</dt>	
				<dd>
				于万仟佰拾个${msg['label.ssc.play.SERIAL_2']}位，自0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。比如我万仟买1,2这个组合，开奖号码为1,2,3,4,5，即为中奖。其余皆不中！
				</dd>
				<p></p>
				<dt style="color:red">11. 三字定位</dt>	
				<dd>
				于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}${msg['﻿label.ssc.play.SERIAL_3']}位，自0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。举例：${msg['label.ssc.play.QS']}买1,2，3这组，开奖号码为1,2，3,4,5,即中奖。其余皆不中！
				</dd>
				<p></p>	
				<dt style="color:red">12. ${msg['title.ssc.ZUX']}三</dt>		
				<dd>
				<p>${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，当开奖结果[万位、仟位、佰位]只有两个号码重复，则视为中奖。如果是选择12,其中有一个号码重复则中奖。 ※例如：112、211、122、221、若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222。</p>
				<p>${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，当开奖结果[仟位、佰位、拾位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 ※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
				<p>${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 ※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
				<p style="color:red">（有两个相同但没有相连的也是不中奖的，列如：121、212、123等。）</p>
				</dd>	
				<dt style="color:red">13. ${msg['title.ssc.ZUX']}六</dt>		
				<dd>
				<p>${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，[万位、仟位、佰位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[万位、仟位、佰位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
				<p>${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，[仟位、佰位、拾位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[仟位、佰位、拾位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
				<p>${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
				</dd>
				<dt style="color:red">14. 跨度</dt>		
				<dd>
				<p>${msg['label.ssc.play.QS']}：以开奖结果[万位、仟位、佰位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。 ※举例：开奖结果为3、4、8、7、6。中奖的跨度为5。（最大号码8减最小号码3=5）。</p>
				<p>${msg['label.ssc.play.ZS']}：以开奖结果[仟位、佰位、拾位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。 ※举例：开奖结果为3、4、8、7、6。中奖的跨度为4。（最大号码8减最小号码4=4）。</p>
				<p>${msg['label.ssc.play.HS']}：以开奖结果[佰位、拾位、个位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。 ※举例：开奖结果为3、4、8、7、6。中奖的跨度为2。（最大号码8减最小号码6=2）。</p>
				</dd>
				<dt style="color:red">15. 质合</dt>		
				<dd>
				<p>开奖结果一球、二球、三球、四球或五球数字为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注球号质合与开奖结果的球号质合相符时，即为中奖。 ※举例：{[{5oqV}]}注者购买第一球质，当期开奖结果如为20957（2为质），则视为中奖。</p>
				</dd>
				<dt style="color:red">16. 和数双{[{6Z2i}]}</dt>		
				<dd>
				<p>开奖结果万仟位、万佰位、万拾位、万个位、仟佰位、仟拾位、仟个位、佰拾位、拾个位或佰个位数字和数为1、3、5、7、9、11、13、15、17时为“单”，为0、2、4、6、8、10、12、14、16、18时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。
※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为20290（佰2+拾9=11为单），则视为中奖。 </p>
				</dd>
				<dd></dd>
			</dl>
			</div>
			<div id="BJC"  style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.BJC']}游戏规则：</h2>
			该游戏的${msg['label.ssc.bet']}时间、开奖时间、开奖号码和期数与“北京（PK拾）”官方网站完全同步，北京时间（GMT+8）每天白天从上午09:02:30开到晚上23:57:30，每5分钟开一次奖，每天开奖179期。
			<dl>
				<h3 style="color:blue">具体游戏规则如下:</h3>
				<dt style="color:red">1~10${msg['label.ssc.twosides']}：指大、小、单、双</dt>
				<dd>
					<dl>
						<dt>大、小：</dt>
						<dd>
							自冠军~第十名，开出之号码大于或等于6为大，开出之号码小于等于5为小
						</dd>
						<dt>单、双：</dt>
						<dd>
							自冠军~第十名，开出之号码为双数叫双，如4、8；开出之号码为单数的叫单，如5、9。
						</dd>
					</dl>
				</dd>
				<dt style="color:red">第一名~第十名车号指定：</dt>
				<dd>
						<p>冠军~第十名车号：每一个车号为一${msg['label.ssc.bet']}组合，开奖结果“${msg['label.ssc.bet']}车号”对应所投名次视为中奖，其余情形视为不中奖。<br>如冠军开出号码8，${msg['label.ssc.xiazhu']}冠军为8者视为中奖，第五名开出是1，${msg['label.ssc.xiazhu']}第五名为1者视为中奖，其余情形视为不中奖。</p>
				</dd>
				<dt  style="color:red">1~5${msg['label.ssc.play.longhu']}（注意规则）：</dt>
				<dd>
					<dl>
						<dt>冠军龙/虎:</dt>
						<dd>
							<p>“冠军”车号大于“第十名”车号视为龙中奖、反之小于视为虎中奖，其余情形视为不中奖。</p>
						</dd>
						<dt>亚军龙/虎：</dt>
						<dd>
							<p>“亚军”车号大于“第九名”车号视为龙中奖、反之小于视为虎中奖，其余情形视为不中奖。</p>
						</dd>
						<dt>第三名龙/虎：</dt>
						<dd>
							<p>“第三名”车号大于“第八名”车号视为龙中奖、反之小于视为虎中奖，其余情形视为不中奖。</p>
						</dd>
						<dt>第四名龙/虎：</dt>
						<dd>
							<p>“第四名”车号大于“第七名”车号视为龙中奖、反之小于视为虎中奖，其余情形视为不中奖。</p>
						</dd>
						<dt>第五名龙/虎：</dt>
						<dd>
							<p>“第五名”车号大于“第六名”车号视为龙中奖、反之小于视为虎中奖，其余情形视为不中奖。</p>
						</dd>
					</dl>
				</dd>
				<dt style="color:red">冠军车号+亚军车号=冠亚和值（为3~19):</dt>
				<dd>
					<dl>
						<dt>冠亚${msg['label.ssc.play.BIG_SMALL']}：</dt>
						<dd>
							“冠亚和值”大于11时${msg['label.ssc.bet']}“大”的{[{5rOo}]}单视为中奖，小于等于11时${msg['label.ssc.bet']}“小”的{[{5rOo}]}单视为中奖，其余视为不中奖；如开奖号码冠亚军车号分别为5、3，和值8为小，${msg['label.ssc.bet']}为“冠亚小”则中奖。
						</dd>
						<dt>冠亚${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
						<dd>
							“冠亚和值”为单${msg['label.ssc.bet']}“单”的{[{5rOo}]}单视为中奖，为双${msg['label.ssc.bet']}“双”的{[{5rOo}]}单视为中奖，其余视为不中奖；如开奖号码冠亚军车号分别为5、3，和值8为双，${msg['label.ssc.bet']}为“冠亚双”则中奖。
						</dd>
					</dl>
				</dd>
			</dl>
			</div>	
			<div id="XYNC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.XYNC']}游戏规则：</h2>
				依照重庆彩票网发行的${msg['title.ssc.XYNC']}开奖期号，每期${msg['title.ssc.XYNC']}开奖球号共八粒。每粒球除了{[{5oC75ZKM}]}玩法，其他都有单独的${msg['label.ssc.bet']}页面。${msg['title.ssc.XYNC']}每天开97期，每期间隔10分钟。${msg['label.ssc.bet']}时间为8分钟，等待时间为2分钟，北京时间（GMT+8）每天白天从上午09:53开到晚上凌晨02:03。
				<dl>
					<h3 style="color:blue">具体游戏规则如下:</h3>
					<dt style="color:red" >一、第一球~第八球：</dt>
					<dd>
						<p>1~8球中，假如${msg['label.ssc.bet']}号码为开奖号码并在所投球的位置，视为中奖，如第一球开奖号码是08，${msg['label.ssc.xiazhu']}第一球为08者视为中奖，第五球开奖号码是12，${msg['label.ssc.xiazhu']}第五球为12者视为中奖，其余情形视为不中奖。</p>
					</dd>
					<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
					<dd>
						<p>指第一球~第八球大、小、单、双、${msg['label.ssc.ball.TAIL_BIG']}、${msg['label.ssc.ball.TAIL_SMALL']}、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}。</p>
						<dl>
							<dt style="color:red">1、单、双：</dt>
							<dd>
								<p>自第一球至第八球，开奖号码为双数叫双，如08、16；开奖号码为单数叫单，如19、05。</p>
							</dd>
							<dt style="color:red">2、大、小：</dt>
							<dd>
								<p>自第一球至第八球，开奖号码大于或等于11为大，如13、15；开奖号码小于等于10为小，如05、07。</p>
							</dd>
							<dt style="color:red">3、${msg['label.ssc.ball.TAIL_BIG']}、${msg['label.ssc.ball.TAIL_SMALL']}：</dt>
							<dd>
								<p>自第一球至第八球，开奖号码的尾数大于等于5为${msg['label.ssc.ball.TAIL_BIG']}，如06、18；开出号码的尾数小于等于4为${msg['label.ssc.ball.TAIL_SMALL']}，如03、12。</p>
							</dd>
							<dt style="color:red">4、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}</dt>
							<dd>
								<p>开奖号码的个位和十位相加，所得数值是单数的为合单，如05、12；所得数值是双数的为合双，如08、19。</p>
							</dd>
							<dt style="color:red">5、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
							<dd>
								<p>所有8个开奖号码相加的总值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是37、51；所有8个开奖号码相加的总值是双数的为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}值是36、80；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
							</dd>
							<dt style="color:red">6、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
							<dd>
								<p>所有8个开奖号码相加的总值是85到132为{[{5oC75ZKM}]}大；所有8个开奖号码相加的总值是36到83为{[{5oC75ZKM}]}小；所有8个开奖号码相加的总值为84打和，打和不计算输赢；如开奖号码为01、20、02、08、17、09、11，数值{[{5oC75ZKM}]}是68，则{[{5oC75ZKM}]}小。假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖，开和统计{[{5rOo}]}单，报表中不计算结果。</p>
							</dd>
							<dt style="color:red">7、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
							<dd>
								<p>所有8个开奖号码相加总值的个位数大于等于5、小于等于9为总${msg['label.ssc.ball.TAIL_BIG']}，大于等于0、小于等于4为总${msg['label.ssc.ball.TAIL_SMALL']}；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
							</dd>
						</dl>
					</dd>
					<dt style="color:red">三、中发白</dt>
					<p>“中”、“发”、“白”分别代替20个球号中的7或6个球号，当开奖号码在所投的球位置并被“中”、“发”、“白”包含时，视为中奖，其余情形视为不中奖。例如：${msg['label.ssc.bet']}“第一球”的“中”，假设第一球开奖是05号球，那么此{[{5rOo}]}单中奖。</p>
					<dd>
						<p>中：开出之号码为01、02、03、04、05、06、07</p>
						<p>发：开出之号码为08、09、10、11、12、13、14</p>
						<p>白：开出之号码为15、16、17、18、19、20</p>
					<dd>
					<dt style="color:red">四、东南西北</dt>
					<p>“东”、“南”、“西”、“北”分别代替20个球号中的5个球号，当开奖号码在所投的球位置并被“东”、“南”、“西”、“北”包含时，视为中奖，其余情形视为不中奖。例如：${msg['label.ssc.bet']}“第一球”的“北”，假设第一球开奖是20号球，那么此{[{5rOo}]}单中奖。</p>
					<dd>
						<p>东：开出的号码为01、05、09、13、17</p>
						<p>南：开出的号码为02、06、10、14、18</p>
						<p>西：开出的号码为03、07、11、15、19</p>
						<p>北：开出的号码为04、08、12、16、20</p>
					</dd>
					<dt style="color:red">五、${msg['title.ssc.LIANMA']}</dt>
					<dd>
						<dl>
							<!--                  <dt>1、果蔬单选：</dt><dd><p>01至18对应的果蔬：西瓜、椰子、榴莲、柚子、菠萝、葡萄、荔枝、樱桃、草莓、蕃茄、梨子、苹果、桃子、柑橘、冬瓜、萝卜、南瓜、茄子；从01至18中任意选择1个号码，所选择号码的位置必须在第一球、且所选号码与开奖号码相同，即中奖。如：选择椰子，8个开奖号码结果中第一个位置出现的号码是02，02对应的是椰子，即是中奖。</p></dd><dt>2、动物单选：</dt><dd><p>19、20对应的动物：家犬、奶牛；指从19和20两个号码中任意选择1个号码，所选择数字的位置必须在第一球、且所选数字与开奖号码相同，即中奖。如：选择奶牛，8个开奖号码结果中第一个位置出现的号码是20，20对应的是奶牛，即是中奖。</p></dd> -->
							<dt style="color:red">1、${msg['label.ssc.play.SERIAL_2']}：</dt>
							<dd>
								<p>指从01至20中任意选择2个号码对开奖号码中任意2个位置的${msg['label.ssc.bet']}，
									${msg['label.ssc.bet']}号码与开奖号码中任意2个位置的号码相符，即中奖。如选择05、12，8个开奖号码结果中有出现05和12即中奖。</p>
							</dd>
							<dt style="color:red">2、${msg['label.ssc.play.SERIAL_2_Z']}：</dt>
							<dd>
								<p>从01至20中任意选择2个号码，当开奖号码包含了所选的2个号码、且位置相连，即中奖。如选择05、12，开奖号码结果为01，11，05，12，06，19，15，03或01，11，
									12，05，06，19，15，03即中奖。</p>
							</dd>
							<dt style="color:red">3、${msg['label.ssc.play.SERIAL_2_LZ']}：</dt>
							<dd>
								<p>从01至20中任意选择2个号码，当开奖号码包含了所选的2个号码且顺序一致、位置相连，即中奖。如选择05、12，开奖号码结果为01，11，05，12，06，19，15，03即中奖。</p>
							</dd>
							<dt style="color:red">4、${msg['label.ssc.play.SERIAL_3']}：</dt>
							<dd>
								<p>指从01至20中任意选择3个号码对开奖号码中任意3个位置的${msg['label.ssc.bet']}，
									${msg['label.ssc.bet']}号码与开奖号码中任意3个位置的号码相符，即中奖。如选择05、12、20，8个开奖号码结果中有出现05、12和20即中奖。</p>
							</dd>
							<dt style="color:red">5、${msg['label.ssc.play.SERIAL_3_Z']}：</dt>
							<dd>
								<p>从01至20中任意选择3个号码，8个开奖号码中${msg['label.ssc.play.QS']}个号码是所选的3个号码、顺序不限，即中奖。如选择05、12、08，开奖结果中${msg['label.ssc.play.QS']}位为05、12、08
									，12、08、05，08、12、05都为中奖。</p>
							</dd>
							<dt style="color:red">6、${msg['label.ssc.play.SERIAL_4']}：</dt>
							<dd>
								<p>指从01至20中任意选择4个号码对开奖号码中任意4个位置的${msg['label.ssc.bet']}，
									${msg['label.ssc.bet']}号码与开奖号码中任意4个位置的号码相符，即中奖。如选择05、12、13、14，8个开奖号码结果中有出现05、12、13、14这4个号码即中奖。</p>
							</dd>
							<dt style="color:red">7、${msg['label.ssc.play.SERIAL_5']}：</dt>
							<dd>
								<p>指从01至20中任意选择5个号码对开奖号码中任意5个位置的${msg['label.ssc.bet']}，
									${msg['label.ssc.bet']}号码与开奖号码中任意5个位置的号码相符，即中奖。如选择05、12、13、14、16，8个开奖号码结果中有出现05、12、13、14、16、这5个号码即中奖。</p>
							</dd>
						</dl>
					</dd>
					<dt style="color:red">六、1~4${msg['label.ssc.play.longhu']}:</dt>
					<dd>
						<dl>
							<dt style="color:red">第一球龙/虎：</dt>
							<dd>
								<p>“第一球”号码大于“第八球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
							</dd>
							<dt style="color:red">第二球龙/虎：</dt>
							<dd>
								<p>“第二球”号码大于“第七球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
							</dd>
							<dt style="color:red">第三球龙/虎：</dt>
							<dd>
								<p>“第三球”号码大于“第六球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
							</dd>
							<dt style="color:red">第四球龙/虎：</dt>
							<dd>
								<p>“第四球”号码大于“第五球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
							</dd>
						</dl>
					<dd>
					<dt style="color:red">七、正码:</dt>
					<dd>
						<p>从01至20中任意选择1个号码进行${msg['label.ssc.bet']}， ${msg['label.ssc.bet']}号码与开奖号码中任意1个位置的号码相符，即中奖。</p>
					</dd>
				</dl>
			</div>
			<div id="JXSSC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.JXSSC']}游戏规则：</h2>
				${msg['title.ssc.JXSSC']}由中国福利彩票发行管理中心组织，由江西省福利彩票发行中心在所辖区域内承销。${msg['title.ssc.JXSSC']}开奖时间：官网~每日早上9点~晚上11点00分(每10分钟一期)，共84期。
				<dl>
										<h3 style="color:blue">具体游戏规则如下:</h3>
										<dt style="color:red">1. 第一球~第五球</dt>
										<dd>
											<p>第一球~第五球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
											</p>
											<p>
												${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
											</p>
										</dd>
										<dt style="color:red">2. {[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}</dt>
										<dd>
											<p>
												${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值大于等于23为大，小于等于22为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数值{[{5oC75ZKM}]}值是单数为{[{5oC75ZKM}]}单。
											</p>
										</dd>
										<dt style="color:red">3. ${msg['label.ssc.play.QS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第一球、第二球、第三球数字都相同。如中奖号码为000、111、999等，中奖号码的第一球、第二球、第三球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第一球、第二球、第三球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第一球、第二球、第三球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第一球、第二球、第三球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第一球、第二球、第三球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd><dd>
										</dd><dt style="color:red">4. ${msg['label.ssc.play.ZS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第二球、第三球、第四球数字都相同。如中奖号码为000、111、999等，中奖号码的第二球、第三球、第四球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第二球、第三球、第四球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第二球、第三球、第四球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第二球、第三球、第四球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第二球、第三球、第四球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第二球、第三球、第四球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">5. ${msg['label.ssc.play.HS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第三球、第四球、第五球数字都相同。如中奖号码为000、111、999等，中奖号码的第三球、第四球、第五球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第三球、第四球、第五球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第三球、第四球、第五球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第三球、第四球、第五球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第三球、第四球、第五球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第三球、第四球、第五球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">6. ${msg['label.ssc.play.longhu']}和玩法：龙 &gt; 虎 &gt; 和（0为最小，9为最大）</dt>
										<dd>
											<p>龙：开出之号码第一球的中奖号码大于第五球的中奖号码，为龙。如，第一球开出4第五球开出2；第一球开出9第五球开出8;
												第一球开出5第五球开出1…中奖为龙。</p>
											<p>虎：开出之号码第一球的中奖号码小于第五球的中奖号码，为虎。如，第一球开出7第五球开出9；第一球开出3第五球开出5;
												第一球开出5第五球开出8…中奖为虎。</p>
											<p>和：开出之号码第一球的中奖号码等于第五球的中奖号码，为和；如开出结果：2***2、9***9等则${msg['label.ssc.bet']}和局者视为中奖，${msg['label.ssc.bet']}龙、虎不计算输赢。
											</p>
										</dd>
										
										<dt style="color:red">7. 一字组合</dt>
										<dd>
											<p>${msg['label.ssc.play.QS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.ZS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【千位、佰位、拾位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.HS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.QW']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。注：当选号码  无论出现几次，派{[{5b2p}]}只派一次。※例如：买一号，开奖结果为1,1,1,1,1.派{[{5b2p}]}只派一次。</p>
										</dd>
										
										<dt style="color:red">8. 二字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果任二数与所选的号码相同时，即为中奖。
											※举例：${msg['label.ssc.bet']}者购买后二字组合，选择2个相同号码如为11，当期开奖结果如为xx11x、xx1x1、xxx11、皆视为中奖。（x=0~9任一数）
											※举例：${msg['label.ssc.bet']}者购买${msg['label.ssc.play.HS']}二字组合，选择2个不同号码如为12，当期开奖结果如为xx12x、xx1x2、xx21x、xx2x1、xxx12、xxx21皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">9. 三字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选的号码相同时（顺序不限），即为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。</p>
										</dd>
										
										<dt style="color:red">10. 二字定位</dt>
										<dd>
											<p>于万仟佰拾个${msg['label.ssc.play.SERIAL_2']}位，自0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。比如我万仟买1,2这个组合，开奖号码为1,2,3,4,5，即为中奖。其余皆不中！</p>
										</dd>
										
										<dt style="color:red">11. 三字定位</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}${msg['﻿label.ssc.play.SERIAL_3']}位，自0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。举例：${msg['label.ssc.play.QS']}买1,2，3这组，开奖号码为1,2，3,4,5,即中奖。其余皆不中！</p>
										</dd>
										
										
										<dt style="color:red">12. ${msg['title.ssc.ZUX']}三</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，当开奖结果[万位、仟位、佰位]只有两个号码重复，则视为中奖。如果是选择12,其中有一个号码重复则中奖。
											 ※例如：112、211、122、221、若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，当开奖结果[仟位、佰位、拾位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p class="red">（有两个相同但没有相连的也是不中奖的，列如：121、212、123等。）</p>
										</dd>
										
										
										<dt style="color:red">13. ${msg['title.ssc.ZUX']}六</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，[万位、仟位、佰位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[万位、仟位、佰位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，[仟位、佰位、拾位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[仟位、佰位、拾位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
										</dd>
										
										<dt style="color:red">14. 跨度</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：以开奖结果[万位、仟位、佰位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											          ※举例：开奖结果为3、4、8、7、6。中奖的跨度为5。（最大号码8减最小号码3=5）。</p>
											<p>2.${msg['label.ssc.play.ZS']}：以开奖结果[仟位、佰位、拾位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											         ※举例：开奖结果为3、4、8、7、6。中奖的跨度为4。（最大号码8减最小号码4=4）。</p>
											<p>3.${msg['label.ssc.play.HS']}：以开奖结果[佰位、拾位、个位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											        ※举例：开奖结果为3、4、8、7、6。中奖的跨度为2。（最大号码8减最小号码6=2）。</p>
										</dd>
										<dt style="color:red">15. 质合</dt>		
				<dd>
				<p>开奖结果一球、二球、三球、四球或五球数字为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注球号质合与开奖结果的球号质合相符时，即为中奖。 ※举例：{[{5oqV}]}注者购买第一球质，当期开奖结果如为20957（2为质），则视为中奖。</p>
				</dd>
				<dt style="color:red">16. 和数双{[{6Z2i}]}</dt>		
				<dd>
				<p>开奖结果万仟位、万佰位、万拾位、万个位、仟佰位、仟拾位、仟个位、佰拾位、拾个位或佰个位数字和数为1、3、5、7、9、11、13、15、17时为“单”，为0、2、4、6、8、10、12、14、16、18时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。
※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为20290（佰2+拾9=11为单），则视为中奖。 </p>
				</dd>
										
										<dd></dd>
									</dl>
			</div>
			<div id="XJSSC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.XJSSC']}游戏规则：</h2>
				${msg['title.ssc.XJSSC']}由中国福利彩票发行管理中心组织，由新疆维吾尔自治区福利彩票发行中心在所辖区域内承销。开奖时间早上 10:00 ~ 隔天凌晨02:00, 每10分钟一期，共96期。 
				<dl>
										<h3 style="color:blue">具体游戏规则如下:</h3>
										<dt style="color:red">1. 第一球~第五球</dt>
										<dd>
											<p>第一球~第五球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
											</p>
											<p>
												${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
											</p>
										</dd>
										<dt style="color:red">2. {[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}</dt>
										<dd>
											<p>
												${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值大于等于23为大，小于等于22为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数值{[{5oC75ZKM}]}值是单数为{[{5oC75ZKM}]}单。
											</p>
										</dd>
										<dt style="color:red">3. ${msg['label.ssc.play.QS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第一球、第二球、第三球数字都相同。如中奖号码为000、111、999等，中奖号码的第一球、第二球、第三球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第一球、第二球、第三球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第一球、第二球、第三球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第一球、第二球、第三球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第一球、第二球、第三球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd><dd>
										</dd><dt style="color:red">4. ${msg['label.ssc.play.ZS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第二球、第三球、第四球数字都相同。如中奖号码为000、111、999等，中奖号码的第二球、第三球、第四球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第二球、第三球、第四球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第二球、第三球、第四球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第二球、第三球、第四球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第二球、第三球、第四球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第二球、第三球、第四球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">5. ${msg['label.ssc.play.HS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第三球、第四球、第五球数字都相同。如中奖号码为000、111、999等，中奖号码的第三球、第四球、第五球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第三球、第四球、第五球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第三球、第四球、第五球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第三球、第四球、第五球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第三球、第四球、第五球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、
706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、
556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第三球、第四球、第五球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">6. ${msg['label.ssc.play.longhu']}和玩法：龙 &gt; 虎 &gt; 和（0为最小，9为最大）</dt>
										<dd>
											<p>龙：开出之号码第一球的中奖号码大于第五球的中奖号码，为龙。如，第一球开出4第五球开出2；第一球开出9第五球开出8;
												第一球开出5第五球开出1…中奖为龙。</p>
											<p>虎：开出之号码第一球的中奖号码小于第五球的中奖号码，为虎。如，第一球开出7第五球开出9；第一球开出3第五球开出5;
												第一球开出5第五球开出8…中奖为虎。</p>
											<p>和：开出之号码第一球的中奖号码等于第五球的中奖号码，为和；如开出结果：2***2、9***9等则${msg['label.ssc.bet']}和局者视为中奖，${msg['label.ssc.bet']}龙、虎不计算输赢。
											</p>
										</dd>
										
										<dt style="color:red">7. 一字组合</dt>
										<dd>
											<p>${msg['label.ssc.play.QS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.ZS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【千位、佰位、拾位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.HS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.QW']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。注：当选号码  无论出现几次，派{[{5b2p}]}只派一次。※例如：买一号，开奖结果为1,1,1,1,1.派{[{5b2p}]}只派一次。</p>
										</dd>
										
										<dt style="color:red">8. 二字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果任二数与所选的号码相同时，即为中奖。
											※举例：${msg['label.ssc.bet']}者购买后二字组合，选择2个相同号码如为11，当期开奖结果如为xx11x、xx1x1、xxx11、皆视为中奖。（x=0~9任一数）
											※举例：${msg['label.ssc.bet']}者购买${msg['label.ssc.play.HS']}二字组合，选择2个不同号码如为12，当期开奖结果如为xx12x、xx1x2、xx21x、xx2x1、xxx12、xxx21皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">9. 三字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选的号码相同时（顺序不限），即为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。</p>
										</dd>
										
										<dt style="color:red">10. 二字定位</dt>
										<dd>
											<p>于万仟佰拾个${msg['﻿label.ssc.play.SERIAL_2']}位，自0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。比如我万仟买1,2这个组合，开奖号码为1,2,3,4,5，即为中奖。其余皆不中！</p>
										</dd>
										
										<dt style="color:red">11. 三字定位</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}${msg['﻿label.ssc.play.SERIAL_3']}位，自0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。举例：${msg['label.ssc.play.QS']}买1,2，3这组，开奖号码为1,2，3,4,5,即中奖。其余皆不中！</p>
										</dd>
										
										
										<dt style="color:red">12. ${msg['title.ssc.ZUX']}三</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，当开奖结果[万位、仟位、佰位]只有两个号码重复，则视为中奖。如果是选择12,其中有一个号码重复则中奖。
											 ※例如：112、211、122、221、若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，当开奖结果[仟位、佰位、拾位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p class="red">（有两个相同但没有相连的也是不中奖的，列如：121、212、123等。）</p>
										</dd>
										
										
										<dt style="color:red">13. ${msg['title.ssc.ZUX']}六</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，[万位、仟位、佰位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[万位、仟位、佰位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，[仟位、佰位、拾位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[仟位、佰位、拾位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 
※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、
145、333、121等都是不中奖。</p>
										</dd>
										
										<dt style="color:red">14. 跨度</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：以开奖结果[万位、仟位、佰位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											          ※举例：开奖结果为3、4、8、7、6。中奖的跨度为5。（最大号码8减最小号码3=5）。</p>
											<p>2.${msg['label.ssc.play.ZS']}：以开奖结果[仟位、佰位、拾位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											         ※举例：开奖结果为3、4、8、7、6。中奖的跨度为4。（最大号码8减最小号码4=4）。</p>
											<p>3.${msg['label.ssc.play.HS']}：以开奖结果[佰位、拾位、个位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											        ※举例：开奖结果为3、4、8、7、6。中奖的跨度为2。（最大号码8减最小号码6=2）。</p>
										</dd>
										<dt style="color:red">15. 质合</dt>		
				<dd>
				<p>开奖结果一球、二球、三球、四球或五球数字为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注球号质合与开奖结果的球号质合相符时，即为中奖。 ※举例：{[{5oqV}]}注者购买第一球质，当期开奖结果如为20957（2为质），则视为中奖。</p>
				</dd>
				<dt style="color:red">16. 和数双{[{6Z2i}]}</dt>		
				<dd>
				<p>开奖结果万仟位、万佰位、万拾位、万个位、仟佰位、仟拾位、仟个位、佰拾位、拾个位或佰个位数字和数为1、3、5、7、9、11、13、15、17时为“单”，为0、2、4、6、8、10、12、14、16、18时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。
※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为20290（佰2+拾9=11为单），则视为中奖。 </p>
				</dd>
										
										<dd></dd>
									</dl>
			</div>
			<div id="GDSYXW" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.GDSYXW']}游戏规则：</h2>
				每期${msg['title.ssc.GDSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午9：00开到晚上23：00，每天开84期。
				<dl>
										<h3 style="color:blue">具体游戏规则如下:</h3>
										<dt style="color:red">一、单码：</dt>
									<dd>
										<p>
											指每一球出现的顺序与号码为派{[{5b2p}]}依据，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，第五球开出是2，${msg['label.ssc.xiazhu']}第五球为2者视为中奖，其余情形视为不中奖。
										</p>
									</dd>

									<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
									<dd>
										<p>指单、双、大、小、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
										<dl>
											<dt>1、单、双：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码为双数叫双，如8、10，开出的号码为单数叫单，如3、5，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>2、大、小：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码大于或等于6为大，开出的号码小于等于5为小，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>3、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是11、31；所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、30；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>4、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和相加的值是大于30为总和大；所有5个开奖号码的数字总和相加的值小于30为总和小，若总和值等于30为和 (不计算输赢)。
											</dd>
											<dt>5、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和值的个位数大于等于5为总尾大，小于等于4为总尾小；假如{[{5oqV}]}注组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>6、总尾${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为单叫总尾单，所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为双叫总尾双；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>7、${msg['label.ssc.play.longhu']}:</dt>
											<dd>
												<p>以第一球的中奖号码和第五球的中奖号码作为兑奖号码。</p>
												<p>龙：开出的号码第一球的中奖号码大于第五球的中奖号码。如第一球开出10第五球开出7等中奖为龙。</p>
												<p>虎：开出的号码第一球的中奖号码小于第五球的中奖号码。如第一球开出3第五球开出7等中奖为虎。</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">三、选号</dt>
									<dd>
										<dl>
											<dt>1、${msg['title.ssc.RX']}一中一：</dt>
											<dd>
												<p>指${msg['label.ssc.bet']}1个号码与当期开奖的5个号码中任1个号码相同，视为中奖。</p>
											</dd>
											<dt>2、${msg['label.ssc.play.SERIAL_2']}中二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}2个号码与当期开奖的5个号码中任2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>3、${msg['﻿label.ssc.play.SERIAL_3']}${msg['label.ssc.play.ZS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}3个号码与当期开奖的5个号码中任3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>4、${msg['label.ssc.play.SERIAL_4']}中四：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}4个号码与当期开奖的5个号码中任4个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>5、${msg['label.ssc.play.SERIAL_5']}中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}5个号码与当期开奖的5个号码中5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>6、${msg['title.ssc.RX']}六中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}6个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>7、${msg['title.ssc.RX']}七中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}7个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>8、${msg['title.ssc.RX']}八中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}8个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>9、${msg['title.ssc.ZUX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>10、${msg['title.ssc.ZUX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>11、${msg['title.ssc.ZX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dt>12、${msg['title.ssc.ZX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dd></dd>
										</dl>
								</dd></dl>
			</div>
			<div id="GXKLC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.GXKLC']}游戏规则：</h2>
				广西福利彩票快乐十分（以下简称${msg['title.ssc.GXKLC']}）经国家财政部批准，由中国福利彩票发行管理中心在广西省内发行，由广西福利彩票发行中心承销。开奖时间：9：00~21：30 (每15分钟一期)，共50期。
				<dl>
										<h2>具体游戏规则如下:</h2>
									<dt style="color:red">一、${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据第一球~第五球开出的球号判断胜负</dt>
									<dd>
										<dl>
											<dt>1、${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>开出号码01~10为小，11~20为大，21为和。</p>
											</dd>
											<dt>2、${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>开出的号码 为双数叫双，如8、16，开出的号码为单数叫单，如19、5，21为和 。</p>
											</dd>
											<dt>3、${msg['label.ssc.ball.TAIL_BIG']}、小：</dt>
											<dd>
												<p>开出之球号尾数大于或等于5为${msg['label.ssc.ball.TAIL_BIG']}，小于或等于4为${msg['label.ssc.ball.TAIL_SMALL']}，出21为和。</p>
											</dd>
											<dt>4、合${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}</dt>
											<dd>
												<p>以球号个位和十位数字之合来判断胜负，如01、12、16为合单；02、11、20为合双；出21为和。 </p>
											</dd>
											
										</dl>
									</dd>
									<dt style="color:red">二、红蓝绿、四季{[{5LqU6KGM}]}</dt>
										<p>第一球~第五球将21个号码分为三种类</p>
										<dd>
											<dl>
												<dt>1、红、蓝、绿（如下），再依三种类${msg['label.ssc.xiazhu']}</dt>
											<dd>
												<p>红：01、04、07、10、13、16、19</p>
												<p>蓝：02、05、08、11、14、17、20</p>
												<p>绿：03、06、09、12、15、18、21</p>
												<p>若当期号码在相对应的球位落在${msg['label.ssc.xiazhu']}三种类范围内，视为中奖。</p>
											</dd>
											<dt>2、四季:</dt>
											<dd>
												<p>春：01、02、03、04、05</p>
												<p>夏：06、07、08、09、10</p>
												<p>秋：11、12、13、14、15</p>
												<p>冬：16、17、18、19、20; 开出21为和 。</p>
											</dd>
											<dt>3、{[{5LqU6KGM}]}:</dt>
											<dd>
												<p>金：05、10、15、20</p>
												<p>木：01、06、11、16、21 (请注意: 21 亦算输赢,不为和)</p>
												<p>水：02、07、12、17</p>
												<p>火：03、08、13、18</p>
												<p>土：04、09、14、19</p>
											</dd>
											</dl>
										</dd>
									
									<dt style="color:red">三、${msg['label.ssc.play.TOTAL']}</dt>
									<dd>
										<dl>
											<dt>1、总${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>数字{[{5oC75ZKM}]}值56~95为总大，数字{[{5oC75ZKM}]}值15~54为总小，所有5个开奖号码的{[{5oC75ZKM}]}值为55打和。</p>
											</dd>
											<dt>2、总${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数字{[{5oC75ZKM}]}值是${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}为{[{5oC75ZKM}]}单。</p>
											</dd>
											<dt>3、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
											<dd>
												<p>所有5个开奖号码的数字{[{5oC75ZKM}]}数值的个位数大于或等于5为总${msg['label.ssc.ball.TAIL_BIG']}，小于或等于4为总${msg['label.ssc.ball.TAIL_SMALL']}假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
											</dd>
											
											</dl>
										</dd>
									<dt style="color:red">四、${msg['label.ssc.play.longhu']}:以选择球号之中奖号码作为对奖号码。</dt>
									<dd>
										<p>
											龙1：第一球和第二球比较，开出的第一球大，则结果为龙。 虎2：第一球和第二球比较，开出的第一球小，则结果为虎。
										</p>
										<p>
											龙1：第一球和第三球比较，开出的第一球大，则结果为龙。 虎3：第一球和第三球比较，开出的第一球小，则结果为虎。
										</p>
										<p>
											龙1：第一球和第四球比较，开出的第一球大，则结果为龙。 虎4：第一球和第四球比较，开出的第一球小，则结果为虎。
										</p>
										<p>
											龙1：第一球和第五球比较，开出的第一球大，则结果为龙。 虎5：第一球和第五球比较，开出的第一球小，则结果为虎。
										</p>
										<p>其他${msg['label.ssc.play.longhu']}以此类推</p>
									</dd>
									<dt style="color:red">五、正码</dt>
									<dd>
										<p>从01至21中任意选择1个号码进行${msg['label.ssc.bet']}， ${msg['label.ssc.bet']}号码与开奖号码中任意1个位置的号码相符，即中奖。</p>
									</dd>
									</dl>
			</div>
			<div id="TJKLC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.TJKLC']}游戏规则：</h2>
				中国福利彩票快乐十分（以下简称${msg['title.ssc.TJKLC']}）由中国福利彩票发行管理中心发行和组织销售，经财政部批准的福利彩票销售机构在所辖区域内销售。开奖时间：8点55分~22点55分 (每10分钟一期)，共84期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、第一球~第八球：</dt>
										<dd>
											<p>指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，
												第五球开出是12，${msg['label.ssc.xiazhu']}第五球为12者视为中奖其余情形视为不中奖。</p>
										</dd>
										<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
										<dd>
											<p>指单、双、大、小、${msg['label.ssc.ball.TAIL_BIG']}、 ${msg['label.ssc.ball.TAIL_SMALL']}、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
											<dl>
												<dt>1、单、双：</dt>
												<dd>
													<p>自第一球至第八球，开出的号码 为双数叫双，如8、16，开出的号码为单数叫单，如19、5。</p>
												</dd>
												<dt>2、大、小：</dt>
												<dd>
													<p>自第一球至第八球，开出的号码 大于或等于11为大，开出的号码小于等于10为小。</p>
												</dd>
												<dt>3、${msg['label.ssc.ball.TAIL_BIG']}、${msg['label.ssc.ball.TAIL_SMALL']}：</dt>
												<dd>
													<p>自第一球至第八球，开出号码的尾数 大于等于5为${msg['label.ssc.ball.TAIL_BIG']}，开出号码的尾数小于等于4为${msg['label.ssc.ball.TAIL_SMALL']}。</p>
												</dd>
												<dt>4、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}</dt>
												<dd>
													<p>开出的号码的个位和十位相加，所得数
														字为单数的为合单，如05、12；所得数字为双数的为合双，如08、19。</p>
												</dd>
												<dt>5、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
												<dd>
													<p>所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是31、51；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值
														是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、80；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
												</dd>
												<dt>6、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
												<dd>
													<p>所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是85到132为{[{5oC75ZKM}]}大；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是36到83为{[{5oC75ZKM}]}小；
														所有8个开奖号码的数字{[{5oC75ZKM}]}值为84打和；如开奖号码为01、20、02、08、17、09、11，数值{[{5oC75ZKM}]}是68，则{[{5oC75ZKM}]}小。假如${msg['label.ssc.bet']}组合
														符合中奖结果，视为中奖，其余情形视为不中奖，打和不计算结果。</p>
												</dd>
												<dt>7、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
												<dd>
													<p>所有8个开奖号码的数
														字{[{5oC75ZKM}]}值的个位数大于等于5为总${msg['label.ssc.ball.TAIL_BIG']}，小于等于4为总${msg['label.ssc.ball.TAIL_SMALL']}；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
												</dd>
											</dl>
										</dd>
										<dt style="color:red">三、中发白</dt>
										<dd>
											<p>中：开出的号码为01、02、03、04、05、06、07</p>
											<p>发：开出的号码为08、09、10、11、12、13、14</p>
											<p>白：开出的号码为15、16、17、18、19、20</p>
										</dd>
										<dd></dd>
										<dt style="color:red">四、方位</dt>
										<dd>
											<p>东：开出的号码为01、05、09、13、17</p>
											<p>南：开出的号码为02、06、10、14、18</p>
											<p>西：开出的号码为03、07、11、15、19</p>
											<p>北：开出的号码为04、08、12、16、20</p>
										</dd>
										<dt style="color:red">五、${msg['title.ssc.LIANMA']}</dt>
										<dd>
											<dl>
												<dt>1、${msg['label.ssc.play.SERIAL_2']}：</dt>
												<dd>
													<p>指从01至20中任意选择2个号码对开奖号码中任意2个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意2个
														位置的号码相符，即中奖。</p>
												</dd>
												<dt>2、${msg['label.ssc.play.SERIAL_2_Z']}：</dt>
												<dd>
													<p>指从01至20中任意选择2个号码对开奖号码中按开奖顺序出
														现的2个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的2个连续位置的号码相符（顺序不限），即中奖。</p>
												</dd>
												<dt>3、${msg['label.ssc.play.SERIAL_3']}：</dt>
												<dd>
													<p>指从01至20中任意选择3个号码对开奖号码中任意3个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意3个
														位置的号码相符，即中奖。</p>
												</dd>
												<dt>4、${msg['label.ssc.play.SERIAL_3_Z']}：</dt>
												<dd>
													<p>指从01至20中任意选择3个号码对开奖号码中按开奖顺序出
														现的前3个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的前3个连续位置的号码相符（顺序不限），即中奖。</p>
												</dd>
												<dt>5、${msg['label.ssc.play.SERIAL_4']}：</dt>
												<dd>
													<p>指从01到20中任意选择4个号码，对开奖号码中任意4个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意4个位置的号码相符，即中奖。
													</p>
												</dd>
												<dt>6、${msg['label.ssc.play.SERIAL_5']}：</dt>
												<dd>
													<p>指从01到20中任意选择5个号码，对开奖号码中任意5个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意5个位置的号码相符，即中奖。
													</p>
												</dd>
											</dl>
										</dd>
										<dt style="color:red">六、1~4${msg['label.ssc.play.longhu']}:</dt>
										<dd>
										<dl>
											<dt>第一球龙/虎：</dt>
											<dd>
												<p>“第一球”号码大于“第八球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第二球龙/虎：</dt>
											<dd>
												<p>“第二球”号码大于“第七球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第三球龙/虎：</dt>
											<dd>
												<p>“第三球”号码大于“第六球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第四球龙/虎：</dt>
											<dd>
												<p>“第四球”号码大于“第五球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
										</dl>
									</dd>
									<dd></dd>
									</dl>
			</div>
			<div id="TJSSC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.TJSSC']}游戏规则：</h2>
				${msg['title.ssc.TJSSC']}由中国福利彩票发行管理中心组织，由天津市福利彩票发行中心在所辖区域内承销。开奖时间为 9:00~23:00, 每10分钟一期，共84期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">1. 第一球~第五球</dt>
										<dd>
											<p>第一球~第五球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
											</p>
											<p>
												${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
											</p>
										</dd>
										<dt style="color:red">2. {[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}</dt>
										<dd>
											<p>
												${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值大于等于23为大，小于等于22为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数值{[{5oC75ZKM}]}值是单数为{[{5oC75ZKM}]}单。
											</p>
										</dd>
										<dt style="color:red">3. ${msg['label.ssc.play.QS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第一球、第二球、第三球数字都相同。如中奖号码为000、111、999等，中奖号码的第一球、第二球、第三球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第一球、第二球、第三球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第一球、第二球、第三球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第一球、第二球、第三球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第一球、第二球、第三球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd><dd>
										</dd><dt style="color:red">4. ${msg['label.ssc.play.ZS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第二球、第三球、第四球数字都相同。如中奖号码为000、111、999等，中奖号码的第二球、第三球、第四球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第二球、第三球、第四球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第二球、第三球、第四球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第二球、第三球、第四球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第二球、第三球、第四球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第二球、第三球、第四球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">5. ${msg['label.ssc.play.HS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第三球、第四球、第五球数字都相同。如中奖号码为000、111、999等，中奖号码的第三球、第四球、第五球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第三球、第四球、第五球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第三球、第四球、第五球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第三球、第四球、第五球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第三球、第四球、第五球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第三球、第四球、第五球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">6. ${msg['label.ssc.play.longhu']}和玩法：龙 &gt; 虎 &gt; 和（0为最小，9为最大）</dt>
										<dd>
											<p>龙：开出之号码第一球的中奖号码大于第五球的中奖号码，为龙。如，第一球开出4第五球开出2；第一球开出9第五球开出8;
												第一球开出5第五球开出1…中奖为龙。</p>
											<p>虎：开出之号码第一球的中奖号码小于第五球的中奖号码，为虎。如，第一球开出7第五球开出9；第一球开出3第五球开出5;
												第一球开出5第五球开出8…中奖为虎。</p>
											<p>和：开出之号码第一球的中奖号码等于第五球的中奖号码，为和；如开出结果：2***2、9***9等则${msg['label.ssc.bet']}和局者视为中奖，${msg['label.ssc.bet']}龙、虎不计算输赢。
											</p>
										</dd>
										
										<dt style="color:red">7. 一字组合</dt>
										<dd>
											<p>${msg['label.ssc.play.QS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.ZS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【千位、佰位、拾位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.HS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.QW']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。注：当选号码  无论出现几次，派{[{5b2p}]}只派一次。※例如：买一号，开奖结果为1,1,1,1,1.派{[{5b2p}]}只派一次。</p>
										</dd>
										
										<dt style="color:red">8. 二字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果任二数与所选的号码相同时，即为中奖。
											※举例：${msg['label.ssc.bet']}者购买后二字组合，选择2个相同号码如为11，当期开奖结果如为xx11x、xx1x1、xxx11、皆视为中奖。（x=0~9任一数）
											※举例：${msg['label.ssc.bet']}者购买${msg['label.ssc.play.HS']}二字组合，选择2个不同号码如为12，当期开奖结果如为xx12x、xx1x2、xx21x、xx2x1、xxx12、xxx21皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">9. 三字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选的号码相同时（顺序不限），即为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。</p>
										</dd>
										
										<dt style="color:red">10. 二字定位</dt>
										<dd>
											<p>于万仟佰拾个${msg['label.ssc.play.SERIAL_2']}位，自0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。比如我万仟买1,2这个组合，开奖号码为1,2,3,4,5，即为中奖。其余皆不中！</p>
										</dd>
										
										<dt style="color:red">11. 三字定位</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}${msg['﻿label.ssc.play.SERIAL_3']}位，自0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。举例：${msg['label.ssc.play.QS']}买1,2，3这组，开奖号码为1,2，3,4,5,即中奖。其余皆不中！</p>
										</dd>
										
										
										<dt style="color:red">12. ${msg['title.ssc.ZUX']}三</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，当开奖结果[万位、仟位、佰位]只有两个号码重复，则视为中奖。如果是选择12,其中有一个号码重复则中奖。
											 ※例如：112、211、122、221、若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，当开奖结果[仟位、佰位、拾位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p class="red">（有两个相同但没有相连的也是不中奖的，列如：121、212、123等。）</p>
										</dd>
										
										
										<dt style="color:red">13. ${msg['title.ssc.ZUX']}六</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，[万位、仟位、佰位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[万位、仟位、佰位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，[仟位、佰位、拾位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[仟位、佰位、拾位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
										</dd>
										
										<dt style="color:red">14. 跨度</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：以开奖结果[万位、仟位、佰位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											          ※举例：开奖结果为3、4、8、7、6。中奖的跨度为5。（最大号码8减最小号码3=5）。</p>
											<p>2.${msg['label.ssc.play.ZS']}：以开奖结果[仟位、佰位、拾位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											         ※举例：开奖结果为3、4、8、7、6。中奖的跨度为4。（最大号码8减最小号码4=4）。</p>
											<p>3.${msg['label.ssc.play.HS']}：以开奖结果[佰位、拾位、个位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											        ※举例：开奖结果为3、4、8、7、6。中奖的跨度为2。（最大号码8减最小号码6=2）。</p>
										</dd>
										<dt style="color:red">15. 质合</dt>		
				<dd>
				<p>开奖结果一球、二球、三球、四球或五球数字为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注球号质合与开奖结果的球号质合相符时，即为中奖。 ※举例：{[{5oqV}]}注者购买第一球质，当期开奖结果如为20957（2为质），则视为中奖。</p>
				</dd>
				<dt style="color:red">16. 和数双{[{6Z2i}]}</dt>		
				<dd>
				<p>开奖结果万仟位、万佰位、万拾位、万个位、仟佰位、仟拾位、仟个位、佰拾位、拾个位或佰个位数字和数为1、3、5、7、9、11、13、15、17时为“单”，为0、2、4、6、8、10、12、14、16、18时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。
※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为20290（佰2+拾9=11为单），则视为中奖。 </p>
				</dd>
										
										<dd></dd>
									</dl>
			</div>
			<div id="SDSYXW" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.SDSYXW']}游戏规则：</h2>
				每期${msg['title.ssc.SDSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:55开到晚上21:55，每天开78期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、单码：</dt>
									<dd>
										<p>
											指每一球出现的顺序与号码为派{[{5b2p}]}依据，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，第五球开出是2，${msg['label.ssc.xiazhu']}第五球为2者视为中奖，其余情形视为不中奖。
										</p>
									</dd>

									<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
									<dd>
										<p>指单、双、大、小、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
										<dl>
											<dt>1、单、双：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码为双数叫双，如8、10，开出的号码为单数叫单，如3、5，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>2、大、小：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码大于或等于6为大，开出的号码小于等于5为小，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>3、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是11、31；所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、30；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>4、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和相加的值是大于30为总和大；所有5个开奖号码的数字总和相加的值小于30为总和小，若总和值等于30为和 (不计算输赢)。
											</dd>
											<dt>5、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和值的个位数大于等于5为总尾大，小于等于4为总尾小；假如{[{5oqV}]}注组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>6、总尾${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为单叫总尾单，所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为双叫总尾双；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>7、${msg['label.ssc.play.longhu']}:</dt>
											<dd>
												<p>以第一球的中奖号码和第五球的中奖号码作为兑奖号码。</p>
												<p>龙：开出的号码第一球的中奖号码大于第五球的中奖号码。如第一球开出10第五球开出7等中奖为龙。</p>
												<p>虎：开出的号码第一球的中奖号码小于第五球的中奖号码。如第一球开出3第五球开出7等中奖为虎。</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">三、选号</dt>
									<dd>
										<dl>
											<dt>1、${msg['title.ssc.RX']}一中一：</dt>
											<dd>
												<p>指${msg['label.ssc.bet']}1个号码与当期开奖的5个号码中任1个号码相同，视为中奖。</p>
											</dd>
											<dt>2、${msg['label.ssc.play.SERIAL_2']}中二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}2个号码与当期开奖的5个号码中任2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>3、${msg['﻿label.ssc.play.SERIAL_3']}${msg['label.ssc.play.ZS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}3个号码与当期开奖的5个号码中任3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>4、${msg['label.ssc.play.SERIAL_4']}中四：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}4个号码与当期开奖的5个号码中任4个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>5、${msg['label.ssc.play.SERIAL_5']}中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}5个号码与当期开奖的5个号码中5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>6、${msg['title.ssc.RX']}六中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}6个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>7、${msg['title.ssc.RX']}七中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}7个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>8、${msg['title.ssc.RX']}八中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}8个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>9、${msg['title.ssc.ZUX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>10、${msg['title.ssc.ZUX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>11、${msg['title.ssc.ZX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dt>12、${msg['title.ssc.ZX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dd></dd>
										</dl>
								</dd></dl>
			</div>
			<div id="SHSYXW" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.SHSYXW']}游戏规则：</h2>
				每期${msg['title.ssc.SHSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8：50开到晚上23：50，每天开90期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、单码：</dt>
									<dd>
										<p>
											指每一球出现的顺序与号码为派{[{5b2p}]}依据，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，第五球开出是2，${msg['label.ssc.xiazhu']}第五球为2者视为中奖，其余情形视为不中奖。
										</p>
									</dd>

									<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
									<dd>
										<p>指单、双、大、小、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
										<dl>
											<dt>1、单、双：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码为双数叫双，如8、10，开出的号码为单数叫单，如3、5，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>2、大、小：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码大于或等于6为大，开出的号码小于等于5为小，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>3、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是11、31；所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、30；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>4、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和相加的值是大于30为总和大；所有5个开奖号码的数字总和相加的值小于30为总和小，若总和值等于30为和 (不计算输赢)。
											</dd>
											<dt>5、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和值的个位数大于等于5为总尾大，小于等于4为总尾小；假如{[{5oqV}]}注组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>6、总尾${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为单叫总尾单，所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为双叫总尾双；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>7、${msg['label.ssc.play.longhu']}:</dt>
											<dd>
												<p>以第一球的中奖号码和第五球的中奖号码作为兑奖号码。</p>
												<p>龙：开出的号码第一球的中奖号码大于第五球的中奖号码。如第一球开出10第五球开出7等中奖为龙。</p>
												<p>虎：开出的号码第一球的中奖号码小于第五球的中奖号码。如第一球开出3第五球开出7等中奖为虎。</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">三、选号</dt>
									<dd>
										<dl>
											<dt>1、${msg['title.ssc.RX']}一中一：</dt>
											<dd>
												<p>指${msg['label.ssc.bet']}1个号码与当期开奖的5个号码中任1个号码相同，视为中奖。</p>
											</dd>
											<dt>2、${msg['﻿label.ssc.play.SERIAL_2']}中二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}2个号码与当期开奖的5个号码中任2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>3、${msg['﻿label.ssc.play.SERIAL_3']}${msg['label.ssc.play.ZS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}3个号码与当期开奖的5个号码中任3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>4、${msg['label.ssc.play.SERIAL_4']}中四：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}4个号码与当期开奖的5个号码中任4个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>5、${msg['label.ssc.play.SERIAL_5']}中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}5个号码与当期开奖的5个号码中5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>6、${msg['title.ssc.RX']}六中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}6个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>7、${msg['title.ssc.RX']}七中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}7个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>8、${msg['title.ssc.RX']}八中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}8个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>9、${msg['title.ssc.ZUX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>10、${msg['title.ssc.ZUX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>11、${msg['title.ssc.ZX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dt>12、${msg['title.ssc.ZX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dd></dd>
										</dl>
								</dd></dl>
			</div>
			<div id="HNKLC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.HNKLC']}游戏规则：</h2>
				每期${msg['title.ssc.HNKLC']}（开奖网）开奖球数共八粒。每粒球除了总和玩法，其它都有单独的{[{5oqV}]}注页面。${msg['title.ssc.HNKLC']}每天开84期，每期间隔10分钟。{[{5oqV}]}注时间为8分钟，北京时间（GMT+8）每天白天从上午9：00开到晚上23：00。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、第一球~第八球：</dt>
										<dd>
											<p>指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，
												第五球开出是12，${msg['label.ssc.xiazhu']}第五球为12者视为中奖其余情形视为不中奖。</p>
										</dd>
										<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
										<dd>
											<p>指单、双、大、小、${msg['label.ssc.ball.TAIL_BIG']}、 ${msg['label.ssc.ball.TAIL_SMALL']}、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
											<dl>
												<dt>1、单、双：</dt>
												<dd>
													<p>自第一球至第八球，开出的号码 为双数叫双，如8、16，开出的号码为单数叫单，如19、5。</p>
												</dd>
												<dt>2、大、小：</dt>
												<dd>
													<p>自第一球至第八球，开出的号码 大于或等于11为大，开出的号码小于等于10为小。</p>
												</dd>
												<dt>3、${msg['label.ssc.ball.TAIL_BIG']}、${msg['label.ssc.ball.TAIL_SMALL']}：</dt>
												<dd>
													<p>自第一球至第八球，开出号码的尾数 大于等于5为${msg['label.ssc.ball.TAIL_BIG']}，开出号码的尾数小于等于4为${msg['label.ssc.ball.TAIL_SMALL']}。</p>
												</dd>
												<dt>4、合数${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}</dt>
												<dd>
													<p>开出的号码的个位和十位相加，所得数
														字为单数的为合单，如05、12；所得数字为双数的为合双，如08、19。</p>
												</dd>
												<dt>5、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
												<dd>
													<p>所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是31、51；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值
														是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、80；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
												</dd>
												<dt>6、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
												<dd>
													<p>所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是85到132为{[{5oC75ZKM}]}大；所有8个开奖号码的数字{[{5oC75ZKM}]}相加的值是36到83为{[{5oC75ZKM}]}小；
														所有8个开奖号码的数字{[{5oC75ZKM}]}值为84打和；如开奖号码为01、20、02、08、17、09、11，数值{[{5oC75ZKM}]}是68，则{[{5oC75ZKM}]}小。假如${msg['label.ssc.bet']}组合
														符合中奖结果，视为中奖，其余情形视为不中奖，打和不计算结果。</p>
												</dd>
												<dt>7、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
												<dd>
													<p>所有8个开奖号码的数
														字{[{5oC75ZKM}]}值的个位数大于等于5为总${msg['label.ssc.ball.TAIL_BIG']}，小于等于4为总${msg['label.ssc.ball.TAIL_SMALL']}；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。</p>
												</dd>
											</dl>
										</dd>
										<dt style="color:red">三、中发白</dt>
										<dd>
											<p>中：开出的号码为01、02、03、04、05、06、07</p>
											<p>发：开出的号码为08、09、10、11、12、13、14</p>
											<p>白：开出的号码为15、16、17、18、19、20</p>
										</dd>
										<dd></dd>
										<dt style="color:red">四、方位</dt>
										<dd>
											<p>东：开出的号码为01、05、09、13、17</p>
											<p>南：开出的号码为02、06、10、14、18</p>
											<p>西：开出的号码为03、07、11、15、19</p>
											<p>北：开出的号码为04、08、12、16、20</p>
										</dd>
										<dt style="color:red">五、${msg['title.ssc.LIANMA']}</dt>
										<dd>
											<dl>
												<dt>1、${msg['label.ssc.play.SERIAL_2']}：</dt>
												<dd>
													<p>指从01至20中任意选择2个号码对开奖号码中任意2个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意2个
														位置的号码相符，即中奖。</p>
												</dd>
												<dt>2、${msg['label.ssc.play.SERIAL_2_Z']}：</dt>
												<dd>
													<p>指从01至20中任意选择2个号码对开奖号码中按开奖顺序出
														现的2个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的2个连续位置的号码相符（顺序不限），即中奖。</p>
												</dd>
												<dt>3、${msg['label.ssc.play.SERIAL_3']}：</dt>
												<dd>
													<p>指从01至20中任意选择3个号码对开奖号码中任意3个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意3个
														位置的号码相符，即中奖。</p>
												</dd>
												<dt>4、${msg['label.ssc.play.SERIAL_3_Z']}：</dt>
												<dd>
													<p>指从01至20中任意选择3个号码对开奖号码中按开奖顺序出
														现的前3个连续位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中按开奖顺序出现的前3个连续位置的号码相符（顺序不限），即中奖。</p>
												</dd>
												<dt>5、${msg['label.ssc.play.SERIAL_4']}：</dt>
												<dd>
													<p>指从01到20中任意选择4个号码，对开奖号码中任意4个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意4个位置的号码相符，即中奖。
													</p>
												</dd>
												<dt>6、${msg['label.ssc.play.SERIAL_5']}：</dt>
												<dd>
													<p>指从01到20中任意选择5个号码，对开奖号码中任意5个位置的${msg['label.ssc.bet']}。${msg['label.ssc.bet']}号码与开奖号码中任意5个位置的号码相符，即中奖。
													</p>
												</dd>
											</dl>
										</dd>
										<dt style="color:red">六、1~4${msg['label.ssc.play.longhu']}:</dt>
										<dd>
										<dl>
											<dt>第一球龙/虎：</dt>
											<dd>
												<p>“第一球”号码大于“第八球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第二球龙/虎：</dt>
											<dd>
												<p>“第二球”号码大于“第七球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第三球龙/虎：</dt>
											<dd>
												<p>“第三球”号码大于“第六球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
											<dt>第四球龙/虎：</dt>
											<dd>
												<p>“第四球”号码大于“第五球”号码视为“龙”中奖、反之小于视为“虎”中奖，其余情形视为不中奖。</p>
											</dd>
										</dl>
									</dd>
									<dd></dd>
									</dl>
			</div>
			<div id="BJKLC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.BJKLC']}游戏规则：</h2>
				${msg['title.ssc.BJKLC']}是依照北京福彩网发行的${msg['title.ssc.BJKLC']}的官方开奖结果所规划的游戏。由1至80的号码中随机摇出20个数字作为开奖号码，依这20个号码变化成各式不同的玩法，在根据猜中的号码个数或玩法可以获得不同等级的奖金。 此游戏的开奖时间和开奖号码完全与北京福彩网发行的${msg['title.ssc.BJKLC']}同步，每日从早上9点至晚上23点55分，每五分钟开奖一次，每日开奖179期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、${msg['label.ssc.play.ZHENGMA']}：</dt>
									<dd>
										<p>
											从01至80中任意选择一个号码进行{[{5oqV}]}注，{[{5oqV}]}注号码与20个开奖号码任意一个号码相同，即中奖。
										</p>
									</dd>
									<dt style="color:red">二、${msg['label.ssc.play.TOTAL']}</dt>
									<dd>
										<p>以所有20个号码的${msg['label.ssc.play.TOTAL']}值相加的和值来判定，分为“${msg['label.ssc.play.TOTAL']}大”、“${msg['label.ssc.play.TOTAL']}小”、“${msg['label.ssc.play.TOTAL']}单”、“${msg['label.ssc.play.TOTAL']}双”、“${msg['label.ssc.play.TOTAL']}810”：</p>
										<dl>
											<dt>1、${msg['label.ssc.play.TOTAL']}大/小：</dt>
											<dd>
												<p>20个号码相加的${msg['label.ssc.play.TOTAL']}大于810，为${msg['label.ssc.play.TOTAL']}大;20个号码相加的${msg['label.ssc.play.TOTAL']}小于810，为${msg['label.ssc.play.TOTAL']}小。</p>
											</dd>
											<dt>2、${msg['label.ssc.play.TOTAL']}单/双：</dt>
											<dd>
												<p>20个号码相加的${msg['label.ssc.play.TOTAL']}值为单数，为${msg['label.ssc.play.TOTAL']}单;20个号码相加的${msg['label.ssc.play.TOTAL']}值为双数，为${msg['label.ssc.play.TOTAL']}双。</p>
											</dd>
											<dt>3、${msg['label.ssc.play.TOTAL']}810：</dt>
											<dd>
												<p>20个号码相加的${msg['label.ssc.play.TOTAL']}值等于810，为${msg['label.ssc.play.TOTAL']}810(当${msg['label.ssc.play.TOTAL']}值等于810，则${msg['label.ssc.play.TOTAL']}大、${msg['label.ssc.play.TOTAL']}小、${msg['label.ssc.play.TOTAL']}单、${msg['label.ssc.play.TOTAL']}双退回本金，打和不计算输赢)</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">三、${msg['label.ssc.play.TOTAL']}{[{6L+H5YWz}]}</dt>
									<dd>
										<p>以所有20个号码的${msg['label.ssc.play.TOTAL']}值相加的和值来判定，通过大小和单双组合产生“总大单”、“总大双”、“总小单”、“总小双”</p>
										<dl>
											<dt>1、总${msg['label.ssc.ball.BIG']}单/双：</dt>
											<dd>
												<p>20个号码相加的${msg['label.ssc.play.TOTAL']}大于810的单数为“总大单”;20个号码相加的${msg['label.ssc.play.TOTAL']}大于810的双数为“总大双”。</p>
											</dd>
											<dt>2、总${msg['label.ssc.ball.SMALL']}单/双：</dt>
											<dd>
												<p>20个号码相加的${msg['label.ssc.play.TOTAL']}小于810的单数为“总小单”;20个号码相加的${msg['label.ssc.play.TOTAL']}小于810的双数为“总小双”。</p>
											</dd>
											<p>20个号码相加的${msg['label.ssc.play.TOTAL']}值等于810，则视为和局，总大单/双、总小单/双不计算输赢)</p>
										</dl>
									</dd>
									<dt style="color:red">四、${msg['label.ssc.play.QIANHE']}</dt>
									<dd>
										<p>开奖号码01至40为前盘号码，41至80为后盘号码</p>
										<dl>
											<dt>1、前(多)：</dt>
											<dd>
												<p>开出的20个号码中，前盘号码(01-40)比后盘号码(41-80)个数多时，则为前(多)</p>
											</dd>
											<dt>2、后(多)：</dt>
											<dd>
												<p>开出的20个号码中，前盘号码(01-40)比后盘号码(41-80)个数少时，则为后(多)</p>
											</dd>
											<dt>2、前后(和)：</dt>
											<dd>
												<p>开出的20个号码中，前盘号码(01-40)和后盘号码(41-80)个数相同时(各10个数字)，则为前后(和)</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">五、${msg['label.ssc.play.ODDHE']}</dt>
									<dd>
										<p>开奖号码中1、3、5……75、77、79为单数号码，2、4、6……76、78、80为双数号码</p>
										<dl>
											<dt>1、单(多)：</dt>
											<dd>
												<p>开出的20个号码中，单数号码比双数号码个数多时，则为单(多)</p>
											</dd>
											<dt>2、双(多)：</dt>
											<dd>
												<p>开出的20个号码中，单数号码比双数号码个数少时，则为双(多)</p>
											</dd>
											<dt>2、单双(和)：</dt>
											<dd>
												<p>开出的20个号码中，单数号码和双数号码个数相同时，则为单双(和)</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">六、${msg['label.ssc.play.WUXING']}:</dt>
									<dd>
										<p>开出的20个号码相加的${msg['label.ssc.play.TOTAL']}值分为五个段，以金、木、水、火、土命名：金(210~695)、木(696~763)、水(764~855)、火(856~923)、土(924~1410)</p>
									</dd>
								
									</dl>
			</div>
			<div id="YNSSC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.YNSSC']}游戏规则：</h2>
				该游戏{[{5oqV}]}注时间、开奖时间和开奖号码与${msg['title.ssc.YNSSC']}完全同步，北京时间（GMT+8）每天白天从上午09:30开到晚上21:30，每10分钟开一次奖，每天开奖72期。
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">1. 第一球~第五球</dt>
										<dd>
											<p>第一球~第五球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
											</p>
											<p>
												${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
											</p>
										</dd>
										<dt style="color:red">2. {[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}</dt>
										<dd>
											<p>
												${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值大于等于23为大，小于等于22为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号数字{[{5oC75ZKM}]}值是双数为{[{5oC75ZKM}]}双，数值{[{5oC75ZKM}]}值是单数为{[{5oC75ZKM}]}单。
											</p>
										</dd>
										<dt style="color:red">3. ${msg['label.ssc.play.QS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第一球、第二球、第三球数字都相同。如中奖号码为000、111、999等，中奖号码的第一球、第二球、第三球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第一球、第二球、第三球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第一球、第二球、第三球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第一球、第二球、第三球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第一球、第二球、第三球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd><dd>
										</dd><dt style="color:red">4. ${msg['label.ssc.play.ZS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第二球、第三球、第四球数字都相同。如中奖号码为000、111、999等，中奖号码的第二球、第三球、第四球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第二球、第三球、第四球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第二球、第三球、第四球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第二球、第三球、第四球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第二球、第三球、第四球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第二球、第三球、第四球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">5. ${msg['label.ssc.play.HS']}玩法：${msg['label.ssc.ball.BAOZI']} &gt; ${msg['label.ssc.ball.SHUNZI']} &gt; ${msg['label.ssc.ball.DUIZI']} &gt; ${msg['label.ssc.ball.BANSHUN']} &gt; ${msg['label.ssc.ball.ZA_6']}</dt>
										<dd>
											<p>${msg['label.ssc.ball.BAOZI']}：中奖号码的第三球、第四球、第五球数字都相同。如中奖号码为000、111、999等，中奖号码的第三球、第四球、第五球数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BAOZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.SHUNZI']}：中奖号码的第三球、第四球、第五球数字都相连，不分顺序。（数字9、0、1相连）如中奖号码为123、901、321、546等，中奖号码的第三球、第四球、第五球数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.SHUNZI']}者视为中奖，其它视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.DUIZI']}：中奖号码的第三球、第四球、第五球任意两位数字相同。（不包括${msg['label.ssc.ball.BAOZI']}）如中奖号码为001、112、696等，中奖号码有两位数字相同，则${msg['label.ssc.bet']}${msg['label.ssc.ball.DUIZI']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.BAOZI']}，则${msg['label.ssc.ball.DUIZI']}视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.BANSHUN']}：中奖号码的第三球、第四球、第五球任意两位数字相连，不分顺序。（不包括${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}）如中奖号码为540、390、706等，中奖号码有两位数字相连，则${msg['label.ssc.bet']}${msg['label.ssc.ball.BANSHUN']}者视为中奖，其它视为不中奖。如果开奖号码为${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}，则${msg['label.ssc.ball.BANSHUN']}视为不中奖。如中奖号码为123、901、556、233等，视为不中奖。
											</p>
											<p>${msg['label.ssc.ball.ZA_6']}：不包括${msg['label.ssc.ball.BAOZI']}、${msg['label.ssc.ball.SHUNZI']}、${msg['label.ssc.ball.DUIZI']}、${msg['label.ssc.ball.BANSHUN']}的所有中奖号码，如中奖第三球、第四球、第五球号码为157、964等，中奖号码位数之间没有关联性，则${msg['label.ssc.bet']}${msg['label.ssc.ball.ZA_6']}者视为中奖，其它视为不中奖。
											</p>
										</dd>
										<dt style="color:red">6. ${msg['label.ssc.play.longhu']}和玩法：龙 &gt; 虎 &gt; 和（0为最小，9为最大）</dt>
										<dd>
											<p>龙：开出之号码第一球的中奖号码大于第五球的中奖号码，为龙。如，第一球开出4第五球开出2；第一球开出9第五球开出8;
												第一球开出5第五球开出1…中奖为龙。</p>
											<p>虎：开出之号码第一球的中奖号码小于第五球的中奖号码，为虎。如，第一球开出7第五球开出9；第一球开出3第五球开出5;
												第一球开出5第五球开出8…中奖为虎。</p>
											<p>和：开出之号码第一球的中奖号码等于第五球的中奖号码，为和；如开出结果：2***2、9***9等则${msg['label.ssc.bet']}和局者视为中奖，${msg['label.ssc.bet']}龙、虎不计算输赢。
											</p>
										</dd>
										
										<dt style="color:red">7. 一字组合</dt>
										<dd>
											<p>${msg['label.ssc.play.QS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.ZS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【千位、佰位、拾位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.HS']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。</p>
											<p>${msg['label.ssc.play.QW']}：0~9${msg['title.ssc.RX']}1号进行${msg['label.ssc.bet']}，当开奖结果【万位、千位、佰位、拾位、个位】任一数与所选的号码相同时，即为中奖。注：当选号码  无论出现几次，派{[{5b2p}]}只派一次。※例如：买一号，开奖结果为1,1,1,1,1.派{[{5b2p}]}只派一次。</p>
										</dd>
										
										<dt style="color:red">8. 二字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果任二数与所选的号码相同时，即为中奖。
											※举例：${msg['label.ssc.bet']}者购买后二字组合，选择2个相同号码如为11，当期开奖结果如为xx11x、xx1x1、xxx11、皆视为中奖。（x=0~9任一数）
											※举例：${msg['label.ssc.bet']}者购买${msg['label.ssc.play.HS']}二字组合，选择2个不同号码如为12，当期开奖结果如为xx12x、xx1x2、xx21x、xx2x1、xxx12、xxx21皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">9. 三字组合</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选的号码相同时（顺序不限），即为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。
											※举例：${msg['label.ssc.bet']}者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。</p>
										</dd>
										
										<dt style="color:red">10. 二字定位</dt>
										<dd>
											<p>于万仟佰拾个${msg['label.ssc.play.SERIAL_2']}位，自0~9${msg['title.ssc.RX']}2个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。比如我万仟买1,2这个组合，开奖号码为1,2,3,4,5，即为中奖。其余皆不中！</p>
										</dd>
										
										<dt style="color:red">11. 三字定位</dt>
										<dd>
											<p>于${msg['label.ssc.play.QS']}、${msg['label.ssc.play.ZS']}、${msg['label.ssc.play.HS']}${msg['﻿label.ssc.play.SERIAL_3']}位，自0~9${msg['title.ssc.RX']}3个号进行${msg['label.ssc.bet']}，当开奖结果与所选号码相同且顺序一致时，即为中奖。举例：${msg['label.ssc.play.QS']}买1,2，3这组，开奖号码为1,2，3,4,5,即中奖。其余皆不中！</p>
										</dd>
										
										
										<dt style="color:red">12. ${msg['title.ssc.ZUX']}三</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，当开奖结果[万位、仟位、佰位]只有两个号码重复，则视为中奖。如果是选择12,其中有一个号码重复则中奖。
											 ※例如：112、211、122、221、若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，当开奖结果[仟位、佰位、拾位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 
											※例如：112、344，若是开出${msg['label.ssc.ball.BAOZI']}则不算中奖。 ※备注："${msg['label.ssc.ball.BAOZI']}"为三字同号，例如：111、222</p>
											<p class="red">（有两个相同但没有相连的也是不中奖的，列如：121、212、123等。）</p>
										</dd>
										
										
										<dt style="color:red">13. ${msg['title.ssc.ZUX']}六</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：会员可以任意挑选一组或者多组号码，[万位、仟位、佰位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[万位、仟位、佰位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
											<p>2.${msg['label.ssc.play.ZS']}：会员可以任意挑选一组或者多组号码，[仟位、佰位、拾位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[仟位、佰位、拾位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
											<p>3.${msg['label.ssc.play.HS']}：会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
										</dd>
										
										<dt style="color:red">14. 跨度</dt>
										<dd>
											<p>1.${msg['label.ssc.play.QS']}：以开奖结果[万位、仟位、佰位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											          ※举例：开奖结果为3、4、8、7、6。中奖的跨度为5。（最大号码8减最小号码3=5）。</p>
											<p>2.${msg['label.ssc.play.ZS']}：以开奖结果[仟位、佰位、拾位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											         ※举例：开奖结果为3、4、8、7、6。中奖的跨度为4。（最大号码8减最小号码4=4）。</p>
											<p>3.${msg['label.ssc.play.HS']}：以开奖结果[佰位、拾位、个位]的最大差距（跨度），作为中奖依据。会员可以选择0~9的任一跨度。
											        ※举例：开奖结果为3、4、8、7、6。中奖的跨度为2。（最大号码8减最小号码6=2）。</p>
										</dd>
										<dt style="color:red">15. 质合</dt>		
				<dd>
				<p>开奖结果一球、二球、三球、四球或五球数字为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注球号质合与开奖结果的球号质合相符时，即为中奖。 ※举例：{[{5oqV}]}注者购买第一球质，当期开奖结果如为20957（2为质），则视为中奖。</p>
				</dd>
				<dt style="color:red">16. 和数双{[{6Z2i}]}</dt>		
				<dd>
				<p>开奖结果万仟位、万佰位、万拾位、万个位、仟佰位、仟拾位、仟个位、佰拾位、拾个位或佰个位数字和数为1、3、5、7、9、11、13、15、17时为“单”，为0、2、4、6、8、10、12、14、16、18时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。
※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为20290（佰2+拾9=11为单），则视为中奖。 </p>
				</dd>
										
										<dd></dd>
									</dl>
			</div>
			<div id="SHSSC" style="font-size:12px" class="ui-body ui-body-a">
			<h2>${msg['title.ssc.SHSSC']}游戏规则：</h2>
				${msg['title.ssc.SHSSC']}游戏是依照中国福利彩票发行管理中心统一发行的『天天彩选3』 彩票的开奖数据为依据所规划的线上彩票游戏，每天从上午10:00 (北京时间)开到晚上21:30 (北京时间)，每半小时开一次奖，每天开奖23期，
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">1. 第一球~第三球</dt>
									<dd>
										<p>
											第一球~第三球：指${msg['label.ssc.xiazhu']}的每一球与开出之号码其开奖顺序及开奖号码相同，视为中奖，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，其余情形视为不中奖。
										</p>
										<p>
											${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号，判定胜负。<br>${msg['label.ssc.play.BIG_SMALL']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号大于等于5为大，小于等于4为小。<br>${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：根据相应单项${msg['label.ssc.bet']}第一球~第五球开出的球号为双数叫双，如2、6；为单数叫单，如1、3。
										</p>
									</dd>
									<dt style="color:red">2. 和数双{[{6Z2i}]}</dt>
									<dd>
										<p>
										 	单双玩法说明<br>
										 	 开奖结果佰拾位、拾个位或佰个位数字总和的个位数为1、3、5、7、9时为“单”，若为0、2、4、6、8时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。 <br>
										 	 ※举例：{[{5oqV}]}注者购买和数佰拾位单，当期开奖结果如为290（佰2+拾9=11为单），则视为中奖。<br>
										 	 开奖结果佰拾个位数字总和为1、3、5、7、9时为“单”，若为0、2、4、6、8时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。 <br> 
										 	  ※举例：{[{5oqV}]}注者购买和数佰拾个位单，当期开奖结果如为290（佰2+拾9=11为单），则视为中奖。<br>	 
									    </p>
										<p>
										 	大小玩法说明<br>
											开奖结果佰拾个位数字总和的为14、15、16、17、18、19、20、21、22、23、24、25、26、27时为“大”， 若为0、1、2、3、4、5、6、7、8、9、10、11、12、13时为“小”，当{[{5oqV}]}注和数大小与开奖结果的和数大小相符时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买和数大，当期开奖结果如为976（佰9+拾7+个6=22为大），则视为中奖。<br>
											开奖结果佰拾个位数字总和为1、3、5、7、9时为“单”，若为0、2、4、6、8时为“双”，当{[{5oqV}]}注和数单双与开奖结果的和数单双相符时，即为中奖。&nbsp;
											※举例：{[{5oqV}]}注者购买和数佰拾个位单，当期开奖结果如为290（佰2+拾9=11为单），则视为中奖。
										</p>
										<p>
											质合玩法说明<br>
											开奖结果佰拾位、拾个位或佰个位数字总和的个位数为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注号码与开奖结果的质合相符时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买佰拾位合，当期开奖结果如为957（佰9+拾5=14，尾数4为合数），则视为中奖。<br>
											开奖结果佰拾个位数字总和的个位数为1、2、3、5、7时为“质数”，若为0、4、6、8、9时为“合数”，当{[{5oqV}]}注号码与开奖结果的质合相符时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买佰拾个位质，当期开奖结果如为957（佰9+拾5+个7=21，尾数1为质数），则视为中奖。
										</p>
										<p>
											佰拾个和数尾数说明<br>
											开奖结果佰拾个数字总和的尾数为5、6、7、8、9时为“大”，若为0、1、2、3、4时为“小”，当{[{5oqV}]}注和尾数大小与开奖结果的和尾数大小相符时，即为中奖。
											※举例：{[{5oqV}]}注者购买佰拾个和尾数小，当期开奖结果如为471（佰4+拾7+个1=12，尾数2为小），则视为中奖。
										</p>
									</dd>
									
										<dt style="color:red">3. 一字组合</dt>
										<dd>
											<p>0~9任选1个号进行{[{5oqV}]}注，当开奖结果佰拾个任一数与所选的号码相同时，即为中奖；若开奖结果出现重覆数字时，视为中奖一次。<br>
											※举例：{[{5oqV}]}注者购买一字组合，选择号码为1，当期开奖结果如为1xx、x1x、xx1皆视为中奖。（x=0~9任一数）；若开奖的结果为11x、1x1、x11或111仅视为中奖一次。</p>
										</dd>
										
										<dt style="color:red">4. 二字组合</dt>
										<dd>
											<p>0~9任选2个号进行{[{5oqV}]}注，当开奖结果任二数与所选的号码相同时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买二字组合，选择2个相同号码如为11，当期开奖结果如为11x、1x1、x11、皆视为中奖。（x=0~9任一数）<br>
											※举例：{[{5oqV}]}注者购买二字组合，选择2个不同号码如为12，当期开奖结果如为12x、1x2、21x、2x1、x12、x21皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">5. 三字组合</dt>
										<dd>
											<p>自0~9号任选3个皆相同的号码时（如111），当开奖结果与所选号码相同时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买三字组合，选择号码为111，当期开奖结果如为111则视为中奖。<br>
											※举例：{[{5oqV}]}注者购买三字组合，选择号码为112，当期开奖结果如为112、121、211皆视为中奖。<br>
											※举例：{[{5oqV}]}注者购买三字组合，选择号码为123，当期开奖结果如为123、132、213、231、312、321皆视为中奖。</p>
										</dd>
										
										<dt style="color:red">6. 二字定位</dt>
										<dd>
											<p>于佰拾个任选二位，自0~9任选2个号进行{[{5oqV}]}注，当开奖结果与所选号码相同且顺序一致时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买二字佰拾定位，选择号码为佰位1、拾位2，当期开奖结果如果只要佰位与拾位皆与其所选的号码相同且顺序一致时，个位数无论为12x皆视为中奖。（x=0~9任一数）</p>
										</dd>
										
										<dt style="color:red">7. 三字定位</dt>
										<dd>
											<p>于佰拾个位自0~9任选3个号进行{[{5oqV}]}注，当开奖结果与所选号码相同且顺序一致时，即为中奖。<br>
											※举例：{[{5oqV}]}注者购买三字佰拾个定位，选择号码为123，当期开奖结果如为123，即视为中奖。</p>
										</dd>
										
										<dt style="color:red">8. 组选三</dt>
										<dd>
											<p>会员可以任意挑选一组或者多组号码，当开奖结果[佰位、拾位、个位]只有两个号码重复，则视为中奖。如果是选择12,34,其中有一个号码重复则中奖。 ※例如：112、344，若是开出豹子则不算中奖。 ※备注："豹子"为三字同号，例如：111、222</p>
										</dd>
										
										<dt style="color:red">9. 组选六</dt>
										<dd>
											<p>会员可以任意挑选一组或者多组号码，[佰位、拾位、个位]没有任何号码重复，则视为中奖。 ※例如：如果是选择(123)，则开奖结果[佰位、拾位、个位]为123、321、132、213、都中奖，其他都是不中奖。例如：112、133、145、333、121等都是不中奖。</p>
										</dd>
										
										<dt style="color:red">10. 跨度</dt>
										<dd>
											<p>以开奖三个号码的最大差距(跨度)，作为中奖的依据。会员可以选择0~9的任一跨度,例如开奖结果为3，4，8。中奖的跨度为5。(最大号码 8减最小号码 3 = 5),若开奖结果三个号码都相同，则中奖的跨度为0。</p>	
										</dd>
										
										
										<dd></dd>
									</dl>
			</div>
			<div id="SYXWTY" style="font-size:12px" class="ui-body ui-body-a">
			<h2><span id="h_id">${msg['title.ssc.JSSYXW']}游戏规则：</span></h2>
				<span id="js_id">
				每期${msg['title.ssc.HBSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:25开到晚上21:55，每天开81期。
				</span>
				<dl>
										<h2 class="blue">具体游戏规则如下:</h2>
										<dt style="color:red">一、单码：</dt>
									<dd>
										<p>
											指每一球出现的顺序与号码为派{[{5b2p}]}依据，如第一球开出号码8，${msg['label.ssc.xiazhu']}第一球为8者视为中奖，第五球开出是2，${msg['label.ssc.xiazhu']}第五球为2者视为中奖，其余情形视为不中奖。
										</p>
									</dd>

									<dt style="color:red">二、${msg['label.ssc.twosides']}</dt>
									<dd>
										<p>指单、双、大、小、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}${msg['label.ssc.play.BIG_SMALL']}、{[{5oC75ZKM}]}${msg['label.ssc.ball.TAIL_BIG']}${msg['label.ssc.ball.TAIL_SMALL']}：</p>
										<dl>
											<dt>1、单、双：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码为双数叫双，如8、10，开出的号码为单数叫单，如3、5，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>2、大、小：</dt>
											<dd>
												<p>自第一球至第五球，开出的号码大于或等于6为大，开出的号码小于等于5为小，开出11为和 (不计算输赢)。</p>
											</dd>
											<dt>3、{[{5oC75ZKM}]}${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是单数的为{[{5oC75ZKM}]}单，如数字{[{5oC75ZKM}]}值是11、31；所有5个开奖号码的数字{[{5oC75ZKM}]}相加的值是双数为{[{5oC75ZKM}]}双，如数字{[{5oC75ZKM}]}是42、30；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>4、{[{5oC75ZKM}]}${msg['label.ssc.play.BIG_SMALL']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和相加的值是大于30为总和大；所有5个开奖号码的数字总和相加的值小于30为总和小，若总和值等于30为和 (不计算输赢)。
											</dd>
											<dt>5、总${msg['label.ssc.ball.TAIL_BIG']}小：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字总和值的个位数大于等于5为总尾大，小于等于4为总尾小；假如{[{5oqV}]}注组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>6、总尾${msg['label.ssc.ball.ODD']}${msg['label.ssc.ball.EVEN']}：</dt>
											<dd>
												<p>
													所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为单叫总尾单，所有5个开奖号码的数字{[{5oC75ZKM}]}值的尾数为双叫总尾双；假如${msg['label.ssc.bet']}组合符合中奖结果，视为中奖，其余情形视为不中奖。
												</p>
											</dd>
											<dt>7、${msg['label.ssc.play.longhu']}:</dt>
											<dd>
												<p>以第一球的中奖号码和第五球的中奖号码作为兑奖号码。</p>
												<p>龙：开出的号码第一球的中奖号码大于第五球的中奖号码。如第一球开出10第五球开出7等中奖为龙。</p>
												<p>虎：开出的号码第一球的中奖号码小于第五球的中奖号码。如第一球开出3第五球开出7等中奖为虎。</p>
											</dd>
										</dl>
									</dd>
									<dt style="color:red">三、选号</dt>
									<dd>
										<dl>
											<dt>1、${msg['title.ssc.RX']}一中一：</dt>
											<dd>
												<p>指${msg['label.ssc.bet']}1个号码与当期开奖的5个号码中任1个号码相同，视为中奖。</p>
											</dd>
											<dt>2、${msg['﻿label.ssc.play.SERIAL_2']}中二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}2个号码与当期开奖的5个号码中任2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>3、${msg['﻿label.ssc.play.SERIAL_3']}${msg['label.ssc.play.ZS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}3个号码与当期开奖的5个号码中任3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>4、${msg['label.ssc.play.SERIAL_4']}中四：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}4个号码与当期开奖的5个号码中任4个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>5、${msg['label.ssc.play.SERIAL_5']}中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}5个号码与当期开奖的5个号码中5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>6、${msg['title.ssc.RX']}六中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}6个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>7、${msg['title.ssc.RX']}七中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}7个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>8、${msg['title.ssc.RX']}八中五：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}8个号码中任5个号码与当期开奖的5个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>9、${msg['title.ssc.ZUX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>10、${msg['title.ssc.ZUX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同(顺序不限)，视为中奖。</p>
											</dd>
											<dt>11、${msg['title.ssc.ZX']}前二：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的2个号码与当期顺序开出的5个号码中的前2个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dt>12、${msg['title.ssc.ZX']}${msg['label.ssc.play.QS']}：</dt>
											<dd>
												<p>${msg['label.ssc.bet']}的3个号码与当期顺序开出的5个号码中的前3个号码相同且顺序一致，视为中奖。</p>
											</dd>
											<dd></dd>
										</dl>
								</dd></dl>
			</div>
			<div id="KSTY" style="font-size:12px" class="ui-body ui-body-a">
			<h2><span id="h_id_ks">${msg['title.ssc.AHKS']}游戏规则：</span></h2>
				<span id="js_id_ks">
				${msg['title.ssc.AHKS']}由中国福利彩票发行管理中心组织销售，安徽省福利彩票发行中心承销，北京时间（GMT+8）每天白天从上午08:40开到晚上22:00，每10分钟开一次奖，每天开奖80期。
				</span>
				<dl>
					<h3 style="color:blue">具体游戏规则如下:</h3>
					<h4>{[{6aqw}]}宝：</h4>
					<dt style="color:red">一、{[{5Y2a5b2p}]}者可在下列各瓣${msg['label.ssc.xiazhu']}：</dt>
					<dd>
						<p>
							1. “小”三粒骰子之${msg['label.ssc.play.POINT']}{[{5oC75ZKM}]}由4点至10点；<br>2. “大”三粒骰子之${msg['label.ssc.play.POINT']}{[{5oC75ZKM}]}由11点至17点；<br>
							<span class="red">注：若三粒骰子平面${msg['label.ssc.play.POINT']}相同，通吃“大”、“小”各注；</span><br>3.“${msg['label.ssc.play.SAN_JUN']}”任何一粒骰子出现选定之平面${msg['label.ssc.play.POINT']}；<br>4.“${msg['label.ssc.play.WEI_SUAI']}”三粒骰子平面与选定${msg['label.ssc.play.POINT']}相同；<br>5.“${msg['label.ssc.play.QUAN_SUAI']}”在一点至六点内，三粒骰子平面${msg['label.ssc.play.POINT']}相同；<br>6.“${msg['label.ssc.play.POINT']}”由4点至17点，三粒骰子平面${msg['label.ssc.play.POINT']}之{[{5oC75ZKM}]}；<br>7.“${msg['label.ssc.play.LONG_CARDS']}”：任两粒骰子之平面${msg['label.ssc.play.POINT']}；<br>8.“${msg['label.ssc.play.SHORT_CARDS']}”：选定两粒骰子之平面${msg['label.ssc.play.POINT']}；
						</p>
					</dd>
					<dt style="color:red">二、上一条款各式${msg['label.ssc.bet']}${msg['title.ssc.radio']}如下：</dt>
					<dd>
						<p>
							1.“小”一赔一<br>2.“大”一赔一<br>3“.${msg['label.ssc.play.SAN_JUN']}”投中一粒骰子平面${msg['label.ssc.play.POINT']}一赔一，两骰相同一赔二，三骰相同一赔三；<br>4.“${msg['label.ssc.play.WEI_SUAI']}”一赔一百五十；<br>5.“${msg['label.ssc.play.QUAN_SUAI']}”一赔二十四；<br>6.“${msg['label.ssc.play.POINT']}”<br>&nbsp;&nbsp;&nbsp;&nbsp;4点及17点，一赔五十；<br>&nbsp;&nbsp;&nbsp;&nbsp;5点及16点，一赔十八；<br>&nbsp;&nbsp;&nbsp;&nbsp;6点及15点，一赔十四；<br>&nbsp;&nbsp;&nbsp;&nbsp;7点及14点，一赔十二；<br>&nbsp;&nbsp;&nbsp;&nbsp;8点及13点，一赔八；<br>&nbsp;&nbsp;&nbsp;&nbsp;9点、10点、11点及12点，一赔六<br>7.“${msg['label.ssc.play.LONG_CARDS']}”一赔五；<br>8.“${msg['label.ssc.play.SHORT_CARDS']}”一赔八；<br>
							<span class="blue">注意：以上说明“${msg['title.ssc.radio']}”仅作为规则讲解示范，实际${msg['title.ssc.radio']}以${msg['label.ssc.bet']}{[{5rOo}]}单为准。</span>
						</p>
					<dd></dd>
				</dl>
			</div>
			
								
		</div>
	</div> 
</div>
</body>
<script type= "text/javascript">
$(function() {
	hideAll();
	$("#"+$("#sgid").val()).show();
});
function hideAll(){
	$("#KLC").hide();
	$("#GXKLC").hide();
	$("#TJKLC").hide();
	$("#HNKLC").hide();
	$("#BJKLC").hide();
	$("#SSC").hide();
	$("#TJSSC").hide();
	$("#YNSSC").hide();
	$("#SHSSC").hide();
	$("#BJC").hide();
	$("#XYNC").hide();
	$("#JSKS").hide();
	$("#AHKS").hide();
	$("#GXKS").hide();
	$("#JXSSC").hide();
	$("#XJSSC").hide();
	$("#GDSYXW").hide();
	$("#SHSYXW").hide();
	$("#SDSYXW").hide();
	$("#SYXWTY").hide();
	$("#KSTY").hide();
}
function showRule(){
	hideAll();
	if($("#sgid").val() == "JXSYXW" || $("#sgid").val() == "LNSYXW" || $("#sgid").val() == "HBSYXW" || $("#sgid").val() == "JSSYXW"){
		if($("#sgid").val() == "JSSYXW"){
			var hStr = "${msg['title.ssc.JSSYXW']}游戏规则：";//${msg['title.ssc.JSSYXW']}游戏规则：
			var jsStr = "每期${msg['title.ssc.JSSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:25开到晚上22:05，每天开82期。";//每期江苏十$_$一选五（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:25开到晚上21:55，每天开82期。
			$("#h_id").html(replaceAllHtml(hStr));
			$("#js_id").html(replaceAllHtml(jsStr));
		}else if($("#sgid").val() == "HBSYXW"){
			var hStr = "${msg['title.ssc.HBSYXW']}游戏规则：";//${msg['title.ssc.JSSYXW']}游戏规则：
			var jsStr = "每期${msg['title.ssc.HBSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:25开到晚上21:55，每天开81期。";
			$("#h_id").html(replaceAllHtml(hStr));
			$("#js_id").html(replaceAllHtml(jsStr));
		}else if($("#sgid").val() == "LNSYXW"){
			var hStr = "${msg['title.ssc.LNSYXW']}游戏规则：";//${msg['title.ssc.JSSYXW']}游戏规则：
			var jsStr = "每期${msg['title.ssc.LNSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午8:38开到晚上22:28，每天开83期。";
			$("#h_id").html(replaceAllHtml(hStr));
			$("#js_id").html(replaceAllHtml(jsStr));
		}else if($("#sgid").val() == "JXSYXW"){
			var hStr = "${msg['title.ssc.JXSYXW']}游戏规则：";//${msg['title.ssc.JSSYXW']}游戏规则：
			var jsStr = "每期${msg['title.ssc.JXSYXW']}（开奖网）开奖球数共五粒，每期间隔10分钟。北京时间（GMT+8）每天白天从上午09:00开到晚上22:00，每天开78期。";
			$("#h_id").html(replaceAllHtml(hStr));
			$("#js_id").html(replaceAllHtml(jsStr));
		}
		$("#SYXWTY").show();
	}else if($("#sgid").val() == "JSKS" || $("#sgid").val() == "AHKS" || $("#sgid").val() == "GXKS"){
		if($("#sgid").val() == "JSKS"){
			var hStr = replaceAllHtml("${msg['title.ssc.JSKS']}游戏规则：");
			var jsStr = "原名：江苏福彩“快3”，该游戏的${msg['label.ssc.bet']}时间、开奖时间和开奖号码与“江苏快3”完全同步（官方网），北京时间（GMT+8）每天白天从上午08:30开到晚上22:10，每10分钟开一次奖，每天开奖82期。";
			jsStr = replaceAllHtml(jsStr);
			$("#h_id_ks").html(replaceAllHtml(hStr));
			$("#js_id_ks").html(jsStr);
		}else if($("#sgid").val() == "AHKS"){
			var hStr = "${msg['title.ssc.AHKS']}游戏规则：";
			var jsStr = "${msg['title.ssc.AHKS']}由中国福利彩票发行管理中心组织销售，安徽省福利彩票发行中心承销，北京时间（GMT+8）每天白天从上午08:40开到晚上22:00，每10分钟开一次奖，每天开奖80期。";
			$("#h_id_ks").html(replaceAllHtml(hStr));
			$("#js_id_ks").html(replaceAllHtml(jsStr));
		}else if($("#sgid").val() == "GXKS"){
			var hStr = "${msg['title.ssc.GXKS']}游戏规则：";
			var jsStr = "${msg['title.ssc.GXKS']}由中国福利彩票发行管理中心组织销售，广西省福利彩票发行中心承销，北京时间（GMT+8）每天白天从上午09:25开到晚上22:25，每10分钟开一次奖，每天开奖78期。";
			$("#h_id_ks").html(replaceAllHtml(hStr));
			$("#js_id_ks").html(replaceAllHtml(jsStr));
		}
		$("#KSTY").show();
	}else{
		$("#"+$("#sgid").val()).show();
	}
}

	document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</html>