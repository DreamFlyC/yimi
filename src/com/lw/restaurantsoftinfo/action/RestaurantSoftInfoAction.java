package com.lw.restaurantsoftinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.restaurantsoftinfo.entity.RestaurantSoftInfo;
import com.lw.restaurantsoftinfo.service.IRestaurantsoftinfoService;

@Controller("RestaurantSoftInfoAction")

@RequestMapping(value="/manage/restaurantsoftinfo")
public class RestaurantSoftInfoAction extends BaseAction{
	@Autowired
	private IRestaurantsoftinfoService restaurantSoftInfoService;
	
	//信息列表
	@RequestMapping(value= {"","/restaurantsoftinfo_list"})
	public String list(){
		instantPage(20);
		List<RestaurantSoftInfo> list=restaurantSoftInfoService.getList();
		int total=restaurantSoftInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/restaurantsoftinfo/restaurantsoftinfo_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addrestaurantsoftinfo(){
		
		return "/WEB-INF/restaurantsoftinfo/restaurantsoftinfo_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addrestaurantsoftinfo(RestaurantSoftInfo restaurantSoftInfo){
		restaurantSoftInfoService.save(restaurantSoftInfo);
		return "redirect:restaurantsoftinfo_list";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deleterestaurantsoftinfo(@PathVariable("id")int id,HttpServletResponse response){
		restaurantSoftInfoService.del(id);
		return "redirect:../restaurantsoftinfo_list";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updaterestaurantsoftinfo(RestaurantSoftInfo restaurantSoftInfo,HttpServletResponse response){
		restaurantSoftInfoService.edit(restaurantSoftInfo);
		return "redirect:restaurantsoftinfo_list";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewrestaurantsoftinfo(@PathVariable("id")int id)
	{
		
		
		RestaurantSoftInfo restaurantSoftInfo=restaurantSoftInfoService.get(id);
		getRequest().setAttribute("restaurantSoftInfo",restaurantSoftInfo);
		
		return "/WEB-INF/restaurantsoftinfo/restaurantsoftinfo_detail";
	}

}
