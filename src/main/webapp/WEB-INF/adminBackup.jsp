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
    <link rel="stylesheet" href="../js/morris/morris-0.4.3.min.css">
    <link rel="stylesheet" href="../css/custom-styles.css"  />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css/graduate-apply.css">
    <link rel="stylesheet" href="../js/dataTables/dataTables.bootstrap.css">
    <style>
        .form-group{
            display: flex;

        }
        .form-group>label{
            flex: 1;
            justify-items: left;
            margin-left: 50px;
        }
        .form-group>span{
            font-weight: 700;
            flex: 2;
            margin-left: -50px;
        }
        .form-group>input{
            flex: 2;
            margin-left: -52px;
            height:2em;
        }
       button{
            margin-left: 50px;
            margin-right: 50px;
        }
        footer{
            text-align: center;
        }
        .form-group>textarea{
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
            <a class="navbar-brand" href="stuInfo.action">管理员端</a>
        </div>
        <!--右边的导航-->

    </nav>
    <!--左边导航栏-->
    <!--最上边的导航-->

    <!--左边导航栏-->
    <jsp:include page="aside1.jsp"></jsp:include>

    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        数据备份 <small>备份数据库信息</small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <form  id="backup_form" method="get">
                                <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>数据备份</label>
                                            <select id="backupSelect">
                                                <c:forEach items="${sessionScope.backupName}" var="row" varStatus="status">
                                                    <option value="${status.index}"
                                                            <c:if test="${status.last}">selected</c:if>
                                                    >${row}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <button  class="btn btn-default" onclick="backup()">备份数据库</button>
                                        <button  class="btn btn-default" onclick="rebackup()">还原选择数据库</button>
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

<!-- Custom Js -->
<%--<script src="../js/custom-scripts.js"></script>--%>
<!-- Morris Chart Js -->
<%--<script src="../js/morris/raphael-2.1.0.min.js"></script>--%>
<%--<script src="../js/morris/morris.js"></script>--%>
<script>

    function backup() {
        $.get("${pageContext.request.contextPath}/admin/backup",function(data){
            if(data==="OK"){
                alert("备份成功！");
            }else{
                alert("备份失败！");
            }
            window.location.reload();
        });
    }
    function rebackup() {
        var mess=$("#backupSelect").find("option:selected").text();
        $.post("${pageContext.request.contextPath}/admin/rebackup", {"mess":mess},function(data){
            if(data==="OK"){
                alert("恢复成功！");
            }else{
                alert("恢复失败！");
            }
            window.location.reload();
        });
    }


</script>

</body>
</html>
