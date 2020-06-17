<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bysjy" uri="http://www.bysjy.com/common/"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>不同商品满意度比较分析系统</title>
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

        .form-group > span {
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
            <a class="navbar-brand" >用户端</a>
        </div>

    </nav>
    <!--左边导航栏-->
    <!--左边导航栏-->
    <jsp:include page="aside.jsp"></jsp:include>


	<style type="text/css">
		#form{
			
			
		}
		.form-group{
			
			margin: 10px;
		}
		
		.button_chart{
			background: transparent;
			width: 130px;
			height: 50px;
		}
		label{
			font-size: 26px;
			font-style: inherit;
		}
		#type_li{
			text-align: center;
		}
		.type_one{
			margin-left: 300px;
		}
	</style>

	
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        统计图分析 <small></small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">



									<div id="type_li">
                                	<img src="../images/fruit.jpg"/ style="text-align:center">
                                    <div class="form-group">
                                        <div class="type_one"style="width: 120px;height: 50px;background: transparent"><a  href="?type=水果">水果：查看统计图</a></div>
                                    </div>
                                    </div>
                                    
                                    
									<div id="type_li">
									<img src="../images/HXSC.jpg"/ style="text-align:center">
                                    <div class="form-group">
                                        
                                        <div class="type_one"style="width: 140px;height: 50px;background: transparent"><a  href="?type=海鲜水产">海鲜水产:查看统计图</a></div>
                                    </div>
                                    </div>
                                    
                                    
                                    <div id="type_li">
									<img src="../images/meat.jpg"/ style="text-align:center">
                                    <div class="form-group">
                                       
                                        <div class="type_one"style="width: 140px;height: 50px;background: transparent"><a  href="?type=猪牛羊肉">猪牛羊肉:查看统计图</a></div>
                                    </div>
                                    </div>
                                    
                                    
                                    <div id="type_li">
									<img src="../images/LCLDSP.jpg"/ style="text-align:center">
                                    <div class="form-group">
                                        <div class="type_one"style="width: 200px;height: 50px;background: transparent"><a  href="?type=冷藏/冷冻食品">冷藏/冷冻食品：查看统计图</a></div>
                                    </div>
                                    </div>
                                    
                                    
                                    <div id="type_li">
									<img src="../images/vegetables.jpg"/ style="text-align:center">
                                    <div class="form-group">
                                       
                                            <div class="type_one"style="width: 120px;height: 50px;background: transparent"><a  href="?type=蔬菜">蔬菜:查看统计图</a></div>
                                    </div>
                                    </div>






                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <footer><p></footer>
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
<script type="text/javascript">


</script>
</body>
</html>