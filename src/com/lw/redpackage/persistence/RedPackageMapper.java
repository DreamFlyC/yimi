package com.lw.redpackage.persistence;

import org.springframework.stereotype.Repository;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.redpackage.entity.RedPackage;

@Repository
public interface RedPackageMapper extends BaseMapper<RedPackage>{
	/**
	 * 获取红包信息.
	 * @param id --红包id
	 * @return 红包具体信息
	 */
	public RedPackage getRedPacket(Long id);
	
	/**
	 * 扣减抢红包数.
	 * @param id -- 红包id
	 * @return 更新记录条数
	 */
	public int decreaseRedPacket(Long id);

}
