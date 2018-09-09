<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
	String path="http://localhost:8080/upload/";
	List<Map<String,Object>> list=(List<Map<String,Object>>)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/jquery-ui.css">
  		<script type="text/javascript" src="js/jquery.js"></script>
    	<script src="js/jquery-ui.js"></script>
    	
  <script>
  function qd() {
    $( "#dialog-confirm" ).dialog({
      resizable: false,
      height:200,
      modal: true,//模态
      buttons: {
        "上传一张图片": function() {
          $( this ).dialog( "close" );
          location.href = "newAdd.jsp";
        },
        "上传多张图片": function() {
          $( this ).dialog( "close" );
          location.href = "newsAdd.jsp";
        }
      }
    });
  };
 
		function mysubmit(){
			var addr = document.getElementById("d").checked;
			if(addr){
				var myform=document.getElementById("myform");
				myform.action="NewsUpdateServlets.do";
				myform.method="post";
				myform.submit();
			}else{
				alert("请选择要删除的新闻");
				return false;
				
			}
			return true
		}
		$(function(){
			$("#dialog-confirm").hide();
		})
		$(function(){
			
			for(var i=1;i<=<%=list.size()%>;i++){
				var a=$("#"+i).html();
				if(a.length>70){
				$("#"+i).html(a.substr(0,70)+"...")
				}
			}
		})
		</script>
	</head>
	<body>
		<div id="dialog-confirm" title="添加新闻">
  			<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>选择添加的样式</p>
		</div>
		<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="#">功能菜单</a></li>
		    <li><a href="#">新闻管理</a></li>
	    </ul>
	    </div>
	    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar">
	        <li class="click"><a href="#" onclick="qd()" ><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:void(0)" onclick="mysubmit()" ><span><img src="images/t03.png" /></span>删除</a></li>
	        </ul>
	    </div>
	    <form id="myform" method="post">
	    <input type="hidden" name="oper" value="delall"/>
	    <table class="tablelist">
	    	<thead>
		    	<tr>
		        	<th width="5px"><input name="" type="checkbox" checked="checked"/></th>
			        <th>标题</th>
			        <th>内容</th>
			        <th width="70px">来源</th>
			        <th width="50px">图片一</th>
			        <th width="50px">图片二</th>
			        <th width="50px">图片三</th>
			        <th width="150px">添加时间</th>
			        <th width="70px">操作</th>
		        </tr>
	        </thead>
	        <tbody>
	        <%
		        int i=0;
		        for(Map<String,Object> row:list){ 
		        i++;
	  		%>
		        <tr>
			        <td><input id="d" name="id" type="checkbox" value="<%=row.get("id") %>" /></td>
			        <td><%=row.get("title") %></td>
			        <td><span id="<%=i%>" style="float:left;"><%=row.get("content") %></span><a href="NewsQueryServlets.do?oper=mdi&&id=<%=row.get("id") %>" style="float:right;" class="tablelink">查看详情</a></td>
			        <td><%=row.get("source") %></td>
			        <td><img src="<%=path %>/<%=row.get("img1") %>" alt="" style="width:50px; height:50px;" /></td>
			        <td><img src="<%=path %>/<%=row.get("img2") %>" alt="" style="width:50px; height:50px;"/></td>
			        <td><img src="<%=path %>/<%=row.get("img3") %>" alt="" style="width:50px; height:50px;"/></td>
			        <td><%=row.get("crea_time") %></td>
			        <td><a href="NewsQueryServlets.do?oper=mdied&&id=<%=row.get("id") %>" class="tablelink">修改</a>&nbsp;<a href="NewsUpdateServlets.do?oper=del&&id=<%=row.get("id") %>" class="tablelink">删除</a></td>
		        </tr> 
		     <%}%>       
	        </tbody>
	    </table>
	    </form>
	    	<jsp:include page="page.jsp" />
	    </div>
	    <script type="text/javascript">
		$('.tablelist tbody tr:odd').addClass('odd');
		</script>
	</body>
</html>
