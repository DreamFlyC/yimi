package com.lw.mobilemsisdninfo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.mobilemsisdninfo.entity.MobileMsisdnInfo;
import com.lw.mobilemsisdninfo.service.IMobileMsisdnInfoService;


@Service("MobileMsisdnInfoServiceImpl")
@Transactional
public class MobileMsisdnInfoServiceImpl extends BaseServiceImpl<MobileMsisdnInfo> implements IMobileMsisdnInfoService{
	
}
