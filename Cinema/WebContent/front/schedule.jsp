<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>schedule</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="<%=path %>/front/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=path %>/front/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="<%=path %>/front/css/faqstyle.css" type="text/css" media="all" />
<link href="<%=path %>/front/css/medile.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/front/css/single.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="<%=path %>/front/css/contactstyle.css" type="text/css" media="all" />
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
	
<%-- 	$(function() {
		var buy=document.getElementsByName("buy");
		var cus=document.getElementById("cus").value;
		//alert(cus);
		var len=buy.length;
		if(cus!=""){
			//alert(cus);
			$("#a").attr("href","<%=path %>/front/HallQueryServlet.do?oper=querySeat&idM=${mov.idM}");
		}
	}); --%>
	function aaa(idM){
		var cus=document.getElementById("cus").value;
		
		if(cus==""){
			alert('请登录');
		}
		else{
			window.location.href="<%=path %>/front/HallQueryServlet.do?oper=querySeat&idM="+idM;
		}
	}
</script>

</head>
	
<body>

	<input type="hidden" id="cus" value="${sessionScope.cusSession.idC}">
	<jsp:include page="top2.jsp" />
	
	<div style="width:80%;margin:0 auto;">
		<div class="page-header">
			<h3 class="bars"></h3>
		</div>
		<h4 class="typoh2">今日上映  ${today } </h4>
		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>放映时间</th>
						<th>电影</th>
						<th>大厅号</th>
						<th>语言</th>
						<th>片长</th>
						<th>网购价</th>
						<th>购票</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listToday!=null&&listToday.size()>0 }" var="qw">
						<c:forEach items="${listToday }" var="mov" varStatus="vs">
							<tr>
								<td>${mov.start_time }</td>
								<td>${mov.name }</td>
								<td>${mov.hall_id }</td>
								<td>${mov.language }</td>
								<td>${mov.time }</td>
								<td>${mov.price }</td>
								<td>
									<input name="buy" type="button" value="购票"  onclick="aaa(${mov.idM})" class="btn btn-primary">
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${!qw }">
						<tr>
							<td colspan="7" style="text-align: center;">
								暂无信息
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<br><br>
		<h4 class="typoh2">明日上映  ${tomorrow } </h4>
		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>放映时间</th>
						<th>电影</th>
						<th>大厅号</th>
						<th>语言</th>
						<th>片长</th>
						<th>网购价</th>
						<th>购票</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${listTomorrow!=null&&listTomorrow.size()>0 }" var="qw">
					<c:forEach items="${listTomorrow }" var="mov" varStatus="vs">
						<tr>
							<td>${mov.start_time }</td>
							<td>${mov.name }</td>
							<td>${mov.hall_id }</td>
							<td>${mov.language }</td>
							<td>${mov.time }</td>
							<td>${mov.price }</td>
							<td>
								<input name="buy" type="button" value="购票" onclick="aaa(${mov.idM})" class="btn btn-primary">
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${!qw }">
						<tr>
							<td colspan="7" style="text-align: center;">
								暂无信息
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		
		<br><br>
		<h4 class="typoh2">预售  ${acquired } </h4>
		<div class="bs-docs-example">
			<table class="table">
				<thead>
					<tr>
						<th>放映时间</th>
						<th>电影</th>
						<th>大厅号</th>
						<!-- <th>影厅空位</th> -->
						<th>语言</th>
						<th>片长</th>
						<th>网购价</th>
						<th>购票</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${listAcquired1!=null&&listAcquired1.size()>0 }" var="qw">
					<c:forEach items="${listAcquired1 }" var="mov" varStatus="vs">
						<tr>
							<td>${mov.start_time }</td>
							<td>${mov.name }</td>
							<td>${mov.hall_id }</td>
							<%-- <td>${mov.language }</td> --%>
							<td>${mov.language }</td>
							<td>${mov.time }</td>
							<td>${mov.price }</td>
							<td>
								<input name="buy" type="button" value="购票" class="btn btn-primary" onclick="aaa(${mov.idM})">
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${!qw }">
					<tr>
						<td colspan="7" style="text-align: center;">
							暂无信息
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
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
<!-- //here ends scrolling icon -->
</body>
</html>
