package com.shxt.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.shxt.util.JdbcUtils01;

public class CustomerBean extends PageBean  {
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
			String message="账号密码不匹配";
			request.setAttribute("message", message);
		}
		return url;
	}
	
	/**
	 * 分页查询
	 * @param request
	 * @param pages
	 * @return
	 */
	public String list(HttpServletRequest request,int pages){

		StringBuilder sq=new StringBuilder("SELECT * FROM customer where 1=1 ");
		
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String account1=request.getParameter("account")==null?"":request.getParameter("account").trim();
		String tel1=request.getParameter("tel")==null?"":request.getParameter("tel").trim();
		String email1=request.getParameter("email")==null?"":request.getParameter("email").trim();

		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}
		if(account1!=null&&!account1.equals("")){
			sq.append(" and account ='"+account1+"'");
		}
		if(tel1!=null&&!tel1.equals("")){
			sq.append(" and tel = '"+tel1+"'");
		}
		if(email1!=null&&!email1.equals("")){
			sq.append(" and email = '"+email1+"'");
		}

		String sql=sq.toString();
		//System.out.println(sql);
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("account1", account1);
		request.setAttribute("name1", name1);
		request.setAttribute("tel1", tel1);
		request.setAttribute("email1", email1);
		
		request.setAttribute("url", "CustomerQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);

		return "customerList.jsp";
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
		String sql="select * from customer where idC="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		
		StringBuilder sqlIndent1=new StringBuilder("SELECT * FROM indent WHERE customer_id="+id);
		sqlIndent1.append("  ORDER BY indent_code DESC ");
		String sqlIndent=sqlIndent1.toString();
		List<Map<String,Object>> IndentList=jdbc.list(sqlIndent,new Object[]{} );
		request.setAttribute("IndentList", IndentList);
		return "customerDetail.jsp";
	}
	
	@SuppressWarnings("null")
	public String queryFront(HttpServletRequest request,Customer c){
		String sql="select * from customer where telC='"+c.getTel()+"' and password='"+c.getPassword()+"'";
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		if(list!=null&&list.size()>0){
			//request.setAttribute("cus", list.get(0));
			HttpSession session=request.getSession();
			Map<String,Object> cc=list.get(0);
			session.setAttribute("cusSession",cc);
		}
		System.out.println("list   "+list);
		
		//用于插入座位
		/*for(int i=1;i<11;i++){
			for(int j=1;j<11;j++){
				String sql2="insert into seat(hall_id,raw,col,status) values(5,"+i+","+j+",1) ";
				jdbc.update(sql2, new Object[]{});
			}
		}*/
		return "/front/index.jsp";
		
	}
	
	public String queryByIdFront(HttpServletRequest request,Customer c){
		String sql="select * from customer where telC='"+c.getTel()+"' and password='"+c.getPassword()+"'";
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		if(list!=null&&list.size()>0){
			HttpSession session=request.getSession();
			Map<String,Object> cc=list.get(0);
			session.setAttribute("cusSession",cc);
			
			int id=Integer.parseInt(cc.get("idC").toString());
			StringBuilder sqlIndent1=new StringBuilder("SELECT * FROM indent WHERE customer_id="+id);
			sqlIndent1.append("  ORDER BY indent_code DESC ");
			String sqlIndent=sqlIndent1.toString();
			List<Map<String,Object>> IndentList=jdbc.list(sqlIndent,new Object[]{} );
			request.setAttribute("IndentList", IndentList);
		}

		return "/front/cusSelf.jsp";
		
	}
	/**
	 *  注册
	 * @param u  user对象
	 * @return
	 */
	public String add(Customer c){
		//String sql="insert into customer(account,password,nameC,telC,IDCard,payPassword,email) values('"+c.getAccount()+"','"+c.getPassword()+"','"+c.getName()+"','"+c.getTel()+"','"+c.getIDCard()+"','"+c.getPayPassword()+"','"+c.getEmail()+"')";
		String sql="insert into customer(password,telC) values('"+c.getPassword()+"','"+c.getTel()+"')";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success add");
		}
		return "/front/index.jsp";
	}
	/**
	 * 删除学生信息
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update customer set statusC=-1 where id="+id+"";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "CustomerQueryServlet.do?oper=list";
	}
	
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(Customer c){
		//String sql="update customer set  nameC='"+c.getName()+"', account='"+c.getAccount()+"' ,password='"+c.getPassword()+"',telC='"+c.getTel()+"',IDcard='"+c.getIDCard()+"',payPassword='"+c.getPassword()+"',email='"+c.getEmail()+"' where idC="+c.getId()+" ";
		String sql="update customer set  nameC='"+c.getName()+"', password='"+c.getPassword()+"',telC='"+c.getTel()+"',email='"+c.getEmail()+"' where idC="+c.getId()+" ";

		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		return "/front/CustomerQueryFrontServlet.do?oper=queryByIdFront&telC="+c.getTel()+"&password="+c.getPassword()+"";
	}
	public String sessionDel(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.setAttribute("cusSession", null);
		
		return "/front/index.jsp";
	}
}
