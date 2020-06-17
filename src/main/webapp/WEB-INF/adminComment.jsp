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

    </nav>
    <!--左边导航栏-->
    <jsp:include page="aside1.jsp"></jsp:include>


    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        订单商品评论信息 <small>评论信息</small>
                    </h1>
                </div>
            </div>
           <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        商品评论信息列表
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables">
                                <thead>
                                <tr>
                                    <th>评论信息的编号</th>
                                    <th>评论用户的昵称</th>
                                    <th>评论类型</th>
                                    <th>评论内容</th>
                                    <th>评论好感度</th>
                                    <th>评论时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${commentList}" var="row">
                                    <tr>
                                        <td>${row.CId}</td>
                                        <td>${row.UName}</td>
                                        <td>${row.OType}</td>
                                        <td>${row.content}</td>
                                        <td>${row.commenttype}</td>
                                        <td>${row.createTime}</td>
                                        <td>
                                            <input type="button" class="btn btn-primary btn-xs" onclick="deletetest('${row.CId}')" value="删除"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
            <!-- /.col-lg-12 -->


            <footer><p>Copyright &copy; 2016.Company name All rights reserved.</footer>
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


<script>
        $(document).ready(function () {
            $('#dataTables').dataTable({
                "bPaginate": true,  //是否显示分页
                "bFilter": true,//搜索栏
                "oLanguage": {
                    sLengthMenu: "每页显示 _MENU_ 条记录",
                    sZeroRecords: "对不起，没有匹配的数据",
                    sInfo: "第 _START_ - _END_ 条 / 共 _TOTAL_ 条数据",
                    sInfoEmpty: "没有匹配的数据",
                    sInfoFiltered: "(数据表中共 _MAX_ 条记录)",
                    sProcessing: "正在加载中...",
                    sSearch: "全文搜索：",
                    oPaginate: {
                        sFirst: "第一页",
                        sPrevious: " 上一页 ",
                        sNext: " 下一页 ",
                        sLast: " 最后一页 "
                    }
                }
            });
            var Atable=$('#dataTables').DataTable();
            $("#sex").change(function(){
                if($(this).val() !==''){
                    Atable.columns(0).search($(this).find("option:selected").text()).draw();
                }
            });
        });
</script>


<script>
    function deletetest(id) {
        if(confirm('确实要删除评论吗?')) {
            $.get("${pageContext.request.contextPath}/admin/commontdelete",{"id":id},
                function(data){
                    if(data ==="OK"){
                        alert("删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除失败！");
                        window.location.reload();
                    }
                });
        }
    }

</script>

</body>
</html>
