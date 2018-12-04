/**
 * 
 */
package com.lw.cms.bnfeedback.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnfeedback.entity.BnFeedBack;
import com.lw.cms.bnfeedback.service.IBnFeedBackService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月29日 上午10:00:29
 */
@Controller("BnFeedBackAction")
@RequestMapping(value = "/manage/bnfeedback")
@SuppressWarnings("all")
public class BnFeedBackAction extends BaseAction{
	@Autowired
	private IBnFeedBackService bnFeedBackService;
	
	/**
	 * @Desc 信息列表
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping("")
	public String list(){
		instantPage(20);
		List<BnFeedBack> list=bnFeedBackService.getList();
		int total=bnFeedBackService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnfeedback/bnfeedback_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnfeedback(){
		
		return "/WEB-INF/bnfeedback/bnfeedback_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnFeedBack
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnFeedBack bnFeedBack) throws Exception{
		bnFeedBackService.save(bnFeedBack);
		return "redirect:/manage/bnfeedback.html";
	}
	
	/**
	 * 
	 * @Desc 删除信息
	 * @param id
	 * @param response
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/del/{id}")
	public String deletebnfeedback(@PathVariable("id")int id,HttpServletResponse response){
		bnFeedBackService.del(id);
		return "redirect:/manage/bnfeedback.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnFeedBack
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnfeedback(BnFeedBack bnFeedBack)throws Exception{
		bnFeedBackService.edit(bnFeedBack);
		return "redirect:/manage/bnfeedback.html";
	}
	
	/**
	 * 
	 * @Desc 编辑前根据id获取信息
	 * @param id
	 * @return
	 * @author CZP
	 * @Date 2018年10月29日 上午10:00:29
	 */
	@RequestMapping(value="/{id}")
	public String viewbnfeedback(@PathVariable("id")int id)
	{
		BnFeedBack bnFeedBack=bnFeedBackService.get(id);
		getRequest().setAttribute("bnFeedBack",bnFeedBack);
		return "/WEB-INF/bnfeedback/bnfeedback_detail";
	} 
	
	
}
