$(document).ready(function(){
	var count = $('.count').text();
	count= count.substr(1,count.length-2);
	var goodCount = $('.goodCount').text();
	goodCount= goodCount.substr(1,goodCount.length-2);
	var rate = ((goodCount/count)*100).toFixed(1);
	console.log(rate);
	$('.rate strong').html(rate+"<span>%</span>");
	
	 $('#LikBasket').bind("click", function(event){
		 event.preventDefault();
	 })
})
function addCart(event){
	//获取数量
	var quantity = $('#text_box').val();
	//获取原本Href属性，并添加上去
	var href = $('#LikBasket').attr("href");
	href +=("&quantity="+quantity);
	//获取选中的商品选项的文本ID值
	var t = $('.theme-options .selected i').text();
	var s = "";
	//组合成一个以，为分隔的字符串
	$('.theme-options .selected i').each(function(index,key) {
		s+=$(this).text();
	})
//	for(var i=0;i<t.length;i++){
//		if(i==t.length-1){
//			s+=(t[i]);
//		}else{
//			s+=(t[i]+",");
//		}
//	}
	console.log(s);
	//添加上去
	//href +=("&goodsOptions="+s);
	//重新设置href属性
	//$('#LikBasket').attr("href",href);
	
	return false;
}