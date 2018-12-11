package com.lw.crm.crmpurchacseitem.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;
import com.lw.crm.crmpurchacseitem.service.ICrmPurchacseItemService;


/**
* @author 作者:qw
* @createDate 创建时间：2018年12月6日 上午10:34:04
*/
@Controller("CrmPurchacseItemAction")
@RequestMapping(value="manage/crmpurchacseitem")
public class CrmPurchacseItemAction extends BaseAction{
	@Autowired
	private ICrmPurchacseItemService crmPurchacseItemService;
	
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<CrmPurchacseItem> list=crmPurchacseItemService.getList();
		int total=crmPurchacseItemService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/crmpurchacseitem/crmpurchacseitem_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addcrmpurchacseitem(){
		
		return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_add";
	}
	
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addcrmpurchacseitem(CrmPurchacseItem crmPurchacseItem){
		crmPurchacseItemService.save(crmPurchacseItem);
		return "redirect:/manage/crmpurchacseitem.html";
	}
	
	
	@RequestMapping(value="/del/{id}")
	public String deletecrmpurchacseitem(@PathVariable("id")int id,HttpServletResponse response){
		crmPurchacseItemService.del(id);
		return "redirect:/manage/crmpurchacseitem.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatecrmpurchacseitem(CrmPurchacseItem crmPurchacseItem,HttpServletResponse response){
		crmPurchacseItemService.edit(crmPurchacseItem);
		return "redirect:/manage/crmpurchacseitem.html";
	}
	@RequestMapping(value="/{id}")
	public String viewcrmpurchacseitem(@PathVariable("id")int id)
	{
		CrmPurchacseItem crmPurchacseItem=crmPurchacseItemService.get(id);
		getRequest().setAttribute("crmPurchacseItem",crmPurchacseItem);
		return "/WEB-INF/crmpurchacseitem/crmpurchacseitem_detail";
	}
}
