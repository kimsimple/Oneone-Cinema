<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int pages = Integer.parseInt(request.getAttribute("pages").toString());
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int sumPage = Integer.parseInt(request.getAttribute("sumPage").toString());
%>
<script type="text/javascript">

	$(function() {
		document.getElementById("status2").value=document.getElementById("status1").value;
		
	});
/**
 * 参数 跳到哪一页
 */
	function jumpPage(pages) {
		var pageForm = document.getElementById("pageForm");
		document.getElementById("pages").value=pages;
		//pageForm.action="UserQueryServlet.do";//写死了
		pageForm.action="${url}";//真正实现封装
		pageForm.method="post";
		pageForm.submit();
	}
</script>

	<form id="pageForm"> 
		<input type="hidden" name="pages" id="pages" value=""/> 
		<input type="hidden" name="oper" value="list" /> 
		<input type="hidden" name="status" value="" id="status2"/> 
		<input type="hidden" name="name" id="name" value="${name1 }"/> 
		<input type="hidden" name="fromTime" value="${fromTime1}" /> 
		<input type="hidden" name="toTime" value="${toTime1}" id="toTime"/> 
		
	    <div class="pagin" style="text-align:right;">
	    	<div class="message">共<i class="blue"><%=count %></i>条记录，当前显示第<i class="blue" style="color:red;"><%=pages %></i>页，共<i class="blue"><%=sumPage %></i>页</div>
	        <ul class="pagination">
	        <li class="pagination"><a href="javascript:void(0);" onclick="jumpPage(<%=1%>)">首页</a></li>
	        <li class="pagination"><a href="javascript:void(0);" onclick="jumpPage(<%=(pages-1<1)?1:(pages-1)%>)">上一页</a></li>
	        <li class="pagination"><a href="javascript:void(0);" onclick="jumpPage(<%=(pages+1>sumPage)?sumPage:(pages+1)%>)">下一页</a></li>
	        <li class="pagination"><a href="javascript:void(0);" onclick="jumpPage(<%=sumPage%>)">尾页</a></li>
	        </ul>
	    </div>
    </form>
    