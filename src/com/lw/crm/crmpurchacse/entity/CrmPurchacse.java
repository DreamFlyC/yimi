package com.lw.crm.crmpurchacse.entity;

import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmuser.entity.CrmUser;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class CrmPurchacse implements Serializable{
	private int id;
	private String number;  //采购编号
	private int num;     //采购数量
	private String sid;     //供应商ID
	private String title;   //标题
	private String name;    //产品名称
	private Date date;      //申请日期
	private String uid;     //申请人ID
	private Double price;   //采购产品单价
	private String note;   //备注
	private String address; //地址
	private Integer is_approval; //审批
	private int type;
	private int ids;
	private CrmSupplier crmSupplier;
	private CrmUser crmUser;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getIs_approval() {
		return is_approval;
	}

	public void setIs_approval(Integer is_approval) {
		this.is_approval = is_approval;
	}

	public CrmSupplier getCrmSupplier() {
		return crmSupplier;
	}
	public void setCrmSupplier(CrmSupplier crmSupplier) {
		this.crmSupplier = crmSupplier;
	}
	public CrmUser getCrmUser() {
		return crmUser;
	}
	public void setCrmUser(CrmUser crmUser) {
		this.crmUser = crmUser;
	}
	public int getIds() {
		return ids;
	}
	public void setIds(int ids) {
		this.ids = ids;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNote(){
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
}
