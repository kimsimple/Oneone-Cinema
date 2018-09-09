package com.shxt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.User;
import com.shxt.model.UserBean;
/**
 * UserUpdateServlet  用户更改  Servlet 获取判断增删改查指令
 * @author Administrator
 *
 */

@WebServlet("/backstage/UserUpdateServlet.do")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u=new User();//数据模型
		UserBean ub=new UserBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		//添加指令
		if(oper.equals("add")){

			u.setName(request.getParameter("nameA"));
			u.setAccount(request.getParameter("accountA"));
			u.setPassword(request.getParameter("passwordA"));
			u.setTel(request.getParameter("telA"));
			u.setIDCard(request.getParameter("IDCardA"));
			u.setStatus(Integer.parseInt(request.getParameter("statusA")));
			u.setPower(Integer.parseInt(request.getParameter("powerA")));
			url=ub.add(u,request);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=ub.delete(id);
		}
		
		//修改指令
		else if(oper.equals("edit")){
			Object w =request.getParameter("where");
			int where=w==null?1:Integer.parseInt(w.toString());
			u.setId(Integer.parseInt(request.getParameter("idE")));
			u.setId(Integer.parseInt(request.getParameter("idE")));
			u.setName(request.getParameter("nameE"));
			u.setAccount(request.getParameter("accountE"));
			u.setPassword(request.getParameter("passwordE"));
			u.setTel(request.getParameter("telE"));
			u.setIDCard(request.getParameter("IDCardE"));
			System.out.println("stattus-----"+request.getParameter("statusE"));
			u.setStatus(Integer.parseInt(request.getParameter("statusE")));
			u.setPower(Integer.parseInt(request.getParameter("powerE")));
			url=ub.edit(u,where);	
		}
		
		else if(oper.equals("editPas")){
			u.setPassword(request.getParameter("passwordU"));
			u.setId(Integer.parseInt(request.getParameter("idE")));
			url=ub.editPas(u);
		}
		else if(oper.equals("sessionDel")){
			url=ub.sessionDel(request);	
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
