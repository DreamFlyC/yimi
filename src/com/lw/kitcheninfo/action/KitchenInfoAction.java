/**
 * 
 */
package com.lw.kitcheninfo.action;

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
import com.lw.kitcheninfo.entity.KitchenInfo;
import com.lw.kitcheninfo.service.IKitchenInfoService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月29日 上午10:00:29
 */
@Controller("KitchenInfoAction")
@RequestMapping(value = "/manage/kitcheninfo")
@SuppressWarnings("all")
public class KitchenInfoAction extends BaseAction{
	@Autowired
	private IKitchenInfoService kitchenInfoService;
	
	/**
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<KitchenInfo> list=kitchenInfoService.getList();
		int total=kitchenInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/kitcheninfo/kitcheninfo_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addkitcheninfo(){
		
		return "/WEB-INF/kitcheninfo/kitcheninfo_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param kitchenInfo
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute KitchenInfo kitchenInfo) throws Exception{
		kitchenInfoService.save(kitchenInfo);
		return "redirect:/manage/kitcheninfo.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/del/{id}")
	public String deletekitcheninfo(@PathVariable("id")int id,HttpServletResponse response){
		kitchenInfoService.del(id);
		return "redirect:/manage/kitcheninfo.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param kitchenInfo
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatekitcheninfo(KitchenInfo kitchenInfo)throws Exception{
		kitchenInfoService.edit(kitchenInfo);
		return "redirect:/manage/kitcheninfo.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/{id}")
	public String viewkitcheninfo(@PathVariable("id")int id)
	{
		KitchenInfo kitchenInfo=kitchenInfoService.get(id);
		getRequest().setAttribute("kitchenInfo",kitchenInfo);
		return "/WEB-INF/kitcheninfo/kitcheninfo_detail";
	} 
	
	
}
