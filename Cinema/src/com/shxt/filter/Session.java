package com.shxt.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class Session
 */
//@WebFilter("/Session.do")
public class Session implements Filter {

    /**
     * Default constructor. 
     */
    public Session() {
        // TODO Auto-generated constructor stub
    }

	
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request= (HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)res;
		HttpSession session=request.getSession();
		
		if(request.getServletPath().endsWith("login.jsp")||request.getServletPath().endsWith("LoginServlet.do")||request.getServletPath().endsWith(".css")||request.getServletPath().endsWith(".js")||request.getServletPath().endsWith(".jpg")||request.getServletPath().endsWith(".png")||request.getServletPath().endsWith(".gif")){
			chain.doFilter(request, response);
		}else if(session.getAttribute("userAcc")==null){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write("<script>alert('登录超时，请重新登陆！');window.top.location.href='"+request.getContextPath()+"/backstage/login.jsp'</script>");
			out.flush();
			out.close();
			//response.sendRedirect("login.html");//****
		}else{
			chain.doFilter(request, response);
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
