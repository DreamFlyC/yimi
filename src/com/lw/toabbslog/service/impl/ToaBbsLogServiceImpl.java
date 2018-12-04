package com.lw.toabbslog.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.toabbslog.entity.ToaBbsLog;
import com.lw.toabbslog.service.IToaBbsLogService;

@Transactional
@Service("ToaBbsLogServiceImpl")
public class ToaBbsLogServiceImpl extends BaseServiceImpl<ToaBbsLog> implements IToaBbsLogService{
	
}
