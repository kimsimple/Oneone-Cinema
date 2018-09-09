<%@page import="com.shxt.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);

%>    
<!DOCTYPE html>
<html lang="en">
<head>
<title>Single</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path %>/front/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/front/css/medile.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/front/css/single.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="<%=path %>/front/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/front/css/faqstyle.css" type="text/css" media="all" />
<!-- news-css -->
<link rel="stylesheet" href="<%=path %>/front/news-css/news.css" type="text/css" media="all" />
<!-- //news-css -->
<!-- list-css -->
<link rel="stylesheet" href="<%=path %>/front/list-css/list.css" type="text/css" media="all" />
<!-- //list-css -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="<%=path %>/front/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript" src="<%=path %>/front/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!---<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>--->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="<%=path %>/front/js/move-top.js"></script>
<script type="text/javascript" src="<%=path %>/front/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
	 
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
		  items : 5,
		  itemsDesktop : [640,5],
		  itemsDesktopSmall : [414,4]
	 
		});
	 
	}); 
</script> 
<script src="js/simplePlayer.js"></script>
<script>
	$("document").ready(function() {
		$("#video").simplePlayer();
	});
</script>


</head>
	
<body>
	
	<jsp:include page="top.jsp" />
	
	
<!-- <div class="general_social_icons">
	<nav class="social">
		<ul>
			<li class="w3_twitter"><a href="#">Twitter <i class="fa fa-twitter"></i></a></li>
			<li class="w3_facebook"><a href="#">Facebook <i class="fa fa-facebook"></i></a></li>
			<li class="w3_dribbble"><a href="#">Dribbble <i class="fa fa-dribbble"></i></a></li>
			<li class="w3_g_plus"><a href="#">Google+ <i class="fa fa-google-plus"></i></a></li>				  
		</ul>
  </nav>
</div> -->

<div class="single-page-agile-main">
<div class="container">
		<!-- /w3l-medile-movies-grids -->
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="<%=path %>/front/index.jsp">主页</a></li>
				  <li class="active">用户中心</li>
				</ol>
			</div>
	
			<div class="single-page-agile-info" >
             	<div class="show-top-grids-w3lagile" >
					<div class="col-sm-8 single-left" style="width:100%;height:80%;">

					<div class="song-grid-right" >
						<div class="share">
							<h5>欢迎您! ${sessionScope.cusSession.nameC!=null?sessionScope.cusSession.nameC:sessionScope.cusSession.telC}</h5>
								<div class="single-agile-shar-buttons">

							</div>
						</div>
					</div>
					<div class="clearfix"> </div>
					
					<div class="all-comments">
						<div class="all-comments-info">
							<a href="#">设置</a>
							<div class="agile-info-wthree-box">
								<form action="<%=path%>/front/CustomerUpdateFrontServlet.do?oper=edit"  method="post">
									<div class="input-group input-group-lg w3_w3layouts">
										 <!-- <span class="input-group-addon" id="sizing-addon1">*</span>  -->
									<input type="hidden" name="idE" value="${sessionScope.cusSession.idC}">
									<input type="hidden" name="passwordE" value="${sessionScope.cusSession.password}">
									<input type="text" name="telE" class="form-control" placeholder="电话" style="width:100%;" aria-describedby="sizing-addon1" value="${sessionScope.cusSession.telC}">
									</div>
									
				
									<div class="input-group input-group-lg w3_w3layouts">
										<!-- <span class="input-group-addon" id="sizing-addon1"></span> -->
									<input type="text" name="nameE" class="form-control" placeholder="昵称" style="width:100%;" aria-describedby="sizing-addon1" value="${sessionScope.cusSession.nameC}">
									</div>
									<div class="input-group input-group-lg w3_w3layouts">
										<!-- <span class="input-group-addon" id="sizing-addon1"></span> -->
									<input type="text" name="emailE" class="form-control" placeholder="邮箱" style="width:100%;" aria-describedby="sizing-addon1" value="${sessionScope.cusSession.email}">
									</div>
	
									<div class="panel-footer">
										<div class="row">
											<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
												<input class="btn-success btn" type="submit" value="保存编辑"/>
											</div>
										</div>
									</div>
										<div class="clearfix"> </div>
								</form>
							</div>
							我的订单:
							<div class="bs-docs-example">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>编号</th>
											<th>订单号</th>
											<th>排</th>
											<th>座</th>
											<th>付款</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${IndentList }" var="indent" varStatus="vs">
											<tr id="${vs.count }">
												<th scope="row">${vs.count }</th>
												<td>${indent.indent_code }</td>
												<td>${indent.seat1 }</td>
												<td>${indent.seat2 }</td>
												<td>${indent.payment }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>				
						</div>
					</div>
					</div>
				</div>
			</div>	
		</div>
	</div>	
					
				<div class="clearfix"> </div>
			</div>
				<!-- //movie-browse-agile -->
				<!-- 下热门-->
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">

				</div>
			</div>
		<!--body wrapper end-->
						
		<jsp:include page="footer.jsp" />					 

<!-- Bootstrap Core JavaScript -->
<script src="<%=path %>/front/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
</script>
<!-- //Bootstrap Core JavaScript -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
</body>
</html>
