/**
 * 
 */
package com.lw.cms.bnarticlealbums.action;

import com.lw.cms.bnarticlealbums.entity.BnArticleAlbums;
import com.lw.cms.bnarticlealbums.service.IBnArticleAlbumsService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午3:01:48
 */
@Controller("BnArticleAlbumsAction")
@RequestMapping(value = "/manage/bnarticlealbums")
@SuppressWarnings("all")
public class BnArticleAlbumsAction extends BaseAction{
	@Autowired
	private IBnArticleAlbumsService bnArticleAlbumsService;
	
	//信息列表
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnArticleAlbums> list=bnArticleAlbumsService.getList();
		int total=bnArticleAlbumsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnarticlealbums/bnarticlealbums_list";
	}
	
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnarticlealbums(){
		
		return "/WEB-INF/bnarticlealbums/bnarticlealbums_add";
	}
	
	
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnArticleAlbums bnArticleAlbums) throws Exception{
		bnArticleAlbumsService.save(bnArticleAlbums);
		return "redirect:/manage/bnarticlealbums.html";
	}
	
	//删除信息
	@RequestMapping(value="/del/{id}")
	public String deletebnarticlealbums(@PathVariable("id")int id,HttpServletResponse response){
		bnArticleAlbumsService.del(id);
		return "redirect:/manage/bnarticlealbums.html";
	}
	
	//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updatebnarticlealbums(BnArticleAlbums bnArticleAlbums)throws Exception{
			bnArticleAlbumsService.edit(bnArticleAlbums);
			return "redirect:/manage/bnarticlealbums.html";
		}
	
		
	//编辑前根据id获取信息
	@RequestMapping(value="/{id}")
	public String viewbnarticlealbums(@PathVariable("id")int id)
	{
		BnArticleAlbums bnArticleAlbums=bnArticleAlbumsService.get(id);
		getRequest().setAttribute("bnArticleAlbums",bnArticleAlbums);
		return "/WEB-INF/bnarticlealbums/bnarticlealbums_detail";
	}

}
