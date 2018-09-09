package com.shxt.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.shxt.util.JdbcUtils01;

public class HallBean extends PageBean  {
	String url=null;
	JdbcUtils01 jdbc=new JdbcUtils01();

	/**
	 * 分页查询
	 * @param request
	 * @param pages
	 * @return
	 */
	public String list(HttpServletRequest request,int pages,int s){
		//String sql = "SELECT * FROM student where 1=1 ";
		StringBuilder sq=new StringBuilder("SELECT * FROM Hall where 1=1 ");
		
		//查询条件
		String idH1=request.getParameter("idH")==null?"":request.getParameter("idH").trim();
		String descriptionH1=request.getParameter("descriptionH")==null?"":request.getParameter("descriptionH").trim();
		if(descriptionH1!=null&&!descriptionH1.equals("")){
			sq.append(" and description like '%"+descriptionH1+"%'");
		}

		if(idH1!=null&&!idH1.equals("")){
			int p=Integer.parseInt(idH1);
			sq.append(" and idH = "+p+"");
		}

		if(s>0){
			sq.append(" and statusH >0 ");
		}else if(s<0){
			sq.append(" and statusH <0 ");
		}
		String sql=sq.toString();
		//System.out.println(sql);
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("idH1", idH1);
		request.setAttribute("descriptionH1", descriptionH1);
		
		request.setAttribute("url", "HallQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "hallList.jsp";
		}else{
			return "hallListBin.jsp";
		}
	}
	/**
	 * 按id查询员工
	 * @param request
	 * @param id
	 * @return
	 */
	public String query(HttpServletRequest request,int id){
		String sql="select * from Hall where idH="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		System.out.println("list   "+list);
		return "hallEdit.jsp";
	}
	
	public String querySeat(HttpServletRequest request,int idM){
		String sql2="select * from showmessage LEFT JOIN movie on showmessage.movie_id=movie.id where idM="+idM+" ";
		List<Map<String,Object>> listMessage=jdbc.list(sql2,new Object[]{} );
		request.setAttribute("listMessage", listMessage.get(0));
		
		String sql="select * from seat where hall_id="+listMessage.get(0).get("hall_id")+" and status=2";
		List<Map<String,Object>> seatlist=jdbc.list(sql,new Object[]{} );
		request.setAttribute("seatlist", seatlist);
		
		String start_time=new SimpleDateFormat("MM月dd日 HH点mm分").format(new Date());
		request.setAttribute("start_time", start_time);
		
		System.out.println("sql2"+sql2);
		System.out.println(listMessage.get(0).get("hall_id"));
		return "/front/hallTest.jsp";
	}
	/**
	 * 添加student
	 * @param u  user对象
	 * @return
	 */
	public String add(Hall h){
		String sql="insert into Hall(seat_num,description,pictureName) values("+h.getSeat_num()+",'"+h.getDescription()+"','"+h.getPictureName()+"')";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success add");
		}
		return "HallQueryServlet.do?oper=list";
	}
	/**
	 * 删除学生信息
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update Hall set statusH=-1 where idH="+id+"";
		System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "HallQueryServlet.do?oper=list";
	}
	
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(Hall h){
		String sql="update Hall set  seat_num="+h.getSeat_num()+", description='"+h.getDescription()+"' ,pictureName='"+h.getPictureName()+"' where idH="+h.getId();
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		return "message.jsp";
	}
	
	public String resetSeat(int hall_id){
		for(int i=1;i<11;i++){
			for(int j=1;j<11;j++){
				String sql2="update seat set status=1 where hall_id="+hall_id+" and raw="+i+" and col="+j+" ";
				jdbc.update(sql2, new Object[]{});
			}
		}
		return "HallQueryServlet.do?oper=list";
	}
}
