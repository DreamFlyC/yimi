package com.lw.aliyunmonitordsinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.aliyunmonitordsinfo.entity.AliyunMonitoRdsinfo;
import com.lw.aliyunmonitordsinfo.service.IAliyunMonitoRdsinfoService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;


@Controller("AliyunMonitoRdsinfoAction")
@RequestMapping(value = "/aliyunmonitordsinfo")
@SuppressWarnings("all")
public class AliyunMonitoRdsinfoAction extends BaseAction{
	
	@Autowired
	private IAliyunMonitoRdsinfoService aliyunMonitoRdsinfoService;
	
	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<AliyunMonitoRdsinfo> list=aliyunMonitoRdsinfoService.getList();
			int total=aliyunMonitoRdsinfoService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/aliyunmonitordsinfo/aliyunmonitordsinfo_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addAliyunMonitoRdsinfo(){
			
			return "/WEB-INF/aliyunmonitordsinfo/aliyunmonitordsinfo_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addAliyunMonitoRdsinfo(AliyunMonitoRdsinfo AliyunMonitoRdsinfo){
			aliyunMonitoRdsinfoService.save(AliyunMonitoRdsinfo);
			return "redirect:/aliyunmonitordsinfo.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteAliyunMonitoRdsinfo(@PathVariable("id")int id,HttpServletResponse response){
			aliyunMonitoRdsinfoService.del(id);
			return "redirect:/aliyunmonitordsinfo.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateAliyunMonitoRdsinfo(AliyunMonitoRdsinfo AliyunMonitoRdsinfo,HttpServletResponse response){
			aliyunMonitoRdsinfoService.edit(AliyunMonitoRdsinfo);
			return "redirect:/aliyunmonitordsinfo.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewAliyunMonitoRdsinfo(@PathVariable("id")int id)
		{
			AliyunMonitoRdsinfo aliyunmonitordsinfo=aliyunMonitoRdsinfoService.get(id);
			getRequest().setAttribute("aliyunmonitordsinfo",aliyunmonitordsinfo);
			return "/WEB-INF/aliyunmonitordsinfo/aliyunmonitordsinfo_detail";
		}

}
