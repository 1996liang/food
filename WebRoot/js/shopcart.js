$(document).ready(function(){
	sum();
})

function submit(){
	var length = $('.item-content').attr('carItemLength');
	var array = "";
	for(var i=0;i<length;i++){
		var ischeck = $('.clearfix'+i+' .checkItemId').is(":checked");
		if(ischeck==true){
			var value = parseInt($('.clearfix'+i+' .checkItemId').val());
			if(i==length-1){
				array+= value;
			}else{
				array+= value+",";
			}
		}
	}
	if(array.length!=0){
		var href="pay_payPage?carItems="+array;
		var userId = $('.user').attr('userId');
		href+="&user.id="+userId;
		$('.submit-btn').attr('href',href);
	}
}
//当输入框的值手动输入发生变化是
function change(carItemId,index){
	var quantity = $('.clearfix'+index+' .text_box').val();
	quantity = parseInt(quantity);
	if(quantity>=1){
		var url="car_alterCartGoodsQuantity";
		var data = {"carItem.id":carItemId,"quantity":quantity};
		resum(index,quantity);
		var result = ajaxSend(url,data);
		console.log(result);
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
		var url="car_alterCartGoodsQuantity";
		var data = {"carItem.id":carItemId,"quantity":quantity};
		resum(index,quantity);
		ajaxSend(url,data);
	}
}
//减
function sub(carItemId,index){
	var quantity = $('.clearfix'+index+' .text_box').val();
	quantity=parseInt(quantity)-1;
	if(quantity>=1){
		var url="car_alterCartGoodsQuantity";
		var data = {"carItem.id":carItemId,"quantity":quantity};
		resum(index,quantity);
		ajaxSend(url,data);
	}else{
		$('.clearfix'+index+' .text_box').val('1');
	}
}
//单选
function singleCheck(carItemId,index){
	var isChecked = $('.checkItemId[value='+carItemId+']').is(":checked");
	if(isChecked==true){
		var sum = parseFloat($('.clearfix'+index+' .number').text());
		var quantity = parseInt( $('.clearfix'+index+' .text_box').val());
		var oldQuantity = parseInt($('#J_SelectedItemsCount').text());
		var oldSum = parseFloat($('#J_Total').text());
		 $('#J_SelectedItemsCount').text(
				 oldQuantity+quantity
				 );
		 $('#J_Total').text(
				 (oldSum+sum).toFixed(2)
				 );
	}else{
		var sum = parseFloat($('.clearfix'+index+' .number').text());
		var quantity = parseInt( $('.clearfix'+index+' .text_box').val());
		var oldQuantity = parseInt($('#J_SelectedItemsCount').text());
		var oldSum = parseFloat($('#J_Total').text());
		$('#J_SelectedItemsCount').text(
				(oldQuantity-quantity)
				);
		 $('#J_Total').text(
				 (oldSum-sum).toFixed(2)
				 );
	}
}
//全选
function selectAll(){
	var checkBoolean = $('.check-all').is(":checked");   
	if(checkBoolean!=null&&checkBoolean==true){
		//全部单选框选中
		$('.check').attr('checked',true);
		//计算总件数和总金额
		var length = $('.item-content').attr('carItemLength');
		var total = 0;
		var tote = 0;
		for(var i=0;i<length;i++){
			var quantity = parseInt($('.clearfix'+i+' .text_box').attr('value'));
			var sum = parseFloat($('.clearfix'+i+' .number').text());
			total+=sum;
			tote+=quantity;
		}
		total = total.toFixed(2);
		$('#J_SelectedItemsCount').text(tote);
		$('#J_Total').text(total);
		
	}else{
		$('.check').attr('checked',false);
		$('#J_SelectedItemsCount').text(0);
		$('#J_Total').text(0.00);
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
//	var box = $('.text_box'+index).attr('value');
//	var price = $('#price').text();
//	for(var i=0;i<box.length;i++){
//		var sum = parseFloat(box[i])*parseFloat(price[i]);
//		sum = sum.toFixed(2);
//		$('.J_ItemSum:eq('+i+')').text(sum);
//	}
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