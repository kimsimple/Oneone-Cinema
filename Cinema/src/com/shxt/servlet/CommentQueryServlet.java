package com.shxt.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shxt.model.CommentBean;


@WebServlet("/backstage/CommentQueryServlet.do")
public class CommentQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentBean cob=new CommentBean();
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
			int where=1;
			url+=cob.list(request,page,status,where);//获取list要传给的页面  跳转
		}else if(oper.equals("query")){
			int id=Integer.parseInt(request.getParameter("id"));
			url=cob.query(request,id);
		}/*else if(oper.equals("querySelf")){
			HttpSession session=request.getSession();
			session.getAttribute("userAcc");
			String acc=session.getAttribute("userAcc").toString();
			System.out.println("acc"+acc);
			url=cob.querySelf(request,acc);
		}*/
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
