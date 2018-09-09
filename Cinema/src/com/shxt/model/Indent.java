package com.shxt.model;

public class Indent {
	private int id;
	private int customer_id;
	private int showMessage_id;
	private String code;
	private String tel;
	private double price;
	private int seat1;
	private int seat2;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public int getShowMessage_id() {
		return showMessage_id;
	}
	public void setShowMessage_id(int showMessage_id) {
		this.showMessage_id = showMessage_id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public int getSeat1() {
		return seat1;
	}
	public void setSeat1(int seat1) {
		this.seat1 = seat1;
	}
	public int getSeat2() {
		return seat2;
	}
	public void setSeat2(int seat2) {
		this.seat2 = seat2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
