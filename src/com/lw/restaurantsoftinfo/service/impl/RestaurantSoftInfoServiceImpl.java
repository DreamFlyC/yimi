package com.lw.restaurantsoftinfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.restaurantsoftinfo.entity.RestaurantSoftInfo;
import com.lw.restaurantsoftinfo.persistence.RestaurantSoftInfoMapper;
import com.lw.restaurantsoftinfo.service.IRestaurantsoftinfoService;

@Service("RestaurantSoftInfoServiceImpl")
@Transactional
public class RestaurantSoftInfoServiceImpl extends BaseServiceImpl<RestaurantSoftInfo> implements IRestaurantsoftinfoService{
	@Autowired
	private RestaurantSoftInfoMapper restaurantSoftInfoMapper;
}
