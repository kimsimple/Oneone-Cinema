<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<script type="text/javascript" src="<%=path%>/backstage/js/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		document.getElementById("powerE").value=document.getElementById("selector1").value;
		document.getElementById("statusE").value=document.getElementById("selector2").value;
	});
	
	function updatePaw(){
		var paw=document.getElementById("password").value.trim();
		var pawYuan=document.getElementById("passwordE").value.trim();
		var pawU=document.getElementById("passwordU").value.trim();
		var pawUA=document.getElementById("passwordUA").value.trim();
		if(paw==""){
			alert("请填写原密码");
			return false;
		}
		if(paw!=pawYuan){
			alert("原密码不符");
			return false;
		}
		if(pawU==""){
			alert("请填写新密码");
			return false;
		}
		if(pawUA==""){
			alert("请确认新密码");
			return false;
		}
		if(pawU!=pawUA){
			alert("两次新密码不一致");
			return false;
		}else{
			return true;
		}
	}
</script>
<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Mine</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="UserUpdateServlet.do?oper=edit&where=-1" method="post" class="form-horizontal" >
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">账号:
										</label>
									<div class="col-sm-8">
										<input type="text" name="accountE" class="form-control1" 
											placeholder="账号" value="${sessionScope.userAcc.account}" readonly>
									</div>
								</div>
					
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										姓名:</label>
									<div class="col-sm-8">
										<input type="text" name="nameE" class="form-control1"
											placeholder="姓名" value="${sessionScope.userAcc.name}" >
									</div>
								</div>
								
							<!-- 	<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										密码:</label>
									<div class="col-sm-8">
									</div>
								</div> -->
								<input id="passwordE" type="hidden" name="passwordE" class="form-control1" 
									placeholder="密码" value="${sessionScope.userAcc.password}" readonly>
								<input type="hidden" name="idE" class="form-control1" 
											placeholder="密码" value="${sessionScope.userAcc.id}" readonly>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										电话:</label>
									<div class="col-sm-8">
										<input type="text" name="telE" class="form-control1" 
											placeholder="电话号" value="${sessionScope.userAcc.tel}">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										身份证:</label>
									<div class="col-sm-8">
										<input type="text" name="IDCardE" class="form-control1" 
											placeholder="身份证号" value="${sessionScope.userAcc.IDCard}" readonly>
									</div>
								</div>
								

								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label" >
										权限:</label>
									<div class="col-sm-8">
										<select name="powerE1" id="selector1" class="form-control1" disabled onChange="setDefault()">
											<option value="1" ${sessionScope.userAcc.power eq 1 ?'selected':''}>普通员工</option>
											<option value="2" ${sessionScope.userAcc.power eq 2 ?'selected':''}>管理员</option>
											<option value="3" ${sessionScope.userAcc.power eq 3 ?'selected':''}>超级管理员</option>
										</select>
									</div>
								</div>
								<input id="powerE" type="hidden" name="powerE">
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										状态:</label>
									<div class="col-sm-8">
										<select name="statusE1" id="selector2" class="form-control1" disabled>
											<option value="1" ${sessionScope.userAcc.status eq 1 ?'selected':''}>在职</option>
											<option value="2" ${sessionScope.userAcc.status eq -1 ?'selected':''}>离职</option>									
										</select>
									</div>
								</div>
								<input id="statusE" type="hidden" name="statusE">
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="确认修改"/>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
					
				
				<div class="xs">
					<h3>Change Password</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form action="UserUpdateServlet.do?oper=editPas" method="post" class="form-horizontal" onsubmit="return updatePaw()" >
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">原始密码:
										</label>
									<div class="col-sm-8">
										<input type="text" id="password" name="password" class="form-control1" 
											placeholder="原始密码" value="" >
									</div>
								</div>
					
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										新密码:</label>
									<div class="col-sm-8">
										<input type="password" id="passwordU" name="passwordU" class="form-control1"
											placeholder="新密码" value="" >
									</div>
								</div>

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										再次确认:</label>
									<div class="col-sm-8">
										<input type="password" id="passwordUA" name="passwordUA" class="form-control1" 
											placeholder="再次确认" value="">
									</div>
								</div>
								
								<input type="hidden" name="idE" class="form-control1" 
											placeholder="密码" value="${sessionScope.userAcc.id }" readonly>

			
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="确认修改"/>
										</div>
									</div>
								</div>
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
	<link href="<%=path %>/backstage/css/custom.css" rel="stylesheet">
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=path %>/backstage/js/metisMenu.min.js"></script>
	<script src="<%=path %>/backstage/js/custom.js"></script>
	
</body>
</html>



