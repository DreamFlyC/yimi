package com.lw.toabbslog.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.toabbslog.entity.ToaBbsLog;
import com.lw.toabbslog.service.IToaBbsLogService;
	
	@Controller("ToaBbsLogAction")
	@RequestMapping(value = "/manage/toabbslog")
	@SuppressWarnings("all")
	public class ToaBbsLogAction extends BaseAction{
		@Autowired
		private IToaBbsLogService toaBbsLogService;
		
		//信息列表
		@RequestMapping(value= {"","/toabbslog_list"})
		public String list(){
			instantPage(20);
			List<ToaBbsLog> list=toaBbsLogService.getList();
			int total=toaBbsLogService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/toabbslog/toabbslog_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addtoabbslog(){
			
			return "/WEB-INF/toabbslog/toabbslog_add";
		}
				
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addtoabbslog(ToaBbsLog toaBbsLog){
			toaBbsLogService.save(toaBbsLog);
			return "redirect:toabbslog_list";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deletetoabbslog(@PathVariable("id")int id,HttpServletResponse response){
			toaBbsLogService.del(id);
			return "redirect:../toabbslog_list";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updatetoabbslog(ToaBbsLog toaBbsLog,HttpServletResponse response){
			toaBbsLogService.edit(toaBbsLog);
			return "redirect:toabbslog_list";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewtoabbslog(@PathVariable("id")int id)
		{
			ToaBbsLog toaBbsLog=toaBbsLogService.get(id);
			getRequest().setAttribute("toaBbsLog",toaBbsLog);
			return "/WEB-INF/toabbslog/toabbslog_detail";
		}


}
