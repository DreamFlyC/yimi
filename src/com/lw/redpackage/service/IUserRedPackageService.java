package com.lw.redpackage.service;

import com.lw.core.base.service.IBaseService;
import com.lw.redpackage.entity.UserRedPackage;

public interface IUserRedPackageService extends IBaseService<UserRedPackage> {
	
	/**
	 * 保存抢红包信息.
	 * @param redPacketId 红包编号
	 * @param userId 抢红包用户编号
	 * @return 影响记录数.
	 */
	public int grapRedPacket(Long redPacketId, Long userId);
}
