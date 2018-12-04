/**
 * 
 */
package com.lw.adpic.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.adpic.entity.Adpic;
import com.lw.adpic.persistence.AdpicMapper;
import com.lw.adpic.service.IAdpicService;
import com.lw.core.base.service.IBaseService;
import com.lw.core.base.service.impl.BaseServiceImpl;

/**
 * @author CZP
 *
 * 2018年7月11日
 */
@Service("AdpicServiceImpl")
@Transactional
public class AdpicServiceImpl extends BaseServiceImpl<Adpic> implements IAdpicService {
	@Autowired
	private AdpicMapper adpicMapper;
	
	public Adpic getByType(@Param("type")int type) {
		return adpicMapper.getByType(type);
	}
	
	public List<Adpic> getListByType(List typeList){
		return adpicMapper.getListByType(typeList);
	}
}
