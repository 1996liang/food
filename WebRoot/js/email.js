$(document).ready(function(){
	$("#user-code").val("");
	$('#user-email').val("");
})

/*以下是发送信息验证码中的细节，包括ajax发送到服务器，按钮的变化*/
var second = 5;
var timeout = false; //启动及关闭按钮   
var code ;
function submit(){
	var inputCode = $("#user-code").val();
	if(inputCode==null){
		alert("验证码不能为空");
		return false;
	}else{
		if(inputCode==String(code)){
			console.log("success");
			$('.am-form').submit();
		}else{
			alert("验证码错误");
			return false;
		}
	}
}
////发送短信验证码，通过Ajax传手机号码到服务器，在拿到服务器返回的短信验证码
function sendMobileCode(){
	if(isEmply("user-email")){
		alert('邮箱不能为空')
		return;
	}
	$("#sendMobileCode").attr("onclick"," ");
	timeout = false;
	var email = $('#user-email').val();
	var data = {'user.email':email};
	code = ajaxSend("safeSetUp_sendEmailCode",data);
	console.log(code);
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
	if(second<=0){
		$("#sendMobileCode").attr("onclick","sendMobileCode()");
		 $("#sendMobileCode .am-btn-danger").text("验证码");
		timeout=true;
		second=5;
		return;
	}
	second -= 1;
	 $("#sendMobileCode .am-btn-danger").text(second+"s");
}
//ajax发送
function ajaxSend(url,data){
	var returnMsg ;
	$.ajax({
		url:url,
		data:data,
		dataType:"text",
		type:"post",
		async:false,
		success:function(msg){
			returnMsg = msg;
		}
	})
	return returnMsg;
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