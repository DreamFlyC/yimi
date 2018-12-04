/**
 * 
 */
/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午4:04:22
 */
package com.lw.cms.bnarticledownload.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnarticledownload.entity.BnArticleDownload;
import com.lw.cms.bnarticledownload.service.IBnArticleDownloadService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

@Controller("BnArticleDownloadAction")
@RequestMapping(value = "/manage/bnarticledownload")
@SuppressWarnings("all")
public class BnArticleDownloadAction extends BaseAction{
	@Autowired
	private IBnArticleDownloadService ArticleDownloadService;
	//信息列表
		@RequestMapping("")
		public String list(){
			instantPage(20);
			List<BnArticleDownload> list=ArticleDownloadService.getList();
			int total=ArticleDownloadService.getCount();
			Pager pager=new Pager(super.getPage(),super.getRows(),total);
			pager.setDatas(list);
			getRequest().setAttribute("pager",pager);
			return  "/WEB-INF/bnarticledownload/bnarticledownload_list";
		}
		
		@RequestMapping(value="/post",method=RequestMethod.GET)
		public String addbnarticledownload(){
			
			return "/WEB-INF/bnarticledownload/bnarticledownload_add";
		}
		
		//新增信息
		@RequestMapping(value="/post",method=RequestMethod.POST)
		public String addbnarticledownload(BnArticleDownload bnArticleDownload){
			ArticleDownloadService.save(bnArticleDownload);
			return "redirect:/manage/bnarticledownload.html";
		}
		
		//删除信息
		@RequestMapping(value="/del/{id}")
		public String deletebnarticledownload(@PathVariable("id")int id,HttpServletResponse response){
			ArticleDownloadService.del(id);
			return "redirect:/manage/bnarticledownload.html";
		}
		
		//修改信息
		@RequestMapping(value="/edit",method=RequestMethod.POST)
		public String updatebnarticledownload(BnArticleDownload bnArticleDownload,HttpServletResponse response){
			ArticleDownloadService.edit(bnArticleDownload);
			return "redirect:/manage/bnarticledownload.html";
		}
		
		//编辑前根据id获取信息
		@RequestMapping(value="/{id}")
		public String viewbnarticledownload(@PathVariable("id")int id)
		{
			BnArticleDownload bnArticleDownload=ArticleDownloadService.get(id);
			getRequest().setAttribute("bnArticleDownload",bnArticleDownload);
			return "/WEB-INF/bnarticledownload/bnarticledownload_detail";
		}

}