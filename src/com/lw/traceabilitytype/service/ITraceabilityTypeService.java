package com.lw.traceabilitytype.service;

import java.util.List;

import com.lw.core.base.service.IBaseService;
import com.lw.traceabilitytype.entity.TraceabilityType;

public interface ITraceabilityTypeService extends IBaseService<TraceabilityType>{

	public List<TraceabilityType> getAllOne();

	public List<TraceabilityType> getCityByProvinceId(Integer id);

	public List<TraceabilityType> getAreaByCityId(String id);

	public List<TraceabilityType> getaddressByAreaId(Integer id);

}
