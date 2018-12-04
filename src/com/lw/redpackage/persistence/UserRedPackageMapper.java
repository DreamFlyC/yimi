package com.lw.redpackage.persistence;

import org.springframework.stereotype.Repository;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.redpackage.entity.UserRedPackage;

@Repository
public interface UserRedPackageMapper extends BaseMapper<UserRedPackage>{
	/**
	 * 插入抢红包信息.
	 * @param userRedPacket ——抢红包信息
	 * @return 影响记录数.
	 */
	public int grapRedPacket(UserRedPackage userRedPacket);
}
