<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="bysjy" uri="http://www.bysjy.com/common/"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>不同商品满意度比较分析系统后台管理</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../../webapp/js/morris/morris-0.4.3.min.css">
    <link rel="stylesheet" href="../css/custom-styles.css"  />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css/graduate-apply.css">
    <link rel="stylesheet" href="../../webapp/js/dataTables/dataTables.bootstrap.css">

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
            <a class="navbar-brand" >管理员端</a>
        </div>
        <!--右边的导航-->
        <ul class="nav navbar-top-links navbar-right">
            

            <!-- /.dropdown -->
        </ul>
    </nav>
    <jsp:include page="aside1.jsp"></jsp:include>
    <div id="page-wrapper">
  	<!--升级为管理员-->
  	<div id="Admin_Update">
        <form action="/admin/uprole" method="get" id="form" >
            输入要升级的用户名：<input type="text" name="username"/>
            <button type="submit" >确认升级</button>
        </form>

  	</div>
  	
    </div>
</div>
<script src="../../webapp/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../webapp/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../webapp/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../webapp/js/dataTables/jquery.dataTables.js"></script>
<script src="../../webapp/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../../webapp/js/custom-scripts.js"></script>
<!-- Morris Chart Js -->
<script src="../../webapp/js/morris/raphael-2.1.0.min.js"></script>
<script src="../../webapp/js/morris/morris.js"></script>
<script type="text/javascript">
	
</script>

</body>
</html>