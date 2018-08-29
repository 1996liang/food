<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />

<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />

<link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/address.js"></script>
<script type="text/javascript" src="../js/pay3.js"></script>

</head>


<body>

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
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
					<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
				</div>
				<div class="clear"></div>
				<ul>
					<div class="per-border"></div>
					<s:iterator value="#session.orderContacts" var="item" status="st">
					<s:if test="#item.isDefault==1">
						<li class="user-addresslist defaultAddr" itemId="${item.id}" onclick="clickAddress(${item.id})">
	
							<div class="address-left">
								<div class="user DefaultAddr">
	
									<span class="buy-address-detail"> <span class="buy-user">${item.consigneeName }
									</span> <span class="buy-phone">${item.phone}</span>
									</span>
								</div>
								<div class="default-address DefaultAddr">
									<span class="buy-line-title buy-line-title-type">收货地址:</span>
									<s:generator separator="," val="#item.address" var="address">
										<s:iterator value="#address" var="item" status="st">
									 		<span class="buy--address-detail"> <span class="section section${st.index}"">${item}</span>
									 		</span> 
										</s:iterator>
									</s:generator>
								</div>
								<ins class="deftip">默认地址</ins>
							</div>
							<div class="address-right">
								<a href="../person/address.html"> <span
									class="am-icon-angle-right am-icon-lg"></span></a>
							</div>
							<div class="clear"></div>
	
							<div class="new-addr-btn">
								 <a href="#">编辑</a> <span
									class="new-addr-bar">|</span>
							</div>
	
						</li>
					</s:if>
					<s:else>
					<div class="per-border"></div>
					<li class="user-addresslist" itemId="${item.id}" onclick="clickAddress(${item.id})">
						<div class="address-left">
							<div class="user DefaultAddr">

								<span class="buy-address-detail"> <span class="buy-user">${item.consigneeName }
								</span> <span class="buy-phone">${item.phone}</span>
								</span>
							</div>
							<div class="default-address DefaultAddr">
								<span class="buy-line-title buy-line-title-type">收货地址：</span> 
									<s:generator separator="," val="#item.address" var="address">
										<s:iterator value="#address" var="item" status="st">
									 		<span class="buy--address-detail"> <span class="section section${st.index}">${item}</span>
									 		</span>
										</s:iterator>
									</s:generator>
								</span>
							</div>
							<ins class="deftip hidden">默认地址</ins>
						</div>
						<div class="address-right">
							<span class="am-icon-angle-right am-icon-lg"></span>
						</div>
						<div class="clear"></div>

						<div class="new-addr-btn">
							  <a href="#">编辑</a> <span
									class="new-addr-bar">|</span>
						</div>
						</s:else>
					</li>
					</s:iterator>
				</ul>

				<div class="clear"></div>
			</div>
			<!--物流 -->
			
			<div class="clear"></div>

			<!--支付方式-->
			
			<div class="clear"></div>

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
					<s:iterator value="#session.orderCarItem" var="item" status="st">
						<tr class="item-list">
							<div class="bundle  bundle-last">
								<div class="bundle-main">
									<ul carItemLength="${session.orderCarItem.size()}" class="item-content clearfix${st.index}">
										<div class="pay-phone">
											<li class="td td-item">
												<div class="item-pic" goodsId="${item.goods.id}">
													<a href="#" class="J_MakePoint"> <img
														src="${item.goods.getImagesArray()[0]}"
														class="itempic J_ItemImg"></a>
												</div>
												<div class="item-info">
													<div class="item-basic-info">
														<a href="#" class="item-title J_MakePoint"
															data-point="tbcart.8.11">${item.goods.goodsName}</a>
													</div>
												</div>
											</li>
											<li class="td td-info">
												<div class="item-props" nowOptionsLength="${item.goodsOptions.size()}">
													<s:iterator value="#item.goodsOptions" var="options" status="st">
														<span class="sku-line${st.index}" optionsId="${options.id}">${options.goodsOptions.name}：${options.name}</span>
													</s:iterator>
												</div>
											</li>
											<li class="td td-price">
												<div class="item-price price-promo-promo">
													<div class="price-content">
														<em class="J_Price price-now" id="price">${item.goods.latelyPrice}</em>
													</div>
												</div>
											</li>
										</div>
										<li class="td td-amount">
											<div class="amount-wrapper ">
												<div class="item-amount ">
													<span class="phone-title">购买数量</span>
													<div class="sl">
														<input class="min am-btn" name="" type="button" value="-"  onclick="sub(${item.id},${st.index })"/>
														<input class="text_box" name="" type="text" value="${item.quantity}"
															style="width:30px;" onchange="change(${item.id},${st.index })"/> <input class="add am-btn" name=""
															type="button" value="+" onclick="add(${item.id},${st.index })"/>
													</div>
												</div>
											</div>
										</li>
										<li class="td td-sum">
											<div class="td-inner">
												<em tabindex="0" class="J_ItemSum number"></em>
											</div>
										</li>
										<li class="td td-oplist">
											<div class="td-inner">
												<span class="phone-title">配送方式</span>
												<div class="pay-logis">
													快递<b class="sys_item_freprice">10</b>元
												</div>
											</div>
										</li>
	
									</ul>
									<div class="clear"></div>
	
								</div>
						</tr>
					</s:iterator>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> <input type="text"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
							<div class="msg hidden J-msg">
								<p class="error">最多输入500个字符</p>
							</div>
						</div>
					</div>

				</div>
				<!--优惠券 -->
				<div class="buy-agio">
					<li class="td td-coupon"><span class="coupon-title">优惠券</span>
						<select data-am-selected>
							<option value="a">
								<div class="c-price">
									<strong>￥8</strong>
								</div>
								<div class="c-limit">【消费满95元可用】</div>
							</option>
							<option value="b" selected>
								<div class="c-price">
									<strong>￥3</strong>
								</div>
								<div class="c-limit">【无使用门槛】</div>
							</option>
					</select></li>

				</div>
				<div class="clear"></div>
			</div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（含运费） <span>¥</span><em class="pay-sum"></em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee"></em>
							</span>
						</div>
					<s:iterator value="#session.orderContacts" var="item" status="st">
						<s:if test="#item.isDefault==1">
							<div id="holyshit268" class="pay-address" orderContactId="${item.id}">
	
								<p class="buy-footer-address">
									<span class="buy-line-title buy-line-title-type">寄送至：</span> 
									<s:generator separator="," val="#item.address" var="address">
										<s:iterator value="#address" var="section" status="st">
									 		<span class="buy--address-detail"> <span class="section section${st.index}">${section} </span>
									 		</span> 
										</s:iterator>
									</s:generator>
								</p>
								<p class="buy-footer-address">
									<span class="buy-line-title">收货人：</span>
									<span class="buy-address-detail">   
                                        <span class="buy-user">${item.consigneeName} </span>
										<span class="buy-phone">${item.phone}</span>
									</span>
								</p>
							</div>
						</s:if>
					</s:iterator>
					</div>

					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go" href="#" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单" onclick="createOrder()">提交订单</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
	</div>
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">

		<!--标题 -->
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add
					address</small>
			</div>
		</div>
		<hr />

		<div class="am-u-md-12">
			<form class="am-form am-form-horizontal" method="POST">

				<div class="am-form-group">
					<label for="user-name" class="am-form-label">收货人</label>
					<div class="am-form-content">
						<input type="text" id="user-name" placeholder="收货人" name="orderContact.consigneeName">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">手机号码</label>
					<div class="am-form-content">
						<input id="user-phone" placeholder="手机号必填" type="email" name="orderContact.phone">
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-form-label">所在地</label>
					<div class="am-form-content address">
						<select name="orderContact.address.province" id="province" onchange="show_city()" data-am-selected>
							<option value="0">--请选择--</option>
						</select> 
						<select name="orderContact.address.city" id="city" onchange="show_dist()" data-am-selected>
							<option value="0">--请选择--</option>
						</select> <select name="orderContact.address.dist" id="dist" data-am-selected>
							<option value="0">--请选择--</option>
						</select>
				
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-intro" class="am-form-label">详细地址</label>
					<div class="am-form-content">
						<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="orderContact.address.street"></textarea>
						<small>100字以内写出你的详细地址...</small>
					</div>
				</div>

				<div class="am-form-group theme-poptit">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<div class="am-btn am-btn-danger" onclick="submitOrderContact()">保存</div>
						<div class="am-btn am-btn-danger close">取消</div>
					</div>
				</div>
			</form>
		</div>

	</div>

	<div class="clear"></div>
</body>

</html>