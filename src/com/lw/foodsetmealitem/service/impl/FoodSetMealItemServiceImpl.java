package com.lw.foodsetmealitem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.foodsetmealitem.entity.FoodSetMealItem;
import com.lw.foodsetmealitem.persistence.FoodSetMealItemMapper;
import com.lw.foodsetmealitem.service.IFoodSetMealItemService;


@Service("FoodSetMealItemServiceImpl")
@Transactional
public class FoodSetMealItemServiceImpl extends BaseServiceImpl<FoodSetMealItem> implements IFoodSetMealItemService{
	@Autowired
	private FoodSetMealItemMapper foodSetMealItemMapper;
}
