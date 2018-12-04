/**
 * 
 */
package com.lw.cms.bnarticlealbums.entity;

import java.io.Serializable;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午2:59:41
 */
public class BnArticleAlbums implements Serializable{
	private int id;
	private int articleid;
	private String bigimg;
	private String smallimg;
	private String remark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArticleid() {
		return articleid;
	}
	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	public String getBigimg() {
		return bigimg;
	}
	public void setBigimg(String bigimg) {
		this.bigimg = bigimg;
	}
	public String getSmallimg() {
		return smallimg;
	}
	public void setSmallimg(String smallimg) {
		this.smallimg = smallimg;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
