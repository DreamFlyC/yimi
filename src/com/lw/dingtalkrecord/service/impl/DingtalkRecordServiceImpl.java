package com.lw.dingtalkrecord.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.dingtalkrecord.entity.DingtalkRecord;
import com.lw.dingtalkrecord.persistence.DingtalkRecordMapper;
import com.lw.dingtalkrecord.service.IDingtalkRecordService;

@Service("DingtalkRecordServiceImpl")
@Transactional
public class DingtalkRecordServiceImpl extends BaseServiceImpl<DingtalkRecord> implements IDingtalkRecordService{
	@Autowired
	private DingtalkRecordMapper dingtalkRecordMapper;
}
