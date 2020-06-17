<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bysjy" uri="http://www.bysjy.com/common/"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>用户注册-不同商品满意度比较分析系统</title>
    <style>
        * { margin: 0; padding: 0; }
        html { height: 100%; }
        body { height: 100%; background: #fff url(../images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
        .dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 600px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
        .logo { width: 104px; height: 100px; margin: 40px auto 80px; background: url(../images/login.png) 0 0 no-repeat; }
        .form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 10px;}
        .form-item input { width: 288px; height: 20px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        .form-item button { width: 360px; height: 40px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
        .form-item select {
        	background-color: transparent;
			-webkit-appearance: initial;
			width: 360px; height: 48px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; 
			font-size: 18px; color: #fff; 
			outline: none;
        }
        #username { background: url(images/emil.png) 20px 14px no-repeat; }
        #password { background: url(images/password.png) 23px 11px no-repeat; }
        .tip { display: none; position: absolute; left: 20px; top: 52px; font-size: 14px; color: #f50; }
        .reg-bar { width: 360px; margin: 5px auto 0; font-size: 14px; overflow: hidden;}
        .reg-bar a { color: #fff; text-decoration: none; }
        .reg-bar a:hover { text-decoration: underline; }
        .reg-bar .reg { float: left; }
        .reg-bar .forget { float: right; }
        .dowebok ::-webkit-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok ::-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-ms-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}

        @media screen and (max-width: 500px) {
            * { box-sizing: border-box; }
            .dowebok { position: static; width: auto; height: auto; margin: 0 30px; border: 0; border-radius: 0; }
            .logo { margin: 50px auto; }
            .form-item { width: auto; }
            .form-item input, .form-item button, .reg-bar { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="dowebok">
        <div class="logo"></div>
        
        <!--11111-->
        <form action="register" method="get" onsubmit="return checkSub()">
										<div class="css-input-group">
											<div class="form-item">
												
												<div class="css-group">
													<input placeholder="请输入账号" name="username" id="s_id" type="text" >
												</div>
											</div>
											<span id="span_uName"></span>
											
											<br />
											<div class="form-item">
												
												<div class="css-group">
													<input placeholder="密码：6-8位，首位为字母" name="password" id="spwd" type="password" onblur="checkPwd(),clearInfo()">
												</div>
											</div>
											<span id="span_Pwd" onblur="clearInfo()"></span>,
											<br />
											<div class="form-item">
												
												<div class="css-group">
													<input placeholder="请确认密码"  id="spwd_Angin" type="password" onblur="checkPwd2() ">
												</div>
											</div>
											<span id="span_PwdAngin" onblur="clearInfo()"></span>
											
											<br />
											<div class="form-item">
												
												<div class="css-group">
													<input placeholder="18-55岁" name="age" id="s_age" type="text" onblur="checkAge()">
												</div>
											</div>
											<span id="span_Age" onblur="clearInfo()"></span>
											<br />
											<div class="form-item">
												<div class="css-group">
													<input placeholder="手机号" type="text" name="phonenumber" id="phone" onblur="checkphone()"></td>

												</div>　　　　

												　　
											</div>
											<span id="span_phone" onblur="clearInfo()"></span>

											<div class="form-item">
												<div class="css-group">
													<input placeholder="邮箱" type="text" name="email" id="email" onblur="checkmail())"></td>

												</div>　　　　											

											</div>
											<span id="span_email" onblur="clearInfo()"></span>




										</div>



			                             <div class="form-item"><button id="submit" >注 冊</button></div>
											</form>
											

												
												

											
        
      
	<script src="../js/index/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="../" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">

  
		//验证密码


				function checkPwd(){
					//获取span对象
						var span=document.getElementById("span_Pwd");
					//获取用户获得用户名信息
						var upwd=document.getElementById("spwd").value;
					//创建校验规则,密码要求6-8位，首位为字母，后面5-7位是数字
						var reg=/^[a-z]\w{5,7}$/;
					
					//开始交验
						if(upwd==""||upwd==null){
							//输入校验结果
							span.innerHTML="*密码不能为空";
							span.style.color="red";
							return false;
						}else if(reg.test(upwd)){
							//输入校验结果
							span.innerHTML="*密码通过";
							span.style.color="green";
							return true;
						}else{
							//输入校验结果
							span.innerHTML="*密码格式不符"
							span.style.color="red";
							return false;
						}
		//第一次密码为a123456，第二次密码为a1234567，则修改的第一次密码，确认密码也会重新校验	
					checkPwd2();
				}
				//校验确认密码
				function checkPwd2(){
						//获取第一次校验密码
							var pwd=document.getElementById("spwd").value;
						//获取确认密码
							var pwd2=document.getElementById("spwd_Angin").value;
						//获取span对象
							var span=document.getElementById("span_PwdAngin");
						//比较前两次密码是否相同
							if( pwd2==""|| pwd2==null){
							//输入校验结果
							span.innerHTML="*密码不能为空";
							span.style.color="red";
							return false;
						}else if(pwd===pwd2){
							//输入校验结果
							span.innerHTML="*密码通过";
							span.style.color="green";
							return true;
						}else{
							//输入校验结果
							span.innerHTML="*密码不同，请重新输入";
							span.style.color="red";
							return false;
						}
					}
					
				//校验邮箱
				function checkmail(){
						return checkField("email",/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)
					}
					
					
				//校验年龄
				function checkAge(){
						var age =  document.getElementById("s_age").value;
						var span=document.getElementById("span_Age");
						if(age>55||age<18){
							span.innerHTML = "请输入正确年龄";
							span.style.color="red";
							return false;
						}else{
							span.innerHTML = "*通过";
							span.style.color="green";
							return true;
						}
					}
					
					
					
				//封装校验：相同的保留，不同的传参
				function checkField(id,reg){
						//获取用户数据
							var inp=document.getElementById(id);
							var	va=inp.value;
							var	alt=inp.alt;
						//创建校验规则
						//获取span对象
							var span=document.getElementById("span_email");
						//开始校验
							if(va==""||va==null){
							//输入校验结果
								span.innerHTML="*"+alt+"不能为空";
								span.style.color="red";
								return false;
							}else if(reg.test(va)){
							//输入校验结果
								span.innerHTML="*"+alt+"通过";
								span.style.color="green";
								return true;
							}else{
							//输入校验结果
								span.innerHTML="*"+alt+"格式不符";
								span.style.color="red";
								return false;
						}
					}

					function checkphone() {
						var phone = document.getElementById("phone").value();
						var span_phone = document.getElementById("span_phone");

						if (phone<0||phone>20000000000){
							span.innerHTML="*"+alt+"格式不符";
							span.style.color="red";
							return false;
						}else if (phone==""||phone==null){
							span.innerHTML="*"+alt+"不能为空";
							span.style.color="red";
							return  false;
						}else{
							span.innerHTML="*"+alt+"通过";
							span.style.color="green";
							return true;
						}

					}
				//提交判断
				function checkSub(){
							checkPwd();
							checkPwd2();
							checkmail();
							checkAge();
							checkphone();
							return checkPwd()&&checkPwd2()&&checkmail()&&checkAge()&&checkphone();
						}

						//清除信息
		function clearInfo(id) {
			document.getElementById(id).innerText = "";
		}

	
	</script>
<div style="text-align:center;">

</div>

</body>
</html>