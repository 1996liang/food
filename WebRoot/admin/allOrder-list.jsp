<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>所有订单</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body class="pos-r">
	<div>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			订单管理 <span class="c-gray en">&gt;</span> 所有订单列表 <a
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="text-c">
				<input type="text" name="" id="search" placeholder="订单编号"
					style="width:250px" class="input-text">
				<button name="" id="" class="btn btn-success" type="submit" onclick="search()">
					<i class="Hui-iconfont">&#xe665;</i> 搜订单
				</button>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				 <span class="r">共有数据：<strong>${request.count}</strong> 条
				</span>
			</div>
			<div class="mt-20 bigTable" page="${request.page }"
				maxResult="${request.maxResult}">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="40"><input name="" type="checkbox" value=""></th>
							<th width="40">订单ID</th>
							<th width="60">购买用户</th>
							<th width="100">金额</th>
							<th>购买项</th>
							<th width="70">订单状态</th>
							<th width="150">下单时间</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.orderList" var="item">
							<tr class="text-c va-m">
								<td><input name="" type="checkbox" value="${item.id}"></td>
								<td>${item.id}</td>
								<td>${item.user.nickName}</td>
								<td class="money">
									<span class="price">${item.money}</span>
								</td>
								<td>
								<s:iterator value="#item.orderItems" var="orderItem">
										<span class="price">${orderItem.goods.goodsName}</span>
								</s:iterator>
								</td>
								<td class="td-status"><s:if test="#item.status==1">
										<span class="label label-success radius">未发货</span>
									</s:if> <s:elseif test="#item.status==2">
										<span class="label label-success radius">已发货</span>
									</s:elseif> <s:elseif test="#item.status==3">
										<span class="label label-success radius">未评价</span>
									</s:elseif> <s:elseif test="#item.status==4">
										<span class="label label-success radius">已结束</span>
									</s:elseif> <s:elseif test="#item.status==0">
										<span class="label label-success radius">未结账</span>
									</s:elseif>
									 <s:elseif test="#item.status==5">
										<span class="label label-success radius">订单失败</span>
									</s:elseif>
								</td>
								<td><span class="price">${item.orderTime}</span></td>
								<td class="td-manage">
								<s:if test="#item.status==1">
										<a style="text-decoration:none"
											onClick="fahuo(this,${item.id})" href="javascript:;"
											title="发货"><i class="Hui-iconfont">&#xe603;</i></a>
								</s:if>
								</td> 
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		function search(){
			var id = parseInt($("#search").val());
			if(isNaN(id)){
				alert("请输入订单编号");
				return false;
			}else{
				var url ='admin_adminOrderManage_allByIdGetOrderInfo?id='+id;
				$(window).attr('location',url);
			}
		}
		function money(){
			$('.money span').each(function(key,value){
				var money = parseFloat($(value).text());
				$(value).text(money.toFixed(2));
			})
		}
		$(document).ready(
				function() {
					money();
					page();
				});
		function page(){
			var currentPage = parseInt($('.bigTable').attr('page'));
					var maxResult = parseInt($('.bigTable').attr('maxResult'));
					var perviousPage = currentPage - 1;
					var nextPage = currentPage + 1;
					$('#DataTables_Table_0_length .select').val(maxResult);
					if (currentPage > 0) {
						$('.current').text(currentPage);
					} else {
						$('.current').text(1);
					}
					$('#DataTables_Table_0_length .select').bind(
							'change',
							function() {
								var maxResult = $(
										'#DataTables_Table_0_length .select')
										.val();
								$(window).attr(
										"location",
										"admin_adminOrderManage_getAllOrder?page="
												+ currentPage + "&&maxResult="
												+ maxResult);
							});
					$('.previous').bind(
							'click',
							function() {
								$(this).attr(
										"href",
										"admin_adminOrderManage_getAllOrder?page="
												+ perviousPage + "&&maxResult="
												+ maxResult);
							});
					$('.next').bind(
							'click',
							function() {
								$(this).attr(
										"href",
										"admin_adminOrderManage_getAllOrder?page="
												+ nextPage + "&&maxResult="
												+ maxResult);
							})
		}
		$('.table-sort').dataTable({
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [ {
				"orderable" : false,
				"aTargets" : [ 0, 7 ]
			} // 制定列不参与排序
			]
		});
		/*产品-添加*/
		function product_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*产品-查看*/
		function product_show(title, url, id) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*产品-发布*/
		/*
		function product_start(obj, id) {
			var status = 1;
			console.log(id);
			layer
					.confirm(
							'确认要发布吗？',
							function(index) {
								var url = "admin_goodsManage_stopGoods";
								var data = {
									'id' : id,
									'status' : status
								};
								var resultmsg = ajaxSend(url, data);
								if (resultmsg == "success") {
									$(obj)
											.parents("tr")
											.find(".td-manage")
											.prepend(
													'<a style="text-decoration:none" onClick="product_stop(this,'
															+ id
															+ ')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
									$(obj)
											.parents("tr")
											.find(".td-status")
											.html(
													'<span class="label label-success radius">已发布</span>');
									$(obj).remove();
									layer.msg('已发布!', {
										icon : 6,
										time : 1000
									});
								}
							});
		}
	*/
		function fahuo(obj,id){
			layer.confirm('确认已经发货吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : 'admin_adminOrderManage_alterfilledOrder?id=' + id,
					dataType : 'json',
					success : function(data) {
						if (data == "success") {
							layer.msg('已发货!', {
								icon : 1,
								time : 1000
							});
						}
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
		/*产品-删除*/
		function product_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : 'admin_goodsManage_deleteGoods?id=' + id,
					dataType : 'json',
					success : function(data) {
						if (data == "success") {
							$(obj).parents("tr").remove();
							layer.msg('已删除!', {
								icon : 1,
								time : 1000
							});
						}
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
		//批量删除
		function datadel() {
			layer.confirm('确认要删除吗？', function(index) {
				var ids = "";
				$('input:checked').each(function(key, value) {
					var id = $(value).val();
					if (id != null && id != "") {
						ids += id + ",";
					}
				})
				ids = ids.substr(0, ids.length - 1);
				$.ajax({
					type : 'POST',
					url : 'admin_goodsManage_deleteGoodsList?ids=' + ids,
					dataType : 'json',
					success : function(data) {
						$('input:checked').each(function(key, value) {
							$(value).parents("tr").remove();
						});
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}
		function ajaxSend(url, data) {
			var returnMsg;
			$.ajax({
				url : url,
				data : data,
				dataType : "json",
				type : "post",
				async : false,
				success : function(msg) {
					returnMsg = msg;
				}
			});
			return returnMsg;
		}
	</script>
</body>
</html>