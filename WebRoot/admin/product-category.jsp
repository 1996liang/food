<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>产品分类</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		产品管理 <span class="c-gray en">&gt;</span> 产品分类 <a
			class="btn btn-success radius r"
			style="line-height:1.6em;margin-top:3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<table class="table">
		<tr>
			<td width="200" class="va-t"><ul id="treeDemo" class="ztree">
					<li id="treeDemo_1" class="level0" tabindex="0" hidefocus="true"
						treenode=""><a
						id="treeDemo_1_a" class="level0" treenode_a="" onclick="showOneClassify()"
						target="_blank" style="" title="一级分类"><span
							id="treeDemo_1_ico" title="" treenode_ico=""
							class="button ico_open" style=""></span><span
							id="treeDemo_1_span">一级分类</span></a>
					</li>
					<li id="treeDemo_1" class="level0" tabindex="0" hidefocus="true"
						treenode=""><a
						id="treeDemo_1_a" class="level0" treenode_a="" onclick="showTwoClassify()"
						target="_blank" style="" title="一级分类"><span
							id="treeDemo_1_ico" title="" treenode_ico=""
							class="button ico_open" style=""></span><span
							id="treeDemo_1_span">二级分类</span></a>
					</li>
					<li id="treeDemo_1" class="level0" tabindex="0" hidefocus="true"
						treenode=""><a
						id="treeDemo_1_a" class="level0" treenode_a="" onclick="showThreeClassify()"
						target="_blank" style="" title="一级分类"><span
							id="treeDemo_1_ico" title="" treenode_ico=""
							class="button ico_open" style=""></span><span
							id="treeDemo_1_span">三级分类</span></a>
					</li>
				</ul></td>
			<td class="va-t"><iframe ID="testIframe" Name="testIframe"
					FRAMEBORDER=0 SCROLLING=AUTO width=100% height=390px
					SRC="product-category-add.html"></iframe></td>
		</tr>
	</table>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript">
	function showThreeClassify(){
		$('#testIframe').attr("SRC","product-list.html")
	}
	function showOneClassify(){
		$('#testIframe').attr("SRC","product-list.html")
	}
	function showTwoClassify(){
		$('#testIframe').attr("SRC","product-list.html")
	}
	</script>
</body>
</html>