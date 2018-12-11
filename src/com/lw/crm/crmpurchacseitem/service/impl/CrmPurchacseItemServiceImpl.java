package com.lw.crm.crmpurchacseitem.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;
import com.lw.crm.crmpurchacseitem.service.ICrmPurchacseItemService;

/**
* @author 作者:qw
* @createDate 创建时间：2018年12月6日 上午10:34:49
*/
@Service("CrmPurchacseItemServiceImpl")
@Transactional
//@ActionModel(description="采购明细管理")
public class CrmPurchacseItemServiceImpl extends BaseServiceImpl<CrmPurchacseItem> implements ICrmPurchacseItemService{

}
