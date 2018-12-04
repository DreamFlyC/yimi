/**
 * 
 */
package com.lw.cms.bndistribution.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bndistribution.entity.BnDistribution;
import com.lw.cms.bndistribution.service.IBnDistributionService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnDistributionAction")
@RequestMapping(value="/manage/bndistribution")
public class BnDistributionAction extends BaseAction{
	@Autowired
	private IBnDistributionService bnDistributionService;
	
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
		List<BnDistribution> list=bnDistributionService.getList();
		int total=bnDistributionService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bndistribution/bndistribution_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbndistribution(){
		
		return "/WEB-INF/bndistribution/bndistribution_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnDistribution
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnDistribution bnDistribution) throws Exception{
		bnDistributionService.save(bnDistribution);
		return "redirect:/manage/bndistribution.html";
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
	public String deletebndistribution(@PathVariable("id")int id,HttpServletResponse response){
		bnDistributionService.del(id);
		return "redirect:/manage/bndistribution.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnDistribution
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebndistribution(BnDistribution bnDistribution)throws Exception{
		bnDistributionService.edit(bnDistribution);
		return "redirect:/manage/bndistribution.html";
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
	public String viewbndistribution(@PathVariable("id")int id)
	{
		BnDistribution bnDistribution=bnDistributionService.get(id);
		getRequest().setAttribute("bnDistribution",bnDistribution);
		return "/WEB-INF/bndistribution/bndistribution_detail";
	}
}
