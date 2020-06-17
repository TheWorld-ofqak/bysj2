<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bysjy" uri="http://www.bysjy.com/common/"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>不同商品满意度分析系统后台管理</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../js/morris/morris-0.4.3.min.css">
    <link rel="stylesheet" href="../css/custom-styles.css"/>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="../css/graduate-apply.css">
    <style>
        .form-group {
            display: flex;

        }

        .form-group > label {
            flex: 1;
            justify-items: left;
            margin-left: 50px;
        }

        .form-group > span {
            font-weight: 700;
            flex: 2;
            margin-left: -50px;
        }

        .form-group > input {
            flex: 2;
            margin-left: -52px;
            height: 2em;
        }

        .mybutton {
            text-align: center;
        }

        .mybutton > button {
            margin-left: 100px;
            margin-right: 100px;
        }

        footer {
            text-align: center;
        }

        .form-group > textarea {
            flex: 2;
            margin-left: -52px;
        }
        
        
        /*表单样式开始*/
       input{
       	height: 30px;
       	width: 400px;
       	margin-left: 40px;
       	border: 1px sold saddlebrown;
       }
       button{
       	 width: 360px; 
       	 height: 50px; 
       	 border: 1px; 
       	 border-radius: 25px; 
       	 font-size: 14px; 
       	 color: #1f6f4a; 
       	 outline: none; 
       	 cursor: pointer; 
       	 background-color: #fff; 
       }
       
    </style>
</head>
<body>
<div id="wrapper">
    <!--最上边的导航-->
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <!--左边标志-->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">管理端</a>
        </div>
        <!--右边的导航-->

    </nav>
    <!--左边导航栏-->
    <!--左边导航栏-->
    <jsp:include page="aside1.jsp"></jsp:include>

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        我的<small>修改信息</small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                        	
                        	<!--修改密码-->
                        	<div class="layui-tab-item">
		    	<form class="layui-form" action="/admin/fixinfo" method="post" style="width: 90%;padding-top: 20px;">


					<div class="layui-form-item">
						<label class="layui-form-label">管理员编号：</label>
						<div class="layui-input-block">
							<input type="text" id="id1" name="Id"  value="${admin.id}" class=" layui-input layui-disabled" >
						</div>
					</div>

				  <div class="layui-form-item">
				    <label class="layui-form-label">用户名：</label>
				    <div class="layui-input-block">
				      <input type="text" id="id" name="username"  value="${admin.username}" class=" layui-input layui-disabled" >
				    </div>
				  </div>
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">年龄：</label>
				    <div class="layui-input-block">
				      <input type="text"  id="age" name="age" value="${admin.age}" class="layui-input" >
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">电话号码：</label>
				    <div class="layui-input-block">
				      <input type="text" id="phonenumber" name="phonenumber" value="${admin.phonenumber}" class="layui-input" >
				    </div>
				  </div>
				  
				  
				  <div class="layui-form-item">
				    <label class="layui-form-label">旧密码：</label>
				    <div class="layui-input-block">
				      <input type="text" required lay-verify="required"  value="${admin.password}" placeholder="请输入密码" autocomplete="off" class="layui-input" >
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">新密码：</label>
				    <div class="layui-input-block">
				      <input type="password" id="pwd" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" >
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">重复密码：</label>
				    <div class="layui-input-block">
				      <input type="password" id="pwd_A" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" onblur="checkPwd()">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn layui-btn-normal" lay-submit lay-filter="adminPassword">立即提交</button>
				    </div>
				  </div>
				</form>
		    </div>
                        	

                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <footer><p>Copyright &copy; 2020.Company name All rights reserved.</footer>
        </div>
        <!-- /. PAGE INNER  -->
    </div>
</div>
<script src="../js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="../js/morris/raphael-2.1.0.min.js"></script>
<script src="../js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="../js/custom-scripts.js"></script>
<script>
    function check() {
        var apply = $("#apply").val();
        var society = $("#society").val();
        var person = $("#person").val();
        var box = $("#box")[0];
        var form = $("#form");

        return true;
    }
    
    
    function checkPwd(){
    	var pwd = $("#pwd").val();
    	var pwd_A = $("#pwd_A").val();
    	
    	if(pwd==""||pwd==null){
    		alert("*密码不能为空");
    		
    	}
    	if(pwd!=pwd_A){
    		alert("*两次密码不一致");
    		
    	}
    }
    
    
    
    
    
</script>
</body>
</html>