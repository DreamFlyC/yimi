/**
 * 
 */
package com.lw.sysmobmsnaccount.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.sysmobmsnaccount.entity.SysMobmsnAccount;
import com.lw.sysmobmsnaccount.service.ISysMobmsnAccountService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("SysMobmsnAccountServiceImpl")
public class SysMobmsnAccountServiceImpl extends BaseServiceImpl<SysMobmsnAccount> implements ISysMobmsnAccountService{

}
