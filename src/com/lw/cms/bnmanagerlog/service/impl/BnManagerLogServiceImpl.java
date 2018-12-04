/**
 * 
 */
package com.lw.cms.bnmanagerlog.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnmanagerlog.entity.BnManagerLog;
import com.lw.cms.bnmanagerlog.service.IBnManagerLogService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnManagerLogServiceImpl")
public class BnManagerLogServiceImpl extends BaseServiceImpl<BnManagerLog> implements IBnManagerLogService{

}
