/**
 * 
 */
package com.lw.dingtalkmsg.entity;

import java.io.Serializable;

/**
 * @author CZP
 *
 * 2018年7月31日
 */
public class Dingtalkmsg implements Serializable{
	private int id;
	private int errcode;
	private String errmsg;
	private String send_result;
	private String invalid_user_id_list;
	private String forbidden_user_id_list;
	private String failed_user_id_list;
	private String read_user_id_list;
	private String unread_user_id_list;
	private String invalid_dept_id_list;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getErrcode() {
		return errcode;
	}
	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public String getSend_result() {
		return send_result;
	}
	public void setSend_result(String send_result) {
		this.send_result = send_result;
	}
	public String getInvalid_user_id_list() {
		return invalid_user_id_list;
	}
	public void setInvalid_user_id_list(String invalid_user_id_list) {
		this.invalid_user_id_list = invalid_user_id_list;
	}
	public String getForbidden_user_id_list() {
		return forbidden_user_id_list;
	}
	public void setForbidden_user_id_list(String forbidden_user_id_list) {
		this.forbidden_user_id_list = forbidden_user_id_list;
	}
	public String getFailed_user_id_list() {
		return failed_user_id_list;
	}
	public void setFailed_user_id_list(String failed_user_id_list) {
		this.failed_user_id_list = failed_user_id_list;
	}
	public String getRead_user_id_list() {
		return read_user_id_list;
	}
	public void setRead_user_id_list(String read_user_id_list) {
		this.read_user_id_list = read_user_id_list;
	}
	public String getUnread_user_id_list() {
		return unread_user_id_list;
	}
	public void setUnread_user_id_list(String unread_user_id_list) {
		this.unread_user_id_list = unread_user_id_list;
	}
	public String getInvalid_dept_id_list() {
		return invalid_dept_id_list;
	}
	public void setInvalid_dept_id_list(String invalid_dept_id_list) {
		this.invalid_dept_id_list = invalid_dept_id_list;
	}

	
}
