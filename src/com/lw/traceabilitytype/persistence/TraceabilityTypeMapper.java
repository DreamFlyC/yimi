package com.lw.traceabilitytype.persistence;

import java.util.List;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.traceabilitytype.entity.TraceabilityType;

public interface TraceabilityTypeMapper extends BaseMapper<TraceabilityType>{

	public List<TraceabilityType> getAllOne();
	
	public List<TraceabilityType> getCityByProvinceId(Integer id);

	public List<TraceabilityType> getAreaByCityId(String id);
	
	public List<TraceabilityType> getaddressByAreaId(Integer id);
}
