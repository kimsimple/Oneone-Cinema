package com.shxt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.ShowMessageBean;


@WebServlet("/backstage/ShowMessageQueryServlet.do")
public class ShowMessageQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ShowMessageBean sb=new ShowMessageBean();
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
			url+=sb.list(request,page,status);//获取list要传给的页面  跳转
		}if(oper.equals("listSchedule")){			
			url+=sb.listSchedule(request);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("idE"));
			url=sb.query(request,id);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
