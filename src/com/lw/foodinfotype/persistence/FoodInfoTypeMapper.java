package com.lw.foodinfotype.persistence;

import java.util.List;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.foodinfotype.entity.FoodInfoType;

public interface FoodInfoTypeMapper extends BaseMapper<FoodInfoType> {
	public List<FoodInfoType> getByPid(Integer id);
	
	public List<FoodInfoType> getAllOne();
}