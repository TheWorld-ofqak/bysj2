<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bysjy" uri="http://www.bysjy.com/common/"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <title>Document</title>
	    <script src="https://cdn.bootcss.com/wordcloud2.js/1.1.0/wordcloud2.js"></script>
	<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
	<title>分析系统产品主页</title>
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
	</style>


	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h1 class="page-header">
						分析系统主页 <small></small>
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">



								<div id="image_first">
									<img src="../images/timg.jpg">
								</div>





							<!-- /.row (nested) -->

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

