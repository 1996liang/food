<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>操作结果</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="../js/password.js"></script>
</head>

<body>
	<s:debug></s:debug>
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

				<div
					style="text-align: center; position: relative;top: 20%; line-height: 35px;">
					<s:if test="#request.passwordOperate==1">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">旧密码错误</h1>
					</s:if>
					<s:elseif test="#request.passwordOperate==2">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">新密码与确认密码不一致</h1>
					</s:elseif>
					<s:elseif test="#request.passwordOperate==3">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">修改密码成功</h1>
					</s:elseif>
					<s:if test="#request.emailOperate=='success'">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">修改邮箱成功</h1>
					</s:if>
					<s:if test="#request.phoneOperate=='success'">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">绑定手机成功</h1>
					</s:if>
					<s:if test="#request.alterUserInfo=='success'">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">修改个人信息成功</h1>
					</s:if>
					<s:if test="#request.evaluateSuccess=='success'">
						<img alt="成功" src="../images/success.png"
							style="width: 70px;height: 70px;">
						<h1 style="background-color: 1e9348;font-size: 22px;">评价商品成功</h1>
					</s:if>
					<label><a
						href='javascript:history.go(-1)' style='color: #2A00FF;'>返回上一步</a></label>
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