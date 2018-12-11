package com.lw.crm.crmpurchacse.action;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import com.lw.crm.crmsupplier.service.ICrmSupplierService;
import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import com.lw.crm.crmsupplierprice.service.ICrmSupplierPriceService;
import com.lw.crm.crmuser.entity.CrmUser;
import com.lw.crm.crmuser.service.ICrmUserService;

import com.lw.shiroaction.usersgroup.entity.ShiroActionUsersGroup;
import com.lw.shiroaction.usersgroup.service.IShiroActionUsersGroupService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/*
 * create by: CZP
 * description:采购管理
 * create time: 10:17 2018/11/27
 *  * @Param: null
 * @return 
 */
@Controller("CrmPurchacseAction")
@RequestMapping(value="manage/crmpurchacse")
public class CrmPurchacseAction extends BaseAction{
	@Autowired
	private ICrmPurchacseService crmPurchacseService;
	@Autowired
	private ICrmUserService crmUserService;
	@Autowired
	private ICrmSupplierService crmSupplierService;
//	@Autowired
//	private IDutyUsernameService dutyUsernameService;
	@Autowired
	private IShiroActionUsersGroupService shiroActionUsersGroupService;
	@Autowired
	private ICrmSupplierPriceService crmSupplierPriceService;
	
	@RequestMapping(value= {"","/crmpurchacse_list"})
	public String list(){
		instantPage(20); //20代表一页显示20条数据
		List<CrmPurchacse> list=crmPurchacseService.getList();  //获取列表
		int total=crmPurchacseService.getCount();   //获取总数
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);  //绑定数据到前台
		return  "/WEB-INF/crmpurchacse/crmpurchacse_list";
	}	
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addCrmPurchacse(){
		
		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);
		
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		
		List<ShiroActionUsersGroup> shiroActionUsersGroupList = shiroActionUsersGroupService.getList();
		getRequest().setAttribute("shiroActionUsersGroupList", shiroActionUsersGroupList);

		//List<DutyUsername> dutyUsernameList = dutyUsernameService.getList();
		//getRequest().setAttribute("dutyUsernameList", dutyUsernameList);
		
		return "/WEB-INF/crmpurchacse/crmpurchacse_add";
	}
	
	//增加
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addCrmPurchacse(CrmPurchacse crmPurchacse){
		crmPurchacseService.save(crmPurchacse);
		return "redirect:/manage/crmpurchacse/crmpurchacse_list.html";
	}
	
	//删除
	@RequestMapping(value="/del/{id}")
	public String deleteCrmPurchacse(@PathVariable("id")int id,HttpServletResponse response){
		 
		crmPurchacseService.del(id);
		return "redirect:/manage/crmpurchacse/crmpurchacse_list.html";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updateCrmPurchacse(CrmPurchacse crmPurchacse,HttpServletResponse response){
		crmPurchacseService.edit(crmPurchacse);
			return "redirect:/manage/crmpurchacse/crmpurchacse_list.html";
	}
	@RequestMapping(value="/{id}")
	public String viewCrmPurchacse(@PathVariable("id")int id)
	{
		CrmPurchacse crmPurchacse=crmPurchacseService.get(id);
		getRequest().setAttribute("crmPurchacse",crmPurchacse);
		
		List<CrmUser> crmUserList = crmUserService.getList();
		getRequest().setAttribute("crmUserList", crmUserList);
		
		List<CrmSupplier> crmSupplierList = crmSupplierService.getList();
		getRequest().setAttribute("crmSupplierList", crmSupplierList);
		
		return "/WEB-INF/crmpurchacse/crmpurchacse_detail";
	}	
	
	/*
	 * create by: CZP
	 * description:生成采购订单
	 * create time: 9:52 2018/11/28
	 * @Param: null
	 * @return
	 */
	@RequestMapping(value = "/create_order")
	public String createOrder(@RequestParam("ids") int[] ids, HttpServletRequest request){
		if(ids.length<=0){
			return null;
		}
		List<CrmSupplierPrice> list=new ArrayList<>();
		for(int i=0;i<ids.length;i++){
			CrmSupplierPrice crmSupplierPrice = crmSupplierPriceService.get(ids[i]);
			list.add(crmSupplierPrice);
		}
		getRequest().setAttribute("list",list);
		return "/WEB-INF/crmpurchacse/crmpurchacse_order";
	}
	
	/*
	 * create by: CZP
	 * description:处理采购订单
	 * create time: 9:55 2018/11/28
	 * @return 
	 */
	@RequestMapping(value = "/do_order",method = RequestMethod.POST)
	@ResponseBody
	public boolean doOrder(@RequestParam(value = "ids")int[] ids,@RequestParam(value = "nums")int[] nums,
						   @RequestParam(value = "notes",required = false)String[] notes,
						   @RequestParam(value = "title")String title){
		if(ids.length<=0 || ids.length<=0 || StringUtils.isBlank(title)){
			return false;
		}
		return crmPurchacseService.saveOrder(ids,nums,notes,title);
	}
}