package com.lw.yiminews.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.yiminews.entity.YimiNews;
import com.lw.yiminews.service.IYimiNewsService;

@Controller("YimiNewsIndexAction")
@RequestMapping(value="/yiminewsindex")
@SuppressWarnings("all")
public class YimiNewsIndexAction extends BaseAction{
	
	@Autowired
	private IYimiNewsService yimiNewsService;
	
	@RequestMapping(value="index")
	public String listindex(){
		Map map = new HashMap<>();
		List<YimiNews> list=yimiNewsService.getList(map);
		Pager pager=new Pager();
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/yiminews_list"; 
	}
	
	@RequestMapping(value="company_news_brief")
	public String list(){
		instantPage(5);
		Map map = new HashMap<>();
		List<YimiNews> list=yimiNewsService.getList(map);
		int total=yimiNewsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/company_news_brief"; 
	}
	
	@RequestMapping(value="/detail/{id}")
	public String detailyiminews(@PathVariable("id")int id)
	{
		YimiNews yimiNews=yimiNewsService.get(id);
		getRequest().setAttribute("yimiNews",yimiNews);
		return "redirect:/yiminews";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edityiminews(HttpServletResponse response,YimiNews yimiNews)
	{
		yimiNewsService.edit(yimiNews);
		return "redirect:/yiminews";
	}
}
