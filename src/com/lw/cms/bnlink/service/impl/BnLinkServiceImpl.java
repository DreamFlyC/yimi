/**
 * 
 */
package com.lw.cms.bnlink.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnlink.entity.BnLink;
import com.lw.cms.bnlink.service.IBnLinkService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnLinkServiceImpl")
public class BnLinkServiceImpl extends BaseServiceImpl<BnLink> implements IBnLinkService{

}
