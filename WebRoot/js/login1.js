function submit(){
	var username = $('#user').val();
	var password = $('#password').val();
	var url = "user_login";
	var data = {'user.username':username,'user.password':password};
	$("#form").submit();
	
}