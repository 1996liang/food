<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>评价管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/cmstyle.css" rel="stylesheet" type="text/css">

<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
									</s:if><s:else>
									亲爱的<span>
										<a href="#"
							target="_top" class="user" userId="${application.user.id}">${application.user.nickName} </a> </span>用户
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

				<div class="user-comment">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有评价</a></li>

						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">

								<div class="comment-main">

									<div class="comment-list">

										<ul class="item-list">
											<div class="comment-top">
												<div class="th th-price">
													<td class="td-inner">评价</td>
												</div>
												<div class="th th-item">
													<td class="td-inner">商品</td>
												</div>
											</div>
											<s:iterator value="#request.evaluates" var="item">
												<div class="comment-top">
													<div class="th th-price">
														<td class="td-inner"></td>
													</div>
													<div class="th th-item">
														<td class="td-inner"></td>
													</div>
												</div>
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="${item.orderItem.goods.getImagesArray()[0] }"
															class="itempic">

														</a>
													</div>
												</li>

												<li class="td td-comment">
													<div class="item-title">

														<div class="item-name">
															<a href="#">
																<p class="item-basic-info">${item.orderItem.goods.goodsName }</p>
															</a>
														</div>
													</div>
													<div class="item-comment">${item.content}</div>

													<div class="item-info">
														<div>
															<p class="info-little">
																<s:iterator value="#item.orderItem.goodsOptions"
																	var="goodsOption">
																	<span>${goodsOption.goodsOptions.name }：${goodsOption.name}</span>
																</s:iterator>
															</p>
															<p class="info-time">${item.time}</p>

														</div>
													</div>
												</li>
											</s:iterator>
										</ul>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>

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
					<li class="person active">
						<a href="redirect_person_index"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information_getInformation?user.id=${application.user.id}">个人信息</a></li>
							<li> <a href="safeSetUp_redirect?user.id=${application.user.id}">安全设置</a></li>
							<li> <a href="addressManage_getUserOrderContact?user.id=${application.user.id}">地址管理</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="orderManage_getUserAllOrder?user.id=${application.user.id}" class="orderManage">订单管理</a></li>
							<li> <a href="evaluate_getUserEvaluate?user.id=${application.user.id}">评价商品</a></li>
						</ul>
					</li>

				</ul>

		</aside>
	</div>

</body>

</html>