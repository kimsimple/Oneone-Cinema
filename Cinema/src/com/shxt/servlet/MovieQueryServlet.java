package com.shxt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.MovieBean;


@WebServlet("/backstage/MovieQueryServlet.do")
public class MovieQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieBean mb=new MovieBean();
	String url=null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oper=request.getParameter("oper");
		url="";
		if(oper.equals("list")){			
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=mb.list(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			String w=request.getParameter("where");
			int where=w==null?1:Integer.parseInt(w);
			System.out.println("where:  "+where);
			url+=mb.query(request, id,where);//获取list要传给的页面  跳转
			System.out.println("after:  "+where);
		}else if(oper.equals("listISHot")){
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=mb.listISHot(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("listComingSoon")){
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=mb.listComingSoon(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("listPlate")){
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=mb.listPlate(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("listCalendar")){
			String page1=request.getParameter("pages");
			String status1=request.getParameter("status");
			int page=page1==null?1:Integer.parseInt(page1);
			int status=status1==null?1:Integer.parseInt(status1);
			url+=mb.list(request,page,status);//获取list要传给的页面  跳转
		}else if(oper.equals("showmessageAdd")){
			int  movie_id=Integer.parseInt(request.getParameter("movie_id"));
			String movie_name=request.getParameter("movie_name");
			url+=mb.showMessageAdd(request, movie_id, movie_name);//获取list要传给的页面  跳转
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
