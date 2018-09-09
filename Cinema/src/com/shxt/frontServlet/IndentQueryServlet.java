package com.shxt.frontServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.IndentBean;


@WebServlet("/front/IndentQueryServlet.do")
public class IndentQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IndentBean ib=new IndentBean();
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
			//System.out.println("Page  "+request.getParameter("pages")+"oper"+oper);
			url+=ib.list(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			url=ib.query(request,id);
			//url="main.jsp";
		}
		System.out.println("url   "+url);
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
