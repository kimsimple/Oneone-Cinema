package com.shxt.model;

import javax.servlet.http.HttpServletRequest;

import com.shxt.util.JdbcUtils01;


public class PageBean {
	
	public void setPage(JdbcUtils01 jd,String sql,int pages,HttpServletRequest request){
		setPage( jd, sql, pages, request,15);
	}
	public void setPage(JdbcUtils01 jd,String sql,int pages,HttpServletRequest request,int number){	
		request.setAttribute("pages", pages);///当前页数
		int count = jd.count(sql);		///记录总条数
		request.setAttribute("count", count);
		request.setAttribute("sumPage", (count%number==0)?(count/number):(count/number+1));///总页数
	}
}
