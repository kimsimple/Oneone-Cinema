package com.shxt.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shxt.model.User;
import com.shxt.model.UserBean;


@WebServlet("/backstage/UserQueryServlet.do")
public class UserQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserBean ub=new UserBean();
	String url=null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oper=request.getParameter("oper");
		url="";
		if(oper.equals("list")){			
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			System.out.println("status  "+status1);
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=ub.list(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			url=ub.query(request,id);
		}else if(oper.equals("querySelf")){
			String accSelf=request.getParameter("accSelf");
			System.out.println("acc"+accSelf+"-*-*");
			url=ub.querySelf(request,accSelf);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
