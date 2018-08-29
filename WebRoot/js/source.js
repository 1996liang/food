/**
 * 
 */

//浏览器开启启动
$(document).ready(function(){
	checkError();
	checkReFormValue();
	checkRadio();
//	checkPhoneForm();
})
//检查用户第一次提交是否符合要求，当提交表单时触发,如果有红色显示，为true，那么不提交
function checkForm(form){
	var userResule = redShow(isEmply("user"),"user","用户名不能为空");
	var emailResule = redShow(isEmply("email"),"email","邮箱不能为空");
	var passwordResule = redShow(isEmply("password"),"password","密码不能为空");
	var passwordRepeatResule = redShow(isEmply("passwordRepeat"),"passwordRepeat","确认密码不能为空");
	if(userResule==true||emailResule==true||passwordResule==true||passwordRepeatResule==true){
		return false;
	}
	if($(".am-active #reader-me").prop("checked")==false){
		$(".am-active #reader-me-label").css({'color':'red'});
		console.log("22222222");
		return false;
	}
}
//检测是否为空
function isEmply(field){
	var value = $("#"+field).val();
	value = $.trim(value);
	if(value==null||value==""){
		return true;
	}else{
		return false;
	}
}
//根据boolean类型是否红色显示，如果为true，表示为空，红色显示，返回true，反之亦然
function redShow(isEmply,idName,value){
	if(isEmply==true){
		$("#"+idName).css({'border-color':'red'});
		$("#"+idName).attr('placeholder',value);
		return true;
	}
	return false;
}
//当单选按钮被选中时触发，检查是否为选中，如果选中，去除红色
function checkRadio(){
	$("#reader-me").click(function(){
		if($(".am-active #reader-me").prop("checked")==true){
			$(".am-active #reader-me-label").css({'color':''});
		}
	})
	$(".reader-me1").click(function(){
		console.log("666");
		if($(".am-active .reader-me1").prop("checked")==true){
			console.log("777");
			$(".am-active #reader-me-label").css({'color':''});
		}
	})
}
//检查表单中的值，在经过错误提示后是否有重新输入，如果有，红边框去色
function checkReFormValue(){
	checkKeydown("user");
	checkKeydown("email");
	checkKeydown("password");
	checkKeydown("passwordRepeat");
	checkKeydown("phone");
	checkKeydown("code");
}
//检查是否按下键盘按钮
function checkKeydown(name){
	$("#"+name).keydown(function(){
		$(this).css({'border-color':''});
	})
}
//检查服务器是否有传来错误信息，如果有，红色提示
function checkError(){
	var usernameError  = $(".emailForm .usernameError").text();
	var emailError = $(".emailForm .emailError").text();
	var passwordError = $(".emailForm .passwordError").text();
	var rePasswordError = $(".emailForm .rePasswordError").text();
	var passwordDiffer = $(".emailForm .passwordDiffer").text();
		f1("user","emailForm","usernameError",usernameError.toString());
		f1("email","emailForm","emailError",emailError.toString());
		f1("password","emailForm","passwordError",passwordError.toString());
		f1("passwordRepeat","emailForm","rePasswordError",rePasswordError.toString());
		f1("passwordRepeat","emailForm","passwordDiffer",passwordDiffer.toString());
		f1("password","emailForm","passwordDiffer",passwordDiffer.toString());
}
//进行分割字符串还有红色提示
function f1(idName,formName,className,value){
	value = $.trim(value);
	if(value!=null&&value!=""){
		value = value.split("                        ")[0];
		$("#"+idName).css({'border-color':'red'});
		$("#"+idName).attr('placeholder',value);
//		$("#"+idName).each(function() {
//			  $(this).stop()
//			   .animate({ left: "-10px" }, 100).animate({ left: "10px" }, 100)
//			   .animate({ left: "-10px" }, 100).animate({ left: "10px" }, 100)
//			   .animate({ left: "0px" }, 100)
//			  });
		$("."+formName+" ."+className).remove();
	}
}
//检查用户第一次提交是否符合要求，当提交表单时触发,如果有红色显示，为true，那么不提交
function checkPhoneForm(form){
	var userResule = redShow(isEmply("phone"),"phone","手机号码不能为空");
	var emailResule = redShow(isEmply("code"),"code","验证码不能为空");
	var passwordResule = redShow(isEmply("password1"),"password1","密码不能为空");
	var passwordRepeatResule = redShow(isEmply("passwordRepeat1"),"passwordRepeat1","确认密码不能为空");
	console.log($("#phone").val());
	console.log($("#code").val());
	console.log($("#password1").val());
	console.log($("#passwordRepeat1").val());
	if(userResule==true||emailResule==true||passwordResule==true||passwordRepeatResule==true){
		return false;
	}
	if($(".am-phone .reader-me1").prop("checked")==false){
		$(".am-phone #reader-me-label").css({'color':'red'});
		return false;
	}
}
/*以下是发送信息验证码中的细节，包括ajax发送到服务器，按钮的变化*/
var second = 5;
var timeout = false; //启动及关闭按钮   
var code ;
////发送短信验证码，通过Ajax传手机号码到服务器，在拿到服务器返回的短信验证码
function sendMobileCode(){
	if(isEmply("phone")){
		redShow(true,"phone","手机号码不能为空");
		return;
	}
	$("#sendMobileCode").attr("onclick"," ");
	timeout = false;
	var phone = $('#phone').val();
	var data = {'user.phone':phone};
	code = ajaxSend("user_sendCode",data);
	time();
}
//定时器，调用自身，递归
function time(){
	if(timeout) return;  
	secondMethod();  
	setTimeout(time,1000); //time是指本身,延时递归调用自己,100为间隔调用时间,单位毫秒  
}
//根据定时器时间变化，修改相应的秒数和样式
function secondMethod(){
	console.log(timeout);
	if(second<=0){
		$("#sendMobileCode").attr("onclick","sendMobileCode()");
		 $("#dyMobileButton").text("获取");
		timeout=true;
		second=5;
		return;
	}
	second -= 1;
	 $("#dyMobileButton").text(second+"s");
}
//ajax发送
function ajaxSend(url,data){
	var returnMsg ;
	$.ajax({
		url:url,
		data:data,
		dataType:"text",
		type:"post",
		success:function(msg){
			console.log(url);
			console.log(data);
			console.log(msg);
			returnMsg = msg;
		}
	})
	return returnMsg;
}

