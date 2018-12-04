/**
 * 
 */
package com.lw.cms.bnarticlediggs.entity;

import java.io.Serializable;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午2:59:41
 */
public class BnArticleDiggs implements Serializable{
	private int id;
	private int digggood;
	private int diggbad;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDigggood() {
		return digggood;
	}
	public void setDigggood(int digggood) {
		this.digggood = digggood;
	}
	public int getDiggbad() {
		return diggbad;
	}
	public void setDiggbad(int diggbad) {
		this.diggbad = diggbad;
	}
	
	
	
}
