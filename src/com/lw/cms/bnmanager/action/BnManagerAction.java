/**
 * 
 */
package com.lw.cms.bnmanager.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnmanager.entity.BnManager;
import com.lw.cms.bnmanager.service.IBnManagerService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnManagerAction")
@RequestMapping(value="/manage/bnmanager")
public class BnManagerAction extends BaseAction{
	@Autowired
	private IBnManagerService bnManagerService;
	
	/**
	 * 
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:25
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnManager> list=bnManagerService.getList();
		int total=bnManagerService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnmanager/bnmanager_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnmanager(){
		
		return "/WEB-INF/bnmanager/bnmanager_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnManager
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnManager bnManager) throws Exception{
		bnManagerService.save(bnManager);
		return "redirect:/manage/bnmanager.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:09
	 */
	@RequestMapping(value="/del/{id}")
	public String deletebnmanager(@PathVariable("id")int id,HttpServletResponse response){
		bnManagerService.del(id);
		return "redirect:/manage/bnmanager.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnManager
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnmanager(BnManager bnManager)throws Exception{
		bnManagerService.edit(bnManager);
		return "redirect:/manage/bnmanager.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:43
	 */
	@RequestMapping(value="/{id}")
	public String viewbnmanager(@PathVariable("id")int id)
	{
		BnManager bnManager=bnManagerService.get(id);
		getRequest().setAttribute("bnManager",bnManager);
		return "/WEB-INF/bnmanager/bnmanager_detail";
	}
}
