/**
 * 
 */
package com.lw.cms.bndownloadattach.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bndownloadattach.entity.BnDownloadAttach;
import com.lw.cms.bndownloadattach.service.IBnDownloadAttachService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnDownloadAttrachAction")
@RequestMapping(value="/manage/bndownloadattach")
public class BnDownloadAttachAction extends BaseAction{
	@Autowired
	private IBnDownloadAttachService bnDownloadAttachService;
	
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
		List<BnDownloadAttach> list=bnDownloadAttachService.getList();
		int total=bnDownloadAttachService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bndownloadattach/bndownloadattach_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbndownloadattach(){
		
		return "/WEB-INF/bndownloadattach/bndownloadattach_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnDownloadAttach
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnDownloadAttach bnDownloadAttach) throws Exception{
		bnDownloadAttachService.save(bnDownloadAttach);
		return "redirect:/manage/bndownloadattach.html";
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
	public String deletebndownloadattach(@PathVariable("id")int id,HttpServletResponse response){
		bnDownloadAttachService.del(id);
		return "redirect:/manage/bndownloadattach.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnDownloadAttach
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebndownloadattach(BnDownloadAttach bnDownloadAttach)throws Exception{
		bnDownloadAttachService.edit(bnDownloadAttach);
		return "redirect:/manage/bndownloadattach.html";
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
	public String viewbndownloadattach(@PathVariable("id")int id)
	{
		BnDownloadAttach bnDownloadAttach=bnDownloadAttachService.get(id);
		getRequest().setAttribute("bnDownloadAttach",bnDownloadAttach);
		return "/WEB-INF/bndownloadattach/bndownloadattach_detail";
	}
}
