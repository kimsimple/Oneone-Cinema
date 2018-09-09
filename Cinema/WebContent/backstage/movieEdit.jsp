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
<title>Insert title here</title>
<script src="<%=path %>/backstage/js/jquery.js"></script> 
	<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
    
   
<link href="<%=path %>/backstage/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"> 
    <link href="<%=path %>/backstage/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <jsp:include page="js.jsp" />
    <script type="text/javascript">
	    function actorAdd(){
			$("#actorName").clone(false).insertAfter("#actorName");
		}
	     $(function(){
			var ue = UE.getEditor('editor');
		});
    </script>
    
 <!--   日期时间框控件  -->
<script type="text/javascript" src="<%=path %>/backstage/jedate/jedate.js"></script>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Edit Movie</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="MovieUpdateServlet.do?oper=edit"  enctype="multipart/form-data" method="post" class="form-horizontal" >
								<c:forEach items="${list }" var="movie" varStatus="vs">
								
								<input type="hidden" name="idE" class="form-control1"  value="${movie.id }">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">名称:
										</label>
									<div class="col-sm-8">
										<input type="text" name="nameE" class="form-control1" 
											placeholder="名称" value="${movie.name }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										语言:</label>
									<div class="col-sm-8">
										<input type="text" name="languageE" class="form-control1" 
											placeholder="语言" value="${movie.language }">
									</div>
								</div>
								
									<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										上映日期:</label>
									<div class="col-sm-8">
										<input class="datainp" id="indate" type="hidden" placeholder="只显示年月" value=""  readonly>
										<input class="datainp" id="datebut" type="hidden" placeholder="上映时间"  readonly><input type="hidden" onClick="jeDate({dateCell:'#datebut',isTime:true,format:'YYYY-MM-DD hh:mm:ss'})" value="打开">
										<input name="creat_timeE"  class="datainp form-control1" id="dateinfo" type="text" placeholder="请选择" value="${movie.creat_time }" readonly>
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										片长:</label>
									<div class="col-sm-8">
										<input type="text" name="timeE" class="form-control1" 
											placeholder="影片时间" value="${movie.time }">
									</div>
								</div>

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">导演</label>
									<div  class="col-sm-8">
									<input type="text" name="directorE" class="form-control1" 
											placeholder="导演" value="${movie.director }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">主演</label>
									<div  class="col-sm-8 grid_box1">
									<input type="text" name="actorE" class="form-control1" 
											placeholder="主要演员" value="${movie.actor }">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">影片风格:</label>
									<div  class="col-sm-8 grid_box1">
									<input type="text" name="styleE" class="form-control1" 
											placeholder="影片风格" value="${movie.style }">
									</div>
								</div>
								
							<!-- 之前添加演员方法，因太过麻烦而放弃 -->
							<%-- 	<div class="form-group">
									<label class="col-sm-2 control-label">主要演员:</label>
									<div class="col-sm-8">
										<c:if test="${actor!=null&&actor.size()>0  }" var="qw">
										<select multiple="" class="form-control1">
											<c:forEach items="${actor }" var="a" varStatus="vs">
											<option>${a.actor }</option>
											</c:forEach>
										</select>
										</c:if>
										<c:if test="${!qw }">
											该影片尚未添加主要角色
										</c:if>
									<div id="actorAA" class="col-md-2 grid_box1">
										<input id="actorName" name="actorA" type="text" class="form-control1" placeholder="演员" value="${name1 }">
									</div>
									<input id="actorBut" onclick="actorAdd()" type="button" value="添加演员">
									</div>
								</div> --%>
							
								
								<%-- <div class="form-group">
									<label for="checkbox" class="col-sm-2 control-label">影片风格:</label>
									<div class="col-sm-8">
									<c:if test="${style!=null&&style.size()>0 }" var="qw">
										<c:forEach items="${style }" var="s" varStatus="vs">
											<div class="checkbox-inline">
												<label><input name="styleA" ${s.action==1?'checked':'' }value="action" type="checkbox"> 动作</label>
											</div>
											<div class="checkbox-inline">
												<label><input  name="styleA" ${s.adventure==1?'checked':'' } value="adventure"  type="checkbox">冒险</label>
											</div>
											<div class="checkbox-inline">
												<label><input  name="styleA" ${s.comedy==1?'checked':'' } value="comedy" type="checkbox">搞笑</label>
											</div>
											<div class="checkbox-inline">
												<label><input name="styleA"  ${s.crime==1?'checked':'' } value="crime" type="checkbox">犯罪</label>
											</div>
											<div class="checkbox-inline">
												<label><input name="styleA"  ${s.horror==1?'checked':'' } value="horror" type="checkbox">惊悚</label>
											</div>
											<div class="checkbox-inline">
												<label><input name="styleA"  ${s.sci_fi==1?'checked':'' } value="sci_fi" type="checkbox">科幻</label>
											</div>
											<div class="checkbox-inline">
												<label><input name="styleA"  ${s.romance==1?'checked':'' } value="romance" type="checkbox">爱情</label>
											</div>
											</c:forEach>
											</c:if>
											<c:if test="${!qw }">
												<div class="checkbox-inline">
												<label><input name="styleE" value="action" type="checkbox"> 动作</label>
												</div>
												<div class="checkbox-inline">
													<label><input  name="styleE"  value="adventure"  type="checkbox">冒险</label>
												</div>
												<div class="checkbox-inline">
													<label><input  name="styleE" value="comedy" type="checkbox">搞笑</label>
												</div>
												<div class="checkbox-inline">
													<label><input name="styleE"   value="crime" type="checkbox">犯罪</label>
												</div>
												<div class="checkbox-inline">
													<label><input name="styleE"   value="horror" type="checkbox">惊悚</label>
												</div>
												<div class="checkbox-inline">
													<label><input name="styleE"   value="sci_fi" type="checkbox">科幻</label>
												</div>
												<div class="checkbox-inline">
													<label><input name="styleE"   value="romance" type="checkbox">爱情</label>
												</div>
										</c:if>
									</div>
								</div>	 --%>							
			
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										状态:</label>
									<div class="col-sm-8">
										<select name="statusE" id="selector1" class="form-control1">
											<option value="1" ${movie.status eq 1 ?'selected':''}>可用</option>
											<option value="-1" ${movie.status eq -1 ?'selected':''}>不可用</option>									
										</select>
									</div>
								</div>

								 <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										描述:</label>
									<!-- <input type="button" value="添加图片"> -->
									<div class="col-sm-8">
											<textarea id="editor" name="descriptionE" style="width:100%;height:500px;">
											${txt }</textarea>
									</div>
								</div> 
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label" style="color:red;font-family:黑体;size=15em;">
									注意：为照片的展示效果，请按要求上传图片（海报 300:443 ；面板 1390:500）
									</label>
								</div>
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										海报:</label>
									<div class="col-sm-8">
											更换图片：<input type="file" id="file11" name="file1"> 
												<img src="/upload/${movie.pictureName }" style="width:240px;height:354.4px;" >
<!-- 											<input id="" onclick="fileAdd()" type="button" value="添加上传图片">
 -->								</div>
								</div>
								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										面板:</label>
									<div class="col-sm-8">
											更换图片：<input type="file" id="file22" name="file2"> 
												<img src="/uploadPlate/${movie.platepicture }" style="width:650px;height:250px;" >
									</div>
								</div>
								<!-- <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										视频:
									</label>
									<div class="col-sm-8">
										更换视频<input type="file" id="file33" name="file3"> 
										<video style="width:100%;height:80%;" controls>
											<source src="/uploadVideo/changcheng.mp4" type='video/mp4' />
										 	<source src="/uploadVideo/changcheng.mp4" type="video/mp4">
										 	<source src="movie.ogg"  type="video/ogg">
										 	您的浏览器不支持 HTML5 video 标签。
										</video>
									</div>
								</div> -->
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
										<input class="btn-success btn" type="submit" value="保存编辑"/>
										</div>
									</div>
								</div>
								
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
	
	<!--<script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>-->
	<!-- <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script> -->
	<script type="text/javascript" src="<%=path %>/backstage/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="<%=path %>/backstage/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
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
 <script type="text/javascript">
    //jeDate.skin('gray');
	jeDate({
		dateCell:"#indate",//isinitVal:true,
		format:"YYYY-MM",
		isTime:false, //isClear:false,
		//minDate:"2015-10-19 00:00:00",
		//maxDate:"2016-11-8 00:00:00"
	})
    jeDate({
		dateCell:"#dateinfo",
		format:"YYYY-MM-DD",
		isinitVal:false,
		isTime:true, //isClear:false,
		//minDate:"2014-09-19 00:00:00",
		//okfun:function(val){alert(val)}
	})
</script> 
</body>
</html>



