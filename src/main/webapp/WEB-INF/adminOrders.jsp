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
    <jsp:include page="aside1.jsp"></jsp:include>
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                      订单商品管理 <small>订单查看</small>
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            商品信息列表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>商品订单名称</th>
                                        <th>商品类型</th>
                                        <th>价格</th>
                                        <th>vip价格</th>
                                        <th>好评数</th>
                                        <th>好评率</th>
                                        <th>特色标语</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ordersList}" var="row">
                                        <tr>
                                            <td>${row.skuid}</td>
                                            <td>${row.name}</td>
                                            <td>${row.type}</td>
                                            <td>${row.price}</td>
                                            <td>${row.vipprice}</td>
                                            <td>${row.goodnumber}</td>
                                            <td>${row.goodsay}</td>
                                            <td>${row.specialtxt}</td>
                                            <td>

                                                <input type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                                       data-target="#DetailDialog" onclick="edit('${row.skuid}')" value="查看详细信息修改"/>
                                                <input type="button" class="btn btn-primary btn-xs" onclick="deleteStu('${row.skuid}')" value="删除"/>
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
            </div>
            <!-- 查看信息模态框 -->
            <div class="modal fade" id="DetailDialog" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">商品全部信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="stu_form">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">订单编号</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_id" placeholder="订单编号" name="skuid" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">商品名称</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_name" placeholder="商品名称" name="name" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">品类</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="type" placeholder="品类" name="type" /></div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">价格</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="price" placeholder="price" name="price" /></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">vipprice</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="vipprice" placeholder="电话" name="vipprice" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">好评数</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="goodnumber" placeholder="好评数" name="goodnumber" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">中评数</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="midnumber" placeholder="中评数" name="midnumber" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">差评数</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="lownumber" placeholder="差评数" name="lownumber" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">好评率</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="goodsay" placeholder="好评率" name="goodsay" /></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">特色标语</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="specialtxt" placeholder="特色标语" name="specialtxt" /></div>
                                </div>


                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" id="save" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
                        </div>
                    </div>
                </div>
            </div>
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

<!-- Custom Js -->
<%--<script src="../js/custom-scripts.js"></script>--%>
<!-- Morris Chart Js -->
<%--<script src="../js/morris/raphael-2.1.0.min.js"></script>--%>
<%--<script src="../js/morris/morris.js"></script>--%>
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
    function edit(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/admin/ordersEdit",
            data:{"id":id},
            success:function(data) {
                $("#edit_id").val(id);
                $("#edit_name").val(data.name);
                $("#type").val(data.type);
                $("#price").val(data.price);
                $("#vipprice").val(data.vipprice);
                $("#goodnumber").val(data.goodnumber);
                $("#midnumber").val(data.midnumber);
                $("#lownumber").val(data.lownumber);
                $("#goodsay").val(data.goodsay);
                $("#specialtxt").val(data.specialtxt);
                $("#save").show();
            }
        });
    }
    function updateCustomer() {
        $("#edit_id").removeAttr("disabled");
        $.post("${pageContext.request.contextPath}/admin/updateorders",$("#stu_form").serialize(),function(data){
            if(data ==="OK"){
                alert("信息更新成功！");
                window.location.reload();
            }else{
                alert("信息更新失败！");
                window.location.reload();
            }
        });
    }

    function deleteStu(id) {
        if(confirm('确实要删除该商品信息吗?')) {
            $.post("${pageContext.request.contextPath}/admin/ordersdelete",{"id":id},
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
