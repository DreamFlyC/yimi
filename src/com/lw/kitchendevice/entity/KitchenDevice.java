/**
 * 
 */
package com.lw.kitchendevice.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月25日 上午10:58:27
 */
public class KitchenDevice implements Serializable{
	private int id;
	private String name;
	private String remark;
	private String author_key;
	private int kitchen_id;
	private String device_sn;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAuthor_key() {
		return author_key;
	}
	public void setAuthor_key(String author_key) {
		this.author_key = author_key;
	}
	public int getKitchen_id() {
		return kitchen_id;
	}
	public void setKitchen_id(int kitchen_id) {
		this.kitchen_id = kitchen_id;
	}
	public String getDevice_sn() {
		return device_sn;
	}
	public void setDevice_sn(String device_sn) {
		this.device_sn = device_sn;
	}
	
	
}