
package com.lw.adpic.entity;

import java.io.Serializable;


/**
 * @author CZP
 *
 * 2018年7月11日
 */
public class Adpic implements Serializable{
	private int id;
	private int type;
	private String smallpic;
	private String largepic;
	private String title;
	private String description;
	private boolean isshow;
	private String addtime;
	private String starttime;
	private String endtime;
	private int component;
	
	public int getComponent() {
		return component;
	}
	public void setComponent(int component) {
		this.component = component;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getSmallpic() {
		return smallpic;
	}
	public void setSmallpic(String smallpic) {
		this.smallpic = smallpic;
	}
	public String getLargepic() {
		return largepic;
	}
	public void setLargepic(String largepic) {
		this.largepic = largepic;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean getIsshow() {
		return isshow;
	}
	public void setIsshow(boolean isshow) {
		this.isshow = isshow;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	

}
