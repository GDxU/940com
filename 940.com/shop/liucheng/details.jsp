
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.chuangdun.jsl.lab.LAB"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.lab.SYS"%>
<%@page import="com.chuangdun.jsl.dao.ToolArticleDao"%>
<%@page import="com.chuangdun.jsl.dao.VideoDao"%>

<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.chuangdun.jsl.lab.Page"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>940-开店技巧</title>
	<link rel="stylesheet" type="text/css" href="/style/style.css">
	<link rel="stylesheet" type="text/css" href="/style/shop.css">
</head>
<body>
	<%@ include file="/inc/header.jsp"%>

	<div id='kd_content'>
		<div id="wrapJiqiao">
			<ul class='j_tab_ul'>
				<li class='cur'><a href="/shop">开店流程</a></li>
				<li><a href="">开店技巧</a></li>
				<li><a href="">干货分享</a></li>
				<li><a href="">常见问题</a></li>
				<li><a href="">网店推广</a></li>
			</ul>
			<div class='j_details'>
				<div class='fl l_hot'>
					<div class="k_hot">
						<h1>热门排行</h1>
						<ul class="top5box">
							<li class="hover">
								<div class="pic"><a href=""><img src="/images/kd1.jpg"></a></div>
								<div class="title"><i>1</i><a href="http://zph.baobeio.com/view/31910.html">淘宝客服怎么搞定犹豫不决的顾客?</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li class="hover">
								<div class="pic"><a href=""><img src="/images/kd2.jpg"></a></div>
								<div class="title"><i>2</i><a href="http://zph.baobeio.com/view/31910.html">男童加绒休闲运动裤</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li class="hover">
								<div class="pic"><a href=""><img src="/images/kd3.jpg"></a></div>
								<div class="title"><i>3</i><a href="http://zph.baobeio.com/view/31910.html">男童加绒休闲运动裤</a></div>
								<span>时间：2015-11-23</span>
							</li>
									
							<li class="hover">
								<div class="pic"><a href=""><img src="/images/kd4.jpg"></a></div>
								<div class="title"><i>4</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li class="hover">
								<div class="pic"><a href=""><img src="/images/kd5.jpg"></a></div>
								<div class="title"><i>5</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd6.jpg"></a></div>
								<div class="title"><i>6</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd1.jpg"></a></div>
								<div class="title"><i>7</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd2.jpg"></a></div>
								<div class="title"><i>8</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd3.jpg"></a></div>
								<div class="title"><i>9</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd4.jpg"></a></div>
								<div class="title"><i>10</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd4.jpg"></a></div>
								<div class="title"><i>11</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
							<li>
								<div class="pic"><a href=""><img src="/images/kd4.jpg"></a></div>
								<div class="title"><i>12</i><a href="http://zph.baobeio.com/view/31895.html">男士纯色加厚连帽棉衣</a></div>
								<span>时间：2015-11-23</span>
							</li>
						</ul>
					</div>
				</div>
				<div class='fl r_cont_txt'>
					<div class='txtTitle'>
						<h1>开店第一步：淘宝帐号注册</h1>
						<div class='boot'>
							<div class='wrapfx' style="display: inline-block;">
								<span>时间：2015-11-23 17：48</span>|
								<span>发布：www.940.com</span>|
								<span>分享到：</span>
								<div class="bdsharebuttonbox" data-tag="share_1">
									<a class="bds_weixin" data-cmd="weixin"></a>
									<a class="bds_qzone" data-cmd="qzone" href="#"></a>
									<a class="bds_tqq" data-cmd="tqq"></a>
									<a class="bds_tsina" data-cmd="tsina"></a>
									<a class="bds_renren" data-cmd="renren"></a>
									<a class="bds_sqq" data-cmd="sqq"></a>
									<a class="bds_tieba" data-cmd="tieba"></a>
									<a class="bds_more" data-cmd="more"></a>
								</div>
							</div>
						</div>
					</div>
					<div class='show_cont'>
						
                    <p>
	　　新手卖家对淘宝规则有诸多不熟悉的地方，在开店的过程中，很容易就会触犯规则，被淘宝处罚，其中一条处罚措施就是给你的宝贝降权。虽然被降权的宝贝依然能够被搜索到，但是排名却非常靠后，排名靠后的宝贝自然不会给店铺带来多大的流量，这就严重影响到店铺的经营了，那么宝贝被降权之后，我们应该怎么处理呢?</p>
<p style="text-align: center;">
	　　<img alt="淘宝宝贝被降权应该如何处理？" src="/images/p1.jpg" style="width: 480px; height: 360px;"><br>
	淘宝宝贝被降权应该如何处理？</p>
<p>
	<strong>　　一、宝贝被降权的两种情况</strong></p>
<p>
	　　我们知道要解决一个问题，首先要清楚问题产生的根源，处理宝贝降权也是同样的道理，我们首先得弄清楚什么样的宝贝才会引起降权。通常这些宝贝有以下两种情况：</p>
<p>
	　　1)滞销宝贝，即上架后三个月都没有销售记录的宝贝，会被系统自动认定为滞销宝贝，从而被降权。</p>
<p>
	　　2)作弊宝贝，即通过炒作信誉、错放类目属性、滥用关键词等手段提升商品人气。目前这种行为是淘宝官方打击最为严厉的。</p>
<p>
	<strong>　　二、判断宝贝是否被降权</strong></p>
<p>
	　　淘宝将你的宝贝降权之后是不会有提示的，所以一旦发现自己店铺的流量低，就要开始判断自己的宝贝是否被降权了。我们一般可以通过以下步骤来判断宝贝是不是被降权了。</p>
<p>
	　　1)首先要判断宝贝是否被屏蔽，打开淘宝首页，在搜索框中输入自己宝贝的全称，如果能够搜索到你的宝贝，那么恭喜你，淘宝并没有屏蔽掉你的宝贝;但如果搜索不到，则说明宝贝有可能是被屏蔽或者下架了。</p>
<p>
	　　2)接下来就可以开始判断宝贝是否被降权了。在淘宝首页的搜索框内输入关键词时，去掉一个或者两个关键词，对自己的宝贝进行搜索，最好是出现少量的宝贝(宝贝数≥2个)，这样比较方便你寻找自己的宝贝，当发现你的宝贝依然存在时，可以点击按销量排序查询，这个时候若发现你的宝贝不见了，那么就说明你的宝贝被淘宝降权了。</p>
<p>
	<strong>　　三、处理宝贝降权的方法</strong></p>
<p>
	　　1)删除已经被降权的宝贝信息。</p>
<p>
	　　2)快速创新被降权的宝贝，适当编辑宝贝信息，例如修改包含重复关键词的宝贝标题，再重新上架。</p>
<p>
	　　3)新建新的宝贝信息，给店铺更好新鲜的血液。</p>
<p>
	　　需要注意的是，若被降权的宝贝在30天降权恢复后，淘宝官方依然可能会以同样的的理由将你的宝贝再次降权。因此对于那些有违规行为的宝贝，例如刷信用、虚假交易，就算被恢复了，但要是再次犯规的话，不久之后还是会被降权。所以再次上架宝贝时，一定要认真审核，最好不要再上架有违规记录的宝贝了，因为降权过的宝贝已经被淘宝记录在案了。</p>
<p>
	　　也有一些宝贝被淘宝“误杀”掉，但这种情况是非常特殊的，当发现宝贝被降权了，首先确定自己的经营是否违规，如果在完全遵守规则的情况下，还是出现了宝贝被降权或屏蔽的情况，可以找淘宝小二帮忙。</p>
<p>
	　　以上就是宝贝被降权后的处理方法，但是淘宝市场越来越规范，希望各位卖家千万不要抱着侥幸心理，为了引入流量违规操作，钻淘宝的空子，因为一旦被淘宝发现，对卖家的处罚是比较严重的，这是非常影响店铺正常经营的。</p>


					</div>


				</div>
				<h1 style="clear: both;"></h1>
			</div>
	</div>
	</div>
	<%@ include file="/inc/footer.jsp"%>
	
	<script type="text/javascript">
		var top5box = $('.top5box li:gt(3)');
			var tLi = $('.top5box li');
		  	top5box.mouseover(function() {
		   	 	$(this).addClass('hover').siblings().removeClass('hover');
		    	$('.top5box li:lt(4)').addClass('hover');
		  	});
		with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
	</script>
</body>
</html>