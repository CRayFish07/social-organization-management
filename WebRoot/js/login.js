$(function(){
	$("#btnSubmit").click(function(event) {
		/* Act on the event */
		var data = {
			username: $("#username").val(),
			password: $("#password").val()
		};
		var strdata = JSON.stringify(data);
		$.post('checkLogin', {myjson: strdata}, function(res, textStatus, xhr) {
			/*optional stuff to do after success */
			//console.log(res);
			if(res.admin.isTrue){
				window.location.href = "crud.jsp";
			}else if(!res.admin.isTrue){
				$("#warnMsg").text("账号或密码错误，请确认后重新提交");
			}else{
				$("#warnMsg").text("登录失败，未知异常");
			}
		});
	});
})