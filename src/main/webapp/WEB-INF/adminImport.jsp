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
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        数据导入 <small>excel导入</small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>向数据库中导入excel数据</label>
                                            <form action="/admin/import1" method="post"  enctype="multipart/form-data" >
                                                选择上传excel的路径：<input type="file" name="filepath"/>
                                                <button type="submit" >确认导入数据</button>
                                            </form>
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


        </div>
        <!-- /. PAGE INNER  -->
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