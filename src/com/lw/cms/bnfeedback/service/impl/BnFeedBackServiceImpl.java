/**
 * 
 */
package com.lw.cms.bnfeedback.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnfeedback.entity.BnFeedBack;
import com.lw.cms.bnfeedback.persistence.BnFeedBackMapper;
import com.lw.cms.bnfeedback.service.IBnFeedBackService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月25日 上午10:57:31
 */
@Transactional
@Service("BnFeedBackServiceImpl")
public class BnFeedBackServiceImpl extends BaseServiceImpl<BnFeedBack> implements IBnFeedBackService{
	@Autowired
	private BnFeedBackMapper bnFeedBackMapper;
}
