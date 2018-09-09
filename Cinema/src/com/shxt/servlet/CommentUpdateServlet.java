package com.shxt.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.Comment;
import com.shxt.model.CommentBean;


@WebServlet("/backstage/CommentUpdateServlet.do")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comment co=new Comment();//数据模型
		CommentBean ub=new CommentBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		//添加指令
		if(oper.equals("add")){
			
			co.setComment(request.getParameter("commentA"));
			co.setCustomer_id(Integer.parseInt(request.getParameter("idCA")));
			co.setMovie_id(Integer.parseInt(request.getParameter("movie_idA")));
			co.setScore(Integer.parseInt(request.getParameter("scoreA")));
			String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			co.setTime(time);
			url=ub.add(co);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDelA"));
			url=ub.delete(id);
		}
		//恢复指令
		else if(oper.equals("recover")){
			int id=Integer.parseInt(request.getParameter("idRecover"));
			url=ub.recover(id);
		}
		//修改指令
		else if(oper.equals("edit")){
			Object w =request.getParameter("where");
			int where=w==null?1:Integer.parseInt(w.toString());
			
			co.setComment(request.getParameter("commentE"));
			co.setCustomer_id(Integer.parseInt(request.getParameter("idCE")));
			co.setMovie_id(Integer.parseInt(request.getParameter("movie_idE")));
			co.setScore(Integer.parseInt(request.getParameter("scoreE")));
			String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			co.setTime(time);
			url=ub.edit(co,where);	
		}
		
		/*else if(oper.equals("editPas")){
			u.setPassword(request.getParameter("passwordU"));
			u.setId(Integer.parseInt(request.getParameter("idE")));
			url=ub.editPas(u);
		}*/
		request.getRequestDispatcher(url).forward(request, response);
	}

}
