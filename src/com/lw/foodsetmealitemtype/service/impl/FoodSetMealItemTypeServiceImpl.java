package com.lw.foodsetmealitemtype.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.foodsetmealitemtype.entity.FoodSetMealItemType;
import com.lw.foodsetmealitemtype.persistence.FoodSetMealItemTypeMapper;
import com.lw.foodsetmealitemtype.service.IFoodSetMealItemTypeService;


@Service("FoodSetMealItemTypeServiceImpl")
@Transactional
public class FoodSetMealItemTypeServiceImpl extends BaseServiceImpl<FoodSetMealItemType> implements IFoodSetMealItemTypeService{
	@Autowired
	private FoodSetMealItemTypeMapper foodInfoTypeMapper;
}
