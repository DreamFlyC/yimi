/**
 * 
 */
package com.lw.tpartnerbasicinfo.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.tpartnerbasicinfo.entity.TPartnerBasicInfo;
import com.lw.tpartnerbasicinfo.service.ITPartnerBasicInfoService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("TPartnerBasicInfoServiceImpl")
public class TPartnerBasicInfoServiceImpl extends BaseServiceImpl<TPartnerBasicInfo> implements ITPartnerBasicInfoService{

}
