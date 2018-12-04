package com.lw.foodsetmealitem.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.foodsetmealitem.entity.FoodSetMealItem;
import com.lw.foodsetmealitem.service.IFoodSetMealItemService;


@Controller("FoodSetMealItemAction")
@RequestMapping(value="/manage/foodsetmealitem")
public class FoodSetMealItemAction extends BaseAction{
	@Autowired 
	private IFoodSetMealItemService foodSetMealItemService;
	

	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<FoodSetMealItem> list=foodSetMealItemService.getList();
			int total=foodSetMealItemService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/foodsetmealitem/foodsetmealitem_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addFoodSetMealItem(){
			return "/WEB-INF/foodsetmealitem/foodsetmealitem_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addFoodSetMealItem(FoodSetMealItem foodSetMealItem){
			foodSetMealItemService.save(foodSetMealItem);
			return "redirect:/manage/foodsetmealitem.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteFoodSetMealItem(@PathVariable("id")int id,HttpServletResponse response){
			foodSetMealItemService.del(id);
			return "redirect:/manage/foodsetmealitem.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateFoodSetMealItem(FoodSetMealItem FoodSetMealItem, HttpServletResponse response){
			foodSetMealItemService.edit(FoodSetMealItem);
			return "redirect:/manage/foodsetmealitem.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewFoodSetMealItem(@PathVariable("id")int id)
		{
			FoodSetMealItem foodSetMealItem=foodSetMealItemService.get(id);
			getRequest().setAttribute("foodSetMealItem",foodSetMealItem);
			return "/WEB-INF/foodsetmealitem/foodsetmealitem_detail";
		}
		
		/**
		 * 新增前根据id获取信息
		 * @Desc 
		 * @param id
		 * @return
		 * @author CZP
		 */
		@RequestMapping(value="/add/{id}")
		public String add(@PathVariable("id")int id)
		{
			FoodSetMealItem foodSetMealItem=foodSetMealItemService.get(id);
			getRequest().setAttribute("foodSetMealItem",foodSetMealItem);
			return "/WEB-INF/foodsetmealitem/foodsetmealitem_add";
		}
		
	
}
