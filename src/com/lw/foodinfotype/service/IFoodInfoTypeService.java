package com.lw.foodinfotype.service;

import java.util.List;

import com.lw.core.base.service.IBaseService;
import com.lw.foodinfotype.entity.FoodInfoType;

public interface IFoodInfoTypeService extends IBaseService<FoodInfoType>{

	/**
	 * @Desc 
	 * @param id
	 * @return
	 * @author CZP
	 */
	public List<FoodInfoType> getByPid(Integer id);

	/**
	 * @Desc 
	 * @return
	 * @author CZP
	 */
	public List<FoodInfoType> getAllOne();

}
