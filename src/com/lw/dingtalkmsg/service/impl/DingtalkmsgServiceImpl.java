/**
 * 
 */
package com.lw.dingtalkmsg.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.dingtalkmsg.entity.Dingtalkmsg;
import com.lw.dingtalkmsg.service.IDingtalkmsgService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author CZP
 *
 * 2018年7月31日
 */

@Service("DingtalkmsgServiceImpl")
@Transactional
public class DingtalkmsgServiceImpl extends BaseServiceImpl<Dingtalkmsg> implements IDingtalkmsgService{

}
