package com.shxt.model;

import java.util.Date;

public class ShowMessage {
	private int idM;
	private int movie_id;
	private int hall_id;
	private double price;
	private String start_time;
	private int num;
	private int status;
	private String remarks;
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getId() {
		return idM;
	}
	public void setId(int id) {
		this.idM = id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getHall_id() {
		return hall_id;
	}
	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

	public int getIdM() {
		return idM;
	}
	public void setIdM(int idM) {
		this.idM = idM;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ShowMessage [id=" + idM + ", movie_id=" + movie_id + ", hall_id=" + hall_id + ", price=" + price
				+ ", start_time=" + start_time + ", num=" + num + "]";
	}
	
	
}
