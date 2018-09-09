<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path=request.getContextPath(); 
  /*   System.out.println(path);
    System.out.println(request.getRealPath(this.toString()));
    System.out.println(path); */
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/lines.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="js/d3.v3.js"></script>
<script src="js/rickshaw.js"></script>
</head>
<body>

     
    <jsp:include page="left.jsp" />
    
<div id="page-wrapper">
    <div class="graphs">
	    <iframe width="420" style="float:right;"　scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>
  		<div class="widget_head">Workbench</div>
	    <div class="widget_1">
	    
	    
	    
			 	 <div class="col-sm-3 widget_1_box">
	                <div class="tile-progress bg-info">
	                    <a href="MovieQueryServlet.do?oper=list&page=1&status=1">
	                    <div class="content">
	                        <h4> 影片</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
	             </div>
	             <div class="col-sm-3 widget_1_box">
	                <div class="tile-progress bg-success">
	                   <a href="HallQueryServlet.do?oper=list&page=1&status=1">
	                    <div class="content">
	                        <h4>放映厅</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
	             </div>
	             <div class="col-sm-3 widget_1_box">
	               <div class="tile-progress bg-danger">
	                    <a href="CommentQueryServlet.do?oper=list&page=1&status=1">
	                    <div class="content">
	                        <h4>影评</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
	             </div>
	             <div class="col-sm-3 widget_1_box">
	             	<div class="tile-progress bg-secondary">
	                   <a href="IndentQueryServlet.do?oper=list&page=1&status=1">
	                    <div class="content">
	                        <h4> 售票</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
				  </div>
	              <div class="clearfix"> </div>
			   </div>
			   
			   <div class="widget_2">
		   	 	<div class="col-sm-3 widget_1_box">
	             	<div class="tile-progress bg-secondary">
	                    <a href="CustomerQueryServlet.do?oper=list&page=1">
	                    <div class="content">
	                        <h4>消费者</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
				  </div>
              	<div class="col-sm-3 widget_1_box">
	             	<div  class="tile-progress bg-danger">
	                    <div class="content">
	                        <h4>电影公司 </h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                </div>
				  </div>
            	<div class="col-sm-3 widget_1_box">
	             	<div class="tile-progress bg-success">
	                    <a  href="<%=path %>/front/index.jsp" target="blandk">
	                    <div class="content">
	                        <h4>前台</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
				  </div>
              	<div class="col-sm-3 widget_1_box">
	             	<div class="tile-progress bg-info">
	                    <a href="<%=path %>/backstage/userSelf.jsp">
	                    <div class="content">
	                        <h4>个人中心</h4>
	                        <div class="progress"><div class="progress-bar inviewport animated visible slideInLeft" style="width: 40%;"></div></div>
	                        <span></span>
	                    </div>
	                    </a>
	                </div>
				  </div>
              <div class="clearfix"> </div>
		   </div>
		   
		   
       </div>
     </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

