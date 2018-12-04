package com.lw.dingtalkrecord.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.dingtalkrecord.entity.DingtalkRecord;
import com.lw.dingtalkrecord.service.IDingtalkRecordService;


@Controller("DingtalkRecordAction")
@RequestMapping(value = "/dingtalkrecord")
@SuppressWarnings("all")
public class DingtalkRecordAction extends BaseAction{
	@Autowired
	private IDingtalkRecordService dingtalkRecordService;
	
	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<DingtalkRecord> list=dingtalkRecordService.getList();
			int total=dingtalkRecordService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/dingtalkrecord/dingtalkrecord_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addDingtalkRecord(){
			
			return "/WEB-INF/dingtalkrecord/dingtalkrecord_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addDingtalkRecord(DingtalkRecord dingtalkRecord){
			dingtalkRecordService.save(dingtalkRecord);
			return "redirect:/dingtalkrecord.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteDingtalkRecord(@PathVariable("id")int id,HttpServletResponse response){
			dingtalkRecordService.del(id);
			return "redirect:/dingtalkrecord.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateDingtalkRecord(DingtalkRecord dingtalkRecord,HttpServletResponse response){
			dingtalkRecordService.edit(dingtalkRecord);
			return "redirect:/dingtalkrecord.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewDingtalkRecord(@PathVariable("id")int id)
		{
			DingtalkRecord dingtalkRecord=dingtalkRecordService.get(id);
			getRequest().setAttribute("dingtalkRecord",dingtalkRecord);
			return "/WEB-INF/dingtalkrecord/dingtalkrecord_detail";
		}

}
