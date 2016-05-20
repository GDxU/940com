<!doctype html>
<%@page import="com.chuangdun.jsl.dao.NoticeDao"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.EditUtil"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.DateUtil"%>
<%@page import="com.chuangdun.jsl.dao.*"%>
<%@page import="com.chuangdun.jsl.bean.Article"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>
<%@ include file="/inc/version.jsp"%>
<%
	String un = "";
	ToolArticleDao articleDao = new ToolArticleDao();
	VideoDao videoDao = new VideoDao();
	ArrayList<Article> articleList = new ArrayList<Article>();
	Page processPage = articleDao.getArticlePage(1, 1, "1");
	CachedRowSetImpl processRs = processPage.getCachedRowSetImpl();
	
	
	Page skillPage = articleDao.getArticlePage(1, 1, "2");
	CachedRowSetImpl skillRs = skillPage.getCachedRowSetImpl();
	Article skillArticle = articleDao.getArtiCleByRs(skillRs);
	articleList.add(skillArticle);
	
	Page sharePage = articleDao.getArticlePage(1, 3, "3");
	CachedRowSetImpl shareRs = sharePage.getCachedRowSetImpl();
	ArrayList<Article> shareLsit =  articleDao.getArticlesByRs(shareRs);
	articleList.addAll(shareLsit);
	
	//Article shareArticle = articleDao.getArtiCleByRs(shareRs);
	//articleList.add(shareArticle);
	
	Page faqPage = articleDao.getArticlePage(1, 1, "4");
	CachedRowSetImpl faqRs = faqPage.getCachedRowSetImpl();
	Article faqArticle = articleDao.getArtiCleByRs(faqRs);
	articleList.add(faqArticle);
	
	Page marketingPage = articleDao.getArticlePage(1, 1, "5");
	CachedRowSetImpl marketingRs = marketingPage.getCachedRowSetImpl();
	Article marketArticle = articleDao.getArtiCleByRs(marketingRs);
	articleList.add(marketArticle);

	Page casePage = articleDao.getArticlePage(1, 8, "6");
	CachedRowSetImpl caseRs = casePage.getCachedRowSetImpl();
	Article caseArticle = articleDao.getArtiCleByRs(caseRs);
	articleList.add(caseArticle);
	
	Page videoPage = videoDao.getIndexVideoPage(1, 9, "2", "");
	CachedRowSetImpl videoRs = videoPage.getCachedRowSetImpl();
	
	RegInfoDao regInfoDao = new RegInfoDao();
	Page regInfoPage = regInfoDao.getRegInfoPage(1, 30);
	CachedRowSetImpl regInfoRs = regInfoPage.getCachedRowSetImpl();
	
	//公告
	NoticeDao noticeDao = new NoticeDao();
	Page noticePage;
	noticePage = noticeDao.getNoticePage(1, 3);
	CachedRowSetImpl noticeRs = noticePage.getCachedRowSetImpl();
	
	//讲师
	TeacherDao teacherDao = new TeacherDao();
	Page teacherPage = teacherDao.getTeacherPage(1, 5,"");
	CachedRowSetImpl teacherRs = teacherPage.getCachedRowSetImpl();
	
	//分享
	ShareDao  shareDao = new ShareDao();
	Page studentSharePage = shareDao.getSharePage(1, 7);
	CachedRowSetImpl studentShareRs = studentSharePage.getCachedRowSetImpl();
	//首页yst
	Article classArticle = articleDao.getArtiCleByRs(articleDao.getArticleRowSet(2512));
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>940电商学院 - 最专业的淘宝电商培训，店铺运营推广，电商培训领导者</title>
<link rel="stylesheet" type="text/css" href="/style/style.css?02">
<link rel="stylesheet" type="text/css" href="/style/slide.css?021">
</head>
<body>
<%@ include file="/inc/header.jsp"%>
	
	
	<!-- banner -->
	<div id='advert'>

		<div class='wrap_slide'>
			<div class='wrap_pic slide_1'>
				<div class='j_com j_wrap j_pic_1'>
					<div class='glass' id='glass'>
						<div class='s1_shadow1'></div>
						<div class='s1_yuan'></div>
						<div class='s1_fdj'></div>

						<div class='j_txt'>
							<h1></h1>
							<p>
								开课时间：每晚8:00-10:00<br /> 培训周期：1~3个月<br /> 授课讲师：李大东
							</p>
						</div>
						<div class='j_ro s_ico_1'></div>
						<div class='j_ro s_ico_2'></div>
						<div class='j_ro s_ico_3'></div>
						<div class='j_ro s_ico_4'></div>
					</div>
					<div class='s1_shadow2'></div>
					<div class='but_sign'>
						<a target="_blank" href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn">立即报名</a>
					</div>
					<div class='s_pic_txt'></div>
					<div class='char_txt'>
						<p>淘宝精品教学，让你轻松拥有属于自己的店铺</p>
					</div>

				</div>
			</div>
			<div class='wrap_pic slide_2'>
				<div class='j_com j_wrap j_pic_2'>
					<div class='s2_txt'>
						<h1>人人都有机会当老板</h1>
						<p>没有想不到，只有不敢想！没有做不到，只有不行动！</p>
					</div>
					<div class='s2_pic'></div>
					<div class='s2_but'>
						<a target="_blank" class='fl' href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn"><i>“</i>我要当老板<i>”</i></a>
						<a target="_blank" class='fr' href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn">立即报名</a>
					</div>
					<div class='s2_shadow'></div>
					<div class="r_pic"></div>
				</div>
			</div>
			<div class='wrap_pic slide_3'>
				<div class='j_com j_wrap j_pic_3'>
					<div class='s3_xk'></div>
					<div class='s3_pic'></div>
					<div class='s3_mj'></div>
					<div class='s3_qb'></div>
					<div class='s3_xp'></div>
					<div class='s3_cz'></div>
					<div class='s3_txt'></div>
				</div>
				<a target="_blank" title="点击联系客服" style="width: 100%;height: 100%;display: block;position: absolute;top:0;left:0;" href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn"></a>
			</div>
			<div class='wrap_pic slide_4'>
				<div class='j_com j_wrap j_pic_4'>
					<div class='s4_txt_pic'></div>
					<div class='s4_txt'>技术改变命运，学习成就未来！</div>
					<div class='s4_but'>
						<p>名师指导 ，随到随学，包教包会</p>
						<a target="_blank" href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn">立即报名</a>
					</div>
					<div class='s4_dn'></div>
					<div class='s4_sb'></div>
					<div class='s4_logo'></div>
				</div>
			</div>
		</div>
		<span id='last'><</span> <span id='next'>></span>

	</div>

	<div id='content'>
		<div class='wrap_1f'>
			<div class='fl l_guide'>
				<div class='cont_title'>
					<span class='fl'>开店指南</span>
					<p class='fl' id='g_tab'>
						<a class='act' href="/shop">开店流程</a><i>|</i> <a
							href="/shop/jiqiao">开店技巧</a><i>|</i> <a href="/shop/fenxiang">干货分享</a><i>|</i>
						<a href="/shop/wenti">常见问题</a><i>|</i> <a href="/shop/tuiguang">网店推广</a>
					</p>
					<a class="fr" href="/shop">更多 <i>&gt;</i></a>
				</div>
				<div class='cont_slide'>
					<div class='fl l_slide' id='l_slide'>
						<div class='wrap_pic'>
							<a> <img src="images/p_1.jpg"> <i>如何开一家属于自己的淘宝旺铺？</i>
							</a> <a style="display:none;"> <img src="images/p_2.jpg">
								<i>终于当老板了快点来各位！</i>
							</a>
						</div>
					</div>

					<div class='fr r_list' id='showCon'>
						<ul class='list_ul' style="display:block;">
							<%
								for(int i=0;i<articleList.size();i++){
																																																	Article article = articleList.get(i);
																																																		if(article!=null){
							%>

							<li class='<%=LAB.getClassByIndex(i)%>'><a
								href="<%=EditUtil.getUrlByArticle(article)%>"><i class='fl'></i><span
									class='fl'><%=article.getTitle()%></span><em class='fr'>[<%=EditUtil.getTypeById(article.getType())%>]
								</em></a></li>
							<%
								}}
							%>
						</ul>
					</div>

				</div>
				<div class='cont_tool'>
					<div class='cont_title'>
						<span class='fl'>电商工具</span> <a class="fr" >更多 <i>&gt;</i></a>
					</div>
					<ul class='logo_ul'>
						<li><a ><img src="images/logo_1.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_2.jpg"><i>装修软件</i></a></li>
						<li><a ><img src="images/logo_3.jpg"><i>流量软件</i></a></li>
						<li><a ><img src="images/logo_4.jpg"><i>充值软件</i></a></li>
						<li><a ><img src="images/logo_5.jpg"><i>百度排名</i></a></li>
						<li><a ><img src="images/logo_6.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_7.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_8.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_4.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_3.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_5.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_1.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_7.jpg"><i>开店软件</i></a></li>
						<li><a ><img src="images/logo_2.jpg"><i>开店软件</i></a></li>
					</ul>
				</div>
			</div>
			<div class='fr r_log'>
				<div class='wrap_logo'>
					<div class='log_before' style="display:none;">
						<div class='cont_title'>
							<span class='fl'>用户登录</span>
						</div>
						<ul class='log_ul'>
							<li class='txt_input'><input id="homeName" type="text"
								placeholder="用户名 (邮箱)" /></li>
							<li class='txt_input'><input id="homePass" type="password"
								placeholder="密码" /></li>


							<li class='txt_checkbox log_checkbox'>
								<div class='fl check checked'></div>
								<p class='fl'>下次自动登录</p>
							</li>
							<li class='but_submit'><input id='homeLog' type="submit"
								value="登 录" /></li>
							<li class='but_reg'><a >忘记密码</a> <a class='reg'
								href="/reg">注册账户</a></li>
							<div id="logBox">
								<span class=""></span>
							</div>
						</ul>
					</div>
					<div class='log_after' style="display:none;">
						<dl class="user_dl">
							<dt>
								<!-- <img src="/images/user/nv_pic.png"> -->
							</dt>
							<dd>
								<a class='enroll' href="javascript:"><i class="icon_bm"></i>报名</a>
							</dd>
							<dd>
								<a id="a_dope" href="/user/#n=0&b=0"><i class="icon_xx"></i>消息</a>
							</dd>
							<dd>
								<a id="a_advise" href="/user/#n=0&b=1"><i class="icon_jy"></i>建议</a>
							</dd>
						</dl>
						<div class='xy_info'>
							<p>
								学员 <em>加载中</em>：
							</p>
							<p>你好，欢迎来到940电商学院</p>
						</div>
						<p class='ziliao'>
							<a href="/user/#n=0">编辑个人资料</a> <i class="icon_bj"></i>
						</p>
					</div>
				</div>


				<div class='wrap_notice'>
					<div class='cont_title'>
						<span class='fl'>网站公告</span> <a class="fr" href="gonggao#">更多
							<i>&gt;</i>
						</a>
					</div>
					<%
						while (noticeRs.next()) {
																				int noticeId = noticeRs.getInt("id");
																				String title = noticeRs.getString("title");
																				String noticeTime=noticeRs.getString("time").substring(0,10);
					%>
					<ul class='not_ul'>
						<li><i><%=noticeTime%></i><br /> <a
							href="gonggao#id=<%=noticeId%>"><%=title%> </a></li>
					</ul>
					<%
						}
																				noticeRs.close();
					%>
				</div>

			</div>
		</div>


		<div class='wrap_2f'>
			
				<div class="attend" usemap="#planetmap">
						<a target="_blank" title="点击联系客服" style="width: 100%;height: 100%;display: block;position: absolute;" href="http://dht.zoosnet.net/LR/Chatpre.aspx?id=DHT88027214&lng=cn"></a>
						<p class="fl att_time">
							开课时间：每晚8:00-10:00<br>在线听课：YY频道 940567
						</p>
						<div class="fr att_immed">
							<p>现有1000多人正在免费听课…</p>
							<a class="enroll" >马上听课</a>
						</div>

					
				</div>
		
			<div class='cont_title'>
				<span class='fl'>视频教程</span> <a class="fr" href="video">更多 <i>&gt;</i></a>
			</div>

			<div class='video'>

				<%
					String indexVedioId  = "";
					if (videoRs.next()) {
							String preview = LAB.replaceNull(videoRs.getString("preview"));
							indexVedioId =videoRs.getString("video_id");
							%>

				<div class='fl v_boun'>
					<div class='play' id="id_video_container">

					</div>
					<p>
						<em><%=EditUtil.getVideoTypeById(videoRs.getInt("type") + "")%></em><i>|</i><span><%=videoRs.getString("title")%></span>
					</p>
				</div>
				<div class='fr v_list'>
					<ul class="wrap_video">
						<%
							while (videoRs.next()) {
									String videoPreview = LAB.replaceNull(videoRs
											.getString("preview"));
									String id = videoRs.getString("id");
									String videoId = videoRs.getString("video_id");
									String url= id + ".html";
									//videoId = LAB.NumberToABC(videoId) + ".html?title="+videoRs.getString("title");
						%>
						<li><a href="video/<%=url%>"> <img
								src="<%=videoPreview%>"> <em class="v_bg"></em> <i></i>
						</a>
							<p>
								<em><%=EditUtil.getVideoTypeById(videoRs.getInt("type") + "")%></em><i>|</i><span><%=videoRs.getString("title")%></span>
							</p></li>
						<%
							}
																																						}
																																			videoRs.close();
						%>

					</ul>
				</div>
			</div>


		</div>

		<div class='wrap_3f'>
			<div class='fl course'>
				<div class='cont_title'>
					<span class='fl'>VIP培训课程</span> <a class="fr" href="/jianjie">更多
						<i>&gt;</i>
					</a>
				</div>
				<div class="l_table">
					<%=classArticle.getContent()%>
				</div>
			</div>
			<div class='fr give'>
				<div class='cont_title'>
					<span class='fl'>入学通告</span> <a class="fr enroll"
						href="javascript:">我要报名 <i>&gt;</i></a>
				</div>
				<div class="name_title">
					<span class="t_name">姓名</span><i>|</i> <span>班级</span><i>|</i> <span>电话</span>
				</div>
				<div class="wrap_stud">
					<div class="wrap_soll">
						<ul class="soll_ul">
							<%
								int regInfoIndex = 1;
													while (regInfoRs.next()) {
															String userName = regInfoRs.getString("user_name");
															String phone = regInfoRs.getString("phone_num");
															userName = EditUtil.getHideUserName(userName);
																																							phone = EditUtil.getHidePhone(phone);
							%>

							<li><span class="name"><%=userName%></span> <span
								class="and"><%=EditUtil.getClassByIndex(regInfoIndex)%></span>
								<span class="call"><%=phone%></span></li>
							<%
								regInfoIndex++;	
													}
																																														regInfoRs.close();
							%>


						</ul>
					</div>
				</div>
			</div>
			<h1 style="clear: both;"></h1>
		</div>

		<div class='wrap_4f'>
			<div class='cont_title'>
				<span class='fl'>讲师团队</span> <a class="fr" href="/teacher">更多讲师
					<i>&gt;</i>
				</a>
			</div>
			<div class='teacher'>
				<ul class='teac_ul'>
					<%
						while(teacherRs.next()){
																String name=teacherRs.getString("name");
																String introduction = teacherRs.getString("introduction");
																String title = teacherRs.getString("title");
																String profileUrl = teacherRs.getString("profile_img");
					%>
					<li>
						<div class='t_pic'>
							<img src="<%=profileUrl%>">
							<div class='make'>
								<h1 class=''>讲师简介</h1>
								<p class='con'><%=introduction%></p>
							</div>
						</div>
						<div class='b_name'>
							<p class='name'><%=name%></p>
							<p class='zj'>
								【<%=title%>】
							</p>
						</div>
					</li>
					<%
						}teacherRs.close();
					%>
				</ul>
			</div>
			<ul class="but_tab">
				<li><a href="javascript:" class='enroll'>预约讲师</a></li>
				<li class='act'><a href="javascript:" class='enroll'>免费试听</a></li>
				<li><a  href="javascript:" class='enroll'>我要报名</a></li>
			</ul>

		</div>
		<div class="b_state">全部讲师均获得国家电商教师培训资格证，即刻咨询，获取名师在线指导
			400-1000-940</div>
		<div class='wrap_5f'>
			<div class='fl cases'>
				<div class='cont_title'>
					<span class='fl'>成功案例</span> <a class="fr" href="case">更多 <i>&gt;</i></a>
				</div>
				<ul class="ul_list_cont">
					<%
						while (caseRs.next()) {
																															String casePreview = LAB.replaceNull(caseRs
																																	.getString("a_preview"));
																															int id = caseRs.getInt("a_id");
																															String preview =caseRs.getString("a_preview");
																															String title = caseRs.getString("a_title");
																															String inCome= caseRs.getString("a_income");
																															String joinTime = caseRs.getString("a_join_time");
																															if(joinTime==null)
																																 joinTime=DateUtil.getDate();
																															else
																																joinTime = joinTime.substring(0, 10);
					%>
					<li>
						<dl class="case_stu">
							<dt>
								<a href="/case/<%=id+".html"%>"><img
									src="<%=preview%>"></a>
							</dt>
							<dd class="txt">
								<a href="/case/<%=id+".html"%>"><%=title%></a>
							</dd>
							<dd class="money">
								<i>开店月赚</i><span><%=inCome%>元</span>
							</dd>
							<dd class="stage">
								&nbsp;<i>入学日期：</i><span><%=joinTime%></span>
							</dd>
						</dl>
					</li>
					<%
						}
					%>

				</ul>
			</div>
			<div class='fr trainee'>
				<div class='cont_title'>
					<span class='fl'>学员分享</span> <a class="fr" id="homeShare" href="javascript:">我要分享 <i>&gt;</i></a>
				</div>
				<ul class="ul_list_share">
					<%
						while(studentShareRs.next()){
													String profileUrl = studentShareRs.getString("profile_img");
													String period = studentShareRs.getString("period");
													String name = studentShareRs.getString("real_name");
													String title = studentShareRs.getString("a_content");
													String id  = studentShareRs.getString("id");
													if(title.length()>24)
														title = title.substring(0,24)+"......";
					%>
					<li>
						<dl class="share_dl">
							<dt>
								<a ><img style="width: 62px" src="<%=profileUrl%>"></a>
							</dt>
							<dd class="stage_dd">
								<a ><b><%=name%></b>【第<i><%=period%></i>期学员】</a>
							</dd>
							<dd class="txt_dd">
								<a href="case/#share_id=<%=id%>">分享：<%=title%></a>
							</dd>
						</dl>

					</li>
					<%
						}studentShareRs.close();
					%>
				</ul>
			</div>
		</div>
		<div class='wrap_6f '>
			<a class='enroll' href="javascript:">立即<br />报名
			</a>
			<p>
				<img src="images/txt.png">
			</p>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
	
	
	<!-- 实名认证
		<script src="http://static.anquan.org/static/outer/js/aq_auth.js"></script>
	 -->
	 <script src="http://qzonestyle.gtimg.cn/open/qcloud/video/h5/h5connect.js"></script>
	 <script type="text/javascript"> 
		(function(){ 
			var option ={"auto_play":"0","file_id":"<%=indexVedioId%>","app_id":"1251672867","width":385,"height":280}; new qcVideo.Player("id_video_container", option ); })() 
		</script>
	
<!--以下这一段是显示客服人员列表的具体内容，请将其放到网页中您想要显示的位置-->
<script language="javascript">
<!--
document.write('<div id="LR_Operatorlist_Div"></div>');
//-->
</script>

</body>


<!--请将以下码嵌入到您网页源代码的最后面，通常是</body></html>之后,这样在LR服务器升级维护的时候也不会影响您的网页打开呈现速度。-->
<script language="javascript" src="http://dht.zoosnet.net/LR/olist.aspx?id=DHT88027214&lng=cn"></script>
<script language=javascript>
<!--
var LR_OperatorlistHtml='';
function outputOperatorlist(name,friendname,state)
{
	if(state>=3)
	{
		LR_OperatorlistHtml+='<li>'+unescape(friendname.replace(/\+/g,'%20'))+' [<a href="javascript:openZoosWindow_olist(\'chatwin\',\'&oname='+name+'\')" target="_self"><font style="FONT-SIZE: 12px;COLOR: red;">在线，请点击对话</font></a>]';
	}
	else if(state==2)
	{
		var e=escape('发送给'+unescape(name.replace(/\+/g,'%20'))+'的留言');
		LR_OperatorlistHtml+='<li>'+unescape(friendname.replace(/\+/g,'%20'))+' [<a href="javascript:void(0)"  onclick="return false;" target="_self"><font style="FONT-SIZE: 12px;COLOR: purple;" onclick=openZoosWindow_olist(\'sendnote\',\'&oname='+name+'&e='+name+'\')>繁忙，请点击留言</font></a>]';
	}
	else if(state==1)
	{
		var e=escape('发送给'+unescape(name.replace(/\+/g,'%20'))+'的留言');
		LR_OperatorlistHtml+='<li>'+unescape(friendname.replace(/\+/g,'%20'))+' [<a href="javascript:void(0)"  onclick="return false;" target="_self"><font style="FONT-SIZE: 12px;COLOR: blue;" onclick=openZoosWindow_olist(\'sendnote\',\'&oname='+name+'&e='+name+'\')>离开，请点击留言</font></a>]';
	}
	else if(state==0)
	{
		var e=escape('发送给'+unescape(name.replace(/\+/g,'%20'))+'的留言');
		LR_OperatorlistHtml+='<li>'+unescape(friendname.replace(/\+/g,'%20'))+' [<a href="javascript:void(0)"  onclick="return false;" target="_self"><font style="FONT-SIZE: 12px;COLOR: gray;" onclick=openZoosWindow_olist(\'sendnote\',\'&oname='+name+'&e='+name+'\')>离线，请点击留言</font></a>]';
	}
}


if(typeof(OperatorArray) != 'undefined')
{
	LR_OperatorlistHtml+='<ul style="MARGIN-TOP: 0px;">';
	for(i=0;i<OperatorArray.length;i++)
	{
		outputOperatorlist(OperatorArray[i].name,OperatorArray[i].friendname,OperatorArray[i].state);
	}
	LR_OperatorlistHtml+='</ul>';
}
//-->
</script>
<script language="javascript" src="http://dht.zoosnet.net/JS/LsJS.aspx?siteid=DHT88027214&lng=cn"></script>
<script language="javascript">
<!--
if(typeof(LiveReceptionCode_isonline)!='undefined')
{
	if(LiveReceptionCode_isonline)
		LR_GetObj('LR_Operatorlist_Div').innerHTML=LR_OperatorlistHtml;
	else
		LR_GetObj('LR_Operatorlist_Div').innerHTML=LR_OperatorlistHtml;
}
//-->
</script>


</html>



