<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
	String num=request.getParameter("num");
	String description=request.getParameter("description");
	String idE=request.getParameter("idH");
	System.out.println("ide "+idE);
	System.out.println("description "+description);
	System.out.println("num "+num);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
<!---//webfonts--->

<script type="text/javascript">
	function jump(){
		var pageForm = document.getElementById("formHall");
		pageForm.action="HallUpdateServlet.do";
		pageForm.method="post";
		pageForm.submit();
		var dialog=top.dialog.get(window);//获取当前的模态窗口
		//dialog.close();
		//dialog.remove();
		//return false;
	}
	
</script>

<title>Insert title here</title>
</head>

<body>
<div class="graphs">
	<div class="xs">
		<h3>Edit Hall</h3>
		<div class="tab-content">	
			<div class="tab-pane active" id="horizontal-form">
				<form id="formHall" enctype="multipart/form-data"  class="form-horizontal" onsubmit="return jump()">
					<input type="hidden"  name="oper" value="edit" >
					<input type="hidden" id="idE" name="idEEE" class="form-control1"  value="<%=idE %>" >
					<div class="form-group">
						<label for="focusedinput" class="col-sm-2 control-label">座位数:
							</label>
						<div class="col-sm-8">
							<input type="text" name="seat_numE" class="form-control1"  value="<%=num %>" >
						</div>
					</div>
				
					<div class="form-group">
						<label for="focusedinput" class="col-sm-2 control-label">
							大厅描述:</label>
						<div class="col-sm-8">
							<input type="text" name="desprictionE" class="form-control1" value="<%=description %>" >
						</div>
					</div>
					

					
					 <div class="form-group">
					<label for="selector1" class="col-sm-2 control-label">
							上传图片:</label>
						<div class="col-sm-8">
								<input type="file" id="file11" name="file1"> 
						</div>
					</div>
					
					<div class="panel-footer">
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
								<!-- <input class="btn-success btn" type="submit" value="确认添加"/> -->
								<input class="btn-success btn" type="submit" value="确认添加" "> 
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>



