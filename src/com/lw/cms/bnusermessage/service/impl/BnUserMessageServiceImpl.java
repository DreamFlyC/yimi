/**
 * 
 */
package com.lw.cms.bnusermessage.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnusermessage.entity.BnUserMessage;
import com.lw.cms.bnusermessage.service.IBnUserMessageService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnUserMessageServiceImpl")
public class BnUserMessageServiceImpl extends BaseServiceImpl<BnUserMessage> implements IBnUserMessageService{

}
