/**
 * 
 */
package com.lw.cms.bnusermessage.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:42:58
 */
public class BnUserMessage implements Serializable{
	private int id;
	private String type;
	private String postusername;
	private String acceptusername;
	private int isread;
	private String title;
	private String content;
	private Date posttime;
	private Date readtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPostusername() {
		return postusername;
	}
	public void setPostusername(String postusername) {
		this.postusername = postusername;
	}
	public String getAcceptusername() {
		return acceptusername;
	}
	public void setAcceptusername(String acceptusername) {
		this.acceptusername = acceptusername;
	}
	public int getIsread() {
		return isread;
	}
	public void setIsread(int isread) {
		this.isread = isread;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPosttime() {
		return posttime;
	}
	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}
	public Date getReadtime() {
		return readtime;
	}
	public void setReadtime(Date readtime) {
		this.readtime = readtime;
	}
	
	
}