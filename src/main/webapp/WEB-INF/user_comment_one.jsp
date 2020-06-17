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
        
            .content, .content1 {
            margin-top: 20px;
              padding-top: 20px;
             border-top: 1px solid #000;
          }
          
          .red {
              color: red;
          }
          .total-star {
              font-size: 20px;
              color: #333;
              font-weight: 700;
          }
          .star {
              width: 20px;
              height: 20px;
              border-radius: 50%;
              background-color: #ccc;
              display: inline-block;
              margin-right: 5px;
              cursor: pointer;
          }
          .stars {
              color: orange;
              margin-left: 10px;
          }
          
          #type_comment{
          	margin-left: 30px;
          	
          		
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
            
            <!--首页-->
              <div id="comment_All">
              	<div id="comment_type_1">


                    <form name="comment_form" action="/user/comment" method="post">

                        <div id="name_comment">
                            用户名:
                            <input id="u_name" name="uName" type="text" class="form-control" value="${sessionScope.username} " >
                        </div>
                        <div id="name_comment1">
                            类型:
                            <input id="type1" name="oType" type="text" class="form-control" value="${type} " >
                        </div>


                        <!--星星评分-->
              		<div class="content">
          <span class="red">*</span>
          <span class="total-star">总体评价：</span>
          <div class="star"></div>
          <div class="star"></div>
          <div class="star"></div>
          <div class="star"></div>
          <div class="star"></div>
          <span class="stars">评分</span>
      </div>
                        
              		  <!--好评-->
              		  
              		  <div id="type_comment1">
              		  	评价:
              		  	 <select name="commenttype" id="type_comment" value="text_comment_type">
  						<option value ="好评">好评</option>
  						<option value ="中评">中评</option>
  						<option value="差评">差评</option>
					</select>
              		  </div>
              		 
              		  
              		<!--攥写评论-->
              		 <div id="comment_text">
              		 	<p>评论：</p>
              		 	<textarea cols="100" rows="20" name="content" id="comment_text_Text"></textarea>
              		 </div>
       					<!--提交-->
       					<input type="submit" value="发表评价" onclick="checkComment_text_Text()">
        					
    				</form>

              		
              	</div>
            
            
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>-->
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
<script>
      var ch=$("#select").val();
      
      //方法3
      var text_comment_type = document.getElementById("type_comment");
      function checkComment_text_Text(){
      	var text = document.getElementById("comment_text_Text").value;
      	if(text==""|| text==null){
      		alert("评论不能为空");
      		return false;
      	}else{
      		return true;
      	}
      }
      
      
      function type_comment(){
      	
      	
      	//方法1
      	switch(ch) {
            case "1" : break;
            case "2" : 
            case "3" : break;
        }
      	
      	
      	//方法2
      	var temp = $('#testSelect option:selected').text();
       
      }
      
       window.onload=function(){
          var oCont = document.getElementsByClassName('content')[0];

          var aText1=['差','较差','好','推荐','力荐'];

  
          //调用函数
          Stars(oCont,aText1);

  
          function Stars(id,Txt){
              var index='';//使用这个index来记录星星被点击后的等级
              //获取元素
              var aStar = id.getElementsByClassName('star');
              var oStars = id.getElementsByClassName('stars')[0];
  
              //让全部星星变灰
              function gray(){
                  for(var v=0;v<aStar.length;v++){
                      aStar[v].style.backgroundColor = '#ccc';
                  }
              }
  
              for(let i=0;i<aStar.length;i++){
  
                  //设置星星颜色
                  function starColor(){
                     // 前两个星星显示灰色
                      if(i<=1){
                          gray();
                          for(let t=0;t<=i;t++){
                              aStar[t].style.backgroundColor = '#999';
                         }
                     }else{
                        //后面星星都显示橙色
                          gray();
                          for(let j=0;j<=i;j++){
                              aStar[j].style.backgroundColor = 'orange';
                          }
                      }
                  }
  
                 //鼠标移入变换星星颜色
                 aStar[i].onmouseover=function(){
                     oStars.innerHTML = Txt[i];
                     starColor();
                     //鼠标移出变灰，评论等级清空
                     this.onmouseout=function(){
                         gray();
                         oStars.innerHTML = '评分';
                         //这里必须为 === ，否则当index==0时，会进行隐式类型转换，变成 (index=='') ==> (0=='')  ==> (false==false)，直接return出去
                         if(index===''){
                             return;
                         }else if(index<=1){//通过index重新设置后面鼠标移开后的星星等级
                             for(var n=0;n<=index;n++){
                                 aStar[n].style.backgroundColor = '#999';
                             }
                             oStars.innerHTML = Txt[index];
                         }else{
                             for(var m=0;m<=index;m++){//通过index重新设置后面鼠标移开后的星星等级
                                 aStar[m].style.backgroundColor = 'orange';
                           }
                             oStars.innerHTML = Txt[index];
                         }
                     }
                 }
 
                 //鼠标点击固定星星等级和评论等级
                 aStar[i].onclick=function(){
                     // 关闭移出操作
                     this.onmouseout=null;
                     //星星等级
                     oStars.innerHTML = Txt[i];
                    if(i<=1){
                        for(let t=0;t<=i;t++){
                             aStar[t].style.backgroundColor = '#999';
                             //获取当前点击的是多少等级的星星，让后面鼠标移开后可以重新设置星星等级
                             index=t;
                         }
                     }else{
                         for(let j=0;j<=i;j++){
                             aStar[j].style.backgroundColor = 'orange';                             //获取当前点击的是多少等级的星星，让后面鼠标移开后可以重新设置星星等级
                             index=j;
                         }
                     }
                 }
             }
         }
     }
      function checkComment_text_Text(){
      	var text = document.getElementById("comment_text_Text").value;
      	if(text==""|| text==null){
      		alert("评论不能为空");
      		return false;
      	}else{
      		return true;
      	}
      }
 </script>
</body>
</html>