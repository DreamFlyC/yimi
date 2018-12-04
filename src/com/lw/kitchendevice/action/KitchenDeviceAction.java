/**
 * 
 */
package com.lw.kitchendevice.action;

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
import com.lw.kitchendevice.entity.KitchenDevice;
import com.lw.kitchendevice.service.IKitchenDeviceService;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("KitchenDeviceAction")
@RequestMapping(value="/manage/kitchendevice")
public class KitchenDeviceAction extends BaseAction{
	@Autowired
	private IKitchenDeviceService kitchenDeviceService;
	
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
		List<KitchenDevice> list=kitchenDeviceService.getList();
		int total=kitchenDeviceService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/kitchendevice/kitchendevice_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addkitchendevice(){
		
		return "/WEB-INF/kitchendevice/kitchendevice_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param kitchenDevice
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute KitchenDevice kitchenDevice) throws Exception{
		kitchenDeviceService.save(kitchenDevice);
		return "redirect:/manage/kitchendevice.html";
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
	public String deletekitchendevice(@PathVariable("id")int id,HttpServletResponse response){
		kitchenDeviceService.del(id);
		return "redirect:/manage/kitchendevice.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param kitchenDevice
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatekitchendevice(KitchenDevice kitchenDevice)throws Exception{
		kitchenDeviceService.edit(kitchenDevice);
		return "redirect:/manage/kitchendevice.html";
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
	public String viewkitchendevice(@PathVariable("id")int id)
	{
		KitchenDevice kitchenDevice=kitchenDeviceService.get(id);
		getRequest().setAttribute("kitchenDevice",kitchenDevice);
		return "/WEB-INF/kitchendevice/kitchendevice_detail";
	}
}
