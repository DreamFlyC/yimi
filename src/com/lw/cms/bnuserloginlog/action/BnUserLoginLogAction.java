/**
 * 
 */
package com.lw.cms.bnuserloginlog.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnuserloginlog.entity.BnUserLoginLog;
import com.lw.cms.bnuserloginlog.service.IBnUserLoginLogService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnUserLoginLogAction")
@RequestMapping(value="/manage/bnuserloginlog")
public class BnUserLoginLogAction extends BaseAction{
	@Autowired
	private IBnUserLoginLogService bnUserLoginLogService;
	
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
		List<BnUserLoginLog> list=bnUserLoginLogService.getList();
		int total=bnUserLoginLogService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnuserloginlog/bnuserloginlog_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnuserloginlog(){
		
		return "/WEB-INF/bnuserloginlog/bnuserloginlog_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnUserLoginLog
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnUserLoginLog bnUserLoginLog) throws Exception{
		bnUserLoginLogService.save(bnUserLoginLog);
		return "redirect:/manage/bnuserloginlog.html";
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
	public String deletebnuserloginlog(@PathVariable("id")int id,HttpServletResponse response){
		bnUserLoginLogService.del(id);
		return "redirect:/manage/bnuserloginlog.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnUserLoginLog
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnuserloginlog(BnUserLoginLog bnUserLoginLog)throws Exception{
		bnUserLoginLogService.edit(bnUserLoginLog);
		return "redirect:/manage/bnuserloginlog.html";
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
	public String viewbnuserloginlog(@PathVariable("id")int id)
	{
		BnUserLoginLog bnUserLoginLog=bnUserLoginLogService.get(id);
		getRequest().setAttribute("bnUserLoginLog",bnUserLoginLog);
		return "/WEB-INF/bnuserloginlog/bnuserloginlog_detail";
	}

}
