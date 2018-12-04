package com.lw.aliyunmonitoossinfo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.aliyunmonitoossinfo.entity.AliyunMonitoOssinfo;
import com.lw.aliyunmonitoossinfo.service.IAliyunMonitoOssinfoService;
import com.lw.core.base.service.impl.BaseServiceImpl;


@Service("AliyunMonitoOssinfoServiceImpl")
@Transactional
public class AliyunMonitoOssinfoServiceImpl extends BaseServiceImpl<AliyunMonitoOssinfo> implements IAliyunMonitoOssinfoService{

}
