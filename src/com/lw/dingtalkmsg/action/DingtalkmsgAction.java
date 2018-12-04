/**
 * 
 */
package com.lw.dingtalkmsg.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.dingtalkmsg.entity.Dingtalkmsg;
import com.lw.dingtalkmsg.service.IDingtalkmsgService;

/**
 * @author CZP
 *
 * 2018年7月31日
 */

@Controller("DingtalkmsgAction")
@RequestMapping("dingtalkmsg")
public class DingtalkmsgAction extends BaseAction{
	
	@Autowired
	private IDingtalkmsgService dingtalkmsgService;
	
	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<Dingtalkmsg> list=dingtalkmsgService.getList();
			int total=dingtalkmsgService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/dingtalkmsg/dingtalkmsg_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addDingtalkmsg(){
			
			return "/WEB-INF/dingtalkmsg/dingtalkmsg_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addDingtalkmsg(Dingtalkmsg dingtalkmsg){
			dingtalkmsgService.save(dingtalkmsg);
			return "redirect:dingtalkmsg.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteDingtalkmsg(@PathVariable("id")int id,HttpServletResponse response){
			dingtalkmsgService.del(id);
			return "redirect:dingtalkmsg.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateDingtalkmsg(Dingtalkmsg dingtalkmsg,HttpServletResponse response){
			dingtalkmsgService.edit(dingtalkmsg);
			return "redirect:dingtalkmsg.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewDingtalkmsg(@PathVariable("id")int id)
		{
			Dingtalkmsg dingtalkmsg=dingtalkmsgService.get(id);
			getRequest().setAttribute("dingtalkmsg",dingtalkmsg);
			return "/WEB-INF/dingtalkmsg/dingtalkmsg_detail";
		}

}
