/**
 * 
 */
package com.lw.cms.bnusercode.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.cms.bnusercode.entity.BnUserCode;
import com.lw.cms.bnusercode.service.IBnUserCodeService;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;

/**
 * @Desc 
 * @author CZP
 * @Date 2018年10月26日 上午9:41:52
 */
@Controller("BnUserCodeAction")
@RequestMapping(value="/manage/bnusercode")
public class BnUserCodeAction extends BaseAction{
	@Autowired
	private IBnUserCodeService bnUserCodeService;
	
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
		List<BnUserCode> list=bnUserCodeService.getList();
		int total=bnUserCodeService.getCount();
		Pager pager=new Pager(super.getPage(),super.getRows(),total);
		pager.setDatas(list);
		getRequest().setAttribute("pager",pager);
		return  "/WEB-INF/bnusercode/bnusercode_list";
	}
	
	/**
	 * 
	 * @Desc 跳转到新增页面
	 * @return
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:36
	 */
	@RequestMapping(value="/post",method=RequestMethod.GET)
	public String addbnusercode(){
		
		return "/WEB-INF/bnusercode/bnusercode_add";
	}
	
	/**
	 * @Desc 保存数据
	 * @param bnUserCode
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:23
	 */
	@RequestMapping(value="/post",method=RequestMethod.POST)
	public String addAdpic(@ModelAttribute BnUserCode bnUserCode) throws Exception{
		bnUserCodeService.save(bnUserCode);
		return "redirect:/manage/bnusercode.html";
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
	public String deletebnusercode(@PathVariable("id")int id,HttpServletResponse response){
		bnUserCodeService.del(id);
		return "redirect:/manage/bnusercode.html";
	}
	
	/**
	 * @Desc 修改信息
	 * @param bnUserCode
	 * @return
	 * @throws Exception
	 * @author CZP
	 * @Date 2018年10月24日 下午3:44:00
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String updatebnusercode(BnUserCode bnUserCode)throws Exception{
		bnUserCodeService.edit(bnUserCode);
		return "redirect:/manage/bnusercode.html";
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
	public String viewbnusercode(@PathVariable("id")int id)
	{
		BnUserCode bnUserCode=bnUserCodeService.get(id);
		getRequest().setAttribute("bnUserCode",bnUserCode);
		return "/WEB-INF/bnusercode/bnusercode_detail";
	}
}
