package com.shxt.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


//注解方法
//@WebFilter("/Filters")
//因为多个过滤器，难控制,在servlets  .class文件不可改，xml可改
//用xml

public class Filters implements Filter {

    public Filters() {
    	
    }

	public void destroy() {
		
	}
	String flag="on";//过滤器开关

	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request=(HttpServletRequest)req;
		if("on".equals(flag)){
			String method=request.getMethod();
			if("POST".equals(method)){
				request.setCharacterEncoding("UTF-8");
			}
		}//对get 方法 解决中文乱码问题    在server.xml  端口信息处加   URIEncoding="UTF-8"
		
		chain.doFilter(request, response);	//????
	}

	public void init(FilterConfig config) throws ServletException {
		//System.out.println(config.getInitParameter("key"));
		if(config.getInitParameter("key")!=null){
			flag=config.getInitParameter("key");
		}
		//可在xml中控制每个过滤器开关状况
	}

}
