<%@page import="com.shxt.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
	
	Object c=session.getAttribute("cusSession");
	System.out.println("c"+c);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript"> 

/* 生成验证码 */
 var code ; //在全局 定义验证码
 var code1 ; //在全局 定义验证码
function createCode(){ 
	 code = new Array();
	 var codeLength = 4;//验证码的长度
	 var checkCode = document.getElementById("checkCode");
	 checkCode.value = "";
	 
	 var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	 for(var i=0;i<codeLength;i++) {
	    var charIndex = Math.floor(Math.random()*32);
	    code +=selectChar[charIndex];
	 }
	 if(code.length != codeLength){
	    createCode();
	 }
	 checkCode.value = code;
	 setInterval(createCode, 60000);//延时60S刷新
 }
 
 function createCode1(){ 
	 code1 = new Array();
	 var codeLength1 = 4;//验证码的长度
	 var checkCode1 = document.getElementById("checkCode1");
	 checkCode1.value = "";
	 
	 var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	
	 for(var i=0;i<codeLength1;i++) {
	    var charIndex = Math.floor(Math.random()*32);
	    code1 +=selectChar[charIndex];
	 }
	 if(code1.length != codeLength1){
	    createCode1();
	 }
	 checkCode1.value = code1;
	 setInterval(createCode1, 60000);//延时60S刷新
} 

/* 校验验证码  */
function validate () {
var inputCode = document.getElementById("yanzhengI").value.toUpperCase();//取得输入的验证码并转化为大写 
var telI = document.getElementById("telI").value;
var passwordI = document.getElementById("passwordI").value;
	if(telI==""){
		alert("请填写手机号");
		return false;
	}
	if(passwordI==""){
		alert("请输入密码");
		return false;
	}
	if(inputCode.length <=0) {//若输入的验证码长度为0 
	   alert("请输入验证码！");
	   return false;
	 }
	else if(inputCode!=code){//若输入的验证码与产生的验证码不一致时  
	   alert("验证码输入错误！");
	   createCode();//刷新验证码  
	   document.getElementById("yanzhengI").value = "";//清空文本框   
	   return false;
	 }
	 else {
	    return true;
	 }
 } 
 
 
// 校验验证码 
function validate1 () {
var inputCode = document.getElementById("yanzhengS").value.toUpperCase();//取得输入的验证码并转化为大写 
var telS = document.getElementById("telS").value;
var passwordS = document.getElementById("passwordS").value;
var passwordAS = document.getElementById("passwordAS").value;
	
	if(telS==""){
		alert("请填写手机号");
		return false;
	}
	if(passwordS==""){
		alert("请输入密码");
		return false;
	}
	if(passwordAS==""){
		alert("请输入确认密码");
		return false;
	}
	if(passwordS!=passwordAS){
		alert("两次密码不一致");
		return false;
	}
	if(inputCode.length <=0) {//若输入的验证码长度为0 
	   alert("请输入验证码！");
	   return false;
	 }
	else if(inputCode!=code1){//若输入的验证码与产生的验证码不一致时  
	   alert("验证码输入错误！");
	   createCode1();//刷新验证码  
	   document.getElementById("yanzhengS").value = "";//清空文本框   
	   return false;
	 }
	 else {
	    return true;
	 }
 } 
 
	$(function() {
		createCode();
		createCode1();
		document.getElementById("telI").value = "";
		document.getElementById("yanzhengI").value = "";
		document.getElementById("telS").value = "";
		document.getElementById("yanzhengS").value = "";
		document.getElementById("passwordS").value = "";
		document.getElementById("passwordAS").value = ""; 
	});
 
</script>
 
 
</head>


<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3layouts_logo">
				<a href="index.jsp"><font style="color:#CC0000;font-size:50px;">OneOne</font>
				<font style="color:green;font-size:25px;">影院</font><br>
				<!-- <font style="color:#FA5858;font-family:楷体; font-size:15px;">看 见 好 时 光</font> --></a>
			</div>
			<!-- 登录 -->
			<%if(c!=null){ %>
			<div class="w3l_sign_in_register">
				<a href="<%=path %>/front/CustomerQueryFrontServlet.do?oper=queryByIdFront&telC=${sessionScope.cusSession.telC }&password=${sessionScope.cusSession.password }" >用户中心</a> |
				<a href="<%=path %>/backstage/CustomerUpdateServlet.do?oper=sessionDel" >退出</a>
			</div>
			<%}else{ %>
			<div class="w3l_sign_in_register">
				<ul>
					<li><i class="fa fa-phone" aria-hidden="true"></i>TEL 123 345 653</li>
					<li><a href="#" data-toggle="modal" data-target="#myModal">登录/注册</a></li>
				</ul>
			</div>
			<%} %>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //header -->
<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					登录/注册
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<div class="w3_login_module">
							<div class="module form-module">
							  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
								<div class="tooltip">注册 ？点我~</div>
							  </div>
							  <div class="form">
								<h3>登录</h3>
								<form action="<%=path %>/front/CustomerQueryFrontServlet.do?oper=queryFront" method="post" onsubmit="return validate()">
								  <input type="text" id="telI" name="telC" placeholder="手机号" >
								  <input type="password" id="passwordI" name="password" placeholder="密码">
	                        	<input type="text"  id="yanzhengI" name="yanzheng"  placeholder="验证码"   maxLength="16" style="width:70%;float:left;">
	                        	<input type = "button" id="checkCode" onclick="createCode()" style="width:25%;height:40px;float:left; margin-left: 5%;"/>  
								  <input type="submit" value="登录">
								</form>
							  </div>
							   <div class="form">
								<h3>注册</h3>
								<form action="<%=path %>/front/CustomerUpdateFrontServlet.do?oper=add" method="post"  onsubmit="return validate1()">
								  <input type="text" id="telS" name="telS" placeholder="手机号码">
								  <input type="text" id="querenS" name="queren" placeholder="获取手机确认码" >
								  <input type="password" id="passwordS" name="passwordS" placeholder="密码" >
								  <input type="password" id="passwordAS" name="passwordAS" placeholder="确认密码" >
								  <input type="text"  id="yanzhengS" name="yanzhengS"  placeholder="验证码"   maxLength="16" style="width:70%;float:left;">
	                        	<input type = "button" id="checkCode1" onclick="createCode1()" style="width:25%;height:40px;float:left; margin-left: 5%;"/>  
								  <input type="submit" value="注册">
								</form>
							  </div> 
							  <div class="cta"><a href="#">忘记密码</a></div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
		$('.toggle').click(function(){
		  // Switches the Icon
		  $(this).children('i').toggleClass('fa-pencil');
		  // Switches the forms  
		  $('.form').animate({
			height: "toggle",
			'padding-top': 'toggle',
			'padding-bottom': 'toggle',
			opacity: "toggle"
		  }, "slow");
		});
	</script>
<!-- //bootstrap-pop-up -->

<!-- nav -->
	 <div class="movies_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				 <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
					<nav>
						<ul class="nav navbar-nav">
							<li><a href="<%=path %>/front/index.jsp">电影首页</a></li>
							<li class="active" ><a href="<%=path %>/front/ShowMessageFrontQueryServlet.do?oper=listSchedule">电影排期</a></li>
							<li><a href="<%=path %>/front/schedule.jsp">电影社区</a></li>
							<li><a href="<%=path %>/front/schedule.jsp">活动</a></li>
							<li><a href="<%=path %>/front/schedule.jsp">经典影片</a></li>
						</ul>
					</nav> 
				</div>
			</nav>	
		</div> 
	</div>
<!-- //nav -->
</html>