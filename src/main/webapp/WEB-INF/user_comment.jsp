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
    <link rel="stylesheet" href="../css/custom-styles.css"  />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="../css/graduate-apply.css">
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
        }
        #employed,#home{
            flex: 2;
        }
        .mybutton{
            text-align: center;
        }
        .mybutton>button{
            margin-left: 100px;
            margin-right: 100px;
        }
        footer{
            text-align: center;
        }
        
        #employed,
			#home {
				flex: 2;
			}
			
			.mybutton {
				text-align: center;
			}
			
			.mybutton>button {
				margin-left: 100px;
				margin-right: 100px;
			}
			
			footer {
				text-align: center;
			}
			
			#td{
				width: 500px;
				height: 60px;
			}
			#comment_type{
				
			}
			.comment_a{
                margin: auto;
            }
			.img_comment{
				text-align: center;
			}
			#PL{
				width: 100px;
				height: 20px;
				font: 20px;
				text-decoration:underline
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
            <a class="navbar-brand">用户端</a>
        </div>
        <!--右边的导航-->

    </nav>
    <!--左边导航栏-->

    <jsp:include page="aside.jsp"></jsp:include>


    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                       		首页 <small>攥写评价</small>
                    </h1>
                </div>
            </div>

            <!--评价首页-->
            <div class="type_Five">



                    <div class="img_comment">
                       <img src="../images/fruit.jpg"/style="text-align:center">
                    </div>

                    <div style="width: 100px;height: 50px;background: transparent" class="comment_a">
						<span id="Text_1">水果：</span>
                        <a  href="?type=水果" id="PL"><i class="fa fa-arrows-alt"></i>评论</a>
                    </div>
                    
                    
                    


                <div class="img_comment">
                   <img src="../images/HXSC.jpg"/ style="text-align:center">
                </div>
                <div style="width: 200px;height: 50px;background: transparent" class="comment_a">
						<span id="Text_1">海鲜水产：</span>
                    <a  href="?type=海鲜水产" id="PL"><i class="fa fa-arrows-alt"></i>评论</a>
                </div>
                
                
                <div class="img_comment">
                   <img src="../images/meat.jpg"/ style="text-align:center">
                </div>
                <div style="width: 200px;height: 50px;background: transparent" class="comment_a">
				<span id="Text_1">猪牛羊肉：</span>
                    <a  href="?type=猪牛羊肉" id="PL"><i class="fa fa-arrows-alt"></i>评论</a>
                </div>
                
                
                <div class="img_comment">
                   <img src="../images/LCLDSP.jpg"/ style="text-align:center">
                </div>
                <div style="width: 200px;height: 50px;background: transparent" class="comment_a">
					<span id="Text_1">冷藏/冷冻食品：</span>
                    <a  href="?type=冷藏/冷冻食品" id="PL"><i class="fa fa-arrows-alt"></i>评论</a>
                </div>
                
                
                 <div class="img_comment">
                   <img src="../images/vegetables.jpg"/ style="text-align:center">
                </div>
                <div style="width: 100px;height: 50px;background: transparent" class="comment_a">
					<span id="Text_1">蔬菜：</span>
                    <a  href="?type=蔬菜" id="PL"><i class="fa fa-arrows-alt"></i>评论</a>
                </div>
                
                
                


            </div>
            	

            
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
	function open_win(){
		window.open("user_comment_one.jsp");
	}
</script>

</body>
</html>