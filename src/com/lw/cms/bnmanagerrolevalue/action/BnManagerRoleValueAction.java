/**
 * 
 */
package com.lw.cms.bnmanagerrolevalue.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnmanagerrolevalue.entity.BnManagerRoleValue;
import com.lw.cms.bnmanagerrolevalue.service.IBnManagerRoleValueService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月31日 上午9:41:52
 */
@Controller("BnManagerRoleValueAction")
@RequestMapping(value="/manage/bnmanagerrolevalue")
public class BnManagerRoleValueAction extends BaseAction{
	@Autowired
	private IBnManagerRoleValueService bnManagerRoleValueService;
	
	/**
	 * 
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnManagerRoleValue> list=bnManagerRoleValueService.getList();
		int total=bnManagerRoleValueService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnmanagerrolevalue/bnmanagerrolevalue_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnmanagerrolevalue(){
		
		return "/WEB-INF/bnmanagerrolevalue/bnmanagerrolevalue_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnManagerRoleValue
	 * @return
	 * @throws Exception
	 * @author CZP
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnManagerRoleValue bnManagerRoleValue) throws Exception{
		bnManagerRoleValueService.save(bnManagerRoleValue);
		return "redirect:/manage/bnmanagerrolevalue.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 */
	@RequestMapping(value="/del/{id}")
	public String deletebnmanagerrolevalue(@PathVariable("id")int id,HttpServletResponse response){
		bnManagerRoleValueService.del(id);
		return "redirect:/manage/bnmanagerrolevalue.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnManagerRoleValue
	 * @return
	 * @throws Exception
	 * @author CZP
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnmanagerrolevalue(BnManagerRoleValue bnManagerRoleValue)throws Exception{
		bnManagerRoleValueService.edit(bnManagerRoleValue);
		return "redirect:/manage/bnmanagerrolevalue.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 */
	@RequestMapping(value="/{id}")
	public String viewbnmanagerrolevalue(@PathVariable("id")int id)
	{
		BnManagerRoleValue bnManagerRoleValue=bnManagerRoleValueService.get(id);
		getRequest().setAttribute("bnManagerRoleValue",bnManagerRoleValue);
		return "/WEB-INF/bnmanagerrolevalue/bnmanagerrolevalue_detail";
	}
}
