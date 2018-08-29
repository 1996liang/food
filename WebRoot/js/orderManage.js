$(document).ready(function(){
	totalToFixed();
})
function totalToFixed(){
	var total = $('.item-amount[text!=""]').text();
//	total = total.replace(/\s|\xA0/g,"");    
	console.log(total);
}