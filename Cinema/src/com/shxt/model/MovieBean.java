package com.shxt.model;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.shxt.util.JdbcUtils01;
import com.shxt.util.Util02;

public class MovieBean extends PageBean  {
	String url=null;
	JdbcUtils01 jdbc=new JdbcUtils01();
	private  String[] styleConst={"action","adventure","comedy","crime","horror","sci_fi","romance"};
	private  String[] styleConst2={"动作","冒险","喜剧","犯罪","惊悚","科幻","爱情"};
	/**
	 * 后台电影 分页查询
	 * @param request
	 * @param pages
	 * @return
	 */
	public String list(HttpServletRequest request,int pages,int s){
		StringBuilder sq=new StringBuilder("SELECT * FROM movie where 1=1 ");
		
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
	    String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and creat_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and creat_time <='"+toTime1+"' ");
		}

		if(s>0){
			sq.append(" and status >0 ");
		}else if(s<0){
			sq.append(" and status <0 ");
		}
		sq.append(" order by id desc ");
		String sql=sq.toString();
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		request.setAttribute("name1", name1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		
		request.setAttribute("url", "MovieQueryServlet.do");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "movieList.jsp";
		}else{
			return "movieListBin.jsp";
		}
	}
	
	/**
	 * 放映信息添加
	 * @param request
	 * @param movie_id
	 * @param movie_name
	 * @return
	 */
	public String showMessageAdd(HttpServletRequest request,int movie_id ,String movie_name){
		String sqlHall="select * from hall where statusH>0";
		List<Map<String,Object>> listHall=jdbc.list(sqlHall, new Object[]{});
		request.setAttribute("movie_id", movie_id);
		request.setAttribute("movie_name", movie_name);
		request.setAttribute("listHall", listHall);
		System.out.println("listHall  "+listHall);
		return "/backstage/showMessageAdd.jsp";
	}
	/**
	 * 后台 热映电影查询
	 * @param request
	 * @param pages
	 * @param s
	 * @return
	 */
	public String listISHot(HttpServletRequest request,int pages,int s){
		StringBuilder sq=new StringBuilder("select * from movie WHERE ISHot>0 ");
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
	    String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and creat_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and creat_time <='"+toTime1+"' ");
		}

		if(s>0){
			sq.append(" and status >0 ");
		}else if(s<0){
			sq.append(" and status <0 ");
		}
		sq.append(" order by id desc ");
		request.setAttribute("name1", name1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		
		String sql=sq.toString();
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		
		request.setAttribute("url", "MovieQueryServlet.do?oper=listISHot&page=1&status=1");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "movieListISHot.jsp";
		}else{
			return "movieListBinISHot.jsp";
		}
	}
	
	/**
	 * 后台即将上映电影查询
	 * @param request
	 * @param pages
	 * @param s
	 * @return
	 */
	public String listComingSoon(HttpServletRequest request,int pages,int s){
		StringBuilder sq=new StringBuilder("select * from movie WHERE comingSoon>0  ");
	
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
	    String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and creat_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and creat_time <='"+toTime1+"' ");
		}

		if(s>0){
			sq.append(" and status >0 ");
		}else if(s<0){
			sq.append(" and status <0 ");
		}
		sq.append(" order by id desc ");
		request.setAttribute("name1", name1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		
		String sql=sq.toString();
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		
		request.setAttribute("url", "MovieQueryServlet.do?oper=listComingSoon&page=1&status=1");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "movieListComingSoon.jsp";
		}else{
			return "movieListBinComingSoon.jsp";
		}
	}

	/**
	 * 后台 面板电影查询
	 * @param request
	 * @param pages
	 * @param s
	 * @return
	 */
	public String listPlate(HttpServletRequest request,int pages,int s){
		StringBuilder sq=new StringBuilder("select * from movie WHERE plate>0");
		
		//查询条件
		String name1=request.getParameter("name")==null?"":request.getParameter("name").trim();
		String fromTime1=request.getParameter("fromTime")==null?"":request.getParameter("fromTime").trim();
	    String toTime1=request.getParameter("toTime")==null?"":request.getParameter("toTime").trim();
		if(name1!=null&&!name1.equals("")){
			sq.append(" and name like '%"+name1+"%'");
		}

		if(fromTime1!=null&&!fromTime1.equals("")){
			sq.append(" and creat_time >= '"+fromTime1+"' ");
		}
		if(toTime1!=null&&!toTime1.equals("")){
			sq.append(" and creat_time <='"+toTime1+"' ");
		}

		if(s>0){
			sq.append(" and status >0 ");
		}else if(s<0){
			sq.append(" and status <0 ");
		}
		sq.append(" order by id desc ");
		request.setAttribute("name1", name1);
		request.setAttribute("fromTime1", fromTime1);
		request.setAttribute("toTime1", toTime1);
		
		String sql=sq.toString();
		List<Map<String,Object>> list = jdbc.listForPage(sql, pages, 15);
		request.setAttribute("list", list);
		
		request.setAttribute("url", "MovieQueryServlet.do?oper=listPlate&page=1&status=1");
		super.setPage(jdbc, sql, pages, request);
		if(s>0){
			return "movieListPlate.jsp";
		}else{
			return "movieListPlateBin.jsp";
		}
	}
	
	/**
	 * 返回正在热映列表
	 * @return
	 */
	public List<Map<String, Object>> ISHotFront(){
		String sql="select * from movie WHERE ISHot>0 ORDER BY ISHot ";
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> list = Util02.list(sql);
		return list;
	}
	
	/**
	 * 返回即将上映列表
	 * @return
	 */
	public List<Map<String, Object>> ComingSoonFront(){
		StringBuilder sq=new StringBuilder("select * from movie WHERE comingSoon>0 ORDER BY comingSoon ");
		String sql=sq.toString();
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> list = Util02.list(sql);
		return list;
	}
	
	/**
	 * 返回 面板电影 列表
	 * @return
	 */
	public List<Map<String, Object>> PlateFront(){
		StringBuilder sq=new StringBuilder("select * from movie WHERE plate>0");
		String sql=sq.toString();
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> list = Util02.list(sql);
		return list;
	}
	
	/**
	 * 根据id查询一部电影的信息
	 * @param request
	 * @param id
	 * @param where
	 * @return
	 */
	public String query(HttpServletRequest request,int id,int where){
		String sql="select * from movie where id="+id;
		List<Map<String,Object>> list=jdbc.list(sql,new Object[]{} );
		request.setAttribute("list", list);
		Map<String,Object> movie=list.get(0);
		request.setAttribute("movie", movie);
		/*//查询演员
		String sqlA="select * from movie_actor where movie_id="+id;
		List<Map<String,Object>> actor=jdbc.list(sqlA,new Object[]{} );
		request.setAttribute("actor", actor);
		System.out.println("actor:  "+actor);*/
		/*//查询风格
		String sqlS="select * from movie_style where movie_id="+id;
		List<Map<String,Object>> style=jdbc.list(sqlS,new Object[]{} );
		int len=style.size();
		String tt="";
		for(int i=0;i<len;i++){
			if(style.get(i).get(styleConst[i]).toString().compareTo("0")>0){
				tt+=styleConst2[i]+" ";
			}
		}
		request.setAttribute("style", style);
		request.setAttribute("tt", tt);*/

		//剧情
		String txt="";
		Object des=list.get(0).get("description");
		if(des!=null){
			txt=this.read(des.toString());
		}
		request.setAttribute("txt", txt);
		System.out.println(txt);
		//影评
		String sqlComment="SELECT comment1.*,customer.* from comment1,customer WHERE comment1.customer_idCom =customer.idC and statusComment>0 and movie_idCom="+id;
		List<Map<String,Object>> comment1=jdbc.list(sqlComment,new Object[]{} );
		if(comment1!=null){
			request.setAttribute("comment1", comment1);
		}
		
		
		//平均分
		String sss="select SUM(scoreCom) as b FROM comment1 WHERE movie_idCom ="+id+" and statusComment>0 ";
		List<Map<String,Object>> llll=jdbc.list(sss,new Object[]{} );
		String sss2="select count(*) as c FROM comment1 WHERE movie_idCom ="+id+"  and statusComment>0 ";
		List<Map<String,Object>> llll2=jdbc.list(sss2,new Object[]{} );
		if(llll.get(0).get("b")!=null&&llll2.get(0).get("c")!=null){
			
			int average1=Integer.parseInt(llll.get(0).get("b").toString());
			int count=Integer.parseInt(llll2.get(0).get("c").toString());
			if(average1>0&&count>0){
				Double average2=(double)average1/count;
				String average=average2.toString().substring(0,average2.toString().indexOf(".")+2 );   
				
				request.setAttribute("average", average);
				System.out.println("average  "+average);
			}
		}
		
		if(where>0){
			return "movieEdit.jsp";
		}else{
			return "/front/single.jsp";
		}
	}
	
	/**
	 * 添加电影
	 * @param u
	 * @param request
	 * @return
	 */
	public String add(Movie u,HttpServletRequest request){
		
		String sql="insert into movie(name,language,creat_time,time,status,director,actor,style) "
				+ "values('"+u.getName()+"','"+u.getLanguage()+"','"+u.getCreat_time()+"',"+u.getTime()+","
						+ ""+u.getStatus()+",'"+u.getDirector()+"','"+u.getActor()+"','"+u.getStyle1()+"')";
		//System.out.println(sql);
		int result=jdbc.update(sql, new Object[]{});
		//获取此电影id
		String sql111="select * from movie where name='"+u.getName()+"'";
		int id= (int) jdbc.list(sql111,  new Object[]{}).get(0).get("id");
		//存储电影风格
		/*String[] style=u.getStyle();
		String text1 = null,text2=null;
		int len=0;
		if(style!=null&&style.length>0){
			len=style.length;
			if(len>0){
				text1=style[0];text2="1";
				for(int i=1;i<len;i++){
					text1+=","+style[i];
					text2+=",1";
				}
			}
		}
		String sqlStyle="insert into movie_style(movie_id,"+text1+") values("+id+","+text2+")";
		int result2=jdbc.update(sqlStyle, new Object[]{});*/
		//存储演员
		/*String actor=u.getActor();
		for (String string : actor) {
			if(string.trim().equals("")){
				String sqlA="insert into movie_actor(movie_id,actor) values("+id+",'"+string+"')";
				jdbc.update(sqlA, new Object[]{});
			}
		}
		*/
		/*if(result>0&&result2>0){
			System.out.println("success add");
		}*/
		/*存储电影描述*/
		String txt=u.getDescription();
		System.out.println("Description：  "+txt);
		String fileName=data+id+".txt";
		this.write(fileName, txt);
		String sqlD="update movie set description='"+fileName+"' where id="+id;
		jdbc.update(sqlD, new Object[]{});
		
		//存储电影图片名称
		Object pic=request.getAttribute("filename");
		if(pic!=null){			
			//String pictureSql="insert into movie_picture(movie_id,name) values("+id+",'"+pic+"')";
			String pictureSql="update movie set pictureName='"+pic+"' where id="+id;
			jdbc.update(pictureSql, new Object[]{});
		}
		
		//存储plate picture名称
		pic=request.getAttribute("filenamePlate");
		if(pic!=null){			
			//String pictureSql="insert into movie_picture(movie_id,name) values("+id+",'"+pic+"')";
			String pictureSql="update movie set platepicture='"+pic+"' where id="+id;
			jdbc.update(pictureSql, new Object[]{});
		}
		
		return "MovieQueryServlet.do?oper=list";
	}
	/**
	 * 删除电影到回收站，电影下架
	 * @param id  传入int 型号码
	 * @return 
	 */
	public String delete(int id){
		String sql="update movie set status=-1 where id="+id+"";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "MovieQueryServlet.do?oper=list";
	}
	/***
	 * 取消热映
	 * @param id
	 * @return
	 */
	public String dealNotHot(int id){
		String sql="update movie set ISHot=-1 where id="+id+"";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "MovieQueryServlet.do?oper=listISHot";
	}
	/**
	 * 取消即将上映
	 * @param id
	 * @return
	 */
	public String dealNotComingSoon(int id){
		String sql="update movie set comingSoon=-1 where id="+id+"";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "MovieQueryServlet.do?oper=listComingSoon";
	}
	/**
	 * 取消宣传面板
	 * @param id
	 * @return
	 */
	public String dealNotPlate(int id){
		String sql="update movie set plate=-1 where id="+id+"";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			System.out.println("success delete");
		}
		return "MovieQueryServlet.do?oper=listPlate";
	}
	
	/**
	 * 修改电影信息
	 * @param u
	 * @param request
	 * @return
	 */
	public String edit(Movie u,HttpServletRequest request){
		//将描述存入txt文件
		String txt=u.getDescription();
		String fileName=data+u.getId()+".txt";
		this.write(fileName, txt);
		//修改
		String sql="update movie set  name='"+u.getName()+"', description='"+fileName+"',language='"+u.getLanguage()+"',"
				+ "creat_time='"+u.getCreat_time()+"',time="+u.getTime()+",status="+u.getStatus()+",actor='"+u.getActor()+"',director='"+u.getDirector()+"' ,style='"+u.getStyle1()+"' where id="+u.getId()+" ";
		int result=jdbc.update(sql, new Object[]{});
		if(result>0){
			//System.out.println("success edit");
		}
		
		//风格存储
		
		/*String[] style=u.getStyle();
		String sqlCheck="select * from movie_style where movie_id="+u.getId();
		Object a=jdbc.list(sqlCheck, new Object[]{});
		if(style!=null&&style.length>0){
			int len=style.length;
			if(a==null){
				len=style.length;
				String sqlStyle="";
				for(int i=0;i<len;i++){
					//存储电影风格
					String sql1="insert into movie_style(movie_id) values("+u.getId()+")";
					int result2=jdbc.update(sql1, new Object[]{});
					
				}
			}
			int styleConLen= styleConst.length;
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < len; i++){
			 sb. append(style[i]);
			}
			String a1 = sb.toString();
			String sqlS0="";
			for (int i = 0; i <styleConLen; i++) {
				if(!a1.contains(styleConst[i])){
					sqlS0="update movie_style set "+styleConst[i]+"=0 where movie_id="+u.getId();
				}else{
					sqlS0="update movie_style set "+styleConst[i]+"=1 where movie_id="+u.getId();
				}
				a=jdbc.update(sqlS0, new Object[]{});
			}
		}*/
		
		
		//演员存储
	/*	String[] actor=u.getActor();
		for (String string : actor) {
			if(string.trim().equals("")){
				String sqlA="insert into movie_actor(movie_id,actor) values("+u.getId()+",'"+string+"')";
				jdbc.update(sqlA, new Object[]{});
			}
		}*/
			
		//存储电影图片名称
		Object pic=request.getAttribute("filename");
		if(pic!=null){			
			//String pictureSql="insert into movie_picture(movie_id,name) values("+id+",'"+pic+"')";
			String pictureSql="update movie set pictureName='"+pic+"' where id="+u.getId();
			jdbc.update(pictureSql, new Object[]{});
		}
		//存储plate picture名称
		pic=request.getAttribute("filenamePlate");
		if(pic!=null){			
			//String pictureSql="insert into movie_picture(movie_id,name) values("+id+",'"+pic+"')";
			String pictureSql="update movie set platepicture='"+pic+"' where id="+u.getId();
			jdbc.update(pictureSql, new Object[]{});
		}
		
		//存储video名称
		Object videov=request.getAttribute("filenameVideo");
		if(videov!=null){			
			String pictureSql="update movie_video set addressV='"+videov+"' where idV="+u.getId();
			jdbc.update(pictureSql, new Object[]{});
		}
		return "MovieQueryServlet.do?oper=list";
	}
	
	/**
	 * 文件存储地址
	 */
	private String data="C:/photo/description/";
	/**
	 * 将字符串写入txt文件，实现大段影片介绍
	 * @param fileNameS
	 * @param txt
	 */
	private void write(String fileNameS,String txt){
		File fileName=new File(fileNameS);
		 if(!fileName.exists()){  
		    try {
				fileName.createNewFile();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		  }
		 FileWriter fw=null;
		try {
			fw = new FileWriter(fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     BufferedWriter out = new BufferedWriter(fw);
        try {
			out.write(txt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        try {
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 从txt文件读出
	 * @param fileNameS
	 * @return
	 */
	private  String read(String fileNameS){
		File fileName=new File(fileNameS);
		FileReader fr=null;
		try {
			fr = new FileReader(fileName);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
        BufferedReader in = new BufferedReader(fr);
        String text = "";
        while (true) {
            String line="";
        	try {
        		line= in.readLine();
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(line==null){
				break;
			}
			text+=line+"\n";
        }
        try {
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
        return text;
	}
	
	/**
	 * 设置正在热映
	 * @param id
	 * @return
	 */
	public String setIsHot(int id){
		String sql="update movie set ISHot=1 where id="+id;
		jdbc.update(sql,new Object[]{});
		return "MovieQueryServlet.do?oper=listISHot&page=1&status=1";
	}
	
	/**
	 * 设置即将上映
	 * @param id
	 * @return
	 */
	public String setComingSoon(int id){
		String sql="update movie set comingSoon=1 where id="+id;
		jdbc.update(sql,new Object[]{});
		return "MovieQueryServlet.do?oper=listComingSoon&page=1&status=1";
	}
	
	
	/**
	 * 设置宣传面板
	 * @param id
	 * @return
	 */
	public String setPlate(int id){
		String sql="update movie set plate=1 where id="+id;
		jdbc.update(sql,new Object[]{});
		return "MovieQueryServlet.do?oper=listPlate&page=1&status=1";
	}
	
	public String changePlatePicture(int id){
		return "";
	}
}
