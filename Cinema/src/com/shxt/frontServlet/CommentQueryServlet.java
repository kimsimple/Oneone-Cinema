package com.shxt.frontServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.CommentBean;


@WebServlet("/front/CommentQueryServlet.do")
public class CommentQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentBean ub=new CommentBean();
	String url=null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oper=request.getParameter("oper");
		url="";
		if(oper.equals("list")){			
			String page1=request.getParameter("pages");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=1;
			int where=-1;
			url+=ub.list(request,page,status,where);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			url=ub.query(request,id);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}
