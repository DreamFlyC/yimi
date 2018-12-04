/**
 * 
 */
package com.lw.kitchendevice.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.kitchendevice.entity.KitchenDevice;
import com.lw.kitchendevice.service.IKitchenDeviceService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("KitchenDeviceServiceImpl")
public class KitchenDeviceServiceImpl extends BaseServiceImpl<KitchenDevice> implements IKitchenDeviceService{

}
