package com.lw.traceabilitytype.entity;

import java.io.Serializable;

public class TraceabilityType implements Serializable{
	private int id;
	private String name;
	private int parent_id;
	private Integer point_id;
	private Integer type_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getPoint_id() {
		return point_id;
	}
	public void setPoint_id(Integer point_id) {
		this.point_id = point_id;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	
	
}
