/**
 * 
 */
package com.lw.cms.bnusermessage.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnusermessage.entity.BnUserMessage;
import com.lw.cms.bnusermessage.service.IBnUserMessageService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnUserMessageAction")
@RequestMapping(value="/manage/bnusermessage")
public class BnUserMessageAction extends BaseAction{
	@Autowired
	private IBnUserMessageService bnUserMessageService;
	
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
		List<BnUserMessage> list=bnUserMessageService.getList();
		int total=bnUserMessageService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnusermessage/bnusermessage_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnusermessage(){
		
		return "/WEB-INF/bnusermessage/bnusermessage_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnUserMessage
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnUserMessage bnUserMessage) throws Exception{
		bnUserMessageService.save(bnUserMessage);
		return "redirect:/manage/bnusermessage.html";
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
	public String deletebnusermessage(@PathVariable("id")int id,HttpServletResponse response){
		bnUserMessageService.del(id);
		return "redirect:/manage/bnusermessage.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnUserMessage
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnusermessage(BnUserMessage bnUserMessage)throws Exception{
		bnUserMessageService.edit(bnUserMessage);
		return "redirect:/manage/bnusermessage.html";
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
	public String viewbnusermessage(@PathVariable("id")int id)
	{
		BnUserMessage bnUserMessage=bnUserMessageService.get(id);
		getRequest().setAttribute("bnUserMessage",bnUserMessage);
		return "/WEB-INF/bnusermessage/bnusermessage_detail";
	}
}
