package com.lw.yiminews.entity;

import java.io.Serializable;
import java.util.Date;


public class YimiNews implements Serializable{
	private int id;
	private String title;
	private String url;
	private String img;
	private String content;
	private String seoKeywords;
	private String seoDescribe;
	private int num;
	private int clicknum;
	private String creatime;
	private String uptime;
	private int istop;
	private int type;
	
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getIstop() {
		return istop;
	}
	public void setIstop(int istop) {
		this.istop = istop;
	}
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSeoKeywords() {
		return seoKeywords;
	}
	public void setSeoKeywords(String seoKeywords) {
		this.seoKeywords = seoKeywords;
	}
	public String getSeoDescribe() {
		return seoDescribe;
	}
	public void setSeoDescribe(String seoDescribe) {
		this.seoDescribe = seoDescribe;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getClicknum() {
		return clicknum;
	}
	public void setClicknum(int clicknum) {
		this.clicknum = clicknum;
	}
	public String getCreatime() {
		return creatime;
	}
	public void setCreatime(String date) {
		this.creatime = date;
	}
	
}
