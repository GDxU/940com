<%--------------------------------规则----------------------------%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<%@ include file="/WEB-INF/page/global.jsp" %>
<script src="${staticFileUrl}/js/sport/panel.js"></script>
<link rel="stylesheet" href="${staticFileUrl}/css/sport.css">
<style>
	#afficheInfoListView > .ui-li-static {
	  padding: .7em 1em;
	}
</style>

</head>
<body>
<div data-role="page" id="afficheInfoPage">
		<div data-role="header" data-position="fixed" data-tap-toggle="false">
			<a href="#quick-links" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-bars ui-btn-icon-notext"></a>
		   <div class="header-bg">
             <div class="logo inline-block">
                 <img src="${staticFileUrl}/images/logo_vinbet.png" height="40">
             </div>
         </div>
         <a href="#user-center" data-role="none" class="ui-btn2 ui-shadow ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-right" data-ajax="false" data-iconpos="right"> </a>
	     <div data-role="header" data-theme="c">
	     	<a href="#" data-rel="back" class="ui-btn-left ui-btn ui-icon-arrow-l ui-btn-icon-notext ui-shadow ui-corner-all"></a>
	 		<h1>${msg['label.sport.rules']}</h1>
			<%--<a href="#" class="ui-btn-right ui-btn ui-icon-refresh ui-btn-icon-notext ui-shadow ui-corner-all"></a> --%>
			<div id="gamec" data-role="navbar" data-mini="true" data-position="fixed" style="background-color:#f9f9f9;">
			    <ul class="navGame">
			    	<li><a onclick="changeSportGame('football3')"  href="#" class="ui-btn-active">Soccer</a></li>
			    	<li><a onclick="changeSportGame('bsktball2')"  href="#">Basketball</a></li>			    	
			    </ul>
			</div>
		 </div>
	</div>
	<%@ include file="panel_left.jsp"%>
	<%@ include file="panel_right.jsp" %>
 <div data-role="main" class="ui-content content_detail sportGameContent">
		 <div id="bsktball">
			<div id="tdlsub_li1_3" style="visibility:visible;">
                <table cellpadding="0" cellspacing="0">
                	<tbody>
                	<br>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">General rules</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Should any change made to the scheduled venue, all bets will be considered void.<br><br></li>
                                <li>NBA/NBL games must last for at least 43 minutes for the bets to stand. For all other Basketball leagues or competitions, games must last for at least 35 minutes for the bets to stand, unless otherwise stated.<br><br></li>
                                <li>NCAA games must last for at least 35 minutes for the bets to stand, unless otherwise stated.<br><br></li>
                                <li>Should any matches be abandoned during 1st half, bets concerning 1st half are considered void; Should any matches be abandoned during 2nd half , bets count for 1st half and bets concerning 2nd half are considered void, unless otherwise stated in Specific Event Betting Rules.<br><br></li>
                                <li>For Quarter/ Half Betting, the match must be completed for bets to stand, unless otherwise explicitly stated in Specific Event Betting Rules.<br><br></li>
                                <li>NCAA Venue Rules: Please note that the HOME and AWAY venue displayed on the website is for reference only. Whether the scheduled venue is changed to Home/ Away/ Neutral venue or not, all bets will stand as well.<br><br></li>
                                <li>If not otherwise stated, overtime counts for the playing time.<br><br></li>
                                <li>If the match starts ahead of the scheduled time, bets do count before the commencement and all bets after the commencement will be considered void. This excludes In-Play bets.<br><br></li>
                                <li> Bets concerning any full match or the 2nd half will include the over time. But bets on the fourth quarter do not include over time.（unless otherwise stated, e.g. 4th Quarter）</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">General Betting Rules and Regulations</strong></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">1.	Money Line</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict which team will win the match. There are two teams as betting options.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                        </ol></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">2.	Handicap</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict which team will win FT/ HT/Quarter with the indicated handicap applied.</li>
                                <li>If the match is abandoned or cancelled during the 2nd half, all bets concerning 1st half do count.</li>
                                <li>If the match is abandoned or cancelled during the 2nd half, all bets concerning 2nd half will be considered void.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">3.	In-Play Handicap</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict which team will win FT/ HT/Quarter with the indicated handicap applied.</li>
                                <li>Settlement is based on the result with handicap applied to 0-0 score line, regardless of the bets on the scores of that time.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">4.	Over/ Under (Total Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict whether the total points of the match will be over or under the indicated total line.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                                <li>When the match is abandoned, Over/ Under bets can be settled only on the result without being affected by any further points. In any other scenario, bets will be considered void.</li>
                                <li>If the match is abandoned during the 1st half, all bets concerning 1st half will be void except bets that have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand. </li>
                                <li>If the match is abandoned or cancelled during the 2nd Half, all bets concerning 1st half do count.</li>
                                <li>If the match is abandoned or cancelled during the 2nd Half, all bets concerning 2nd half will be void except bets that have been previously decided. And there is no further effect on the market result for the bets to stand.</li>
                                <li>If the match is abandoned, bets concerning all periods will be void unless one of the two occurs:
                                	<ol type="a" start="1">
                                    	<li>The period is already completed prior to the abandonment.</li>
                                        <li>The bets have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand.</li>
                                    </ol>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">5.	In-Play Over/ Under (Total Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict whether the total points of the match will be over or under the indicated total line.</li>
                                <li>Settlement is based on the result with handicap applied to 0-0 score line, regardless of the bets on the scores of that time.</li>
                                <li>When the match is abandoned, bets can be settled only on the result without being affected  by any further points. In any other scenario, bets will be considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">6.	Over/ Under (Home/ Away Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict whether the total Home/ Away points will be over or under the indicated line.</li>
                                <li>If the match is abandoned, all bets will be considered void except bets that have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand.</li>
                                <li>All bets will be settled according to official statistics by the relevant sporting body.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">7.	Odd/ Even</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict whether the total points of the match will be odd or even. Overtime counts.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">8.	Team to Score First</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score first during the match.</li>
                                <li>If the match is abandoned after the points have been made, then the team that scores first do count and all bets are valid.</li>
                                <li>If the match is abandoned before the points have been made, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then all bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">9.	Team to Score Last</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score last during the match.</li>
                                <li>If the match is abandoned at any time, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then all bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">10.	Highest Scoring in a Quarter</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score most points in a single quarter.</li>
                                <li>Overtime does not count.</li>
                                <li>If the match is abandoned at any time, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">11.	Team to Score 20 Points First</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score20 points first in each quarter.</li>
                                <li>Overtime does not count.</li>
                                <li>It can be settled only for the bets that have been decided previously and there is no further effect on the market result for the bets to stand when the match is abandoned. In any other scenario, bets will be considered void.</li>
                                <li>If neither team scores 20 points in each quarter, then bets are considered void.</li>
                                <li>It will be clearly marked on the market if there is any change to the points which depends on the actual scores for a specified team.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">12.	Team Points- Last Digit</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict the last digit of the final scores for the home or away team.</li>
                                <li>The result is based on the official posted result, including overtime.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">13.	Fantasy Basketball Rules</strong></td>
                    </tr>
                    <tr>
                    </tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Fantasy Basketball bets are placed on any two selected teams from different matches on the same date.</li>
                                <li>Fantasy Basketball results will be based on the actual scores, which are taken in account for the handicap of the fantasy match as well.</li>
                                <li>The two teams involved in Fantasy Basketball must play on the same date for bets to stand.</li>
                                <li>Should the playing time of either team be different from that posted on the company’s website, all Fantasy match-bets concerning this team will be void.</li>
                                <li>The venues where games are actually played would not be taken into account for Fantasy match-bets.</li>
                                <li>Hers is an example of a Fantasy Game:
                                	<ol id="ola" type="a" start="1">
                                    	<li>Boston Celtic 101- 98 Chicago Bulls, LA Lakers 118- 101 Orlando Magic</li>
                                        <li>Fantasy Game 1: Boston Celtic VS LA Lakers</li>
                                        <li>Fantasy Game Result: Boston Celtic 101- 118 LA Lakers</li>
                                        <li>The result will be based on the actual scores of the respective matches.</li>
                                    </ol>
                                </li>
                                <li>The scheduled play must be completed by the two teams and the relevant result must be upheld by the official governing body (e.g. NBA) for bets to stand. Should the scheduled play be unfinished by either team or the relevant result be denied by the official governing body (e.g. NBA), then all bets concerning this team will be void.</li>
                                <li>Specific Event Betting Rules apply to all fantasy matches.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">Basketball Specials</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Predict the number of points, steals, rebounds, assists, three-point shots, etc.</li>
                                <li>Bets will be settled on the official result of the match, including overtime.</li>
                                <li>Both teams or players of both sides must compete in the game for bets to stand.</li>
                                <li>Should one side/ team or both be absent in the game, all bets will be considered void</li>
                            </ol>
                        </td>
                    </tr>
                </tbody></table>
                </div>
                <a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 1000);" data-role="button" data-theme="y" class="ui-link ui-btn ui-btn-y ui-shadow ui-corner-all" role="button">${msg["button.common.backTop"]}</a>
		 </div>
		 <div id="football">
		 	<div id="cnt_li1" class="infor_group"><!------------------------------infor_group_1-->       	
            <span class="s_contain1"> 
                <div id="tdlsub_li1_2" style="visibility:visible;">
                <table cellpadding="0" cellspacing="0">
                	<tbody>
                	<br>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">Rules and Regulations</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Unless otherwise stated, the result of soccer refer to the score at the end of regular time <strong style="color:#F63;">(Regular time usually refers to 90 minutes, if less than 90minutes is played in a match, announcement will be made accordingly)</strong>, including any stoppage time added by the referee Extra-time does not count.<br><br></li>
                                <li>All matches must begin at the scheduled time, or else bets will be considered void. If a match is postponed or suspended, all bets will be considered void as well.<br><br></li>
                                <li>If a match begins before the scheduled time, bets made before the actual kick-off will be considered void.<br><br></li>
                                <li>Bets made in the 1st half apply to the 1st half only. If a match is abandoned before the end of the 1st half, all bets will be considered void, while if it is abandoned before the 2nd half, then bets made in the 1st half are still valid.<br><br></li>
                                <li>The company will not recognize any arguments of results made 72 hours after the Event’s start time. If within 72 hours, result amendments will be made only in the cases like result revision from Sport Discipline Committee, human error or webpage error etc.<br><br></li>
                                <li>The bet minimum and maximum stake will be set by the company. No notice will be made in advance if any change is needed.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td style="font-size:12px; color:#066;">The Company provides information (e.g. Red card, timer, statistical information, dates, commencement, etc.) as prompt messages and accepts no liability whatsoever. It is the customer’s responsibility to be aware of the correct information for any match. <br><br>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">Abandonment, Postponements or Cancellation</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Some markets have different rules and regulations regarding abandoned, postponements, and cancellations which are listed in the Specific Sport Rules.<br><br></li>
                                <li>If an Event does not begin on the scheduled start date and is not completed within the originally scheduled completion date prescribed in the specific sports rules, then all bets will be void, except for those on Markets that have been unconditionally determined.<br><br></li>
                                <li>If an Event starts but is later abandoned, and is not completed within the originally scheduled completion date prescribed in the specific sports rules, then all bets will be void, except for those on Markets that have been unconditionally determined.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">General Betting Rules and Regulations</strong></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">1.	Moneyline</strong></td>
                    </tr>
                    <tr>
                    	<td>Moneyline means betting on one competitor or team to defeat another in an Event or to be placed higher in an Event match-up. Remaining Moneyline rules are set out in the Specific Event Betting Rules.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">2.	HDP</strong></td>
                    </tr>
                    <tr>
                    	<td>Handicap means betting under the condition that one competitor or team receives a virtual head start (that team gets the head start even before the Event begins). The winner is the competitor or team with the better score after adding the given handicap to the result. Remaining Handicap rules are set out in the Specific Event Betting Rules.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">3.	OU</strong></td>
                    </tr>
                    <tr>
                    	<td>Over/Under means the result is determined by the final total points (goals, games etc) of an Event. If the final total points higher than the Over/Under pre-designated line then the winning result is Over; if it is less than the Over/Under pre-designated line then the winning result is Under.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">4.	OE</strong></td>
                    </tr>
                    <tr>
                    	<td>Odd/Even means betting that is determined by whether the final total points (goals, games etc.) of an Event is Odd or Even.<br><br></td>
                    </tr><tr>
                    	<td><strong style="color:#066;">5.	Mix Parlays</strong></td>
                    </tr>
                    <tr>
                    	<td>Mix Parlay means bets in a combination of two or more selections placed as one wager. If all selections should win then the Parlay wins and will be paid at the combined odds of the two or more selections. If one (or more) selection should fail to win then the Parlay loses. If one (or more) selections should be postponed then the odds for that selection will revert to 1.00 odds. During LIVE Mix Parlay, if any bet in the selection is REJECTED, then the Parlay will be VOID.<br><br></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">Specific Event Betting Rules</strong></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">1.	1x2</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li>1X2 means betting in any one of three possible winning outcomes for an Event. </li>
								<li>1 refers to the team that is named first (usually the home team); </li>
								<li>X refers to the game resulting in a tie</li>
								<li>2 refers to the team that is named second (usually the away team).</li>

                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">2.	Correct Score</strong></td>
                    </tr>
                    <tr>
                    	<td>Correct Score means betting to predict the final score at the end of full-time.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">3.	Total Goal</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li>Full Game Total Goal</li>                             
								<li>Means betting determined by the total sum of goals scored in an Event.</li>
								<li>Bets will be void if the match is abandoned</li>
								<li>First Half Total Goal:</li>
								<li>First Half Total Goal means betting determined by the total sum of goals scored in the first half of a match.</li>
								<li>Bets will be void if the first half of the match is abandoned.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">4.	Home Team Total vs. Away Team Total</strong></td>
                    </tr>
                    <tr>
                    	<td>Home Team Total Goal vs. Away Team Total Goal means betting to predict the total number of goals scored by the home teams versus the total number of goals scored by the away teams for matches in a specific league played on a certain day. In a match Home refers to the team mentioned firstly and Away refers to the team mentioned secondly.
<br><br></td>
                    </tr>
                  	<tr>
                    	<td><strong style="color:#066;">5.	Half-time/Full-time (HT.FT)</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                             	<li>Half-time/Full-time means betting to predict both the Half-time result and Full-time result of an Event (extra-time does not count). </li>
								<li>The following with respect to this Market shall mean: H refers to the team mentioned firstly in a match (usually the home team); D refers to a draw; A refers to the team mentioned secondly in a match (usually the away team).</li>
								<li>Example – HA means that the first named team (Home) will be leading at half-time, and the second named team (Away) will be leading at full-time.
</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">6.	First Goal/Last Goal</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol  id="ola" type="a" start="1">
                            	<li>First Goal/Last Goal means betting on which team will score the first or last goal in a match. With respect to this Market, the following shall mean: HF refers to the first named team (usually the home team) scoring the first goal. HL refers to the first named team scoring the last goal. AF refers to the second named team (usually the away team) scoring the first goal. AL refers to the second named team scoring the last goal. NG refers to no goals being scored during the Event. Own goals count to the team credited with the goal.</li>
								<li>If an Event is abandoned after a goal is scored then all bets on First Goal (and No Goal) will stand while bets on Last Goal will be void. If an Event is abandoned without any goal being scored then all wagers on First Goal, Last Goal and No Goal will be void.</li>

                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">7.	Single Team Over/Under</strong></td>
                    </tr>
                    <tr>
                    	<td>Single Team Over/Under means goal scored by a specified team in a match. If the total is more than the OU line then the winning result is over; if the total is less than the OU line then the winning result is Under.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">8.	Clean Sheets</strong></td>
                    </tr>
                    <tr>
                    	<td>Clean Sheets means betting "Yes" on a team to keep a clean sheet (not to concede a goal) or "No" on a team not to keep a clean sheet (to concede a goal).<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">9.	TO WIN TO NIL</strong></td>
                    </tr>
                    <tr>
                    	<td>Predict whether your selection can win the match without conceding a goal after regular time of play, excluding extra time or penalty shoot-outs.<br><br></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">10.	 Corners</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li>An awarded corner but untaken does not count.<br><br></li>
								<li><strong style="color:#F63;">Handicap</strong>: Handicap means betting on which team will take the most corners during a match inclusive of any handicaps.<br><br></li> 
 								<li><strong style="color:#F63;">Over/Under</strong> means betting on the total number of corners taken by both teams during a match.<br><br></li>
								<li>If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under.<br><br></li>
 								<li>Bets will be void if the match is abandoned.<br><br></li>
								<li><strong style="color:#F63;">First Corner</strong> means betting on which team will take the first corner in a match.<br>Bets will stand if the match is abandoned after the first corner scores; while the bet will be void if the match is abandoned before the first corner scores.<br><br></li>
							   	<li><strong style="color:#F63;">Last Corner</strong> means betting on which team will take the last corner in a match.<br>Bets will be void if a match is abandoned<br><br></li>
							 	<li><strong style="color:#F63;">Next Corner</strong> means betting on which team will take the next corner in a match.<br>All bets are considered valid if the designated corner had been taken.<br><br></li>

                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">11.	Total Bookings</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">A yellow card</strong> counts as one point and a red card counts as two points. The maximum number of points that a player can receive during a match is three (one for a yellow and two for a red, the second yellow card does not count). Cards shown to non-players (managers, coaches, substitutes etc.) do not count.<br><br></li>
                                <li><strong style="color:#F63;">Number of Total Bookings</strong> it means betting on the total number range of bookings at the end of full time. Bets are considered void if a match is abandoned.<br><br></li> 
								<li><strong style="color:#F63;">Handicap</strong> means betting on which team will receive the most cards during a match inclusive of any handicaps.<br><br></li>
								<li><strong style="color:#F63;">Over/Under</strong> means betting on the total number of cards received by both teams during a match.  If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under.  Bets will be void if the match is abandoned<br><br></li>
								<li><strong style="color:#F63;">First Booking</strong> means betting on which team will receive first booking (Yellow or Red) in a match.  If two or more players receive a booking for the same incident then the player who is shown the first card by the referee will be deemed the winner.  If a match is abandoned after the first card has been issued then all bets are valid. If a match is abandoned before the first card has been issued then all bets are void.<br><br></li>
								<li><strong style="color:#F63;">Last Booking</strong> means betting on which team will receive last booking (Yellow or Red) in a match.  If a match is abandoned then all bets are void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">12.	Offsides</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Number of Offside</strong> means betting on the number of times offside being caught during a match at the end of full time. Bets are void if a match is abandoned.<br><br></li>
								<li><strong style="color:#F63;">Handicap</strong> means betting on which team will be caught offside the most number of times during a match, inclusive of any handicaps.<br><br></li>
								<li><strong style="color:#F63;">Over/Under</strong> means betting on the total number range of offside decisions during a match.  If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under. All bets are void if a match is abandoned.<br><br></li>
								<li><strong style="color:#F63;">First Offside</strong> means betting on which team will be caught offside first in a match.  If a match is abandoned after the first offside decision then all bets are valid. If a match is abandoned before the first offside decision then all bets are void.<br><br></li>
								<li><strong style="color:#F63;">Last Offside</strong> means betting on which team will be caught offside last in a match. If a match is abandoned then all bets are void.</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">14.	Penalties</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Number of Penalties</strong> means betting on how many penalties awarded at the end of full time. All bets are void if a match is abandoned.<br><br></li>
								<li><strong style="color:#F63;">First Penalty</strong> means betting on which team will be awarded the first penalty.  If a match is abandoned after a penalty has been awarded and taken then all bets are still valid. If a match is abandoned before a penalty has been awarded and taken then all bets are void.<br><br></li>
								<li><strong style="color:#F63;">Last penalty</strong> means betting on which team will be awarded the last penalty. All bets are void if a match is abandoned.<br><br></li>
								<li><strong style="color:#F63;">Penalty Shoot-outs</strong> means betting on which team will win the penalty shootout. If the pre-designated Penalty does not score. <br><br></li>
								<li><strong style="color:#F63;">Penalty Handicap</strong> in handicap betting the result includes all penalties taken in the shoot-out, including sudden death. <br><br></li>
                                <li><strong style="color:#F63;">Penalty Over/Under</strong> in over/under betting the result only includes the regulation ten penalties in the shoot-out and does not include sudden death. Bets are considered void if penalty shoot-out does not score.
</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">15.	Free Kick</strong></td>
                    </tr>
                    <tr>
                    	<td>An awarded free kick but untaken do not count. Free kick refers to direct free kick and indirect free kick. (Except Penalty kick).</td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Number of Free Kicks</strong> means betting on the total number range of Free Kicks. Bets are void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">Handicap</strong> means betting on which team will take the most free kicks during a match inclusive of any handicaps. All bets will be void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">Over/Under</strong> means betting on the total number of free kicks taken by both teams during a match.  If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under.  Bets will be void if the match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">First Free kick</strong> means betting on which team will take the first free kick in a match. If a match is abandoned after the first free kick has been taken then all bets are valid. If a match is abandoned before the first free kick has been taken then all bets are void.<br><br></li>
                                <li><strong style="color:#F63;">Last Free kick</strong> means betting on which team will take the last free kick in a match. All bets are void if a match is abandoned.</li>
                            </ol>
                        </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">16.	 Goal Kick</strong></td>
                    </tr>
                    <tr>
                    	<td>A goal kick is awarded to the defending team if the ball completely crosses the end line, as a result of contact with an opposing player. An awarded goal kick but untaken and goal kick by a goalkeeper after making a save do not count.</td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Number of Goal Kick</strong> means betting on the total number range of Goal Kick at the end of full time. Bets are void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">Handicap</strong> means betting on which team will take the most goal kicks during a match inclusive of any handicaps. Bets are void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">Over/Under</strong> means betting on the total number of goal kicks taken by both teams during a match. If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under.<br><br></li>
                                <li><strong style="color:#F63;">First Goal kick</strong> means betting on which team will take the first goal kick in a match. If a match is abandoned after the first goal kick has been taken then all bets are valid. If a match is abandoned before the first goal kick has been taken then all bets are void.<br><br></li>
                            	<li><strong style="color:#F63;">Last Goal kick</strong> means betting on which team will take the last goal kick in a match.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">17.	Throw-in</strong></td>
                    </tr>
                    <tr>
                    	<td>A throw-in is awarded to a team if the ball completely crosses the side touch line, as a result of contact with an opposing player.</td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Number of Throw-in</strong> means betting on the total number range of Throw-in at the end of full time. Bets are void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">Handicap</strong> means betting on which team will take the most throw-in during a match inclusive of any handicaps.<br><br></li>
                                <li><strong style="color:#F63;">Over/Under</strong> means betting on the total number of throw-in taken by both teams during a match. If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under. Bets are void if a match is abandoned.<br><br></li>
                                <li><strong style="color:#F63;">First Throw-in</strong> means betting on which team will first take the throw-in in a match. If a match is abandoned after the first throw-in has been taken then all bets are valid. If a match is abandoned before the first throw-in has been taken then all bets are void.<br><br></li>
                                <li><strong style="color:#F63;">Last Throw-in</strong> means betting on which team will lastly take the Throw-in in a match. Bets are void if a match is abandoned.</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">18.	 Specific 10 Minutes Over/Under (O/U)</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">10th Minute OU</strong> 00:00 – 10:00 O/U: Total number of points to be scored from 00:00 till 10:00. All bets must be placed on or before the end of the 10th minute.<br><br></li>
                                <li><strong style="color:#F63;">20th Minute OU</strong> 10:01 – 20:00 O/U: Total number of points to be scored from 10:01 till 20:00. All bets must be placed on or before the end of the 20th minute.<br><br></li>
                                <li><strong style="color:#F63;">30th Minute OU</strong> 20:01 – 30:00 O/U: Total number of points to be scored from 20:01 till 30:00. All bets must be placed on or before the end of the 30th minute.<br><br></li>
                                <li><strong style="color:#F63;">40th Minute OU</strong> 30:01 – 40:00 O/U: Total number of points to be scored from 30:01 till 40:00. All bets must be placed on or before the end of the 40th minute.<br><br></li>
                                <li><strong style="color:#F63;">60th Minute OU</strong> 50:01 – 60:00 O/U: Total number of points to be scored from 50:01 till 60:00. All bets must be placed on or before the end of the 60th minute.<br><br></li>
                                <li><strong style="color:#F63;">70th Minute OU</strong> 60:01 – 70:00 O/U: Total number of points to be scored from 60:01 till 70:00. All bets must be placed on or before the end of the 70th minute.<br><br></li>
                                <li><strong style="color:#F63;">80th Minute OU</strong> 70:01 – 80:00 O/U: Total number of points to be scored from 70:01 till 80:00. All bets must be placed on or before the end of the 80th minute.</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">19.  Highest Scoring Player</strong></td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Outright</strong>
results are subject to the official outcome announced by the regulatory agencies when the match is over. (Own goals&amp; Penalty Shoot-outs are excluded)
<br><br></li>
                                <li><strong style="color:#F63;">Highest Scoring Player in One-to-one play</strong> own goals&amp; Penalty Shoot-outs do not count, while extra-time does. Bets are void if the player does not come to play or quits. Results are subject to the official outcome announced by the regulatory agencies when the match is over.</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td><strong style="color:#066;">20.  Injury Time</strong></td>
                     </tr>
                     <tr>
                    	<td>Injury time means the extra playing time added on to compensate for time spent attending to injured players during the match. The injury time may be awarded during the end of the 1st half or the end of the 2nd half, and the duration may be as follows: None, 1 minute, 2 minutes, 3 minutes. Betting on Injury Time awarded at the End of 1st Half means time spent on the 1st half is prolonged as a result of player injury.</td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Injury Time awarded at the End of 1st Half</strong> All bets placed are based on the full 45-minute play excluding extra time. Bets are settled on the Injury time awarded by the match fourth official referee after the full 45 minutes of play or at end of 1st half. If a match is abandoned at any time during the 1st Half, all bets on Injury Time Awarded at the end of 1st Half will be considered void and bets will be refunded to the member’s accounts.<br><br></li>
                                <li><strong style="color:#F63;">Injury Time awarded at the End of the 2nd Half</strong> All bets placed are based on the full 90-minute play excluding extra time. Bets are settled on the Injury time awarded by the match fourth official referee after the full 90 minutes of play or at end of 2nd half.  If a match is abandoned at any time, all bets on Injury Time Awarded at the end of 2nd Half will be considered void.  Settlement will subject to official outcome announced by the Organizer.<br><br></li>
                                <li><strong style="color:#F63;">Injury time awarded Over/Under</strong> 1st Half Injury Time Over/Under means betting Over/Under on the injury time awarded at the end of 1st half.  If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under. Bets are settled on the injury time awarded by the match fourth official referee after the full 45 minutes of play or at end of 1st half.<br><br></li>
                                <li><strong style="color:#F63;">Injury time awarded at end of 2nd half Over/Under</strong> 2nd Half Injury Time Over/Under means betting Over/Under on the injury time awarded at the end of 2nd half. If the total is more than the OU line then the winning result is Over; if the total is less than the OU line then the winning result is Under. Bets are settled on the injury time awarded by the match fourth official referee after the full 90 minutes of play or at end of 2nd half.</li>
                            </ol>
                         </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">21.  Double Chance</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <strong style="color:#F63; padding-left:15px;">Options Available</strong>
                        	<ol id="ola" type="a" start="1">
                            	<li>1 or X - If the result is either a home or draw then bets on this option are winners.</li>
								<li>X or 2 - If the result is either a draw or away then bets on this option are winners.</li>
								<li>1 or 2 - If the result is either a home or away then bets on this option are winners.</li>
								<li>If a match is played at a neutral venue the team listed first is deemed the home team for betting purposes.</li>
                            </ol>
                         </td>
                      </tr>
                      <tr>
                    	<td>
                        	<strong style="color:#066;">22.  Wining team</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td>Winning team means betting to predict a Home or Away win in a match. If the final result at the end of regular time is a Draw, all bets will be refunded.<br><br></td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">23.  Both/One /Neither to score</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        	<ol id="ola" type="a" start="1">
                            	<li>Both= both teams to score.</li>
 								<li>One= either team to score.</li>
								<li>Neither= both team not to score.</li>
                            </ol>
                         </td>
                      </tr>
                      <tr>
                    	<td>
                        	<strong style="color:#066;">24.  Fantasy League</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">
                        	Fantasy matches are pairings of teams from different matches.<br>
							For Instance:<br>
							Match A: Man United vs. Man City <strong style="color:#F63;">Result 3:2</strong><br>
							Match B: Arsenal vs. Liverpool <strong style="color:#F63;">Result: 3:1</strong><br>
							Fantasy League Man United vs. Liverpool <strong style="color:#F63;">Result 3:1</strong><br><br>

Match A and match B are really matches, while Fantasy League means a virtual match between two teams from each of the two matches. Data of the virtual match including goals, corners and red cards are based on the real matches. 
							<br><br>
                            </span>
                         </td>
                      </tr>
                      <tr>
                    	<td>
                        	<strong style="color:#066;">25.  To Win Either Half</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td>Predict whether your selection can score more goals than their opponent in one of two halves.<br><br></td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">26.  To Win Both Halves</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td>Predict whether your selection can score more goals than their opponent in one of two halves. If your selection scores in the first half of a match and the match finishes 1-0, although the first half was won 1-0 , the score in the second 45 minutes was effectively 0-0 and therefore a draw. If this occurs, only the first half is considered to have been 'won' and therefore bets would be losers.<br><br></td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">27.  Highest Scoring Team</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">
                        	Team with highest scoring is the winner. Goal Difference does not count.<br>
							If teams are level on scores, then Dead Heat rules apply.<br><br>
							<strong style="color:#F63;">Abandonments and Postponements</strong><br>
							Bets for the team who had a match abandoned or postponed (but not rescheduled within the period stated by the company) will be refunded to members’ account.<br><br>
							Example<br>
							Man city 4, Swansea 4<br>
							Liverpool 4, Sunderland 1<br>
							Then Liverpool, Man city and Swansea are the winners
							<br><br>
                        </span>
                        </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">28.  Highest Scoring Group</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">
                        	 It means betting to predict the total number of goals scored by the group in the date specified.<br>
                             If groups are level on scores, then Dead Heat rules apply.<br><br>
                             Example:<br>
                             <strong style="color:#F63;">Group A</strong><br>
                             Poland –vs- Greece 2-1= 3Goals<br>
                             Russia -vs- Czech3 - 2 = 5 Goals<br><br>
                             <strong style="color:#F63;">Group B</strong><br>
                             England -vs- Bosnia 1-1=2 Goals<br>
                             Sweden-vs- Austria 3 -2=5 Goals<br><br>
                             <strong style="color:#F63;">Group C</strong><br>
                             Spain-vs-Germany 1-2=3Goals<br>
                             France-vs-Norway 3-1=4 Goals<br><br>
                             <strong style="color:#F63;">Group D</strong><br>
                             Switzerland-vs- Hungary 2-0=2Goals<br>
                             Itlay-vs- Ukraine 3-1=4 Goals<br>
                             Group A Total: 8Goals<br>
                             Group B Total: 7Goals<br>
                             Group C Total: 7 Goals<br>
                             Group D: 6 Goals<br>
                             Group A is the winner<br><br>
                        </span>
                        </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">29.  Exact Group Points</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">Exact Group Points means betting on a team to get a specific number of total points at the end of the Group round.</span>
                        </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">30.  Team Group Points</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">It means betting on a team's points at the end of the Group round which accurately matched the categories offered, "<strong style="color:#F63;">Under</strong>", "<strong style="color:#F63;">Inclusive</strong>" &amp; "<strong style="color:#F63;">Over</strong>".<br><br>
                        Example:<br>
                        Total points of Team X is 5 points, If bet is:<br>
                        Under 3 points – <strong style="color:#F63;">lose</strong><br>
                        Inclusive 3-4 points – <strong style="color:#F63;">lose</strong><br>
                        Over 4 points – <strong style="color:#F63;">win</strong><br>
                        </span>
                        </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">31.   Group Straight Forecast</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">It means betting to predict the teams that will place first and second, in specific order, in the team standings of their respective Group at the end of the Group stage.</span>
                        </td>
                     </tr>
                     <tr>
                    	<td>
                        	<strong style="color:#066;">32.   First Goal Method</strong>
                        </td>
                     </tr>
                     <tr>
                    	<td class="txt_indent0">
                        <span style="padding-left:40px; width:93%;">It means predicting the way the first goal of a match is scored by either team.</span><br>
                        <ol id="ola" type="a" start="1">
                            	<li><strong style="color:#F63;">Free-kick Goal</strong> must be scored directly from the free kick. Deflected shots count provided the free-kick taker is awarded the goal. Also includes goals scored directly from a corner kick.</li>
								<li><strong style="color:#F63;">Penalty-Goal</strong> must be scored directly from the penalty, with penalty taker as named scorer.</li>
								<li><strong style="color:#F63;">Own Goal</strong> If a goal is declared as an own goal.</li>
								<li><strong style="color:#F63;">Header</strong> Last touch of the scorer must be with the head.</li>
								<li><strong style="color:#F63;">Shot</strong> All other goal-types not included above.</li>
                        </ol>
                        
                        </td>
                     </tr>
                </tbody></table>
                </div>
                <div id="tdlsub_li1_3" style="visibility:hidden; height:0px; overflow:hidden;">
                <table cellpadding="0" cellspacing="0">
                	<tbody><tr>
                    	<th>Basketball</th>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">General rules</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Should any change made to the scheduled venue, all bets will be considered void.<br><br></li>
                                <li>NBA/NBL games must last for at least 43 minutes for the bets to stand. For all other Basketball leagues or competitions, games must last for at least 35 minutes for the bets to stand, unless otherwise stated.<br><br></li>
                                <li>NCAA games must last for at least 35 minutes for the bets to stand, unless otherwise stated.<br><br></li>
                                <li>Should any matches be abandoned during 1st half, bets concerning 1st half are considered void; Should any matches be abandoned during 2nd half , bets count for 1st half and bets concerning 2nd half are considered void, unless otherwise stated in Specific Event Betting Rules.<br><br></li>
                                <li>For Quarter/ Half Betting, the match must be completed for bets to stand, unless otherwise explicitly stated in Specific Event Betting Rules.<br><br></li>
                                <li>NCAA Venue Rules: Please note that the HOME and AWAY venue displayed on the website is for reference only. Whether the scheduled venue is changed to Home/ Away/ Neutral venue or not, all bets will stand as well.<br><br></li>
                                <li>If not otherwise stated, overtime counts for the playing time.<br><br></li>
                                <li>If the match starts ahead of the scheduled time, bets do count before the commencement and all bets after the commencement will be considered void. This excludes In-Play bets.<br><br></li>
                                <li> Bets concerning any full match or the 2nd half will include the over time. But bets on the fourth quarter do not include over time.（unless otherwise stated, e.g. 4th Quarter）</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">General Betting Rules and Regulations</strong></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">1.	Money Line</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will win the match. There are two teams as betting options.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                        </ol></td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">2.	Handicap</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will win FT/ HT/Quarter with the indicated handicap applied.</li>
                                <li>If the match is abandoned or cancelled during the 2nd half, all bets concerning 1st half do count.</li>
                                <li>If the match is abandoned or cancelled during the 2nd half, all bets concerning 2nd half will be considered void.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">3.	In-Play Handicap</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will win FT/ HT/Quarter with the indicated handicap applied.</li>
                                <li>Settlement is based on the result with handicap applied to 0-0 score line, regardless of the bets on the scores of that time.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">4.	Over/ Under (Total Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict whether the total points of the match will be over or under the indicated total line.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                                <li>When the match is abandoned, Over/ Under bets can be settled only on the result without being affected by any further points. In any other scenario, bets will be considered void.</li>
                                <li>If the match is abandoned during the 1st half, all bets concerning 1st half will be void except bets that have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand. </li>
                                <li>If the match is abandoned or cancelled during the 2nd Half, all bets concerning 1st half do count.</li>
                                <li>If the match is abandoned or cancelled during the 2nd Half, all bets concerning 2nd half will be void except bets that have been previously decided. And there is no further effect on the market result for the bets to stand.</li>
                                <li>If the match is abandoned, bets concerning all periods will be void unless one of the two occurs:
                                	<ol type="a" start="1">
                                    	<li>The period is already completed prior to the abandonment.</li>
                                        <li>The bets have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand.</li>
                                    </ol>
                                </li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">5.	In-Play Over/ Under (Total Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict whether the total points of the match will be over or under the indicated total line.</li>
                                <li>Settlement is based on the result with handicap applied to 0-0 score line, regardless of the bets on the scores of that time.</li>
                                <li>When the match is abandoned, bets can be settled only on the result without being affected  by any further points. In any other scenario, bets will be considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">6.	Over/ Under (Home/ Away Points)</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict whether the total Home/ Away points will be over or under the indicated line.</li>
                                <li>If the match is abandoned, all bets will be considered void except bets that have been decided previous to the abandonment. And there is no further effect on the market result for the bets to stand.</li>
                                <li>All bets will be settled according to official statistics by the relevant sporting body.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">7.	Odd/ Even</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict whether the total points of the match will be odd or even. Overtime counts.</li>
                                <li>Markets offered may include bets concerning Full Time, Half Time or Quarters.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">8.	Team to Score First</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score first during the match.</li>
                                <li>If the match is abandoned after the points have been made, then the team that scores first do count and all bets are valid.</li>
                                <li>If the match is abandoned before the points have been made, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then all bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">9.	Team to Score Last</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score last during the match.</li>
                                <li>If the match is abandoned at any time, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then all bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">10.	Highest Scoring in a Quarter</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score most points in a single quarter.</li>
                                <li>Overtime does not count.</li>
                                <li>If the match is abandoned at any time, then all bets are considered void.</li>
                                <li>If neither team has scored during the playing time of all 4 quarters and overtime, then bets are considered void.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">11.	Team to Score 20 Points First</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="oli" type="i" start="1">
                            	<li>Predict which team will score20 points first in each quarter.</li>
                                <li>Overtime does not count.</li>
                                <li>It can be settled only for the bets that have been decided previously and there is no further effect on the market result for the bets to stand when the match is abandoned. In any other scenario, bets will be considered void.</li>
                                <li>If neither team scores 20 points in each quarter, then bets are considered void.</li>
                                <li>It will be clearly marked on the market if there is any change to the points which depends on the actual scores for a specified team.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">12.	Team Points- Last Digit</strong></td>
                    </tr>
                    <tr>
                    	</tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Predict the last digit of the final scores for the home or away team.</li>
                                <li>The result is based on the official posted result, including overtime.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td><strong style="color:#066;">13.	Fantasy Basketball Rules</strong></td>
                    </tr>
                    <tr>
                    </tr><tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="i" start="1">
                            	<li>Fantasy Basketball bets are placed on any two selected teams from different matches on the same date.</li>
                                <li>Fantasy Basketball results will be based on the actual scores, which are taken in account for the handicap of the fantasy match as well.</li>
                                <li>The two teams involved in Fantasy Basketball must play on the same date for bets to stand.</li>
                                <li>Should the playing time of either team be different from that posted on the company’s website, all Fantasy match-bets concerning this team will be void.</li>
                                <li>The venues where games are actually played would not be taken into account for Fantasy match-bets.</li>
                                <li>Hers is an example of a Fantasy Game:
                                	<ol id="ola" type="a" start="1">
                                    	<li>Boston Celtic 101- 98 Chicago Bulls, LA Lakers 118- 101 Orlando Magic</li>
                                        <li>Fantasy Game 1: Boston Celtic VS LA Lakers</li>
                                        <li>Fantasy Game Result: Boston Celtic 101- 118 LA Lakers</li>
                                        <li>The result will be based on the actual scores of the respective matches.</li>
                                    </ol>
                                </li>
                                <li>The scheduled play must be completed by the two teams and the relevant result must be upheld by the official governing body (e.g. NBA) for bets to stand. Should the scheduled play be unfinished by either team or the relevant result be denied by the official governing body (e.g. NBA), then all bets concerning this team will be void.</li>
                                <li>Specific Event Betting Rules apply to all fantasy matches.</li>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0"><strong style="color:#999; text-transform: uppercase;">Basketball Specials</strong></td>
                    </tr>
                    <tr>
                    	<td class="txt_indent0">
                        	<ol id="ol1" type="1" start="1">
                            	<li>Predict the number of points, steals, rebounds, assists, three-point shots, etc.</li>
                                <li>Bets will be settled on the official result of the match, including overtime.</li>
                                <li>Both teams or players of both sides must compete in the game for bets to stand.</li>
                                <li>Should one side/ team or both be absent in the game, all bets will be considered void</li>
                            </ol>
                        </td>
                    </tr>
                </tbody></table>
                </div>
            </span>
		</div>
		<a href="#" onclick="javascript:$('html, body').animate({'scrollTop': 0 }, 1000);" data-role="button" data-theme="y" class="ui-link ui-btn ui-btn-y ui-shadow ui-corner-all" role="button">${msg["button.common.backTop"]}</a>
		 </div>
		</div>
</div> 
<script type= "text/javascript">
	window.onload=function(){
			$("#bsktball").hide();
			$("#football").show();
	} 
	function changeSportGame(rules){
		if(rules=='bsktball2'){
			
			$("#sport").hide();
			$("#bsktball").show();
			$("#football").hide();
			$('html, body').scrollTop(0);
		}else if(rules=='football3'){
			$("#sport").hide();
			$("#bsktball").hide();
			$("#football").show();
			$('html, body').scrollTop(0);
		}
	}
</script>
<script type= "text/javascript">
     document.body.innerHTML = replaceAllHtml(document.body.innerHTML);
</script>
</body>
</html>