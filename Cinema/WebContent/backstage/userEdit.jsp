<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function edit(){
		var account=$("#accountA").val().trim();
		var name=$("#nameA").val().trim();
		var password=$("#passwordA").val().trim();
		var tel=$("#telA").val().trim();
		var IDCard=$("#IDCardA").val().trim();
		if(account==""){
			alert('账号不能为空');
			return false;
		}
		if(name==""){
			alert('姓名不能为空');
			return false;
		}
		if(password==""){
			alert('密码不能为空');
			return false;
		}
		if(tel==""){
			alert('电话不能为空');
			return false;
		}
		if(IDCard==""){
			alert('身份证不能为空');
			return false;
		}
	}
</script>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Edit Guy</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="UserUpdateServlet.do?oper=edit" method="post" class="form-horizontal" onsubmit="return edit()">
								<c:forEach items="${list }" var="user" varStatus="vs">
								
								<input type="hidden"  name="idE" class="form-control1"  value="${user.id }">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">账号:
										</label>
									<div class="col-sm-8">
										<input type="text" id="accountA" name="accountE" class="form-control1" 
											placeholder="账号" value="${user.account }" disabled>
									</div>
								</div>
					
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										姓名:</label>
									<div class="col-sm-8">
										<input type="text" id="nameA" name="nameE" class="form-control1"
											placeholder="姓名" value="${user.name }">
									</div>
								</div>
								
								<%-- <div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										密码:</label>
									<div class="col-sm-8">
										<input type="text" id="passwordA" name="passwordE" class="form-control1" 
											placeholder="密码" value="${user.password }">
									</div>
								</div> --%>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										电话:</label>
									<div class="col-sm-8">
										<input type="text" id="telA" name="telE" class="form-control1" 
											placeholder="电话号" value="${user.tel }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										身份证:</label>
									<div class="col-sm-8">
										<input type="text" id="IDCardA" name="IDCardE" class="form-control1" 
											placeholder="身份证号" value="${user.IDCard }">
									</div>
								</div>
	
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										权限:</label>
									<div class="col-sm-8">
										<select name="powerE" id="selector1" class="form-control1">
											<option value="1" ${user.power eq 1 ?'selected':''}>普通员工</option>
											<option value="2" ${user.power eq 2 ?'selected':''}>管理员</option>
											<option value="3" ${user.power eq 3 ?'selected':''}>超级管理员</option>
										</select>
									</div>
								</div>
			
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										状态:</label>
									<div class="col-sm-8">
										<select name="statusE" id="selector1" class="form-control1">
											<option value="1" ${user.status eq 1 ?'selected':''}>在职</option>
											<option value="-1" ${user.status eq -1 ?'selected':''}>离职</option>									
										</select>
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="保存编辑"/>
										</div>
									</div>
								</div>
								</c:forEach>
							</form>
						</div>
					</div>
				</div>

				<jsp:include page="bottom.jsp" />
				
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- Nav CSS -->
	<link href="css/custom.css" rel="stylesheet">
	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>
	<script src="js/custom.js"></script> 
</body>
</html>



