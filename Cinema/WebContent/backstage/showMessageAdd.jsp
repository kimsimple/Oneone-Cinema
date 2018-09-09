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
<link href="css/datepicker.css" rel='stylesheet' type='text/css' />

    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
     <!--   日期时间框控件  -->
<script type="text/javascript" src="<%=path %>/backstage/jedate/jedate.js"></script>
    
<title>Insert title here</title>
</head>

<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Add Movie Show Message</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="ShowMessageUpdateServlet.do?oper=add" method="post" class="form-horizontal" >
								
								<input type="hidden" name="movie_idA" class="form-control1"  value="${movie_id }">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">影片名称:
										</label>
									<div class="col-sm-8">
										<input type="text" name="nameA" class="form-control1" 
											placeholder="名称" disabled value="${movie_name }">
									</div>
									<a href="MovieQueryServlet.do?oper=query&id=${movie_id }">影片详细信息</a>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										放映厅:</label>
									<div class="col-sm-8">
										<select name="hall_idA" class="form-control1">
											<c:forEach items="${listHall }" var="hall" varStatus="vs">
											<option value="${hall.idH }" >${hall.idH }</option>
											</c:forEach>
										</select>
										<!-- <input type="text" name="hall_idA" class="form-control1" 
											placeholder="放映厅" value=""> -->
									</div>
								</div>

								<div class="form-group">
								<label for="focusedinput" class="col-sm-2 control-label">
										开始时间:</label>
								<div class="col-sm-8">
										<input class="datainp" id="indate" type="hidden" placeholder="只显示年月" value=""  readonly>
										<input class="datainp" id="datebut" type="hidden" placeholder="请选择"  readonly><input type="hidden" onClick="jeDate({dateCell:'#datebut',isTime:true,format:'YYYY-MM-DD hh:mm:ss'})" value="打开">
										<input name="start_timeA"  class="datainp form-control1" id="dateinfo" type="text" placeholder="开始时间"  readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										票价:</label>
									<div class="col-sm-8">
										 <input type="text" name="priceA" class="form-control1" 
											placeholder="票价" value="">
									</div>
								</div>
								
							<!-- 	<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										共售票:</label>
									<div class="col-sm-8">
										 <input type="text" name="start_timeE" class="form-control1" 
											placeholder="正在统计" value="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										评分:</label>
									<div class="col-sm-8">
										 <input type="text" name="start_timeE" class="form-control1" 
											placeholder="正在统计" value="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										评论:</label>
									<div class="col-sm-8">
										 <input type="text" name="start_timeE" class="form-control1" 
											placeholder="正在统计" value="">
									</div>
								</div> -->
								
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										备注:</label>
									<div class="col-sm-8">
										 <textarea name="remarksA" rows="4" class="form-control1 control2">
										 </textarea>
									</div>
								</div>

								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										状态:</label>
									<div class="col-sm-8">
										<select name="statusA" id="selector1" class="form-control1">
											<option value="1" >在发布</option>
											<option value="-1" >未发布</option>									
										</select>
									</div>
								</div>
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="保存"/>
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
	
	<script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });

</script>

	<!-- /#wrapper -->
	<!-- Nav CSS -->
	<link href="css/custom.css" rel="stylesheet">
	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>
	<script src="js/custom.js"></script> 
	
	 <script type="text/javascript">
    //jeDate.skin('gray');
	jeDate({
		dateCell:"#indate",//isinitVal:true,
		format:"YYYY-MM",
		isTime:false, //isClear:false,
		minDate:"2015-10-19 00:00:00",
		//maxDate:"2016-11-8 00:00:00"
	})
    jeDate({
		dateCell:"#dateinfo",
		format:"YYYY-MM-DD hh:mm:ss",
		//isinitVal:true,
		isTime:true, //isClear:false,
		minDate:"2014-09-19 00:00:00",
	})
</script> 
</body>
</html>



