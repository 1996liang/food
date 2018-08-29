<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="../css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>

</head>

<body>
	<s:debug></s:debug>

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
					id="ai-topsearch" class="submit" value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>¥${session.paySuccessTotal }</em></li>
					<div class="user-info">
						<p>收货人：${session.paySuccessOrderContact.consigneeName }</p>
						<p>联系电话：${session.paySuccessOrderContact.phone }</p>
						<p class="buy-line-title buy-line-title-type">收货地址：${session.paySuccessOrderContact.address}</p> 
							<!-- 
							<s:generator separator="," val="#paySuccessOrderContact.address" var="address">
								<s:iterator value="#address" var="item" status="st">
									 <p class="section section${st.index}">${item}</p>
									
								</s:iterator>
							</s:generator>
							 -->
						</span>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
				<div class="option">
					<span class="info">您可以</span> <a href="orderManage_getUserAllOrder?user.id=${application.user.id}"
						class="J_MakePoint">查看<span>已买到的宝贝</span></a>
						
				</div>
			</div>
		</div>
	</div>


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


</body>
</html>
