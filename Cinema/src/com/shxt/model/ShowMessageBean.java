package com.shxt.model;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import com.shxt.util.JdbcUtils01;

public class ShowMessageBean extends PageBean  {
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
	public String list(HttpServletRequest request,int pages,int s){
		//String sql = "SELECT * FROM student where 1=1 ";
		StringBuilder sq=new StringBuilder("SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id  where 1=1 ");
		
		//查询条件
		String movie_name1=request.getParameter("movie_name")==null?"":request.getParameter("movie_name").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
		String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(movie_name1!=null&&!movie_name1.equals("")){
			sq.append(" and name like '%"+movie_name1+"%'");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and start_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and start_time <='"+toTime1+"'");
		}

		if(s>0){
			sq.append(" and showmessage.statusM >0 ");
		}else if(s<0){
			sq.append(" and showmessage.statusM <0 ");
		}
		sq.append(" order by start_time desc ");
		String sql=sq.toString();
		//System.out.println(sql);
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("movie_name1", movie_name1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		
		request.setAttribute("url", "ShowMessageQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "showMessageList.jsp";
		}else{
			return "showMessageListBin.jsp";
		}
	}

	
	public String listSchedule(HttpServletRequest request){
		java.text.SimpleDateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		java.text.SimpleDateFormat df1=new java.text.SimpleDateFormat("yyyy-MM-dd");
		//明天
		/*Date date = new Date();// 取时间
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(calendar.DATE, 1);// 把日期往后增加一天.整数往后推,负数往前移动
		date = calendar.getTime(); // 这个时间就是日期往后推一天的结果
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
		String dateString = formatter.format(date);*/

		//System.out.println(dateString);
		long time1= System.currentTimeMillis(); //从1970 1 1 0 0 0到现在的毫秒数
		//获取今天24点秒数
		Calendar c = Calendar.getInstance();//该方法返回一个日历Calendar  使用目前的时区和语言环境的方法得到一个日历
		c.set(Calendar.HOUR_OF_DAY, 24);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.MILLISECOND, 0);
		Date m6 = c.getTime();
		long time2 = m6.getTime();

		java.util.Date date1=new java.util.Date(time1);
		java.util.Date date2=new java.util.Date(time2);
		String dd1=df.format(date1);
		String dd2=df.format(date2);
		request.setAttribute("today", df1.format(date1));
		//当前时间到今日结束 所有发布信息
		String sqlToday="SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id "
				+ "where start_time>='"+dd1+"' and start_time<='"+dd2+"' ";
		List<Map<String,Object>> listToday = jdbc.listForPage(sqlToday, 1, 100);
		request.setAttribute("listToday", listToday);

		
		//用日历Calendar得到当前时间的日历，然后为当前的时间增加1000*60*60*24毫秒，就是一整天
		Calendar c2;
		/*c2=Calendar.getInstance();
		c2.setTime(new Date(c2.getTime().getTime()-1000*60*60*24));//昨天
		System.out.println("yesterday "+df.format(c2.getTime()));*/
		/*c2=Calendar.getInstance();//今天
		System.out.println("today "+df.format(c2.getTime()));*/
		c2 = Calendar.getInstance();//该方法返回一个日历Calendar  使用目前的时区和语言环境的方法得到一个日历
		c2.set(Calendar.HOUR_OF_DAY, 0);
		c2.set(Calendar.SECOND, 0);
		c2.set(Calendar.MINUTE, 0);
		c2.set(Calendar.MILLISECOND, 0);
		c2.setTime(new Date(c2.getTime().getTime()+1000*60*60*24));//明天0点
		Date m2 = c.getTime();
		
		String tomorrow1=df.format(m2);
		c2.setTime(new Date(c.getTime().getTime()+1000*60*60*24));//后天0点
		String tomorrow2=df.format(c2.getTime());
		request.setAttribute("tomorrow", df1.format(m2));

		/*明天*/
		String sqlTomorrow="SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id "
				+ "where start_time>='"+tomorrow1+"' and start_time<='"+tomorrow2+"' ";
		List<Map<String,Object>> listTomorrow = jdbc.listForPage(sqlTomorrow, 1, 100);
		request.setAttribute("listTomorrow", listTomorrow);
		
		c2.setTime(new Date(c.getTime().getTime()+1000*60*60*24*2));//后天0点
		String acquired1=df.format(c2.getTime());
		request.setAttribute("acquired", df1.format(c2.getTime()));

		c2.setTime(new Date(c.getTime().getTime()+1000*60*60*24*3));//后天0点
		String acquired2=df.format(c2.getTime());
		/*后天放映信息*/
		String sqlAcquired1="SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id "
				+ "where start_time>='"+tomorrow2+"' and start_time<='"+acquired1+"' ";
		List<Map<String,Object>> listAcquired1 = jdbc.listForPage(sqlAcquired1, 1, 100);
		/*大后天*/
		String sqlAcquired2="SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id "
				+ "where start_time>='"+acquired1+"' and start_time<='"+acquired2+"' ";
		List<Map<String,Object>> listAcquired2 = jdbc.listForPage(sqlAcquired2, 1, 100);

		request.setAttribute("listAcquired1", listAcquired1);
		request.setAttribute("listAcquired2", listAcquired2);

		
		return "/front/schedule.jsp";
	}
	
	/**
	 * 按id查询员工
	 * @param request
	 * @param id
	 * @return
	 */
	public String query(HttpServletRequest request,int id){
		String sql="SELECT * FROM showmessage LEFT JOIN movie ON showmessage.movie_id=movie.id WHERE idM="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		
		String sqlHall="select * from hall where statusH>0";
		List<Map<String,Object>> listHall=jdbc.list(sqlHall, new Object[]{});
		request.setAttribute("listHall", listHall);
		//System.out.println("iid+---   "+id);
		return "showMessageEdit.jsp";
	}
	
	/**
	 * 添加student
	 * @param u  user对象
	 * @return
	 */
	public String add(ShowMessage s){
		Object rem=s.getRemarks();
		String sql=null;
		if(rem==null)
		{
			sql="insert into showMessage(movie_id,hall_id,price,start_time,statusM) "
					+ "values("+s.getMovie_id()+","+s.getHall_id()+","+s.getPrice()+",'"+s.getStart_time()+"',"+s.getStatus()+")";
		}else{
			sql="insert into showMessage(movie_id,hall_id,price,start_time,remarks,statusM) "
					+ "values("+s.getMovie_id()+","+s.getHall_id()+","+s.getPrice()+",'"+s.getStart_time()+"','"+s.getRemarks()+"',"+s.getStatus()+")";
		}
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success add");
		}
		return "ShowMessageQueryServlet.do?oper=list";
	}
	/**
	 * 删除学生信息
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update showMessage set status=-1 where idM="+id+"";
		System.out.println("delete       "+sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "ShowMessageQueryServlet.do?oper=list";
	}
	
	/**
	 * 修改学生信息
	 * @param u 传入要修改为数据
	 * @return
	 */
	public String edit(ShowMessage s){
		String sql="update showMessage set  hall_id="+s.getHall_id()+","
				+ " shop_num="+s.getNum()+" ,price="+s.getPrice()+","
						+ "start_time='"+s.getStart_time()+"',statusM="+s.getStatus()+","
								+ "remarks='"+s.getRemarks()+"' where showmessage.idM="+s.getId()+" ";
		System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success edit");
		}
		return "ShowMessageQueryServlet.do?oper=list";
	}
}
