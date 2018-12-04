package com.lw.redpackage.service;

import com.lw.core.base.service.IBaseService;
import com.lw.redpackage.entity.RedPackage;

public interface IRedPackageService extends IBaseService<RedPackage>{
	
	/**
	 * 获取红包
	 * @param id ——编号
	 * @return 红包信息
	 */
	public RedPackage getRedPacket(Long id);
	/**
	 * 扣减红包
	 * @param id——编号
	 * @return 影响条数.
	 */
	public int decreaseRedPacket(Long id);
}
