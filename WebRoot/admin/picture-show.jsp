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

<title>图片展示</title>
<link href="lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
</head>
<body>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> 
	<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>${request.pictureLength}</strong> 条</span> </div>
	<div class="portfolio-content" id="${request.goodsId }" source="${request.source }">
		<ul class="cl portfolio-area">
			<s:iterator value="#request.picture" var="item" status="st">
				<li class="item">
					<div class="portfoliobox">
						<input class="checkbox" name="" type="checkbox" value="${st.index }">
						<div class="picbox"><a href="${item}" data-lightbox="gallery" data-title="1"><img src="${item}"></a></div>
						<div class="textbox">${st.index } </div>
					</div>
				</li>
			</s:iterator>
		</ul>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/lightbox2/2.8.1/js/lightbox.min.js"></script> 
<script type="text/javascript">
$(function(){
	$(".portfolio-area li").Huihover();
});
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
		var id = $('.portfolio-content').attr('id');
		var source = $('.portfolio-content').attr('source');
		$.ajax({
			type: 'POST',
			url: 'admin_goodsManage_deletePictureList?ids='+ids+'&id='+id+'&source='+source,
			dataType: 'json',
			success: function(data){
				$('input:checked').each(function(key,value){
					$(value).parents(".item").remove();
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