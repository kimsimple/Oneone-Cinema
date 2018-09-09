package com.shxt.frontServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.Customer;
import com.shxt.model.CustomerBean;



@WebServlet("/front/CustomerQueryFrontServlet.do")
public class CustomerQueryFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Customer c=new Customer();
	CustomerBean cb=new CustomerBean();
	String url=null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oper=request.getParameter("oper");
		url="";
		if(oper.equals("list")){			
			String page1=request.getParameter("pages");
			int page=page1==null?1:Integer.parseInt(page1);
			url+=cb.list(request,page);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			url=cb.query(request,id);
			
		}else if(oper.equals("queryFront")){
			String telC=request.getParameter("telC");
			String password=request.getParameter("password");
			c.setTel(telC);
			c.setPassword(password);
			url=cb.queryFront(request,c);
		}else if(oper.equals("queryByIdFront")){
			String telC=request.getParameter("telC");
			String password=request.getParameter("password");
			c.setTel(telC);
			c.setPassword(password);
			url=cb.queryByIdFront(request, c);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
