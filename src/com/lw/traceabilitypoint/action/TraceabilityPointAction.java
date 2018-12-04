package com.lw.traceabilitypoint.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.traceabilitypoint.entity.TraceabilityPoint;
import com.lw.traceabilitypoint.service.ITraceabilityPointService;

@Controller("TraceabilityPointAction")
@RequestMapping(value="/traceabilitypoint")
public class TraceabilityPointAction extends BaseAction{
	@Autowired
	private ITraceabilityPointService traceabilityPointService;
	
	//信息列表
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<TraceabilityPoint> list=traceabilityPointService.getList();
		int total=traceabilityPointService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/traceabilitypoint/traceabilitypoint_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addtraceabilitypoint(){
		
		return "/WEB-INF/traceabilitypoint/traceabilitypoint_add";
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addtraceabilitypoint(TraceabilityPoint traceabilityPoint){
		traceabilityPointService.save(traceabilityPoint);
		return "redirect:/WEB-INF/traceabilitypoint.html";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletetraceabilitypoint(@PathVariable("id")int id,HttpServletResponse response){
		traceabilityPointService.del(id);
		return "redirect:/WEB-INF/traceabilitypoint.html";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatetraceabilitypoint(TraceabilityPoint traceabilityPoint,HttpServletResponse response){
		traceabilityPointService.edit(traceabilityPoint);
		return "redirect:/WEB-INF/traceabilitypoint.html";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewtraceabilitypoint(@PathVariable("id")int id)
	{
		TraceabilityPoint traceabilityPoint=traceabilityPointService.get(id);
		getRequest().setAttribute("traceabilityPoint",traceabilityPoint);
		return "/WEB-INF/traceabilitypoint/traceabilitypoint_detail";
	}
}
