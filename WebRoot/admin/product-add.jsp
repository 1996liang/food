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
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<!--/meta 作为公共模版分离出去-->

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="goodsName" name="goods.goodsName">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>三级分类栏目：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select name="goods.threeClassify.id" class="select" id="threeSelect" onchange="getGoodsLabel()" name="goods.threeClassify.id">
					<option value="0">--请选择--</option>
					<s:iterator value="#request.threeClassify" var="item">
						<option value="${item.id}">${item.name}</option>
					</s:iterator>
				</select>
				</span> </div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品选项：</label>
			<div class="formControls col-xs-8 col-sm-9" id="option">
				<div>
					选项名
					<input type="text" name="goods.goodsOptions.goodsOptions.name" id="" placeholder="输入选项名" value="" class="input-text goodsOptionsName" style=" width:25%">
					<button onClick="newOptionName()" class="btn btn-default radius" type="button">&nbsp;&nbsp;添加新选项&nbsp;&nbsp;</button></br></br>
					选项值
					<input type="text" name="goods.goodsOptions.name" id="" placeholder="输入选项值" value="" class="input-text goodsOptionsValue" style=" width:10%">
					选项值
					<input type="text" name="goods.goodsOptions.name" id="" placeholder="输入选项值" value="" class="input-text goodsOptionsValue" style=" width:10%">
					<button onClick="newOptionValue(this)" class="btn btn-default radius" type="button">&nbsp;&nbsp;添加选项值&nbsp;&nbsp;</button>
				</div>
				</br></br>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商品标签</label>
			
			<div class="formControls col-xs-8 col-sm-9" style=" width:15%"> 标签名</br><span class="select-box"  style=" margin-top:5px;">
				<select name="goods.goodsLabels.superGoodsName.labelName" class="select" id="labelName" onchange="showLabelValue()">
				
				</select>
					<button onClick="newLabelValue(this)" class="btn btn-default radius" type="button">&nbsp;&nbsp;添加新标签值&nbsp;&nbsp;</button></br>
				</span> </div>
			<div class="formControls col-xs-8 col-sm-9" style=" width:15%"> 标签值</br><span class="select-box"  style=" margin-top:5px;">
				<select name="goods.goodsLabels.labelName" class="select" id="labelValue">
				</select>
				<button onClick="newLabelValue(this)" class="btn btn-default radius" type="button">&nbsp;&nbsp;添加新标签值&nbsp;&nbsp;</button></br>
				</span> </div>
				<button onClick="confirmNewGoodsLabel()" class="btn btn-primary radius confirm" type="button">&nbsp;&nbsp;确定标签&nbsp;&nbsp;</button>
		</div>
		<div class="row cl result" id="result">
			<div class="formControls col-xs-8 col-sm-9">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品原来价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goods.originalPrice" id="originalPrice" placeholder="" value="" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品最新价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goods.latelyPrice" id="latelyPrice" placeholder="" value="" class="input-text" style="width:90%">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">存货：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goods.surplus" id="surplus" placeholder="" value="" class="input-text" style="width:90%">
				</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品封面图片上传：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container">
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker-2"></div>
							<p>或将照片拖到这里，单次最多可选300张</p>
						</div>
					</div>
					<div class="statusBar" style="display:none;">
						<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
						<div class="info"></div>
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn">开始上传</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">商品描述内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
			 <div id="editor">
        		
   			 </div>

  				  <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
			    <script type="text/javascript" src="lib/wangEditor.js"></script>
			    <script type="text/javascript">
			        var E = window.wangEditor
			        var editor = new E('#editor')
			         editor.customConfig.uploadImgServer = 'fileUpload_upload?uploadPath=productDesc'
			        // 或者 var editor = new E( document.getElementById('#editor') )
			        editor.create()
			    </script>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="formSubmit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 

<script type="text/javascript">
function formSubmit(){
	var goodsName = $("#goodsName").val();
	var threeId = parseInt($("#threeSelect").val());
	var latelyPrice = parseFloat($("#latelyPrice").val());
	var originalPrice = parseFloat($("#originalPrice").val());
	var surplus = parseInt($("#surplus").val());
	var optionStr = "";
	var desc = editor.txt.html();
	var descStr = "";
	 $(desc).children("img").each(function(key,value){
		descStr+= $(this).attr("src")+"`";
	})
	$(".goodsOptionsName").each(function(i,item){
		optionStr+=$(this).val()+":";
		$(this).parent('div').children(".goodsOptionsValue").each(function(index,item){
			optionStr+=$(this).val()+",";
 		})
 		optionStr+="]";
 	})
 	console.log(optionStr);
 	var labelStr="";
 	$(".result .formControls div").each(function(index,item){
 		labelStr+=$(this).children("span").attr("labelNameID")+"/"
 		labelStr+=$(this).children("span").text()+":"
 		labelStr+=$(this).children("button").attr("labelValueID")+"/"
 		labelStr+=$(this).children("button").text()
 		labelStr+="]";
 	})
 	console.log(labelStr);
 	console.log(descStr);
	var url = "admin_goodsManage_addGoods";
	var data = {"goods.goodsName":goodsName,"goods.surplus":surplus,"goods.goodsDescribe":descStr,"goods.latelyPrice":latelyPrice,"goods.originalPrice":originalPrice,"optionStr":optionStr,"labelStr":labelStr,"id":threeId};
	var result = ajaxSend(url,data);
	if(result=="success"){
		layer.msg('已添加!',{icon:1,time:1000});
		$(window).attr("location","admin_goodsManage_getGoodsList?page=1&&maxResult=10");
	}
	return false;
}
</script>
<script type="text/javascript">
function confirmNewGoodsLabel(){
	//标签名
	var labelNameName = $('#labelName').find("option:selected").text();
	var labelNameID = $('#labelName').val();
	//标签值
	var labelValueName = $('#labelValue').find("option:selected").text();
	var labelValueID = $('#labelValue').val();
	console.log(labelNameID+".."+labelNameName+","+labelValueID+".."+labelValueName);
	$(".result .formControls").append("<div>&nbsp;&nbsp;&nbsp;&nbsp;<span labelNameID="+labelNameID+">"+labelNameName+"</span>&nbsp;&nbsp;:&nbsp;&nbsp;<button onmousemove='mouseOver(this)' onmouseleave='mouseLeave(this)' onClick='cancelGoodsLabel(this);' class='btn btn-default radius' type='button' labelValueID="+labelValueID+" labelValueName="+labelValueName+">"+labelValueName+"</button>&nbsp;&nbsp;&nbsp;&nbsp;</div></br>");
}
function cancelGoodsLabel(obj){
	$(obj).parent('div').remove();
}
function mouseLeave(obj){
	var text = $(obj).attr("labelValueName");
	$(obj).html("&nbsp;&nbsp;"+text+"&nbsp;&nbsp;");
}
function mouseOver(obj){
	$(obj).html("&nbsp;&nbsp;删除&nbsp;&nbsp;");
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('form').bind('submit',function(event){
		event.preventDefault();
	})
})

var labelMsg = null;
//获取该三级分类对应的标签
function getGoodsLabel(){
	var value = $('#threeSelect').val();
	if(value!=0){
		var url="admin_goodsManage_getGoodsLabel";
		var data = {"id":value};
		var msg = ajaxSend(url,data);
		var oneId = null;
		labelMsg = msg;
		$('#labelValue').empty();
		$('#labelName').empty();
		$.each(msg, function(key, value) {
					value = JSON.parse(value);
					$('#labelName').append("<option value='"+value.superGoodsNameId+"'>" + value.superGoodsNameName
										+ "</option>");
					if(key==0){
						oneId=value.superGoodsNameId;
					}
					if(value.superGoodsNameId==oneId){
						$('#labelValue').append("<option value='"+value.id+"'>" + value.labelName
											+ "</option>");
					}
		})
	}
}

function showLabelValue(){
	var id = parseInt($('#labelName').val());
	$('#labelValue').empty();
	$.each(labelMsg, function(key, value) {
		value = JSON.parse(value);
		if(value.superGoodsNameId==id){
			$('#labelValue').append("<option value='"+value.id+"'>" + value.labelName
											+ "</option>");
		}
		
	});
}
//添加新的标签值
function newLabelValue(obj){
	$(obj).parent("span").append('</br><input type="text" name="" id="" placeholder="输入新的标签值" value="" class="input-text labelValue" style=" width:100%"></br>');
	$(obj).parent("span").append('</br><button onClick="confirmNewLabelValue(this)" class="btn btn-primary radius confirm" type="button">&nbsp;&nbsp;确定&nbsp;&nbsp;</button>&nbsp;&nbsp;');
	$(obj).parent("span").append('<button onClick="cancelNewLabelValue(this)" class="btn btn-default radius cancel" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button></br>');
}
//取消添加新的标签值
function cancelNewLabelValue(obj){
	($(obj).parent("span")).children(".labelValue").remove();
	($(obj).parent("span")).children(".confirm").remove();
	($(obj).parent("span")).children(".cancel").remove();
}
//确定添加新的标签值
function confirmNewLabelValue(obj){
	var value = ($(obj).parent("span")).children(".labelValue").val();
	if(value!=null){
		($(obj).parent("span")).children(".select").append('<option value="0">'+value+'</option>');
		($(obj).parent("span")).children(".cancel").remove();
		cancelNewLabelValue(obj);
		layer.msg('已添加!',{icon:1,time:1000});
	}
}
//添加新的选项
function newOptionName(){
	$("#option").append("<div>"+
					"选项名&nbsp;"+
					"<input type='text' name='goods.goodsOptions.goodsOptions.name' id='' placeholder='输入选项名' value='' class='input-text goodsOptionsName' style='width:25%'></br></br>"+
					"选项值&nbsp;"+
					"<input type='text' name='goods.goodsOptions.name' id='' placeholder='输入选项值' value='' class='input-text goodsOptionsValue' style=' width:10%'>&nbsp;&nbsp;"+
					"选项值&nbsp;"+
					"<input type='text' name='goods.goodsOptions.name' id='' placeholder='输入选项值' value='' class='input-text goodsOptionsValue' style=' width:10%'>&nbsp;&nbsp;"+
					"<button onClick='newOptionValue(this)' class='btn btn-default radius' type='button'>&nbsp;&nbsp;添加选项值&nbsp;&nbsp;</button>"+
				"</div></br></br>");
}
//添加新的选项值
function newOptionValue(content){
	$(content).before("选项值&nbsp;<input type='text' name='goods.goodsOptions.name' id='' placeholder='输入选项值' value='' class='input-text goodsOptionsValue' style=' width:10%'>&nbsp;&nbsp;");
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
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
		
		// 文件接收服务端。
		server: 'fileUpload_upload?uploadPath=productCover',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });

});

(function( $ ){
    // 当domReady的时候开始初始化
    $(function() {
        var $wrap = $('.uploader-list-container'),

            // 图片容器
            $queue = $( '<ul class="filelist"></ul>' )
                .appendTo( $wrap.find( '.queueList' ) ),

            // 状态栏，包括进度和控制按钮
            $statusBar = $wrap.find( '.statusBar' ),

            // 文件总体选择信息。
            $info = $statusBar.find( '.info' ),

            // 上传按钮
            $upload = $wrap.find( '.uploadBtn' ),

            // 没选择文件之前的内容。
            $placeHolder = $wrap.find( '.placeholder' ),

            $progress = $statusBar.find( '.progress' ).hide(),

            // 添加的文件数量
            fileCount = 0,

            // 添加的文件总大小
            fileSize = 0,

            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,

            // 缩略图大小
            thumbnailWidth = 110 * ratio,
            thumbnailHeight = 110 * ratio,

            // 可能有pedding, ready, uploading, confirm, done.
            state = 'pedding',

            // 所有文件的进度信息，key为file id
            percentages = {},
            // 判断浏览器是否支持图片的base64
            isSupportBase64 = ( function() {
                var data = new Image();
                var support = true;
                data.onload = data.onerror = function() {
                    if( this.width != 1 || this.height != 1 ) {
                        support = false;
                    }
                }
                data.src = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
                return support;
            } )(),

            // 检测是否已经安装flash，检测flash的版本
            flashVersion = ( function() {
                var version;

                try {
                    version = navigator.plugins[ 'Shockwave Flash' ];
                    version = version.description;
                } catch ( ex ) {
                    try {
                        version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                .GetVariable('$version');
                    } catch ( ex2 ) {
                        version = '0.0';
                    }
                }
                version = version.match( /\d+/g );
                return parseFloat( version[ 0 ] + '.' + version[ 1 ], 10 );
            } )(),

            supportTransition = (function(){
                var s = document.createElement('p').style,
                    r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
                s = null;
                return r;
            })(),

            // WebUploader实例
            uploader;

        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {

            // flash 安装了但是版本过低。
            if (flashVersion) {
                (function(container) {
                    window['expressinstallcallback'] = function( state ) {
                        switch(state) {
                            case 'Download.Cancelled':
                                alert('您取消了更新！')
                                break;

                            case 'Download.Failed':
                                alert('安装失败')
                                break;

                            default:
                                alert('安装已成功，请刷新！');
                                break;
                        }
                        delete window['expressinstallcallback'];
                    };

                    var swf = 'expressInstall.swf';
                    // insert flash object
                    var html = '<object type="application/' +
                            'x-shockwave-flash" data="' +  swf + '" ';

                    if (WebUploader.browser.ie) {
                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                    }

                    html += 'width="100%" height="100%" style="outline:0">'  +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                    '</object>';

                    container.html(html);

                })($wrap);

            // 压根就没有安转。
            } else {
                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
            }

            return;
        } else if (!WebUploader.Uploader.support()) {
            alert( 'Web Uploader 不支持您的浏览器！');
            return;
        }

        // 实例化
        uploader = WebUploader.create({
            pick: {
                id: '#filePicker-2',
                label: '点击选择图片'
            },
            formData: {
                uid: 123
            },
            dnd: '#dndArea',
            paste: '#uploader',
            swf: 'lib/webuploader/0.1.5/Uploader.swf',
            chunked: false,
            chunkSize: 512 * 1024,
            server: 'fileUpload_upload?uploadPath=productCover',
            // runtimeOrder: 'flash',
            // accept: {
            //     title: 'Images',
            //     extensions: 'gif,jpg,jpeg,bmp,png',
            //     mimeTypes: 'image/*'
            // },

            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            disableGlobalDnd: true,
            fileNumLimit: 300,
            fileSizeLimit: 200 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 50 * 1024 * 1024    // 50 M
        });

        // 拖拽时不接受 js, txt 文件。
        uploader.on( 'dndAccept', function( items ) {
            var denied = false,
                len = items.length,
                i = 0,
                // 修改js类型
                unAllowed = 'text/plain;application/javascript ';

            for ( ; i < len; i++ ) {
                // 如果在列表里面
                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                    denied = true;
                    break;
                }
            }

            return !denied;
        });

        uploader.on('dialogOpen', function() {
            console.log('here');
        });

        // uploader.on('filesQueued', function() {
        //     uploader.sort(function( a, b ) {
        //         if ( a.name < b.name )
        //           return -1;
        //         if ( a.name > b.name )
        //           return 1;
        //         return 0;
        //     });
        // });

        // 添加“添加文件”的按钮，
        uploader.addButton({
            id: '#filePicker2',
            label: '继续添加'
        });

        uploader.on('ready', function() {
            window.uploader = uploader;
        });

        // 当有文件添加进来时执行，负责view的创建
        function addFile( file ) {
            var $li = $( '<li id="' + file.id + '">' +
                    '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>'+
                    '<p class="progress"><span></span></p>' +
                    '</li>' ),

                $btns = $('<div class="file-panel">' +
                    '<span class="cancel">删除</span>' +
                    '<span class="rotateRight">向右旋转</span>' +
                    '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
                $prgress = $li.find('p.progress span'),
                $wrap = $li.find( 'p.imgWrap' ),
                $info = $('<p class="error"></p>'),

                showError = function( code ) {
                    switch( code ) {
                        case 'exceed_size':
                            text = '文件大小超出';
                            break;

                        case 'interrupt':
                            text = '上传暂停';
                            break;

                        default:
                            text = '上传失败，请重试';
                            break;
                    }

                    $info.text( text ).appendTo( $li );
                };

            if ( file.getStatus() === 'invalid' ) {
                showError( file.statusText );
            } else {
                // @todo lazyload
                $wrap.text( '预览中' );
                uploader.makeThumb( file, function( error, src ) {
                    var img;

                    if ( error ) {
                        $wrap.text( '不能预览' );
                        return;
                    }

                    if( isSupportBase64 ) {
                        img = $('<img src="'+src+'">');
                        $wrap.empty().append( img );
                    } else {
                        $.ajax('lib/webuploader/0.1.5/server/preview.php', {
                            method: 'POST',
                            data: src,
                            dataType:'json'
                        }).done(function( response ) {
                            if (response.result) {
                                img = $('<img src="'+response.result+'">');
                                $wrap.empty().append( img );
                            } else {
                                $wrap.text("预览出错");
                            }
                        });
                    }
                }, thumbnailWidth, thumbnailHeight );

                percentages[ file.id ] = [ file.size, 0 ];
                file.rotation = 0;
            }

            file.on('statuschange', function( cur, prev ) {
                if ( prev === 'progress' ) {
                    $prgress.hide().width(0);
                } else if ( prev === 'queued' ) {
                    $li.off( 'mouseenter mouseleave' );
                    $btns.remove();
                }

                // 成功
                if ( cur === 'error' || cur === 'invalid' ) {
                    console.log( file.statusText );
                    showError( file.statusText );
                    percentages[ file.id ][ 1 ] = 1;
                } else if ( cur === 'interrupt' ) {
                    showError( 'interrupt' );
                } else if ( cur === 'queued' ) {
                    percentages[ file.id ][ 1 ] = 0;
                } else if ( cur === 'progress' ) {
                    $info.remove();
                    $prgress.css('display', 'block');
                } else if ( cur === 'complete' ) {
                    $li.append( '<span class="success"></span>' );
                }

                $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
            });

            $li.on( 'mouseenter', function() {
                $btns.stop().animate({height: 30});
            });

            $li.on( 'mouseleave', function() {
                $btns.stop().animate({height: 0});
            });

            $btns.on( 'click', 'span', function() {
                var index = $(this).index(),
                    deg;

                switch ( index ) {
                    case 0:
                        uploader.removeFile( file );
                        return;

                    case 1:
                        file.rotation += 90;
                        break;

                    case 2:
                        file.rotation -= 90;
                        break;
                }

                if ( supportTransition ) {
                    deg = 'rotate(' + file.rotation + 'deg)';
                    $wrap.css({
                        '-webkit-transform': deg,
                        '-mos-transform': deg,
                        '-o-transform': deg,
                        'transform': deg
                    });
                } else {
                    $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                    // use jquery animate to rotation
                    // $({
                    //     rotation: rotation
                    // }).animate({
                    //     rotation: file.rotation
                    // }, {
                    //     easing: 'linear',
                    //     step: function( now ) {
                    //         now = now * Math.PI / 180;

                    //         var cos = Math.cos( now ),
                    //             sin = Math.sin( now );

                    //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                    //     }
                    // });
                }


            });

            $li.appendTo( $queue );
        }

        // 负责view的销毁
        function removeFile( file ) {
            var $li = $('#'+file.id);

            delete percentages[ file.id ];
            updateTotalProgress();
            $li.off().find('.file-panel').off().end().remove();
        }

        function updateTotalProgress() {
            var loaded = 0,
                total = 0,
                spans = $progress.children(),
                percent;

            $.each( percentages, function( k, v ) {
                total += v[ 0 ];
                loaded += v[ 0 ] * v[ 1 ];
            } );

            percent = total ? loaded / total : 0;


            spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
            spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
            updateStatus();
        }

        function updateStatus() {
            var text = '', stats;

            if ( state === 'ready' ) {
                text = '选中' + fileCount + '张图片，共' +
                        WebUploader.formatSize( fileSize ) + '。';
            } else if ( state === 'confirm' ) {
                stats = uploader.getStats();
                if ( stats.uploadFailNum ) {
                    text = '已成功上传' + stats.successNum+ '张照片至XX相册，'+
                        stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                }

            } else {
                stats = uploader.getStats();
                text = '共' + fileCount + '张（' +
                        WebUploader.formatSize( fileSize )  +
                        '），已上传' + stats.successNum + '张';

                if ( stats.uploadFailNum ) {
                    text += '，失败' + stats.uploadFailNum + '张';
                }
            }

            $info.html( text );
        }

        function setState( val ) {
            var file, stats;

            if ( val === state ) {
                return;
            }

            $upload.removeClass( 'state-' + state );
            $upload.addClass( 'state-' + val );
            state = val;

            switch ( state ) {
                case 'pedding':
                    $placeHolder.removeClass( 'element-invisible' );
                    $queue.hide();
                    $statusBar.addClass( 'element-invisible' );
                    uploader.refresh();
                    break;

                case 'ready':
                    $placeHolder.addClass( 'element-invisible' );
                    $( '#filePicker2' ).removeClass( 'element-invisible');
                    $queue.show();
                    $statusBar.removeClass('element-invisible');
                    uploader.refresh();
                    break;

                case 'uploading':
                    $( '#filePicker2' ).addClass( 'element-invisible' );
                    $progress.show();
                    $upload.text( '暂停上传' );
                    break;

                case 'paused':
                    $progress.show();
                    $upload.text( '继续上传' );
                    break;

                case 'confirm':
                    $progress.hide();
                    $( '#filePicker2' ).removeClass( 'element-invisible' );
                    $upload.text( '开始上传' );

                    stats = uploader.getStats();
                    if ( stats.successNum && !stats.uploadFailNum ) {
                        setState( 'finish' );
                        return;
                    }
                    break;
                case 'finish':
                    stats = uploader.getStats();
                    if ( stats.successNum ) {
                        alert( '上传成功' );
                    } else {
                        // 没有成功的图片，重设
                        state = 'done';
                        location.reload();
                    }
                    break;
            }

            updateStatus();
        }

        uploader.onUploadProgress = function( file, percentage ) {
            var $li = $('#'+file.id),
                $percent = $li.find('.progress span');

            $percent.css( 'width', percentage * 100 + '%' );
            percentages[ file.id ][ 1 ] = percentage;
            updateTotalProgress();
        };

        uploader.onFileQueued = function( file ) {
            fileCount++;
            fileSize += file.size;

            if ( fileCount === 1 ) {
                $placeHolder.addClass( 'element-invisible' );
                $statusBar.show();
            }

            addFile( file );
            setState( 'ready' );
            updateTotalProgress();
        };

        uploader.onFileDequeued = function( file ) {
            fileCount--;
            fileSize -= file.size;

            if ( !fileCount ) {
                setState( 'pedding' );
            }

            removeFile( file );
            updateTotalProgress();

        };

        uploader.on( 'all', function( type ) {
            var stats;
            switch( type ) {
                case 'uploadFinished':
                    setState( 'confirm' );
                    break;

                case 'startUpload':
                    setState( 'uploading' );
                    break;

                case 'stopUpload':
                    setState( 'paused' );
                    break;

            }
        });

        uploader.onError = function( code ) {
            alert( 'Eroor: ' + code );
        };

        $upload.on('click', function() {
            if ( $(this).hasClass( 'disabled' ) ) {
                return false;
            }

            if ( state === 'ready' ) {
                uploader.upload();
            } else if ( state === 'paused' ) {
                uploader.upload();
            } else if ( state === 'uploading' ) {
                uploader.stop();
            }
        });

        $info.on( 'click', '.retry', function() {
            uploader.retry();
        } );

        $info.on( 'click', '.ignore', function() {
            alert( 'todo' );
        } );

        $upload.addClass( 'state-' + state );
        updateTotalProgress();
    });

})( jQuery );

$(function(){
	//var ue = UE.getEditor('editor');
});
</script>
</body>
</html>