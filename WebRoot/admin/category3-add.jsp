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
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>添加三级分类</title>
</head>
<body>
	<div class="page-container">
		<form action="admin_classify_addThree" method="post" class="form form-horizontal"
			id="form-user-add">
			<input type="hidden" name="three.id" id="id" value="${request.three.id }" oneId="${request.three.twoClassify.oneClassify.id }" twoId="${request.three.twoClassify.id }">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>一级分类栏目：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="one.id"
						class="select" id="oneSelect" onchange="show_two()">
							<option value='-1'>--请选择--</option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>二级分类栏目：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box"> <select name="two.id"
						class="select" id="twoSelect"> </select> </span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"> <span
					class="c-red">*</span> 分类名称：
				</label>
				<div class="formControls col-xs-6 col-sm-6">
					<input type="text" class="input-text"
						value="${request.three.name }" placeholder="" id="user-name"
						name="three.name">
				</div>
			</div>

			<div class="row cl">
				<div class="col-9 col-offset-2">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
		</form>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
	
		function selectedOne(){
			var id = $('#id').val();
			if(id!=null&&id!=""){
				var oneId = $('#id').attr('oneId');
				$("#oneSelect").val(parseInt(oneId));
				show_two();
			}
		}
		function selectedTwo(){
			var id = $('#id').val();
			if(id!=null&&id!=""){
				var twoId = $('#id').attr('twoId');
				$("#twoSelect").val(parseInt(twoId));
			}
		}
		
		var classifyMsg = null;
		//显示一级目录
		function show_One() {
			$.get('admin_classify_ajaxGetClassifyList', function(msg) {
				classifyMsg = msg;
				$.each(msg, function(key, value) {
					$('#oneSelect').append(
							"<option value='"+value.id+"'>" + value.name
									+ "</option>");
				})
			selectedOne();
			}, 'json');
		}
		//显示二级目录
		function show_two() {
			var ID = $('#oneSelect option:selected').val();
			$('#twoSelect').empty();
			$.each(classifyMsg, function(key, value) {
				if (value.id == parseInt(ID)) {
					var two = value.twoClassifys;
					$.each(two, function(twoKey, twoValue) {
						$('#twoSelect').append(
								"<option value='"+twoValue.id+"'>"
										+ twoValue.name + "</option>");
					});
					selectedTwo();
				}
			})
		}
		$(document).ready(function() {
			show_One();
		});
	</script>
</body>
</html>