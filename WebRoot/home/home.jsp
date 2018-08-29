<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/hmstyle.css" rel="stylesheet" type="text/css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<!--<script src="../js/home.js"></script>-->

</head>
<body>

	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<s:if test="#application.user==null">
							<a href="login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="register.jsp" target="_top">免费注册</a>
						</s:if>
						<s:else>
									亲爱的<span> <a href="#" target="_top" class="user"
								userId="${application.user.id}">${application.user.nickName}
							</a>
							</span>用户
									</s:else>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="index" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="redirect_person_index" target="_top"><i
							class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd"
							href="car_getCart?user.id=${application.user.id }" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logo">
				<img src="../images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img src="../images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>


	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1"><a href="introduction.html"><img
						src="../images/ad1.jpg" /></a></li>
				<li class="banner2"><a><img src="../images/ad2.jpg" /></a></li>
				<li class="banner3"><a><img src="../images/ad3.jpg" /></a></li>
				<li class="banner4"><a><img src="../images/ad4.jpg" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="shopNav">
		<div class="slideall">

			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="index">首页</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">

						<div class="category">
							<ul class="category-list" id="js_climit_li">
								<s:iterator value="#session.onelist" var="oneClassify">
									<li class="appliance js_toggle relative first">
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="../images/${oneClassify.imageLabel}"></i><a
													class="ml-22" title="${oneClassify.imageLabel}">${oneClassify.name}</a>
											</h3>
											<em>&gt;</em>
										</div>
										<div class="menu-item menu-in top">
											<div class="area-in">
												<div class="area-bg">
													<div class="menu-srot">
														<div class="sort-side">
															<s:iterator value="%{#oneClassify.twoClassifys}"
																var="twoClassify">
																<dl class="dl-sort">
																	<dt>
																		<span title="蛋糕">${twoClassify.name}</span>
																	</dt>
																	<s:iterator value="#twoClassify.threeClassifys"
																		var="threeClassify">

																		<dd>
																			<a title="蒸蛋糕"
																				href="search_threeClassifySearch?threeClassify.id=${threeClassify.id}&page=1"><span>${threeClassify.name}</span></a>
																		</dd>
																	</s:iterator>
																</dl>
															</s:iterator>
														</div>
														<!-- 
																<div class="brand-side">
																	<dl class="dl-sort"><dt><span>实力商家</span></dt>
																		<dd><a rel="nofollow" title="呵官方旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >呵官方旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="格瑞旗舰店" target="_blank" href="#" rel="nofollow"><span >格瑞旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="飞彦大厂直供" target="_blank" href="#" rel="nofollow"><span  class="red" >飞彦大厂直供</span></a></dd>
																		<dd><a rel="nofollow" title="红e·艾菲妮" target="_blank" href="#" rel="nofollow"><span >红e·艾菲妮</span></a></dd>
																		<dd><a rel="nofollow" title="本真旗舰店" target="_blank" href="#" rel="nofollow"><span  class="red" >本真旗舰店</span></a></dd>
																		<dd><a rel="nofollow" title="杭派女装批发网" target="_blank" href="#" rel="nofollow"><span  class="red" >杭派女装批发网</span></a></dd>
																	</dl>
																</div>
																 -->
													</div>
												</div>
											</div>
										</div> <b class="arrow"></b>
									</li>
								</s:iterator>
							</ul>
						</div>
					</div>

				</div>
			</div>
			<!--轮播 -->
			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>


			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="../images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="redirect_person_index"><img
						src="../images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="../images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<div class="marqueen">
				<div class="demo">

					<ul>

						<div class="mod-vip">
							<div class="m-baseinfo">
								<a href="redirect_person_index"> <img
									src="../images/getAvatar.do.jpg">
								</a>
								<s:if test="#application.user==null">
									<em> Hi,<span class="s-name">亲爱的用户</span>
								</s:if>
								<s:else>
									<em> Hi,<span class="s-name">${application.user.nickName}</span>
								</s:else>
								<a href="#"><p>点击更多优惠活动</p></a> </em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="login.jsp">登录</a> <a
									class="am-btn-warning btn" href="register.jsp">注册</a>
							</div>
							<div class="member-login">
								<a href="#"><strong>0</strong>待收货</a> <a href="#"><strong>0</strong>待发货</a>
								<a href="#"><strong>0</strong>待付款</a> <a href="#"><strong>0</strong>待评价</a>
							</div>
							<div class="clear"></div>
						</div>


					</ul>
					<div class="advTip">
						<img src="../images/advTip.jpg" />
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">

			<!--今日推荐 -->

			<div class="am-g am-g-fixed recommendation">
				<div class="clock am-u-sm-3"">
					<img src="../images/2016.png "></img>
					<p>
						今日<br>推荐
					</p>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>真的有鱼</h3>
						<h4>开年福利篇</h4>
					</div>
					<div class="recommendationMain ">
						<img src="../images/tj.png "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>囤货过冬</h3>
						<h4>让爱早回家</h4>
					</div>
					<div class="recommendationMain ">
						<img src="../images/tj1.png "></img>
					</div>
				</div>
				<div class="am-u-sm-4 am-u-lg-3 ">
					<div class="info ">
						<h3>浪漫情人节</h3>
						<h4>甜甜蜜蜜</h4>
					</div>
					<div class="recommendationMain ">
						<img src="../images/tj2.png "></img>
					</div>
				</div>

			</div>
			<div class="clear "></div>
			<!--热门活动 -->

			<s:iterator value="#session.goodsMap" var="map" status="st">
				<s:if test="#map.value==null">
				</s:if>
				<s:else>
				<div class="clear "></div>
				<div id="f1">
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>${key}</h4>
							
							<div class="today-brands ">
								<s:iterator value="#session.onelist" var="oneClassify">
									<s:iterator value="%{#oneClassify.twoClassifys}"
										var="twoClassify">
										<s:if test='#twoClassify.name==#map.key'>
											<s:iterator value="%{#twoClassify.threeClassifys}"
												var="threeClassify">
												<a
													href="search_threeClassifySearch?threeClassify.id=${threeClassify.id}&page=1"
													target="_blank">${threeClassify.name}</a>
											</s:iterator>
										</s:if>
									</s:iterator>
								</s:iterator>
							</div>
							<span class="more "> <a class="more-link " href="# ">更多美味</a>
							</span>
						</div>
					</div>

					<div class="am-g am-g-fixed floodFour">

						<div class="am-u-sm-5 am-u-md-4 text-one list">
							<div class="word">
								<s:iterator value="#session.onelist" var="oneClassify">
									<s:iterator value="%{#oneClassify.twoClassifys}"
										var="twoClassify">
										<s:if test='#twoClassify.name==#map.key'>
											<s:iterator value="%{#twoClassify.threeClassifys}"
												var="threeClassify">
												<a class="outer" target="_blank"
													href="search_threeClassifySearch?threeClassify.id=${threeClassify.id}&page=1"><span
													class="inner"><b class="text">${threeClassify.name}</b></span></a>
											</s:iterator>
										</s:if>
									</s:iterator>
								</s:iterator>

							</div>
							<div class="triangle-topright"></div>
						</div>
						<s:iterator value="#session.onelist" var="oneClassify">
							<s:iterator value="%{#oneClassify.twoClassifys}"
								var="twoClassify">
								<s:if test='#twoClassify.name==#map.key'>
									<s:iterator value="%{#map.value}" var="valueList">
										<div class="am-u-sm-7 am-u-md-5 am-u-lg-2 text-two">
											<div class="outer-con ">
												<div class="title ">${valueList.goodsName}</div>
												<div class="sub-title ">¥${valueList.latelyPrice}</div>
												<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
											</div>

											<a
												href="introduction_goodsIntroduction?goods.id=${valueList.id}"
												target="_blank"><img
												src="${valueList.getImagesArray()[0]}" /></a>
										</div>
									</s:iterator>
								</s:if>
							</s:iterator>
						</s:iterator>

					</div>
					</s:else>
			</s:iterator>
			<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
							href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!--引导 -->

	<div class="navCir">
		<li class="active"><a href="home3.html"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
	</div>
	<!--菜单 -->
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item ">
					<a href="# "> <span class="setting "></span>
					</a>
					<div class="ibar_login_box status_login ">
						<div class="avatar_box ">
							<p class="avatar_imgbox ">
								<img src="../images/no-img_mid_.jpg " />
							</p>
							<ul class="user_info ">
								<li>用户名：sl1903</li>
								<li>级&nbsp;别：普通会员</li>
							</ul>
						</div>
						<div class="login_btnbox ">
							<a href="# " class="login_order ">我的订单</a> <a href="# "
								class="login_favorite ">我的收藏</a>
						</div>
						<i class="icon_arrow_white "></i>
					</div>

				</div>
				<div id="shopCart " class="item ">
					<a href="# "> <span class="message "></span>
					</a>
					<p>购物车</p>
					<p class="cart_num ">0</p>
				</div>
				<div id="asset " class="item ">
					<a href="# "> <span class="view "></span>
					</a>
					<div class="mp_tooltip ">
						我的资产 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="foot " class="item ">
					<a href="# "> <span class="zuji "></span>
					</a>
					<div class="mp_tooltip ">
						我的足迹 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="brand " class="item ">
					<a href="#"> <span class="wdsc "><img
							src="../images/wdsc.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我的收藏 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div id="broadcast " class="item ">
					<a href="# "> <span class="chongzhi "><img
							src="../images/chongzhi.png " /></span>
					</a>
					<div class="mp_tooltip ">
						我要充值 <i class="icon_arrow_right_black "></i>
					</div>
				</div>

				<div class="quick_toggle ">
					<li class="qtitem "><a href="# "><span class="kfzx "></span></a>
						<div class="mp_tooltip ">
							客服中心<i class="icon_arrow_right_black "></i>
						</div></li>
					<!--二维码 -->
					<li class="qtitem "><a href="#none "><span
							class="mpbtn_qrcode "></span></a>
						<div class="mp_qrcode " style="display:none; ">
							<img src="../images/weixin_code_145.png " /><i
								class="icon_arrow_white "></i>
						</div></li>
					<li class="qtitem "><a href="#top " class="return_top "><span
							class="top "></span></a></li>
				</div>

				<!--回到顶部 -->
				<div id="quick_links_pop " class="quick_links_pop hide "></div>

			</div>

		</div>
		<div id="prof-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>我</div>
		</div>
		<div id="shopCart-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>购物车</div>
		</div>
		<div id="asset-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>资产</div>

			<div class="ia-head-list ">
				<a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">优惠券</div>
				</a> <a href="# " target="_blank " class="pl ">
					<div class="num ">0</div>
					<div class="text ">红包</div>
				</a> <a href="# " target="_blank " class="pl money ">
					<div class="num ">￥0</div>
					<div class="text ">余额</div>
				</a>
			</div>

		</div>
		<div id="foot-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>足迹</div>
		</div>
		<div id="brand-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>收藏</div>
		</div>
		<div id="broadcast-content " class="nav-content ">
			<div class="nav-con-close ">
				<i class="am-icon-angle-right am-icon-fw "></i>
			</div>
			<div>充值</div>
		</div>
	</div>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	<s:debug></s:debug>
</body>

</html>
</html>
