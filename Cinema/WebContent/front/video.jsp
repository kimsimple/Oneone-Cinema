<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>    
<video style="width:100%;height:80%;" controls>
	<source src="<%=path %>/front/video/GreatWall.mp4" type='video/mp4' />
 	<source src="<%=path %>/front/video/movie.mp4"  type="video/mp4">
 	<source src="movie.ogg"  type="video/ogg">
 	您的浏览器不支持 HTML5 video 标签。
</video>
