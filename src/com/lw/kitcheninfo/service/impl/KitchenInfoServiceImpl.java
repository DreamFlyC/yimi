/**
 * 
 */
package com.lw.kitcheninfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.kitcheninfo.entity.KitchenInfo;
import com.lw.kitcheninfo.persistence.KitchenInfoMapper;
import com.lw.kitcheninfo.service.IKitchenInfoService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月25日 上午10:57:31
 */
@Transactional
@Service("KitchenInfoServiceImpl")
public class KitchenInfoServiceImpl extends BaseServiceImpl<KitchenInfo> implements IKitchenInfoService{
	@Autowired
	private KitchenInfoMapper bnFeedBackMapper;
}
