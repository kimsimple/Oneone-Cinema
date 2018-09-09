package com.shxt.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shxt.util.JdbcUtils01;


/**
 * UserBean.java这一模型   主要功能 进行实质性的数据库操作  （增删改查）
 * @author Administrator
 *
 */
public class UserBean extends PageBean  {
	String url=null;
	JdbcUtils01 jdbc=new JdbcUtils01();
	/**
	 * 登录验证
	 * @param username
	 * @param password
	 * @return
	 */
	public String login(HttpServletRequest request,String username,String password){
		boolean flag=true;
		flag=jdbc.login(username, password);//从数据库查询
		if(flag){
			url="main.jsp";
		}else{
			url="login.jsp";
			/*String message="账号密码不匹配";
			request.setAttribute("message", message);*/
		}
		return url;
	}
	
	/**
	 * 分页查询
	 * @param request
	 * @param pages
	 * @return
	 */
	public String list(HttpServletRequest request,int pages,int s){
		//String sql = "SELECT * FROM student where 1=1 ";
		StringBuilder sq=new StringBuilder("SELECT * FROM user where 1=1 ");
		
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String account1=request.getParameter("account")==null?"":request.getParameter("account").trim();
		String power1=request.getParameter("power")==null?"":request.getParameter("power").trim();
		String IDCard1=request.getParameter("IDCard")==null?"":request.getParameter("IDCard").trim();
		System.out.println("I am userBean"+account1);
		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}
		if(account1!=null&&!account1.equals("")){
			sq.append(" and account ='"+account1+"'");
		}
		if(power1!=null&&!power1.equals("")&&!power1.equals("0")){
			int p=Integer.parseInt(power1);
			sq.append(" and power = "+p+"");
		}
		if(IDCard1!=null&&!IDCard1.equals("")){
			sq.append(" and IDCard = '"+IDCard1+"'");
		}

		if(s>0){
			sq.append(" and status >0 ");
		}else if(s<0){
			sq.append(" and status <0 ");
		}
		String sql=sq.toString();
		//System.out.println(sql);
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("account1", account1);
		request.setAttribute("name1", name1);
		request.setAttribute("power1", power1);
		
		request.setAttribute("url", "UserQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "userList.jsp";
		}else{
			return "userListBin.jsp";
		}
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
		String sql="select * from user where id="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		/*HttpSession session=request.getSession();
		User u=(User)session.getAttribute("userAcc");
		if(u.getId()==list.get(0).get("id")){
			return "userSelf.jsp";
		}*/
		return "userEdit.jsp";
	}
	
	public String querySelf(HttpServletRequest request,String  acc){
		System.out.println(acc);
		String sql="select * from user where account='"+acc+"'";
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		HttpSession session=request.getSession();
		session.setAttribute("userAcc", list.get(0));
		System.out.println("--**"+ list.get(0));
		return "userSelf.jsp";
	}
	/**
	 * 添加student
	 * @param u  user对象
	 * @return
	 */
	public String add(User u,HttpServletRequest request){
		String ss="select * from user where account='"+u.getAccount()+"' ";
		List<Map<String,Object>> l=jdbc.list(ss, new Object[]{});
		if(l==null||l.size()<=0){
			String sql="insert into user(account,password,name,tel,IDCard,status,power) values('"+u.getAccount()+"','"+u.getPassword()+"','"+u.getName()+"','"+u.getTel()+"','"+u.getIDCard()+"',"+u.getStatus()+","+u.getPower()+")";
			System.out.println(sql);
			int result=jdbc.update(sql, new Object[]{});
			if(result>0){
				System.out.println("success add");
			}
			return "UserQueryServlet.do?oper=list";
		}else{
			request.setAttribute("message", "已存在此账号");
			return "/backstage/userAdd.jsp";
		}
	}
	/**
	 * 删除学生信息
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update user set status=-1 where id="+id+"";
		System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "UserQueryServlet.do?oper=list";
	}
	
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(User u,int w){
		String sql="update user set  name='"+u.getName()+"' ,password='"+u.getPassword()+"',tel='"+u.getTel()+"',IDcard='"+u.getIDCard()+"',status="+u.getStatus()+",power="+u.getPower()+" where id="+u.getId()+" ";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		if(w==1){
			return "UserQueryServlet.do?oper=list";
		}else{
			return "UserQueryServlet.do?oper=querySelf&accSelf="+u.getAccount()+" ";
		}
	}
	
	public String editPas(User u){
		String sql="update user set password='"+u.getPassword()+"' where id="+u.getId()+" ";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		return "main.jsp";

	}
	
	public String sessionDel(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.setAttribute("userAcc", null);
		
		return "/backstage/login.jsp";
	}
}
