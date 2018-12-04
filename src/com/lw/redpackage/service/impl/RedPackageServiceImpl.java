package com.lw.redpackage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.redpackage.entity.RedPackage;
import com.lw.redpackage.persistence.RedPackageMapper;
import com.lw.redpackage.service.IRedPackageService;

@Service
public class RedPackageServiceImpl extends BaseServiceImpl<RedPackage> implements IRedPackageService{
	@Autowired
	private RedPackageMapper redPackageMapper;
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public RedPackage getRedPacket(Long id) {
		return redPackageMapper.getRedPacket(id);
	}
	@Override
	@Transactional(isolation=Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
	public int decreaseRedPacket(Long id) {
		return redPackageMapper.decreaseRedPacket(id);
	}
}
