/**
 * 
 */
package com.lw.cms.bnmanagerlog.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnmanagerlog.entity.BnManagerLog;
import com.lw.cms.bnmanagerlog.service.IBnManagerLogService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnManagerLogAction")
@RequestMapping(value="/manage/bnmanagerlog")
public class BnManagerLogAction extends BaseAction{
	@Autowired
	private IBnManagerLogService bnManagerLogService;
	
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
		List<BnManagerLog> list=bnManagerLogService.getList();
		int total=bnManagerLogService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnmanagerlog/bnmanagerlog_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnmanagerlog(){
		
		return "/WEB-INF/bnmanagerlog/bnmanagerlog_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnManagerLog
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnManagerLog bnManagerLog) throws Exception{
		bnManagerLogService.save(bnManagerLog);
		return "redirect:/manage/bnmanagerlog.html";
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
	public String deletebnmanagerlog(@PathVariable("id")int id,HttpServletResponse response){
		bnManagerLogService.del(id);
		return "redirect:/manage/bnmanagerlog.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnManagerLog
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnmanagerlog(BnManagerLog bnManagerLog)throws Exception{
		bnManagerLogService.edit(bnManagerLog);
		return "redirect:/manage/bnmanagerlog.html";
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
	public String viewbnmanagerlog(@PathVariable("id")int id)
	{
		BnManagerLog bnManagerLog=bnManagerLogService.get(id);
		getRequest().setAttribute("bnManagerLog",bnManagerLog);
		return "/WEB-INF/bnmanagerlog/bnmanagerlog_detail";
	}
}
