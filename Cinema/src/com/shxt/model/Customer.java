package com.shxt.model;
/**
 * Java  实体Bean 功能:存储客观实体的属性  并提供属性值的设置获取 方法（get set）
 * @author Administrator
 * 实体Bean与业务Bean的区别
 *（1）实体Bean只提供了set和get方法，用来设置和获取属性。
 *（2）业务Bean提供了与业务相适应的方法，可以通过对属性的运算、排列、组合等方式使Model适应具体的业务。
 *
 *MVC
 *1、Mode(模型)实现载体：JavaBean
 *2、View(视图)实现载体：jsp/html	接收用户请求  展示信息
 *3、Controller(控制器)实现载体：servlet		根据用户请求，选择合适的模型进行处理
 *										将模型处理的结果选择合适的视图响应给用户
 */
//员工模型
public class Customer {
	//8
	private int id;
	private String account;
	private String password;
	private String payPassword;
	private String name;
	private String tel;
	private String IDCard;
	private String email;
	public int getId() {
		return id;
	}
	public String getAccount() {
		return account;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getTel() {
		return tel;
	}
	public String getIDCard() {
		return IDCard;
	}

	public String getPayPassword() {
		return payPassword;
	}
	public String getEmail() {
		return email;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}
	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
