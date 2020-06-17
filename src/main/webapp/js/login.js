var	form,username,password;
function checkFormData(obj){
	form = $(obj) || $('#loginForm'),
	username = $('#username', form),
	password = $('#password', form);

	if (check(username) && check(password)){
		$.ajax({
			type: "post",
			url: form.attr('action'),
			data:form.serialize(),
			dataType:"jsonp",
			jsonpCallback:'login',
			success: function(data, textStatus){
				//alert(123);
			}
		});
	}
	return false;
}
var timer;
function login(json){
	if(json.msgtype=='error'){
		$('#login_error', form).html(json.content);
	}else if(json.msgtype=='succeed'){
		window.location.href = json.location;
	}else if(json.msgtype=='warning')
        {
            $('#login_error', form).html(json.content);
        }
}
var check = function (input) {
	if (input.val() === ''||input.val() == input.attr('title')) {
		inputError(input);
		input.focus();
		return false;
	} else {
		return true;
	};
};
// 输入错误提示
var inputError = function (input) {
	clearTimeout(inputError.timer);
	var num = 0;
	var fn = function () {
		inputError.timer = setTimeout(function () {
			input.toggleClass('login-form-error');
			if (num === 5) {
				input.removeClass('login-form-error');
			} else {
				fn(num ++);
			};
		}, 150);
	};
	fn();
};


function normalFormAction(){
	$('#loginForm').attr('action','');
}

function initidInputWidth(){
	$('#idInput').width(237-$('#university').outerWidth(true));
}
function checkLogin(form){
	if(form.username.value==''){
		alert('请填写账号名');
		form.username.focus();
		return false;
	}
	if(form.password.value==''){
		alert('请填写密码');
		form.password.focus();
		return false;
	}
	return true;
}
