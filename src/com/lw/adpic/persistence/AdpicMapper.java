/**
 * 
 */
package com.lw.adpic.persistence;

import java.util.List;

import com.lw.adpic.entity.Adpic;
import com.lw.core.base.persistence.BaseMapper;

/**
 * @author CZP
 *
 * 2018年7月11日
 */
public interface AdpicMapper extends BaseMapper<Adpic> {
	
	public Adpic getByType(int type);

	public List<Adpic> getListByType(List typeList);

}
