package com.shxt.frontServlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shxt.model.Movie;
import com.shxt.model.MovieBean;

@WebServlet("/front/MovieUpdateFrontServlet.do")
@MultipartConfig(
        maxFileSize = 8388608,
        fileSizeThreshold = 819200
)
public class MovieUpdateFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Movie m=new Movie();//数据模型
		MovieBean mb=new MovieBean();//操作模型    进行数据库操作
		String url=null;
		 SimpleDateFormat dateformat =new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		//获取操作指令
		String oper=request.getParameter("oper");
		System.out.println(oper+"oper");
		//添加指令
		if(oper.equals("add")){
			m.setName(request.getParameter("nameA"));
			m.setDescription(request.getParameter("descriptionA"));
			m.setCreat_time(request.getParameter("creat_timeA"));
		
			m.setTime(Integer.parseInt(request.getParameter("timeA")));
			m.setStatus(Integer.parseInt(request.getParameter("statusA")));
			m.setLanguage(request.getParameter("languageA"));
			m.setDirector(request.getParameter("directorA"));
			m.setActor(request.getParameter("actorA"));
			m.setStyle(request.getParameterValues("styleA"));
			
			Part part = request.getPart("file1");
			String root = "F:/photo";
			File file = new File(root);
			if(!file.exists()){
				file.mkdirs();
			}
			String name = part.getHeader("content-disposition");
			String ext = name.substring(name.lastIndexOf("."),name.length()-1);
			name = UUID.randomUUID().toString().replaceAll("-", "");
			String filename = root +"/"+name+ext;
			part.write(filename);
			request.setAttribute("filename", name+ext);
			url=mb.add(m,request);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=mb.delete(id);	
		}else if(oper.equals("dealNotHot")){
			int id=Integer.parseInt(request.getParameter("idDel"));
			url=mb.delete(id);
		}
		
		//修改指令
		else if(oper.equals("edit")){
			m.setId(Integer.parseInt(request.getParameter("idE")));
						
			m.setName(request.getParameter("nameE"));
			m.setDescription(request.getParameter("descriptionE"));
			m.setCreat_time(request.getParameter("creat_timeE"));
			
			m.setTime(Integer.parseInt(request.getParameter("timeE")));
			m.setDirector(request.getParameter("directorE"));
			m.setActor(request.getParameter("actorE"));
			String[] style=request.getParameterValues("styleA");

			if(style!=null){
				m.setStyle(style);
			}else{
				m.setStyle(request.getParameterValues("styleE"));
			}
			
			m.setLanguage(request.getParameter("languageE"));
			m.setStatus(Integer.parseInt(request.getParameter("statusE")));

			
			Part part = request.getPart("file1");
				String root = "F:/photo";
				File file = new File(root);
				if(!file.exists()){
					file.mkdirs();
				}

				String name = part.getHeader("content-disposition");
				if(!name.equals("form-data; name=\"file1\"; filename=\"\"")){

					String ext = name.substring(name.lastIndexOf("."),name.length()-1);

					name = UUID.randomUUID().toString().replaceAll("-", "");
					String filename = root +"/"+name+ext;
					part.write(filename);
					request.setAttribute("filename", name+ext);
				}
			url=mb.edit(m,request);	
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
