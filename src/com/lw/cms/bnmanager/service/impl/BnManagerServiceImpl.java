/**
 * 
 */
package com.lw.cms.bnmanager.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnmanager.entity.BnManager;
import com.lw.cms.bnmanager.service.IBnManagerService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnManagerServiceImpl")
public class BnManagerServiceImpl extends BaseServiceImpl<BnManager> implements IBnManagerService{

}
