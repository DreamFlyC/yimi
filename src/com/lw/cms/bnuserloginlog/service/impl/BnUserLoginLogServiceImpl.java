/**
 * 
 */
package com.lw.cms.bnuserloginlog.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnuserloginlog.entity.BnUserLoginLog;
import com.lw.cms.bnuserloginlog.service.IBnUserLoginLogService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnUserLoginLogServiceImpl")
public class BnUserLoginLogServiceImpl extends BaseServiceImpl<BnUserLoginLog> implements IBnUserLoginLogService{

}
