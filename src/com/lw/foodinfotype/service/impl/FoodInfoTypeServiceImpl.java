package com.lw.foodinfotype.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.foodinfotype.entity.FoodInfoType;
import com.lw.foodinfotype.persistence.FoodInfoTypeMapper;
import com.lw.foodinfotype.service.IFoodInfoTypeService;


@Service("FoodInfoTypeServiceImpl")
@Transactional
public class FoodInfoTypeServiceImpl extends BaseServiceImpl<FoodInfoType> implements IFoodInfoTypeService{
	@Autowired
	private FoodInfoTypeMapper foodInfoTypeMapper;
	
	public List<FoodInfoType> getByPid(Integer id){
		return foodInfoTypeMapper.getByPid(id);
	}
	
	public List<FoodInfoType> getAllOne(){
		return foodInfoTypeMapper.getAllOne();
	}
}
