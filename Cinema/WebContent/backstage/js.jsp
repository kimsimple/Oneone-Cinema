<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
	%>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%=path %>/backstage/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=path %>/backstage/css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=path %>/backstage/css/font-awesome.css" rel="stylesheet"> 
<link href="<%=path %>/backstage/css/custom.css" rel="stylesheet">
<!-- jQuery -->
<script src="<%=path %>/backstage/js/jquery.min.js"></script> 
<script src="<%=path %>/backstage/js/bootstrap.min.js"></script>
<script src="<%=path %>/backstage/js/metisMenu.min.js"></script>
<script src="<%=path %>/backstage/js/custom.js"></script>
<!----webfonts--->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  

