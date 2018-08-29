<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人中心</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/vipstyle.css" rel="stylesheet" type="text/css">
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="../js/personIndex.js"></script>
</head>

<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<div class="am-container header">
					<ul class="message-l">
						<div class="topMessage">
							<div class="menu-hd">
								<s:if test="#application.user==null">
									<a href="#" target="_top" class="h">亲，请登录</a>
									<a href="#" target="_top">免费注册</a>
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
									href="car_getCart?user.id=${application.user.id }"
									target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
									id="J_MiniCartNum" class="h">0</strong></a>
							</div>
						</div>
					</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
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
			</div>
		</article>
	</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="index">首页</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="wrap-left">
					<div class="wrap-list">
						<div class="m-user">
							<!--个人信息 -->

							<div class="m-userinfo">
								<a href="news.html">
									<div class="tipsBox">
										<i class="am-icon-envelope"></i>
									</div>
								</a>
								<div class="m-baseinfo">
									<a class="m-pic" href="information.html"> <img
										src="../images/getAvatar.do.jpg">
									</a>
									<div class="m-info">
										<em class="s-name">小叮当</em>
										<div class="vip1">
											<a href="#"><span></span><em>会员专享</em></a>
										</div>
										<div class="safeText">
											<a href="safety.html">账户安全:<em style="margin-left:20px ;">60</em>分
											</a>
											<div class="progressBar">
												<span style="left: -95px;" class="progress"></span>
											</div>
										</div>
										<div class="m-address">
											<a
												href="addressManage_getUserOrderContact?user.id=${application.user.id}"
												class="i-trigger">收货地址<i class="am-icon-angle-right"
												style="padding-left:5px ;"></i></a>
										</div>
									</div>
								</div>
								<div class="m-right">
									<div class="m-new">
										<a href="news.html"><i class="am-icon-dropbox  am-icon-md"
											style="padding-right:5px ;"></i>消息盒子</a>
									</div>

								</div>
							</div>

							<!--个人资产-->
							<div class="m-userproperty">
								<div class="s-bar">
									<i class="s-icon"></i>个人资产
								</div>
								<p class="m-coupon">
									<a href="coupon.html"> <em class="m-num">2</em> <span
										class="m-title">优惠券</span>
									</a>
								</p>
								<p class="m-wallet">
									<a href="wallet.html"> <em class="m-num">0.00</em> <span
										class="m-title">账户余额</span>
									</a>
								</p>
								<p class="m-bill">
									<a href="pointnew.html"> <em class="m-num">10</em> <span
										class="m-title">总积分</span>
									</a>
								</p>
							</div>

							<!--我的钱包-->
							<div class="wallet">
								<div class="s-bar">
									<i class="s-icon"></i>商城钱包
								</div>
								<p class="m-big squareS">
									<a href="#"> <i><img src="../images/shopping.png" /></i> <span
										class="m-title">能购物</span>
									</a>
								</p>
								<p class="m-big squareA">
									<a href="#"> <i><img src="../images/safe.png" /></i> <span
										class="m-title">够安全</span>
									</a>
								</p>
								<p class="m-big squareL">
									<a href="#"> <i><img src="../images/profit.png" /></i> <span
										class="m-title">很灵活</span>
									</a>
								</p>
							</div>

						</div>
						<div class="box-container-bottom"></div>

						<!--订单 -->
						<div class="m-order">
							<div class="s-bar">
								<i class="s-icon"></i>我的订单 <a class="i-load-more-item-shadow"
									href="order.html">全部订单</a>
							</div>
							<ul>
								<li><a href="order.html"><i><img
											src="../images/pay.png" /></i><span>待付款</span></a></li>
								<li><a href="order.html"><i><img
											src="../images/send.png" /></i><span>待发货<em class="m-num">1</em></span></a></li>
								<li><a href="order.html"><i><img
											src="../images/receive.png" /></i><span>待收货</span></a></li>
								<li><a href="order.html"><i><img
											src="../images/comment.png" /></i><span>待评价<em
											class="m-num">3</em></span></a></li>
								<li><a href="change.html"><i><img
											src="../images/refund.png" /></i><span>退换货</span></a></li>
							</ul>
							<div class="orderContentBox">
								<div class="orderContent">
									<div class="orderContentpic">
										<div class="imgBox">
											<a href="orderinfo.html"><img src="../images/youzi.jpg"></a>
										</div>
									</div>
									<div class="detailContent">
										<a href="orderinfo.html" class="delivery">签收</a>
										<div class="orderID">
											<span class="time">2016-03-09</span> <span
												class="splitBorder">|</span> <span class="time">21:52:47</span>
										</div>
										<div class="orderID">
											<span class="num">共1件商品</span>
										</div>
									</div>
									<div class="state">待评价</div>
									<div class="price">
										<span class="sym">¥</span>23.<span class="sym">80</span>
									</div>

								</div>
								<a href="javascript:void(0);" class="btnPay">再次购买</a>
							</div>

							<div class="orderContentBox">
								<div class="orderContent">
									<div class="orderContentpic">
										<div class="imgBox">
											<a href="orderinfo.html"><img src="../images/heart.jpg"></a>
										</div>
									</div>
									<div class="detailContent">
										<a href="orderinfo.html" class="delivery">派件</a>
										<div class="orderID">
											<span class="time">2016-03-09</span> <span
												class="splitBorder">|</span> <span class="time">21:52:47</span>
										</div>
										<div class="orderID">
											<span class="num">共2件商品</span>
										</div>
									</div>
									<div class="state">已发货</div>
									<div class="price">
										<span class="sym">¥</span>246.<span class="sym">50</span>
									</div>

								</div>
								<a href="javascript:void(0);" class="btnPay">再次购买</a>
							</div>
						</div>
						<!--九宫格-->
						<div class="user-squaredIcon">
							<div class="s-bar">
								<i class="s-icon"></i>我的常用
							</div>
							<ul>
								<a href="order.html">
									<li class="am-u-sm-4"><i class="am-icon-truck am-icon-md"></i>
										<p>物流查询</p></li>
								</a>
								<a href="collection.html">
									<li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i>
										<p>我的收藏</p></li>
								</a>
								<a href="foot.html">
									<li class="am-u-sm-4"><i class="am-icon-paw am-icon-md"></i>
										<p>我的足迹</p></li>
								</a>
								<a href="#">
									<li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i>
										<p>为你推荐</p></li>
								</a>
								<a href="blog.html">
									<li class="am-u-sm-4"><i
										class="am-icon-share-alt am-icon-md"></i>
										<p>我的分享</p></li>
								</a>
								<a href="../home/home2.html">
									<li class="am-u-sm-4"><i
										class="am-icon-clock-o am-icon-md"></i>
										<p>限时活动</p></li>
								</a>

							</ul>
						</div>

						<div class="user-suggestion">
							<div class="s-bar">
								<i class="s-icon"></i>会员中心
							</div>
							<div class="s-bar">
								<a href="suggest.html"><i class="s-icon"></i>意见反馈</a>
							</div>
						</div>




					</div>
				</div>
				<div class="wrap-right">

					<!-- 日历-->
					<div class="day-list">
						<div class="s-title">每日新鲜事</div>
						<div class="s-box">
							<ul>
								<li><a><p>粮油冲锋周 满128减18</p></a></li>
								<li><a><p>防晒这么重要的事怎能随意</p></a></li>
								<li><a><p>春日护肤面膜不可少，你选对了吗？</p></a></li>
								<li><a><p>纯粹时尚，摩登出游，吸睛美衣</p></a></li>
								<li><a><p>粮油冲锋周 满128减18</p></a></li>
								<li><a><p>春日护肤面膜不可少，你选对了吗？</p></a></li>
							</ul>
						</div>
					</div>
					<!--新品 -->
					<div class="new-goods">
						<div class="s-bar">
							<i class="s-icon"></i>今日新品 <a class="i-load-more-item-shadow">15款新品</a>
						</div>
						<div class="new-goods-info">
							<a class="shop-info" href="#">
								<div class="face-img-panel">
									<img src="../images/imgsearch1.jpg" alt="">
								</div> <span class="new-goods-num ">4</span> <span class="shop-title">剥壳松子</span>
							</a> <a class="follow">收藏</a>
						</div>
					</div>

					<!--热卖推荐 -->

				</div>
				<div class="clear"></div>

				<!--收藏和足迹-->


			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
							href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
							- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
							target="_blank">网页模板</a></em>
					</p>
				</div>
			</div>

		</div>

		<aside class="menu">
			<ul>
				<li class="person active"><a href="redirect_person_index"><i
						class="am-icon-user"></i>个人中心</a></li>
				<li class="person">
					<p>
						<i class="am-icon-newspaper-o"></i>个人资料
					</p>
					<ul>
						<li><a
							href="information_getInformation?user.id=${application.user.id}">个人信息</a></li>
						<li><a
							href="safeSetUp_redirect?user.id=${application.user.id}">安全设置</a></li>
						<li><a
							href="addressManage_getUserOrderContact?user.id=${application.user.id}">地址管理</a></li>
					</ul>
				</li>
				<li class="person">
					<p>
						<i class="am-icon-balance-scale"></i>我的交易
					</p>
					<ul>
						<li><a
							href="orderManage_getUserAllOrder?user.id=${application.user.id}"
							class="orderManage">订单管理</a></li>
						<li><a
							href="evaluate_getUserEvaluate?user.id=${application.user.id}">评价商品</a></li>
					</ul>
				</li>

			</ul>

		</aside>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li><a href="../home/home2.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="../home/shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li class="active"><a href="index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
</body>

</html>