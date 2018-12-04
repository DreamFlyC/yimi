package com.lw.mobilemsisdninfo.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.mobilemsisdninfo.entity.MobileMsisdnInfo;
import com.lw.mobilemsisdninfo.service.IMobileMsisdnInfoService;

@Controller("MobileMsisdnInfoAction")
@RequestMapping(value="/mobilemsisdninfo")
public class MobileMsisdnInfoAction extends BaseAction{
	@Autowired
	private IMobileMsisdnInfoService mobileMsisdnInfoService;

	//信息列表
			@RequestMapping("")
			public String list(){
				instantPage(20);
				List<MobileMsisdnInfo> list=mobileMsisdnInfoService.getList();
				int total=mobileMsisdnInfoService.getCount();
				Pager pager=new Pager(super.getPage(),super.getRows(),total);
				pager.setDatas(list);
				getRequest().setAttribute("pager",pager);
				return  "/WEB-INF/mobilemsisdninfo/mobilemsisdninfo_list";
			}
			
			@RequestMapping(value="/post",method=RequestMethod.GET)
			public String addMobileMsisdnInfo(){
				
				return "/WEB-INF/mobilemsisdninfo/mobilemsisdninfo_add";
			}
			
			//新增信息
			@RequestMapping(value="/post",method=RequestMethod.POST)
			public String addMobileMsisdnInfo(MobileMsisdnInfo MobileMsisdnInfo){
				mobileMsisdnInfoService.save(MobileMsisdnInfo);
				return "redirect:/mobilemsisdninfo.html";
			}
			
			//删除信息
			@RequestMapping(value="/del/{id}")
			public String deleteMobileMsisdnInfo(@PathVariable("id")int id,HttpServletResponse response){
				mobileMsisdnInfoService.del(id);
				return "redirect:/mobilemsisdninfo.html";
			}
			
			//修改信息
			@RequestMapping(value="/edit",method=RequestMethod.POST)
			public String updateMobileMsisdnInfo(MobileMsisdnInfo MobileMsisdnInfo,HttpServletResponse response){
				mobileMsisdnInfoService.edit(MobileMsisdnInfo);
				return "redirect:/mobilemsisdninfo.html";
			}
			
			//编辑前根据id获取信息
			@RequestMapping(value="/{id}")
			public String viewMobileMsisdnInfo(@PathVariable("id")int id)
			{
				MobileMsisdnInfo mobilemsisdninfo=mobileMsisdnInfoService.get(id);
				getRequest().setAttribute("mobilemsisdninfo",mobilemsisdninfo);
				return "/WEB-INF/mobilemsisdninfo/mobilemsisdninfo_detail";
			}

}
