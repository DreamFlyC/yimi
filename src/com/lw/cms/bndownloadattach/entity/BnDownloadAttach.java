/**
 * 
 */
package com.lw.cms.bndownloadattach.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:42:58
 */
public class BnDownloadAttach implements Serializable{
	private int id;
	private int article_id;
	private String title;
	private String file_path;
	private String file_ext;
	private int file_size;
	private int down_num;
	private int point;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFile_ext() {
		return file_ext;
	}
	public void setFile_ext(String file_ext) {
		this.file_ext = file_ext;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public int getDown_num() {
		return down_num;
	}
	public void setDown_num(int down_num) {
		this.down_num = down_num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
}