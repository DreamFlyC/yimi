package com.lw.foodinfotype.action;


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
import com.lw.foodinfotype.entity.FoodInfoType;
import com.lw.foodinfotype.service.IFoodInfoTypeService;
import com.lw.traceabilitytype.entity.TraceabilityType;


@Controller("FoodInfoTypeAction")
@RequestMapping(value="/manage/foodinfotype")
public class FoodInfoTypeAction extends BaseAction{
	@Autowired 
	private IFoodInfoTypeService foodInfoTypeService;
	

	//信息列表
		@RequestMapping("")
		public String list(ModelMap map){
			map.addAttribute("nameList", foodInfoTypeService.getAllOne());
			instantPage(20);
			List<FoodInfoType> list=foodInfoTypeService.getList();
			int total=foodInfoTypeService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/foodinfotype/foodinfotype_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addFoodInfoType(){
			
			return "/WEB-INF/foodinfotype/foodinfotype_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addFoodInfoType(FoodInfoType foodInfoType){
			foodInfoTypeService.save(foodInfoType);
			return "redirect:/manage/foodinfotype.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteFoodInfoType(@PathVariable("id")int id,HttpServletResponse response){
			foodInfoTypeService.del(id);
			return "redirect:/manage/foodinfotype.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateFoodInfoType(FoodInfoType FoodInfoType,HttpServletResponse response){
			foodInfoTypeService.edit(FoodInfoType);
			return "redirect:/manage/foodinfotype.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewFoodInfoType(@PathVariable("id")int id)
		{
			FoodInfoType foodInfoType=foodInfoTypeService.get(id);
			getRequest().setAttribute("foodInfoType",foodInfoType);
			return "/WEB-INF/foodinfotype/foodinfotype_detail";
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
			FoodInfoType foodInfoType=foodInfoTypeService.get(id);
			getRequest().setAttribute("foodInfoType",foodInfoType);
			return "/WEB-INF/foodinfotype/foodinfotype_add";
		}
		
		
		/**
		 * 获取一级目录
		 * @param id
		 * @return
		 * @author CZP
		 */
		@RequestMapping(value = "/getlist")
	    @ResponseBody
	    public Json getlist(HttpServletResponse response){
			response.setHeader("Access-Control-Allow-Origin", "*");
		//	Map param=new HashMap();
		//	param.put("parent_id", 0);
	        List<FoodInfoType> list = foodInfoTypeService.getAllOne();
	        if (list!=null){
	            return new Json(true,"success",list);
	        } else {
	            return new Json(false,"fail",null);
	        }
	    }
		
		/**
		 * 获取节点的子节点
		 * @Desc 
		 * @param id
		 * @return
		 * @author CZP
		 */
		@RequestMapping(value = "/getByPid/{id}")
	    @ResponseBody
	    public Json getByPid(@PathVariable("id") int id,HttpServletResponse response){
			response.setHeader("Access-Control-Allow-Origin", "*");
			Map param=new HashMap();
			param.put("parent_id", id);
	        List<FoodInfoType> sonList = foodInfoTypeService.getList(param);
	        if (sonList!=null){
	            return new Json(true,"success",sonList);
	        } else {
	            return new Json(false,"fail",null);
	        }
	    }
		 
		 /**
		  * 循环删除节点以及所有子节点
		  * @Desc 
		  * @param id
		  * @throws SQLException
		  * @author CZP
		  */
		 public void delNode(Integer id) throws SQLException{
		    	//先根据id删除当前节点
			 foodInfoTypeService.del(id);
		    	//再根据id查找当前节点的子节点
		    	List<FoodInfoType> sons=foodInfoTypeService.getByPid(id);
		    	if(null!=sons && !sons.isEmpty()) {
		    		for(int i=0;i<sons.size();i++) {
		    			FoodInfoType son=sons.get(i);
		    			delNode(son.getId());
		    		}
		    	}
		    }

}
