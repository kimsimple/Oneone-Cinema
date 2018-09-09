package com.shxt.model;

import java.util.Arrays;

//影片模型
public class Movie {
	private int id;
	private String name;
	private String language;
	private String description;
	private String creat_time;//上映日期
	private int time;//片长
	private int status;
	private String actor;
	private String director;
	private String[] comment;
	private String[] picture;
	private Score  score;
	private String[] style;
	private String style1;
	private String pictureName;
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getLanguage() {
		return language;
	}
	public String getDescription() {
		return description;
	}

	


	public String getStyle1() {
		return style1;
	}
	public void setStyle1(String style1) {
		this.style1 = style1;
	}
	public String[] getStyle() {
		return style;
	}
	public void setStyle(String[] style) {
		this.style = style;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(String creat_time) {
		this.creat_time = creat_time;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public void setDescription(String description) {
		this.description = description;
	}


	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	
	
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String[] getComment() {
		return comment;
	}
	public void setComment(String[] comment) {
		this.comment = comment;
	}
	public String[] getPicture() {
		return picture;
	}
	public void setPicture(String[] picture) {
		this.picture = picture;
	}
	public Score getScore() {
		return score;
	}
	public void setScore(Score score) {
		this.score = score;
	}
	
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", language=" + language + ", description=" + description
				+ ", creat_time=" + creat_time + ", time=" + time + ", status=" + status + ", actor=" + actor
				+ ", director=" + director + ", comment=" + Arrays.toString(comment) + ", picture="
				+ Arrays.toString(picture) + ", score=" + score + ", style=" + Arrays.toString(style) + ", pictureName="
				+ pictureName + "]";
	}

}
