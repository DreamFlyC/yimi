/**
 * 
 */
package com.lw.cms.bnusercode.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:42:58
 */
public class BnUserCode implements Serializable{
	private int id;
	private int userid;
	private String username;
	private String type;
	private String strcode;
	private int count;
	private int status;
	private Date efftime;
	private Date addtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStrcode() {
		return strcode;
	}
	public void setStrcode(String strcode) {
		this.strcode = strcode;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getEfftime() {
		return efftime;
	}
	public void setEfftime(Date efftime) {
		this.efftime = efftime;
	}
	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	
}