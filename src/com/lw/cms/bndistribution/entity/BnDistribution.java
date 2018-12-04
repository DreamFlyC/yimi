/**
 * 
 */
package com.lw.cms.bndistribution.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:42:58
 */
public class BnDistribution implements Serializable{
	private int id;
	private String title;
	private String remark;
	private int type;
	private double amount;
	private int sort_id;
	private int is_lock;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public int getSort_id() {
		return sort_id;
	}
	public void setSort_id(int sort_id) {
		this.sort_id = sort_id;
	}
	public int getIs_lock() {
		return is_lock;
	}
	public void setIs_lock(int is_lock) {
		this.is_lock = is_lock;
	}

	
}