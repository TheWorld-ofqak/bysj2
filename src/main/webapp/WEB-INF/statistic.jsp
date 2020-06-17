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
		<link rel="stylesheet" href="../css/custom-styles.css" />
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" href="../css/graduate-apply.css">
		<link rel="stylesheet" href="../js/dataTables/dataTables.bootstrap.css">
		<style>
			.form-group {
				display: flex;
			}
			
			.form-group>label {
				flex: 1;
				justify-items: left;
				margin-left: 50px;
			}
			
			.form-group>span {
				font-weight: 700;
				flex: 2;
				margin-left: -50px;
			}
			
			.form-group>input {
				flex: 2;
				margin-left: -52px;
				height: 2em;
			}
			
			button {
				margin-left: 50px;
				margin-right: 50px;
			}
			
			footer {
				text-align: center;
			}
			
			.form-group>textarea {
				flex: 2;
				margin-left: -52px;
			}
			#WJYRS{
				position: absolute;
				left:280px;
				top:700px;
				width:80%;
				height: 100%;
			}
			#morris-bar-chart2{
				height:30%;
			}
			.chart{
				width: 1050px;
				height: 600px;

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
					<a class="navbar-brand" href="stuInfo.action">用户端</a>
				</div>

			</nav>
			<!--左边导航栏-->
			<jsp:include page="aside.jsp"></jsp:include>
			<div id="page-wrapper">
				<div id="page-inner">
					<div class="row">
						<div class="col-md-12">
							<h1 class="page-header">
                        数据统计 <small>显示统计数据</small>
                    </h1>
						</div>
					</div>

					<div id="JYRS">
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="panel panel-default chart" >
								<div class="panel-heading">
									柱状图
								</div>
								<div class="panel-body">
									<div id="morris-bar-chart1"></div>
								</div>
							</div>
						</div>
						<br><br>
						<div id="WJYRS">
							<div class="col-md-6 col-sm-12 col-xs-12">
								<div class="panel panel-default chart chart1">
									<div class="panel-heading">
									饼状图
									</div>

									<div class="panel-body">
										<div id="morris-donut-chart"></div>
									</div>
								</div>
							</div>
						</div>

					</div>

					<footer>
						<p>Copyright &copy; 2016.Company name All rights reserved.</footer>
				</div>
				<!-- /. PAGE INNER  -->
			</div>
		</div>
		<script src="../js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="../js/bootstrap.min.js"></script>
		<!-- Metis Menu Js -->
		<script src="../js/jquery.metisMenu.js"></script>
		<!-- DATA TABLE SCRIPTS -->
		<script src="../js/dataTables/jquery.dataTables.js"></script>
		<script src="../js/dataTables/dataTables.bootstrap.js"></script>

		<!-- Morris Chart Js -->
		<script src="../js/morris/raphael-2.1.0.min.js"></script>
		<script src="../js/morris/morris.js"></script>
		<script>
			var mainApp = {

				initFunction: function() {
					$('#main-menu').metisMenu();
					$(window).bind("load resize", function() {
						if($(this).width() < 768) {
							$('div.sidebar-collapse').addClass('collapse')
						} else {
							$('div.sidebar-collapse').removeClass('collapse')
						}
					});

			<%--		/* MORRIS BAR CHART--%>
			<%-------------------------------------------*/--%>
					Morris.Bar({
						element: 'morris-bar-chart1',
						data: [
							<c:forEach items="${chart1}" var="row" varStatus="status">
                    {
                        y: '${row.name}',
                        a: ${row.goodnumber},
                        b: ${row.midnumber},
						c: ${row.lownumber}

                    }
                    <c:if test="${!status.last}" >,</c:if>
                    </c:forEach>
						],
						xkey: 'y',
						ykeys: ['a', 'b','c'],
						labels: ['好评', '中评','差评'],
						hideHover: 'auto',
						resize: true
					});



					Morris.Donut({
						element: 'morris-donut-chart',
						data: [
							<c:forEach items="${chart2}" var="row1" varStatus="status">
                    {
						label:"${row1.name}",
                        value:${row1.goodnumber}

                    }
                    <c:if test="${!status.last}" >,</c:if>
                    </c:forEach>
						],


						resize: true
					});
				},

				initialization: function() {
					mainApp.initFunction();

				}

			};
			$(function() {
				mainApp.initFunction();
			});
		</script>

	</body>

</html>