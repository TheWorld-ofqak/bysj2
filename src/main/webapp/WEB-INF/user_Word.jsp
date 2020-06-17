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
    <title>毕业生就业系统</title>
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
                        词云图分析 <small></small>
                    </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">


                                <div id="canvas-container" align="center"  >
<%--                                            <canvas id="canvas" style="height: 100%;width: 100%"   ></canvas>--%>
                                   <canvas id="canvas" width="1500px" height="1000px"></canvas>
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
<script>

    var wordFreqData =  [
            <c:forEach items="${wordslist}" var="row1" varStatus="status">

            ['${row1.specialtxt}', ${row1.counts}]

            <c:if test="${!status.last}" >,</c:if>
        </c:forEach>
    ];
    var options = eval({
        "list": wordFreqData,

<%--                        <c:forEach items="${wordslist}" var="row1" varStatus="status">--%>

<%--                        ['${row1.specialtxt}', ${row1.counts}]--%>


<%--                        <c:if test="${!status.last}" >,</c:if>--%>
<%--                        </c:forEach>--%>

            // ['百万好评超',10],
            // ['优选阿克苏核心产区', 15],
            // ['时间的味道家乡', 20],
            // ['年后发货！宜', 30],
            // ['手选精糯可口', 20],
            // ["新鲜生羊头家庭聚餐必备下酒菜",22],
            // ["中华老字开袋即食日期新鲜",33],
            // ["收获幸福感可以很一刻放飞味舌尖甜蜜狂欢",5],
            //     ['百万好评超',10],
            // ['优选阿克苏核心产区', 15],
            // ['时间家乡', 20],
            // ['年后发货！宜', 30],
            // ['手选精糯可口', 20],
            // ["新鲜生庭聚餐必备下酒菜",22],
            // ["中华老字即食日期新鲜",33],
            // ["收获幸福感一刻放飞甜蜜狂欢",5],
            //     ['百万好评超',10],
            // ['优选阿克苏核心产区', 15],
            // ['时间家乡', 20],
            // ['年后发货！宜', 30],
            // ['手选精糯可口', 20],
            // ["新鲜生庭聚餐必备下酒菜",22],
            // ["中华老字即食日期新鲜",33],
            // ["收获幸福感一刻放飞甜蜜狂欢",5]

   //     ],


//             list： 数据列表，以2维数组形式[[单词，大小]，[单词，大小]]
//     fontFamily： 字体
//     fontWeight： 字体权重，普通，粗体、指定数值或其他
//     color： 文本的颜色
//     minSize： 在画布上绘制的最小字体大小
//     clearCanvas： 用背景颜色绘制整个画布
//     weightFactor： 函数调用，数字乘以列表中每个单词的大小
//     backgroundColor： 背景颜色
//     gridSize： 用于标记画布可用性的网格大小（以像素为单位）， 网格大小越大，单词之间的差距越大。
// rotateRatio： 旋转单词的概率。将数字设置为1以始终旋转
//
//     作者：MAYA_MUYI
//     链接：http://www.imooc.com/article/284771
//         来源：慕课网
        "gridSize": 10, // 密集程度 数字越小越密集
        "weightFactor": 3, // 字体大小=原始大小*weightFactor
        "fontWeight": 'normal', //字体粗细
        "fontFamily": 'Times, serif', // 字体
        "color": 'random-light', // 字体颜色 'random-dark' 或者 'random-light'
        "backgroundColor": '#333', // 背景颜色
        "rotateRatio": 10// 字体倾斜(旋转)概率，1代表总是倾斜(旋转)

        // "maxFontSize": 60, //最大字号
        // "minFontSize": 5, //最小字号
        // "gridSize": 1, // size of the grid in pixels  密集程度 数字越小越密集
        // "weightFactor": 1, // number to multiply for size of each word in the list
        // "fontWeight": 'normal', // 'normal', 'bold' or a callback
        // "fontFamily": 'Times, serif', // font to use
        // "color": 'random-light', // 'random-dark' or 'random-light'
        // "backgroundColor": '#666', // the color of canvas
        // "rotateRatio": 20 // probability for the word to rotate. 1 means always rotate
    });
    var canvas = document.getElementById('canvas');
    WordCloud(canvas, options);
</script>
