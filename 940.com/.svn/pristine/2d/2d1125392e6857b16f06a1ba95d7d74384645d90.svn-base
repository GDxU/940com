<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%> 

<div id="header">
			<div class='j_topbar'>
				<div class='j_wrap topBar'>
					<div class="fl l_fx">
						<span class='fl'> <font>欢迎光临 （www.940.com） 940电商培训</font><i>|</i>
							<a href="javascript:" id="feedback">问题反馈</a><i>|</i> <a class='enroll' href="javascript:">立即报名</a>
							<!-- 分享： -->
						</span>
						<!-- <em clas='fl'> <a class='xl' href=""></a> <a class='wb'
							href=""></a> <a class='qq' href=""></a> <a class='wx' href=""></a>
						</em> -->
					</div>
					<div class='fr r_log' id='logstatus'></div>
				</div>
			</div>

			<div class='wrap_nav'>
				<div class='j_wrap j_nav'>
					<a class='fl logo' href="/"><img class="logo940"
						src="/images/logo.png"></a>
					<ul class='fr nav_ul'>
						<li><a href="/">首页</a></li>
						<li><a href="/shop">开店指南</a></li>
						<li><a href="/video">视频教学</a></li>
						<li><a href="/jianjie">课程简介</a></li>
						<li><a href="/teacher">讲师团队</a></li>
						<li><a href="/case">成功案例</a></li>
						<li><a href="/about">关于我们</a></li>
					</ul>
					<div class="phone">
						<span title='940服务热线'></span> <a title='在线咨询' href="">咨询</a>
					</div>
				</div>
			</div>
	</div>
	<script type="text/javascript">
		!function(){
			var _header = document.getElementById('header')
				,aLi = _header.getElementsByTagName('li')
				,arr = window.location.href.match(/[^\/]\/([a-zA-Z]+)\//)||'home';
				if (arr[1]=='about') {
					aLi[6].children[0].style.width = '90px'
				}else{
					aLi[6].children[0].style.cssText = 'width:auto;margin-left:15px;'
				}
			for (var i = 1; i < aLi.length; i++) {
				var _h = aLi[i].children[0].getAttribute('href').replace('/','');
				if (arr[1].indexOf(_h)>=0) {
					aLi[i].className = 'cur';
					return;
				}
			};
			aLi[0].className = 'cur';
		}();
	</script>