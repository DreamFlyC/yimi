/**
 * 
 */
package com.lw.cms.bnusercode.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnusercode.entity.BnUserCode;
import com.lw.cms.bnusercode.service.IBnUserCodeService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnUserCodeServiceImpl")
public class BnUserCodeServiceImpl extends BaseServiceImpl<BnUserCode> implements IBnUserCodeService{

}
