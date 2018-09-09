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

<link href="<%=path %>/backstage/css/datepicker.css" rel='stylesheet' type='text/css' />

<link href="<%=path %>/backstage/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="<%=path %>/backstage/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    
<title>Insert title here</title>
<!-- 文本编辑器 引入三个JS -->
<script src="<%=path %>/backstage/js/jquery.js"></script> 
	<script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
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

 
<script type="text/javascript" src="<%=path %>/backstage/js/js/jquery.js"></script>
<%--<script type="text/javascript" src="<%=path %>/backstage/js/js/jquery.ajaxfileupload.js"></script>
<script type="text/javascript">
	/* $(function(){
		var ue = UE.getEditor('editor');
	}); */

 	function jumpPage() {
		var pageFile = document.getElementById("pageFile");
		pageFile.action="<%=path %>/backstage/FileServlet.do";
		pageFile.method="post";
		pageFile.submit();
/* 		$("#img").attr("src","/upload/"+JSON.stringify(data).substring(1,JSON.stringify(data).length-1));
 */	}

	function actorAdd(){
		$("#actorName").clone(false).insertAfter("#actorName");
	}
	function fileAdd(){
		$("#file11").clone(false).insertAfter("#file11");
	}

	/* $(function name() {
		$("#file11").hide();
		$("#bt").click(function() {
			$("#file11").click();
		});
		$('input[type="file"]').ajaxfileupload({
			  action: 'Sc.do',
			  onComplete: function(data) {
			    
			    $("img").attr("src","/upload/"+JSON.stringify(data).substring(1,JSON.stringify(data).length-1));
			    alert(JSON.stringify(data));
			    
			  }
		
			});
	}); */
   	$(function() {
		$("#file11").hide();
		$("#bt").click(function() {
			$("#file11").click();
		});
		
	/* 	var oInput = document.getElementById('file11');
		oInput.onchange = function() {
		    if(this.value == '') {
		        alert('empty');
		    }else {
		        alert(this.value);
		        jumpPage();
		    }
		} */
		/* $("#file11").click(function(){
			jumpPage();
		}); */
		
		$('input[type="file"]').ajaxfileupload({
			  action: "<%=path %>/backstage/FileServlet.do",
			  onComplete: function(data) {
				  alert("hjbskushd");
			    $("#img").attr("src","/upload/"+JSON.stringify(data).substring(1,JSON.stringify(data).length-1)); 
			    alert(JSON.stringify(data));
			  }	
		}); 
	});   
</script>  
 --%>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="graphs">
				<div class="xs">
					<h3>Add Movie</h3>
					<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
							<form action="MovieUpdateServlet.do?oper=add" enctype="multipart/form-data"   method="post" class="form-horizontal" >
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">名称:
										</label>
									<div class="col-sm-8">
										<input type="text" name="nameA" class="form-control1" 
											placeholder="名称" value="">
									</div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										语言:</label>
									<div class="col-sm-8">
										<input type="text" name="languageA" class="form-control1" 
											placeholder="语言" value="">
									</div>
								</div>

								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										上映日期:</label>
									<div class="col-sm-8">
										<input class="datainp" id="indate" type="hidden" placeholder="只显示年月" value=""  readonly>
										<input class="datainp" id="datebut" type="hidden" placeholder="请选择"  readonly><input type="hidden" onClick="jeDate({dateCell:'#datebut',isTime:true,format:'YYYY-MM-DD hh:mm:ss'})" value="打开">
										<input name="creat_timeA"  class="datainp form-control1" id="dateinfo" type="text" placeholder="上映日期"  readonly>
									</div>
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">
										片长:</label>
									<div class="col-sm-8">
										<input type="text" name="timeA" class="form-control1" 
											placeholder="片长" value="">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">导演</label>
									<div  class="col-sm-8">
									<input type="text" name="directorA" class="form-control1" 
											placeholder="导演" value="">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label">主演</label>
									<div class="col-sm-8">
									<input type="text" name="actorA" class="form-control1" 
											placeholder="主要演员" value="">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">影片风格:</label>
									<div class="col-sm-8">
									<input type="text" name="styleA" class="form-control1" 
											placeholder="影片风格" value="">
									</div>
								</div>
								
								
								<!-- <div class="form-group">
									<label for="checkbox" class="col-sm-2 control-label">影片风格:</label>
									<div class="col-sm-8">
										<div class="checkbox-inline">
											<label><input name="styleA" value="action" type="checkbox"> 动作</label>
										</div>
										<div class="checkbox-inline">
											<label><input  name="styleA" value="adventure"  type="checkbox">冒险</label>
										</div>
										<div class="checkbox-inline">
											<label><input  name="styleA" value="comedy" type="checkbox">搞笑</label>
										</div>
										<div class="checkbox-inline">
											<label><input name="styleA"  value="crime" type="checkbox">犯罪</label>
										</div>
										<div class="checkbox-inline">
											<label><input name="styleA"  value="horror" type="checkbox">惊悚</label>
										</div>
										<div class="checkbox-inline">
											<label><input name="styleA"  value="sci_fi" type="checkbox">科幻</label>
										</div>
										<div class="checkbox-inline">
											<label><input name="styleA"  value="romance" type="checkbox">爱情</label>
										</div>
									</div>
								</div> -->

								 <div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										描述:</label>
									<!-- <input type="button" value="添加图片"> -->
									<div class="col-sm-8">
											<textarea id="editor" name="descriptionA" style="width:100%;height:500px;"></textarea>
									</div>
								</div> 

								<div class="form-group">
									<label for="selector1" class="col-sm-2 control-label">
										状态:</label>
									<div class="col-sm-8">
										<select name="statusA" id="selector1" class="form-control1">
											<option value="1" >可用</option>
											<option value="-1" >不可用</option>									
										</select>
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
								
								<div class="panel-footer">
									<div class="row">
										<div class="col-sm-8 col-sm-offset-2" style="text-align:right;">
											<!-- <input class="btn-success btn" type="submit" value="确认添加"/> -->
											<!-- <input class="btn-success btn" type="bu" value="确认添加"/> -->
											<input class="btn-success btn" type="submit" value="确认添加" onclick="">
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
	
	<%-- <script type="text/javascript" src="<%=path %>/backstage/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script> --%>
	<%-- <script type="text/javascript" src="<%=path %>/backstage/bootstrap/js/bootstrap.min.js"></script> --%>
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
    jeDate.skin('gray');
	jeDate({
		dateCell:"#indate",//isinitVal:true,
		format:"YYYY-MM",
		isTime:false, //isClear:false,
		minDate:"2015-10-19 00:00:00",
		//maxDate:"2016-11-8 00:00:00"
	})
    jeDate({
		dateCell:"#dateinfo",
		format:"YYYY-MM-DD",
		isinitVal:false,
		isTime:false, 
		//isClear:false,
		minDate:"2014-09-19 00:00:00"
		})
</script> 

</body>
</html>



