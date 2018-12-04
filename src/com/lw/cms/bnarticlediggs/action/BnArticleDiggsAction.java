/**
 * 
 */
package com.lw.cms.bnarticlediggs.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnarticlediggs.entity.BnArticleDiggs;
import com.lw.cms.bnarticlediggs.service.IBnArticleDiggsService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月23日 下午3:01:48
 */
@Controller("BnArticleDiggsAction")
@RequestMapping(value = "/manage/bnarticlediggs")
@SuppressWarnings("all")
public class BnArticleDiggsAction extends BaseAction{
	@Autowired
	private IBnArticleDiggsService bnArticleDiggsService;
	
	/**
	 * 
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:25
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnArticleDiggs> list=bnArticleDiggsService.getList();
		int total=bnArticleDiggsService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnarticlediggs/bnarticlediggs_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnarticlediggs(){
		
		return "/WEB-INF/bnarticlediggs/bnarticlediggs_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnArticleDiggs
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnArticleDiggs bnArticleDiggs) throws Exception{
		bnArticleDiggsService.save(bnArticleDiggs);
		return "redirect:/manage/bnarticlediggs.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:09
	 */
	@RequestMapping(value="/del/{id}")
	public String deletebnarticlediggs(@PathVariable("id")int id,HttpServletResponse response){
		bnArticleDiggsService.del(id);
		return "redirect:/manage/bnarticlediggs.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnArticleDiggs
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnarticlediggs(BnArticleDiggs bnArticleDiggs)throws Exception{
		bnArticleDiggsService.edit(bnArticleDiggs);
		return "redirect:/manage/bnarticlediggs.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:43:43
	 */
	@RequestMapping(value="/{id}")
	public String viewbnarticlediggs(@PathVariable("id")int id)
	{
		BnArticleDiggs bnArticleDiggs=bnArticleDiggsService.get(id);
		getRequest().setAttribute("bnArticleDiggs",bnArticleDiggs);
		return "/WEB-INF/bnarticlediggs/bnarticlediggs_detail";
	}

}
