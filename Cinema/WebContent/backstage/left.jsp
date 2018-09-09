<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
   
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
	Object account=session.getAttribute("userAcc");
	%>
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
<!-- <link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
 --><!---//webfonts--->  

<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
             <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.jsp">OneOne</a>
            </div>
            
            <ul class="nav navbar-nav navbar-right">
            	<li style="color:white;margin-top: 20px;">你好 ${sessionScope.userAcc.account }
            	</li>
            </ul>
            <!--/.navbar-header-->
            <ul class="nav navbar-nav navbar-right">
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="images/1.png"><span class="badge"></span></a>
	        		<ul class="dropdown-menu">
						<!-- <li class="dropdown-menu-header text-center">
							<strong>Account</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
						<li><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>  -->
						 <li class="dropdown-menu-header text-center">
							<strong>Settings</strong>
						</li>
						<li class="m_2"><a href="<%=path %>/backstage/userSelf.jsp"><i class="fa fa-user"></i> 个人信息</a></li>
						<!-- <li class="m_2"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
						 <li class="m_2"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
						<li class="divider"></li>
						<li class="m_2"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li> -->
						<li class="m_2"><a href="UserUpdateServlet.do?oper=sessionDel">
						<i class="fa fa-lock"></i> 退出</a></li>	
	        		</ul>
	      		</li>
			</ul> 
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="main.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>主页</a>
                        </li>
                        <li>
                            <a href="<%=path %>/backstage/userSelf.jsp">
                            <i class="fa fa-indent nav_icon"></i>个人中心</a>
                        </li>
                        <c:if test="${sessionScope.userAcc.power>=2}" var="qw">
                      
                        <li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>员工管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="UserQueryServlet.do?oper=list&page=1&status=1">查询</a>
                                </li>
								<li>
                                    <a href="userAdd.jsp">添加</a>
                                </li>
								<li>
                                    <a href="UserQueryServlet.do?oper=list&page=1&status=-1">回收站</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        </c:if>
						<li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>影片管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="MovieQueryServlet.do?oper=list&page=1&status=1">查询</a>
                                </li>
								<li>
                                    <a href="movieAdd.jsp">添加</a>
                                </li>
								<li>
                                    <a href="MovieQueryServlet.do?oper=listPlate&page=1&status=1">宣传板</a>
                                </li>
                                <li>
                                    <a href="MovieQueryServlet.do?oper=listISHot&page=1&status=1">正在热映</a>
                                </li>
                                <li>
                                    <a href="MovieQueryServlet.do?oper=listComingSoon&page=1&status=1">即将上映</a>
                                </li>
                               <!--  <li>
                                    <a href="MovieQueryServlet.do?oper=listCalendar&page=1&status=1">观影月历</a>
                                </li> -->
                                <li>
                                    <a href="MovieQueryServlet.do?oper=list&page=1&status=-1">回收站</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>放映信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ShowMessageQueryServlet.do?oper=list&page=1&status=1">查询</a>
                                </li>
								<li>
                                    <a href="ShowMessageQueryServlet.do?oper=list&page=1&status=-1">回收站</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
						<li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>放映厅管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="HallQueryServlet.do?oper=list&page=1&status=1">查询</a>
                                </li>
								<li>
                                    <a href="HallQueryServlet.do?oper=list&page=1&status=-1">回收站</a>
                                </li>
                            </ul>
                        </li>
                        	<li>
                            <a href="#"><i class="fa fa-indent nav_icon"></i>影评管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="CommentQueryServlet.do?oper=list&page=1&status=1">查询</a>
                                </li>
								<li>
                                    <a href="CommentQueryServlet.do?oper=list&page=1&status=-1">回收站</a>
                                </li>
                            </ul>
                        </li>
						<li>
                            <a href="IndentQueryServlet.do?oper=list&page=1&status=1"><i class="fa fa-indent nav_icon"></i>售票管理</a>
                        </li>
						<li>
                            <a href="CustomerQueryServlet.do?oper=list&page=1"><i class="fa fa-indent nav_icon"></i>消费者管理</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
