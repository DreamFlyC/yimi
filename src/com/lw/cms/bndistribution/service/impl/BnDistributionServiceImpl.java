/**
 * 
 */
package com.lw.cms.bndistribution.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.cms.bndistribution.entity.BnDistribution;
import com.lw.cms.bndistribution.service.IBnDistributionService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:46:52
 */
@Transactional
@Service("BnDistributionServiceImpl")
public class BnDistributionServiceImpl extends BaseServiceImpl<BnDistribution> implements IBnDistributionService{

}
