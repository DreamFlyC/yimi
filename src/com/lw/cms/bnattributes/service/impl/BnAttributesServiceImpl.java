/**
 * 
 */
package com.lw.cms.bnattributes.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bnattributes.entity.BnAttributes;
import com.lw.cms.bnattributes.service.IBnAttributesService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月25日 上午10:57:31
 */
@Transactional
@Service("BnAttributesServiceImpl")
public class BnAttributesServiceImpl extends BaseServiceImpl<BnAttributes> implements IBnAttributesService{

}
