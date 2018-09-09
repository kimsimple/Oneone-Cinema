package com.shxt.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shxt.model.UserBean;
import com.shxt.util.JdbcUtils01;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/backstage/LoginServlet.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	JdbcUtils01 jdbc=new JdbcUtils01();
	UserBean ub=new UserBean();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String url="login.jsp";
		//System.out.println("*******************");
		url=ub.login(request, account, password);
		//System.out.println("+++++++++++++++++++");
		if(url.equals("main.jsp")){
			String ss="select * from user where account='"+account+"' and password='"+password+"'";
			List<Map<String,Object>> l=jdbc.list(ss,new Object[]{});
			Map<String,Object> m=l.get(0);
			HttpSession session=request.getSession();
			session.setAttribute("userAcc", m);
			request.getRequestDispatcher(url).forward(request, response);
		}else{
			String message="账号密码不匹配";
			request.setAttribute("message", message);
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
