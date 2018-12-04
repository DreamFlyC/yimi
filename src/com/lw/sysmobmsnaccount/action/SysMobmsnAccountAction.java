/**
 * 
 */
package com.lw.sysmobmsnaccount.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.sysmobmsnaccount.entity.SysMobmsnAccount;
import com.lw.sysmobmsnaccount.service.ISysMobmsnAccountService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("SysMobmsnAccountAction")
@RequestMapping(value="/manage/sysmobmsnaccount")
public class SysMobmsnAccountAction extends BaseAction{
	@Autowired
	private ISysMobmsnAccountService sysMobmsnAccountService;
	
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
		List<SysMobmsnAccount> list=sysMobmsnAccountService.getList();
		int total=sysMobmsnAccountService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/sysmobmsnaccount/sysmobmsnaccount_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addsysmobmsnaccount(){
		
		return "/WEB-INF/sysmobmsnaccount/sysmobmsnaccount_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param sysMobmsnAccount
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute SysMobmsnAccount sysMobmsnAccount) throws Exception{
		sysMobmsnAccountService.save(sysMobmsnAccount);
		return "redirect:/manage/sysmobmsnaccount.html";
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
	public String deletesysmobmsnaccount(@PathVariable("id")int id,HttpServletResponse response){
		sysMobmsnAccountService.del(id);
		return "redirect:/manage/sysmobmsnaccount.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param sysMobmsnAccount
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatesysmobmsnaccount(SysMobmsnAccount sysMobmsnAccount)throws Exception{
		sysMobmsnAccountService.edit(sysMobmsnAccount);
		return "redirect:/manage/sysmobmsnaccount.html";
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
	public String viewsysmobmsnaccount(@PathVariable("id")int id)
	{
		SysMobmsnAccount sysMobmsnAccount=sysMobmsnAccountService.get(id);
		getRequest().setAttribute("sysMobmsnAccount",sysMobmsnAccount);
		return "/WEB-INF/sysmobmsnaccount/sysmobmsnaccount_detail";
	}
}
