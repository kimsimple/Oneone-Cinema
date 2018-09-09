package com.shxt.frontServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shxt.model.ShowMessage;
import com.shxt.model.ShowMessageBean;

@WebServlet("/front/ShowMessageFrontUpdateServlet.do")
public class ShowMessageFrontUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShowMessage s=new ShowMessage();//数据模型
		ShowMessageBean sb=new ShowMessageBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		//添加指令
		if(oper.equals("add")){
			s.setMovie_id(Integer.parseInt(request.getParameter("movie_idA")));
			s.setPrice(Double.parseDouble(request.getParameter("priceA")));
			s.setHall_id(Integer.parseInt(request.getParameter("hall_idA")));
			Object remarksT=request.getParameter("remarksA");
			if(remarksT!=null&&!remarksT.toString().trim().equals(""))
			{
				s.setRemarks(remarksT.toString().trim());
			}
			s.setStatus(Integer.parseInt(request.getParameter("statusA")));
			s.setStart_time(request.getParameter("start_timeA"));
			url=sb.add(s);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=sb.delete(id);
		}
		
		//修改指令
		else if(oper.equals("edit")){
			s.setId(Integer.parseInt(request.getParameter("idE")));
			s.setMovie_id(Integer.parseInt(request.getParameter("movie_idE")));
			s.setPrice(Double.parseDouble(request.getParameter("priceE")));
			s.setHall_id(Integer.parseInt(request.getParameter("hall_idE")));
			s.setStart_time(request.getParameter("start_timeE"));
			/*Object numA=request.getParameter("numA");
			if(numA!=null){
				s.setNum(Integer.parseInt(numA.toString()));
			}*/
			s.setStatus(Integer.parseInt(request.getParameter("statusE")));
			Object remarksT=request.getParameter("remarksE");
			if(remarksT!=null&&!remarksT.toString().trim().equals(""))
			{
				s.setRemarks(remarksT.toString().trim());
			}
			url=sb.edit(s);	
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
