<!doctype html>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>
<%@page import="com.chuangdun.jsl.bean.Video"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>

<%
	//type 1 会员  2,免费  3，热门  4，最新
	VideoDao videoDao = new VideoDao();
	Object playIdOj = request.getAttribute("id");
	String playId = "";
	String videoTitle = "";
	String autoPlay = "0";
	
	Page freePage = videoDao.getVideoPage(1, 12, "2", "");
	CachedRowSetImpl freeVideoRs = freePage.getCachedRowSetImpl();
	Video video = null;
	if (playIdOj != null) {
		System.out.println("dddddddddd");
		autoPlay = "1";
		
		String aId = playIdOj.toString();
		video = videoDao.getVideoById(aId);
		playId = video.getVideoId();
		
		videoTitle =video.getTitle();
		
	}else{
		freeVideoRs.next();
		playId =freeVideoRs.getString("video_id"); 
		videoTitle = freeVideoRs.getString("title");
		freeVideoRs.previous();
		
	}
	
	if(videoTitle.isEmpty())
		videoTitle = "940-教学视频";
	System.out.println("playId:" +playId  + " auto:"+ autoPlay + " videoTitle:" + videoTitle);
	Page memberPage = videoDao.getVideoPage(1, 10, "1", "");
	CachedRowSetImpl memberVideoRs = memberPage.getCachedRowSetImpl();

	

	Page hotVideo = videoDao.getVideoPage(1, 10, "3", "");
	CachedRowSetImpl hotVideoRs = hotVideo.getCachedRowSetImpl();

	Page newPage = videoDao.getVideoPage(1, 10, "4", "");
	CachedRowSetImpl newVideoRs = newPage.getCachedRowSetImpl();

	Page memberPageV = videoDao.getVideoPage(1, 12, "1", "");
	CachedRowSetImpl memberVideoVRs = memberPageV.getCachedRowSetImpl();
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title><%=videoTitle %></title>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" type="text/css" href="../style/video.css">
</head>

<body>
	<%@ include file="/inc/header.jsp"%>

	<div class='video_cont'>
		<h1>
			<b class='fl'>视频教学</b>
			<div class='fr v_search'>
				<input class='txt fl' type="text" /> <input class='but fl'
					type="button" value="搜索" />
			</div>
		</h1>
		<div class='player'>
			<div class='fl wrap_video_ul'>
				<h3>正在播放：<%=videoTitle %></h3>
				<div id='id_video_container' class='play_video'>

					<object id="video_10000001_object" width="810px" height="460px"
						align="middle"
						classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
						codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=10,0,0,0">
						<param name="FlashVars"
							value="auto_play=1&amp;file_id=160925042321036877311&amp;app_id=1251668076&amp;version=1&amp;refer=127.0.0.1&amp;jscbid=video_10000001&amp;disable_full_screen=0&amp;remember=1&amp;stretch_patch=true">
						<param name="Movie" value="#">
						<param name="Src"
							value="http://qzonestyle.gtimg.cn/open/qcloud/video/flash/video_player.swf?max_age=1800">
						<param name="WMode" value="opaque">
						<param name="Quality" value="High">
						<param name="AllowScriptAccess" value="always">
						<param name="AllowNetworking" value="all">
						<param name="AllowFullScreen" value="true">
						<embed id="video_10000001_embed" width="810px" height="460px"
							flashvars="auto_play=1&amp;file_id=16092504232103687731&amp;app_id=1251668076&amp;version=1&amp;refer=127.0.0.1&amp;jscbid=video_10000001&amp;disable_full_screen=0&amp;remember=1&amp;stretch_patch=true"
							align="middle"
							pluginspage="http://www.macromedia.com/go/getflashplayer"
							type="application/x-shockwave-flash" allowfullscreen="true"
							bgcolor="#000000" quality="high"
							src="http://qzonestyle.gtimg.cn/open/qcloud/video/flash/video_player.swf?max_age=1800"
							wmode="opaque" invokeurls="false" allownetworking="all"
							allowscriptaccess="always">
					</object>

				</div>
			</div>

			<div class='fr video_list'>
				<ul class='tab_ul'>
					<li class='act'>热门教程</li>
					<li>最新视频</li>
					<li>会员专区</li>
					<div class='cur'></div>
				</ul>
				<div class='wrap_vlist'>
					<ul class='v_list_ul' style="display:block;">
						<%
							int i = 0;
							while (hotVideoRs.next()) {
								String title = hotVideoRs.getString("title");
								int clickNum = hotVideoRs.getInt("click_num");
								i++;
								if (i < 4) {
						%>
						<li><i class='fl act'><%=i%></i><a class='fl' id='a_video'
							href="javascript:"><%=title%></a><span class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							} else {
						%>
						<li><i class='fl'><%=i%></i><a class='fl' id='a_video'
							href="javascript:"><%=title%></a><span class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							}
							}
							hotVideoRs.close();
						%>
					</ul>
					<ul class='v_list_ul'>

						<%
							int j = 0;
							while (newVideoRs.next()) {
								String title = newVideoRs.getString("title");
								int clickNum = newVideoRs.getInt("click_num");
								j++;
								if (j < 4) {
						%>
						<li><i class='fl act'><%=j%></i><a class='fl' href=""><%=title%></a><span
							class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							} else {
						%>
						<li><i class='fl'><%=j%></i><a class='fl' href=""><%=title%></a><span
							class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							}

							}
							newVideoRs.close();
						%>
					</ul>
					<ul class='v_list_ul'>

						<%
							int k = 0;
							while (memberVideoRs.next()) {
								String title = memberVideoRs.getString("title");
								int clickNum = memberVideoRs.getInt("click_num");
								System.out.println("title :"  +title + " clickNum:" +clickNum );
								k++;
								if (k < 4) {
						%>
						<li><i class='fl act'><%=k%></i><a class='fl' href=""><%=title%></a><span
							class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							} else {
						%>
						<li><i class='fl'><%=k%></i><a class='fl' href=""><%=title%></a><span
							class='fr' title='播放次数'><%=clickNum%></span></li>
						<%
							}
							}
							System.out.println(" dddddddddddddddddd " + k);
							memberVideoRs.close();
						%>
					</ul>
					<div class='v_st'>
						<a href="javascript:"><img src="../images/v_st.png"></a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id='content'>
		<div class="wrap_2f">

			<div class="cont_title">
				<span class="fl">免费教程</span>
				<p class="fr videoPage"></p>
			</div>

			<div class="video v_video">

				<div class="fr v_list">
					<ul class="wrap_video">

						<%
							while (freeVideoRs.next()) {
								String title = freeVideoRs.getString("title");
								String videoId = freeVideoRs.getString("video_id");
								String preview = freeVideoRs.getString("preview");
						%>
						<li><a href=""> <img src="<%=preview%>"> <em
								class="v_bg"></em> <i></i>
						</a>
							<p>
								<em>免费</em><i>|</i><span><%=title%></span>
							</p></li>
						<%
							}
							newVideoRs.close();
						%>

					</ul>
				</div>
			</div>


		</div>
		<div class="wrap_2f">

			<div class="cont_title">
				<span class="fl">会员专区</span>
				<p class="fr videoPage"></p>
			</div>

			<div class="video v_video">
				<div class="fr v_list">
					<ul class="wrap_video">
						<%
							while (memberVideoVRs.next()) {
								String title = memberVideoVRs.getString("title");
								String videoId = memberVideoVRs.getString("video_id");
								String preview = memberVideoVRs.getString("preview");
						%>

						<li><a href=""> <img src="<%=preview%>"> <em
								class="v_bg"></em> <i></i>
						</a>
							<p>
								<em class='vip'>VIP</em><i>|</i><span><%=title%></span>
							</p></li>
						<%
							}
							memberVideoVRs.close();
						%>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/inc/footer.jsp"%>
	<!-- 视频js -->
	<script src="http://qzonestyle.gtimg.cn/open/qcloud/video/h5/h5connect.js"></script>
	<script type="text/javascript">
		Fengs.use('940/video/index', function(d) {d.init();});
		(function() {
			var option = {
				"auto_play" : "<%=autoPlay%>",
				"file_id" : "<%=playId%>",
				"app_id" : "1251672867",
				"width" : 810,
				"height" : 460,
				'remember' : '1',
				"VMode" : 'opaque',
				"stretch_patch" : true
			};
			new qcVideo.Player("id_video_container", option);
		})()

	</script>
</body>
</html>