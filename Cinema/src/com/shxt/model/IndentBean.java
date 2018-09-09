package com.shxt.model;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.shxt.util.JdbcUtils01;
import com.shxt.util.Util02;

public class IndentBean extends PageBean  {
	String url=null;
	JdbcUtils01 jdbc=new JdbcUtils01();
	

	public String list(HttpServletRequest request,int pages,int s){
		//String sql = "SELECT * FROM student where 1=1 ";
		StringBuilder sq=new StringBuilder("SELECT indent.*,showmessage.*,"
				+ "customer.*,movie.* FROM indent,showmessage,customer,movie "
				+ "WHERE indent.message_id=showmessage.idM AND "
+"showmessage.movie_id=movie.id and indent.customer_id=customer.idC ");
		StringBuilder sq2=new StringBuilder(
		"select SUM(payment) as payment FROM indent LEFT JOIN showmessage on indent.message_id=showmessage.idM WHERE 1=1 ");
		
		//查询条件
		String indent_code1=request.getParameter("indent_code")==null?"":request.getParameter("indent_code").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
		String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(indent_code1!=null&&!indent_code1.equals("")){
			sq.append(" and indent_code like '%"+indent_code1+"%'");
			sq2.append(" and indent_code like '%"+indent_code1+"%' ");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and start_time >= '"+fromTime1+"' ");
			sq2.append(" and start_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and start_time <='"+toTime1+"'");
			sq2.append(" and start_time <= '"+toTime1+"' ");
		}

		if(s>0){
			sq.append(" and statusI >0 ");
			sq2.append(" and statusI >0 ");
		}else if(s<0){
			sq.append(" and statusI <0 ");
			sq2.append(" and statusI <0 ");
		}
		String sql=sq.toString();
		String sql2=sq2.toString();

		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		@SuppressWarnings("unchecked")
		//利润统计
		List<Map<String,Object>> list2 = Util02.list(sql2);
		String payment=(String) list2.get(0).get("payment");
		request.setAttribute("list", list);
		request.setAttribute("indent_code1", indent_code1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		request.setAttribute("payment", payment);
		
		request.setAttribute("url", "IndentQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "indentList.jsp";
		}else{
			return "indentListBin.jsp";
		}
	}


	public String query(HttpServletRequest request,int id){
		String sql="select * from Indent where id="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		System.out.println("list   "+list);
		return "indentEdit.jsp";
	}
	
	/**
	 * 添加student
	 * @param u  user对象
	 * @return
	 */
	public String add(Indent i,int [][] seat,HttpServletRequest request){
		int len=seat.length;
		String sm="select * from showmessage where idM="+i.getShowMessage_id();
		List<Map<String,Object>> l=jdbc.list(sm, new Object[]{});
		int hall_id=Integer.parseInt(l.get(0).get("hall_id").toString());
		for(int j=0;j<len;j++){
			String sql="insert into Indent(customer_id,message_id,indent_code,tel,seat1,seat2,payment)"
					+ " values("+i.getCustomer_id()+","+i.getShowMessage_id()+",'"+i.getCode()+"','"+i.getTel()+"',"+seat[j][0]+","
					+ ""+seat[j][1]+","+i.getPrice()/len+")";
			System.out.println(sql);
			int result=jdbc.update(sql, new Object[]{});
			
			//设置座位已售
			String s="update seat set status=2 where raw="+seat[j][0]+" and col="+seat[j][1]+" and hall_id="+hall_id;
			int a=jdbc.update(s, new Object[]{});
			System.out.println(a+"  "+s );
		}
		
		String s="select * from customer where idC="+i.getCustomer_id();
		List<Map<String,Object>> ll=jdbc.list(s, new Object[]{});
		String tel=ll.get(0).get("telC").toString();
		String paw=ll.get(0).get("password").toString();
		return "/front/CustomerQueryFrontServlet.do?oper=queryByIdFront&telC="+tel+"&password="+paw+"";
	}
	/**
	 * 删除学生信息
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update Indent set status=-1 where id="+id+"";
		System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "IndentQueryServlet.do?oper=list";
	}
	
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(Indent u){
		//String sql="update Indent set  name='"+u.getName()+"', account='"+u.getAccount()+"' ,password='"+u.getPassword()+"',tel='"+u.getTel()+"',IDcard='"+u.getIDCard()+"',status="+u.getStatus()+",power="+u.getPower()+" where id="+u.getId()+" ";
		//int result=jdbc.update(sql, new Object[]{});
		/*if(result>0){
			System.out.println("success edit");
		}*/
		return "IndentQueryServlet.do?oper=list";
	}
}
