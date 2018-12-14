package com.lw.newsinfo.action;

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
import com.lw.newsinfo.entity.NewsInfo;
import com.lw.newsinfo.service.INewsInfoService;


@Controller("NewsInfosAction")
@RequestMapping(value="/manage/newsinfo")
@SuppressWarnings("all")
public class NewsInfoAction extends BaseAction{
	
	@Autowired
	private INewsInfoService newsInfoService;
	
	@RequestMapping(value="")
	public String list(){
		instantPage(20);
		Map map = new HashMap<>();
		List<NewsInfo> list=newsInfoService.getList(map);
		int total=newsInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/yiminews_list"; 
	}
	
	@RequestMapping(value="company_news_brief")
	public String brieflist(){
		instantPage(5);
		Map map = new HashMap<>();
		List<NewsInfo> list=newsInfoService.getList(map);
		int total=newsInfoService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/company_news_brief"; 
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addyiminews(){
		
		return "/WEB-INF/yiminews/yiminews_add";
		
	}
	
	@RequestMapping(value="/addimg",method=RequestMethod.GET)
	public String addyiminews1(){
		String filename = getRequest().getParameter("filename");
		String title = getRequest().getParameter("title");
		String url = getRequest().getParameter("url");
		String content = getRequest().getParameter("content");
		String seoKeywords = getRequest().getParameter("seoKeywords");
		String seoDescribe = getRequest().getParameter("seoDescribe");
		NewsInfo newsInfo = new NewsInfo();
		newsInfo.setCreatime(new Date());
		newsInfo.setImg(filename);
		newsInfo.setTitle(title);
		newsInfo.setUrl(url);
		newsInfo.setContent(content);
		newsInfo.setSeoDescribe(seoDescribe);
		newsInfo.setSeoKeywords(seoKeywords);
		newsInfoService.save(newsInfo);
		return "/WEB-INF/yiminews/yiminews_add";
		
	}
	
/*	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addyiminews1(YimiNews yimiNews)
	{
		yimiNews.setCreatime(new Date());
		yimiNewsService.save(yimiNews);
		return "redirect:/yiminews";//查询页面
	}
	*/
/*	@RequestMapping(value="/{id}")
	public String viewyiminews(@PathVariable("id")int id)
	{
		YimiNews yimiNews=yimiNewsService.get(id);
		getRequest().setAttribute("yimiNews",yimiNews);
		return "/company_new_minute";
	}
*/	
	@RequestMapping(value="/detail/{id}")
	public String detailyiminews(@PathVariable("id")int id)
	{
		NewsInfo newsInfo=newsInfoService.get(id);
		getRequest().setAttribute("yimiNews",newsInfo);
		return "redirect:yiminews";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edityiminews(HttpServletResponse response,NewsInfo newsInfo)
	{
		newsInfoService.edit(newsInfo);
		return "redirect:yiminews";
	}
	
	@RequestMapping(value="/del/{id}")
	public String delyiminews(HttpServletResponse response,@PathVariable("id") int id)
	{
		newsInfoService.del(id);
		return "redirect:/yiminews";
	}
	
	 @RequestMapping("/uploadimage")
	    public String uploadimage(){
		 	String title = getRequest().getParameter("title");
			String url = getRequest().getParameter("url");
			String content = getRequest().getParameter("content");
			String seoKeywords = getRequest().getParameter("seoKeywords");
			String seoDescribe = getRequest().getParameter("seoDescribe");
			NewsInfo newsInfo = new NewsInfo();
			newsInfo.setCreatime(new Date());
			newsInfo.setTitle(title);
			newsInfo.setUrl(url);
			newsInfo.setContent(content);
			newsInfo.setSeoDescribe(seoDescribe);
			newsInfo.setSeoKeywords(seoKeywords);
			getRequest().setAttribute("yimiNews",newsInfo);
	     return "/WEB-INF/yiminews/uploadimage";
	    }
}
