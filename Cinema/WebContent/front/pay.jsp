<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
	
	String indent=new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	String number=request.getParameter("num");
	String seat=request.getParameter("seat");
	String[] seats = seat.split(",");
	String price=request.getParameter("price");
	String showMessage_idA=request.getParameter("showMessage_idA");
	%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%=path %>/backstage/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=path %>/backstage/css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/backstage/css/font-awesome.css" rel="stylesheet"> 
<link href="<%=path %>/backstage/css/custom.css" rel="stylesheet">
<!-- jQuery JS -->
<script src="<%=path %>/backstage/js/jquery.min.js"></script> 
<script src="<%=path %>/backstage/js/bootstrap.min.js"></script>
<script src="<%=path %>/backstage/js/metisMenu.min.js"></script>
<script src="<%=path %>/backstage/js/custom.js"></script>
<!----webfonts--->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->   --%>

<title>pay</title>
<base target="_self"/>
<script type="text/javascript">
function jump(){
	var pageForm = document.getElementById("pay");
	pageForm.action="<%=path %>/front/IndentUpdateServlet.do?oper=add";
	pageForm.method="post";
	pageForm.submit();
	var dialog=top.dialog.get(window);//获取当前的模态窗口
	dialog.close();
	//dialog.remove();
	//return false;
}
</script>
<style type="text/css">
	#left{
		width: 50%;
		height: 100%;
		float:left;
	}
	#right{
		width: 50%;
		height: 100%;
		position: absolute;
		right:0;
		top:7px;
	}
</style>
</head>

<body onUnload="window.dialogArguments.location.reload()">
<%-- 	<div id="wrapper">
		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form" >
						<form action="<%=path %>/front/IndentUpdateServlet.do?oper=add" method="post">
						 <input name="showMessage_idA" type="hidden" value="<%=showMessage_idA%>" readonly>
						<div class="form-group" style="float: left;">
							<label for="focusedinput" class="col-sm-2 control-label">
								 订单号:</label>
							<div class="col-sm-8">
							 <input name="indent" value="<%=indent%>" readonly>
							 </div>
						 </div>
						 <div class="form-group" style="float: left;">
							<label for="focusedinput" class="col-sm-2 control-label">
								 选座数:</label>
								 <div class="col-sm-8">
						  <input name="num" value="<%=number%>" readonly>
						  </div>
						  </div>
						  <div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">
								 总价:</label>
								 <div class="col-sm-8">
						 <input name="price" value="<%=price%>" readonly>
						 </div>
						 </div>
						<div class="form-group">
							<label for="focusedinput" class="col-sm-2 control-label">
								座位:</label>
				  			<div class="col-sm-8">
						  <%
						  int len=seats.length;
						  for(int i=0;i<len;i++) {%>
						  <input name="seat" value="<%=seats[i]%>" readonly>
						  <%} %>
						  </div>
						  </div>
						  <br>
					    <div class="form-group">
						<label for="focusedinput" class="col-sm-2 control-label">
							 请输入支付密码:</label>
								 <div class="col-sm-8">
						 <input name="payPassword" maxlength="6" >
						 </div>
						 </div>
						 
						  <div class="panel-footer">
							<div class="row">
								<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
								<input class="btn-success btn" type="submit" value="确认支付"/>
								</div>
							</div>
						</div>
						</form>
					</div>
					</div>
				</div>
			</div> 
		</div>				
	</div>--%>
	<form  id="pay" onsubmit="return jump()">
		<input type="hidden" name="showMessage_idA" value="<%=showMessage_idA%>" readonly>
		 <input name="customer_idA" type="hidden" value="${sessionScope.cusSession.idC}" readonly>
		<div id="left">
			订单号:<input name="indent" value="<%=indent%>" readonly ><br><br>
			手机号:<input name="cusTel" value="${sessionScope.cusSession.telC}" readonly ><br><br>
			选座数:<input name="num" value="<%=number%>" readonly ><br><br>
			 总价:&nbsp;<input name="price" value="<%=price%>" readonly >
		 </div><br><br>
		<div id="right">
			座位:<br><br>
			  <%
			  int len=seats.length;
			  for(int i=0;i<len;i++) {%>
			  <input name="seat" value="<%=seats[i]%>" readonly ><br><br>
			  <%} %>
			  <br>
				 请输入支付密码:
			 <input name="payPassword" maxlength="6" ><br><br>
			<input class="btn-success btn" type="submit" value="确认支付"/>
			</div>
		</form>
</body>
</html>


