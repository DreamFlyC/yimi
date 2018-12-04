/**
 * 
 */
package com.lw.cms.bnlink.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnlink.entity.BnLink;
import com.lw.cms.bnlink.service.IBnLinkService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnLinkAction")
@RequestMapping(value="/manage/bnlink")
public class BnLinkAction extends BaseAction{
	@Autowired
	private IBnLinkService bnLinkService;
	
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
		List<BnLink> list=bnLinkService.getList();
		int total=bnLinkService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnlink/bnlink_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnlink(){
		
		return "/WEB-INF/bnlink/bnlink_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnLink
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnLink bnLink) throws Exception{
		bnLinkService.save(bnLink);
		return "redirect:/manage/bnlink.html";
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
	public String deletebnlink(@PathVariable("id")int id,HttpServletResponse response){
		bnLinkService.del(id);
		return "redirect:/manage/bnlink.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnLink
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnlink(BnLink bnLink)throws Exception{
		bnLinkService.edit(bnLink);
		return "redirect:/manage/bnlink.html";
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
	public String viewbnlink(@PathVariable("id")int id)
	{
		BnLink bnLink=bnLinkService.get(id);
		getRequest().setAttribute("bnLink",bnLink);
		return "/WEB-INF/bnlink/bnlink_detail";
	}
}
