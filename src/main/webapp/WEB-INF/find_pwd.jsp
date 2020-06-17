<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>忘记密码-不同商品满意度比较分析系统</title>
    <style>
        * { margin: 0; padding: 0; }
        html { height: 100%; }
        body { height: 100%; background: #fff url(../images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
        .dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 600px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
        .logo { width: 104px; height: 104px; margin: 50px auto 80px; background: url(../images/login.png) 0 0 no-repeat; }
        .form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 30px;}
        .form-item input { width: 288px; height: 48px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        .form-item button { width: 360px; height: 50px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
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
        .reg-bar { width: 360px; margin: 20px auto 0; font-size: 14px; overflow: hidden;}
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
           <span class="err">${tip}</span>
    <div class="dowebok">
        <div class="logo"></div>
        

        <form id="form"  method="get" onsubmit="return check()">
           <div class="form-item">
          
           <div class="css-group">
                <input placeholder="请输入帐号（用户名）" name="username" id="id" type="text" onblur="check()">
            </div>
            <br />
            
            
        </div>
        <div class="form-item">
           
            
            <div class="css-group">
                <input placeholder="请输入手机号" name="phonenumber" id="pwd" type="text" onblur="check()">
            </div>
        </div>



            <div class="form-item"><button id="submit" onclick="check()">找回密码</button></div>

        
           <br />
        
        <br />

        </form>
        
        
        
        

        
    </div>
	<script src="../js/index/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../" type="text/javascript" charset="utf-8"></script>
<script src="../js/remmber_login.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function () {
            $('input').val('')
            $('#submit').on('click', function () {
                $('.tip').show()
            })
        })
         ($.idcode.setCode());
    
    
    
    function check(){
        var sno = $("#id").val();
        var psw = $("#pwd").val();
        var IsBy = $.idcode.validateCode();
        
        var form=$("form");
//      if(!IsBy){
//          alert("验证码错误！");
//          return false;
//      }
		if(sno1=="" || psw1==""){
  				  alert("账号或手机号不能为空！");
            return false;
  				}
    	

        
        return true;
    }
    
    

    </script>
    

<div style="text-align:center;">

</div>

</body>
</html>