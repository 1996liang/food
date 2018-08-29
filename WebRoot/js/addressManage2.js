var xmldom = null;
var orderContactId = null;
$(document).ready(function(){
	show_province();
	$('.new-addr-btn a').on('click',function(event){
		event.preventDefault();
	})
})
//选择地址
//function clickAddress(itemId){
//	var consigneeName = $('li[itemId='+itemId+'] .buy-user').text();
//	var phone = $('li[itemId='+itemId+'] .buy-phone').text();
//	for(var i=0;i<4;i++){
//		var address = $('li[itemId='+itemId+'] .section'+i).text();
//	}
//}
//设定默认的订单联系方式
function setDefault(itemId){
	var addressId = itemId;
	var userId = parseInt($(".user").attr('userId'));
	var url = "addressManage_alterDefault";
	var data = {'orderContact.id':addressId,"user.id":userId};
	console.log(data);
	ajaxSend(url,data);
}
//删除地址
function deleteAddress(obj,itemId){
	console.log(11111111111);
	var addressId = itemId;
	var userId = parseInt($(".user").attr('userId'));
	var url = "addressManage_deleteOrderContact";
	var data = {'orderContact.id':addressId};
	var result = ajaxSend(url,data);
	if(result=="success"){
		$(obj).parent("div").parent("li").remove();
		alert('删除成功');
	}
}
//编辑地址
function alterOrderContact(itemId){
	//修改样式
	$('.am-text-lg1').text("编辑地址");
	$('.am-cf1 small').html("alter&nbsp;address");
	//获取数据
	var consigneeName = $('.user-addresslist[itemId='+itemId+'] .new-txt').text();
	var phone = $('.user-addresslist[itemId='+itemId+'] .new-txt-rd2').text();
	var address = new Array();
	for(var i=0;i<4;i++){
		address[i] =$('.user-addresslist[itemId='+itemId+'] .section'+i).text();
	}
	//ajax从服务器获取地址名相对应的ID
	var dataProvince = $(xmldom).find('province[province='+address[0]+']').attr("provinceID");
	var dataCity = $(xmldom).find('City[City='+address[1]+']').attr("CityID");
	var dataDist = $(xmldom).find('Piecearea[Piecearea='+address[2]+']').attr("PieceareaID");
	//注入数据
	$('#user-name').val(consigneeName);
	$('#user-phone').val(phone);
	$('#province').find('option[value='+dataProvince+']').attr("selected",true);
	$('#city').find('option[value='+dataCity+']').attr("selected",true);
	$('#dist').find('option[value='+dataDist+']').attr("selected",true);
	$('#user-intro').val(address[3]);
	orderContactId = itemId;
}
//三级级联操作
function show_province(){
	$.get('../xml/ChinaArea.xml',function(msg){
		xmldom = msg;
		$(msg).find('province').each(function(key,value){
			var name = $(this).attr('province');
			var id = $(this).attr('provinceID');
			$('#province').append("<option value='"+id+"'>"+name+"</option>");
		})
	},'xml');
}
function show_city(){
	var provinceID = $('#province option:selected').val();
	var two_pid = provinceID.substr(0,2);
	$('#city').empty();
	$('#dist').empty();
	$('#city').append('<option value="0">--请选择--</option>');
	$('#dist').append('<option value="0">--请选择--</option>');
	//寻找city选择器中，并且cityID的开头等于two_pid的jQuery对象
	$(xmldom).find('City[CityID^='+two_pid+']').each(function(){
		var name = $(this).attr('City');
		var id = $(this).attr('CityID');
		$('#city').append("<option value='"+id+"'>"+name+"</option>");
	})
}
function show_dist(){
	var cityID = $('#city option:selected').val();
	var four_pid = cityID.substr(0,4);
	$('#dist').empty();
	$('#dist').append('<option value="0">--请选择--</option>');
	//寻找city选择器中，并且cityID的开头等于four_pid的jQuery对象
	$(xmldom).find('Piecearea[PieceareaID^='+four_pid+']').each(function(){
		var name = $(this).attr('Piecearea');
		var id = $(this).attr('PieceareaID');
		$('#dist').append("<option value='"+id+"'>"+name+"</option>");
	})
	
}
//提交表单
function submitOrderContact(){
	var d = {};
	var t = $('.am-form').serializeArray();
	var str = "orderContact.address";
	var userId = $('.user').attr('userId');
	d['user.id']=parseInt(userId);
	//name是字段名，value是字段值
	$.each(t,function(name,value){
		switch(this.name){
			//当遇到字段名是省时
			case "orderContact.address.province" :
				var provinceName = $(xmldom).find('province[provinceID='+this.value+']').attr('province');
				d[str]=provinceName+",";
				break;
			//当遇到字段名是市时
			case "orderContact.address.city" :
				var cityName = $(xmldom).find('City[CityID='+this.value+']').attr('City');
				d[str]+=cityName+",";
				break;
			//当遇到字段名是县时
			case "orderContact.address.dist" :
				var distName = $(xmldom).find('Piecearea[PieceareaID='+this.value+']').attr('Piecearea');
				d[str]+=distName+",";
				break;
			//当遇到字段名是街道时
			case "orderContact.address.street" :
				d[str]+=this.value;
				break;
			//当是其他字段时
			default:
				d[this.name] = this.value;
				break;
		}
	})
	var url="orderContact_ajaxAddOrderContact";
	//首先判断下是更新地址还是新增地址
	var node = $('.am-text-lg1').text();
	var data;
	alert(orderContactId);
	if(orderContactId!=null){
		data = {"user.id":d["user.id"],"orderContact.id":orderContactId,"orderContact.consigneeName":d["orderContact.consigneeName"],
				"orderContact.phone":d["orderContact.phone"],"orderContact.address":d["orderContact.address"]};
	}else{
		data = {"user.id":d["user.id"],"orderContact.consigneeName":d["orderContact.consigneeName"],
				"orderContact.phone":d["orderContact.phone"],"orderContact.address":d["orderContact.address"]};
	}
	console.log(data);
	var result = ajaxSend(url,data);
	if(result=="success"){
		$('#user-name').val("");
		$('#user-phone').val("");
		$(".address select").find("option[value='0']").attr("selected",true);
		$('#user-name').val("");
		$('#user-intro').val("");
		//如果是更新，那么顺便改下样式
		if(node=="编辑地址"){
			$('.am-text-lg1').text("新增地址");
			$('.am-cf1 small').html("add&nbsp;address");
			alert('更新成功');
			window.location.reload()
			orderContactId = null;
		}else{
			alert('新增成功');
			window.location.reload();
			orderContactId = null;
		}
		
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
