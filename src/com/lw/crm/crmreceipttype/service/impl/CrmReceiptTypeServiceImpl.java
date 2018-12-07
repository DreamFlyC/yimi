package com.lw.crm.crmreceipttype.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmreceipttype.entity.CrmReceiptType;
import com.lw.crm.crmreceipttype.service.CrmReceiptTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("CrmReceiptTypeServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class CrmReceiptTypeServiceImpl extends BaseServiceImpl<CrmReceiptType> implements CrmReceiptTypeService {
	
}
