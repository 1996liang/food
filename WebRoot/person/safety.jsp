<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>安全设置</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
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

				<!--标题 -->
				<div class="user-safety">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">

						<div class="filePic">
							<img class="am-circle am-img-thumbnail"
								src="../images/getAvatar.do.jpg" alt="" />
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i>${application.user.nickName}</i></b>
							</div>
							<div class="safeText">
								<a href="safety.html">账户安全:<em style="margin-left:20px ;">${request.score}</em>分
								</a>
								<div class="progressBar">
									<span style="left: -95px;" class="progress"></span>
								</div>
							</div>
						</div>
					</div>

					<div class="check">
						<ul>
							<li><i class="i-safety-lock"></i>
								<div class="m-left">
									<div class="fore1">登录密码</div>
									<div class="fore2">
										<small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="safeSetUp_passwordPage">
										<div class="am-btn am-btn-secondary">修改</div>
									</a>
								</div></li>
							<li><i class="i-safety-iphone"></i> <s:if
									test="#request.userPhone==null">
									<div class="m-left">
										<div class="fore1">手机验证</div>
										<div class="fore2">
											<small>您还没验证手机呢。为了账户安全性，赶紧验证手机吧</small>
										</div>
									</div>
									<div class="fore3">
										<a href="safeSetUp_phonePage">
											<div class="am-btn am-btn-secondary">绑定</div>
										</a>
									</div>
								</s:if> <s:else>
									<div class="m-left">
										<div class="fore1">手机验证</div>
										<div class="fore2">
											<small>您验证的手机：${request.userPhone} 若已丢失或停用，请立即更换</small>
										</div>
									</div>
									<div class="fore3">
										<a href="safeSetUp_phonePage">
											<div class="am-btn am-btn-secondary">换绑</div>
										</a>
									</div>
								</s:else></li>
							<li><i class="i-safety-mail"></i> <s:if
									test="#request.userEmail==null">
									<div class="m-left">
										<div class="fore1">邮箱验证</div>
										<div class="fore2">
											<small>您还没进行邮箱验证呢，邮箱验证可用于快速找回登录密码</small>
										</div>
									</div>
									<div class="fore3">
										<a href="safeSetUp_emailPage">
											<div class="am-btn am-btn-secondary">绑定</div>
										</a>
									</div>
								</s:if> <s:else>
									<div class="m-left">
										<div class="fore1">邮箱验证</div>
										<div class="fore2">
											<small>您验证的邮箱：${request.userEmail} 可用于快速找回登录密码</small>
										</div>
									</div>
									<div class="fore3">
										<a href="safeSetUp_emailPage">
											<div class="am-btn am-btn-secondary">换绑</div>
										</a>
									</div>
								</s:else></li>
								<!-- 
							<li><i class="i-safety-idcard"></i>
								<div class="m-left">
									<div class="fore1">实名认证</div>
									<div class="fore2">
										<small>用于提升账号的安全性和信任级别，认证后不能修改认证信息。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="../person/idcard.html">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li>
							<li><i class="i-safety-security"></i>
								<div class="m-left">
									<div class="fore1">安全问题</div>
									<div class="fore2">
										<small>保护账户安全，验证您身份的工具之一。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="../person/question.html">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li>
								 -->
						</ul>
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