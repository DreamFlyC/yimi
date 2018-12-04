package com.lw.yiminews.action;

import com.lw.adpic.entity.Adpic;
import com.lw.adpic.service.IAdpicService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.yiminews.entity.YimiNews;
import com.lw.yiminews.service.IYimiNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.lw.cms.bnarticledownload.utils.Upload.upload;

@Controller("YimiNewsAction")
@RequestMapping(value="/yiminews")
@SuppressWarnings("all")
public class YimiNewsAction extends BaseAction{
	
	@Autowired
	private IYimiNewsService yimiNewsService;
	
	@Autowired
	private IAdpicService adpicService;

	@RequestMapping(value="")
	public String list(){
		instantPage(20);
		Map map = new HashMap<>();
		List<YimiNews> list=yimiNewsService.getList(map);
		int total=yimiNewsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/yiminews_list"; 
	}
	
	@RequestMapping(value="/company_news_brief")
	public String brieflist(){
		instantPage(5);
		Map map = new HashMap<>();
		List<YimiNews> list=yimiNewsService.getList(map);
		int total=yimiNewsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/company_news_brief"; 
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addyiminews(){
		
		return "/WEB-INF/yiminews/yiminews_add";
		
	}
	
	//新增信息
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String add(@ModelAttribute YimiNews news,@RequestParam(value="image") MultipartFile image,
			HttpServletRequest request) throws Exception{
		String img = upload(request, image);
		news.setImg(img);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		news.setCreatime(date);
		news.setContent(news.getContent().replace("\"", ""));
		news.setTitle(news.getTitle().replace("\"", ""));
		news.setSeoDescribe(news.getSeoDescribe().replace("\"", ""));
		news.setSeoKeywords(news.getSeoKeywords().replace("\"", ""));
		yimiNewsService.save(news);
		return "redirect:/WEB-INF/yiminews.html";
	}
	
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String detailyiminews(@PathVariable("id")int id)
	{
		YimiNews yimiNews=yimiNewsService.get(id);
		getRequest().setAttribute("yimiNews",yimiNews);
		return "/WEB-INF/yiminews/yiminews_detail";
	}
	
	//修改信息
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String edityiminews(HttpServletRequest request,YimiNews yimiNews,
			@RequestParam(value="image",required=false) MultipartFile image) throws Exception{
		String img=null;
		if(image!=null) {
			img=upload(request, image);
			yimiNews.setImg(img);
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		yimiNews.setUptime(date);
		yimiNewsService.edit(yimiNews);
		return "redirect:/WEB-INF/yiminews.html";
	}
	
	@RequestMapping(value="/del/{id}")
	public String delyiminews(HttpServletResponse response,@PathVariable("id") int id)
	{
		yimiNewsService.del(id);
		return "redirect:/WEB-INF/yiminews";
	}
	
	//官网首页
	@RequestMapping(value="/index")
	public String index(Model model) {
		//图片新闻展示，1代表图片新闻，2代表文字新闻
		int type=1;
		Map map=new HashMap();
		map.put("type", type);
		List<YimiNews> imgList=yimiNewsService.getList(map);
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
		public String show(@PathVariable("id")int id,Model model) {
			YimiNews obj=yimiNewsService.get(id);
			model.addAttribute("obj",obj);
			return "/WEB-INF/yiminews/show";
		}
	
	@RequestMapping(value="/showlist")
	public String showlist(Model model) {
		instantPage(4);
		Map map = new HashMap<>();
		List<YimiNews> list=yimiNewsService.getList(map);
		int total=yimiNewsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/yiminews/showlist"; 
	}
	
	@RequestMapping(value="/about")
	public String about() {
		return "/WEB-INF/yiminews/about";
	}
	
	@RequestMapping(value="/head")
	public String about1() {
		return "/WEB-INF/yiminews/head";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		return "/WEB-INF/yiminews/login";
	}
	
	
	
}
