<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>建材列表</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<div>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c">
			<input type="text" name="" id="" placeholder=" 产品名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜产品</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加产品','admin_goodsManage_addGoodsPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span> <span class="r">共有数据：<strong>${request.count}</strong> 条</span> </div>
		<div class="mt-20 bigTable" page="${request.page }" maxResult="${request.maxResult}">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40"><input name="" type="checkbox" value=""></th>
						<th width="40">ID</th>
						<th width="60">缩略图</th>
						<th width="100">产品名称</th>
						<th>图片描述</th>
						<th width="100">原价</th>
						<th width="100">现价</th>
						<th width="100">余量</th>
						<th width="100">销售量</th>
						<th width="60">发布状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.goodsList" var="item">
						<tr class="text-c va-m">
							<td><input name="" type="checkbox" value="${item.id}"></td>
							<td>${item.id}</td>
							<td><a onClick="product_show('${item.goodsName}','admin_goodsManage_pictureShow?id=${item.id}',${item.id})" href="javascript:;"><img width="60" class="product-thumb" src="${item.getImagesArray()[0] }"></a></td>
							<td class="text-l"><a style="text-decoration:none" onClick="product_show('${item.goodsName}','product-show.html','10001')" href="javascript:;"> ${item.goodsName}</a></td>
							<td><a onClick="product_show('${item.goodsName}','admin_goodsManage_pictureDescShow?id=${item.id}','10001')" href="javascript:;"><img width="60" class="product-thumb" src="${item.getDescribeImageArray()[0]}"></a></td>
							<td><span class="price">${item.originalPrice}</span>元</td>
							<td><span class="price">${item.latelyPrice}</span> 元</td>
							<td><span class="price">${item.surplus}</span></td>
							<td><span class="price">${item.salesVolume}</span></td>
							
							<td class="td-status">
								<s:if test="#item.status==0">
									<span class="label label-defeat radius">未发布</span>
								</s:if>
								<s:else>
									<span class="label label-success radius">已发布</span>
								</s:else>
							</td>
							<td class="td-manage">
								<s:if test="#item.status==1">
									<a style="text-decoration:none" onClick="product_stop(this,${item.id})" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> 
								</s:if>
								<s:else>
									<a style="text-decoration:none" onClick="product_start(this,${item.id})" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>
								</s:else>
							<a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,${item.id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var currentPage = parseInt($('.bigTable').attr('page'));
	var maxResult = parseInt($('.bigTable').attr('maxResult'));
	var perviousPage = currentPage-1;
	var nextPage = currentPage+1;
	$('#DataTables_Table_0_length .select').val(maxResult);
	if(currentPage>0){
		$('.current').text(currentPage);
	}else{
		$('.current').text(1);
	}
	$('#DataTables_Table_0_length .select').bind('change',function(){
		var maxResult =	$('#DataTables_Table_0_length .select').val();
		$(window).attr("location","admin_goodsManage_getGoodsList?page="+currentPage+"&&maxResult="+maxResult);
	});
	$('.previous').bind('click',function(){
		$(this).attr("href","admin_goodsManage_getGoodsList?page="+perviousPage+"&&maxResult="+maxResult);
	});
	$('.next').bind('click',function(){
		$(this).attr("href","admin_goodsManage_getGoodsList?page="+nextPage+"&&maxResult="+maxResult);
	})
});


var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				//demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
};

var zNodes =[
	{ id:1, pId:0, name:"一级分类", open:true},
	{ id:11, pId:1, name:"二级分类"},
	{ id:111, pId:11, name:"三级分类"},
	{ id:112, pId:11, name:"三级分类"},
	{ id:113, pId:11, name:"三级分类"},
	{ id:114, pId:11, name:"三级分类"},
	{ id:115, pId:11, name:"三级分类"},
	{ id:12, pId:1, name:"二级分类 1-2"},
	{ id:121, pId:12, name:"三级分类 1-2-1"},
	{ id:122, pId:12, name:"三级分类 1-2-2"},
];
		
		
		
$(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	//demoIframe = $("#testIframe");
	//demoIframe.on("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
});

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*产品-下架*/
function product_stop(obj,id){
	var status = 0;
	
	layer.confirm("确认要下架吗？",function(index){
		var url="admin_goodsManage_stopGoods";
		var data={'id':id,'status':status};
		var resultmsg = ajaxSend(url,data);
		if(resultmsg=="success"){
			$(obj).parents("tr").find(".td-manage").prepend("<a style='text-decoration:none' onClick='product_start(this,"+id+")' href='javascript:;' title='发布'><i class='Hui-iconfont'>&#xe603;</i></a>");
			$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
			$(obj).remove();
			layer.msg("已下架!",{icon: 5,time:1000});
		}
	});
}

/*产品-发布*/
function product_start(obj,id){
	var status = 1;
	console.log(id);
	layer.confirm('确认要发布吗？',function(index){
		var url="admin_goodsManage_stopGoods";
		var data={'id':id,'status':status};
		var resultmsg = ajaxSend(url,data);
		if(resultmsg=="success"){
			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,'+id+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
			$(obj).remove();
			layer.msg('已发布!',{icon: 6,time:1000});
		}
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
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
			url: 'admin_goodsManage_deleteGoods?id='+id,
			dataType: 'json',
			success: function(data){
				if(data=="success"){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}
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
			url: 'admin_goodsManage_deleteGoodsList?ids='+ids,
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
function ajaxSend(url,data){
	var returnMsg ;
	$.ajax({
		url:url,
		data:data,
		dataType:"json",
		type:"post",
		async:false,
		success:function(msg){
			returnMsg = msg;
		}
	});
	return returnMsg;
}
</script>
</body>
</html>