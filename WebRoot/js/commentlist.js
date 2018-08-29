var contentArray = new Array();
var starArray = new Array();
var ids = new Array();
$(document).ready(function(){
	var content = $('.content').val("");
})
function submit(){
	var listLength = $('.comment-main').attr("length");
	getField(listLength);
	if(contentArray.length!=listLength||starArray.length!=listLength||ids.length!=listLength){
		alert("请把评论评完整");
	}else{
		var evaluateArray = "";
		var idStr = "";
		for(var i=0;i<listLength;i++){
			idStr+=ids[i]+"/";
			evaluateArray+= JSON.stringify({"content":contentArray[i],"star":starArray[i]})+"/";
		}
		var evaluates = {"evaluates":evaluateArray,"orderItems":idStr};
		var url = "evaluate_evaluateGoods";
		var data = evaluates;
		var result = ajaxSend(url, data);
		if(result=="success"){
			$(".a-submit").attr("href","evaluate_redirectSuccess");
		}
	}
}
function getField(listLength){
	for(var i=0;i<listLength;i++){
		var content = $($('.content').get(i)).val();
		var star = $($('.item-opinion .active').get(i)).attr('star');
		var id = $($('.comment-list').get(i)).attr('orderItemId');
		contentArray[i] = content;
		starArray[i] = star;
		ids[i] = parseInt(id);
	}
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