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
</head>
<%List<Map<String,Object>> list=(List<Map<String,Object>>)request.getAttribute("list") ;%>
<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Customer Detail</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="CustomerUpdateServlet.do?oper=edit" method="post" class="form-horizontal" >
								<c:forEach items="${list }" var="customer" varStatus="vs">
								
								<input type="hidden" name="idE" class="form-control1"  value="${customer.idC }">
							<%-- 	<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">账号:
										</label>
									<div class="col-sm-8">
										<input type="text" name="accountE" class="form-control1" 
											placeholder="账号" value="${customer.account }">
									</div>
								</div> --%>
					
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										姓名:</label>
									<div class="col-sm-8">
										<input type="text" name="nameE" class="form-control1"
											placeholder="姓名" value="${customer.nameC }" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										电话:</label>
									<div class="col-sm-8">
										<input type="text" name="telE" class="form-control1" 
											placeholder="电话号" value="${customer.telC }" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										邮箱:</label>
									<div class="col-sm-8">
										<input type="text" name="emailE" class="form-control1" 
											placeholder="邮箱" value="${customer.email }" readonly>
									</div>
								</div>
								
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="保存编辑"/>
										</div>
									</div>
								</div>
								
						<%-- 		<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										身份证:</label>
									<div class="col-sm-8">
										<input type="text" name="IDCardE" class="form-control1" 
											placeholder="身份证号" value="${customer.IDCard }">
									</div>
								</div> --%>
	
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										购票:</label>
									<div class="col-sm-8">
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
			
								<%-- <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										评价:</label>
									<div class="col-sm-8">
										<select name="statusE" id="selector1" class="form-control1">
											<option value="1" ${user.status eq 1 ?'selected':''}>在职</option>
											<option value="2" ${user.status eq 1 ?'selected':''}>离职</option>									
										</select>
									</div>
								</div> --%>
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



