package com.lw.foodsetmealitem.entity;

import java.io.Serializable;
import java.util.Date;

public class FoodSetMealItem implements Serializable {
    private int id;
    private String name;
    private String en_name;
    private String logo;
    private String type;
    private String unit;
    private Date adddate;
    private Date editdate;
    private double used_val;
    private int food_set_meal_id;
    private int food_info_id;
    
    
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public double getUsed_val() {
		return used_val;
	}
	public void setUsed_val(double used_val) {
		this.used_val = used_val;
	}
	public int getFood_set_meal_id() {
		return food_set_meal_id;
	}
	public void setFood_set_meal_id(int food_set_meal_id) {
		this.food_set_meal_id = food_set_meal_id;
	}
	public int getFood_info_id() {
		return food_info_id;
	}
	public void setFood_info_id(int food_info_id) {
		this.food_info_id = food_info_id;
	}
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
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getAdddate() {
		return adddate;
	}
	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}
	public Date getEditdate() {
		return editdate;
	}
	public void setEditdate(Date editdate) {
		this.editdate = editdate;
	}
    
    
}