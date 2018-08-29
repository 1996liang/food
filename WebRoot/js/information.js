var now = new Date();
$(document).ready(function(){
	init();
})
function submit(){
	
	var year = $('.year option:selected').val();
	var month = $('.month option:selected').val();
	var day = $('.day option:selected').val();
	var birth= year+"-"+month+"-"+day;
	$(".formBirth").val(birth);
	$(".am-form").submit();
	//获取表单数据
//	var userId = $('.user').attr('userId');
//	form['user.id']=parseInt(userId);
//	var d = "";
//	$.each(form,function(name,value){
//		if(this.name=="user.birthday.year"){
//			d+=this.value+"-";
//		}
//		if(this.name=="user.birthday.month"){
//			d+=this.value+"-";
//		}
//		if(this.name=="user.birthday.day"){
//			d+=this.value;
//		}
//	});
//	form['user.birthday'] = new Date(d);
//	//ajax提交表单
//	var url="information_alterUserInformation";
//	var data = {"user.id":form["user.id"],"user.birthday":form["user.birthday"],"user.sex":parseInt(form[1].value),"user.nickName":form[0].value};
//	console.log(url);
//	console.log(data);
//	var result = ajaxSend(url,data);
//	console.log(result);
}

function showYear(){
	var year = now.getFullYear(); 
	$('.year').empty();
	for(var i=year;i>=1965;i--){
		$('.year').append("<option value="+i+">"+i+"</option>");
	}
	
}
function showMonth(){
	$('.month').empty();
	for(var i=1;i<=12;i++){
		$('.month').append("<option value="+i+">"+i+"</option>");
	}
}
function showDay(){
	var year = $('.year option:selected').val();
	var month = $('.month option:selected').val();
	var date = new Date(year,month,0);
	var maxDay = date.getDate();
	$('.day').empty();
	for(var i=1;i<=maxDay;i++){
		$('.day').append("<option value="+i+">"+i+"</option>");
	}
	console.log(maxDay);
}
//注入属性
function init(){
	showYear();
	showMonth();
	//注入性别表单 0保密，1男，2女
	var sex = parseInt($('.sex').attr('sex'));
	if(sex!=null||sex!=""){
		for(var i=0;i<=2;i++){
			if(sex==i){
				var s =$('.sx').val([i]);
			}
		}
	}
	//注入生日
	var birth = $('.birth').attr('birthday');
	var date = new Date(Date.parse(birth.replace(/-/g,   "/")));
	$('.year').find("option[value="+date.getFullYear()+"]").attr('selected',true);
	$('.month').find("option[value="+parseInt(date.getMonth()+1)+"]").attr('selected',true);
	//当月份选定的时候，显示对应的最大天数
	showDay();
	$('.day').find("option[value="+date.getDate()+"]").attr('selected',true);
}
function ajaxSend(url,data){
	var returnMsg ;
	$.ajax({
		url:url,
		data:data,
		dataType:"text",
		type:"post",
		async:false,
		success:function(msg){
			console.log('1111111111111');
			console.log(msg);
			returnMsg = msg;
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			 alert(XMLHttpRequest.status);
			 alert(XMLHttpRequest.readyState);
			 alert(textStatus);
		},
	});
	return returnMsg;
}