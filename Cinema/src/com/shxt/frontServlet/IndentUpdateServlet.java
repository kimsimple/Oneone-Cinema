package com.shxt.frontServlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.Indent;
import com.shxt.model.IndentBean;



@WebServlet("/front/IndentUpdateServlet.do")
public class IndentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Indent i=new Indent();//数据模型
		IndentBean ib=new IndentBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		//添加指令
		if(oper.equals("add")){
			
			i.setCode(request.getParameter("indent"));
			i.setCustomer_id(Integer.parseInt(request.getParameter("customer_idA")));
			i.setShowMessage_id(Integer.parseInt(request.getParameter("showMessage_idA")));
			i.setPrice(Double.parseDouble(request.getParameter("price")));
			i.setTel(request.getParameter("cusTel"));
			//位置
			String seat[]=request.getParameterValues("seat");
			int len=seat.length;
			int[][] seatI=new int[len][2];
			for(int j=0;j<len;j++){
				seat[j]=seat[j].replaceAll("排", "+");
				seat[j]=seat[j].replaceAll("座", "");
				System.out.println("seat[j]"+seat[j]);
				int qq=seat[j].indexOf('+');
				String aa=seat[j].substring(0, qq);
				String bb=seat[j].substring(qq+1, seat[j].length());
				//String temp[]=seat[j].split("+");
				System.out.println("aa"+aa);
				System.out.println("bb"+bb);
				seatI[j][0]=Integer.parseInt(aa);
				seatI[j][1]=Integer.parseInt(bb);
			}
			i.setTel(request.getParameter("tel"));
			url=ib.add(i,seatI,request);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=ib.delete(id);

		}
		
		//修改指令
		else if(oper.equals("edit")){
			i.setId(Integer.parseInt(request.getParameter("idE")));
			i.setCustomer_id(Integer.parseInt(request.getParameter("customer_idA")));
			i.setShowMessage_id(Integer.parseInt(request.getParameter("showMessage_idA")));
			i.setPrice(Integer.parseInt(request.getParameter("price")));
			i.setSeat1(Integer.parseInt(request.getParameter("seat1")));
			i.setSeat2(Integer.parseInt(request.getParameter("seat2")));
			i.setTel(request.getParameter("tel"));

			url=ib.edit(i);	
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
