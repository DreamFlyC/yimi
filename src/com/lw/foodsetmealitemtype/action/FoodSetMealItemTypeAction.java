package com.lw.foodsetmealitemtype.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.foodsetmealitemtype.entity.FoodSetMealItemType;
import com.lw.foodsetmealitemtype.service.IFoodSetMealItemTypeService;


@Controller("FoodSetMealItemTypeAction")
@RequestMapping(value="/manage/foodsetmealitemtype")
public class FoodSetMealItemTypeAction extends BaseAction{
	@Autowired 
	private IFoodSetMealItemTypeService foodSetMealItemTypeService;
	

	//信息列表
		@RequestMapping("")
		public String list(ModelMap map){
			instantPage(20);
			List<FoodSetMealItemType> list=foodSetMealItemTypeService.getList();
			int total=foodSetMealItemTypeService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/foodsetmealitemtype/foodsetmealitemtype_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addFoodSetMealItemType(){
			return "/WEB-INF/foodsetmealitemtype/foodsetmealitemtype_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addFoodSetMealItemType(FoodSetMealItemType foodSetMealItemType){
			foodSetMealItemTypeService.save(foodSetMealItemType);
			return "redirect:/manage/foodsetmealitemtype.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteFoodSetMealItemType(@PathVariable("id")int id,HttpServletResponse response){
			foodSetMealItemTypeService.del(id);
			return "redirect:/manage/foodsetmealitemtype.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateFoodSetMealItemType(FoodSetMealItemType FoodSetMealItemType, HttpServletResponse response){
			foodSetMealItemTypeService.edit(FoodSetMealItemType);
			return "redirect:/manage/foodsetmealitemtype.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewFoodSetMealItemType(@PathVariable("id")int id)
		{
			FoodSetMealItemType foodSetMealItemType=foodSetMealItemTypeService.get(id);
			getRequest().setAttribute("foodSetMealItemType",foodSetMealItemType);
			return "/WEB-INF/foodsetmealitemtype/foodsetmealitemtype_detail";
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
			FoodSetMealItemType foodSetMealItemType=foodSetMealItemTypeService.get(id);
			getRequest().setAttribute("foodSetMealItemType",foodSetMealItemType);
			return "/WEB-INF/foodsetmealitemtype/foodsetmealitemtype_add";
		}
		
	
}
