/**
 * 
 */
package com.lw.adpic.service;

import java.util.List;

import com.lw.adpic.entity.Adpic;
import com.lw.core.base.service.IBaseService;

/**
 * @author CZP
 *
 * 2018年7月11日
 */
public interface IAdpicService extends IBaseService<Adpic> {

	/**
	 * @param type
	 * @return
	 */
	public Adpic getByType(int type);

	public List<Adpic> getListByType(List typeList);

}
