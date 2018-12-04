package com.lw.newsinfo.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.adpic.entity.Adpic;
import com.lw.adpic.service.IAdpicService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.newsinfo.entity.NewsInfo;
import com.lw.newsinfo.service.INewsInfoService;
import com.lw.yiminews.entity.YimiNews;

@Controller("NewsInfoIndexAction")
@RequestMapping(value="/news")
@SuppressWarnings("all")
public class NewsInfoIndexAction extends BaseAction{
	
	@Autowired
	private INewsInfoService newsInfoService;
	
	
	@Autowired
	private IAdpicService adpicService;
	
//	@RequestMapping(value="index")
//	public String listindex(){
//		Map map = new HashMap<>();
//		List<NewsInfo> list=newsInfoService.getList(map);
//		Pager pager=new Pager();
//		pager.setDatas(list);
//		getRequest().setAttribute("pager",pager);
//		return  "WEB-INF/yiminews/index"; 
//	}
	
	@RequestMapping(value="company_news_brief")
	public String list(){
		instantPage(5);
		Map map = new HashMap<>();
		List<NewsInfo> list=newsInfoService.getList(map);
		int total=newsInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "WEB-INF/yiminews/company_news_brief"; 
	}
	
//	@RequestMapping(value="/detail/{id}")
//	public String detailyiminews(@PathVariable("id")int id)
//	{
//		NewsInfo newsInfo=newsInfoService.get(id);
//		getRequest().setAttribute("yimiNews",newsInfo);
//		return "redirect:/yiminews";
//	}
//	
//	@RequestMapping(value="/edit",method=RequestMethod.POST)
//	public String edityiminews(HttpServletResponse response,NewsInfo newsInfo)
//	{
//		newsInfoService.edit(newsInfo);
//		return "redirect:/yiminews";
//	}
	
	//官网首页
		@RequestMapping(value="/index")
		public String index(Model model) {
	/*		instantPage(6);
			List<YimiNews> list=yimiNewsService.getList();
			int total=yimiNewsService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
	*/		
			//图片新闻展示，1代表图片新闻，2代表文字新闻
			int type=1;
			Map map=new HashMap();
			map.put("type", type);
			List<YimiNews> imgList=newsInfoService.getList(map);
			model.addAttribute("imgList",imgList);
			
			//上传轮播图,type为11
			type=11;//官网首页轮播图
			Map param=new HashMap();
			param.put("type",type);
			List<Adpic> list1=adpicService.getList(param);
			model.addAttribute("bannerList",list1);
			//上传二图，type为12
			type=12;
			Adpic list2=adpicService.getByType(type);
			model.addAttribute("bannertwo",list2);
			//官网首页智能点餐平台一图
			type=13;
			Adpic list3=adpicService.getByType(type);
			model.addAttribute("one",list3);
			//官网首页智能点餐平台二图
			type=14;
			Adpic list4=adpicService.getByType(type);
			model.addAttribute("two",list4);
			//官网首页智能点餐平台三图
			type=15;
			Adpic list5=adpicService.getByType(type);
			model.addAttribute("three",list5);
			
			return "/WEB-INF/yiminews/index";
		}
		
		@RequestMapping(value="/show/{id}")
			public String show(@PathVariable("id")int id) {
			NewsInfo obj=newsInfoService.get(id);
			getRequest().setAttribute("obj",obj);
				return "WEB-INF/yiminews/show";
			}
		
		@RequestMapping(value="/showlist")
		public String showlist() {
			instantPage(4);
			Map map = new HashMap<>();
			List<NewsInfo> list=newsInfoService.getList(map);
			int total=newsInfoService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "WEB-INF/yiminews/showlist"; 
		}
		
		@RequestMapping(value="/about")
		public String about() {
			return "WEB-INF/yiminews/about";
		}
		
		@RequestMapping(value="/login")
		public String login() {
			return "WEB-INF/yiminews/login";
		}
	
}
