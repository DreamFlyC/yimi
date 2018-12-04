/**
 * 
 */
package com.lw.cms.bnlink.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:42:58
 */
public class BnLink implements Serializable{
	private int id;
	private String title;
	private String user_name;
	private String user_tel;
	private String email;
	private String site_url;
	private String img_url;
	private int is_image;
	private int sort_id;
	private int is_red;
	private int is_lock;
	private Date add_time;
	
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSite_url() {
		return site_url;
	}
	public void setSite_url(String site_url) {
		this.site_url = site_url;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public int getIs_image() {
		return is_image;
	}
	public void setIs_image(int is_image) {
		this.is_image = is_image;
	}
	public int getSort_id() {
		return sort_id;
	}
	public void setSort_id(int sort_id) {
		this.sort_id = sort_id;
	}
	public int getIs_red() {
		return is_red;
	}
	public void setIs_red(int is_red) {
		this.is_red = is_red;
	}
	public int getIs_lock() {
		return is_lock;
	}
	public void setIs_lock(int is_lock) {
		this.is_lock = is_lock;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	
	
	
}