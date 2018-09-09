package com.shxt.model;

//影片模型
public class Hall {
	private int id;
	private int  seat_num;
	private String description;
	private String pictureName;
	public int getId() {
		return id;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public String getDescription() {
		return description;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	
	
}
