<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="../js/addressManage2.js"></script>

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
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>

		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
							<ul>
				<li class="index"><a href="index">首页</a></li>
			</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<s:iterator value="#request.orderContacts" var="item" status="st">
							<s:if test="#item.isDefault==1">
							<li class="user-addresslist defaultAddr" itemId="${item.id}" id="addlist">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${item.consigneeName }</span>
									<span class="new-txt-rd2">${item.phone}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<s:generator separator="," val="#item.address" var="address">
											<s:iterator value="#address" var="section" status="st">
										 		<span class="section section${st.index}">${section}</span>
											</s:iterator>
										</s:generator>
									</p>
								</div>
								<div class="new-addr-btn">
									<a href="#" onclick="alterOrderContact(${item.id})"><span><i class="am-icon-edit"></i>编辑</span></a>
									<span class="new-addr-bar">|</span>
									<a href="#" onclick="deleteAddress(this,${item.id})"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>
								</s:if>
								<s:else>
							<li class="user-addresslist" itemId="${item.id}" id="addlist">
								<span class="new-option-r" onclick="setDefault(${item.id})"><i class="am-icon-check-circle" ></i>设为默认</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${item.consigneeName }</span>
									<span class="new-txt-rd2">${item.phone}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<s:generator separator="," val="#item.address" var="address">
											<s:iterator value="#address" var="section" status="st">
										 		<span class="section section${st.index}">${section}</span>
											</s:iterator>
										</s:generator>
									</p>
								</div>
								<div class="new-addr-btn">
									<a href="#" onclick="alterOrderContact(${item.id})"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="#" onclick="deleteAddress(this,${item.id});"><i class="am-icon-trash"></i>删除</a>
								</div>
							</li>
							</s:else>
							</s:iterator>
						</ul>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf am-cf1"><strong class="am-text-danger am-text-lg am-text-lg1">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
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

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<a class="am-btn am-btn-danger" onclick="submitOrderContact()">保存</a>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
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