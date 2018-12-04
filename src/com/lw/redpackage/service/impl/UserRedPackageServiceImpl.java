package com.lw.redpackage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.redpackage.entity.RedPackage;
import com.lw.redpackage.entity.UserRedPackage;
import com.lw.redpackage.persistence.RedPackageMapper;
import com.lw.redpackage.persistence.UserRedPackageMapper;
import com.lw.redpackage.service.IUserRedPackageService;

@Service
public class UserRedPackageServiceImpl extends BaseServiceImpl<UserRedPackage> implements IUserRedPackageService {
	// private Logger logger =
		// LoggerFactory.getLogger(UserRedPacketServiceImpl.class);
		
		@Autowired
		private UserRedPackageMapper userRedPackageMapper;
		@Autowired
		private RedPackageMapper redPackageMapper;
		// 失败
		private static final int FAILED = 0;
		@Override
		@Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
		public int grapRedPacket(Long redPacketId, Long userId) {
			// 获取红包信息
			RedPackage redPacket = redPackageMapper.getRedPacket(redPacketId);
			int leftRedPacket = redPacket.getStock();
			// 当前小红包库存大于0
			if (leftRedPacket > 0) {
				redPackageMapper.decreaseRedPacket(redPacketId);
				// logger.info("剩余Stock数量:{}", leftRedPacket);
				// 生成抢红包信息
				UserRedPackage userRedPacket = new UserRedPackage();
				userRedPacket.setRedPacketId(redPacketId);
				userRedPacket.setUserId(userId);
				userRedPacket.setAmount(redPacket.getUnitAmount());
				userRedPacket.setNote("redpacket- " + redPacketId);
				// 插入抢红包信息
				int result = userRedPackageMapper.grapRedPacket(userRedPacket);
				return result;
			}
			// logger.info("没有红包啦.....剩余Stock数量:{}", leftRedPacket);
			// 失败返回
			return FAILED;
		}
}
