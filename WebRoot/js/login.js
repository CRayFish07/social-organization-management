$(function(){
	$("#btn").click(function(event) {
		/* Act on the event */
		var data = {
			username: $("#formdiv input[name='username']").val(),
			password: $("#formdiv input[name='password']").val()
		};
		var strdata = JSON.stringify(data);
		$.post('checkLogin', {myjson: strdata}, function(res, textStatus, xhr) {
			/*optional stuff to do after success */
			//console.log(res);
			if(res.admin.isTrue){
				window.location.href = "LoginExample.jsp";
			}else if(!res.admin.isTrue){
				$("#warn h3").text("用户名或密码错误，请重新输入");
			}else{
				$("#warn h3").text("登录失败，未知异常");
			}
		});
	});
})