package com.lw.aliyunmonitoossinfo.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.aliyunmonitoossinfo.entity.AliyunMonitoOssinfo;
import com.lw.aliyunmonitoossinfo.service.IAliyunMonitoOssinfoService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;


@Controller("AliyunMonitoOssinfoAction")
@RequestMapping(value="/aliyunmonitoossinfo")
public class AliyunMonitoOssinfoAction extends BaseAction{
	@Autowired 
	private IAliyunMonitoOssinfoService aliyunMonitoOssinfoService;
	

	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<AliyunMonitoOssinfo> list=aliyunMonitoOssinfoService.getList();
			int total=aliyunMonitoOssinfoService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/aliyunmonitoossinfo/aliyunmonitoossinfo_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addAliyunMonitoOssinfo(){
			
			return "/WEB-INF/aliyunmonitoossinfo/aliyunmonitoossinfo_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addAliyunMonitoOssinfo(AliyunMonitoOssinfo AliyunMonitoOssinfo){
			aliyunMonitoOssinfoService.save(AliyunMonitoOssinfo);
			return "redirect:/aliyunmonitoossinfo.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deleteAliyunMonitoOssinfo(@PathVariable("id")int id,HttpServletResponse response){
			aliyunMonitoOssinfoService.del(id);
			return "redirect:/aliyunmonitoossinfo.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updateAliyunMonitoOssinfo(AliyunMonitoOssinfo AliyunMonitoOssinfo,HttpServletResponse response){
			aliyunMonitoOssinfoService.edit(AliyunMonitoOssinfo);
			return "redirect:/aliyunmonitoossinfo.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewAliyunMonitoOssinfo(@PathVariable("id")int id)
		{
			AliyunMonitoOssinfo aliyunmonitoossinfo=aliyunMonitoOssinfoService.get(id);
			getRequest().setAttribute("aliyunmonitoossinfo",aliyunmonitoossinfo);
			return "/WEB-INF/aliyunmonitoossinfo/aliyunmonitoossinfo_detail";
		}

}
