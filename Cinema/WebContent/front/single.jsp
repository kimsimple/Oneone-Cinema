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
<link href="<%=path %>/front/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=path %>/front/js/owl.carousel.js"></script>
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
<script src="<%=path %>/front/js/simplePlayer.js"></script>
<script>
	$("document").ready(function() {
		$("#video").simplePlayer();
	});
</script>



<!-- 视频播放器 -->
<!-- 引用video-js.css样式文件和video.js -->
<link href="<%=path %>/front/css/video-js.css" rel="stylesheet" type="text/css">
<script src="<%=path %>/front/js/video.js"></script>

<!-- 设置flash路径，Video.js会在不支持html5的浏览中使用flash播放视频文件-->
<script>
    videojs.options.flash.swf = "video-js.swf";
</script>

<!-- 引入 artDialog -->
<script src="<%=path %>/front/artDialog/lib/jquery-1.10.2.js"></script>
<script src="<%=path %>/front/artDialog/dist/dialog-min.js"></script>
<!-- <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script> -->
<link href="<%=path %>/backstage/artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/backstage/artDialog/dist/dialog-plus.js"></script>

<script type="text/javascript">
//模态窗口
function add(){
	var addDialog=top.dialog({
		title:'精彩片段',
		url:"<%=path%>/front/video.jsp",
		fixed:true,
		width:700,
		height:400,
		onclose:function(){
			window.location.href=window.location.href;
			//刷新页面
		}
	});
	addDialog.showModal();
}

</script>

<!-- 打分星星 -->
<script type="text/javascript">
onload=function f(){
var GradList = document.getElementById("QuacorGrading").getElementsByTagName("input");

for(var di=0;di<parseInt(document.getElementById("QuacorGradingValue").getElementsByTagName("font")[0].innerHTML);di++){
	GradList[di].style.backgroundPosition = 'left center';
}

for(var i=0;i < GradList.length;i++){
	GradList[i].onmouseover = function(){
		for(var Qi=0;Qi<GradList.length;Qi++){
			GradList[Qi].style.backgroundPosition = 'right center';
		}
		for(var Qii=0;Qii<this.name;Qii++){
			GradList[Qii].style.backgroundPosition = 'left center';
		}
		document.getElementById("QuacorGradingValue").innerHTML = '<b><font size="5" id="score" color="#fd7d28">'+this.name+'</font></b>分';
	}
}
}
</script>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
img{vertical-align:middle;}
#QuacorGrading input{background:url(<%=path%>/front/images/grading.png) no-repeat scroll right center;cursor:pointer;height:30px;width:30px;padding:0;border:0;}
</style>

<script type="text/javascript">
	$(function(){
		var cus=document.getElementById("cus").value;
		var send=document.getElementById("send");
		if(cus==NaN||cus==""){
			send.disabled = true;
		}
	});
	
	function comment(){
		var com=document.getElementById("comment1111").innerHTML;
		$("#scoreA").val($("#score").html());
		//alert(com);
		//alert($("#scoreA").val());
		/* if(com==""){
			alert("评论不能为空");
			return false;
		} */
		
	} 
</script>

</head>
	
<body>
	<jsp:include page="top.jsp" />
	
<div class="single-page-agile-main">
<div class="container">
			<div class="agileits-single-top">
				<ol class="breadcrumb">
				  <li><a href="<%=path %>/front/index.jsp">Home</a></li>
				  <li class="active">Single</li>
				</ol>
			</div>
			<div class="single-page-agile-info" >
             	<div class="show-top-grids-w3lagile" >
					<div class="col-sm-8 single-left" style="width:100%;height:80%;">
					<div class="song" >
						<div class="song-info">
							<h3><span style="color:green;">${movie.name }</span></h3>	
						</div>
						<!-- <div id="play"></div> -->
						<div class="video-grid-single-page-agileits"  >
							<a class="w3_play_icon" >
								<span id="play"  aria-hidden="false" onclick="add()"></span>
								<img src="/uploadPlate/${movie.platepicture }" alt="" 
								class="img-responsive" style="width:100%;height:20%;"/> 
							</a>
							<!-- 
							YouTube 嵌入网页
							<div data-video="dLmKio67pVQ" id="video"> -->
								<!-- <div class=" agile_tv_series_grid_left">
									<div class="w3ls_market_video_grid1">
									</div>
								</div> --> 
								<!-- 
								腾讯视频嵌入
								<iframe class="video_iframe" style=" z-index:1; " 
								src="http://v.qq.com/iframe/player.html?vid=k0015trfczz&amp;width=300&amp;height=200&amp;auto=0" 
								allowfullscreen="" frameborder="0" height="200" width="300"></iframe> -->
							<!-- </div> -->
							
						</div>
					</div>
					
				<!-- 灰色背景 -->
				<div class="grid_3 grid_5 agile">
				<h3></h3>
				<div class="well">
					上映日期: ${movie.creat_time }<br>
					导演: ${movie.director }<br>
					主演: ${movie.actor }<br>
					类型: ${movie.style }<br>
					语言: ${movie.language }<br>
					片长: ${movie.time }<br>
					影片剧情: ${txt }<br>
					<a href="<%=path %>/front/ShowMessageFrontQueryServlet.do?oper=listSchedule">
					<input type="button" value="购票" class="btn btn-primary">
					</a>
				</div>
				</div>
			
				 <!-- 彩色背景 ---->
			<!-- 	<div class="grid_3 grid_5 w3ls">
				<h3>Alerts</h3>
					<div class="alert alert-success" role="alert">
						<strong>Well done!</strong> You successfully read this important alert message.
					</div>
					<div class="alert alert-info" role="alert">
						<strong>Heads up!</strong> This alert needs your attention, but it's not super important.
					</div>
					<div class="alert alert-warning" role="alert">
						<strong>Warning!</strong> Best check yo self, you're not looking too good.
					</div>
					<div class="alert alert-danger" role="alert">
						<strong>Oh snap!</strong> Change a few things up and try submitting again.
					</div>
				</div> -->
			
				<div class="all-comments">
					<div class="all-comments-info">
						<a href="#">评论</a><span style="color:green;">平均分:${average }(不代表官方)</span>
						<div class="agile-info-wthree-box">
							<form action="<%=path %>/front/CommentUpdateServlet.do?oper=add" method="post" onsubmit="return comment()">
								<input type="hidden" id="scoreA" name="scoreA">
								<input type="hidden" id="cus" name="idCA" value="${sessionScope.cusSession.idC}">
								<input type="hidden" id="movie_idA" name="movie_idA" value="${movie.id }">
								<div id="QuacorGrading">
									<strong>评分</strong>
									<input name="1" type="button" />
									<input name="2" type="button" />
									<input name="3" type="button" />
									<input name="4" type="button" />
									<input name="5" type="button" />
									<input name="6" type="button" />
									<input name="7" type="button" />
									<input name="8" type="button" />
									<input name="9" type="button" />
									<input name="10" type="button" />
									<span id="QuacorGradingValue"><b><font id="score" size="5" color="#fd7d28">6</font></b>分</span>
								</div>								
								<textarea id="comment1111" name="commentA" placeholder="Message" required=""></textarea>
								<input id="send" type="submit" value="发表" class="btn btn-primary">
								<div class="clearfix"> </div>
							</form>
						</div>
					</div>
					<div class="media-grids" >
					<c:forEach items="${comment1 }" var="comment11" varStatus="vs">
					<c:if test="${vs.count==0 }" var="qw">
						<div class="media"  style="border:1px solid #000;width:50%;margin-top: 0px;margin-top: 0px;">
							<h5>${comment11.nameC==null?comment11.telC:comment11.nameC }</h5>
							<div class="media-left">
								<a href="#">
									<img src="images/user.jpg" title="One movies" alt=" " />
								</a>
							</div>
							<div class="media-body" >
								<p>${comment11.comment1 }</p>
								<span>7788<a href="#"> Admin </a></span>
							</div>
						</div>
					</c:if>
					<c:if test="${!qw }">
						<div class="media" >
							<h5>${comment11.nameC==null?comment11.telC:comment11.nameC }</h5>
							<div class="media-left">
								<a href="#">
									<img src="images/user.jpg" title="One movies" alt=" " />
								</a>
							</div>
							<div class="media-body">
								<p>${comment11.comment1 }</p>
							</div>
						</div>
					</c:if>
					</c:forEach>
					</div>
				</div>
				
				</div>
			</div>
		</div>	
	</div>
</div>	
								
				<div class="clearfix"> </div>
			</div>
				<!-- 热门-->
			<div class="w3_agile_banner_bottom_grid">
				<div id="owl-demo" class="owl-carousel owl-theme">
			<!-- 		<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m10.jpg" title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="single.html">Don't Think Twice</a></h6>							
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
						</div>
					</div> -->
			<!-- 		<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m17.jpg" title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="single.html">Peter</a></h6>							
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
					<!-- <div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
							<a href="single.html" class="hvr-shutter-out-horizontal"><img src="images/m15.jpg" title="album-name" class="img-responsive" alt=" " />
								<div class="w3l-action-icon"><i class="fa fa-play-circle" aria-hidden="true"></i></div>
							</a>
							<div class="mid-1 agileits_w3layouts_mid_1_home">
								<div class="w3l-movie-text">
									<h6><a href="single.html">God’s Compass</a></h6>							
								</div>
								<div class="mid-2 agile_mid_2_home">
									<p>2016</p>
									<div class="block-stars">
										<ul class="w3l-ratings">
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
											<li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
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
						
		<jsp:include page="footer.jsp" />					 

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
</body>
</html>
