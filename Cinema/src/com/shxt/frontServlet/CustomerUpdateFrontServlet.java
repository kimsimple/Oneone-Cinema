package com.shxt.frontServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.shxt.model.Customer;
import com.shxt.model.CustomerBean;

/**
 * UserUpdateServlet  用户更改  Servlet 获取判断增删改查指令
 * @author Administrator
 *
 */

@WebServlet("/front/CustomerUpdateFrontServlet.do")
public class CustomerUpdateFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer c=new Customer();//数据模型
		CustomerBean cb=new CustomerBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		System.out.println(oper+"oper");
		//添加指令
		if(oper.equals("add")){
			/*c.setName(request.getParameter("nameA"));
			c.setAccount(request.getParameter("accountA"));
			c.setIDCard(request.getParameter("IDCardA"));
			c.setEmail(request.getParameter("emailA"));
			c.setPayPassword(request.getParameter("payPassword"));*/
			c.setPassword(request.getParameter("passwordAS").toString().trim());
			c.setTel(request.getParameter("telS").toString().trim());
			url=cb.add(c);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=cb.delete(id);	
		}
		
		//修改指令
		else if(oper.equals("edit")){
			//c.setAccount(request.getParameter("accountE"));
			//c.setIDCard(request.getParameter("IDCardE"));
			//c.setPayPassword(request.getParameter("payPassword"));
			c.setId(Integer.parseInt(request.getParameter("idE")));
			c.setName(request.getParameter("nameE"));
			c.setEmail(request.getParameter("emailE"));
			c.setPassword(request.getParameter("passwordE"));
			c.setTel(request.getParameter("telE"));
			url=cb.edit(c);	
		}else if(oper.equals("sessionDel")){
			url=cb.sessionDel(request);	
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
