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
                        用户信息管理 <small>管理系统的普通用户信息</small>
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            管理系统的普通用户信息
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>用户名（账号）</th>
                                        <th>年龄</th>
                                        <th>权限</th>
                                        <th>邮箱</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userList}" var="row">
                                        <tr>
                                            <td>${row.UId}</td>
                                            <td>${row.username}</td>
                                            <td>${row.age}</td>
                                            <td>${row.role}</td>
                                            <td>${row.email}</td>
                                            <td>
                                                <input type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                                       data-target="#DetailDialog" onclick="see('${row.UId}')" value="详细信息"/>
                                                <input type="button" class="btn btn-primary btn-xs" data-toggle="modal"
                                                       data-target="#DetailDialog" onclick="edit('${row.UId}')" value="修改"/>
                                                <input type="button" class="btn btn-primary btn-xs" onclick="uprole('${row.username}')" value="升级为管理员"/>
                                                <input type="button" class="btn btn-primary btn-xs" onclick="deleteStu('${row.UId}')" value="删除"/>
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
                            <h4 class="modal-title" id="myModalLabel">详细信息</h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" id="stu_form">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label">账号</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_id" placeholder="账号" name="UId" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">名称</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_name" placeholder="姓名" name="username" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">年龄</label>
                                    <div class="col-sm-10"><input type="number" class="form-control" id="edit_age" placeholder="年龄" name="age" /></div>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <label class="col-sm-2 control-label">性别</label>--%>
<%--                                    <div class="col-sm-10"><select	class="form-control" id="edit_sex" name="sex">--%>
<%--                                        <option value="">--请选择--</option>--%>
<%--                                        <option value="男">男</option>--%>
<%--                                        <option value="女">女</option>--%>
<%--                                    </select></div>--%>
<%--                                </div>--%>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_pwd" placeholder="密码" name="password" /></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电话号码</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_tel" placeholder="手机号" name="phonenumber" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">权限</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_role" placeholder="权限" name="role" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱地址</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="edit_email" placeholder="邮箱地址" name="email" /></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">账号创建时间</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="creatTime" placeholder="账号创建时间"  /></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">信息最后修改的时间</label>
                                    <div class="col-sm-10"><input type="text" class="form-control" id="updateTime" placeholder="信息更新时间"  /></div>
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

    function see(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/admin/filesEdit",
            data:{"id":id},
            success:function(data) {
                $("#edit_id").val(id);
                $("#edit_name").val(data.username);
                $("#edit_age").val(data.age);

                $("#edit_role").val(data.role);
                $("#edit_pwd").val(data.password);
                $("#edit_email").val(data.email);
                $("#edit_tel").val(data.phonenumber);
                $("#creatTime").val(data.creatTime);
                $("#updateTime").val(data.updateTime);
                $("#save").hide();
            }
        });
    }

    function edit(id) {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/admin/filesEdit",
            data:{"id":id},
            success:function(data) {
                $("#edit_id").val(id);
                $("#edit_name").val(data.username);
                $("#edit_age").val(data.age);

                $("#edit_role").val(data.role);
                $("#edit_pwd").val(data.password);
                $("#edit_email").val(data.email);
                $("#edit_tel").val(data.phonenumber);
                $("#creatTime").val(data.creatTime);
                $("#updateTime").val(data.updateTime);
                $("#save").show();
            }
        });
    }
    function updateCustomer() {
        $("#edit_id").removeAttr("disabled");
        $.post("${pageContext.request.contextPath}/admin/updateuser",$("#stu_form").serialize(),function(data){
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
        if(confirm('确实要删除该客户吗?')) {
            $.post("${pageContext.request.contextPath}/admin/userdelete",{"id":id},
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

    function uprole(username) {
        if(confirm('确实要将该用户升级为管理员吗?')) {
            $.post("${pageContext.request.contextPath}/admin/uprole",{"username":username},
                function(data){
                    if(data ==="OK"){
                        alert("升级成功！");
                        window.location.reload();
                    }else{
                        alert("升级失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>

</body>
</html>
