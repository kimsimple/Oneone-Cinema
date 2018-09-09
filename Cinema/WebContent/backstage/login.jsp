<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		pageContext.setAttribute("path", path);
		pageContext.setAttribute("basePath", basePath);
    	String pat=request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<meta charset="utf-8">
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>登录界面</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="<%=path %>/backstage/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=path %>/backstage/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=path %>/backstage/assets/css/form-elements.css">
        <link rel="stylesheet" href="<%=path %>/backstage/assets/css/style.css">

        <!-- Favicon and touch icons -->
        <link rel="shortcut icon" href="<%=path %>/backstage/assets/ico/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=path %>/backstage/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=path %>/backstage/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=path %>/backstage/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="<%=path %>/backstage/assets/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css">
	#wrap{width:960px; margin:0 auto;}
	#container{width:500px;margin:0 auto;}
	#header{background-color:orange;text-align:center;}
	#content{height:375px; background-color:AntiqueWhite;text-valign:middle;text-align:center; }
	#footer{background-color:orange;clear:both;text-align:center;}
	</style>
	
	<!-- JS验证 -->
<script type="text/javascript" charset="utf-8" src="<%=pat %>/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=pat %>/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="<%=pat %>/ueditor/lang/zh-cn/zh-cn.js"></script>

<!-- JS验证end -->
 <style type="text/css">  
            #code  
            {  
                font-family:Arial;  
                font-style:italic;  
                font-weight:bold;  
                border:0;  
                letter-spacing:2px;  
                color:blue;  
            }  
        </style>  
        <script type = "text/javascript" src = "checkCode.js">  
        </script> 
<!-- <script type="text/javascript">        
        var code ; //在全局定义验证码   
/* //产生验证码 */  
window.onload = function createCode(){  
     code = "";   
     var codeLength = 4;//验证码的长度  
     var checkCode = document.getElementById("code");   
     var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
     'S','T','U','V','W','X','Y','Z');//随机数  
     for(var i = 0; i < codeLength; i++) {//循环操作  
        var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
        code += random[index];//根据索引取得随机数加到code上  
    }  
    checkCode.value = code;//把code值赋给验证码  
}  
//校验验证码  
function validate(){  
    var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写        
    if(inputCode.length <= 0) { //若输入的验证码长度为0  
        alert("请输入验证码！"); //则弹出请输入验证码  
    }         
    else if(inputCode != code ) { //若输入的验证码与产生的验证码不一致时  
        alert("验证码输入错误！@_@"); //则弹出验证码输入错误  
        createCode();//刷新验证码  
        document.getElementById("input").value = "";//清空文本框  
    }         
    else { //输入正确时  
        alert("^-^"); //弹出^-^  
    }             
}  
</script> -->
<script type="text/javascript"> 

/* 生成验证码 */
 var code ; //在全局 定义验证码
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
/* 校验验证码  */
function validate () {
var inputCode = document.getElementById("input1").value.toUpperCase();//取得输入的验证码并转化为大写 
var account = document.getElementById("account").value;
var password = document.getElementById("password").value;
	
	if(account==""){
		alert("请填写账号");
		return false;
	}
	if(password==""){
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
	   document.getElementById("input1").value = "";//清空文本框   
	   return false;
	 }
	 else {
	    return true;
	 }
 } 
 </script>
 
 
</head>
<body onload="createCode()">
<%
	
	String message="";//账号为空时
	if(request.getParameter("message")!=null){		
		message=new String(request.getParameter("message"));
	}

	String account="";//账号不为空时保存账号
	if(request.getParameter("account")!=null){
		account=new String(request.getParameter("account"));
	}
%>
 <!-- Top content -->
      <div class="top-content">       	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1 style="font-family:楷体; font-size:50px;">OneOne影院</h1>
                            <div class="description">
                            	<p style="font-family:楷体; font-size:25px;">
									
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>登录~</h3>                           		
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>                      
                            <div class="form-bottom">
			                    <form role="form" action="<%=path %>/backstage/LoginServlet.do" method="post" class="login-form" onsubmit="return validate ()">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-account">账号</label>
			                        	<input type="text" id="account" name="account"  value="<%=account%>"placeholder="账号" class="form-username form-control" id="form-username" maxLength="12">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">密码</label>
			                        	<input type="password" id="password" name="password"  placeholder="密码" class="form-password form-control" id="form-password" maxLength="16">
			                        </div>
			                    	<div class="form-group">
			                        	<label class="sr-only" for="form-password">验证码</label>
			                        	<input type="text" id = "input1" name="input1"  placeholder="验证码"   maxLength="16" style="width:80%;">
			                        	<input type = "button" id="checkCode" onclick="createCode()" style="width:80px;hight:100%;"/>  
			                        </div>	
			                        <button type="submit" class="btn" onclick = "userLogin()">登录</button>
			                        <span style="color:red; font-family:楷体;"><a href="">忘记密码？</a></span><!-- 输出方式2-->
			 					<span style="color:red; font-family:楷体;">${message }</span><!-- 输出方式2 -->
			                     
			                    </form>			                    
		                    </div>		                    
                        </div>
                    </div>
                  </div>
                </div>
            </div>           
        </div>       
        <!-- Javascript -->
        <script src="<%=path %>/backstage/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%=path %>/backstage/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=path %>/backstage/assets/js/jquery.backstretch.min.js"></script>
        <script src="<%=path %>/backstage/assets/js/scripts.js"></script>
      
    </body>
</html>
