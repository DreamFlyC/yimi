package com.lw.aliyunmonitordsinfo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.aliyunmonitordsinfo.entity.AliyunMonitoRdsinfo;
import com.lw.aliyunmonitordsinfo.service.IAliyunMonitoRdsinfoService;
import com.lw.core.base.service.impl.BaseServiceImpl;


@Service("AliyunMonitoRdsinfoServiceImpl")
@Transactional
public class AliyunMonitoRdsinfoServiceImpl extends BaseServiceImpl<AliyunMonitoRdsinfo> implements IAliyunMonitoRdsinfoService{

}
