var xmldom = null;
$(document).ready(function(){
	sum();
	total();
	show_province();
	
	$('.btn-go').on('click',function(event){
		event.preventDefault();
	})
})
//生成订单
function createOrder(){
	//获取用户ID，订单联系方式ID，对店家说得话
	//将所有商品ID,数量,商品选项放进一个对象，然后封装成一个数组
	var userId = $('.user').attr('userId');
	var orderContactId = $('.pay-address').attr('orderContactId');
	var words = $('.memo-input').val();
	//订单商品长度
	var carItemLength = $('.item-content').attr('carItemLength');
	var orderItems ="";
	for(var i=0;i<carItemLength;i++){
		var orderItem ={};
		//商品对象
		var goods={};
		goods.id = parseInt($('.clearfix'+i+' .item-pic').attr('goodsId'));
		orderItem['goods']=goods; 
		
		orderItem['quantity']= parseInt($('.clearfix'+i+' .text_box').val());
		//当前商品的有多少个选项
		var nowOptionsLength = $('.clearfix'+i+' .item-props').attr('nowOptionsLength');
		var goodsOptions = new Array();
		
		for(var j=0;j<nowOptionsLength;j++){
			var s = {};
			s.id = parseInt($('.clearfix'+i+' .sku-line'+j).attr('optionsId'));
			goodsOptions[j]=s;
//			orderItem['goodsOptions['+j+'].id'] = 
//				parseInt($('.clearfix'+i+' .sku-line'+j).attr('optionsId'));
		}
		orderItem['goodsOptions'] = goodsOptions;
		orderItems+=JSON.stringify(orderItem)+"/";
	}
	var data={'order.user.id':userId,'order.orderContact.id':orderContactId,'order.words':words,'orderItems':orderItems};
	var url="pay_createOrder";
	var result = ajaxSend(url, data);
	console.log(result);
	if(result =="createSuccess"){
		$('.btn-go').attr('href','pay_redirectSuccessPage');
		$('.btn-go').unbind('click');
	}
}

//选择地址
function clickAddress(itemId){
	var consigneeName = $('li[itemId='+itemId+'] .buy-user').text();
	var phone = $('li[itemId='+itemId+'] .buy-phone').text();
	$('li[itemId='+itemId+'] .section').each(function(key,value) {
		var address = $(this).text();
		$('.pay-address .section'+key).text(address);
	})
	for(var i=0;i<4;i++){
		var address = $('li[itemId='+itemId+'] .section'+i).text();
	}
	console.log(itemId + consigneeName + phone);
	$('.pay-address').attr('orderContactId',itemId);
	$('.pay-address .buy-footer-address .buy-user').text(consigneeName);
	$('.pay-address .buy-footer-address .buy-phone').text(phone);
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
	var data = {"user.id":d["user.id"],"orderContact.consigneeName":d["orderContact.consigneeName"],
				"orderContact.phone":d["orderContact.phone"],"orderContact.address":d["orderContact.address"]};
	ajaxSend(url,data);
	$('.theme-popover').slideUp(500,function(){
		$('.theme-popover-mask').css("display","none");
		$('body').css("overflow","visible");
		window.location.reload();
	});
}

//当输入框的值手动输入发生变化是
function change(carItemId,index){
	var quantity = $('.clearfix'+index+' .text_box').val();
	quantity = parseInt(quantity);
	if(quantity>=1){
		resum(index,quantity);
		total();
	}else{
		$('.clearfix'+index+' .text_box').val('1');
	}
}
//加
function add(carItemId,index){
	var quantity = $('.clearfix'+index+' .text_box').val();
	quantity=parseInt(quantity);
	if(quantity>=1){
		quantity = quantity+1;
		resum(index,quantity);
		total();
	}
}
//减
function sub(carItemId,index){
	var quantity = $('.clearfix'+index+' .text_box').val();
	quantity=parseInt(quantity)-1;
	if(quantity>=1){
		resum(index,quantity);
		total()
	}else{
		$('.clearfix'+index+' .text_box').val('1');
	}
}
//进行加减后重新计算金额
function resum(index,quantity){
	var quantity = parseFloat(quantity);
	var price = parseFloat($('.clearfix'+index+' #price').text());
	var sum = quantity*price;
	sum = sum.toFixed(2);
	$('.clearfix'+index+' .number').text(sum);
}
//计算每个购物车项的金额（最新价格乘以数量）
function sum(){
	//两个数组长度相等
	var length = $('.item-content').attr('carItemLength');
	for(var i=0;i<length;i++){
		var quantity = parseFloat($('.clearfix'+i+' .text_box').attr('value'));
		var price = parseFloat($('.clearfix'+i+' #price').text());
		var sum = quantity*price;
		sum = sum.toFixed(2);
		$('.clearfix'+i+' .number').text(sum);
	}
}
//总金额
function total(){
		//计算总件数和总金额
		var length = $('.item-content').attr('carItemLength');
		var total = 0;
		for(var i=0;i<length;i++){
			var quantity = parseInt($('.clearfix'+i+' .text_box').attr('value'));
			var sum = parseFloat($('.clearfix'+i+' .number').text());
			total+=sum;
		}
		total = total.toFixed(2);
		$('.pay-sum').text(total);
		$('#J_ActualFee').text(total);
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