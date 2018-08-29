<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单详情</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/orstyle.css" rel="stylesheet" type="text/css">

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
				<div class="user-orderinfo">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small>
						</div>
					</div>
					<hr />
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<!-- 根据订单状态不同调整进度条 -->
							<s:if test="#request.order.status==1">
								<span class="step-1 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">1<em
										class="bg"></em></i>
									<p class="stage-name">拍下商品</p>
								</span>
								<span class="step-3 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
										class="bg"></em></i>
									<p class="stage-name">卖家发货</p>
								</span>

								<span class="step-3 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
										class="bg"></em></i>
									<p class="stage-name">确认收货</p>
								</span>
								<span class="step-4 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">4<em
										class="bg"></em></i>
									<p class="stage-name">交易完成</p>
								</span>
							</s:if>
							<s:elseif test="#request.order.status==2">
								<span class="step-1 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">1<em
										class="bg"></em></i>
									<p class="stage-name">拍下商品</p>
								</span>
								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
										class="bg"></em></i>
									<p class="stage-name">卖家发货</p>
								</span>

								<span class="step-3 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
										class="bg"></em></i>
									<p class="stage-name">确认收货</p>
								</span>
								<span class="step-4 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">4<em
										class="bg"></em></i>
									<p class="stage-name">交易完成</p>
								</span>
							</s:elseif>
							<s:elseif test="#request.order.status==3">
								<span class="step-1 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">1<em
										class="bg"></em></i>
									<p class="stage-name">拍下商品</p>
								</span>
								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
										class="bg"></em></i>
									<p class="stage-name">卖家发货</p>
								</span>

								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
										class="bg"></em></i>
									<p class="stage-name">确认收货</p>
								</span>
								<span class="step-4 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">4<em
										class="bg"></em></i>
									<p class="stage-name">交易完成</p>
								</span>
							</s:elseif>
							<s:elseif test="#request.order.status==4">
								<span class="step-1 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">1<em
										class="bg"></em></i>
									<p class="stage-name">拍下商品</p>
								</span>
								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">2<em
										class="bg"></em></i>
									<p class="stage-name">卖家发货</p>
								</span>

								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">3<em
										class="bg"></em></i>
									<p class="stage-name">确认收货</p>
								</span>
								<span class="step-2 step"> <em
									class="u-progress-stage-bg"></em> <i class="u-stage-icon-inner">4<em
										class="bg"></em></i>
									<p class="stage-name">交易完成</p>
								</span>
							</s:elseif>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<div class="order-infoaside">
						<div class="order-logistics">
							<s:if test="#request.order.status>=2">
								<a href="logistics.html">
									<div class="latest-logistics">
										<div class="inquire">
											<span class="package-detail">物流：${request.order.fastMailBrand.fastMailBrand}</span>
											<span class="package-detail">快递单号: </span> <span
												class="package-number">${request.order.fastMailCode}</span>
											<a href="logistics.html">查看</a>
										</div>
									</div> <span class="am-icon-angle-right icon"></span>
								</a>
							</s:if>
							<div class="clear"></div>
						</div>
						<div class="order-addresslist">
							<div class="order-address">
								<div class="icon-add"></div>
								<p class="new-tit new-p-re">
									<span class="new-txt">${request.order.orderContact.consigneeName }</span>
									<span class="new-txt-rd2">${request.order.orderContact.phone }</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">收货地址：</span>
										<s:generator separator=","
											val="#request.order.orderContact.address" var="address">
											<s:iterator value="#address" var="item" status="st">
												<span class="buy--address-detail"> <span
													class="section section${st.index}">${item}</span>
												</span>
											</s:iterator>
										</s:generator>
								</div>
							</div>
						</div>
					</div>
					<div class="order-infomain">

						<div class="order-top">
							<div class="th th-item">
								<td class="td-inner">商品</td>
							</div>
							<div class="th th-price">
								<td class="td-inner">单价</td>
							</div>
							<div class="th th-number">
								<td class="td-inner">数量</td>
							</div>
							<div class="th th-operation">
								<td class="td-inner">商品操作</td>
							</div>
							<div class="th th-amount">
								<td class="td-inner">合计</td>
							</div>
							<div class="th th-status">
								<td class="td-inner">交易状态</td>
							</div>
							<div class="th th-change">
								<td class="td-inner">交易操作</td>
							</div>
						</div>

						<div class="order-main">

							<div class="order-status3">
								<div class="order-title">
									<div class="dd-num">
										订单编号：<a href="javascript:;"> ${request.order.id}</a>
									</div>
									<span>成交时间：${request.order.orderTime}</span>
									<!--    <em>店铺：小桔灯</em>-->
								</div>
								<div class="order-content">
									<div class="order-left">
										<s:iterator value="#request.order.orderItems" var="orderItem">
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="${orderItem.goods.getImagesArray()[0]}"
															class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${orderItem.goods.goodsName}</p> <s:iterator
																	value="#orderItem.goodsOptions" var="goodsOptionItem">
																	<p class="info-little">${goodsOptionItem.goodsOptions.name }：${goodsOptionItem.name }
																		<br />
																	</p>
																</s:iterator>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${orderItem.goods.latelyPrice}</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span>${orderItem.quantity}
													</div>
												</li>

											</ul>
										</s:iterator>

									</div>
									<div class="order-right">
										<li class="td td-amount">
											<div class="item-amount">
												${request.order.money}
												<!-- <p>含运费：<span>10.00</span></p> -->
											</div>
										</li>
										<s:if test="#request.order.status==0">
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">等待买家付款</p>
														<p class="order-info">
															<a href="#">取消订单</a>
														</p>

													</div>
												</li>
												<li class="td td-change"><a href="pay.html">
														<div class="am-btn am-btn-danger anniu">一键支付</div>
												</a></li>
											</div>
										</s:if>
										<s:if test="#request.order.status==1">
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">买家已付款</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">提醒发货</div>
												</li>
											</div>
										</s:if>
										<s:if test="#request.order.status==2">
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">卖家已发货</p>
														<p class="order-info">
															<a href="logistics.html">查看物流</a>
														</p>
														<p class="order-info">
															<a href="#">延长收货</a>
														</p>
													</div>
												</li>
												<li class="td td-change">
													<div class="am-btn am-btn-danger anniu">确认收货</div>
												</li>
											</div>
										</s:if>
										<s:if test="#request.order.status==3">
											<div class="move-right">
												<li class="td td-status">
													<div class="item-status">
														<p class="Mystatus">交易成功</p>
														<p class="order-info">
															<a href="logistics.html">查看物流</a>
														</p>
													</div>
												</li>
												<li class="td td-change"><a href="commentlist.html">
														<div class="am-btn am-btn-danger anniu">评价商品</div>
												</a></li>
											</div>
										</s:if>

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

</body>

</html>