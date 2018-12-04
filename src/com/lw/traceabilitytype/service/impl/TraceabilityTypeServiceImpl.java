package com.lw.traceabilitytype.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.traceabilitytype.entity.TraceabilityType;
import com.lw.traceabilitytype.persistence.TraceabilityTypeMapper;
import com.lw.traceabilitytype.service.ITraceabilityTypeService;

@Service("TraceabilityTypeServiceImpl")
@Transactional
public class TraceabilityTypeServiceImpl extends BaseServiceImpl<TraceabilityType> implements ITraceabilityTypeService{
	@Autowired
	private TraceabilityTypeMapper traceabilityTypeMapper;
	
	public List<TraceabilityType> getAllOne(){
		return traceabilityTypeMapper.getAllOne();
		
	}
	public List<TraceabilityType> getCityByProvinceId(Integer id){
		return traceabilityTypeMapper.getCityByProvinceId(id);
	}

	public List<TraceabilityType> getAreaByCityId(String id){
		return traceabilityTypeMapper.getAreaByCityId(id);
	}
	
	public List<TraceabilityType> getaddressByAreaId(Integer id){
		return traceabilityTypeMapper.getCityByProvinceId(id);
	}
}
