package com.shxt.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.shxt.util.JdbcUtils01;


public class CommentBean extends PageBean  {
	String url=null;
	JdbcUtils01 jdbc=new JdbcUtils01();

	/**
	 * 分页查询
	 * @param request
	 * @param pages
	 * @return
	 */
	public String list(HttpServletRequest request,int pages,int s,int where){
		//String sql = "SELECT * FROM student where 1=1 ";
		StringBuilder sq=new StringBuilder("SELECT customer.*,movie.*,comment1.* FROM customer,movie,comment1 WHERE  comment1.customer_idCom=customer.idC and comment1.movie_idCom=movie.id   ");
		
		//查询条件
		String movie_name1=request.getParameter("movie_name")==null?"":request.getParameter("movie_name").trim();
		//String account1=request.getParameter("account")==null?"":request.getParameter("account").trim();
		//String power1=request.getParameter("power")==null?"":request.getParameter("power").trim();
		String cus_name1=request.getParameter("cus_name")==null?"":request.getParameter("cus_name").trim();

		if(movie_name1!=null&&!movie_name1.equals("")){
			sq.append(" and name like '%"+movie_name1+"%'");
		}
		if(cus_name1!=null&&!cus_name1.equals("")){
			sq.append(" and nameC like '%"+cus_name1+"%'");
		}

		if(s>0){
			sq.append(" and statusComment >0 ");
		}else if(s<0){
			sq.append(" and statusComment <0 ");
		}
		String sql=sq.toString();
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("movie_name1", movie_name1);
		request.setAttribute("cus_name1", cus_name1);

		System.out.println("sql:  "+sql);
		System.out.println("list  "+list);
		
		request.setAttribute("url", "CommentQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0&&where>0){
			return "commentList.jsp";
		}else if(s<0&&where>0){
			return "commentListBin.jsp";
		}
		return "";
	}
	/**
	 * 查询全部 user
	 * @param request
	 * @return
	 */
	/*public String list(HttpServletRequest request){
		String sql="select * from user where status>=1";
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		return "userList.jsp";
	}*/
	/**
	 * 按id查询员工
	 * @param request
	 * @param id
	 * @return
	 */
	public String query(HttpServletRequest request,int id){
		String sql="select * from comment where id="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		System.out.println("list   "+list);
		return "userEdit.jsp";
	}
	
/*	public String querySelf(HttpServletRequest request,String  acc){
		String sql="select * from comment where account='"+acc+"'";
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("my", list.get(0));
		System.out.println("--"+ list.get(0));
		return "userSelf.jsp";
	}*/


	public String add(Comment co){
		String sql="insert into comment1(movie_idCom,customer_idCom,timeCom,scoreCom,comment1) values("+co.getMovie_id()+","+co.getCustomer_id()+",'"+co.getTime()+"',"+co.getScore()+",'"+co.getComment()+"')";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success add");
		}
		return "/front/MovieQueryFrontServlet.do?oper=query&where=-1&id="+co.getMovie_id();
	}
	/**
	 * 
	 * @param id 
	 * @return 
	 */
	public String delete(int id){
		String sql="update comment1 set statusComment=-1 where idCom="+id+"";
		//System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "CommentQueryServlet.do?oper=list";
	}
	public String recover(int id){
		String sql="update comment1 set statusComment=1 where idCom="+id+"";
		//System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success recover");
		}
		return "CommentQueryServlet.do?oper=list";
	}
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(Comment co,int w){
		String sql="update comment set  timeCom='"+co.getTime()+"', comment1='"+co.getComment()+"' ,scoreCom='"+co.getScore()+"' where id="+co.getId()+" ";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		if(w==1){
			return "CommentQueryServlet.do?oper=list";
		}else{
			return "CommentQueryServlet.do?oper=querySelf";
		}
	}
	
	/*public String editPas(User u){
		String sql="update user set password='"+u.getPassword()+"' where id="+u.getId()+" ";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		return "main.jsp";

	}*/
}
