<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="basePath">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <meta name="viewport" content="width=device-width; initial-scale=1.0"> -->
<title>在线选座</title>
<meta name="keywords" content="jQuery,选座">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css" />
<style type="text/css">
.demo{width:700px; margin:40px auto 0 auto; min-height:450px;}
@media screen and (max-width: 360px) {.demo {width:340px}}

.front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
.booking-details {float: right;position: relative;width:200px;height: 450px; }
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
div.seatCharts-row {height: 35px;}
div.seatCharts-seat.available {background-color: #B9DEA0;}
div.seatCharts-seat.focused {background-color: #76B474;border: none;}
div.seatCharts-seat.selected {background-color: #E6CAC4;}
div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}
div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}
div.seatCharts-legend {padding-left: 0px;margin-bottom: 16px;}
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#selected-seats {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}
#selected-seats li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>


<!-- 引入 artDialog -->
<script src="<%=path %>/backstage/artDialog/lib/jquery-1.10.2.js"></script>
<script src="<%=path %>/backstage/artDialog/dist/dialog-min.js"></script>

<!-- <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script> -->
<link href="<%=path %>/backstage/artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/backstage/artDialog/dist/dialog-plus.js"></script>

<script type="text/javascript">
//模态窗口
function add(){
	var s = new Array();
	var number = document.getElementById("counter").innerHTML;
	if(number==0){
		alert("请选择座位");
		return false;
	}
	var seat=document.getElementsByName("seat");
	
	for(var i = 0;i<seat.length;i++){
		s[i] = seat[i].value;
	}
	var price = parseFloat(document.getElementById("total").innerHTML);
	var hall_id=parseInt(document.getElementById("hall_id").innerHTML);
	var idM=document.getElementById("idM").value;
	var addDialog=top.dialog({
		title:'支付',
		param:{num:number,seat:seat,price:price},
		url:"<%=path%>/front/pay.jsp?num="+number+"&price="+price+"&seat="+s+"&showMessage_idA="+idM+"&hall_id="+hall_id,
		width:500,
		height:300,
		onclose:function(){
			window.location.href=window.location.href;
			window.location.reload();  
			//刷新页面
		}
	});
	addDialog.showModal();
}

function jump(){
	var pageForm = document.getElementById("formHall");
	pageForm.action="HallUpdateServlet.do?oper=add";
	pageForm.method="post";
	pageForm.submit();
	var dialog=top.dialog.get(window);//获取当前的模态窗口
	dialog.close();
	//dialog.remove();
	//return false;
}
	
</script>
</head>
<body>

	
	<ul id="selected-seats1" style="display: none">
		<c:forEach items="${seatlist }" var="seatList" varStatus="vs">
			<li>${seatList.raw }_${seatList.col }</li>
		</c:forEach>
	</ul>
	
	<input type="hidden" id="price" value="${listMessage.price }"> 
	<input type="hidden" id="idM" value="${listMessage.idM }"> 
	<div id="main">
   <!-- <h2 class="top_title"><a href="http://www.helloweba.com/view-blog-278.html">jQuery在线选座订座（影院版）</a></h2> -->
   <div class="demo">
   		<div id="seat-map">
			<div class="front">屏幕</div>					
		</div>
		<div class="booking-details">
			<form action="<%=path %>/backstage/IndentUpdateServlet.do?oper=add"  method="post">
				<p>影片：<span>${listMessage.name }</span></p>
				<p>时间：<span>${start_time }</span></p>
				<p>影厅号：<span id="hall_id">${listMessage.hall_id }</span></p>
				<p>单价：<span>${listMessage.price }</span></p>
				<p>座位：</p>
				<ul id="selected-seats"></ul>
				<p>票数：<span id="counter">0</span></p>
				<p>总计：<b>￥<span id="total">0</span></b></p>
				<input id="bt" type="button" onclick="add()" value="确定购买">
				<div id="legend"></div>
			</form>
		</div>
		<div style="clear:both"></div>
  	 </div>
	
	<br/>
	</div>


<script type="text/javascript" src="<%=path %>/backstage/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/backstage/js/jquery.seat-charts.min.js"></script>
<script type="text/javascript">
var price = parseFloat(document.getElementById("price").value); //票价
$(document).ready(function() {
	var $cart = $('#selected-seats'), //座位区
	$counter = $('#counter'), //票数
	$total = $('#total'); //总计金额
	
	var sc = $('#seat-map').seatCharts({
		map: [  //座位图
			'aaaaaaaaaa',
            'aaaaaaaaaa',
            '__________',
            'aaaaaaaa__ ',
            'aaaaaaaaaa',
			'aaaaaaaaaa',
			'aaaaaaaaaa',
			'aaaaaaaaaa',
			'aaaaaaaaaa',
            'aa__aa__aa'
		],
		naming : {
			top : false,
			getLabel : function (character, row, column) {
				return column;
			}
		},
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '可选座' ],
				[ 'a', 'unavailable', '已售出']
			]					
		},
		click: function () { //点击事件
			$("#bt").removeAttr("disabled");
			if (this.status() == 'available') { //可选座
				$('<li>'+(this.settings.row+1)+'排'+this.settings.label+'座</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);
				$("<input type='hidden' id='seat"+this.settings.id+"' value='"+(this.settings.row+1)+'排'+this.settings.label+'座'+"' name='seat'>").appendTo($cart);
				$counter.text(sc.find('selected').length+1);
				if(sc.find('selected').length+1>4){
					alert("最多只能购买四张");
					$("#bt").attr("disabled","disabled");
					
				}
				$total.text(recalculateTotal(sc)+price);
							
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
				$("#bt").removeAttr("disabled");
					//更新数量
					$counter.text(sc.find('selected').length-1);
					if(sc.find('selected').length-1>4){
						$("#bt").attr("disabled","disabled");
						
					}
					//更新总计
					$total.text(recalculateTotal(sc)-price);
						
					//删除已预订座位
					//alert($('#seat'+this.settings.id).val());
					$('#cart-item-'+this.settings.id).remove();
					$('#seat'+this.settings.id).remove();
					//可选座
					return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});
	//已售出的座位
	var seat_list = document.getElementById("selected-seats1").getElementsByTagName("li");
	console.log(seat_list);
	for(i=0;i<seat_list.length;i++){
		sc.get([seat_list[i].innerHTML]).status('unavailable');
	}
	//已售出的座位
	/* sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable'); */

});
//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
}
</script>

</body>
</html>