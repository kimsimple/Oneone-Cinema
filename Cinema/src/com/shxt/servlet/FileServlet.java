package com.shxt.servlet;

/*import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

import com.google.gson.Gson;


@WebServlet("/backstage/FileServlet.do")
//设置文件上传属性
@MultipartConfig(
		maxFileSize=8388608,//最大文件上传大小（单位字节）
		fileSizeThreshold=819200//当数据量大于该值时，存入临时文件（D）
		)
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	可以接到get post 两种提交方式的值
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		父类中唯一有方法体的，判断get post
		文件上传3.0版（简单）	servlet 提供类  2.5版  
		//文件上传3.0版  通过数据和流的形式传递 		 2.5只有流  不接文本
		Part part=request.getPart("file1");//1、以流的方式 读取以file为名标签内的数据
		//定义上传目录  获取上下文路径（WebContent）
		//String root=request.getServletContext().getRealPath("/upload");
		String root="F:/photo";
		File file=new File(root);//通过File类定位root路径
		if(!file.exists()){
			file.mkdirs();//一套，文件夹
		}
		//获取当前文件头
		String name=part.getHeader("content-disposition");//
		System.out.println("name:  "+name);
		String ext=name.substring(name.lastIndexOf("."), name.length()-1);
		name=UUID.randomUUID().toString().replaceAll("-", "");//随机生成文件名
		String filename=root+"/"+name+ext;
		part.write(filename);//上传
		System.out.println("filename:  "+filename);
		Gson gson = new Gson();
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write(gson.toJson(name+ext));
        out.flush();
        out.close();
       JOptionPane.showMessageDialog(null, "sdsxascsa");
       request.setAttribute("name", name+ext);
		request.getRequestDispatcher("movieAdd.jsp").forward(request, response);
		
		//上传到服务器，服务器编译workspace中工程 而 工程中无upload 重新部署
		//消失问题，
		//解决：上传到本地磁盘
	}
}
*/



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;





/**
 * Servlet implementation class Sc
 */
@WebServlet("/backstage/FileServlet.do")
@MultipartConfig(
        maxFileSize = 8388608,
        fileSizeThreshold = 819200
)
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		Gson gson = new Gson();
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write(gson.toJson(name+ext));
        out.flush();
        out.close();
		
	}

}


