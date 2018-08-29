$(document).ready(function(){
//	getOneClassifyList();
//	getTwoClassifyList();
//	getThreeClassifyList();
	mouseOverElement();
})
//获取一级分类
function getOneClassifyList(){
	var url = "shopClassify_getOneClassifyList";
	var data = {};
	var returnData = ajaxSend(url,data);
	insertText(returnData,".ml-22")
}
//获取二级分类
function getTwoClassifyList(){
	var url = "shopClassify_getTwoClassifyList";
	var data = {};
	var returnData = ajaxSend(url,data);
	
}
//获取三级分类
function getThreeClassifyList(){
	console.log("1111");
	var url = "shopClassify_getThreeClassifyList";
	var data = {};
	var returnData = ajaxSend(url,data);
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
			console.log(msg);
			returnMsg = msg;
		}
	});
	return returnMsg;
}
function insertText(data,elementName){
	for(var key=0;key<data.length;key++){
		var value = $(elementName+":eq("+key+")").text(data[key].name);
	}
}
function mouseOverElement(){
	$('.category-info').mouseover(function(){
		var name = $(this + ' h3 a').text();
		console.log(name);
	})
}