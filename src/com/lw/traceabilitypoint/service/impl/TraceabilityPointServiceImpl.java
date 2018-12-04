package com.lw.traceabilitypoint.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.traceabilitypoint.entity.TraceabilityPoint;
import com.lw.traceabilitypoint.persistence.TraceabilityPointMapper;
import com.lw.traceabilitypoint.service.ITraceabilityPointService;

@Service("TraceabilityPointServiceImpl")
@Transactional
public class TraceabilityPointServiceImpl extends BaseServiceImpl<TraceabilityPoint> implements ITraceabilityPointService{
	@Autowired
	private TraceabilityPointMapper traceabilityPointMapper;
}
