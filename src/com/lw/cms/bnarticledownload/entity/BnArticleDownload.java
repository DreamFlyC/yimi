/**
 * 
 */
/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午4:04:30
 */
package com.lw.cms.bnarticledownload.entity;

import java.io.Serializable;

public class BnArticleDownload implements Serializable{
	private int id;
	private int ismsg;
	private int isred;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIsmsg() {
		return ismsg;
	}
	public void setIsmsg(int ismsg) {
		this.ismsg = ismsg;
	}
	public int getIsred() {
		return isred;
	}
	public void setIsred(int isred) {
		this.isred = isred;
	}
	
	
}