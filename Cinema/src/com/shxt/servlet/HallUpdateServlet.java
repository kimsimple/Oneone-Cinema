package com.shxt.servlet;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.shxt.model.Hall;
import com.shxt.model.HallBean;

@WebServlet("/backstage/HallUpdateServlet.do")
@MultipartConfig(
        maxFileSize = 8388608,
        fileSizeThreshold = 819200
)
public class HallUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Hall h=new Hall();//数据模型
		HallBean hb=new HallBean();//操作模型    进行数据库操作
		String url=null;
		//获取操作指令
		String oper=request.getParameter("oper");
		//添加指令
		if(oper.equals("add")){
			Part part = request.getPart("file1");
			h.setSeat_num(Integer.parseInt(request.getParameter("seat_numA")));
			h.setDescription(request.getParameter("desprictionA"));
			System.out.println("seat_numA "+request.getParameter("seat_numA"));
			
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
			h.setPictureName(name+ext);
			url=hb.add(h);
		}
		
		//删除指令
		else if(oper.equals("delete")){
			int id=Integer.parseInt(request.getParameter("idDelA"));
			url=hb.delete(id);
		}

		
		//修改指令
		else if(oper.equals("edit")){
			Part part = request.getPart("file1");
			System.out.println("idE  "+request.getParameter("idEEE"));
			System.out.println("seat_numE  "+request.getParameter("seat_numE"));
			System.out.println("desprictionE  "+request.getParameter("desprictionE"));
			h.setId(Integer.parseInt(request.getParameter("idEEE")));
			h.setSeat_num(Integer.parseInt(request.getParameter("seat_numE")));
			h.setDescription(request.getParameter("desprictionE"));
			System.out.println("des  "+h.getDescription());
			
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
			h.setPictureName(name+ext);
			url=hb.edit(h);	
		}
		else if(oper.equals("resetSeat")){
			int idH1=Integer.parseInt(request.getParameter("idH11"));
			url=hb.resetSeat(idH1);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}


}
