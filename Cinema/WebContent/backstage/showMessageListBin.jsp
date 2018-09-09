<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Basic_tables</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link
	href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900'
	rel='stylesheet' type='text/css'>
<!---//webfonts--->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- 引入 artDialog -->
<script src="artDialog/lib/jquery-1.10.2.js"></script>
<script src="artDialog/dist/dialog-min.js"></script>
<link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<script src="artDialog/dist/dialog-plus.js"></script>


<script type="text/javascript">
	$(function() {
		var classColor = new Array("active", "success", "info", "warning","danger");
		var a = document.getElementById("tableColor");
		var b = a.getElementsByTagName("tr");
		var len = b.length;
		var num = 1;
		for (var i = 1; i <= len; i++) {
			if (i % 2 == 0) {

			} else if(i%2!=0){
				if (num == 1) {
					document.getElementById(i).className = classColor[0];
				} else if (num == 2) {
					document.getElementById(i).className = classColor[1];
				} else if (num == 3) {
					document.getElementById(i).className = classColor[2];
				} else if (num == 4) {
					document.getElementById(i).className = classColor[3];
				} else if (num == 5) {
					document.getElementById(i).className = classColor[4];
					num = 0;
				}
				num++;
			}
		}
		
		

		for(var i=1;i<=len;i++){
			var a=$("#"+'mov'+i).html();
			if(a.length>70){
			$("#"+i+'-').html(a.substr(0,3)+"...")
			}
		}
	});
	
	function search() {
		var pageForm = document.getElementById("searchForm");
		//document.getElementById("pages").value=pages;
		pageForm.action="UserQueryServlet.do?oper=list";
		pageForm.method="post";
		pageForm.submit();
	}

	
	
	
	function del(){
		/* var d = dialog({
		    title: 'message',
		    content: '<input autofocus />'
		});
		d.showModal(); */
		var d = dialog({
		    title: '提示',
		    content: '确认删除吗？',
		    okValue: '确定',
		    position: 'fixed',
		    width:'200px',
		    height:'100px',
		    ok: function () {
		        this.title('提交中…');
		        return false;
		    },
		    cancelValue: '取消',
		    cancel: function () {
		    	
		    }
		});
		//setElementCoordinate(d);
		d.show();
	}

</script>
</head>
<body>
	<div id="wrapper">
	
		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>放映信息表</h3>
					<!--彩色表格-->
					<div id="tableColor" class="bs-example4" data-example-id="contextual-table">
						<div style="margin-bottom: 10px;">
							<form id="searchForm">
									<div class="form-group">
										<div class="row">
											<div class="col-md-2 grid_box1">
										<%String p=request.getAttribute("power1")==null?"":request.getAttribute("power1").toString();
											String p1="";	
											if(p.equals("1")){
												p1="普通员工";
											}else if(p.equals("2")){
												p1="管理员";
											}else if(p.equals("3")){
												p1="超级管理员";
											}
										%>
										<input type="hidden" name="status" value="1" id="status1">
											<input type="text" class="form-control1" placeholder="账号" name="account" value="${account1 }">
											</div>
											<div class="col-md-2 grid_box1">
												<input type="text" class="form-control1" placeholder="姓名" name="name" value="${name1 }">
											</div>
											<div class="col-md-3 grid_box1">
												<input type="text" class="form-control1" placeholder="身份证号" name="IDCard" value="${IDCard1 }">
											</div>
												<div  class="col-md-2 grid_box1">
													<select name="power" class="form-control1">
														<option  value="1" selected>普通员工</option>
														<option  value="2" <%=p.equals("2")?"selected":false %>>管理员</option>
														<option  value="3" <%=p.equals("3")?"selected":false %>>超级管理员</option>
													</select>
												</div>
												
											<button type="button" class="btn btn-primary" onclick="search()">查找</button>
											<div class="clearfix"> </div>
										</div>
									</div>
							</form>
						</div>
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>影片名称</th>
									<th>语言</th>
									<th>放映时间</th>
									<th>片长</th>
									<th>地点</th>
									<th>票价</th>
									<th>操作</th> 
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="sm" varStatus="vs">
									<tr id="${vs.count }">
										<th scope="row">${vs.count+15*(pages-1) }</th>
										<td>${sm.name }</td>
										<td>${sm.language }</td>
										<td>${sm.start_time }</td>
										<td>${sm.time }</td>
										<td>${sm.hall_id }</td>
										<td>${sm.price }</td>
										<%-- <td>
										 <span id="${stu.id }" style="float:left;">${sm.description }</span>
										 <a href="MovieQueryServlet.do?oper=query&id=${sm.id }"  style="float:right;" class="tablelink">
										 	查看详情
										 </a>
										</td> --%>
										<%-- <td>
											${stu.description }
										</td> --%>
										 <td>
										 	 <a href="ShowMessageQueryServlet.do?oper=query&idE=${sm.idM }" >
										 	编辑
										 	</a>
											<!-- <a href="#!"  class="secondary-content">删除</a> -->
										</td> 
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<jsp:include page="page.jsp" />
					</div>
				</div>
				
				<jsp:include page="bottom.jsp" />
				
			</div>
		</div>
	</div>
	
	<!-- Nav CSS -->
	<link href="css/custom.css" rel="stylesheet">
	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
