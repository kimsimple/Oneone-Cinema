<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.shxt.model.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MovieBean mb=new MovieBean();
	List<Map<String,Object>> listISHot=mb.ISHotFront();
	List<Map<String,Object>> listComingSoon=mb.ComingSoonFront();
	List<Map<String,Object>> listPlate=mb.PlateFront();
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<base href="basePath">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path %>/front/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/front/css/contactstyle.css" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/front/css/faqstyle.css" type="text/css" media="all" />
<link href="<%=path %>/front/css/single.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/front/css/medile.css" rel='stylesheet' type='text/css' />
<!-- banner-slider -->
<link href="<%=path %>/front/css/jquery.slidey.min.css" rel="stylesheet">
<!-- //banner-slider -->
<!-- pop-up -->
<link href="<%=path %>/front/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
<!-- //pop-up -->
<!-- font-awesome icons -->
<link rel="stylesheet" href="<%=path %>/front/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<!-- js -->
<script type="text/javascript" src="<%=path %>/front/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- banner-bottom-plugin -->
<link href="<%=path %>/front/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=path %>/front/js/owl.carousel.js"></script>
<script>
	$(document).ready(function() { 
		$("#owl-demo").owlCarousel({
		  autoPlay: 3000, //Set AutoPlay to 3 seconds
		  items : 5,
		  itemsDesktop : [640,4],
		  itemsDesktopSmall : [414,3]
	 
		});
	}); 
</script> 
<!-- //banner-bottom-plugin -->
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

<!-- 轮播定时器 -->
<script type="text/javascript">  
function remainTime(){  
    document.getElementById("right_next").click();
    setTimeout("remainTime()",3000);  
}
$(document).ready(function(){ 
	remainTime(); 
});
</script> 

</head>
	
<body>

	<jsp:include page="top.jsp" />

<!-- 大板块 -->
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<%
			int lenISPlate=listPlate.size();
			for(int i=0;i<lenISPlate;i++){
				Map<String,Object> m=listPlate.get(i);
			%>
			<li data-target="#myCarousel" data-slide-to="<%=i%>" class="<%=i==0?"active":""%>"></li>
			<%
			}%>
		</ol>   
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<%
			for(int i=0;i<lenISPlate;i++){
				Map<String,Object> m=listPlate.get(i);
			%>
			<div class="item <%=i==0?"active":""%>">
				<a href="<%=path %>/front/MovieQueryFrontServlet.do?oper=query&where=-1&id=<%=m.get("id") %>">
				<img src="/uploadPlate/<%=m.get("platepicture") %>" alt="First slide">
				</a>
			</div>
			<%
			}%>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" 
		   data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" 
		   data-slide="next" id="right_next">&rsaquo;</a>
	</div> 
	<!-- <div id="slidey" style="display:none;">
		<ul>
			<li><img src="images/5.jpg" alt=" "><p class='title'>泰山传奇(Tarzan)</p><p class='description'> 19世纪80年代，泰山已经离开了刚果丛林十年了，他与心爱的女人珍在维多利亚女王时代的英国生伦敦活着。一次，他被作为英国议会的贸易大使重新回到刚果...，但这次派遣实际上是一次比利时人里昂·罗姆（克里斯托弗·瓦尔兹饰）的阴谋。泰山、珍以及他的朋友们都陷入了危险，但丛林是泰山的天下，他开始重新飞檐走壁…</p></li>
			<li><img src="images/2.jpg" alt=" "><p class='title'>极速天使(Maximum Ride)</p><p class='description'> 6个青少年接受基因改造，成为半人半鸟的生物，之后他们利用飞行能力逃出了实验室，但又被一群半人半狼的基因改造生物追杀。</p></li>
			<li><img src="images/3.jpg" alt=" "><p class='title'>Independence</p><p class='description'>The fate of humanity hangs in the balance as the U.S. President and citizens decide if these aliens are to be trusted ...or feared.</p></li>
			<li><img src="images/4.jpg" alt=" "><p class='title'>Central Intelligence</p><p class='description'>Bullied as a teen for being overweight, Bob Stone (Dwayne Johnson) shows up to his high school reunion looking fit and muscular. Claiming to be on a top-secret ...</p></li>
			<li><img src="images/6.jpg" alt=" "><p class='title'>Ice Age</p><p class='description'>In the film's epilogue, Scrat keeps struggling to control the alien ship until it crashes on Mars, destroying all life on the planet.</p></li>
			<li><img src="images/7.jpg" alt=" "><p class='title'>X - Man</p><p class='description'>In 1977, paranormal investigators Ed (Patrick Wilson) and Lorraine Warren come out of a self-imposed sabbatical to travel to Enfield, a borough in north ...</p></li>
		</ul>   	
    </div> -->
    <script src="<%=path %>/front/js/jquery.slidey.js"></script>
    <script src="<%=path %>/front/js/jquery.dotdotdot.min.js"></script>
	   <script type="text/javascript">
			$("#slidey").slidey({
				interval: 8000,
				listCount: 5,
				autoplay: false,
				showList: true
			});
			$(".slidey-list-description").dotdotdot();
	</script>
	<div class="general">
		<div class="container">
			<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
					<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">正在热映</a></li>
					<li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false" >即将上映</a></li>
<!-- 				<li role="presentation"><a href="#rating" id="rating-tab" role="tab" data-toggle="tab" aria-controls="rating" aria-expanded="true">观影月历</a></li>
					<li role="presentation"><a href="#imdb" role="tab" id="imdb-tab" data-toggle="tab" aria-controls="imdb" aria-expanded="false">Recently Added</a></li>
 -->				</ul>
					<div id="myTabContent" class="tab-content">
				
					<!-- 正在热映 -->
					<div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
						<div class="w3_agile_featured_movies">
							<%
							int lenISHot=listISHot.size();
							for(int i=0;i<lenISHot;i++){
								Map<String,Object> m=listISHot.get(i);
							%>
							<div class="col-md-2 w3l-movie-gride-agile">
								<a href="<%=path %>/front/MovieQueryFrontServlet.do?oper=query&where=-1&id=<%=m.get("id") %>">
								<img src="/upload/<%=m.get("pictureName") %>"  style="width:182px;height:268px;" title="album-name" class="img-responsive" alt=" " />
								</a>
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6><%=m.get("name") %></h6>							
									</div>
								</div>
							</div>
							<%
							}%>
						</div>
					</div>
					
					
					<!-- 即将上映 -->
					<div  role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
						<div class="w3_agile_featured_movies">
						<%
						 int lenComingSoont=listComingSoon.size();
							for(int i=0;i<lenComingSoont;i++){
							Map<String,Object> m=listComingSoon.get(i);
						%>
						<div class="col-md-2 w3l-movie-gride-agile"  >
								<a href="<%=path %>/front/MovieQueryFrontServlet.do?oper=query&where=-1&id=<%=m.get("id") %>">
								<img src="/upload/<%=m.get("pictureName") %>" style="width:182px;height:268px;" title="album-name01" class="img-responsive" alt=" " />
								</a>
								<!-- <div class="w3l-action-icon">
									<i class="fa fa-play-circle" aria-hidden="true">
									</i>
								</div> -->
								<div class="mid-1 agileits_w3layouts_mid_1_home">
									<div class="w3l-movie-text">
										<h6><%=m.get("name") %></h6>							
									</div>
									<!-- <div class="mid-2 agile_mid_2_home">
										<div class="clearfix"></div>
									</div> -->
								</div>
								<div class="ribben">
									<p>NEW</p>
								</div> 
						</div>
						<%} %>
					</div>
					</div>
					
					
					
					<!-- <!-- 观影月历 --
					<div role="tabpanel" class="tab-pane fade" id="rating" aria-labelledby="rating-tab">
						<div class="col-md-2 w3l-movie-gride-agile">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m7.jpg" title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="single.html">Light B/t Oceans</a></h6>							
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
										</ul>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben">
								<p>NEW</p>
							</div>
						</div>
					</div> -->
					
				</div> 
			</div>
		</div>
	</div>
<!-- //general -->
<!-- 热门影视作品-->
<%-- <div class="Latest-tv-series">
		<h4 class="latest-text w3_latest_text w3_home_popular">热门电影</h4>
		<div class="container">
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
					
					<!-- 一块电影信息 -->
						<li>
							<div class="agile_tv_series_grid">
								<div class="col-md-6 agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
										<img src="images/h1-1.jpg" alt=" " class="img-responsive" />
										<a class="w3_play_icon" href="#small-dialog">
											<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
										</a>
									</div>
								</div>
								<div class="col-md-6 agile_tv_series_grid_right">
									<p class="fexi_header">the conjuring 2</p>
									<p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span> 720p,Bluray HD Free Movie
									 Downloads, Watch Free Movies Online with high speed Free Movie Streaming | MyDownloadTube Lorraine and Ed Warren
									  go to north London to help a single...</p>
									<p class="fexi_header_para"><span>Date of Release<label>:</label></span> Jun 10, 2016 </p>
									<p class="fexi_header_para">
										<span>Genres<label>:</label> </span>
										<a href="genres.html">Drama</a> | 
										<a href="genres.html">Adventure</a> | 
										<a href="genres.html">Family</a>								
									</p>
									<p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
										<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
									</p>
								</div>
								<div class="clearfix"> </div>
								<%
								lenISHot=listISHot.size();
								for(int i=0;i<lenISHot;i++){
									Map<String,Object> m=listISHot.get(0);
								%>
								<div class="col-md-6 agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
										<img src="/upload/<%=m.get("pictureName") %>" alt=" " class="img-responsive" />
										<a class="w3_play_icon" href="#small-dialog">
											<span class="glyphicon glyphicon-play-circle" aria-hidden="true"></span>
										</a>
									</div>
								</div>
								<div class="col-md-6 agile_tv_series_grid_right">
									<p class="fexi_header"><%=m.get("name") %></p>
									<p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span> 720p,Bluray HD Free Movie
									 Downloads, Watch Free Movies Online with high speed Free Movie Streaming | MyDownloadTube Lorraine and Ed Warren
									  go to north London to help a single...</p>
									<p class="fexi_header_para"><span>发行时间<label>:</label></span><%=m.get("creat_time") %></p>
									<p class="fexi_header_para">
										<span><label>:</label> </span>
										<a href="genres.html">Drama</a> | 
										<a href="genres.html">Adventure</a> | 
										<a href="genres.html">Family</a>								
									</p>
									<p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
										<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
									</p>
								</div>
								<div class="clearfix"> </div>
								<%
								}%>
								
								
								<div class="agileinfo_flexislider_grids">
								
									<!--  <div class="col-md-2 w3l-movie-gride-agile">
										<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m22.jpg" title="album-name" class="img-responsive" alt=" " />
											<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
										</a>
										<div class="mid-1 agileits_w3layouts_mid_1_home">
											<div class="w3l-movie-text">
												<h6><a href="single.html">Assassin's Creed 3</a></h6>							
											</div>
											<div class="mid-2 agile_mid_2_home">
												<p>2016</p>
												<div class="block-stars">
													<ul class="w3l-ratings">
														<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
														<li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
													</ul>
												</div>
												<div class="clearfix"></div>
											</div>
										</div>
										<div class="ribben">
											<p>NEW</p>
										</div>
									</div> -->
									
									<div class="clearfix"> </div>
								</div>
							</div>
						</li>
						
	
					</ul>
				</div>
			</section>
			<!-- flexSlider -->
				<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
				<script defer src="js/jquery.flexslider.js"></script>
				<script type="text/javascript">
				$(window).load(function(){
				  $('.flexslider').flexslider({
					animation: "slide",
					start: function(slider){
					  $('body').removeClass('loading');
					}
				  });
				});
			  </script>
			<!-- //flexSlider -->
		</div>
	</div> --%>
	
	
	
	<!-- pop-up-box -->  
	<script src="<%=path %>/front/js/jquery.magnific-popup.js" type="text/javascript"></script>
	<!--//pop-up-box -->
	<div id="small-dialog" class="mfp-hide">
		<!---<iframe src="https://player.vimeo.com/video/164819130?title=0&byline=0"></iframe>--->
	</div>
	<div id="small-dialog1" class="mfp-hide">
		<!---<iframe src="https://player.vimeo.com/video/148284736"></iframe>--->
	</div>
	<div id="small-dialog2" class="mfp-hide">
		<!---<iframe src="https://player.vimeo.com/video/165197924?color=ffffff&title=0&byline=0&portrait=0"></iframe>--->
	</div>
	<script>
		$(document).ready(function() {
		$('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
			type: 'inline',
			fixedContentPos: false,
			fixedBgPos: true,
			overflowY: 'auto',
			closeBtnInside: true,
			preloader: false,
			midClick: true,
			removalDelay: 300,
			mainClass: 'my-mfp-zoom-in'
		});
																		
		});
	</script>
<!-- //Latest-tv-series -->

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
