<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>建材列表</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<body class="pos-r">
	<div>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
			分类管理 <span class="c-gray en">&gt;</span> 三级分类列表 <a
				class="btn btn-success radius r"
				style="line-height:1.6em;margin-top:3px"
				href="javascript:location.replace(location.href);" title="刷新"><i
				class="Hui-iconfont">&#xe68f;</i></a>
		</nav>
		<div class="page-container">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a href="javascript:;" onclick="datadel()"
					class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>
						批量删除</a> <a class="btn btn-primary radius"
					onclick="product_add('添加产品','category3-add.jsp')"
					href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加三级分类</a></span> <span
					class="r">共有数据：<strong>${request.threeList.size()}</strong> 条
				</span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="40"><input name="" type="checkbox" value=""></th>
							<th width="40">ID</th>
							<th width="100">所属一级分类名称</th>
							<th width="100">所属二级分类名称</th>
							<th width="100">三级分类名称</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#request.threeList" var="item">
							<tr class="text-c va-m">
								<td><input name="" type="checkbox" value="${item.id}"></td>
								<td>${item.id}</td>
								<td class="text-l"> ${item.twoClassify.oneClassify.name}</td> 
								<td class="text-l"> ${item.twoClassify.name}</td> 
								<td class="text-l"> ${item.name}</td> 
								<td class="td-manage">
									<a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','admin_classify_getThreeClassify?id=${item.id}','${item.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
									<a style="text-decoration:none" class="ml-5" onClick="product_del(this,'${item.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
	/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
		/*产品-编辑*/
function product_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*产品-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'admin_classify_deleteThree?three.id='+id,
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
//批量删除
function datadel(){
	layer.confirm('确认要删除吗？',function(index){
		var ids = "";
		$('input:checked').each(function(key,value){
			var id = $(value).val();
			if(id!=null&&id!=""){
				ids+= id+",";
			}
		})
		ids = ids.substr(0,ids.length-1);
		$.ajax({
			type: 'POST',
			url: 'admin_classify_deleteThreeList?ids='+ids,
			dataType: 'json',
			success: function(data){
				$('input:checked').each(function(key,value){
					$(value).parents("tr").remove();
				});
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
	});
}
	</script>
</body>
</html>